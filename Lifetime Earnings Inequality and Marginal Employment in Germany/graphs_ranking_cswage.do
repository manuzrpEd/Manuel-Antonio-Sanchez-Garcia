***Ranking graphs
cls
set more off

*** Unconditional

forval j=1/5 {

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_unc_full_r`j'",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_unc_full_r`j'"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_unc_part_r`j'"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_unc_part_r`j'"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_unc_mini_r`j'"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_unc_mini_r`j'"
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
*

quietly twoway line p85_p15_lt_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_ltcswage_unc_full_r`j'.png, replace
quietly twoway line p85_p15_lt_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_ltcswage_unc_part_r`j'.png, replace
quietly twoway line p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_ltcswage_unc_mini_r`j'.png, replace

quietly twoway line p85_p15_yearly_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_cswage_unc_full_r`j'.png, replace
quietly twoway line p85_p15_yearly_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_cswage_unc_part_r`j'.png, replace
quietly twoway line p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_cswage_unc_mini_r`j'.png, replace

quietly twoway line meanlog_earnings_long_term_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_unc_full_r`j'.png, replace
quietly twoway line meanlog_earnings_long_term_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_unc_part_r`j'.png, replace
quietly twoway line meanlog_earnings_long_term_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_unc_mini_r`j'.png, replace

quietly twoway line meanlog_earnings_yearly_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_unc_full_r`j'.png, replace
quietly twoway line meanlog_earnings_yearly_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_unc_part_r`j'.png, replace
quietly twoway line meanlog_earnings_yearly_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_unc_mini_r`j'.png, replace


***males

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_male_full_r`j'",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full


forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_male_full_r`j'"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_male_part_r`j'"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_male_part_r`j'"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_male_mini_r`j'"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_male_mini_r`j'"
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
*

quietly twoway line p85_p15_yearly_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_ltcswage_male_full_r`j'.png, replace
quietly twoway line p85_p15_yearly_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_ltcswage_male_part_r`j'.png, replace
quietly twoway line p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_ltcswage_male_mini_r`j'.png, replace

quietly twoway line p85_p15_lt_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_cswage_male_full_r`j'.png, replace
quietly twoway line p85_p15_lt_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_cswage_male_part_r`j'.png, replace
quietly twoway line p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_cswage_male_mini_r`j'.png, replace

quietly twoway line meanlog_earnings_long_term_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_male_full_r`j'.png, replace
quietly twoway line meanlog_earnings_long_term_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_male_part_r`j'.png, replace
quietly twoway line meanlog_earnings_long_term_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_male_mini_r`j'.png, replace

quietly twoway line meanlog_earnings_yearly_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_male_full_r`j'.png, replace
quietly twoway line meanlog_earnings_yearly_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_male_part_r`j'.png, replace
quietly twoway line meanlog_earnings_yearly_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_male_mini_r`j'.png, replace


***females


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_female_full_r`j'",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_female_full_r`j'"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_female_part_r`j'"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_female_part_r`j'"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_female_mini_r`j'"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_female_mini_r`j'"
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
*

quietly twoway line p85_p15_yearly_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_ltcswage_female_full_r`j'.png, replace
quietly twoway line p85_p15_yearly_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_ltcswage_female_part_r`j'.png, replace
quietly twoway line p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_ltcswage_female_mini_r`j'.png, replace

quietly twoway line p85_p15_lt_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_cswage_female_full_r`j'.png, replace
quietly twoway line p85_p15_lt_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_cswage_female_part_r`j'.png, replace
quietly twoway line p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_cswage_female_mini_r`j'.png, replace

quietly twoway line meanlog_earnings_long_term_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_female_full_r`j'.png, replace
quietly twoway line meanlog_earnings_long_term_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_female_part_r`j'.png, replace
quietly twoway line meanlog_earnings_long_term_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_female_mini_r`j'.png, replace

quietly twoway line meanlog_earnings_yearly_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_female_full_r`j'.png, replace
quietly twoway line meanlog_earnings_yearly_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_female_part_r`j'.png, replace
quietly twoway line meanlog_earnings_yearly_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_cswage_female_mini_r`j'.png, replace


***SHARES

*** Shares of Full Part Mini 5 years ahead:

 cls
 set more off

*** Unconditional Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_unc_full_shares_r`j'",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_unc_full_shares_r`j'"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_cswage_unc_full_shares_days_r`j'.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_unc_part_shares_r`j'",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_unc_part_shares_r`j'"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_cswage_unc_part_shares_days_r`j'.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_unc_mini_shares_r`j'",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_unc_mini_shares_r`j'"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_cswage_unc_mini_shares_days_r`j'.png, replace


*** Female Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_female_full_shares_r`j'",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_female_full_shares_r`j'"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_cswage_female_full_shares_days_r`j'.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_female_part_shares_r`j'",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_female_part_shares_r`j'"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_cswage_female_part_shares_days_r`j'.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_female_mini_shares_r`j'",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_female_mini_shares_r`j'"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_cswage_female_mini_shares_days_r`j'.png, replace


*** Male Shares

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_male_full_shares_r`j'",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_male_full_shares_r`j'"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_cswage_male_full_shares_days_r`j'.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_male_part_shares_r`j'",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_male_part_shares_r`j'"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_cswage_male_part_shares_days_r`j'.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_1999_cswage_male_mini_shares_r`j'",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

forval i=2000/2010 {
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_`i'_cswage_male_mini_shares_r`j'"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_cswage_male_mini_shares_days_r`j'.png, replace

}
*end


