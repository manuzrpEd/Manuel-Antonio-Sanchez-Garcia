clear
**set memory 16g
cd ""
use "",clear
*use "\siab_r_7514_v1.dta", clear
*cd ""
set more off

*this is to keep the original person number in case I want to trace his past/future records:
qui gen orig_persnr=persnr

*this is to work faster:
*200000 before, now trying to get a better kurtosis?
*500000 same peak kurtosis
keep if persnr<200000

*orig spells are bigger than episodes, so I can remove them.
*not drop them as they can recover missing daily_wages??
*drop begorig endorig

*generate year variable,  only source==2 has missing years as it can take more than one year the unemployment
qui gen year_begepi=year(begepi)
qui gen year_begorig=year(begorig)
qui gen month_begepi=month(begepi)
qui gen month_begorig=month(begorig)
qui gen day_begepi=day(begepi)
qui gen day_begorig=day(begorig)
qui gen year_endepi=year(endepi)
qui gen year_endorig=year(endorig)
qui gen month_endepi=month(endepi)
qui gen month_endorig=month(endorig)
qui gen day_endepi=day(endepi)
qui gen day_endorig=day(endorig)
qui gen year = year_begepi 
*if year_begepi==year_endepi
*
sort persnr year begepi endepi
*
recode vocational_training (11=7) (12=8)
label define ausbildung_en 7 "7 University of applied sciences without further specifications", modify
label define ausbildung_en 8 "8 University without further specifications", modify
*
recode school_qualification (4=2) (5=3) (6=4) (7=5) (8=6) (9=7)
label define schule_en 2 "2 lower secondary school certificate/ grade school certificate", modify
label define schule_en 3 "3 Grade-/lower school certificate, intermediate school or equivalent qualification", modify
label define schule_en 4 "4 Intermediate school leaving certificate", modify
label define schule_en 5 "5 Completion of education at a specialised upper secondary school/completion of higher education at a specialised college", modify
label define schule_en 6 "6 Completion of education at a specialised upper secondary school/completion of higher education at a specialised college or upper secondary school leaving certificate, A-level equivalent, qualification for university; 13 years of schooling", modify
label define schule_en 7 "7 Upper secondary school leaving certificate, A-level equivalent, qualification for university; 13 years of schooling", modify
*

*generate education variable:
*default:
qui gen educ=0 if school_qualification!=.z & school_qualification!=.n
*high school dropouts
qui replace educ=1 if inrange(school_qualification,1,3)
*high school
qui replace educ=2 if inrange(school_qualification,4,7)
*college
qui replace educ=3 if inrange(vocational_training,5,8)

qui sum persnr
display r(N)
*need to adjust individuals so that they are in full labor market
*keep largest educational attainment
bysort persnr: egen max_educ=max(educ)
qui replace educ=max_educ if max_educ!=educ

*tab educ

*convert females:

bysort persnr: egen mode_female=mode(female), minmode
qui replace female=mode_female
*got 0 changes, which dont fit the final sample... will need to check.

*convert german:

bysort persnr: egen mode_german=mode(german), minmode
qui replace german=mode_german

*** drop undesired observations:

*trainees
*qui drop if employment_status==2
*Employees in partial retirement
qui drop if inrange(employment_status,4,6)
*qui drop if employment_status==4
*Interns and student trainees
*qui drop if employment_status==5
*other employment status 
*qui drop if employment_status==6

*not sure what to do in these cases
qui drop if source==2 & daily_wage==.
*qui replace daily_wage=0 if source==2 & daily_wage==.

*** regions:

***add regions which will be needed for top coded observations
*https://en.wikipedia.org/wiki/NUTS_statistical_regions_of_Germany
*https://en.wikipedia.org/wiki/States_of_Germany
*regions

qui gen schleswig_holstein=1 if region>=1000 & region<2000
qui replace schleswig_holstein=0 if schleswig_holstein==.

qui gen hamburg=1 if region>=2000 & region<3000
qui replace hamburg=0 if hamburg==.

qui gen niedersachsen=1 if region>=3000 & region<4000
qui replace niedersachsen=0 if niedersachsen==.

qui gen bremen=1 if region>=4000 & region<5000
qui replace bremen=0 if bremen==.

qui gen nordrhein_westfalen=1 if region>=5000 & region<6000
qui replace nordrhein_westfalen=0 if nordrhein_westfalen==.

