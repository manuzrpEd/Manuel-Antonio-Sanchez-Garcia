*CS:

 cls
 set more off
 
 ***Unemployment
 
 *Unconditional
 
 use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_cs99_unc_unemp",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

rename share_sum_unemp share 

label variable share "% Months Unemp."

quietly twoway line share year, ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large) angle(45)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.01) 0.1, labsize(large) angle(horizontal))
graph export share_sum_unemp_cs75_5years_unc.png, replace 

 use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_cs99_male_unemp",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

rename share_sum_unemp share 

label variable share "% Months Unemp."

quietly twoway line share year, ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large) angle(45)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.01) 0.1, labsize(large) angle(horizontal))
graph export share_sum_unemp_cs75_5years_male.png, replace 

 use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_cs99_fem_unemp",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

rename share_sum_unemp share 

label variable share "% Months Unemp."

quietly twoway line share year, ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large) angle(45)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.01) 0.1, labsize(large) angle(horizontal))
graph export share_sum_unemp_cs75_5years_fem.png, replace 

***99on

*CS:

 cls
 set more off
 
 ***Unemployment
 
 *Unconditional
 
 use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_cs99_unc_unemp",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

rename share_sum_unemp share 

label variable share "% Months Unemp."

quietly twoway line share year if year>=1999, ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.01) 0.1, labsize(large) angle(horizontal))
graph export share_sum_unemp_cs99_5years_unc.png, replace 

 use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_cs99_male_unemp",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

rename share_sum_unemp share 

label variable share "% Months Unemp."

quietly twoway line share year if year>=1999, ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.01) 0.1, labsize(large) angle(horizontal))
graph export share_sum_unemp_cs99_5years_male.png, replace 

 use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_cs99_fem_unemp",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

rename share_sum_unemp share 

label variable share "% Months Unemp."

quietly twoway line share year if year>=1999, ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.01) 0.1, labsize(large) angle(horizontal))
graph export share_sum_unemp_cs99_5years_fem.png, replace 
 
 
 
 
 
 cls
 set more off
 
 ***Unemployment
 
 *Unconditional
 
 use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_unemp",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

