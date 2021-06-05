*
clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
cd ""
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

forval i=22(5)52 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*
qui gen begin_`i'=1 if age==`i'
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & age>=`i'

*this is for consecutive earnings
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
qui ge kurt_lt_work = .
qui ge p85_lt_work = .
qui ge p15_lt_work = .
qui gen p85_p15_lt_work_`i' = .

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*the below is to jump no observations errors
levels year, local(reg)
*capture {
foreach r of local reg {
qui fastgini sum_earnings_long_term_work if year == `r'
replace gini_lt_work_`i' = r(gini) if year == `r'
egen sd=sd(log_sum_earnings_long_term_work) if year == `r'
egen kurt=kurt(log_sum_earnings_long_term_work) if year == `r'
replace var_lt_work_`i'=sd if year == `r'
replace kurt_lt_work=kurt if year == `r'
egen p85 = pctile(sum_earnings_long_term_work) if year == `r'  , p(85)
egen p15 = pctile(sum_earnings_long_term_work) if year == `r'  , p(15)
replace p15_lt_work=p15 if year == `r'
replace p85_lt_work=p85 if year == `r' 
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work if year == `r'
drop sd kurt p85 p15
}
*}

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year gini* var* kurt* p*

display `i'

saveold "\bonke_99_lt_`i'_unc.dta", replace

restore

}
*
