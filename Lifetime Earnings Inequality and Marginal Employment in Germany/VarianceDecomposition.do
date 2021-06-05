clear
set more off
*set memory 16g
*use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta", clear
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta", clear
ssc install fastgini

*keep if persnr<1000

keep if female==0

*** Cross Sectional Gini on Long Term Earnings

qui drop if age<24
qui drop if age>55

*Im going to try to incorporate all sources of notifications to have more hysteresis results?
*drop if inrange(source,2,4)

*now I generate monthly observations!
*
gen month_diff_epi=month_endepi-month_begepi+1 
*
expand month_diff_epi 
*
sort persnr year begepi
*I need to re-number their months
bysort persnr year counter_spell begepi: replace month_begepi=month_begepi-1+_n 
*
bysort persnr year counter_spell begepi: replace month_endepi=month_begepi 
*
*bottom
sort persnr year begepi month_begepi
bysort persnr year: gen counter_source=_n 
*
bysort persnr year: gen bottom=1 if month_begepi>1 & month_begepi!=.  & counter_source==1
bysort persnr year: gen bottom_diff=month_begepi-1+1 if bottom==1  & counter_source==1
expand bottom_diff if counter_source==1 & bottom==1, generate(extra_one)
gsort persnr year begepi month_begepi bottom -extra_one
bysort persnr year begepi month_begepi bottom: replace month_begepi=_n if bottom==1
bysort persnr year begepi month_begepi: replace month_endepi=month_begepi if bottom==1
*top
sort persnr year begepi month_begepi
drop counter_source
bysort persnr year: gen counter_source=_n
bysort persnr year: gen tot=_N
bysort persnr year: gen top=1 if counter_source==tot & month_endepi<12 & month_endepi!=.
bysort persnr year: gen top_diff=12-month_endepi+1 if top==1  & counter_source==tot
expand top_diff if counter_source==tot & top==1, generate(extra_two)
gsort persnr year begepi month_begepi top -extra_one extra_two
bysort persnr year begepi month_begepi top: replace month_begepi=month_begepi-1+_n if top==1
bysort persnr year begepi month_begepi: replace month_endepi=month_begepi if top==1
*in between
sort persnr year begepi month_begepi 
drop counter_source
bysort persnr year: gen counter_source=_n
bysort persnr year: gen diff_counter_source=1 if counter_source>1 & counter_source!=. & month_begepi>month_endepi[_n-1]+1
bysort persnr year: gen num_diff_counter_source=month_begepi-month_endepi[_n-1] if diff_counter_source==1 & counter_source>1 & counter_source!=.
expand num_diff_counter_source if diff_counter_source==1, generate(extra_three)
gsort persnr year begepi month_begepi diff_counter_source -extra_one extra_two -extra_three
bysort persnr year begepi month_begepi diff_counter_source: replace month_begepi=month_begepi-num_diff_counter+_n if diff_counter_source==1
bysort persnr year begepi month_begepi: replace month_endepi=month_begepi if diff_counter_source==1

sort persnr year month_begepi begepi counter_spell
bysort persnr year month_begepi: gen counter_month=_n

sort persnr year month_begepi begepi counter_month

gen duplic=extra_one+extra_two+extra_three
replace source=5 if duplic==1

sort persnr year month_begepi begepi counter_month

gen conc=0
bysort persnr year month_begepi source begepi: replace conc=1 if source==1 & source[_n-1]==1 & begepi<endepi[_n-1]

bysort persnr year month_begepi: egen sum_conc=sum(conc)

sort persnr year month_begepi counter_month

*** seems to work

*let's define main forms of employment by month

replace form=. if source!=1

gen year_begepix=year(begepi)
gen year_endepix=year(endepi)
gen month_begepix=month(begepi)
gen month_endepix=month(endepi)
gen day_begepix=day(begepi)
gen day_endepix=day(endepi)

gen days_full=.
gen days_part=.
gen days_mini=.
gen days_unemp=.

replace days_full=32-day_begepix if form==1 & month_endepix>month_endepi & month_endepi>=month_begepix
replace days_full=30 if form==1 & month_endepix>month_endepi & month_endepi>month_begepix
replace days_full=day_endepix-day_begepix if form==1 & month_endepix==month_endepi & month_begepix==month_endepix
replace days_full=day_endepix if form==1 & month_endepix==month_endepi & month_begepix<month_endepix

