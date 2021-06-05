*CS:

clear
set more off
*
use "\Preliminars_monthly.dta", replace
cd ""

*keep if female==0

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4


gen jan=.
gen feb=.
gen mar=.
gen apr=.
gen may=.
gen jun=.
gen jul=.
gen aug=.
gen sep=.
gen oct=.
gen nov=.
gen dec=.

replace jan=1 if month==1
replace dec=1 if month==12

replace feb=1 if month==2
replace feb=1 if month==2
replace feb=1 if month<2 & month>2 & month!=. & month!=.

replace mar=1 if month==3
replace mar=1 if month==3
replace mar=1 if month<3 & month>3 & month!=. & month!=.

replace apr=1 if month==4
replace apr=1 if month==4
replace apr=1 if month<4 & month>4 & month!=. & month!=.

replace may=1 if month==5
replace may=1 if month==5
replace may=1 if month<5 & month>5 & month!=. & month!=.

replace jun=1 if month==6
replace jun=1 if month==6
replace jun=1 if month<6 & month>6 & month!=. & month!=.

replace jul=1 if month==7
replace jul=1 if month==7
replace jul=1 if month<7 & month>7 & month!=. & month!=.

replace aug=1 if month==8
replace aug=1 if month==8
replace aug=1 if month<8 & month>8 & month!=. & month!=.

replace sep=1 if month==9
replace sep=1 if month==9
replace sep=1 if month<9 & month>9 & month!=. & month!=.

replace oct=1 if month==10
replace oct=1 if month==10
replace oct=1 if month<10 & month>10 & month!=. & month!=.

replace nov=1 if month==11
replace nov=1 if month==11
replace nov=1 if month<11 & month>11 & month!=. & month!=.

bysort persnr year: egen tot_jan=total(jan)
bysort persnr year: egen tot_feb=total(feb)
bysort persnr year: egen tot_mar=total(mar)
bysort persnr year: egen tot_apr=total(apr)
bysort persnr year: egen tot_may=total(may)
bysort persnr year: egen tot_jun=total(jun)
bysort persnr year: egen tot_jul=total(jul)
bysort persnr year: egen tot_aug=total(aug)
bysort persnr year: egen tot_oct=total(oct)
bysort persnr year: egen tot_sep=total(sep)
bysort persnr year: egen tot_nov=total(nov)
bysort persnr year: egen tot_dec=total(dec)


bysort persnr year: gen first=_n
keep if first==1

bysort persnr year: gen tot_jan_ind=1 if tot_jan>0 & tot_jan!=.
bysort persnr year: gen tot_feb_ind=1 if tot_feb>0 & tot_feb!=.
bysort persnr year: gen tot_mar_ind=1 if tot_mar>0 & tot_mar!=.
bysort persnr year: gen tot_apr_ind=1 if tot_apr>0 & tot_apr!=.
bysort persnr year: gen tot_may_ind=1 if tot_may>0 & tot_may!=.
bysort persnr year: gen tot_jun_ind=1 if tot_jun>0 & tot_jun!=.
bysort persnr year: gen tot_jul_ind=1 if tot_jul>0 & tot_jul!=.
bysort persnr year: gen tot_aug_ind=1 if tot_aug>0 & tot_aug!=.
bysort persnr year: gen tot_oct_ind=1 if tot_sep>0 & tot_sep!=.
bysort persnr year: gen tot_sep_ind=1 if tot_oct>0 & tot_oct!=.
bysort persnr year: gen tot_nov_ind=1 if tot_nov>0 & tot_nov!=.
bysort persnr year: gen tot_dec_ind=1 if tot_dec>0 & tot_dec!=.

bysort persnr year: egen sum_tot_jan=total(tot_jan_ind)
bysort persnr year: egen sum_tot_feb=total(tot_feb_ind)
bysort persnr year: egen sum_tot_mar=total(tot_mar_ind)
bysort persnr year: egen sum_tot_apr=total(tot_apr_ind)
bysort persnr year: egen sum_tot_may=total(tot_may_ind)
bysort persnr year: egen sum_tot_jun=total(tot_jun_ind)
bysort persnr year: egen sum_tot_jul=total(tot_jul_ind)
bysort persnr year: egen sum_tot_aug=total(tot_aug_ind)
bysort persnr year: egen sum_tot_oct=total(tot_oct_ind)
bysort persnr year: egen sum_tot_sep=total(tot_sep_ind)
bysort persnr year: egen sum_tot_nov=total(tot_nov_ind)
bysort persnr year: egen sum_tot_dec=total(tot_dec_ind)

bysort persnr year: gen share=(sum_tot_jan+sum_tot_feb+sum_tot_mar+sum_tot_apr+sum_tot_may+sum_tot_jun+sum_tot_jul+sum_tot_aug+sum_tot_sep+sum_tot_oct+sum_tot_nov+sum_tot_dec)/(12)

bysort year: egen share_sum_unemp_cs=mean(share)

bysort year: gen counter_year=_n
keep if counter_year==1

replace share_sum_unemp_cs=1-share_sum_unemp_cs

keep year share_sum_unemp_cs

saveold "/bonke_cs99_unc_unemp.dta", replace


***

*CS:

clear
set more off
use "/Preliminars_monthly.dta", clear

keep if female==0

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4


gen jan=.
gen feb=.
gen mar=.
gen apr=.
gen may=.
gen jun=.
gen jul=.
gen aug=.
gen sep=.
gen oct=.
gen nov=.
gen dec=.

replace jan=1 if month==1
replace dec=1 if month==12

replace feb=1 if month==2
replace feb=1 if month==2
replace feb=1 if month<2 & month>2 & month!=. & month!=.

replace mar=1 if month==3
replace mar=1 if month==3
replace mar=1 if month<3 & month>3 & month!=. & month!=.

replace apr=1 if month==4
replace apr=1 if month==4
replace apr=1 if month<4 & month>4 & month!=. & month!=.

replace may=1 if month==5
replace may=1 if month==5
replace may=1 if month<5 & month>5 & month!=. & month!=.

replace jun=1 if month==6
replace jun=1 if month==6
replace jun=1 if month<6 & month>6 & month!=. & month!=.

replace jul=1 if month==7
replace jul=1 if month==7
replace jul=1 if month<7 & month>7 & month!=. & month!=.

replace aug=1 if month==8
replace aug=1 if month==8
replace aug=1 if month<8 & month>8 & month!=. & month!=.

replace sep=1 if month==9
replace sep=1 if month==9
replace sep=1 if month<9 & month>9 & month!=. & month!=.

replace oct=1 if month==10
replace oct=1 if month==10
replace oct=1 if month<10 & month>10 & month!=. & month!=.

replace nov=1 if month==11
replace nov=1 if month==11
replace nov=1 if month<11 & month>11 & month!=. & month!=.

bysort persnr year: egen tot_jan=total(jan)
bysort persnr year: egen tot_feb=total(feb)
bysort persnr year: egen tot_mar=total(mar)
bysort persnr year: egen tot_apr=total(apr)
bysort persnr year: egen tot_may=total(may)
bysort persnr year: egen tot_jun=total(jun)
bysort persnr year: egen tot_jul=total(jul)
bysort persnr year: egen tot_aug=total(aug)
bysort persnr year: egen tot_oct=total(oct)
bysort persnr year: egen tot_sep=total(sep)
bysort persnr year: egen tot_nov=total(nov)
bysort persnr year: egen tot_dec=total(dec)


bysort persnr year: gen first=_n
keep if first==1

