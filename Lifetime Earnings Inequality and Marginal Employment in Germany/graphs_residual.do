*Residual EVERYTHING I CAN:
/*
*Figure IVS Card
*5Year Earnings Inequality
cls
set more off


***

 cls
 set more off

*** Unconditional

use "\bonke_1999_5years_unc_full",clear
cd ""
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_full

forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_full"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_full=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

append using "\bonke_1999_5years_unc_part"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_part
forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_part"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_part=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

append using "\bonke_1999_5years_unc_mini"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_mini
forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_mini"
replace var_lt_work_1999_mini=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_mini=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_mini=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_mini=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_mini=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_mini=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_mini=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

levels year, local(reg)

***full

bysort year: egen sd_full=sd(log_sum_earnings_yearly_full)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_full i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_full-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_full i.educ*i.age i.region if year == `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_full-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_full_mincer_region=sd(u_mincer_region)

*
label variable sd_full "Std. Dev."
label variable sd_full_mincer "Std. Dev. Mincer"
*label variable sd_full_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_full sd_full_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_full_unc.png, replace

***

drop u_mincer
***part

bysort year: egen sd_part=sd(log_sum_earnings_yearly_part)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_part i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_part-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_part_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_part i.educ*i.age i.region== `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_part-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_part_mincer_region=sd(u_mincer_region)

*
label variable sd_part "Std. Dev."
label variable sd_part_mincer "Std. Dev. Mincer"
*label variable sd_part_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_part sd_part_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_part_unc.png, replace

drop u_mincer
***mini

bysort year: egen sd_mini=sd(log_sum_earnings_yearly_mini)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_mini i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_mini-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_mini_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_mini i.educ*i.age i.region if year == `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_mini-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_mini_mincer_region=sd(u_mincer_region)

*
label variable sd_mini "Std. Dev."
label variable sd_mini_mincer "Std. Dev. Mincer"
*label variable sd_mini_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_mini sd_mini_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_mini_unc.png, replace


*** Male

use "\bonke_1999_5years_male_full",clear
cd ""
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_full

forval i=2000/2010 {
append using "\bonke_`i'_5years_male_full"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_full=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

append using "\bonke_1999_5years_male_part"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_part
forval i=2000/2010 {
append using "\bonke_`i'_5years_male_part"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_part=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

append using "\bonke_1999_5years_male_mini"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_mini
forval i=2000/2010 {
append using "\bonke_`i'_5years_male_mini"
replace var_lt_work_1999_mini=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_mini=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_mini=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_mini=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_mini=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_mini=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_mini=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

levels year, local(reg)

***full

bysort year: egen sd_full=sd(log_sum_earnings_yearly_full)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_full i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_full-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_full i.educ*i.age i.region if year == `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_full-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_full_mincer_region=sd(u_mincer_region)

*
label variable sd_full "Std. Dev."
label variable sd_full_mincer "Std. Dev. Mincer"
*label variable sd_full_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_full sd_full_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_full_male.png, replace

***

drop u_mincer
***part

bysort year: egen sd_part=sd(log_sum_earnings_yearly_part)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_part i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_part-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_part_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_part i.educ*i.age i.region== `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_part-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_part_mincer_region=sd(u_mincer_region)

*
label variable sd_part "Std. Dev."
label variable sd_part_mincer "Std. Dev. Mincer"
*label variable sd_part_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_part sd_part_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_part_male.png, replace

drop u_mincer
***mini

bysort year: egen sd_mini=sd(log_sum_earnings_yearly_mini)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_mini i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_mini-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_mini_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_mini i.educ*i.age i.region if year == `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_mini-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_mini_mincer_region=sd(u_mincer_region)

*
label variable sd_mini "Std. Dev."
label variable sd_mini_mincer "Std. Dev. Mincer"
*label variable sd_mini_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_mini sd_mini_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_mini_male.png, replace


*** Female

use "\bonke_1999_5years_female_full",clear
cd ""
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_full

forval i=2000/2010 {
append using "\bonke_`i'_5years_female_full"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_full=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

append using "\bonke_1999_5years_female_part"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_part
forval i=2000/2010 {
append using "\bonke_`i'_5years_female_part"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_part=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

append using "\bonke_1999_5years_female_mini"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_mini
forval i=2000/2010 {
append using "\bonke_`i'_5years_female_mini"
replace var_lt_work_1999_mini=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_mini=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_mini=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_mini=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_mini=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_mini=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_mini=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

levels year, local(reg)

***full

bysort year: egen sd_full=sd(log_sum_earnings_yearly_full)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_full i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_full-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_full i.educ*i.age i.region if year == `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_full-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_full_mincer_region=sd(u_mincer_region)

*
label variable sd_full "Std. Dev."
label variable sd_full_mincer "Std. Dev. Mincer"
*label variable sd_full_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_full sd_full_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_full_female.png, replace

***

drop u_mincer
***part

bysort year: egen sd_part=sd(log_sum_earnings_yearly_part)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_part i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_part-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_part_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_part i.educ*i.age i.region== `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_part-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_part_mincer_region=sd(u_mincer_region)

*
label variable sd_part "Std. Dev."
label variable sd_part_mincer "Std. Dev. Mincer"
*label variable sd_part_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_part sd_part_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_part_female.png, replace

drop u_mincer
***mini

bysort year: egen sd_mini=sd(log_sum_earnings_yearly_mini)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_mini i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_mini-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_mini_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_mini i.educ*i.age i.region if year == `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_mini-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_mini_mincer_region=sd(u_mincer_region)

*
label variable sd_mini "Std. Dev."
label variable sd_mini_mincer "Std. Dev. Mincer"
*label variable sd_mini_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_mini sd_mini_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_mini_female.png, replace


***BELOW 30

*** Male

use "\bonke_1999_5years_male_full_below30",clear
cd ""
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_full

forval i=2000/2010 {
append using "\bonke_`i'_5years_male_full_below30"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_full=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

append using "\bonke_1999_5years_male_part_below30"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_part
forval i=2000/2010 {
append using "\bonke_`i'_5years_male_part_below30"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_part=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

append using "\bonke_1999_5years_male_mini_below30"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_mini
forval i=2000/2010 {
append using "\bonke_`i'_5years_male_mini_below30"
replace var_lt_work_1999_mini=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_mini=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_mini=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_mini=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_mini=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_mini=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_mini=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

levels year, local(reg)

***full

bysort year: egen sd_full=sd(log_sum_earnings_yearly_full)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_full i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_full-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_full i.educ*i.age i.region if year == `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_full-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_full_mincer_region=sd(u_mincer_region)

*
label variable sd_full "Std. Dev."
label variable sd_full_mincer "Std. Dev. Mincer"
*label variable sd_full_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_full sd_full_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_full_male_below30.png, replace

***

drop u_mincer
***part

bysort year: egen sd_part=sd(log_sum_earnings_yearly_part)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_part i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_part-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_part_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_part i.educ*i.age i.region== `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_part-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_part_mincer_region=sd(u_mincer_region)

*
label variable sd_part "Std. Dev."
label variable sd_part_mincer "Std. Dev. Mincer"
*label variable sd_part_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_part sd_part_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_part_male_below30.png, replace

drop u_mincer
***mini

bysort year: egen sd_mini=sd(log_sum_earnings_yearly_mini)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_mini i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_mini-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_mini_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_mini i.educ*i.age i.region if year == `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_mini-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_mini_mincer_region=sd(u_mincer_region)

*
label variable sd_mini "Std. Dev."
label variable sd_mini_mincer "Std. Dev. Mincer"
*label variable sd_mini_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_mini sd_mini_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_mini_male_below30.png, replace


*** Female

use "\bonke_1999_5years_female_full_below30",clear
cd ""
sort year gini_lt_work

rename var_lt_work_1999 var_lt_work_1999_full
rename gini_lt_work_1999 gini_lt_work_1999_full
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_full
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_full

forval i=2000/2010 {
append using "\bonke_`i'_5years_female_full_below30"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_full=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_full=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_full=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_full=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

append using "\bonke_1999_5years_female_part_below30"
rename var_lt_work_1999 var_lt_work_1999_part
rename gini_lt_work_1999 gini_lt_work_1999_part
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_part
forval i=2000/2010 {
append using "\bonke_`i'_5years_female_part_below30"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_part=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_part=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_part=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_part=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

append using "\bonke_1999_5years_female_mini_below30"
rename var_lt_work_1999 var_lt_work_1999_mini
rename gini_lt_work_1999 gini_lt_work_1999_mini
rename p85_p15_lt_work_1999 p85_p15_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename p85_p15_yearly_work_1999 p85_p15_yearly_work_1999_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
rename log_sum_earnings_yearly_work log_sum_earnings_yearly_mini
forval i=2000/2010 {
append using "\bonke_`i'_5years_female_mini_below30"
replace var_lt_work_1999_mini=var_lt_work_`i' if year==`i' 
replace gini_lt_work_1999_mini=gini_lt_work_`i' if year==`i'
replace p85_p15_lt_work_1999_mini=p85_p15_lt_work_`i' if year==`i'
replace meanlog_earnings_long_term_mini=meanlog_earnings_long_term if year==`i'
replace p85_p15_yearly_work_1999_mini=p85_p15_yearly_work_`i' if year==`i'
replace meanlog_earnings_yearly_mini=meanlog_earnings_yearly if year==`i'
replace log_sum_earnings_yearly_mini=log_sum_earnings_yearly_work if year==`i'
drop var_lt_work_`i' gini_lt_work_`i' p85_p15_lt_work_`i' meanlog_earnings_long_term p85_p15_yearly_work_`i' meanlog_earnings_yearly log_sum_earnings_yearly_work
}
*

levels year, local(reg)

***full

bysort year: egen sd_full=sd(log_sum_earnings_yearly_full)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_full i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_full-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_full i.educ*i.age i.region if year == `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_full-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_full_mincer_region=sd(u_mincer_region)

*
label variable sd_full "Std. Dev."
label variable sd_full_mincer "Std. Dev. Mincer"
*label variable sd_full_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_full sd_full_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_full_female_below30.png, replace

***

drop u_mincer
***part

bysort year: egen sd_part=sd(log_sum_earnings_yearly_part)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_part i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_part-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_part_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_part i.educ*i.age i.region== `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_part-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_part_mincer_region=sd(u_mincer_region)

*
label variable sd_part "Std. Dev."
label variable sd_part_mincer "Std. Dev. Mincer"
*label variable sd_part_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_part sd_part_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_part_female_below30.png, replace

drop u_mincer
***mini

bysort year: egen sd_mini=sd(log_sum_earnings_yearly_mini)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_yearly_mini i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_yearly_mini-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_mini_mincer=sd(u_mincer)

*
*gen u_mincer_region=.
*foreach r of local reg {
*xi: reg log_sum_earnings_yearly_mini i.educ*i.age i.region if year == `r'
*predict y1 if year == `r', xb 
*replace u_mincer_region=log_sum_earnings_yearly_mini-y1 if year == `r'
*drop y1
*}
*
*bysort year: egen sd_mini_mincer_region=sd(u_mincer_region)

*
label variable sd_mini "Std. Dev."
label variable sd_mini_mincer "Std. Dev. Mincer"
*label variable sd_mini_mincer_region "Std. Dev. Mincer+Region"
*
sort year
*
quietly twoway line sd_mini sd_mini_mincer year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mincer_regs_mini_female_below30.png, replace

***EARNINGS UNC

cls
clear
set more off
*set memory 16g
use "\Preliminars",clear
ssc install fastgini

*keep if female==1

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
*
gen log_daily_wage_full=log(daily_wage) if form==1
gen log_daily_wage_part=log(daily_wage) if form==2
gen log_daily_wage_mini=log(daily_wage) if form==3
*
*gen Log Deviations by year:
levels year, local(reg)
*foreach r of local reg {
*egen sd_full_wage=sd(log_daily_wage) if year == `r' & form==1
*egen sd_part_wage=sd(log_daily_wage) if year == `r' & form==2
*replace var_cs_full_wage=sd_full_wage if year == `r' & form==1 
*replace var_cs_part_wage=sd_part_wage if year == `r' & form==2 
*drop sd_full_wage sd_part_wage
*}
*forval r=1999/2014 {
*egen sd_mini_wage=sd(log_daily_wage) if year == `r' & form==3
*replace var_cs_mini_wage=sd_mini_wage if year == `r' & form==3 
*drop sd_mini_wage
*}
*
*replace var_cs_mini_wage=var_cs_mini_wage^2
*replace var_cs_part_wage=var_cs_part_wage^2
*replace var_cs_full_wage=var_cs_full_wage^2
*
gen u_mincer_full=.
foreach r of local reg {
xi: reg log_daily_wage_full i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_full=log_daily_wage_full-y1 if year == `r'
drop y1
}
*
*
gen u_mincer_part=.
foreach r of local reg {
xi: reg log_daily_wage_part i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_part=log_daily_wage_part-y1 if year == `r'
drop y1
}
*
*
gen u_mincer_mini=.
forval r=1999/2014 {
xi: reg log_daily_wage_mini i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_mini=log_daily_wage_mini-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer=sd(u_mincer_full)
bysort year: egen sd_part_mincer=sd(u_mincer_part)
bysort year: egen sd_mini_mincer=sd(u_mincer_mini)
*drop var_cs_full var_cs_part var_cs_mini
gen var_cs_full_wage=sd_full_mincer^2
gen var_cs_part_wage=sd_part_mincer^2
gen var_cs_mini_wage=sd_mini_mincer^2

label variable var_cs_full_wage "Full Time"
label variable var_cs_part_wage "Part Time"
label variable var_cs_mini_wage "Marg. Employment"

quietly twoway line var_cs_full_wage var_cs_part_wage var_cs_mini_wage year, ytitle({bf:Var[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_wage_unc_resid.png, replace

***EARNINGS UNC

cls
clear
set more off
*set memory 16g
use "\Preliminars",clear
ssc install fastgini

drop if source!=1

*keep if female==1

*** Cross Sectional Gini on Long Term Earnings

qui drop if age<24
qui drop if age>55
*this is to keep those that are in the sample starting at age 24...
*gen begin=1 if age==24
*bysort persn: egen sum_begin=sum(begin)
*bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
*keep if ind_begin==1

*qui gen reason_perm=1 if reason_notif==0 | reason_notif==6
bysort persnr year: gen counter=_n
drop if counter!=1

*
*gen Log Deviations by year:
levels year, local(reg)
*foreach r of local reg {
*egen sd_full_wage=sd(log_daily_wage) if year == `r' & form==1
*egen sd_part_wage=sd(log_daily_wage) if year == `r' & form==2
*replace var_cs_full_wage=sd_full_wage if year == `r' & form==1 
*replace var_cs_part_wage=sd_part_wage if year == `r' & form==2 
*drop sd_full_wage sd_part_wage
*}
*forval r=1999/2014 {
*egen sd_mini_wage=sd(log_daily_wage) if year == `r' & form==3
*replace var_cs_mini_wage=sd_mini_wage if year == `r' & form==3 
*drop sd_mini_wage
*}
*
*replace var_cs_mini_wage=var_cs_mini_wage^2
*replace var_cs_part_wage=var_cs_part_wage^2
*replace var_cs_full_wage=var_cs_full_wage^2
*
gen u_mincer_full=.
foreach r of local reg {
xi: reg log_earnings_year_full i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_full=log_earnings_year_full-y1 if year == `r'
drop y1
}
*
*
gen u_mincer_part=.
foreach r of local reg {
xi: reg log_earnings_year_part i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_part=log_earnings_year_part-y1 if year == `r'
drop y1
}
*
*
gen u_mincer_mini=.
forval r=1999/2014 {
xi: reg log_earnings_year_mini i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_mini=log_earnings_year_mini-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer=sd(u_mincer_full)
bysort year: egen sd_part_mincer=sd(u_mincer_part)
bysort year: egen sd_mini_mincer=sd(u_mincer_mini)
*drop var_cs_full var_cs_part var_cs_mini
gen var_cs_full=sd_full_mincer^2
gen var_cs_part=sd_part_mincer^2
gen var_cs_mini=sd_mini_mincer^2

label variable var_cs_full "Full Time"
label variable var_cs_part "Part Time"
label variable var_cs_mini "Marg. Employment"

quietly twoway line var_cs_full var_cs_part var_cs_mini year, ytitle({bf:Var[log(Earnings)]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.9, labsize(large) angle(horizontal))
graph export var_form_unc_resid.png, replace