qui gen hessen=1 if region>=6000 & region<7000
qui replace hessen=0 if hessen==.

qui gen rheinland_pfalz=1 if region>=7000 & region<8000
qui replace rheinland_pfalz=0 if rheinland_pfalz==.

qui gen badden_wurttemberg=1 if region>=8000 & region<9000
qui replace badden_wurttemberg=0 if badden_wurttemberg==.

qui gen bavaria=1 if region>=9000 & region<10000
qui replace bavaria=0 if bavaria==.

qui gen saarland=1 if region>=10000 & region<11000
qui replace saarland=0 if saarland==.

qui gen berlin=1 if region>=11000 & region <12000
qui replace berlin=0 if berlin==.

qui gen brandenburg=1 if region>=12000 & region <13000
qui replace brandenburg=0 if brandenburg==.

qui gen mecklenburg_vorpommern=1 if region>=13000 & region <14000
qui replace mecklenburg_vorpommern=0 if mecklenburg_vorpommern==.

qui gen sachsen=1 if region>=14000 & region <15000
qui replace sachsen=0 if sachsen==.

qui gen sachsen_anhalt=1 if region>=15000 & region <16000
qui replace sachsen_anhalt=0 if sachsen_anhalt==.

qui gen thuringen=1 if region>=16000 & region <17000
qui replace thuringen=0 if thuringen==.

qui gen west=1 if region>=1000 & region<11000
qui replace west=0 if region>=11000 & region<17000

save "\Preliminars_east.dta", replace

bysort persnr: egen sum_west=sum(west)
qui drop if sum_west==0

*east germany drop
qui drop if west==0 & source==1

sort persnr begepi endepi
*

***split unemployment periods (as they may be above 1 year), source=2

qui gen years_unemp=year_endepi-year_begepi if source==2
bysort persnr year source: gen counter_per_unemp=_n if source==2
expand years_unemp+1 if source==2 & years_unemp>0 & years_unemp<5, generate(counter_expand)

*tab years_unemp
*correct, up to 5 years, but 4th and 5th small density

*drop counter_per_unemp
*bysort persnr year source: gen counter_per_unemp=_n if source==2

bysort persnr year counter_per_unemp counter_expand: gen count_expand=sum(counter_expand)
drop counter_expand
rename count_expand counter_expand
*tab counter_expand

*I need to adjust day-month-year begepi-endepi for this expanded observations
*also for age

qui replace year=year_begepi+1 if source==2 & years_unemp>0 & years_unemp<5 & counter_expand>0

qui gen age=year-year_birth+1
*
qui replace day_begepi=1 if source==2 & years_unemp>=1 & years_unemp<5 & counter_expand==1
qui replace month_begepi=1 if source==2 & years_unemp>=1 & years_unemp<5 & counter_expand==1
qui replace day_endepi=30 if source==2 & years_unemp>=1 & years_unemp<5 & counter_expand==0
qui replace month_endepi=12 if source==2 & years_unemp>=1 & years_unemp<5 & counter_expand==0
*replace day_endepi=day_endepi if source==2 & years_unemp==1 & counter_expand==1
*replace month_endepi=month_endepi if source==2 & years_unemp==1 & counter_expand==1

qui replace day_begepi=1 if source==2 & years_unemp>=2 & years_unemp<5 & counter_expand==2
qui replace month_begepi=1 if source==2 & years_unemp>=2 & years_unemp<5 & counter_expand==2
qui replace day_endepi=30 if source==2 & years_unemp>2 & years_unemp<5 & counter_expand==1
qui replace month_endepi=12 if source==2 & years_unemp>2 & years_unemp<5 & counter_expand==1
*replace day_endepi=day_endepi if source==2 & years_unemp==2 & counter_expand==2
*replace month_endepi=month_endepi if source==2 & years_unemp==2 & counter_expand==2

qui replace day_begepi=1 if source==2 & years_unemp>=3 & years_unemp<5 & counter_expand==3
qui replace month_begepi=1 if source==2 & years_unemp>=3 & years_unemp<5 & counter_expand==3
qui replace day_endepi=30 if source==2 & years_unemp>3 & years_unemp<5 & counter_expand==2
qui replace month_endepi=12 if source==2 & years_unemp>3 & years_unemp<5 & counter_expand==2
*replace day_endepi=day_endepi if source==2 & years_unemp==3 & counter_expand==3
*replace month_endepi=month_endepi if source==2 & years_unemp==3 & counter_expand==3