bysort persnr year: gen tot_jan_ind=1 if tot_jan>0 & tot_jan!=.
bysort persnr year: gen tot_feb_ind=1 if tot_feb>0 & tot_feb!=.
bysort persnr year: gen tot_mar_ind=1 if tot_mar>0 & tot_mar!=.
bysort persnr year: gen tot_apr_ind=1 if tot_apr>0 & tot_apr!=.
bysort persnr year: gen tot_may_ind=1 if tot_may>0 & tot_may!=.
bysort persnr year: gen tot_jun_ind=1 if tot_jun>0 & tot_jun!=.
bysort persnr year: gen tot_jul_ind=1 if tot_jul>0 & tot_jul!=.
bysort persnr year: gen tot_aug_ind=1 if tot_aug>0 & tot_aug!=.
bysort persnr year: gen tot_oct_ind=1 if tot_sep>0 & tot_sep!=.
bysort persnr year: gen tot_sep_ind=1 if tot_oct>0 & tot_oct!=.
bysort persnr year: gen tot_nov_ind=1 if tot_nov>0 & tot_nov!=.
bysort persnr year: gen tot_dec_ind=1 if tot_dec>0 & tot_dec!=.

bysort persnr year: egen sum_tot_jan=total(tot_jan_ind)
bysort persnr year: egen sum_tot_feb=total(tot_feb_ind)
bysort persnr year: egen sum_tot_mar=total(tot_mar_ind)
bysort persnr year: egen sum_tot_apr=total(tot_apr_ind)
bysort persnr year: egen sum_tot_may=total(tot_may_ind)
bysort persnr year: egen sum_tot_jun=total(tot_jun_ind)
bysort persnr year: egen sum_tot_jul=total(tot_jul_ind)
bysort persnr year: egen sum_tot_aug=total(tot_aug_ind)
bysort persnr year: egen sum_tot_oct=total(tot_oct_ind)
bysort persnr year: egen sum_tot_sep=total(tot_sep_ind)
bysort persnr year: egen sum_tot_nov=total(tot_nov_ind)
bysort persnr year: egen sum_tot_dec=total(tot_dec_ind)

bysort persnr year: gen share=(sum_tot_jan+sum_tot_feb+sum_tot_mar+sum_tot_apr+sum_tot_may+sum_tot_jun+sum_tot_jul+sum_tot_aug+sum_tot_sep+sum_tot_oct+sum_tot_nov+sum_tot_dec)/(12)

bysort year: egen share_sum_unemp_cs=mean(share)

bysort year: gen counter_year=_n
keep if counter_year==1

replace share_sum_unemp_cs=1-share_sum_unemp_cs

keep year share_sum_unemp_cs

saveold "/bonke_cs99_male_unemp.dta", replace


***

*CS:

clear
set more off
*use "/Preliminars_monthly.dta", clear
use "\Preliminars_monthly.dta", replace
cd ""

keep if female==1

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4


gen jan=.
gen feb=.
gen mar=.
gen apr=.
gen may=.
gen jun=.
gen jul=.
gen aug=.
gen sep=.
gen oct=.
gen nov=.
gen dec=.

replace jan=1 if month==1
replace dec=1 if month==12

replace feb=1 if month==2
replace feb=1 if month==2
replace feb=1 if month<2 & month>2 & month!=. & month!=.

replace mar=1 if month==3
replace mar=1 if month==3
replace mar=1 if month<3 & month>3 & month!=. & month!=.

replace apr=1 if month==4
replace apr=1 if month==4
replace apr=1 if month<4 & month>4 & month!=. & month!=.

replace may=1 if month==5
replace may=1 if month==5
replace may=1 if month<5 & month>5 & month!=. & month!=.

replace jun=1 if month==6
replace jun=1 if month==6
replace jun=1 if month<6 & month>6 & month!=. & month!=.

replace jul=1 if month==7
replace jul=1 if month==7
replace jul=1 if month<7 & month>7 & month!=. & month!=.

replace aug=1 if month==8
replace aug=1 if month==8
replace aug=1 if month<8 & month>8 & month!=. & month!=.

replace sep=1 if month==9
replace sep=1 if month==9
replace sep=1 if month<9 & month>9 & month!=. & month!=.

replace oct=1 if month==10
replace oct=1 if month==10
replace oct=1 if month<10 & month>10 & month!=. & month!=.

replace nov=1 if month==11
replace nov=1 if month==11
replace nov=1 if month<11 & month>11 & month!=. & month!=.

bysort persnr year: egen tot_jan=total(jan)
bysort persnr year: egen tot_feb=total(feb)
bysort persnr year: egen tot_mar=total(mar)
bysort persnr year: egen tot_apr=total(apr)
bysort persnr year: egen tot_may=total(may)
bysort persnr year: egen tot_jun=total(jun)
bysort persnr year: egen tot_jul=total(jul)
bysort persnr year: egen tot_aug=total(aug)
bysort persnr year: egen tot_oct=total(oct)
bysort persnr year: egen tot_sep=total(sep)
bysort persnr year: egen tot_nov=total(nov)
bysort persnr year: egen tot_dec=total(dec)


bysort persnr year: gen first=_n
keep if first==1

bysort persnr year: gen tot_jan_ind=1 if tot_jan>0 & tot_jan!=.
bysort persnr year: gen tot_feb_ind=1 if tot_feb>0 & tot_feb!=.
bysort persnr year: gen tot_mar_ind=1 if tot_mar>0 & tot_mar!=.
bysort persnr year: gen tot_apr_ind=1 if tot_apr>0 & tot_apr!=.
bysort persnr year: gen tot_may_ind=1 if tot_may>0 & tot_may!=.
bysort persnr year: gen tot_jun_ind=1 if tot_jun>0 & tot_jun!=.
bysort persnr year: gen tot_jul_ind=1 if tot_jul>0 & tot_jul!=.
bysort persnr year: gen tot_aug_ind=1 if tot_aug>0 & tot_aug!=.
bysort persnr year: gen tot_oct_ind=1 if tot_sep>0 & tot_sep!=.
bysort persnr year: gen tot_sep_ind=1 if tot_oct>0 & tot_oct!=.
bysort persnr year: gen tot_nov_ind=1 if tot_nov>0 & tot_nov!=.
bysort persnr year: gen tot_dec_ind=1 if tot_dec>0 & tot_dec!=.

bysort persnr year: egen sum_tot_jan=total(tot_jan_ind)
bysort persnr year: egen sum_tot_feb=total(tot_feb_ind)
bysort persnr year: egen sum_tot_mar=total(tot_mar_ind)
bysort persnr year: egen sum_tot_apr=total(tot_apr_ind)
bysort persnr year: egen sum_tot_may=total(tot_may_ind)
bysort persnr year: egen sum_tot_jun=total(tot_jun_ind)
bysort persnr year: egen sum_tot_jul=total(tot_jul_ind)
bysort persnr year: egen sum_tot_aug=total(tot_aug_ind)
bysort persnr year: egen sum_tot_oct=total(tot_oct_ind)
bysort persnr year: egen sum_tot_sep=total(tot_sep_ind)
bysort persnr year: egen sum_tot_nov=total(tot_nov_ind)
bysort persnr year: egen sum_tot_dec=total(tot_dec_ind)

bysort persnr year: gen share=(sum_tot_jan+sum_tot_feb+sum_tot_mar+sum_tot_apr+sum_tot_may+sum_tot_jun+sum_tot_jul+sum_tot_aug+sum_tot_sep+sum_tot_oct+sum_tot_nov+sum_tot_dec)/(12)

bysort year: egen share_sum_unemp_cs=mean(share)

bysort year: gen counter_year=_n
keep if counter_year==1

replace share_sum_unemp_cs=1-share_sum_unemp_cs

keep year share_sum_unemp_cs

saveold "/bonke_cs99_fem_unemp.dta", replace


***




clear
set more off
*use "/Preliminars_monthly.dta", clear
use "\Preliminars_monthly.dta", replace
cd ""

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4


gen jan=.
gen feb=.
gen mar=.
gen apr=.
gen may=.
gen jun=.
gen jul=.
gen aug=.
gen sep=.
gen oct=.
gen nov=.
gen dec=.

replace jan=1 if month==1
replace dec=1 if month==12