replace days_part=32-day_begepix if form==2 & month_endepix>month_endepi & month_endepi>=month_begepix
replace days_part=30 if form==2 & month_endepix>month_endepi & month_endepi>month_begepix
replace days_part=day_endepix-day_begepix if form==2 & month_endepix==month_endepi & month_begepix==month_endepix
replace days_part=day_endepix if form==2 & month_endepix==month_endepi & month_begepix<month_endepix

replace days_mini=32-day_begepix if form==3 & month_endepix>month_endepi & month_endepi>=month_begepix
replace days_mini=30 if form==3 & month_endepix>month_endepi & month_endepi>month_begepix
replace days_mini=day_endepix-day_begepix if form==3 & month_endepix==month_endepi & month_begepix==month_endepix
replace days_mini=day_endepix if form==3 & month_endepix==month_endepi & month_begepix<month_endepix

replace days_unemp=30 if inrange(source,2,5) & bottom==1 & extra_one==1
replace days_unemp=30 if inrange(source,2,5) & top==1 & extra_two==1
replace days_unemp=30 if inrange(source,2,5) & diff_counter_source==1
replace days_unemp=30 if inrange(source,2,5) & year_endepix>year_begepix
replace days_unemp=32-day_begepix if inrange(source,2,5) & month_endepix>month_endepi & month_endepi>=month_begepix
replace days_unemp=day_endepix-day_begepix+1 if inrange(source,2,5) & month_endepix==month_endepi & month_begepix==month_endepix
replace days_unemp=day_endepix if inrange(source,2,5) & month_endepix==month_endepi & month_begepix<month_endepix
replace days_unemp=32-day_begepix if inrange(source,2,5) & year_endepix>year & month_begepix==month_begepi
replace days_unemp=day_endepix if inrange(source,2,5) & year_endepix==year & month_endepix==month_endepi & year_begepix<year
replace days_unemp=30 if source==5
replace days_unemp=30 if inrange(source,2,5) & year_endepix==year & year_begepix==year & month_begepix<month_begepi & month_begepi<month_endepix 

bysort persnr year month_begepi: egen max_days_full=max(days_full)
bysort persnr year month_begepi: egen max_days_part=max(days_part)
bysort persnr year month_begepi: egen max_days_mini=max(days_mini)
bysort persnr year month_begepi: egen max_days_unemp=max(days_unemp)

bysort persnr year month_begepi: gen ind_month=_n
bysort persnr year month_begepi: egen sum_ind=sum(ind_month)
bysort persnr year month_begepi: replace counter_diff_estab_id=0 if counter_diff_estab_id==.n
bysort persnr year month_begepi: egen max_days_estab=max(counter_diff_estab_id)
bysort persnr year month_begepi: replace counter_diff_estab_id=max_days_estab
drop ind_month sum_ind

replace max_days_full=0 if max_days_full==.
replace max_days_part=0 if max_days_part==.
replace max_days_mini=0 if max_days_mini==.
replace max_days_unemp=0 if max_days_unemp==.

egen max_days_month=rowmax(max_days_full max_days_part max_days_mini)

gen full_part=1 if max_days_full!=. & max_days_full>0 & max_days_part!=. & max_days_part>0
gen full_mini=1 if max_days_full!=. & max_days_full>0 & max_days_mini!=. & max_days_mini>0
gen mini_part=1 if max_days_mini!=. & max_days_mini>0 & max_days_part!=. & max_days_part>0

gen full_month=1 if max_days_full>2*(max_days_part+max_days_mini)
gen part_month=1 if max_days_part>2*(max_days_full+max_days_mini)
gen mini_month=1 if max_days_mini>2*(max_days_part+max_days_full)
gen unemp_month=1 if max_days_unemp>max_days_month & max_days_month<15
replace full_month=. if max_days_unemp>max_days_month
replace part_month=. if max_days_unemp>max_days_month
replace mini_month=. if max_days_unemp>max_days_month

gen conc_month=1 if full_month==. & part_month==. & mini_month==. & unemp_month==. & max_days_full+max_days_part+max_days_mini!=. & max_days_full+max_days_part+max_days_mini>0 

gen null_state=1 if full_month==. & part_month==. & mini_month==. & unemp_month==. & conc_month==.

tab month_begepi
tab month_endepi
tab max_days_full
tab max_days_part
tab max_days_mini
tab max_days_unemp
tab null_state

sort persnr year month_begepi

replace def_daily_wage=0 if def_daily_wage==.