qui replace day_begepi=1 if source==2 & years_unemp==4 & counter_expand==4
qui replace month_begepi=1 if source==2 & years_unemp==4 & counter_expand==4
*replace day_endepi=day_endepi if source==2 & years_unemp==4 & counter_expand==4
*replace month_endepi=month_endepi if source==2 & years_unemp==4 & counter_expand==4

*
*
sort persnr year begepi endepi
drop counter_spell
bysort persnr: gen counter_spell=_n
*

drop years_unemp counter_per_unemp counter_expand

***split unemployment periods (as they may be above 1 year), source=3

qui gen years_unemp=year_endepi-year_begepi if source==3
bysort persnr year source: gen counter_per_unemp=_n if source==3
expand years_unemp+1 if source==3 & years_unemp>0 & years_unemp<8, generate(counter_expand)

*tab years_unemp
*correct, up to 5 years, but 4th and 5th small density

*drop counter_per_unemp
*bysort persnr year source: gen counter_per_unemp=_n if source==3

bysort persnr year counter_per_unemp counter_expand: gen count_expand=sum(counter_expand)
drop counter_expand
rename count_expand counter_expand
*tab counter_expand

*I need to adjust day-month-year begepi-endepi for this expanded observations
*also for age

qui replace year=year[_n-1]+1 if source==3 & years_unemp>0 & years_unemp<8 & counter_expand>0

qui replace age=year-year_birth+1 if source==3
/*
replace day_begepi=1 if source==3 & years_unemp>=1 & years_unemp<6 & counter_expand==1
replace month_begepi=1 if source==3 & years_unemp>=1 & years_unemp<6 & counter_expand==1
replace day_endepi=12 if source==3 & years_unemp>1 & years_unemp<6 & counter_expand==1
replace month_endepi=12 if source==3 & years_unemp>1 & years_unemp<6 & counter_expand==1
replace day_endepi=day_endepi if source==3 & years_unemp==1 & counter_expand==1
replace month_endepi=month_endepi if source==3 & years_unemp==1 & counter_expand==1

replace day_begepi=1 if source==3 & years_unemp>=2 & years_unemp<6 & counter_expand==2
replace month_begepi=1 if source==3 & years_unemp>=2 & years_unemp<6 & counter_expand==2
replace day_endepi=12 if source==3 & years_unemp>2 & years_unemp<6 & counter_expand==2
replace month_endepi=12 if source==3 & years_unemp>2 & years_unemp<6 & counter_expand==2
replace day_endepi=day_endepi if source==3 & years_unemp==2  & counter_expand==2
replace month_endepi=month_endepi if source==3 & years_unemp==2 & counter_expand==2

replace day_begepi=1 if source==3 & years_unemp>=3 & years_unemp<6 & counter_expand==3
replace month_begepi=1 if source==3 & years_unemp>=3 & years_unemp<6 & counter_expand==3
replace day_endepi=12 if source==3 & years_unemp>3 & years_unemp<6 & counter_expand==3
replace month_endepi=12 if source==3 & years_unemp>3 & years_unemp<6 & counter_expand==3
replace day_endepi=day_endepi if source==3 & years_unemp==3 & counter_expand==3
replace month_endepi=month_endepi if source==3 & years_unemp==3 & counter_expand==3

replace day_begepi=1 if source==3 & years_unemp>=4 & years_unemp<6 & counter_expand==4
replace month_begepi=1 if source==3 & years_unemp>=4 & years_unemp<6 & counter_expand==4
replace day_endepi=12 if source==3 & years_unemp>4 & years_unemp<6 & counter_expand==4
replace month_endepi=12 if source==3 & years_unemp>4 & years_unemp<6 & counter_expand==4
replace day_endepi=day_endepi if source==3 & years_unemp==4 & counter_expand==4
replace month_endepi=month_endepi if source==3 & years_unemp==4 & counter_expand==4

replace day_begepi=1 if source==3 & years_unemp>=5 & years_unemp<6 & counter_expand==5
replace month_begepi=1 if source==3 & years_unemp>=5 & years_unemp<6 & counter_expand==5
replace day_endepi=12 if source==3 & years_unemp>5 & years_unemp<6 & counter_expand==5
replace month_endepi=12 if source==3 & years_unemp>5 & years_unemp<6 & counter_expand==5
replace day_endepi=day_endepi if source==3 & years_unemp==5 & counter_expand==5
replace month_endepi=month_endepi if source==3 & years_unemp==5 & counter_expand==5
*/
*
sort persnr year begepi endepi
drop counter_spell
bysort persnr: gen counter_spell=_n
*