replace feb=1 if month==2
replace feb=1 if month==2
replace feb=1 if month<2 & month>2 & month!=. & month!=.

replace mar=1 if month==3
replace mar=1 if month==3
replace mar=1 if month<3 & month>3 & month!=. & month!=.

replace apr=1 if month==4
replace apr=1 if month==4
replace apr=1 if month<4 & month>4 & month!=. & month!=.

replace may=1 if month==5
replace may=1 if month==5
replace may=1 if month<5 & month>5 & month!=. & month!=.

replace jun=1 if month==6
replace jun=1 if month==6
replace jun=1 if month<6 & month>6 & month!=. & month!=.

replace jul=1 if month==7
replace jul=1 if month==7
replace jul=1 if month<7 & month>7 & month!=. & month!=.

replace aug=1 if month==8
replace aug=1 if month==8
replace aug=1 if month<8 & month>8 & month!=. & month!=.

replace sep=1 if month==9
replace sep=1 if month==9
replace sep=1 if month<9 & month>9 & month!=. & month!=.

replace oct=1 if month==10
replace oct=1 if month==10
replace oct=1 if month<10 & month>10 & month!=. & month!=.

replace nov=1 if month==11
replace nov=1 if month==11
replace nov=1 if month<11 & month>11 & month!=. & month!=.

bysort persnr year: egen tot_jan=total(jan)
bysort persnr year: egen tot_feb=total(feb)
bysort persnr year: egen tot_mar=total(mar)
bysort persnr year: egen tot_apr=total(apr)
bysort persnr year: egen tot_may=total(may)
bysort persnr year: egen tot_jun=total(jun)
bysort persnr year: egen tot_jul=total(jul)
bysort persnr year: egen tot_aug=total(aug)
bysort persnr year: egen tot_oct=total(oct)
bysort persnr year: egen tot_sep=total(sep)
bysort persnr year: egen tot_nov=total(nov)
bysort persnr year: egen tot_dec=total(dec)


forval i=1999(1)2010 {

preserve

bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i'
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 

bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

bysort persnr year: gen tot_jan_ind=1 if tot_jan>0 & tot_jan!=.
bysort persnr year: gen tot_feb_ind=1 if tot_feb>0 & tot_feb!=.
bysort persnr year: gen tot_mar_ind=1 if tot_mar>0 & tot_mar!=.
bysort persnr year: gen tot_apr_ind=1 if tot_apr>0 & tot_apr!=.
bysort persnr year: gen tot_may_ind=1 if tot_may>0 & tot_may!=.
bysort persnr year: gen tot_jun_ind=1 if tot_jun>0 & tot_jun!=.
bysort persnr year: gen tot_jul_ind=1 if tot_jul>0 & tot_jul!=.
bysort persnr year: gen tot_aug_ind=1 if tot_aug>0 & tot_aug!=.
bysort persnr year: gen tot_oct_ind=1 if tot_sep>0 & tot_sep!=.
bysort persnr year: gen tot_sep_ind=1 if tot_oct>0 & tot_oct!=.
bysort persnr year: gen tot_nov_ind=1 if tot_nov>0 & tot_nov!=.
bysort persnr year: gen tot_dec_ind=1 if tot_dec>0 & tot_dec!=.

bysort persnr: egen sum_tot_jan=total(tot_jan_ind)
bysort persnr: egen sum_tot_feb=total(tot_feb_ind)
bysort persnr: egen sum_tot_mar=total(tot_mar_ind)
bysort persnr: egen sum_tot_apr=total(tot_apr_ind)
bysort persnr: egen sum_tot_may=total(tot_may_ind)
bysort persnr: egen sum_tot_jun=total(tot_jun_ind)
bysort persnr: egen sum_tot_jul=total(tot_jul_ind)
bysort persnr: egen sum_tot_aug=total(tot_aug_ind)
bysort persnr: egen sum_tot_oct=total(tot_oct_ind)
bysort persnr: egen sum_tot_sep=total(tot_sep_ind)
bysort persnr: egen sum_tot_nov=total(tot_nov_ind)
bysort persnr: egen sum_tot_dec=total(tot_dec_ind)

bysort persnr: gen share=(sum_tot_jan+sum_tot_feb+sum_tot_mar+sum_tot_apr+sum_tot_may+sum_tot_jun+sum_tot_jul+sum_tot_aug+sum_tot_sep+sum_tot_oct+sum_tot_nov+sum_tot_dec)/(12*5)

sort persnr year

bysort persnr: gen counter_persnr=_n
keep if counter_persnr==1

egen share_sum_unemp_`i'=mean(share)

replace share_sum_unemp_`i'=1-share_sum_unemp_`i'

gen counter=_n
keep if counter==1

keep year share_sum_unemp_`i'

saveold "/bonke_`i'_5years_unc_unemp.dta", replace

restore

}

***

clear
set more off
*use "/Preliminars_monthly.dta", clear
use "\Preliminars_monthly.dta", replace
cd ""

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4


gen jan=.
gen feb=.
gen mar=.
gen apr=.
gen may=.
gen jun=.
gen jul=.
gen aug=.
gen sep=.
gen oct=.
gen nov=.
gen dec=.

replace jan=1 if month==1
replace dec=1 if month==12

replace feb=1 if month==2
replace feb=1 if month==2
replace feb=1 if month<2 & month>2 & month!=. & month!=.

replace mar=1 if month==3
replace mar=1 if month==3
replace mar=1 if month<3 & month>3 & month!=. & month!=.

replace apr=1 if month==4
replace apr=1 if month==4
replace apr=1 if month<4 & month>4 & month!=. & month!=.

replace may=1 if month==5
replace may=1 if month==5
replace may=1 if month<5 & month>5 & month!=. & month!=.

replace jun=1 if month==6
replace jun=1 if month==6
replace jun=1 if month<6 & month>6 & month!=. & month!=.

replace jul=1 if month==7
replace jul=1 if month==7
replace jul=1 if month<7 & month>7 & month!=. & month!=.

replace aug=1 if month==8
replace aug=1 if month==8
replace aug=1 if month<8 & month>8 & month!=. & month!=.

replace sep=1 if month==9
replace sep=1 if month==9
replace sep=1 if month<9 & month>9 & month!=. & month!=.

replace oct=1 if month==10
replace oct=1 if month==10
replace oct=1 if month<10 & month>10 & month!=. & month!=.

replace nov=1 if month==11
replace nov=1 if month==11
replace nov=1 if month<11 & month>11 & month!=. & month!=.

bysort persnr year: egen tot_jan=total(jan)
bysort persnr year: egen tot_feb=total(feb)
bysort persnr year: egen tot_mar=total(mar)
bysort persnr year: egen tot_apr=total(apr)
bysort persnr year: egen tot_may=total(may)
bysort persnr year: egen tot_jun=total(jun)
bysort persnr year: egen tot_jul=total(jul)
bysort persnr year: egen tot_aug=total(aug)
bysort persnr year: egen tot_oct=total(oct)
bysort persnr year: egen tot_sep=total(sep)
bysort persnr year: egen tot_nov=total(nov)
bysort persnr year: egen tot_dec=total(dec)


