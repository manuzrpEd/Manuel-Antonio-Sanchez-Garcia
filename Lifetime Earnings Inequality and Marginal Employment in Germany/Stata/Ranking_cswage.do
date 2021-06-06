*Ranking

clear
set more off

forval j=1/5 {

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & form==1
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
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5


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

keep year gini* var* p* mean* log* educ* age* year_birth* region requirement

display `i'

saveold "\bonke_`i'_cswage_unc_full_r`j'.dta", replace

restore

}

*


*part

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & form==2
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
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

keep year gini* var* p* mean* log* educ* age* year_birth* region requirement


display `i'

saveold "\bonke_`i'_cswage_unc_part_r`j'.dta", replace

restore

}

*


*mini

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & form==3
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
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

keep year gini* var* p* mean* log* educ* age* year_birth* region requirement


display `i'

saveold "\bonke_`i'_cswage_unc_mini_r`j'.dta", replace

restore

}
*

*full

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & form==1
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
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

keep year gini* var* p* mean* log* educ* age* year_birth* region requirement


display `i'

saveold "\bonke_`i'_cswage_male_full_r`j'.dta", replace

restore

}

*


*part

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & form==2
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
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

keep year gini* var* p* mean* log* educ* age* year_birth* region requirement


display `i'

saveold "\bonke_`i'_cswage_male_part_r`j'.dta", replace

restore

}

*


*mini

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & form==3
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
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

keep year gini* var* p* mean* log* educ* age* year_birth* region requirement

display `i'

saveold "\bonke_`i'_cswage_male_mini_r`j'.dta", replace

restore

}
*

*full

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & form==1
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
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

keep year gini* var* p* mean* log* educ* age* year_birth* region requirement


display `i'

saveold "\bonke_`i'_cswage_female_full_r`j'.dta", replace

restore

}

*


*part

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & form==2
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
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

keep year gini* var* p* mean* log* educ* age* year_birth* region requirement

display `i'

saveold "\bonke_`i'_cswage_female_part_r`j'.dta", replace

restore

}

*


*mini

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & form==3
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
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

keep year gini* var* p* mean* log* educ* age* year_birth* region requirement

display `i'

saveold "\bonke_`i'_cswage_female_mini_r`j'.dta", replace

restore

}
*


*Shares



*** Fraction of Full/Part/Mini Time Spells

*full

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

***create % full part mini 5 years ahead

gen full=1 if form==1
gen part=1 if form==2
gen mini=1 if form==3
*
gen days_full=days_epi if form==1
gen days_part=days_epi if form==2
gen days_mini=days_epi if form==3
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
qui gen begin_`i'=1 if year==`i' & form==1
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
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

saveold "\bonke_`i'_cswage_unc_full_shares_r`j'.dta", replace

restore

}

*


*part

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

***create % full part mini 5 years ahead

gen full=1 if form==1
gen part=1 if form==2
gen mini=1 if form==3
*
gen days_full=days_epi if form==1
gen days_part=days_epi if form==2
gen days_mini=days_epi if form==3
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
qui gen begin_`i'=1 if year==`i' & form==2
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
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

saveold "\bonke_`i'_cswage_unc_part_shares_r`j'.dta", replace

restore

}

*
*


*mini

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

***create % full part mini 5 years ahead

gen full=1 if form==1
gen part=1 if form==2
gen mini=1 if form==3
*
gen days_full=days_epi if form==1
gen days_part=days_epi if form==2
gen days_mini=days_epi if form==3
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
qui gen begin_`i'=1 if year==`i' & form==3
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
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

saveold "\bonke_`i'_cswage_unc_mini_shares_r`j'.dta", replace

restore

}

*



*** Fraction of Full/Part/Mini Time Spells Males

*full

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

***create % full part mini 5 years ahead

gen full=1 if form==1
gen part=1 if form==2
gen mini=1 if form==3
*
gen days_full=days_epi if form==1
gen days_part=days_epi if form==2
gen days_mini=days_epi if form==3
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
qui gen begin_`i'=1 if year==`i' & form==1
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
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

saveold "\bonke_`i'_cswage_male_full_shares_r`j'.dta", replace

restore

}

*


*part

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

***create % full part mini 5 years ahead

gen full=1 if form==1
gen part=1 if form==2
gen mini=1 if form==3
*
gen days_full=days_epi if form==1
gen days_part=days_epi if form==2
gen days_mini=days_epi if form==3
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
qui gen begin_`i'=1 if year==`i' & form==2
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
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

saveold "\bonke_`i'_cswage_male_part_shares_r`j'.dta", replace

restore

}

*
*


*mini

clear
set more off

*
*set memory 16g
use "\Codes\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

***create % full part mini 5 years ahead

gen full=1 if form==1
gen part=1 if form==2
gen mini=1 if form==3
*
gen days_full=days_epi if form==1
gen days_part=days_epi if form==2
gen days_mini=days_epi if form==3
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
qui gen begin_`i'=1 if year==`i' & form==3
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
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

saveold "\bonke_`i'_cswage_male_mini_shares_r`j'.dta", replace

restore

}

*


*** Fraction of Full/Part/Mini Time Spells  Females

*full

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

***create % full part mini 5 years ahead

gen full=1 if form==1
gen part=1 if form==2
gen mini=1 if form==3
*
gen days_full=days_epi if form==1
gen days_part=days_epi if form==2
gen days_mini=days_epi if form==3
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
qui gen begin_`i'=1 if year==`i' & form==1
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
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

saveold "\bonke_`i'_cswage_female_full_shares_r`j'.dta", replace

restore

}

*


*part

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

***create % full part mini 5 years ahead

gen full=1 if form==1
gen part=1 if form==2
gen mini=1 if form==3
*
gen days_full=days_epi if form==1
gen days_part=days_epi if form==2
gen days_mini=days_epi if form==3
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
qui gen begin_`i'=1 if year==`i' & form==2
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
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

saveold "\bonke_`i'_cswage_female_part_shares_r`j'.dta", replace

restore

}

*
*


*mini

clear
set more off

*
*set memory 16g
use "\Preliminars.dta", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

***create % full part mini 5 years ahead

gen full=1 if form==1
gen part=1 if form==2
gen mini=1 if form==3
*
gen days_full=days_epi if form==1
gen days_part=days_epi if form==2
gen days_mini=days_epi if form==3
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
qui gen begin_`i'=1 if year==`i' & form==3
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
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(def_daily_wage), p(20)
egen perce40=pctile(def_daily_wage), p(40)
egen perce60=pctile(def_daily_wage), p(60)
egen perce80=pctile(def_daily_wage), p(80)

drop if def_daily_wage>perce20 & `j'==1

drop if def_daily_wage>perce40 & `j'==2
drop if def_daily_wage<perce20 & `j'==2

drop if def_daily_wage>perce60 & `j'==3
drop if def_daily_wage<perce40 & `j'==3

drop if def_daily_wage>perce80 & `j'==4
drop if def_daily_wage<perce60 & `j'==4

drop if def_daily_wage<perce80 & `j'==5

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

saveold "\bonke_`i'_cswage_female_mini_shares_r`j'.dta", replace

restore

}

*



}
*