drop years_unemp counter_per_unemp counter_expand

***split unemployment periods (as they may be above 1 year), source=4

qui gen years_unemp=year_endepi-year_begepi if source==4
bysort persnr year source: gen counter_per_unemp=_n if source==4
expand years_unemp+1 if source==4 & years_unemp>0 & years_unemp<8, generate(counter_expand)

*tab years_unemp
*correct, up to 5 years, but 4th and 5th small density

*drop counter_per_unemp
*bysort persnr year source: gen counter_per_unemp=_n if source==4

bysort persnr year counter_per_unemp counter_expand: gen count_expand=sum(counter_expand)
drop counter_expand
rename count_expand counter_expand
*tab counter_expand

*I need to adjust day-month-year begepi-endepi for this expanded observations
*also for age

replace year=year[_n-1]+1 if source==4 & years_unemp>0 & years_unemp<8 & counter_expand>0

qui replace age=year-year_birth+1 if source==4
/*
replace month_begepi=1 if source==4 & years_unemp>=1 & years_unemp<6 & counter_expand==1
replace month_endepi=12 if source==4 & years_unemp>1 & years_unemp<6 & counter_expand==1
replace month_endepi=month_endepi if source==4 & years_unemp==1 & counter_expand==1

replace month_begepi=1 if source==4 & years_unemp>=2 & years_unemp<6 & counter_expand==2
replace month_endepi=12 if source==4 & years_unemp>2 & years_unemp<6 & counter_expand==2
replace month_endepi=month_endepi if source==4 & years_unemp==2 & counter_expand==2

replace month_begepi=1 if source==4 & years_unemp>=3 & years_unemp<6 & counter_expand==3
replace month_endepi=12 if source==4 & years_unemp>3 & years_unemp<6 & counter_expand==3
replace month_endepi=month_endepi if source==4 & years_unemp==3 & counter_expand==3

replace month_begepi=1 if source==4 & years_unemp>=4 & years_unemp<6 & counter_expand==4
replace month_endepi=12 if source==4 & years_unemp>4 & years_unemp<6 & counter_expand==4
replace month_endepi=month_endepi if source==4 & years_unemp==4 & counter_expand==4

replace month_begepi=1 if source==4 & years_unemp>=5 & years_unemp<6 & counter_expand==5
replace month_endepi=12 if source==4 & years_unemp>5 & years_unemp<6 & counter_expand==5
replace month_endepi=month_endepi if source==4 & years_unemp==5 & counter_expand==5
*/
*
sort persnr year begepi endepi source
drop counter_spell
bysort persnr: gen counter_spell=_n
*

drop years_unemp counter_per_unemp

*daily_wages from aggregate spells extrapolation (Stockton):
*
bysort persnr source year_begorig month_begorig day_begorig begorig endorig: gen counter_begorig=_n if source==1
by persnr source year_begorig month_begorig day_begorig begorig endorig: egen max_counter_begorig=max(counter_begorig) if source==1
*tab counter_begorig,m
*none by default from the data set
*by persnr source year_begorig month_begorig day_begorig begorig endorig: replace daily_wage=daily_wage[_n+1] if source==1 & daily_wage==. & daily_wage[_n+1]!=. & max_counter_begorig!=counter_begorig & counter_begorig!=.
by persnr source year_begorig month_begorig day_begorig begorig endorig: replace daily_wage=daily_wage[_n+1] if source==1 & daily_wage==0 & daily_wage[_n+1]!=0 & max_counter_begorig!=counter_begorig & counter_begorig!=.

*delete double entries (lower wage) before Aggregation by year
sort persnr year begepi source daily_wage
qui gen index = 0
by persnr: replace index=1 if begepi==begepi[_n-1] & endepi==endepi[_n-1] & counter_diff_estab_id==counter_diff_estab_id[_n-1] & source==1
qui replace index = index[_n+1]
qui drop if index==1
drop index

