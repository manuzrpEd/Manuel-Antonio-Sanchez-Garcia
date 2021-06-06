*pending to run completely
***Ranking graphs
cls
set more off

*** Unconditional

forval j=1/5 {

use "\bonke_1999_5years_unc_full_r`j'",clear
cd ""
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full

forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_full_r`j'"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "\bonke_1999_5years_unc_part_r`j'"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_part_r`j'"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "\bonke_1999_5years_unc_mini_r`j'"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_mini_r`j'"
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
graph export perc8515_work_1999_5years_unc_full_r`j'.png, replace
quietly twoway line p85_p15_lt_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_unc_part_r`j'.png, replace
quietly twoway line p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_unc_mini_r`j'.png, replace

quietly twoway line p85_p15_yearly_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_unc_full_r`j'.png, replace
quietly twoway line p85_p15_yearly_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_unc_part_r`j'.png, replace
quietly twoway line p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_unc_mini_r`j'.png, replace

quietly twoway line meanlog_earnings_long_term_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc_full_r`j'.png, replace
quietly twoway line meanlog_earnings_long_term_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc_part_r`j'.png, replace
quietly twoway line meanlog_earnings_long_term_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc_mini_r`j'.png, replace

quietly twoway line meanlog_earnings_yearly_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc_full_r`j'.png, replace
quietly twoway line meanlog_earnings_yearly_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc_part_r`j'.png, replace
quietly twoway line meanlog_earnings_yearly_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc_mini_r`j'.png, replace


***males

use "\bonke_1999_5years_male_full_r`j'",clear
cd ""
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full


forval i=2000/2010 {
append using "\bonke_`i'_5years_male_full_r`j'"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "\bonke_1999_5years_male_part_r`j'"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
forval i=2000/2010 {
append using "\bonke_`i'_5years_male_part_r`j'"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "\bonke_1999_5years_male_mini_r`j'"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
forval i=2000/2010 {
append using "\bonke_`i'_5years_male_mini_r`j'"
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
graph export perc8515_work_1999_5yearly_male_full_r`j'.png, replace
quietly twoway line p85_p15_yearly_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_male_part_r`j'.png, replace
quietly twoway line p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_male_mini_r`j'.png, replace

quietly twoway line p85_p15_lt_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_male_full_r`j'.png, replace
quietly twoway line p85_p15_lt_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_male_part_r`j'.png, replace
quietly twoway line p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_male_mini_r`j'.png, replace

quietly twoway line meanlog_earnings_long_term_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_male_full_r`j'.png, replace
quietly twoway line meanlog_earnings_long_term_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_male_part_r`j'.png, replace
quietly twoway line meanlog_earnings_long_term_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_male_mini_r`j'.png, replace

quietly twoway line meanlog_earnings_yearly_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_male_full_r`j'.png, replace
quietly twoway line meanlog_earnings_yearly_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_male_part_r`j'.png, replace
quietly twoway line meanlog_earnings_yearly_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_male_mini_r`j'.png, replace


***females


use "\bonke_1999_5years_female_full_r`j'",clear
cd ""
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full

forval i=2000/2010 {
append using "\bonke_`i'_5years_female_full_r`j'"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "\bonke_1999_5years_female_part_r`j'"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
forval i=2000/2010 {
append using "\bonke_`i'_5years_female_part_r`j'"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly
}
*

append using "\bonke_1999_5years_female_mini_r`j'"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
forval i=2000/2010 {
append using "\bonke_`i'_5years_female_mini_r`j'"
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
graph export perc8515_work_1999_5yearly_female_full_r`j'.png, replace
quietly twoway line p85_p15_yearly_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_female_part_r`j'.png, replace
quietly twoway line p85_p15_yearly_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5yearly_female_mini_r`j'.png, replace

quietly twoway line p85_p15_lt_work_1999_full year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_female_full_r`j'.png, replace
quietly twoway line p85_p15_lt_work_1999_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_female_part_r`j'.png, replace
quietly twoway line p85_p15_lt_work_1999_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8515_work_1999_5years_female_mini_r`j'.png, replace

quietly twoway line meanlog_earnings_long_term_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_female_full_r`j'.png, replace
quietly twoway line meanlog_earnings_long_term_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_female_part_r`j'.png, replace
quietly twoway line meanlog_earnings_long_term_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_female_mini_r`j'.png, replace

quietly twoway line meanlog_earnings_yearly_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_female_full_r`j'.png, replace
quietly twoway line meanlog_earnings_yearly_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_female_part_r`j'.png, replace
quietly twoway line meanlog_earnings_yearly_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_female_mini_r`j'.png, replace


***SHARES

*** Shares of Full Part Mini 5 years ahead:

 cls
 set more off

*** Unconditional Shares

use "\bonke_1999_5years_unc_full_shares_r`j'",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_full_shares_r`j'"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_full_shares_days_r`j'.png, replace

use "\bonke_1999_5years_unc_part_shares_r`j'",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_part_shares_r`j'"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_part_shares_days_r`j'.png, replace


use "\bonke_1999_5years_unc_mini_shares_r`j'",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_mini_shares_r`j'"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_mini_shares_days_r`j'.png, replace


*** Female Shares

use "\bonke_1999_5years_female_full_shares_r`j'",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_female_full_shares_r`j'"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_full_shares_days_r`j'.png, replace

use "\bonke_1999_5years_female_part_shares_r`j'",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_female_part_shares_r`j'"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_part_shares_days_r`j'.png, replace


use "\bonke_1999_5years_female_mini_shares_r`j'",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_female_mini_shares_r`j'"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_mini_shares_days_r`j'.png, replace


*** Male Shares

use "\bonke_1999_5years_male_full_shares_r`j'",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_male_full_shares_r`j'"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_full_shares_days_r`j'.png, replace

use "\bonke_1999_5years_male_part_shares_r`j'",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_male_part_shares_r`j'"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_part_shares_days_r`j'.png, replace


use "\bonke_1999_5years_male_mini_shares_r`j'",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_male_mini_shares_r`j'"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_mini_shares_days_r`j'.png, replace

}
*end


***Fractions

**Unconditional

*Full

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(sum_earnings_long_term_work), p(20)
egen perce40=pctile(sum_earnings_long_term_work), p(40)
egen perce60=pctile(sum_earnings_long_term_work), p(60)
egen perce80=pctile(sum_earnings_long_term_work), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_5years_full_unc.png, replace


*

*Part

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(sum_earnings_long_term_work), p(20)
egen perce40=pctile(sum_earnings_long_term_work), p(40)
egen perce60=pctile(sum_earnings_long_term_work), p(60)
egen perce80=pctile(sum_earnings_long_term_work), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_5years_part_unc.png, replace


*Mini

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(sum_earnings_long_term_work), p(20)
egen perce40=pctile(sum_earnings_long_term_work), p(40)
egen perce60=pctile(sum_earnings_long_term_work), p(60)
egen perce80=pctile(sum_earnings_long_term_work), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_5years_mini_unc.png, replace

*

**Male

*Full

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(sum_earnings_long_term_work), p(20)
egen perce40=pctile(sum_earnings_long_term_work), p(40)
egen perce60=pctile(sum_earnings_long_term_work), p(60)
egen perce80=pctile(sum_earnings_long_term_work), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_5years_full_male.png, replace


*

*Part

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(sum_earnings_long_term_work), p(20)
egen perce40=pctile(sum_earnings_long_term_work), p(40)
egen perce60=pctile(sum_earnings_long_term_work), p(60)
egen perce80=pctile(sum_earnings_long_term_work), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_5years_part_male.png, replace


*Mini

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(sum_earnings_long_term_work), p(20)
egen perce40=pctile(sum_earnings_long_term_work), p(40)
egen perce60=pctile(sum_earnings_long_term_work), p(60)
egen perce80=pctile(sum_earnings_long_term_work), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_5years_mini_male.png, replace

*

**Female

*Full

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(sum_earnings_long_term_work), p(20)
egen perce40=pctile(sum_earnings_long_term_work), p(40)
egen perce60=pctile(sum_earnings_long_term_work), p(60)
egen perce80=pctile(sum_earnings_long_term_work), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_5years_full_female.png, replace


*

*Part

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(sum_earnings_long_term_work), p(20)
egen perce40=pctile(sum_earnings_long_term_work), p(40)
egen perce60=pctile(sum_earnings_long_term_work), p(60)
egen perce80=pctile(sum_earnings_long_term_work), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_5years_part_female.png, replace


*Mini

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(sum_earnings_long_term_work), p(20)
egen perce40=pctile(sum_earnings_long_term_work), p(40)
egen perce60=pctile(sum_earnings_long_term_work), p(60)
egen perce80=pctile(sum_earnings_long_term_work), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_5years_mini_female.png, replace

*


*** CS 5Years


***Fractions

**Unconditional

*Full

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(earnings_year), p(20)
egen perce40=pctile(earnings_year), p(40)
egen perce60=pctile(earnings_year), p(60)
egen perce80=pctile(earnings_year), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_ltcs_full_unc.png, replace


*

*Part

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(earnings_year), p(20)
egen perce40=pctile(earnings_year), p(40)
egen perce60=pctile(earnings_year), p(60)
egen perce80=pctile(earnings_year), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_ltcs_part_unc.png, replace


*Mini

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(earnings_year), p(20)
egen perce40=pctile(earnings_year), p(40)
egen perce60=pctile(earnings_year), p(60)
egen perce80=pctile(earnings_year), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_ltcs_mini_unc.png, replace

*

**Male

*Full

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(earnings_year), p(20)
egen perce40=pctile(earnings_year), p(40)
egen perce60=pctile(earnings_year), p(60)
egen perce80=pctile(earnings_year), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_ltcs_full_male.png, replace


*

*Part

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(earnings_year), p(20)
egen perce40=pctile(earnings_year), p(40)
egen perce60=pctile(earnings_year), p(60)
egen perce80=pctile(earnings_year), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_ltcs_part_male.png, replace


*Mini

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(earnings_year), p(20)
egen perce40=pctile(earnings_year), p(40)
egen perce60=pctile(earnings_year), p(60)
egen perce80=pctile(earnings_year), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_ltcs_mini_male.png, replace

*

**Female

*Full

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(earnings_year), p(20)
egen perce40=pctile(earnings_year), p(40)
egen perce60=pctile(earnings_year), p(60)
egen perce80=pctile(earnings_year), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_ltcs_full_female.png, replace


*

*Part

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(earnings_year), p(20)
egen perce40=pctile(earnings_year), p(40)
egen perce60=pctile(earnings_year), p(60)
egen perce80=pctile(earnings_year), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_ltcs_part_female.png, replace


*Mini

cls
set more off

use "\Preliminars",clear
cd ""

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

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

egen perce20=pctile(earnings_year), p(20)
egen perce40=pctile(earnings_year), p(40)
egen perce60=pctile(earnings_year), p(60)
egen perce80=pctile(earnings_year), p(80)

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_ltcs_mini_female.png, replace

*

***CS WAGE


***Fractions

**Unconditional

*Full

cls
set more off

use "\Preliminars",clear
cd ""

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

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_cswage_full_unc.png, replace


*

*Part

cls
set more off

use "\Preliminars",clear
cd ""

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

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_cswage_part_unc.png, replace


*Mini

cls
set more off

use "\Preliminars",clear
cd ""

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

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_cswage_mini_unc.png, replace

*

**Male

*Full

cls
set more off

use "\Preliminars",clear
cd ""

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

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_cswage_full_male.png, replace


*

*Part

cls
set more off

use "\Preliminars",clear
cd ""

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

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_cswage_part_male.png, replace


*Mini

cls
set more off

use "\Preliminars",clear
cd ""

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

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_cswage_mini_male.png, replace

*

**Female

*Full

cls
set more off

use "\Preliminars",clear
cd ""

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

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_cswage_full_female.png, replace


*

*Part

cls
set more off

use "\Preliminars",clear
cd ""

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

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_cswage_part_female.png, replace


*Mini

cls
set more off

use "\Preliminars",clear
cd ""

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

qui sum perce20
scalar r_1_full_`i'=r(mean)

qui sum perce40
scalar r_2_full_`i'=r(mean)

qui sum perce60
scalar r_3_full_`i'=r(mean)

qui sum perce80
scalar r_4_full_`i'=r(mean)

display r_1_full_`i'
display r_2_full_`i'
display r_3_full_`i'
display r_4_full_`i'

gen counter_r=_n
drop if counter_r>1

keep perce* year

save deciles_`i'.dta, replace

restore

}
*

use deciles_1999.dta, clear
forval i=2000(1)2010 {
append using deciles_`i'.dta
}
*

gen log_perce80=log(perce80)
gen log_perce60=log(perce60)
gen log_perce40=log(perce40)
gen log_perce20=log(perce20)

sort year

gen log_dev_perce80=log_perce80-log_perce80[1]
gen log_dev_perce60=log_perce60-log_perce60[1]
gen log_dev_perce40=log_perce40-log_perce40[1]
gen log_dev_perce20=log_perce20-log_perce20[1]

label variable perce80 "P80"
label variable perce60 "P60"
label variable perce40 "P40"
label variable perce20 "P20"

label variable log_dev_perce80 "P80"
label variable log_dev_perce60 "P60"
label variable log_dev_perce40 "P40"
label variable log_dev_perce20 "P20"

quietly twoway line log_dev_perce80 log_dev_perce60 log_dev_perce40 log_dev_perce20 year, ytitle({bf:Log Deviations}, size(large) height(5)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export perce_cswage_mini_female.png, replace

*
