/*
cls
clear
set more off

*
*set memory 16g
use "\Preliminars",clear
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
replace var_lt_work_`i'=sd if year == `r'
egen p85 = pctile(sum_earnings_long_term_work) if year == `r'  , p(85)
egen p15 = pctile(sum_earnings_long_term_work) if year == `r'  , p(15)
replace p15_lt_work=p15 if year == `r'
replace p85_lt_work=p85 if year == `r' 
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work if year == `r'
drop sd p85 p15
}
*}

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year gini* var* p* age educ sum_earnings_long_term_work log_sum_earnings_long_term_work

display `i'

save bonke_99_lt_`i'_unc.dta, replace

restore

}

*

use bonke_99_lt_22_unc.dta, clear
forval i=27(5)52 {
append using bonke_99_lt_`i'_unc.dta
}
*
label variable gini_lt_work_22 "22"
label variable var_lt_work_22 "22"
label variable p85_p15_lt_work_22 "22"
label variable gini_lt_work_27 "27"
label variable var_lt_work_27 "27"
label variable p85_p15_lt_work_27 "27"
*
label variable gini_lt_work_32 "32"
label variable var_lt_work_32 "32"
label variable p85_p15_lt_work_32 "32"
label variable gini_lt_work_37 "37"
label variable var_lt_work_37 "37"
label variable p85_p15_lt_work_37 "37"
*
label variable gini_lt_work_42 "42"
label variable var_lt_work_42 "42"
label variable p85_p15_lt_work_42 "42"
label variable gini_lt_work_47 "47"
label variable var_lt_work_47 "47"
label variable p85_p15_lt_work_47 "47"
*
label variable gini_lt_work_52 "52"
label variable var_lt_work_52 "52"
label variable p85_p15_lt_work_52 "52"

sort year

***Gini Coefficients:
quietly twoway line var_lt_work_22 var_lt_work_27 var_lt_work_32 var_lt_work_37 var_lt_work_42 var_lt_work_47 var_lt_work_52 year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_99_lt_unc.png, replace

forval i=22(5)52 {
*
gen u_mincer_`i'=.
foreach r of local reg {
xi: reg log_sum_earnings_long_term_work i.educ  if year == `r' & age==`i'
predict y1 if year == `r', xb 
replace u_mincer_`i'=log_sum_earnings_long_term_work-y1 if year == `r' & age==`i'
drop y1
}
*
bysort year: egen sd_mincer_`i'=sd(u_mincer_`i')
}
*

gen var_mincer_22=sd_mincer_22^2
gen var_mincer_27=sd_mincer_27^2
gen var_mincer_32=sd_mincer_32^2
gen var_mincer_37=sd_mincer_37^2
gen var_mincer_42=sd_mincer_42^2
gen var_mincer_47=sd_mincer_47^2
gen var_mincer_52=sd_mincer_52^2

label variable var_mincer_52 "52"
label variable var_mincer_42 "42"
label variable var_mincer_32 "32"
label variable var_mincer_22 "22"
label variable var_mincer_27 "27"
label variable var_mincer_37 "37"
label variable var_mincer_47 "47"

*
quietly twoway line var_mincer_22 var_mincer_27 var_mincer_32 var_mincer_37 var_mincer_42 var_mincer_47 var_mincer_52 year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_99_lt_unc_resid.png, replace

** Males

*
cls
clear
set more off

*
*set memory 16g
use "\Preliminars",clear
cd ""
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==0

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
replace var_lt_work_`i'=sd if year == `r'
egen p85 = pctile(sum_earnings_long_term_work) if year == `r'  , p(85)
egen p15 = pctile(sum_earnings_long_term_work) if year == `r'  , p(15)
replace p15_lt_work=p15 if year == `r'
replace p85_lt_work=p85 if year == `r' 
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work if year == `r'
drop sd p85 p15
}
*}

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year gini* var* p* age educ sum_earnings_long_term_work log_sum_earnings_long_term_work

display `i'

save bonke_99_lt_`i'_unc.dta, replace

restore

}

*

use bonke_99_lt_22_unc.dta, clear
forval i=27(5)52 {
append using bonke_99_lt_`i'_unc.dta
}
*
label variable gini_lt_work_22 "22"
label variable var_lt_work_22 "22"
label variable p85_p15_lt_work_22 "22"
label variable gini_lt_work_27 "27"
label variable var_lt_work_27 "27"
label variable p85_p15_lt_work_27 "27"
*
label variable gini_lt_work_32 "32"
label variable var_lt_work_32 "32"
label variable p85_p15_lt_work_32 "32"
label variable gini_lt_work_37 "37"
label variable var_lt_work_37 "37"
label variable p85_p15_lt_work_37 "37"
*
label variable gini_lt_work_42 "42"
label variable var_lt_work_42 "42"
label variable p85_p15_lt_work_42 "42"
label variable gini_lt_work_47 "47"
label variable var_lt_work_47 "47"
label variable p85_p15_lt_work_47 "47"
*
label variable gini_lt_work_52 "52"
label variable var_lt_work_52 "52"
label variable p85_p15_lt_work_52 "52"

sort year

***Gini Coefficients:
quietly twoway line var_lt_work_22 var_lt_work_27 var_lt_work_32 var_lt_work_37 var_lt_work_42 var_lt_work_47 var_lt_work_52 year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_99_lt_male.png, replace

forval i=22(5)52 {
*
gen u_mincer_`i'=.
foreach r of local reg {
xi: reg log_sum_earnings_long_term_work i.educ  if year == `r' & age==`i'
predict y1 if year == `r', xb 
replace u_mincer_`i'=log_sum_earnings_long_term_work-y1 if year == `r' & age==`i'
drop y1
}
*
bysort year: egen sd_mincer_`i'=sd(u_mincer_`i')
}
*

gen var_mincer_22=sd_mincer_22^2
gen var_mincer_27=sd_mincer_27^2
gen var_mincer_32=sd_mincer_32^2
gen var_mincer_37=sd_mincer_37^2
gen var_mincer_42=sd_mincer_42^2
gen var_mincer_47=sd_mincer_47^2
gen var_mincer_52=sd_mincer_52^2

label variable var_mincer_52 "52"
label variable var_mincer_42 "42"
label variable var_mincer_32 "32"
label variable var_mincer_22 "22"
label variable var_mincer_27 "27"
label variable var_mincer_37 "37"
label variable var_mincer_47 "47"

*
quietly twoway line var_mincer_22 var_mincer_27 var_mincer_32 var_mincer_37 var_mincer_42 var_mincer_47 var_mincer_52 year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_99_lt_male_resid.png, replace

** Females

*
cls
clear
set more off

*
*set memory 16g
use "\Preliminars",clear
cd ""
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

keep if female==1

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
replace var_lt_work_`i'=sd if year == `r'
egen p85 = pctile(sum_earnings_long_term_work) if year == `r'  , p(85)
egen p15 = pctile(sum_earnings_long_term_work) if year == `r'  , p(15)
replace p15_lt_work=p15 if year == `r'
replace p85_lt_work=p85 if year == `r' 
replace p85_p15_lt_work_`i'=p85_lt_work/p15_lt_work if year == `r'
drop sd p85 p15
}
*}

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year gini* var* p* age educ sum_earnings_long_term_work log_sum_earnings_long_term_work

display `i'

save bonke_99_lt_`i'_unc.dta, replace

restore

}

*

use bonke_99_lt_22_unc.dta, clear
forval i=27(5)52 {
append using bonke_99_lt_`i'_unc.dta
}
*
label variable gini_lt_work_22 "22"
label variable var_lt_work_22 "22"
label variable p85_p15_lt_work_22 "22"
label variable gini_lt_work_27 "27"
label variable var_lt_work_27 "27"
label variable p85_p15_lt_work_27 "27"
*
label variable gini_lt_work_32 "32"
label variable var_lt_work_32 "32"
label variable p85_p15_lt_work_32 "32"
label variable gini_lt_work_37 "37"
label variable var_lt_work_37 "37"
label variable p85_p15_lt_work_37 "37"
*
label variable gini_lt_work_42 "42"
label variable var_lt_work_42 "42"
label variable p85_p15_lt_work_42 "42"
label variable gini_lt_work_47 "47"
label variable var_lt_work_47 "47"
label variable p85_p15_lt_work_47 "47"
*
label variable gini_lt_work_52 "52"
label variable var_lt_work_52 "52"
label variable p85_p15_lt_work_52 "52"

sort year

***Gini Coefficients:
quietly twoway line var_lt_work_22 var_lt_work_27 var_lt_work_32 var_lt_work_37 var_lt_work_42 var_lt_work_47 var_lt_work_52 year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_99_lt_female.png, replace

forval i=22(5)52 {
*
gen u_mincer_`i'=.
foreach r of local reg {
xi: reg log_sum_earnings_long_term_work i.educ  if year == `r' & age==`i'
predict y1 if year == `r', xb 
replace u_mincer_`i'=log_sum_earnings_long_term_work-y1 if year == `r' & age==`i'
drop y1
}
*
bysort year: egen sd_mincer_`i'=sd(u_mincer_`i')
}
*

gen var_mincer_22=sd_mincer_22^2
gen var_mincer_27=sd_mincer_27^2
gen var_mincer_32=sd_mincer_32^2
gen var_mincer_37=sd_mincer_37^2
gen var_mincer_42=sd_mincer_42^2
gen var_mincer_47=sd_mincer_47^2
gen var_mincer_52=sd_mincer_52^2

label variable var_mincer_52 "52"
label variable var_mincer_42 "42"
label variable var_mincer_32 "32"
label variable var_mincer_22 "22"
label variable var_mincer_27 "27"
label variable var_mincer_37 "37"
label variable var_mincer_47 "47"

*
quietly twoway line var_mincer_22 var_mincer_27 var_mincer_32 var_mincer_37 var_mincer_42 var_mincer_47 var_mincer_52 year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_99_lt_female_resid.png, replace