*tabstat part_time, by(year) statistics(mean max min n) missing

qui gen form=0 if source==1 & part_time==.z
qui replace form=1 if part_time==0 & source==1 & part_time!=.z
qui replace form=2 if part_time==1 & employment_status!=3 & source==1 & part_time!=.z
qui replace form=3 if employment_status==3 & source==1 & part_time!=.z
*full time
*replace form=1 if part_time==0 & employment_status!=3 & midi_jobs!=2 & midi_jobs!=1 & source==1
*replace form=1 if part_time==.z & employment_status!=3 & midi_jobs!=2 & midi_jobs!=1 & source==1

*replace form=1 if employment_status!=3 & source==1 & part_time==.z
*marginal employment

*replace form=3 if midi_jobs==1 & source==1
*replace form=3 if midi_jobs==2 & source==1
*exclusive part time
*replace form=2 if part_time==1 & employment_status!=3 & midi_jobs!=2 & midi_jobs!=1 & source==1
*replace form=2 if inrange(midi_jobs,1,2) & source==1

*replace form=2 if inrange(midi_jobs,1,2) & source==1 & part_time==.z

tab form
tabstat form if inrange(form,0,1), by(year) stats(mean min max n)
qui replace form=1 if form==0
tab form
*the above shows that form==0 is below 1% of cases. So I am going to impute them into form==1 (arbitrary)
*tabstat form, by(year) statistics(mean max min n)
qui gen ind_margin=1 if form==3 & source==1
qui replace ind_margin=0 if form!=3 & source==1
*tabstat ind_margin, by(year) statistics(mean max min n)

*observations with daily_wage==0 are interruptions per se:
qui drop if daily_wage==0 & inrange(source,1,2)

*there aren't by default from the data set
*drop if daily_wage==. & source==1


qui gen days_epi=day_endepi+30*(month_endepi-1)-day_begepi-30*(month_begepi-1)+1 if inrange(source,1,2)
qui gen days_orig=day_endorig+30*(month_endorig-1)-day_begorig-30*(month_begorig-1)+1 if inrange(source,1,2)
bysort persnr year: egen days_year=sum(days_epi) if source==1
*the above definition doesn't take into account that days_year can be in one part of the year and not throughout
drop if days_year<90


***im going to rectify that some contracts are broken by administration (changes in payroll, health plan), but contract is continueing to happen:
*this days_epi_rect count only for statistics, not for log earnings yet, although I may have to do it eventually.

*Stockton:
*drop if days_epi<60 & days_orig<60
*because there is concentration:
drop if days_epi<3

*
sort persnr year begepi endepi source
drop counter_spell
bysort persnr: gen counter_spell=_n

*****

*** top coded extrapolation

*first we start with the WEST

*upper daily wage top coded, now we extrapolate here:

* http://fdz.iab.de/en/FDZ_Overview_of_Data/working_tools.aspx