gen earn_epi_month=(days_full)*def_daily_wage if form==1
replace earn_epi_month=(days_part)*def_daily_wage if form==2
replace earn_epi_month=(days_mini)*def_daily_wage if form==3

replace earn_epi_month=(days_unemp)*def_daily_wage if source!=1 & source!=2

replace earn_epi_month=(days_unemp)*def_daily_wage if source==2

bysort persnr year month_begepi: egen tot_earn_month=sum(earn_epi_month)

bysort persnr year month_begepi: egen earnings_month_full=sum(earn_epi_month) if form==1
bysort persnr year month_begepi: egen earnings_month_part=sum(earn_epi_month) if form==2
bysort persnr year month_begepi: egen earnings_month_mini=sum(earn_epi_month) if form==3
bysort persnr year month_begepi: egen earnings_month_unemp=sum(earn_epi_month) if inrange(source,2,5)

***totals of all income sources:
bysort persnr year month_begepi: egen tot_earn_month_full=max(earnings_month_full)
bysort persnr year month_begepi: egen tot_earn_month_part=max(earnings_month_part)
bysort persnr year month_begepi: egen tot_earn_month_mini=max(earnings_month_mini)
bysort persnr year month_begepi: egen tot_earn_month_unemp=max(earnings_month_unemp)

replace tot_earn_month_full=0 if tot_earn_month_full==.
replace tot_earn_month_part=0 if tot_earn_month_part==.
replace tot_earn_month_mini=0 if tot_earn_month_mini==.
replace tot_earn_month_unemp=0 if tot_earn_month_unemp==.

order persnr begepi endepi month_begepi month_endepi year earn_epi_month tot_earn_month earnings_month_full earnings_month_part earnings_month_mini earnings_month_unemp tot_earn_month_full tot_earn_month_part tot_earn_month_mini tot_earn_month_unemp def_daily_wage days_full days_part days_mini days_unemp counter_month counter_diff_estab_id conc sum_conc source counter_spell female



*worker flows should be conditional on having a worker flow, I believe:

drop counter_month
bysort persnr year month_begepi: gen counter_month=_n
keep if counter_month==1


*bysort year: gen count_year=_n
*keep if count_year==1

saveold "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_variance_decomposition.dta", replace

*saveold "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_monthly.dta", replace


*** FEMALES:

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta", clear
ssc install fastgini

*keep if persnr<1000

keep if female==1

*** Cross Sectional Gini on Long Term Earnings

qui drop if age<24
qui drop if age>55

*Im going to try to incorporate all sources of notifications to have more hysteresis results?
*drop if inrange(source,2,4)

*now I generate monthly observations!
*
gen month_diff_epi=month_endepi-month_begepi+1 
*
expand month_diff_epi 
*
sort persnr year begepi
*I need to re-number their months
bysort persnr year counter_spell begepi: replace month_begepi=month_begepi-1+_n 
*
bysort persnr year counter_spell begepi: replace month_endepi=month_begepi 
*
*bottom
sort persnr year begepi month_begepi
bysort persnr year: gen counter_source=_n 
*
bysort persnr year: gen bottom=1 if month_begepi>1 & month_begepi!=.  & counter_source==1
bysort persnr year: gen bottom_diff=month_begepi-1+1 if bottom==1  & counter_source==1
expand bottom_diff if counter_source==1 & bottom==1, generate(extra_one)
gsort persnr year begepi month_begepi bottom -extra_one
bysort persnr year begepi month_begepi bottom: replace month_begepi=_n if bottom==1
bysort persnr year begepi month_begepi: replace month_endepi=month_begepi if bottom==1
*top
sort persnr year begepi month_begepi
drop counter_source
bysort persnr year: gen counter_source=_n
bysort persnr year: gen tot=_N
bysort persnr year: gen top=1 if counter_source==tot & month_endepi<12 & month_endepi!=.
bysort persnr year: gen top_diff=12-month_endepi+1 if top==1  & counter_source==tot
expand top_diff if counter_source==tot & top==1, generate(extra_two)
gsort persnr year begepi month_begepi top -extra_one extra_two
bysort persnr year begepi month_begepi top: replace month_begepi=month_begepi-1+_n if top==1
bysort persnr year begepi month_begepi: replace month_endepi=month_begepi if top==1
*in between
sort persnr year begepi month_begepi 
drop counter_source
bysort persnr year: gen counter_source=_n
bysort persnr year: gen diff_counter_source=1 if counter_source>1 & counter_source!=. & month_begepi>month_endepi[_n-1]+1
bysort persnr year: gen num_diff_counter_source=month_begepi-month_endepi[_n-1] if diff_counter_source==1 & counter_source>1 & counter_source!=.
expand num_diff_counter_source if diff_counter_source==1, generate(extra_three)
gsort persnr year begepi month_begepi diff_counter_source -extra_one extra_two -extra_three
bysort persnr year begepi month_begepi diff_counter_source: replace month_begepi=month_begepi-num_diff_counter+_n if diff_counter_source==1
bysort persnr year begepi month_begepi: replace month_endepi=month_begepi if diff_counter_source==1