forval i=1999(1)2010 {

preserve

bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i'
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 

bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

bysort persnr year: gen tot_jan_ind=1 if tot_jan>0 & tot_jan!=.
bysort persnr year: gen tot_feb_ind=1 if tot_feb>0 & tot_feb!=.
bysort persnr year: gen tot_mar_ind=1 if tot_mar>0 & tot_mar!=.
bysort persnr year: gen tot_apr_ind=1 if tot_apr>0 & tot_apr!=.
bysort persnr year: gen tot_may_ind=1 if tot_may>0 & tot_may!=.
bysort persnr year: gen tot_jun_ind=1 if tot_jun>0 & tot_jun!=.
bysort persnr year: gen tot_jul_ind=1 if tot_jul>0 & tot_jul!=.
bysort persnr year: gen tot_aug_ind=1 if tot_aug>0 & tot_aug!=.
bysort persnr year: gen tot_oct_ind=1 if tot_sep>0 & tot_sep!=.
bysort persnr year: gen tot_sep_ind=1 if tot_oct>0 & tot_oct!=.
bysort persnr year: gen tot_nov_ind=1 if tot_nov>0 & tot_nov!=.
bysort persnr year: gen tot_dec_ind=1 if tot_dec>0 & tot_dec!=.

bysort persnr: egen sum_tot_jan=total(tot_jan_ind)
bysort persnr: egen sum_tot_feb=total(tot_feb_ind)
bysort persnr: egen sum_tot_mar=total(tot_mar_ind)
bysort persnr: egen sum_tot_apr=total(tot_apr_ind)
bysort persnr: egen sum_tot_may=total(tot_may_ind)
bysort persnr: egen sum_tot_jun=total(tot_jun_ind)
bysort persnr: egen sum_tot_jul=total(tot_jul_ind)
bysort persnr: egen sum_tot_aug=total(tot_aug_ind)
bysort persnr: egen sum_tot_oct=total(tot_oct_ind)
bysort persnr: egen sum_tot_sep=total(tot_sep_ind)
bysort persnr: egen sum_tot_nov=total(tot_nov_ind)
bysort persnr: egen sum_tot_dec=total(tot_dec_ind)

bysort persnr: gen share=(sum_tot_jan+sum_tot_feb+sum_tot_mar+sum_tot_apr+sum_tot_may+sum_tot_jun+sum_tot_jul+sum_tot_aug+sum_tot_sep+sum_tot_oct+sum_tot_nov+sum_tot_dec)/(12*5)

sort persnr year

bysort persnr: gen counter_persnr=_n
keep if counter_persnr==1

egen share_sum_unemp_`i'=mean(share)

replace share_sum_unemp_`i'=1-share_sum_unemp_`i'

gen counter=_n
keep if counter==1

keep year share_sum_unemp_`i'

saveold "/bonke_`i'_5years_male_unemp.dta", replace

restore

}

***

clear
set more off
use "\Preliminars_monthly.dta", replace
cd ""
*use "/Preliminars_monthly.dta", clear

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4


gen jan=.
gen feb=.
gen mar=.
gen apr=.
gen may=.
gen jun=.
gen jul=.
gen aug=.
gen sep=.
gen oct=.
gen nov=.
gen dec=.

replace jan=1 if month==1
replace dec=1 if month==12

replace feb=1 if month==2
replace feb=1 if month==2
replace feb=1 if month<2 & month>2 & month!=. & month!=.

replace mar=1 if month==3
replace mar=1 if month==3
replace mar=1 if month<3 & month>3 & month!=. & month!=.

replace apr=1 if month==4
replace apr=1 if month==4
replace apr=1 if month<4 & month>4 & month!=. & month!=.

replace may=1 if month==5
replace may=1 if month==5
replace may=1 if month<5 & month>5 & month!=. & month!=.

replace jun=1 if month==6
replace jun=1 if month==6
replace jun=1 if month<6 & month>6 & month!=. & month!=.

replace jul=1 if month==7
replace jul=1 if month==7
replace jul=1 if month<7 & month>7 & month!=. & month!=.

replace aug=1 if month==8
replace aug=1 if month==8
replace aug=1 if month<8 & month>8 & month!=. & month!=.

replace sep=1 if month==9
replace sep=1 if month==9
replace sep=1 if month<9 & month>9 & month!=. & month!=.

replace oct=1 if month==10
replace oct=1 if month==10
replace oct=1 if month<10 & month>10 & month!=. & month!=.

replace nov=1 if month==11
replace nov=1 if month==11
replace nov=1 if month<11 & month>11 & month!=. & month!=.

bysort persnr year: egen tot_jan=total(jan)
bysort persnr year: egen tot_feb=total(feb)
bysort persnr year: egen tot_mar=total(mar)
bysort persnr year: egen tot_apr=total(apr)
bysort persnr year: egen tot_may=total(may)
bysort persnr year: egen tot_jun=total(jun)
bysort persnr year: egen tot_jul=total(jul)
bysort persnr year: egen tot_aug=total(aug)
bysort persnr year: egen tot_oct=total(oct)
bysort persnr year: egen tot_sep=total(sep)
bysort persnr year: egen tot_nov=total(nov)
bysort persnr year: egen tot_dec=total(dec)


forval i=1999(1)2010 {

preserve

bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i'
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 

bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

bysort persnr year: gen tot_jan_ind=1 if tot_jan>0 & tot_jan!=.
bysort persnr year: gen tot_feb_ind=1 if tot_feb>0 & tot_feb!=.
bysort persnr year: gen tot_mar_ind=1 if tot_mar>0 & tot_mar!=.
bysort persnr year: gen tot_apr_ind=1 if tot_apr>0 & tot_apr!=.
bysort persnr year: gen tot_may_ind=1 if tot_may>0 & tot_may!=.
bysort persnr year: gen tot_jun_ind=1 if tot_jun>0 & tot_jun!=.
bysort persnr year: gen tot_jul_ind=1 if tot_jul>0 & tot_jul!=.
bysort persnr year: gen tot_aug_ind=1 if tot_aug>0 & tot_aug!=.
bysort persnr year: gen tot_oct_ind=1 if tot_sep>0 & tot_sep!=.
bysort persnr year: gen tot_sep_ind=1 if tot_oct>0 & tot_oct!=.
bysort persnr year: gen tot_nov_ind=1 if tot_nov>0 & tot_nov!=.
bysort persnr year: gen tot_dec_ind=1 if tot_dec>0 & tot_dec!=.

bysort persnr: egen sum_tot_jan=total(tot_jan_ind)
bysort persnr: egen sum_tot_feb=total(tot_feb_ind)
bysort persnr: egen sum_tot_mar=total(tot_mar_ind)
bysort persnr: egen sum_tot_apr=total(tot_apr_ind)
bysort persnr: egen sum_tot_may=total(tot_may_ind)
bysort persnr: egen sum_tot_jun=total(tot_jun_ind)
bysort persnr: egen sum_tot_jul=total(tot_jul_ind)
bysort persnr: egen sum_tot_aug=total(tot_aug_ind)
bysort persnr: egen sum_tot_oct=total(tot_oct_ind)
bysort persnr: egen sum_tot_sep=total(tot_sep_ind)
bysort persnr: egen sum_tot_nov=total(tot_nov_ind)
bysort persnr: egen sum_tot_dec=total(tot_dec_ind)

bysort persnr: gen share=(sum_tot_jan+sum_tot_feb+sum_tot_mar+sum_tot_apr+sum_tot_may+sum_tot_jun+sum_tot_jul+sum_tot_aug+sum_tot_sep+sum_tot_oct+sum_tot_nov+sum_tot_dec)/(12*5)

sort persnr year

bysort persnr: gen counter_persnr=_n
keep if counter_persnr==1

egen share_sum_unemp_`i'=mean(share)

replace share_sum_unemp_`i'=1-share_sum_unemp_`i'

gen counter=_n
keep if counter==1

keep year share_sum_unemp_`i'

saveold "/bonke_`i'_5years_fem_unemp.dta", replace

restore

}

***




*full

clear
set more off

*
*set memory 16g
*use "/Preliminars_monthly.dta", clear
use "\Preliminars_monthly.dta", replace
cd ""
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

bysort persnr year: gen first=_n
keep if first==1
drop first

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==1
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

