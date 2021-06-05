clear
set more off
*set memory 16g
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*use "/panfs/panasas01/efim/ms15072/Preliminars.dta", clear
ssc install fastgini

keep if female==0

*** Cross Sectional Gini on Long Term Earnings

qui drop if age<24
qui drop if age>55

forval i=24(5)44 {

preserve

qui gen begin_`i'=1 if age==`i'
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & age>=`i'
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<10
*the above ensures I keep 10 years at least

qui ge gini_lt_work_`i' = .
qui ge var_lt_work_`i' = .
qui ge kurt_lt_work = .
qui ge p85_lt_work = .
qui ge p15_lt_work = .
qui gen p85_p15_lt_work_`i' = .

sort persnr year
bysort persnr: egen sum_earnings_long_term_work=sum(earnings_year)  if source==1 & diff_year_g<11
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<11

*the below is to jump no observations errors
levels year, local(reg)
capture {
foreach r of local reg {
qui fastgini sum_earnings_long_term_work if index_work == 1 & year == `r'
replace gini_lt_work_`i' = r(gini) if year == `r'  &  source==1 & diff_year_g<11
egen sd=sd(log_sum_earnings_long_term_work) if index_work == 1 & year == `r'
egen kurt=kurt(log_sum_earnings_long_term_work) if index_work == 1 & year == `r'
replace var_lt_work_`i'=sd if index_work == 1 & year == `r'
replace kurt_lt_work=kurt if index_work == 1 & year == `r'
egen p85 = pctile(sum_earnings_long_term_work) if year == `r' & index_work == 1  , p(85)
egen p15 = pctile(sum_earnings_long_term_work) if year == `r' & index_work == 1  , p(15)
replace p15_lt_work=p15 if year == `r' & index_work==1 
replace p85_lt_work=p85 if year == `r' & index_work==1 
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work if year == `r' & index_work==1 
drop sd kurt p85 p15
}
}

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year gini* var* kurt* p*

saveold "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_`i'.dta", replace

restore

}

*










clear
set more off
*set memory 16g
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta", clear
ssc install fastgini

keep if female==0

*** Cross Sectional Gini on Long Term Earnings

qui drop if age<24
qui drop if age>55
*this is to keep those that are in the sample starting at age 24...
*gen begin=1 if age==24
*bysort persn: egen sum_begin=sum(begin)
*bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
*keep if ind_begin==1

*qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
*drop if max_diff_year_g<15

levels year, local(reg)
qui ge gini_cs_work = .
qui ge gini_cs_full = .
qui ge gini_cs_part = .
qui ge gini_cs_mini = .
qui ge var_cs_full = .
qui ge var_cs_part = .
qui ge var_cs_mini = .
qui ge var_cs_work = .
qui ge kurt_cs_work = .
qui ge p85_cs_work = .
qui ge p15_cs_work = .
qui ge p85_cs_full = .
qui ge p15_cs_full = .
qui ge p85_cs_part = .
qui ge p15_cs_part = .
qui ge p85_cs_mini = .
qui ge p15_cs_mini = .
qui gen p85_p15_cs_full = .
qui gen p85_p15_cs_mini = .
qui gen p85_p15_cs_part = .
qui ge p50_cs_work = .
qui gen p85_p15_cs_work = .
qui gen p85_p50_cs_work = .
qui gen p50_p15_cs_work = .
foreach r of local reg {
qui fastgini earnings_year_work if year == `r' & source==1  
replace gini_cs_work = r(gini) if year == `r' & source==1  
qui fastgini earnings_year_full if year == `r' & form==1  
replace gini_cs_full = r(gini) if year == `r' & form==1  
qui fastgini earnings_year_part if year == `r' & form==2  
replace gini_cs_part = r(gini) if year == `r' & form==2  
egen sd=sd(log_earnings_year_work) if year == `r' & source==1  
egen sd_full=sd(log_earnings_year_full) if year == `r' & form==1
egen sd_part=sd(log_earnings_year_part) if year == `r' & form==2
egen kurt=kurt(log_earnings_year_work) if year == `r' & source==1  
replace var_cs_full=sd_full if year == `r' & form==1 
replace var_cs_part=sd_part if year == `r' & form==2 
replace var_cs_work=sd if year == `r' & source==1  
replace kurt_cs_work=kurt if year == `r' & source==1  
egen p85 = pctile(earnings_year_work) if year == `r' & source==1  , p(85)
egen p50 = pctile(earnings_year_work) if year == `r' & source==1  , p(50)
egen p15 = pctile(earnings_year_work) if year == `r' & source==1  , p(15)
egen p85_full = pctile(earnings_year_full) if year == `r' & form==1  , p(85)
egen p15_full = pctile(earnings_year_full) if year == `r' & form==1  , p(15)
egen p85_part = pctile(earnings_year_part) if year == `r' & form==2  , p(85)
egen p15_part = pctile(earnings_year_part) if year == `r' & form==2  , p(15)
replace p85_cs_full=p85_full if year == `r' & form==1  
replace p15_cs_full=p15_full if year == `r' & form==1 
replace p85_cs_part=p85_part if year == `r' & form==2  
replace p15_cs_part=p15_part if year == `r' & form==2 
replace p85_cs_work=p85 if year == `r' & source==1  
replace p50_cs_work=p50 if year == `r' & source==1  
replace p15_cs_work=p15 if year == `r' & source==1  
replace p85_p15_cs_full=p85_full/p15_full if year == `r' & form==1  
replace p85_p15_cs_part=p85_part/p15_part if year == `r' & form==2  
replace p85_p15_cs_work=p85/p15 if year == `r' & source==1  
replace p50_p15_cs_work=p50/p15 if year == `r' & source==1  
replace p85_p50_cs_work=p85/p50 if year == `r' & source==1  
drop sd kurt p85 p50 p15 p85_full p85_part p15_full p15_part sd_full sd_part
}

forval r=1999/2014 {
qui fastgini earnings_year_mini if year == `r' & form==3
replace gini_cs_mini = r(gini) if year == `r' & form==3
egen sd_mini=sd(log_earnings_year_mini) if year == `r' & form==3
replace var_cs_mini=sd_mini if year == `r' & form==3 
egen p85_mini = pctile(earnings_year_mini) if year == `r' & form==3  , p(85)
egen p15_mini = pctile(earnings_year_mini) if year == `r' & form==3  , p(15)
replace p85_cs_mini=p85_mini if year == `r' & form==3  
replace p15_cs_mini=p15_mini if year == `r' & form==3  
replace p85_p15_cs_mini=p85_mini/p15_mini if year == `r' & form==3 
drop p85_mini p15_mini sd_mini
}