sort persnr year month_begepi begepi counter_spell
bysort persnr year month_begepi: gen counter_month=_n

sort persnr year month_begepi begepi counter_month

gen duplic=extra_one+extra_two+extra_three
replace source=5 if duplic==1

sort persnr year month_begepi begepi counter_month

gen conc=0
bysort persnr year month_begepi source begepi: replace conc=1 if source==1 & source[_n-1]==1 & begepi<endepi[_n-1]

bysort persnr year month_begepi: egen sum_conc=sum(conc)

sort persnr year month_begepi counter_month

*** seems to work

*let's define main forms of employment by month

replace form=. if source!=1

gen year_begepix=year(begepi)
gen year_endepix=year(endepi)
gen month_begepix=month(begepi)
gen month_endepix=month(endepi)
gen day_begepix=day(begepi)
gen day_endepix=day(endepi)

gen days_full=.
gen days_part=.
gen days_mini=.
gen days_unemp=.

replace days_full=32-day_begepix if form==1 & month_endepix>month_endepi & month_endepi>=month_begepix
replace days_full=30 if form==1 & month_endepix>month_endepi & month_endepi>month_begepix
replace days_full=day_endepix-day_begepix if form==1 & month_endepix==month_endepi & month_begepix==month_endepix
replace days_full=day_endepix if form==1 & month_endepix==month_endepi & month_begepix<month_endepix

replace days_part=32-day_begepix if form==2 & month_endepix>month_endepi & month_endepi>=month_begepix
replace days_part=30 if form==2 & month_endepix>month_endepi & month_endepi>month_begepix
replace days_part=day_endepix-day_begepix if form==2 & month_endepix==month_endepi & month_begepix==month_endepix
replace days_part=day_endepix if form==2 & month_endepix==month_endepi & month_begepix<month_endepix

replace days_mini=32-day_begepix if form==3 & month_endepix>month_endepi & month_endepi>=month_begepix
replace days_mini=30 if form==3 & month_endepix>month_endepi & month_endepi>month_begepix
replace days_mini=day_endepix-day_begepix if form==3 & month_endepix==month_endepi & month_begepix==month_endepix
replace days_mini=day_endepix if form==3 & month_endepix==month_endepi & month_begepix<month_endepix

replace days_unemp=30 if inrange(source,2,5) & bottom==1 & extra_one==1
replace days_unemp=30 if inrange(source,2,5) & top==1 & extra_two==1
replace days_unemp=30 if inrange(source,2,5) & diff_counter_source==1
replace days_unemp=30 if inrange(source,2,5) & year_endepix>year_begepix
replace days_unemp=32-day_begepix if inrange(source,2,5) & month_endepix>month_endepi & month_endepi>=month_begepix
replace days_unemp=day_endepix-day_begepix+1 if inrange(source,2,5) & month_endepix==month_endepi & month_begepix==month_endepix
replace days_unemp=day_endepix if inrange(source,2,5) & month_endepix==month_endepi & month_begepix<month_endepix
replace days_unemp=32-day_begepix if inrange(source,2,5) & year_endepix>year & month_begepix==month_begepi
replace days_unemp=day_endepix if inrange(source,2,5) & year_endepix==year & month_endepix==month_endepi & year_begepix<year
replace days_unemp=30 if source==5
replace days_unemp=30 if inrange(source,2,5) & year_endepix==year & year_begepix==year & month_begepix<month_begepi & month_begepi<month_endepix 

bysort persnr year month_begepi: egen max_days_full=max(days_full)
bysort persnr year month_begepi: egen max_days_part=max(days_part)
bysort persnr year month_begepi: egen max_days_mini=max(days_mini)
bysort persnr year month_begepi: egen max_days_unemp=max(days_unemp)