rename share_sum_unemp_1999 share 

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_unemp"
replace share=share_sum_unemp_`i' if year==`i'
drop share_sum_unemp_`i'
}

label variable share "% Months Unemp."

quietly twoway line share year, ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.01) 0.1, labsize(large) angle(horizontal))
graph export share_sum_unemp_1999_5years_unc.png, replace

***Male

 use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_unemp",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

rename share_sum_unemp_1999 share 

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_unemp"
replace share=share_sum_unemp_`i' if year==`i'
drop share_sum_unemp_`i'
}

label variable share "% Months Unemp."

quietly twoway line share year, ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.01) 0.1, labsize(large) angle(horizontal))
graph export share_sum_unemp_1999_5years_male.png, replace

**Female

 use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_fem_unemp",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

rename share_sum_unemp_1999 share 

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_fem_unemp"
replace share=share_sum_unemp_`i' if year==`i'
drop share_sum_unemp_`i'
}

label variable share "% Months Unemp."

quietly twoway line share year, ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.01) 0.1, labsize(large) angle(horizontal))
graph export share_sum_unemp_1999_5years_fem.png, replace

*** Unconditional

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_full",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_full"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_part"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_part"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_mini"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_mini"
replace var_lt_work_1999_mini=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_mini=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_mini=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_mini=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_mini=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_mini=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

bysort year: egen mean_full=mean(meanlog_earnings_long_term_full)
replace meanlog_earnings_long_term_full=mean_full
drop mean_full

bysort year: egen mean_part=mean(meanlog_earnings_long_term_part)
replace meanlog_earnings_long_term_part=mean_part
drop mean_part

bysort year: egen mean_mini=mean(meanlog_earnings_long_term_mini)
replace meanlog_earnings_long_term_mini=mean_mini
drop mean_mini

bysort year: egen mean_full=mean(meanlog_earnings_yearly_full)
replace meanlog_earnings_yearly_full=mean_full
drop mean_full

bysort year: egen mean_part=mean(meanlog_earnings_yearly_part)
replace meanlog_earnings_yearly_part=mean_part
drop mean_part

bysort year: egen mean_mini=mean(meanlog_earnings_yearly_mini)
replace meanlog_earnings_yearly_mini=mean_mini
drop mean_mini

bysort year: egen mean_var_full=mean(var_lt_work_1999_full)
replace var_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(gini_lt_work_1999_full)
replace gini_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(p85_p15_lt_work_1999_full)
replace p85_p15_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(p85_p15_yearly_work_1999_full)
replace p85_p15_yearly_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_part=mean(var_lt_work_1999_part)
replace var_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(gini_lt_work_1999_part)
replace gini_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(p85_p15_lt_work_1999_part)
replace p85_p15_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(p85_p15_yearly_work_1999_part)
replace p85_p15_yearly_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_mini=mean(var_lt_work_1999_mini)
replace var_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(gini_lt_work_1999_mini)
replace gini_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(p85_p15_lt_work_1999_mini)
replace p85_p15_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(p85_p15_yearly_work_1999_mini)
replace p85_p15_yearly_work_1999_mini=mean_var_mini
drop mean_var_mini

*bysort year: gen counter=_n if gini_lt_work!=.
*keep if counter==1

label variable meanlog_earnings_long_term_full "Full Time"
label variable meanlog_earnings_long_term_part "Part Time"
label variable meanlog_earnings_long_term_mini "Marg. Employment"
label variable meanlog_earnings_yearly_full "Full Time"
label variable meanlog_earnings_yearly_part "Part Time"
label variable meanlog_earnings_yearly_mini "Marg. Employment"
label variable gini_lt_work_1999_full "Full Time"
label variable var_lt_work_1999_full "Full Time"
label variable p85_p15_lt_work_1999_full "Full Time"
label variable p85_p15_yearly_work_1999_full "Full Time"
label variable gini_lt_work_1999_part "Part Time"
label variable var_lt_work_1999_part "Part Time"
label variable p85_p15_lt_work_1999_part "Part Time"
label variable p85_p15_yearly_work_1999_part "Part Time"
label variable gini_lt_work_1999_mini "Mini Jobs"
label variable var_lt_work_1999_mini "Mini Jobs"
label variable p85_p15_lt_work_1999_mini "Mini Jobs"
label variable p85_p15_yearly_work_1999_mini "Mini Jobs"

***Gini Coefficients:

quietly twoway line meanlog_earnings_long_term_full meanlog_earnings_long_term_part meanlog_earnings_long_term_mini year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc.png, replace

quietly twoway line meanlog_earnings_yearly_full meanlog_earnings_yearly_part meanlog_earnings_yearly_mini year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc.png, replace

quietly twoway line var_lt_work_1999_full var_lt_work_1999_part var_lt_work_1999_mini year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export var_work_1999_5years_unc.png, replace

quietly twoway line gini_lt_work_1999_full gini_lt_work_1999_part gini_lt_work_1999_mini year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export gini_work_1999_5years_unc.png, replace

quietly twoway line p85_p15_lt_work_1999_full p85_p15_lt_work_1999_part p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_unc.png, replace

quietly twoway line p85_p15_yearly_work_1999_full p85_p15_yearly_work_1999_part p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_unc.png, replace
*

quietly twoway line p85_p15_lt_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_unc_full.png, replace
quietly twoway line p85_p15_lt_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_unc_part.png, replace
quietly twoway line p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(4 (0.5) 8, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_unc_mini.png, replace

quietly twoway line p85_p15_yearly_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_unc_full.png, replace
quietly twoway line p85_p15_yearly_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_unc_part.png, replace
quietly twoway line p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(4 (0.5) 8, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_unc_mini.png, replace

quietly twoway line meanlog_earnings_long_term_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc_full.png, replace
quietly twoway line meanlog_earnings_long_term_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc_part.png, replace
quietly twoway line meanlog_earnings_long_term_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc_mini.png, replace

quietly twoway line meanlog_earnings_yearly_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc_full.png, replace
quietly twoway line meanlog_earnings_yearly_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc_part.png, replace
quietly twoway line meanlog_earnings_yearly_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc_mini.png, replace

sum p85_p15_lt_work_1999_mini if p85_p15_lt_work_1999_mini!=.
sum p85_p15_lt_work_1999_part if p85_p15_lt_work_1999_part!=.
sum p85_p15_lt_work_1999_full if p85_p15_lt_work_1999_full!=.

sum p85_p15_yearly_work_1999_mini if p85_p15_yearly_work_1999_mini!=.
sum p85_p15_yearly_work_1999_part if p85_p15_yearly_work_1999_part!=.
sum p85_p15_yearly_work_1999_full if p85_p15_yearly_work_1999_full!=.

***males

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_full",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full


forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_full"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_part"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_part"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_mini"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_mini"
replace var_lt_work_1999_mini=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_mini=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_mini=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_mini=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_mini=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_mini=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*
bysort year: egen mean_full=mean(meanlog_earnings_long_term_full)
replace meanlog_earnings_long_term_full=mean_full
drop mean_full

bysort year: egen mean_part=mean(meanlog_earnings_long_term_part)
replace meanlog_earnings_long_term_part=mean_part
drop mean_part

bysort year: egen mean_mini=mean(meanlog_earnings_long_term_mini)
replace meanlog_earnings_long_term_mini=mean_mini
drop mean_mini

bysort year: egen mean_full=mean(meanlog_earnings_yearly_full)
replace meanlog_earnings_yearly_full=mean_full
drop mean_full

bysort year: egen mean_part=mean(meanlog_earnings_yearly_part)
replace meanlog_earnings_yearly_part=mean_part
drop mean_part

bysort year: egen mean_mini=mean(meanlog_earnings_yearly_mini)
replace meanlog_earnings_yearly_mini=mean_mini
drop mean_mini

bysort year: egen mean_var_full=mean(var_lt_work_1999_full)
replace var_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(gini_lt_work_1999_full)
replace gini_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(p85_p15_lt_work_1999_full)
replace p85_p15_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(p85_p15_yearly_work_1999_full)
replace p85_p15_yearly_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_part=mean(var_lt_work_1999_part)
replace var_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(gini_lt_work_1999_part)
replace gini_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(p85_p15_lt_work_1999_part)
replace p85_p15_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(p85_p15_yearly_work_1999_part)
replace p85_p15_yearly_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_mini=mean(var_lt_work_1999_mini)
replace var_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(gini_lt_work_1999_mini)
replace gini_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(p85_p15_lt_work_1999_mini)
replace p85_p15_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(p85_p15_yearly_work_1999_mini)
replace p85_p15_yearly_work_1999_mini=mean_var_mini
drop mean_var_mini

*bysort year: gen counter=_n if gini_lt_work!=.
*keep if counter==1

label variable meanlog_earnings_long_term_full "Full Time"
label variable meanlog_earnings_long_term_part "Part Time"
label variable meanlog_earnings_long_term_mini "Marg. Employment"
label variable meanlog_earnings_yearly_full "Full Time"
label variable meanlog_earnings_yearly_part "Part Time"
label variable meanlog_earnings_yearly_mini "Marg. Employment"
label variable gini_lt_work_1999_full "Full Time"
label variable var_lt_work_1999_full "Full Time"
label variable p85_p15_lt_work_1999_full "Full Time"
label variable p85_p15_yearly_work_1999_full "Full Time"
label variable gini_lt_work_1999_part "Part Time"
label variable var_lt_work_1999_part "Part Time"
label variable p85_p15_lt_work_1999_part "Part Time"
label variable p85_p15_yearly_work_1999_part "Part Time"
label variable gini_lt_work_1999_mini "Mini Jobs"
label variable var_lt_work_1999_mini "Mini Jobs"
label variable p85_p15_lt_work_1999_mini "Mini Jobs"
label variable p85_p15_yearly_work_1999_mini "Mini Jobs"

***Gini Coefficients:
quietly twoway line var_lt_work_1999_full var_lt_work_1999_part var_lt_work_1999_mini year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export var_work_1999_5years_male.png, replace

quietly twoway line meanlog_earnings_yearly_full meanlog_earnings_yearly_part meanlog_earnings_yearly_mini year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_male.png, replace

quietly twoway line gini_lt_work_1999_full gini_lt_work_1999_part gini_lt_work_1999_mini year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export gini_work_1999_5years_male.png, replace

quietly twoway line p85_p15_lt_work_1999_full p85_p15_lt_work_1999_part p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_male.png, replace

quietly twoway line p85_p15_yearly_work_1999_full p85_p15_yearly_work_1999_part p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_male.png, replace
*

quietly twoway line p85_p15_yearly_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_male_full.png, replace
quietly twoway line p85_p15_yearly_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_male_part.png, replace
quietly twoway line p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(4 (0.5) 8, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_male_mini.png, replace

quietly twoway line p85_p15_lt_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_male_full.png, replace
quietly twoway line p85_p15_lt_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_male_part.png, replace
quietly twoway line p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(4 (0.5) 8, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_male_mini.png, replace

quietly twoway line meanlog_earnings_long_term_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_male_full.png, replace
quietly twoway line meanlog_earnings_long_term_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_male_part.png, replace
quietly twoway line meanlog_earnings_long_term_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_male_mini.png, replace

quietly twoway line meanlog_earnings_yearly_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_male_full.png, replace
quietly twoway line meanlog_earnings_yearly_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_male_part.png, replace
quietly twoway line meanlog_earnings_yearly_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_male_mini.png, replace

sum p85_p15_lt_work_1999_mini if p85_p15_lt_work_1999_mini!=.
sum p85_p15_lt_work_1999_part if p85_p15_lt_work_1999_part!=.
sum p85_p15_lt_work_1999_full if p85_p15_lt_work_1999_full!=.

sum p85_p15_yearly_work_1999_mini if p85_p15_yearly_work_1999_mini!=.
sum p85_p15_yearly_work_1999_part if p85_p15_yearly_work_1999_part!=.
sum p85_p15_yearly_work_1999_full if p85_p15_yearly_work_1999_full!=.

***females


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_full",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_full"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_part"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_part"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_mini"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_mini"
replace var_lt_work_1999_mini=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_mini=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_mini=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_mini=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_mini=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_mini=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*
bysort year: egen mean_full=mean(meanlog_earnings_long_term_full)
replace meanlog_earnings_long_term_full=mean_full
drop mean_full

bysort year: egen mean_part=mean(meanlog_earnings_long_term_part)
replace meanlog_earnings_long_term_part=mean_part
drop mean_part

bysort year: egen mean_mini=mean(meanlog_earnings_long_term_mini)
replace meanlog_earnings_long_term_mini=mean_mini
drop mean_mini

bysort year: egen mean_full=mean(meanlog_earnings_yearly_full)
replace meanlog_earnings_yearly_full=mean_full
drop mean_full

bysort year: egen mean_part=mean(meanlog_earnings_yearly_part)
replace meanlog_earnings_yearly_part=mean_part
drop mean_part

bysort year: egen mean_mini=mean(meanlog_earnings_yearly_mini)
replace meanlog_earnings_yearly_mini=mean_mini
drop mean_mini

bysort year: egen mean_var_full=mean(var_lt_work_1999_full)
replace var_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(gini_lt_work_1999_full)
replace gini_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(p85_p15_lt_work_1999_full)
replace p85_p15_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(p85_p15_yearly_work_1999_full)
replace p85_p15_yearly_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_part=mean(var_lt_work_1999_part)
replace var_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(gini_lt_work_1999_part)
replace gini_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(p85_p15_lt_work_1999_part)
replace p85_p15_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(p85_p15_yearly_work_1999_part)
replace p85_p15_yearly_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_mini=mean(var_lt_work_1999_mini)
replace var_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(gini_lt_work_1999_mini)
replace gini_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(p85_p15_lt_work_1999_mini)
replace p85_p15_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(p85_p15_yearly_work_1999_mini)
replace p85_p15_yearly_work_1999_mini=mean_var_mini
drop mean_var_mini

*bysort year: gen counter=_n if gini_lt_work!=.
*keep if counter==1

label variable meanlog_earnings_long_term_full "Full Time"
label variable meanlog_earnings_long_term_part "Part Time"
label variable meanlog_earnings_long_term_mini "Marg. Employment"
label variable meanlog_earnings_yearly_full "Full Time"
label variable meanlog_earnings_yearly_part "Part Time"
label variable meanlog_earnings_yearly_mini "Marg. Employment"
label variable gini_lt_work_1999_full "Full Time"
label variable var_lt_work_1999_full "Full Time"
label variable p85_p15_lt_work_1999_full "Full Time"
label variable p85_p15_yearly_work_1999_full "Full Time"
label variable gini_lt_work_1999_part "Part Time"
label variable var_lt_work_1999_part "Part Time"
label variable p85_p15_lt_work_1999_part "Part Time"
label variable p85_p15_yearly_work_1999_part "Part Time"
label variable gini_lt_work_1999_mini "Mini Jobs"
label variable var_lt_work_1999_mini "Mini Jobs"
label variable p85_p15_lt_work_1999_mini "Mini Jobs"
label variable p85_p15_yearly_work_1999_mini "Mini Jobs"

***Gini Coefficients:
quietly twoway line var_lt_work_1999_full var_lt_work_1999_part var_lt_work_1999_mini year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export var_work_1999_5years_female.png, replace

quietly twoway line meanlog_earnings_yearly_full meanlog_earnings_yearly_part meanlog_earnings_yearly_mini year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_female.png, replace

quietly twoway line gini_lt_work_1999_full gini_lt_work_1999_part gini_lt_work_1999_mini year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export gini_work_1999_5years_female.png, replace

quietly twoway line p85_p15_lt_work_1999_full p85_p15_lt_work_1999_part p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_female.png, replace

quietly twoway line p85_p15_yearly_work_1999_full p85_p15_yearly_work_1999_part p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_female.png, replace
*

quietly twoway line p85_p15_yearly_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_female_full.png, replace
quietly twoway line p85_p15_yearly_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_female_part.png, replace
quietly twoway line p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(4 (0.5) 8, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_female_mini.png, replace

quietly twoway line p85_p15_lt_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_female_full.png, replace
quietly twoway line p85_p15_lt_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_female_part.png, replace
quietly twoway line p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(4 (0.5) 8, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_female_mini.png, replace

quietly twoway line meanlog_earnings_long_term_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_female_full.png, replace
quietly twoway line meanlog_earnings_long_term_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_female_part.png, replace
quietly twoway line meanlog_earnings_long_term_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_female_mini.png, replace

quietly twoway line meanlog_earnings_yearly_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_female_full.png, replace
quietly twoway line meanlog_earnings_yearly_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_female_part.png, replace
quietly twoway line meanlog_earnings_yearly_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_female_mini.png, replace

sum p85_p15_lt_work_1999_mini if p85_p15_lt_work_1999_mini!=.
sum p85_p15_lt_work_1999_part if p85_p15_lt_work_1999_part!=.
sum p85_p15_lt_work_1999_full if p85_p15_lt_work_1999_full!=.

sum p85_p15_yearly_work_1999_mini if p85_p15_yearly_work_1999_mini!=.
sum p85_p15_yearly_work_1999_part if p85_p15_yearly_work_1999_part!=.
sum p85_p15_yearly_work_1999_full if p85_p15_yearly_work_1999_full!=.



*** Unconditional below30 with each form


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_full_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_full_below30"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_part_below30"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_part_below30"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_mini_below30"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_mini_below30"
replace var_lt_work_1999_mini=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_mini=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_mini=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_mini=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_mini=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_mini=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*
bysort year: egen mean_full=mean(meanlog_earnings_long_term_full)
replace meanlog_earnings_long_term_full=mean_full
drop mean_full

bysort year: egen mean_part=mean(meanlog_earnings_long_term_part)
replace meanlog_earnings_long_term_part=mean_part
drop mean_part

bysort year: egen mean_mini=mean(meanlog_earnings_long_term_mini)
replace meanlog_earnings_long_term_mini=mean_mini
drop mean_mini

bysort year: egen mean_full=mean(meanlog_earnings_yearly_full)
replace meanlog_earnings_yearly_full=mean_full
drop mean_full

bysort year: egen mean_part=mean(meanlog_earnings_yearly_part)
replace meanlog_earnings_yearly_part=mean_part
drop mean_part

bysort year: egen mean_mini=mean(meanlog_earnings_yearly_mini)
replace meanlog_earnings_yearly_mini=mean_mini
drop mean_mini

bysort year: egen mean_var_full=mean(var_lt_work_1999_full)
replace var_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(gini_lt_work_1999_full)
replace gini_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(p85_p15_lt_work_1999_full)
replace p85_p15_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(p85_p15_yearly_work_1999_full)
replace p85_p15_yearly_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_part=mean(var_lt_work_1999_part)
replace var_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(gini_lt_work_1999_part)
replace gini_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(p85_p15_lt_work_1999_part)
replace p85_p15_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(p85_p15_yearly_work_1999_part)
replace p85_p15_yearly_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_mini=mean(var_lt_work_1999_mini)
replace var_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(gini_lt_work_1999_mini)
replace gini_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(p85_p15_lt_work_1999_mini)
replace p85_p15_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(p85_p15_yearly_work_1999_mini)
replace p85_p15_yearly_work_1999_mini=mean_var_mini
drop mean_var_mini

*bysort year: gen counter=_n if gini_lt_work!=.
*keep if counter==1

label variable meanlog_earnings_long_term_full "Full Time"
label variable meanlog_earnings_long_term_part "Part Time"
label variable meanlog_earnings_long_term_mini "Marg. Employment"
label variable meanlog_earnings_yearly_full "Full Time"
label variable meanlog_earnings_yearly_part "Part Time"
label variable meanlog_earnings_yearly_mini "Marg. Employment"
label variable gini_lt_work_1999_full "Full Time"
label variable var_lt_work_1999_full "Full Time"
label variable p85_p15_lt_work_1999_full "Full Time"
label variable p85_p15_yearly_work_1999_full "Full Time"
label variable gini_lt_work_1999_part "Part Time"
label variable var_lt_work_1999_part "Part Time"
label variable p85_p15_lt_work_1999_part "Part Time"
label variable p85_p15_yearly_work_1999_part "Part Time"
label variable gini_lt_work_1999_mini "Mini Jobs"
label variable var_lt_work_1999_mini "Mini Jobs"
label variable p85_p15_lt_work_1999_mini "Mini Jobs"
label variable p85_p15_yearly_work_1999_mini "Mini Jobs"

***Gini Coefficients:
quietly twoway line var_lt_work_1999_full var_lt_work_1999_part var_lt_work_1999_mini year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export var_work_1999_5years_unc_below30.png, replace

quietly twoway line meanlog_earnings_yearly_full meanlog_earnings_yearly_part meanlog_earnings_yearly_mini year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc_below30.png, replace

quietly twoway line gini_lt_work_1999_full gini_lt_work_1999_part gini_lt_work_1999_mini year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export gini_work_1999_5years_unc_below30.png, replace

quietly twoway line p85_p15_lt_work_1999_full p85_p15_lt_work_1999_part p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_unc_below30.png, replace

quietly twoway line p85_p15_yearly_work_1999_full p85_p15_yearly_work_1999_part p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_unc_below30.png, replace
*

quietly twoway line p85_p15_yearly_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_unc_full_below30.png, replace
quietly twoway line p85_p15_yearly_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_unc_part_below30.png, replace
quietly twoway line p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(4 (0.5) 8, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_unc_mini_below30.png, replace

quietly twoway line p85_p15_lt_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_unc_full_below30.png, replace
quietly twoway line p85_p15_lt_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_unc_part_below30.png, replace
quietly twoway line p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(4 (0.5) 8, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_unc_mini_below30.png, replace

quietly twoway line meanlog_earnings_long_term_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc_full_below30.png, replace
quietly twoway line meanlog_earnings_long_term_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc_part_below30.png, replace
quietly twoway line meanlog_earnings_long_term_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc_mini_below30.png, replace

quietly twoway line meanlog_earnings_yearly_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc_full_below30.png, replace
quietly twoway line meanlog_earnings_yearly_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc_part_below30.png, replace
quietly twoway line meanlog_earnings_yearly_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc_mini_below30.png, replace

sum p85_p15_lt_work_1999_mini if p85_p15_lt_work_1999_mini!=.
sum p85_p15_lt_work_1999_part if p85_p15_lt_work_1999_part!=.
sum p85_p15_lt_work_1999_full if p85_p15_lt_work_1999_full!=.

sum p85_p15_yearly_work_1999_mini if p85_p15_yearly_work_1999_mini!=.
sum p85_p15_yearly_work_1999_part if p85_p15_yearly_work_1999_part!=.
sum p85_p15_yearly_work_1999_full if p85_p15_yearly_work_1999_full!=.

***

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_full_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_full_below30"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_part_below30"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_part_below30"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_mini_below30"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_mini_below30"
replace var_lt_work_1999_mini=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_mini=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_mini=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_mini=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_mini=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_mini=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*
bysort year: egen mean_full=mean(meanlog_earnings_long_term_full)
replace meanlog_earnings_long_term_full=mean_full
drop mean_full

bysort year: egen mean_part=mean(meanlog_earnings_long_term_part)
replace meanlog_earnings_long_term_part=mean_part
drop mean_part

bysort year: egen mean_mini=mean(meanlog_earnings_long_term_mini)
replace meanlog_earnings_long_term_mini=mean_mini
drop mean_mini

bysort year: egen mean_full=mean(meanlog_earnings_yearly_full)
replace meanlog_earnings_yearly_full=mean_full
drop mean_full

bysort year: egen mean_part=mean(meanlog_earnings_yearly_part)
replace meanlog_earnings_yearly_part=mean_part
drop mean_part

bysort year: egen mean_mini=mean(meanlog_earnings_yearly_mini)
replace meanlog_earnings_yearly_mini=mean_mini
drop mean_mini

bysort year: egen mean_var_full=mean(var_lt_work_1999_full)
replace var_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(gini_lt_work_1999_full)
replace gini_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(p85_p15_lt_work_1999_full)
replace p85_p15_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(p85_p15_yearly_work_1999_full)
replace p85_p15_yearly_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_part=mean(var_lt_work_1999_part)
replace var_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(gini_lt_work_1999_part)
replace gini_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(p85_p15_lt_work_1999_part)
replace p85_p15_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(p85_p15_yearly_work_1999_part)
replace p85_p15_yearly_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_mini=mean(var_lt_work_1999_mini)
replace var_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(gini_lt_work_1999_mini)
replace gini_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(p85_p15_lt_work_1999_mini)
replace p85_p15_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(p85_p15_yearly_work_1999_mini)
replace p85_p15_yearly_work_1999_mini=mean_var_mini
drop mean_var_mini

*bysort year: gen counter=_n if gini_lt_work!=.
*keep if counter==1

label variable meanlog_earnings_long_term_full "Full Time"
label variable meanlog_earnings_long_term_part "Part Time"
label variable meanlog_earnings_long_term_mini "Marg. Employment"
label variable meanlog_earnings_yearly_full "Full Time"
label variable meanlog_earnings_yearly_part "Part Time"
label variable meanlog_earnings_yearly_mini "Marg. Employment"
label variable gini_lt_work_1999_full "Full Time"
label variable var_lt_work_1999_full "Full Time"
label variable p85_p15_lt_work_1999_full "Full Time"
label variable p85_p15_yearly_work_1999_full "Full Time"
label variable gini_lt_work_1999_part "Part Time"
label variable var_lt_work_1999_part "Part Time"
label variable p85_p15_lt_work_1999_part "Part Time"
label variable p85_p15_yearly_work_1999_part "Part Time"
label variable gini_lt_work_1999_mini "Mini Jobs"
label variable var_lt_work_1999_mini "Mini Jobs"
label variable p85_p15_lt_work_1999_mini "Mini Jobs"
label variable p85_p15_yearly_work_1999_mini "Mini Jobs"

***Gini Coefficients:
quietly twoway line var_lt_work_1999_full var_lt_work_1999_part var_lt_work_1999_mini year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export var_work_1999_5years_male_below30.png, replace

quietly twoway line meanlog_earnings_yearly_full meanlog_earnings_yearly_part meanlog_earnings_yearly_mini year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_male_below30.png, replace

quietly twoway line gini_lt_work_1999_full gini_lt_work_1999_part gini_lt_work_1999_mini year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export gini_work_1999_5years_male_below30.png, replace

quietly twoway line p85_p15_lt_work_1999_full p85_p15_lt_work_1999_part p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_male_below30.png, replace

quietly twoway line p85_p15_yearly_work_1999_full p85_p15_yearly_work_1999_part p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_male_below30.png, replace
*

quietly twoway line p85_p15_yearly_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_male_full_below30.png, replace
quietly twoway line p85_p15_yearly_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_male_part_below30.png, replace
quietly twoway line p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(4 (0.5) 8, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_male_mini_below30.png, replace

quietly twoway line p85_p15_lt_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_male_full_below30.png, replace
quietly twoway line p85_p15_lt_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_male_part_below30.png, replace
quietly twoway line p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(4 (0.5) 8, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_male_mini_below30.png, replace

quietly twoway line meanlog_earnings_long_term_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_male_full_below30.png, replace
quietly twoway line meanlog_earnings_long_term_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_male_part_below30.png, replace
quietly twoway line meanlog_earnings_long_term_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_male_mini_below30.png, replace

quietly twoway line meanlog_earnings_yearly_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_male_full_below30.png, replace
quietly twoway line meanlog_earnings_yearly_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_male_part_below30.png, replace
quietly twoway line meanlog_earnings_yearly_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_male_mini_below30.png, replace

sum p85_p15_lt_work_1999_mini if p85_p15_lt_work_1999_mini!=.
sum p85_p15_lt_work_1999_part if p85_p15_lt_work_1999_part!=.
sum p85_p15_lt_work_1999_full if p85_p15_lt_work_1999_full!=.

sum p85_p15_yearly_work_1999_mini if p85_p15_yearly_work_1999_mini!=.
sum p85_p15_yearly_work_1999_part if p85_p15_yearly_work_1999_part!=.
sum p85_p15_yearly_work_1999_full if p85_p15_yearly_work_1999_full!=.

***

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_full_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_full_below30"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_part_below30"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_part_below30"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_mini_below30"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_mini_below30"
replace var_lt_work_1999_mini=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_mini=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_mini=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_mini=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_mini=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_mini=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*
bysort year: egen mean_full=mean(meanlog_earnings_long_term_full)
replace meanlog_earnings_long_term_full=mean_full
drop mean_full

bysort year: egen mean_part=mean(meanlog_earnings_long_term_part)
replace meanlog_earnings_long_term_part=mean_part
drop mean_part

bysort year: egen mean_mini=mean(meanlog_earnings_long_term_mini)
replace meanlog_earnings_long_term_mini=mean_mini
drop mean_mini

bysort year: egen mean_full=mean(meanlog_earnings_yearly_full)
replace meanlog_earnings_yearly_full=mean_full
drop mean_full

bysort year: egen mean_part=mean(meanlog_earnings_yearly_part)
replace meanlog_earnings_yearly_part=mean_part
drop mean_part

bysort year: egen mean_mini=mean(meanlog_earnings_yearly_mini)
replace meanlog_earnings_yearly_mini=mean_mini
drop mean_mini

bysort year: egen mean_var_full=mean(var_lt_work_1999_full)
replace var_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(gini_lt_work_1999_full)
replace gini_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(p85_p15_lt_work_1999_full)
replace p85_p15_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_full=mean(p85_p15_yearly_work_1999_full)
replace p85_p15_yearly_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_part=mean(var_lt_work_1999_part)
replace var_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(gini_lt_work_1999_part)
replace gini_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(p85_p15_lt_work_1999_part)
replace p85_p15_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_part=mean(p85_p15_yearly_work_1999_part)
replace p85_p15_yearly_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_mini=mean(var_lt_work_1999_mini)
replace var_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(gini_lt_work_1999_mini)
replace gini_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(p85_p15_lt_work_1999_mini)
replace p85_p15_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_mini=mean(p85_p15_yearly_work_1999_mini)
replace p85_p15_yearly_work_1999_mini=mean_var_mini
drop mean_var_mini

*bysort year: gen counter=_n if gini_lt_work!=.
*keep if counter==1

label variable meanlog_earnings_long_term_full "Full Time"
label variable meanlog_earnings_long_term_part "Part Time"
label variable meanlog_earnings_long_term_mini "Marg. Employment"
label variable meanlog_earnings_yearly_full "Full Time"
label variable meanlog_earnings_yearly_part "Part Time"
label variable meanlog_earnings_yearly_mini "Marg. Employment"
label variable gini_lt_work_1999_full "Full Time"
label variable var_lt_work_1999_full "Full Time"
label variable p85_p15_lt_work_1999_full "Full Time"
label variable p85_p15_yearly_work_1999_full "Full Time"
label variable gini_lt_work_1999_part "Part Time"
label variable var_lt_work_1999_part "Part Time"
label variable p85_p15_lt_work_1999_part "Part Time"
label variable p85_p15_yearly_work_1999_part "Part Time"
label variable gini_lt_work_1999_mini "Mini Jobs"
label variable var_lt_work_1999_mini "Mini Jobs"
label variable p85_p15_lt_work_1999_mini "Mini Jobs"
label variable p85_p15_yearly_work_1999_mini "Mini Jobs"

***Gini Coefficients:
quietly twoway line var_lt_work_1999_full var_lt_work_1999_part var_lt_work_1999_mini year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export var_work_1999_5years_female_below30.png, replace

quietly twoway line meanlog_earnings_yearly_full meanlog_earnings_yearly_part meanlog_earnings_yearly_mini year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_female_below30.png, replace

quietly twoway line gini_lt_work_1999_full gini_lt_work_1999_part gini_lt_work_1999_mini year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export gini_work_1999_5years_female_below30.png, replace

quietly twoway line p85_p15_lt_work_1999_full p85_p15_lt_work_1999_part p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_female_below30.png, replace

quietly twoway line p85_p15_yearly_work_1999_full p85_p15_yearly_work_1999_part p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_female_below30.png, replace
*

quietly twoway line p85_p15_yearly_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_female_full_below30.png, replace
quietly twoway line p85_p15_yearly_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_female_part_below30.png, replace
quietly twoway line p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(4 (0.5) 8, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_female_mini_below30.png, replace

quietly twoway line p85_p15_lt_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_female_full_below30.png, replace
quietly twoway line p85_p15_lt_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (0.2) 3, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_female_part_below30.png, replace
quietly twoway line p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(4 (0.5) 8, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_female_mini_below30.png, replace

quietly twoway line meanlog_earnings_long_term_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_female_full_below30.png, replace
quietly twoway line meanlog_earnings_long_term_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_female_part_below30.png, replace
quietly twoway line meanlog_earnings_long_term_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_female_mini_below30.png, replace

quietly twoway line meanlog_earnings_yearly_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_female_full_below30.png, replace
quietly twoway line meanlog_earnings_yearly_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_female_part_below30.png, replace
quietly twoway line meanlog_earnings_yearly_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_female_mini_below30.png, replace

sum p85_p15_lt_work_1999_mini if p85_p15_lt_work_1999_mini!=.
sum p85_p15_lt_work_1999_part if p85_p15_lt_work_1999_part!=.
sum p85_p15_lt_work_1999_full if p85_p15_lt_work_1999_full!=.

sum p85_p15_yearly_work_1999_mini if p85_p15_yearly_work_1999_mini!=.
sum p85_p15_yearly_work_1999_part if p85_p15_yearly_work_1999_part!=.
sum p85_p15_yearly_work_1999_full if p85_p15_yearly_work_1999_full!=.

*** Shares of Full Part Mini 5 years ahead:

 cls
 set more off

*** Unconditional Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_full_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_full_shares"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_full_shares.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_part_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_part_shares"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_part_shares.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_mini_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_mini_shares"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_mini_shares.png, replace


*** Female Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_full_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_full_shares"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_full_shares.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_part_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_part_shares"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_part_shares.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_mini_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_mini_shares"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_mini_shares.png, replace


*** Male Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_full_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_full_shares"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_full_shares.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_part_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_part_shares"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_part_shares.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_mini_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_mini_shares"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_mini_shares.png, replace


*** Shares of Full Part Mini 5 years ahead below 30 years old

 cls
 set more off

*** Unconditional Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_full_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_full_shares_below30"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_full_shares_below30.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_part_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_part_shares_below30"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_part_shares_below30.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_mini_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_mini_shares_below30"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_mini_shares_below30.png, replace


*** Female Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_full_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_full_shares_below30"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_full_shares_below30.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_part_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_part_shares_below30"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_part_shares_below30.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_mini_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_mini_shares_below30"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_mini_shares_below30.png, replace


*** Male Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_full_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_full_shares_below30"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_full_shares_below30.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_part_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_part_shares_below30"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_part_shares_below30.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_mini_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_mini_shares_below30"
}
*

graph bar (mean) share_full share_part share_mini, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_mini_shares_below30.png, replace



*** by days and not by contract only!!! :

*** Shares of Full Part Mini 5 years ahead:

 cls
 set more off

*** Unconditional Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_full_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_full_shares"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_full_shares_days.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_part_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_part_shares"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_part_shares_days.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_mini_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_mini_shares"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_mini_shares_days.png, replace


*** Female Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_full_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_full_shares"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_full_shares_days.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_part_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_part_shares"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_part_shares_days.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_mini_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_mini_shares"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_mini_shares_days.png, replace


*** Male Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_full_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_full_shares"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_full_shares_days.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_part_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_part_shares"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_part_shares_days.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_mini_shares",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_mini_shares"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_mini_shares_days.png, replace


*** Shares of Full Part Mini 5 years ahead below 30 years old

 cls
 set more off

*** Unconditional Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_full_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_full_shares_below30"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_full_shares_below30_days.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_part_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_part_shares_below30"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_part_shares_below30_days.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_unc_mini_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_unc_mini_shares_below30"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_mini_shares_below30_days.png, replace


*** Female Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_full_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_full_shares_below30"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_full_shares_below30_days.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_part_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_part_shares_below30"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_part_shares_below30_days.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_female_mini_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_female_mini_shares_below30"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_mini_shares_below30_days.png, replace


*** Male Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_full_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_full_shares_below30"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_full_shares_below30_days.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_part_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_part_shares_below30"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_part_shares_below30_days.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_5years_male_mini_shares_below30",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_5years_male_mini_shares_below30"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_mini_shares_below30_days.png, replace