replace var_cs_work=var_cs_work^2
replace var_cs_mini=var_cs_mini^2
replace var_cs_part=var_cs_part^2
replace var_cs_full=var_cs_full^2



*** Keep

keep year gini* var* kurt* p* form

saveold "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_cs.dta", replace

*



*** FEMALES


clear
set more off
*set memory 16g
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta", clear
ssc install fastgini

keep if female==1

*** Cross Sectional Gini on Long Term Earnings

qui drop if age<24
qui drop if age>55

forval i=24(5)44 {

preserve

qui gen begin_`i'=1 if age==`i'
bysort persn: egen sum_begin=sum(begin_`i')
bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & age>=`i'
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<10
*the above ensures I keep 10 years at least

qui ge gini_lt_work_`i' = .
qui ge var_lt_work_`i' = .
qui ge kurt_lt_work = .
qui ge p85_lt_work = .
qui ge p15_lt_work = .
qui gen p85_p15_lt_work_`i' = .

sort persnr year
bysort persnr: egen sum_earnings_long_term_work=sum(earnings_year)  if source==1 & diff_year_g<11
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<11

*the below is to jump no observations errors
levels year, local(reg)
capture {
foreach r of local reg {
qui fastgini sum_earnings_long_term_work if index_work == 1 & year == `r'
replace gini_lt_work_`i' = r(gini) if year == `r'  &  source==1 & diff_year_g<11
egen sd=sd(log_sum_earnings_long_term_work) if index_work == 1 & year == `r'
egen kurt=kurt(log_sum_earnings_long_term_work) if index_work == 1 & year == `r'
replace var_lt_work_`i'=sd if index_work == 1 & year == `r'
replace kurt_lt_work=kurt if index_work == 1 & year == `r'
egen p85 = pctile(sum_earnings_long_term_work) if year == `r' & index_work == 1  , p(85)
egen p15 = pctile(sum_earnings_long_term_work) if year == `r' & index_work == 1  , p(15)
replace p15_lt_work=p15 if year == `r' & index_work==1 
replace p85_lt_work=p85 if year == `r' & index_work==1 
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work if year == `r' & index_work==1 
drop sd kurt p85 p15
}
}

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year gini* var* kurt* p*

saveold "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_`i'_fem.dta", replace

restore

}

*





clear
set more off
*set memory 16g
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta", clear
ssc install fastgini

keep if female==1

*** Cross Sectional Gini on Long Term Earnings

qui drop if age<24
qui drop if age>55
*gen begin=1 if age==24
*bysort persn: egen sum_begin=sum(begin)
*bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
*keep if ind_begin==1