forval i = 1/2 {

if form==`i' {

qui gen tc=0 if year==1975 & source==1 & west==1
qui replace tc=1 if daily_wage>=47 & year==1975 & source==1 & west==1
local T=47
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1975 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1976 & source==1 & west==1

qui replace tc=1 if daily_wage>=51 & year==1976 & source==1 & west==1
local T=51
qui sum tc
local F2=r(mean)
_pctile daily_wage if daily_wage!=0 & year==1976 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1977 & source==1 & west==1

qui replace tc=1 if daily_wage>=57 & year==1977 & source==1 & west==1
local T=57
qui sum tc
local F2=r(mean)
_pctile daily_wage if daily_wage!=0 & year==1977 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1978 & source==1 & west==1

qui replace tc=1 if daily_wage>=62 & year==1978 & source==1 & west==1
local T=62
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1978 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1979 & source==1 & west==1

qui replace tc=1 if daily_wage>=67 & year==1979 & source==1 & west==1
local T=67
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1979 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1980 & source==1 & west==1

qui replace tc=1 if daily_wage>=70 & year==1980 & source==1 & west==1
local T=70
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1980 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1981 & source==1 & west==1

replace tc=1 if daily_wage>=73 & year==1981 & source==1 & west==1
local T=73
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1981 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1982 & source==1 & west==1

replace tc=1 if daily_wage>=79 & year==1982 & source==1 & west==1
local T=79
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1982 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1983 & source==1 & west==1

replace tc=1 if daily_wage>=84 & year==1983 & source==1 & west==1
local T=84
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1983 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1984 & source==1 & west==1

qui replace tc=1 if daily_wage>=87 & year==1984 & source==1 & west==1
local T=87
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1984 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1985 & source==1 & west==1

qui replace tc=1 if daily_wage>=90 & year==1985 & source==1 & west==1
local T=90
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1985 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1986 & source==1 & west==1

replace tc=1 if daily_wage>=94 & year==1986 & source==1 & west==1
local T=94
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1986 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1987 & source==1 & west==1

qui replace tc=1 if daily_wage>=95 & year==1987 & source==1 & west==1
local T=95
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1987 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1988 & source==1 & west==1

replace tc=1 if daily_wage>=100 & year==1988 & source==1 & west==1
local T=100
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1988 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1989 & source==1 & west==1

replace tc=1 if daily_wage>=102 & year==1989 & source==1 & west==1
local T=102
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1989 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1990 & source==1 & west==1

replace tc=1 if daily_wage>=105 & year==1990 & source==1 & west==1
local T=105
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1990 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1991 & source==1 & west==1

replace tc=1 if daily_wage>=108 & year==1991 & source==1 & west==1
local T=108
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1991 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1992 & source==1 & west==1

replace tc=1 if daily_wage>=113 & year==1992 & source==1 & west==1
local T=113
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1992 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1993 & source==1 & west==1

qui replace tc=1 if daily_wage>=120 & year==1993 & source==1 & west==1
local T=120
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1993 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1994 & source==1 & west==1

qui replace tc=1 if daily_wage>=127 & year==1994 & source==1 & west==1
local T=127
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1994 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1995 & source==1 & west==1

qui replace tc=1 if daily_wage>=130 & year==1995 & source==1 & west==1
local T=130
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1995 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1996 & source==1 & west==1

qui replace tc=1 if daily_wage>=133 & year==1996 & source==1 & west==1
local T=133
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1996 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1997 & source==1 & west==1

qui replace tc=1 if daily_wage>=137 & year==1997 & source==1 & west==1
local T=137
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1997 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1998 & source==1 & west==1

qui replace tc=1 if daily_wage>=140 & year==1998 & source==1 & west==1
local T=140
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1998 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==1999 & source==1 & west==1

qui replace tc=1 if daily_wage>=141 & year==1999 & source==1 & west==1
local T=141
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1999 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2000 & source==1 & west==1

qui replace tc=1 if daily_wage>=143 & year==2000 & source==1 & west==1
local T=143
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2000 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2001 & source==1 & west==1

qui replace tc=1 if daily_wage>=145 & year==2001 & source==1 & west==1
local T=145
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2001 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2002 & source==1 & west==1

qui replace tc=1 if daily_wage>=146 & year==2002 & source==1 & west==1
local T=146
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2002 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2003 & source==1 & west==1

qui replace tc=1 if daily_wage>=166 & year==2003 & source==1 & west==1
local T=166
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2003 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2004 & source==1 & west==1

qui replace tc=1 if daily_wage>=168 & year==2004 & source==1 & west==1
local T=168
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2004 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2005 & source==1 & west==1

replace tc=1 if daily_wage>=170 & year==2005 & source==1 & west==1
local T=170
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2005 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2006 & source==1 & west==1

qui replace tc=1 if daily_wage>=171 & year==2006 & source==1 & west==1
local T=171
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2006 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2007 & source==1 & west==1

qui replace tc=1 if daily_wage>=171 & year==2007 & source==1 & west==1
local T=171
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2007 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2008 & source==1 & west==1

qui replace tc=1 if daily_wage>=171 & year==2008 & source==1 & west==1
local T=171
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2008 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2009 & source==1 & west==1

qui replace tc=1 if daily_wage>=176 & year==2009 & source==1 & west==1
local T=176
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2009 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2010 & source==1 & west==1

replace tc=1 if daily_wage>=179 & year==2010 & source==1 & west==1
local T=179
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2010 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2011 & source==1 & west==1

replace tc=1 if daily_wage>=179 & year==2011 & source==1 & west==1
local T=179
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2011 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2012 & source==1 & west==1

qui replace tc=1 if daily_wage>=183 & year==2012 & source==1 & west==1
local T=183
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2012 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2013 & source==1 & west==1

qui replace tc=1 if daily_wage>=190 & year==2013 & source==1 & west==1
local T=190
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2013 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
qui gen tc=0 if year==2014 & source==1 & west==1

qui replace tc=1 if daily_wage>=195 & year==2014 & source==1 & west==1
local T=195
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2014 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

qui replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1


}

}

***marginal employment thresholds:
qui gen monthly_marginal_earnings=daily_wage*30 if form==3
qui drop if monthly_marginal_earnings>322.11 & inrange(year,1999,2001) & form==3
qui drop if monthly_marginal_earnings>325 & year==2002 & form==3
qui drop if monthly_marginal_earnings>325 & year==2002 & year_begepi<4 & form==3
qui drop if monthly_marginal_earnings>400 & year==2002 & year_begepi>=4 & form==3
qui drop if monthly_marginal_earnings>400 & inrange(year,2003,2012) & form==3
qui drop if monthly_marginal_earnings>450 & inrange(year,2013,2014) & form==3

*inflation adjustment
*source: https://data.oecd.org/price/inflation-cpi.htm
*2010 euros
qui gen cpi=100
qui replace cpi=42.8 if year==1975
qui replace cpi=44.6 if year==1976
qui replace cpi=46.3 if year==1977
qui replace cpi=47.6 if year==1978
qui replace cpi=49.5 if year==1979
qui replace cpi=52.2 if year==1980
qui replace cpi=55.5 if year==1981
qui replace cpi=58.4 if year==1982
qui replace cpi=60.3 if year==1983
qui replace cpi=61.8 if year==1984
qui replace cpi=63 if year==1985
qui replace cpi=63 if year==1986
qui replace cpi=63.1 if year==1987
qui replace cpi=63.9 if year==1988
qui replace cpi=65.7 if year==1989
qui replace cpi=67.5 if year==1990
qui replace cpi=70.2 if year==1991
qui replace cpi=73.8 if year==1992
qui replace cpi=77.1 if year==1993
qui replace cpi=79.1 if year==1994
qui replace cpi=80.5 if year==1995
qui replace cpi=81.6 if year==1996
qui replace cpi=83.2 if year==1997
qui replace cpi=84 if year==1998
qui replace cpi=84.5 if year==1999
qui replace cpi=85.7 if year==2000
qui replace cpi=87.4 if year==2001
qui replace cpi=88.6 if year==2002
qui replace cpi=89.6 if year==2003
qui replace cpi=91 if year==2004
qui replace cpi=92.5 if year==2005
qui replace cpi=93.9 if year==2006
qui replace cpi=96.1 if year==2007
qui replace cpi=98.6 if year==2008
qui replace cpi=98.9 if year==2009
*
qui replace cpi=102.1 if year==2011
qui replace cpi=104.1 if year==2012
qui replace cpi=105.7 if year==2013
qui replace cpi=106.6 if year==2014

qui gen def_daily_wage=daily_wage*100/cpi

*bias from bad spelling notifications, Dustmann, Stockton
qui drop if def_daily_wage<5 & source==1
*break after 1999
qui drop if def_daily_wage<14 & source==1 & form==2

* assume >3 years is out of labor force
* assume between<=3 years is unemployed
* keep longest consecutive spell (employed + unemployed <=3 periods)

egen persnr2=group(persnr)
drop persnr
rename persnr2 persnr

*breaks elimination, keep longest consecutive spell 1
qui drop counter_spell
sort persnr age begepi
by persnr: gen counter_spell=_n
by persnr: gen corner=0
by persnr: replace corner=1 if counter_spell==1 
by persnr: replace corner=1 if counter_spell==_N
by persnr: gen year_distance_one=0
by persnr: replace year_distance_one=year[_n+1]-year if corner==0
by persnr: replace year_distance_one=year[_n+1]-year if counter_spell==1
by persnr: gen ind_break=0
by persnr: replace ind_break=1 if year_distance_one>=2 & year_distance_one!=.

*index between <=3 years unemployment:
expand year_distance_one if year_distance_one<=3 & year_distance_one>1
sort persnr year begepi ind_break
by persnr year begepi ind_break: gen counter_year_jump=_n if ind_break==1 & year_distance_one<=3
*<=4 Hofmann

*update years, age, days_epi daily wage here:
replace source=5 if counter_year_jump!=. & counter_year_jump>1
*source==5 for unemployed without subsidies (assumption)

qui replace form=. if source==5

qui replace year=year+counter_year_jump-1 if source==5
qui replace age=age+counter_year_jump-1 if source==5

*gen days_epi=0
qui replace days_epi=90 if source==5
qui replace daily_wage=5 if source==5

qui replace days_year=. if source==5

*re do ind_break now for periods of imputed unemployment
qui drop counter_spell
sort persnr age begepi
by persnr: gen counter_spell=_n
drop corner year_distance_one ind_break counter_year_jump
*
by persnr: gen corner=0
by persnr: replace corner=1 if counter_spell==1 
by persnr: replace corner=1 if counter_spell==_N
by persnr: gen year_distance_one=0
by persnr: replace year_distance_one=age-age[_n-1] if corner==0
by persnr: replace year_distance_one=age-age[_n-1] if counter_spell==_N
by persnr: gen ind_break=0
by persnr: replace ind_break=1 if year_distance_one>=2 & year_distance_one!=.
*generate consecutive spells indicator
by persnr: gen sum_breaks=sum(ind_break)

*

*keep the longest consecutive spell
egen persnr2 = group(persnr sum_breaks)
qui gen index =1
sort persnr2 age begepi
by persnr2: egen index2 = sum(index) 
sort persnr age begepi
by persnr: egen index3 = max(index2) 
qui drop if index3 != index2
drop index index2 index3 persnr2
*
*drop possible repeated spells within individual
sort persnr age begepi
by persnr: gen count_max=_n
by persnr: gen max_stat=0 if count_max==1
by persnr: replace max_stat=1 if sum_breaks!=sum_breaks[_n-1] & count_max>1
by persnr: gen sum_max_stat=sum(max_stat)
qui drop if sum_max_stat!=0
qui drop count_max sum_max_stat max_stat corner year_distance_one ind_break sum_breaks
*drop if spell lasts less than 7 years
*sort persnr age begepi
*by persnr: gen max_years_spell = _N
*qui drop if max_years_spell <7
*qui drop max_years_spell

*keep if max years > some threshold

sort persnr age begepi
by persnr: egen max_year=max(year)
by persnr: egen min_year=min(year)
qui gen num_year=max_year-min_year
*drop if num_year<5

sort persnr year begepi endepi source
drop counter_spell
by persnr: gen counter_spell=_n

egen persnr2=group(persnr)
drop persnr
rename persnr2 persnr

qui gen earnings_epi=days_epi*def_daily_wage
bysort persnr year: egen earnings_year=sum(earnings_epi)
bysort persnr year: egen earnings_year_work=sum(earnings_epi) if source==1
bysort persnr year form: egen earnings_year_form=sum(earnings_epi) if source==1
bysort persnr year form: egen earnings_year_full=sum(earnings_epi) if form==1
bysort persnr year form: egen earnings_year_part=sum(earnings_epi) if form==2
bysort persnr year form: egen earnings_year_mini=sum(earnings_epi) if form==3
*inrange(1,3)

qui gen earnings_epi_cond=days_epi*def_daily_wage if inrange(form,1,2)
bysort persnr year: egen earnings_year_cond=sum(earnings_epi_cond) if inrange(form,1,2)

qui gen log_earnings_year=log(earnings_year) if inrange(form,1,3)
qui gen log_earnings_year_cond=log(earnings_year_cond)
qui gen log_earnings_year_form=log(earnings_year_form)
qui gen log_earnings_year_work=log(earnings_year_work)
qui gen log_earnings_year_mini=log(earnings_year_mini)
qui gen log_earnings_year_part=log(earnings_year_part)
qui gen log_earnings_year_full=log(earnings_year_full)

*

bysort persnr: gen counter_pers_spell=_n
bysort persnr: gen ind_ch=1 if female!=female[_n-1] & counter_pers_spell!=1
*tab ind_ch,m

*drop id

sort persnr year begepi endepi source form

order persnr female counter_spell begepi endepi year age days_epi days_year source reason_notif part_time employment_status midi_jobs counter_diff_estab_id daily_wage west requirement german year_birth school_qualification occupation
sum persnr

saveold "\Preliminars.dta", replace

*do Preliminars_east.do
do moments_cross_section.do
*