qui ge gini_lt_work_`i' = .
qui ge var_lt_work_`i' = .
qui ge p85_lt_work = .
qui ge p15_lt_work = .
qui gen p85_p15_lt_work_`i' = .
*
qui gen p85_p15_yearly_work_`i' = .
qui ge p85_yearly_work = .
qui ge p15_yearly_work = .

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
qui egen mean_sum_earnings_long_term_work=mean(sum_earnings_long_term_work)
qui egen meanlog_earnings_long_term=mean(log_sum_earnings_long_term_work)
*
qui egen mean_sum_earnings_yearly_work=mean(sum_earnings_yearly_work)
qui egen meanlog_earnings_yearly=mean(log_sum_earnings_yearly_work)
*
replace gini_lt_work_`i' = r(gini)
egen sd=sd(log_sum_earnings_long_term_work)
replace var_lt_work_`i'=sd
egen p85 = pctile(sum_earnings_long_term_work), p(85)
egen p15 = pctile(sum_earnings_long_term_work), p(15)
egen p85_yearly = pctile(sum_earnings_long_term_work), p(85)
egen p15_yearly = pctile(sum_earnings_long_term_work), p(15)
replace p15_lt_work=p15
replace p85_lt_work=p85
replace p15_yearly_work=p15_yearly
replace p85_yearly_work=p85_yearly
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work
replace p85_p15_yearly_work_`i'=p85_yearly_work/p15_yearly_work
drop sd p85 p15 p85_yearly p15_yearly
*
*

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep




*** Keep

keep year gini* var* p* mean* log* educ* age* year_birth*

display `i'

saveold "/bonke_`i'_5years_unc_full.dta", replace

restore

}

*


*part

clear
set more off

*
*set memory 16g
use "\Preliminars_monthly.dta", replace
cd ""
*use "/Preliminars_monthly.dta", clear
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

bysort persnr year: gen first=_n
keep if first==1
drop first

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==2
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

qui ge gini_lt_work_`i' = .
qui ge var_lt_work_`i' = .
qui ge p85_lt_work = .
qui ge p15_lt_work = .
qui gen p85_p15_lt_work_`i' = .
*
qui gen p85_p15_yearly_work_`i' = .
qui ge p85_yearly_work = .
qui ge p15_yearly_work = .

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
qui egen mean_sum_earnings_long_term_work=mean(sum_earnings_long_term_work)
qui egen meanlog_earnings_long_term=mean(log_sum_earnings_long_term_work)
*
qui egen mean_sum_earnings_yearly_work=mean(sum_earnings_yearly_work)
qui egen meanlog_earnings_yearly=mean(log_sum_earnings_yearly_work)
replace gini_lt_work_`i' = r(gini)
egen sd=sd(log_sum_earnings_long_term_work)
replace var_lt_work_`i'=sd
egen p85 = pctile(sum_earnings_long_term_work), p(85)
egen p15 = pctile(sum_earnings_long_term_work), p(15)
egen p85_yearly = pctile(sum_earnings_long_term_work), p(85)
egen p15_yearly = pctile(sum_earnings_long_term_work), p(15)
replace p15_lt_work=p15
replace p85_lt_work=p85
replace p15_yearly_work=p15_yearly
replace p85_yearly_work=p85_yearly
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work
replace p85_p15_yearly_work_`i'=p85_lt_work/p15_yearly_work
drop sd p85 p15 p85_yearly p15_yearly
*
*

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year gini* var* p* mean* log* educ* age* year_birth*


display `i'

saveold "/bonke_`i'_5years_unc_part.dta", replace

restore

}

*


*mini

clear
set more off

*
*set memory 16g
use "\Preliminars_monthly.dta", replace
cd ""
*use "/Preliminars_monthly.dta", clear
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

bysort persnr year: gen first=_n
keep if first==1
drop first

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==3
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

qui ge gini_lt_work_`i' = .
qui ge var_lt_work_`i' = .
qui ge p85_lt_work = .
qui ge p15_lt_work = .
qui gen p85_p15_lt_work_`i' = .
*
qui gen p85_p15_yearly_work_`i' = .
qui ge p85_yearly_work = .
qui ge p15_yearly_work = .

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
qui egen mean_sum_earnings_long_term_work=mean(sum_earnings_long_term_work)
qui egen meanlog_earnings_long_term=mean(log_sum_earnings_long_term_work)
*
qui egen mean_sum_earnings_yearly_work=mean(sum_earnings_yearly_work)
qui egen meanlog_earnings_yearly=mean(log_sum_earnings_yearly_work)
replace gini_lt_work_`i' = r(gini)
egen sd=sd(log_sum_earnings_long_term_work)
replace var_lt_work_`i'=sd
egen p85 = pctile(sum_earnings_long_term_work), p(85)
egen p15 = pctile(sum_earnings_long_term_work), p(15)
egen p85_yearly = pctile(sum_earnings_long_term_work), p(85)
egen p15_yearly = pctile(sum_earnings_long_term_work), p(15)
replace p15_lt_work=p15
replace p85_lt_work=p85
replace p15_yearly_work=p15_yearly
replace p85_yearly_work=p85_yearly
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work
replace p85_p15_yearly_work_`i'=p85_lt_work/p15_yearly_work
drop sd p85 p15 p85_yearly p15_yearly
*
*

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year gini* var* p* mean* log* educ* age* year_birth*


display `i'

saveold "/bonke_`i'_5years_unc_mini.dta", replace

restore

}
*

*full

clear
set more off

*
*set memory 16g
*use "/Preliminars_monthly.dta", clear
use "\Preliminars_monthly.dta", replace
cd ""
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

bysort persnr year: gen first=_n
keep if first==1
drop first

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==1
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

qui ge gini_lt_work_`i' = .
qui ge var_lt_work_`i' = .
qui ge p85_lt_work = .
qui ge p15_lt_work = .
qui gen p85_p15_lt_work_`i' = .
*
qui gen p85_p15_yearly_work_`i' = .
qui ge p85_yearly_work = .
qui ge p15_yearly_work = .

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
qui egen mean_sum_earnings_long_term_work=mean(sum_earnings_long_term_work)
qui egen meanlog_earnings_long_term=mean(log_sum_earnings_long_term_work)
*
qui egen mean_sum_earnings_yearly_work=mean(sum_earnings_yearly_work)
qui egen meanlog_earnings_yearly=mean(log_sum_earnings_yearly_work)
replace gini_lt_work_`i' = r(gini)
egen sd=sd(log_sum_earnings_long_term_work)
replace var_lt_work_`i'=sd
egen p85 = pctile(sum_earnings_long_term_work), p(85)
egen p15 = pctile(sum_earnings_long_term_work), p(15)
egen p85_yearly = pctile(sum_earnings_long_term_work), p(85)
egen p15_yearly = pctile(sum_earnings_long_term_work), p(15)
replace p15_lt_work=p15
replace p85_lt_work=p85
replace p15_yearly_work=p15_yearly
replace p85_yearly_work=p85_yearly
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work
replace p85_p15_yearly_work_`i'=p85_lt_work/p15_yearly_work
drop sd p85 p15 p85_yearly p15_yearly
*
*

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year gini* var* p* mean* log* educ* age* year_birth*


display `i'

saveold "/bonke_`i'_5years_male_full.dta", replace

restore

}

*


*part

clear
set more off

*
*set memory 16g
use "\Preliminars_monthly.dta", replace
cd ""
*use "/Preliminars_monthly.dta", clear
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

bysort persnr year: gen first=_n
keep if first==1
drop first

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==2
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