bysort persnr year month_begepi: gen ind_month=_n
bysort persnr year month_begepi: egen sum_ind=sum(ind_month)
bysort persnr year month_begepi: replace counter_diff_estab_id=0 if counter_diff_estab_id==.n
bysort persnr year month_begepi: egen max_days_estab=max(counter_diff_estab_id)
bysort persnr year month_begepi: replace counter_diff_estab_id=max_days_estab
drop ind_month sum_ind

replace max_days_full=0 if max_days_full==.
replace max_days_part=0 if max_days_part==.
replace max_days_mini=0 if max_days_mini==.
replace max_days_unemp=0 if max_days_unemp==.

egen max_days_month=rowmax(max_days_full max_days_part max_days_mini)

gen full_part=1 if max_days_full!=. & max_days_full>0 & max_days_part!=. & max_days_part>0
gen full_mini=1 if max_days_full!=. & max_days_full>0 & max_days_mini!=. & max_days_mini>0
gen mini_part=1 if max_days_mini!=. & max_days_mini>0 & max_days_part!=. & max_days_part>0

gen full_month=1 if max_days_full>2*(max_days_part+max_days_mini)
gen part_month=1 if max_days_part>2*(max_days_full+max_days_mini)
gen mini_month=1 if max_days_mini>2*(max_days_part+max_days_full)
gen unemp_month=1 if max_days_unemp>max_days_month & max_days_month<15
replace full_month=. if max_days_unemp>max_days_month
replace part_month=. if max_days_unemp>max_days_month
replace mini_month=. if max_days_unemp>max_days_month

gen conc_month=1 if full_month==. & part_month==. & mini_month==. & unemp_month==. & max_days_full+max_days_part+max_days_mini!=. & max_days_full+max_days_part+max_days_mini>0 

gen null_state=1 if full_month==. & part_month==. & mini_month==. & unemp_month==. & conc_month==.

tab month_begepi
tab month_endepi
tab max_days_full
tab max_days_part
tab max_days_mini
tab max_days_unemp
tab null_state

sort persnr year month_begepi

replace def_daily_wage=0 if def_daily_wage==.

gen earn_epi_month=(days_full)*def_daily_wage if form==1
replace earn_epi_month=(days_part)*def_daily_wage if form==2
replace earn_epi_month=(days_mini)*def_daily_wage if form==3

replace earn_epi_month=(days_unemp)*def_daily_wage if source!=1 & source!=2

replace earn_epi_month=(days_unemp)*def_daily_wage if source==2

bysort persnr year month_begepi: egen tot_earn_month=sum(earn_epi_month)

bysort persnr year month_begepi: egen earnings_month_full=sum(earn_epi_month) if form==1
bysort persnr year month_begepi: egen earnings_month_part=sum(earn_epi_month) if form==2
bysort persnr year month_begepi: egen earnings_month_mini=sum(earn_epi_month) if form==3
bysort persnr year month_begepi: egen earnings_month_unemp=sum(earn_epi_month) if inrange(source,2,5)

***totals of all income sources:
bysort persnr year month_begepi: egen tot_earn_month_full=max(earnings_month_full)
bysort persnr year month_begepi: egen tot_earn_month_part=max(earnings_month_part)
bysort persnr year month_begepi: egen tot_earn_month_mini=max(earnings_month_mini)
bysort persnr year month_begepi: egen tot_earn_month_unemp=max(earnings_month_unemp)

replace tot_earn_month_full=0 if tot_earn_month_full==.
replace tot_earn_month_part=0 if tot_earn_month_part==.
replace tot_earn_month_mini=0 if tot_earn_month_mini==.
replace tot_earn_month_unemp=0 if tot_earn_month_unemp==.

order persnr begepi endepi month_begepi month_endepi year earn_epi_month tot_earn_month earnings_month_full earnings_month_part earnings_month_mini earnings_month_unemp tot_earn_month_full tot_earn_month_part tot_earn_month_mini tot_earn_month_unemp def_daily_wage days_full days_part days_mini days_unemp counter_month counter_diff_estab_id conc sum_conc source counter_spell female



*worker flows should be conditional on having a worker flow, I believe:

drop counter_month
bysort persnr year month_begepi: gen counter_month=_n
keep if counter_month==1



*bysort year: gen count_year=_n
*keep if count_year==1

saveold "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_variance_decomposition_fem.dta", replace

*saveold "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_monthly.dta", replace