qui gen reason_perm=1 if reason_notif==0 | reason_notif==6
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
*drop if max_diff_year_g<15

levels year, local(reg)
qui ge gini_cs_work = .
qui ge var_cs_work = .
qui ge gini_cs_full = .
qui ge gini_cs_part = .
qui ge gini_cs_mini = .
qui ge var_cs_full = .
qui ge var_cs_part = .
qui ge var_cs_mini = .
qui ge kurt_cs_work = .
qui ge p85_cs_full = .
qui ge p15_cs_full = .
qui ge p85_cs_part = .
qui ge p15_cs_part = .
qui ge p85_cs_mini = .
qui ge p15_cs_mini = .
qui gen p85_p15_cs_full = .
qui gen p85_p15_cs_mini = .
qui gen p85_p15_cs_part = .
qui ge p85_cs_work = .
qui ge p15_cs_work = .
qui ge p50_cs_work = .
qui gen p85_p15_cs_work = .
qui gen p85_p50_cs_work = .
qui gen p50_p15_cs_work = .
foreach r of local reg {
qui fastgini earnings_year_work if year == `r' & source==1  
replace gini_cs_work = r(gini) if year == `r' & source==1  
qui fastgini earnings_year_full if year == `r' & form==1  
replace gini_cs_full = r(gini) if year == `r' & form==1  
qui fastgini earnings_year_part if year == `r' & form==2  
replace gini_cs_part = r(gini) if year == `r' & form==2  
egen sd=sd(log_earnings_year_work) if year == `r' & source==1  
egen sd_full=sd(log_earnings_year_full) if year == `r' & form==1
egen sd_part=sd(log_earnings_year_part) if year == `r' & form==2
egen kurt=kurt(log_earnings_year_work) if year == `r' & source==1  
replace var_cs_full=sd_full if year == `r' & form==1 
replace var_cs_part=sd_part if year == `r' & form==2 
replace var_cs_work=sd if year == `r' & source==1  
replace kurt_cs_work=kurt if year == `r' & source==1  
egen p85 = pctile(earnings_year_work) if year == `r' & source==1  , p(85)
egen p50 = pctile(earnings_year_work) if year == `r' & source==1  , p(50)
egen p15 = pctile(earnings_year_work) if year == `r' & source==1  , p(15)
egen p85_full = pctile(earnings_year_full) if year == `r' & form==1  , p(85)
egen p15_full = pctile(earnings_year_full) if year == `r' & form==1  , p(15)
egen p85_part = pctile(earnings_year_part) if year == `r' & form==2  , p(85)
egen p15_part = pctile(earnings_year_part) if year == `r' & form==2  , p(15)
replace p85_cs_full=p85_full if year == `r' & form==1  
replace p15_cs_full=p15_full if year == `r' & form==1 
replace p85_cs_part=p85_part if year == `r' & form==2  
replace p15_cs_part=p15_part if year == `r' & form==2 
replace p85_cs_work=p85 if year == `r' & source==1  
replace p50_cs_work=p50 if year == `r' & source==1  
replace p15_cs_work=p15 if year == `r' & source==1  
replace p85_p15_cs_full=p85_full/p15_full if year == `r' & form==1  
replace p85_p15_cs_part=p85_part/p15_part if year == `r' & form==2  
replace p85_p15_cs_work=p85/p15 if year == `r' & source==1  
replace p50_p15_cs_work=p50/p15 if year == `r' & source==1  
replace p85_p50_cs_work=p85/p50 if year == `r' & source==1  
drop sd kurt p85 p50 p15 p85_full p85_part p15_full p15_part sd_full sd_part
}

forval r=1999/2014 {
qui fastgini earnings_year_mini if year == `r' & form==3
replace gini_cs_mini = r(gini) if year == `r' & form==3
egen sd_mini=sd(log_earnings_year_mini) if year == `r' & form==3
replace var_cs_mini=sd_mini if year == `r' & form==3 
egen p85_mini = pctile(earnings_year_mini) if year == `r' & form==3  , p(85)
egen p15_mini = pctile(earnings_year_mini) if year == `r' & form==3  , p(15)
replace p85_cs_mini=p85_mini if year == `r' & form==3  
replace p15_cs_mini=p15_mini if year == `r' & form==3  
replace p85_p15_cs_mini=p85_mini/p15_mini if year == `r' & form==3 
drop p85_mini p15_mini sd_mini
}

replace var_cs_work=var_cs_work^2
replace var_cs_mini=var_cs_mini^2
replace var_cs_part=var_cs_part^2
replace var_cs_full=var_cs_full^2



*** Keep

keep year gini* var* kurt* p* form

saveold "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_cs_fem.dta", replace

do job_mobility.do

*