qui ge gini_lt_work_`i' = .
qui ge var_lt_work_`i' = .
qui ge p85_lt_work = .
qui ge p15_lt_work = .
qui gen p85_p15_lt_work_`i' = .
*
qui gen p85_p15_yearly_work_`i' = .
qui ge p85_yearly_work = .
qui ge p15_yearly_work = .

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
qui egen mean_sum_earnings_long_term_work=mean(sum_earnings_long_term_work)
qui egen meanlog_earnings_long_term=mean(log_sum_earnings_long_term_work)
*
qui egen mean_sum_earnings_yearly_work=mean(sum_earnings_yearly_work)
qui egen meanlog_earnings_yearly=mean(log_sum_earnings_yearly_work)
replace gini_lt_work_`i' = r(gini)
egen sd=sd(log_sum_earnings_long_term_work)
replace var_lt_work_`i'=sd
egen p85 = pctile(sum_earnings_long_term_work), p(85)
egen p15 = pctile(sum_earnings_long_term_work), p(15)
egen p85_yearly = pctile(sum_earnings_long_term_work), p(85)
egen p15_yearly = pctile(sum_earnings_long_term_work), p(15)
replace p15_lt_work=p15
replace p85_lt_work=p85
replace p15_yearly_work=p15_yearly
replace p85_yearly_work=p85_yearly
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work
replace p85_p15_yearly_work_`i'=p85_lt_work/p15_yearly_work
drop sd p85 p15 p85_yearly p15_yearly
*
*

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year gini* var* p* mean* log* educ* age* year_birth*


display `i'

saveold "/bonke_`i'_5years_male_part.dta", replace

restore

}

*


*mini

clear
set more off

*
*set memory 16g
use "\Preliminars_monthly.dta", replace
cd ""
*use "/Preliminars_monthly.dta", clear
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

bysort persnr year: gen first=_n
keep if first==1
drop first

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==3
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

qui ge gini_lt_work_`i' = .
qui ge var_lt_work_`i' = .
qui ge p85_lt_work = .
qui ge p15_lt_work = .
qui gen p85_p15_lt_work_`i' = .
*
qui gen p85_p15_yearly_work_`i' = .
qui ge p85_yearly_work = .
qui ge p15_yearly_work = .

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

qui egen mean_sum_earnings_long_term_work=mean(sum_earnings_long_term_work)
qui egen meanlog_earnings_long_term=mean(log_sum_earnings_long_term_work)
*
qui egen mean_sum_earnings_yearly_work=mean(sum_earnings_yearly_work)
qui egen meanlog_earnings_yearly=mean(log_sum_earnings_yearly_work)
replace gini_lt_work_`i' = r(gini)
egen sd=sd(log_sum_earnings_long_term_work)
replace var_lt_work_`i'=sd
egen p85 = pctile(sum_earnings_long_term_work), p(85)
egen p15 = pctile(sum_earnings_long_term_work), p(15)
egen p85_yearly = pctile(sum_earnings_long_term_work), p(85)
egen p15_yearly = pctile(sum_earnings_long_term_work), p(15)
replace p15_lt_work=p15
replace p85_lt_work=p85
replace p15_yearly_work=p15_yearly
replace p85_yearly_work=p85_yearly
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work
replace p85_p15_yearly_work_`i'=p85_lt_work/p15_yearly_work
drop sd p85 p15 p85_yearly p15_yearly
*
*

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year gini* var* p* mean* log* educ* age* year_birth*

display `i'

saveold "/bonke_`i'_5years_male_mini.dta", replace

restore

}
*

*full

clear
set more off

*
*set memory 16g
use "\Preliminars_monthly.dta", replace
cd ""
*use "/Preliminars_monthly.dta", clear
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

bysort persnr year: gen first=_n
keep if first==1
drop first

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==1
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

qui ge gini_lt_work_`i' = .
qui ge var_lt_work_`i' = .
qui ge p85_lt_work = .
qui ge p15_lt_work = .
qui gen p85_p15_lt_work_`i' = .
*
qui gen p85_p15_yearly_work_`i' = .
qui ge p85_yearly_work = .
qui ge p15_yearly_work = .

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

qui egen mean_sum_earnings_long_term_work=mean(sum_earnings_long_term_work)
qui egen meanlog_earnings_long_term=mean(log_sum_earnings_long_term_work)
*
qui egen mean_sum_earnings_yearly_work=mean(sum_earnings_yearly_work)
qui egen meanlog_earnings_yearly=mean(log_sum_earnings_yearly_work)
replace gini_lt_work_`i' = r(gini)
egen sd=sd(log_sum_earnings_long_term_work)
replace var_lt_work_`i'=sd
egen p85 = pctile(sum_earnings_long_term_work), p(85)
egen p15 = pctile(sum_earnings_long_term_work), p(15)
egen p85_yearly = pctile(sum_earnings_long_term_work), p(85)
egen p15_yearly = pctile(sum_earnings_long_term_work), p(15)
replace p15_lt_work=p15
replace p85_lt_work=p85
replace p15_yearly_work=p15_yearly
replace p85_yearly_work=p85_yearly
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work
replace p85_p15_yearly_work_`i'=p85_lt_work/p15_yearly_work
drop sd p85 p15 p85_yearly p15_yearly
*
*

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year gini* var* p* mean* log* educ* age* year_birth*


display `i'

saveold "/bonke_`i'_5years_female_full.dta", replace

restore

}

*


*part

clear
set more off

*
*set memory 16g
use "\Preliminars_monthly.dta", replace
cd ""
*use "/Preliminars_monthly.dta", clear
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

bysort persnr year: gen first=_n
keep if first==1
drop first

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==2
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

qui ge gini_lt_work_`i' = .
qui ge var_lt_work_`i' = .
qui ge p85_lt_work = .
qui ge p15_lt_work = .
qui gen p85_p15_lt_work_`i' = .
*
qui gen p85_p15_yearly_work_`i' = .
qui ge p85_yearly_work = .
qui ge p15_yearly_work = .

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
qui egen mean_sum_earnings_long_term_work=mean(sum_earnings_long_term_work)
qui egen meanlog_earnings_long_term=mean(log_sum_earnings_long_term_work)
*
qui egen mean_sum_earnings_yearly_work=mean(sum_earnings_yearly_work)
qui egen meanlog_earnings_yearly=mean(log_sum_earnings_yearly_work)
replace gini_lt_work_`i' = r(gini)
egen sd=sd(log_sum_earnings_long_term_work)
replace var_lt_work_`i'=sd
egen p85 = pctile(sum_earnings_long_term_work), p(85)
egen p15 = pctile(sum_earnings_long_term_work), p(15)
egen p85_yearly = pctile(sum_earnings_long_term_work), p(85)
egen p15_yearly = pctile(sum_earnings_long_term_work), p(15)
replace p15_lt_work=p15
replace p85_lt_work=p85
replace p15_yearly_work=p15_yearly
replace p85_yearly_work=p85_yearly
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work
replace p85_p15_yearly_work_`i'=p85_lt_work/p15_yearly_work
drop sd p85 p15 p85_yearly p15_yearly
*
*

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year gini* var* p* mean* log* educ* age* year_birth*

display `i'

saveold "/bonke_`i'_5years_female_part.dta", replace

restore

}

*


*mini

clear
set more off

*
*set memory 16g
*use "/Preliminars_monthly.dta", clear
use "\Preliminars_monthly.dta", replace
cd ""
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

bysort persnr year: gen first=_n
keep if first==1
drop first

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==3
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

qui ge gini_lt_work_`i' = .
qui ge var_lt_work_`i' = .
qui ge p85_lt_work = .
qui ge p15_lt_work = .
qui gen p85_p15_lt_work_`i' = .
*
qui gen p85_p15_yearly_work_`i' = .
qui ge p85_yearly_work = .
qui ge p15_yearly_work = .

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
qui egen mean_sum_earnings_long_term_work=mean(sum_earnings_long_term_work)
qui egen meanlog_earnings_long_term=mean(log_sum_earnings_long_term_work)
*
qui egen mean_sum_earnings_yearly_work=mean(sum_earnings_yearly_work)
qui egen meanlog_earnings_yearly=mean(log_sum_earnings_yearly_work)
replace gini_lt_work_`i' = r(gini)
egen sd=sd(log_sum_earnings_long_term_work)
replace var_lt_work_`i'=sd
egen p85 = pctile(sum_earnings_long_term_work), p(85)
egen p15 = pctile(sum_earnings_long_term_work), p(15)
egen p85_yearly = pctile(sum_earnings_long_term_work), p(85)
egen p15_yearly = pctile(sum_earnings_long_term_work), p(15)
replace p15_lt_work=p15
replace p85_lt_work=p85
replace p15_yearly_work=p15_yearly
replace p85_yearly_work=p85_yearly
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work
replace p85_p15_yearly_work_`i'=p85_lt_work/p15_yearly_work
drop sd p85 p15 p85_yearly p15_yearly
*
*

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year gini* var* p* mean* log* educ* age* year_birth*

display `i'

saveold "/bonke_`i'_5years_female_mini.dta", replace

restore

}
*



*** Fraction of Full/Part/Mini Time Spells

*full

clear
set more off

*
*set memory 16g
*use "/Preliminars_monthly.dta", clear
use "\Preliminars_monthly.dta", replace
cd ""
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

***create % full part mini 5 years ahead

gen full=1 if empstate==1
gen part=1 if empstate==2
gen mini=1 if empstate==3
*
gen days_full=30 if empstate==1
gen days_part=30 if empstate==2
gen days_mini=30 if empstate==3
*
bysort persnr year: egen total_full_days=total(days_full)
bysort persnr year: egen total_part_days=total(days_part)
bysort persnr year: egen total_mini_days=total(days_mini)
*
bysort persnr year: egen total_full=total(full)
bysort persnr year: egen total_part=total(part)
bysort persnr year: egen total_mini=total(mini)

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==1
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

sort persnr year
*they are deflated
bysort persnr: egen sum_full=total(total_full)
bysort persnr: egen sum_part=total(total_part)
bysort persnr: egen sum_mini=total(total_mini)
*
bysort persnr: egen sum_full_days=total(total_full_days)
bysort persnr: egen sum_part_days=total(total_part_days)
bysort persnr: egen sum_mini_days=total(total_mini_days)
*
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
bysort persnr: gen share_full=(sum_full)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_part=(sum_part)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_mini=(sum_mini)/(sum_full+sum_part+sum_mini)
*
bysort persnr: gen share_full_days=(sum_full_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_part_days=(sum_part_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_mini_days=(sum_mini_days)/(sum_full_days+sum_part_days+sum_mini_days)

*** Keep

keep year share*

display `i'

saveold "/bonke_`i'_5years_unc_full_shares.dta", replace

restore

}

*


*part

clear
set more off

*
*set memory 16g
use "\Preliminars_monthly.dta", replace
cd ""
*use "/Preliminars_monthly.dta", clear
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

***create % full part mini 5 years ahead

gen full=1 if empstate==1
gen part=1 if empstate==2
gen mini=1 if empstate==3
*
gen days_full=30 if empstate==1
gen days_part=30 if empstate==2
gen days_mini=30 if empstate==3
*
bysort persnr year: egen total_full_days=total(days_full)
bysort persnr year: egen total_part_days=total(days_part)
bysort persnr year: egen total_mini_days=total(days_mini)
*
bysort persnr year: egen total_full=total(full)
bysort persnr year: egen total_part=total(part)
bysort persnr year: egen total_mini=total(mini)

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==2
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

sort persnr year
*they are deflated
bysort persnr: egen sum_full=total(total_full)
bysort persnr: egen sum_part=total(total_part)
bysort persnr: egen sum_mini=total(total_mini)
*
bysort persnr: egen sum_full_days=total(total_full_days)
bysort persnr: egen sum_part_days=total(total_part_days)
bysort persnr: egen sum_mini_days=total(total_mini_days)
*
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
bysort persnr: gen share_full=(sum_full)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_part=(sum_part)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_mini=(sum_mini)/(sum_full+sum_part+sum_mini)
*
bysort persnr: gen share_full_days=(sum_full_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_part_days=(sum_part_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_mini_days=(sum_mini_days)/(sum_full_days+sum_part_days+sum_mini_days)

*** Keep

keep year share*

display `i'

saveold "/bonke_`i'_5years_unc_part_shares.dta", replace

restore

}

*
*


*mini

clear
set more off

*
*set memory 16g
use "\Preliminars_monthly.dta", replace
cd ""
*use "/Preliminars_monthly.dta", clear
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

***create % full part mini 5 years ahead

gen full=1 if empstate==1
gen part=1 if empstate==2
gen mini=1 if empstate==3
*
gen days_full=30 if empstate==1
gen days_part=30 if empstate==2
gen days_mini=30 if empstate==3
*
bysort persnr year: egen total_full_days=total(days_full)
bysort persnr year: egen total_part_days=total(days_part)
bysort persnr year: egen total_mini_days=total(days_mini)
*
bysort persnr year: egen total_full=total(full)
bysort persnr year: egen total_part=total(part)
bysort persnr year: egen total_mini=total(mini)

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==3
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

sort persnr year
*they are deflated
bysort persnr: egen sum_full=total(total_full)
bysort persnr: egen sum_part=total(total_part)
bysort persnr: egen sum_mini=total(total_mini)
*
bysort persnr: egen sum_full_days=total(total_full_days)
bysort persnr: egen sum_part_days=total(total_part_days)
bysort persnr: egen sum_mini_days=total(total_mini_days)
*
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
bysort persnr: gen share_full=(sum_full)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_part=(sum_part)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_mini=(sum_mini)/(sum_full+sum_part+sum_mini)
*
bysort persnr: gen share_full_days=(sum_full_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_part_days=(sum_part_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_mini_days=(sum_mini_days)/(sum_full_days+sum_part_days+sum_mini_days)

*** Keep

keep year share*

display `i'

saveold "/bonke_`i'_5years_unc_mini_shares.dta", replace

restore

}

*



*** Fraction of Full/Part/Mini Time Spells Males

*full

clear
set more off

*
*set memory 16g
use "\Preliminars_monthly.dta", replace
cd ""
*use "/Preliminars_monthly.dta", clear
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

***create % full part mini 5 years ahead

gen full=1 if empstate==1
gen part=1 if empstate==2
gen mini=1 if empstate==3
*
gen days_full=30 if empstate==1
gen days_part=30 if empstate==2
gen days_mini=30 if empstate==3
*
bysort persnr year: egen total_full_days=total(days_full)
bysort persnr year: egen total_part_days=total(days_part)
bysort persnr year: egen total_mini_days=total(days_mini)
*
bysort persnr year: egen total_full=total(full)
bysort persnr year: egen total_part=total(part)
bysort persnr year: egen total_mini=total(mini)

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==1
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

sort persnr year
*they are deflated
bysort persnr: egen sum_full=total(total_full)
bysort persnr: egen sum_part=total(total_part)
bysort persnr: egen sum_mini=total(total_mini)
*
bysort persnr: egen sum_full_days=total(total_full_days)
bysort persnr: egen sum_part_days=total(total_part_days)
bysort persnr: egen sum_mini_days=total(total_mini_days)
*
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
bysort persnr: gen share_full=(sum_full)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_part=(sum_part)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_mini=(sum_mini)/(sum_full+sum_part+sum_mini)
*
bysort persnr: gen share_full_days=(sum_full_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_part_days=(sum_part_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_mini_days=(sum_mini_days)/(sum_full_days+sum_part_days+sum_mini_days)

*** Keep

keep year share*

display `i'

saveold "/bonke_`i'_5years_male_full_shares.dta", replace

restore

}

*


*part

clear
set more off

*
*set memory 16g
use "\Preliminars_monthly.dta", replace
cd ""
*use "/Preliminars_monthly.dta", clear
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

***create % full part mini 5 years ahead

gen full=1 if empstate==1
gen part=1 if empstate==2
gen mini=1 if empstate==3
*
gen days_full=30 if empstate==1
gen days_part=30 if empstate==2
gen days_mini=30 if empstate==3
*
bysort persnr year: egen total_full_days=total(days_full)
bysort persnr year: egen total_part_days=total(days_part)
bysort persnr year: egen total_mini_days=total(days_mini)
*
bysort persnr year: egen total_full=total(full)
bysort persnr year: egen total_part=total(part)
bysort persnr year: egen total_mini=total(mini)

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==2
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

sort persnr year
*they are deflated
bysort persnr: egen sum_full=total(total_full)
bysort persnr: egen sum_part=total(total_part)
bysort persnr: egen sum_mini=total(total_mini)
*
bysort persnr: egen sum_full_days=total(total_full_days)
bysort persnr: egen sum_part_days=total(total_part_days)
bysort persnr: egen sum_mini_days=total(total_mini_days)
*
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
bysort persnr: gen share_full=(sum_full)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_part=(sum_part)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_mini=(sum_mini)/(sum_full+sum_part+sum_mini)
*
bysort persnr: gen share_full_days=(sum_full_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_part_days=(sum_part_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_mini_days=(sum_mini_days)/(sum_full_days+sum_part_days+sum_mini_days)

*** Keep

keep year share*

display `i'

saveold "/bonke_`i'_5years_male_part_shares.dta", replace

restore

}

*
*


*mini

clear
set more off

*
*set memory 16g
*use "/Preliminars_monthly.dta", clear
use "\Preliminars_monthly.dta", replace
cd ""
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

***create % full part mini 5 years ahead

gen full=1 if empstate==1
gen part=1 if empstate==2
gen mini=1 if empstate==3
*
gen days_full=30 if empstate==1
gen days_part=30 if empstate==2
gen days_mini=30 if empstate==3
*
bysort persnr year: egen total_full_days=total(days_full)
bysort persnr year: egen total_part_days=total(days_part)
bysort persnr year: egen total_mini_days=total(days_mini)
*
bysort persnr year: egen total_full=total(full)
bysort persnr year: egen total_part=total(part)
bysort persnr year: egen total_mini=total(mini)

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==3
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

sort persnr year
*they are deflated
bysort persnr: egen sum_full=total(total_full)
bysort persnr: egen sum_part=total(total_part)
bysort persnr: egen sum_mini=total(total_mini)
*
bysort persnr: egen sum_full_days=total(total_full_days)
bysort persnr: egen sum_part_days=total(total_part_days)
bysort persnr: egen sum_mini_days=total(total_mini_days)
*
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
bysort persnr: gen share_full=(sum_full)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_part=(sum_part)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_mini=(sum_mini)/(sum_full+sum_part+sum_mini)
*
bysort persnr: gen share_full_days=(sum_full_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_part_days=(sum_part_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_mini_days=(sum_mini_days)/(sum_full_days+sum_part_days+sum_mini_days)

*** Keep

keep year share*

display `i'

saveold "/bonke_`i'_5years_male_mini_shares.dta", replace

restore

}

*


*** Fraction of Full/Part/Mini Time Spells  Females

*full

clear
set more off

*
*set memory 16g
*use "/Preliminars_monthly.dta", clear
use "\Preliminars_monthly.dta", replace
cd ""
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

***create % full part mini 5 years ahead

gen full=1 if empstate==1
gen part=1 if empstate==2
gen mini=1 if empstate==3
*
gen days_full=30 if empstate==1
gen days_part=30 if empstate==2
gen days_mini=30 if empstate==3
*
bysort persnr year: egen total_full_days=total(days_full)
bysort persnr year: egen total_part_days=total(days_part)
bysort persnr year: egen total_mini_days=total(days_mini)
*
bysort persnr year: egen total_full=total(full)
bysort persnr year: egen total_part=total(part)
bysort persnr year: egen total_mini=total(mini)

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==1
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5


sort persnr year
*they are deflated
bysort persnr: egen sum_full=total(total_full)
bysort persnr: egen sum_part=total(total_part)
bysort persnr: egen sum_mini=total(total_mini)
*
bysort persnr: egen sum_full_days=total(total_full_days)
bysort persnr: egen sum_part_days=total(total_part_days)
bysort persnr: egen sum_mini_days=total(total_mini_days)
*
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
bysort persnr: gen share_full=(sum_full)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_part=(sum_part)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_mini=(sum_mini)/(sum_full+sum_part+sum_mini)
*
bysort persnr: gen share_full_days=(sum_full_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_part_days=(sum_part_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_mini_days=(sum_mini_days)/(sum_full_days+sum_part_days+sum_mini_days)

*** Keep

keep year share*

display `i'

saveold "/bonke_`i'_5years_female_full_shares.dta", replace

restore

}

*


*part

clear
set more off

*
*set memory 16g
*use "/Preliminars_monthly.dta", clear
use "\Preliminars_monthly.dta", replace
cd ""
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

***create % full part mini 5 years ahead

gen full=1 if empstate==1
gen part=1 if empstate==2
gen mini=1 if empstate==3
*
gen days_full=30 if empstate==1
gen days_part=30 if empstate==2
gen days_mini=30 if empstate==3
*
bysort persnr year: egen total_full_days=total(days_full)
bysort persnr year: egen total_part_days=total(days_part)
bysort persnr year: egen total_mini_days=total(days_mini)
*
bysort persnr year: egen total_full=total(full)
bysort persnr year: egen total_part=total(part)
bysort persnr year: egen total_mini=total(mini)

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==2
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

sort persnr year
*they are deflated
bysort persnr: egen sum_full=total(total_full)
bysort persnr: egen sum_part=total(total_part)
bysort persnr: egen sum_mini=total(total_mini)
*
bysort persnr: egen sum_full_days=total(total_full_days)
bysort persnr: egen sum_part_days=total(total_part_days)
bysort persnr: egen sum_mini_days=total(total_mini_days)
*
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
bysort persnr: gen share_full=(sum_full)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_part=(sum_part)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_mini=(sum_mini)/(sum_full+sum_part+sum_mini)
*
bysort persnr: gen share_full_days=(sum_full_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_part_days=(sum_part_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_mini_days=(sum_mini_days)/(sum_full_days+sum_part_days+sum_mini_days)

*** Keep

keep year share*

display `i'

saveold "/bonke_`i'_5years_female_part_shares.dta", replace

restore

}

*
*


*mini

clear
set more off

*
*set memory 16g
use "/Preliminars_monthly.dta", clear
cd ""
*ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

***create % full part mini 5 years ahead

gen full=1 if empstate==1
gen part=1 if empstate==2
gen mini=1 if empstate==3
*
gen days_full=30 if empstate==1
gen days_part=30 if empstate==2
gen days_mini=30 if empstate==3
*
bysort persnr year: egen total_full_days=total(days_full)
bysort persnr year: egen total_part_days=total(days_part)
bysort persnr year: egen total_mini_days=total(days_mini)
*
bysort persnr year: egen total_full=total(full)
bysort persnr year: egen total_part=total(part)
bysort persnr year: egen total_mini=total(mini)

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==3
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & year>=`i'

*this is to keep observations of workers with consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

sort persnr year
*they are deflated
bysort persnr: egen sum_full=total(total_full)
bysort persnr: egen sum_part=total(total_part)
bysort persnr: egen sum_mini=total(total_mini)
*
bysort persnr: egen sum_full_days=total(total_full_days)
bysort persnr: egen sum_part_days=total(total_part_days)
bysort persnr: egen sum_mini_days=total(total_mini_days)
*
by persnr: gen index_work=_n  if diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
bysort persnr: gen share_full=(sum_full)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_part=(sum_part)/(sum_full+sum_part+sum_mini)
bysort persnr: gen share_mini=(sum_mini)/(sum_full+sum_part+sum_mini)
*
bysort persnr: gen share_full_days=(sum_full_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_part_days=(sum_part_days)/(sum_full_days+sum_part_days+sum_mini_days)
bysort persnr: gen share_mini_days=(sum_mini_days)/(sum_full_days+sum_part_days+sum_mini_days)

*** Keep

keep year share*

display `i'

saveold "/bonke_`i'_5years_female_mini_shares.dta", replace

restore

}

*

