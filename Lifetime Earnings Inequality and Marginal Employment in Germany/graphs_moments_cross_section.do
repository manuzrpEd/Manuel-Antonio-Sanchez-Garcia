set more off

use "\moments_cross_section",clear
cd ""
sort year

*
rename mean_full_time Full_TimeMar	
rename mean_exc_part_time Exclusive_Part_Time
rename mean_marginal_employment Marginal_Employment

label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"

quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:E[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
*quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:E[log(w{sub:i})]}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid solid dash dash_dot) lwidth(medium medthick medthick thick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mean_emp.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment

*
rename skew_full_time Full_Time
rename skew_exc_part_time Exclusive_Part_Time
rename skew_marginal_employment Marginal_Employment

label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"

quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Skew[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export skew_emp.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment

rename sd_full_time Full_Time
rename sd_exc_part_time Exclusive_Part_Time
rename sd_marginal_employment Marginal_Employment

label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"

quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Var[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0.2 (0.2) 1.4, labsize(large) angle(horizontal))
graph export var_emp.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment

rename kurt_full_time Full_Time
rename kurt_exc_part_time Exclusive_Part_Time
rename kurt_marginal_employment Marginal_Employment

label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"

quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Kurt[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(2 (2) 10, labsize(large) angle(horizontal))
graph export kurt_emp.png, replace
*

***

drop Full_Time Exclusive_Part_Time Marginal_Employment

*
label variable fract_contr ">2 Contracts"
label variable fract_conc "Concurrent"
quietly twoway line fract_contr fract_conc year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(black black) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export fract_contr.png, replace

rename mean_days_epi Unconditional
rename mean_days_epi_full Full_Time
rename mean_days_epi_part Exclusive_Part_Time
rename mean_days_epi_mini Marginal_Employment

label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"

quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:E[# Days]}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red green) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (90) 360, labsize(large) angle(horizontal))
graph export mean_days_epi.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

***
*
rename gini_cs Unconditional
rename gini_cs_full Full_Time
rename gini_cs_part Exclusive_Part_Time
rename gini_cs_mini Marginal_Employment

label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"

quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:G[Earnings]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export gini_form.png, replace

drop Unconditional Full_Time Exclusive_Part_Time Marginal_Employment Unconditional
*

*

rename mean Unconditional
rename mean_full_time_form Full_Time
rename mean_exc_part_time_form Exclusive_Part_Time
rename mean_marginal_employment_form Marginal_Employment

label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"

*quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:E[log(earnings{sub:i})]}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:E[log(earnings{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mean_emp_form.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

rename skew Unconditional
rename skew_full_time_form Full_Time
rename skew_exc_part_time_form Exclusive_Part_Time
rename skew_marginal_employment_form Marginal_Employment
label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Skew[log(earnings{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export skew_emp_form.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

rename sd Unconditional
rename sd_full_time_form Full_Time
rename sd_exc_part_time_form Exclusive_Part_Time
rename sd_marginal_employment_form Marginal_Employment
label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Var[log(earnings{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0.2 (0.2) 1.4, labsize(large) angle(horizontal))
graph export var_emp_form.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

rename kurt Unconditional
rename kurt_full_time_form Full_Time
rename kurt_exc_part_time_form Exclusive_Part_Time
rename kurt_marginal_employment_form Marginal_Employment
label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Kurt[log(earnings{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(2 (2) 10, labsize(large) angle(horizontal))
graph export kurt_emp_form.png, replace
*

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

rename mean_ft Full_Time
rename mean_ept Exclusive_Part_Time
rename mean_me Marginal_Employment
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red green) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export fract_emp.png, replace

***

*
twoway (kdensity log_daily_wage if form==1 & year==1975) (kdensity log_daily_wage if form==1 & year==1985) (kdensity log_daily_wage if form==1 & year==1995) (kdensity log_daily_wage if form==1 & year==1999) (kdensity log_daily_wage if form==1 & year==2004) (kdensity log_daily_wage if form==1 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(w{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1985") lab(3 "1995") lab(4 "1999") lab(5 "2004") lab(6 "2014")) graphregion(color(white)) ytitle({bf:f(log(w{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (1) 8)
graph export kdens_full_time.png, replace

twoway (kdensity log_daily_wage if form==2 & year==1975) (kdensity log_daily_wage if form==2 & year==1985) (kdensity log_daily_wage if form==2 & year==1995) (kdensity log_daily_wage if form==2 & year==1999) (kdensity log_daily_wage if form==2 & year==2004) (kdensity log_daily_wage if form==2 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(w{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1985") lab(3 "1995") lab(4 "1999") lab(5 "2004") lab(6 "2014")) graphregion(color(white)) ytitle({bf:f(log(w{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (1) 8)
graph export kdens_exc_part_time.png, replace

twoway (kdensity log_daily_wage if form==3 & year==1999) (kdensity log_daily_wage if form==3 & year==2004) (kdensity log_daily_wage if form==3 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(w{sub:i})}, size(large) height(7))  legend(lab(1 "1999") lab(2 "2004") lab(3 "2014")) graphregion(color(white)) ytitle({bf:f(log(w{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (1) 8)
graph export kdens_marginal_employment.png, replace
*

qui sum median if year==1975
local median_1975=r(mean)
qui sum p15 if year==1975
local p15_1975=r(mean)
qui sum p85 if year==1975
local p85_1975=r(mean)

*



twoway (kdensity log_earnings_year if year==1975, color(blue)), graphregion(color(white))  xtitle("") ytitle("") legend(on pos(11) ring(0) label(1 "1975"))  ylabel(0 (0.5) 1, labsize(large) angle(horizontal)) xlabel(4 (2) 14) xline(`p15_1975' `median_1975' `p85_1975', lpattern(dash) lcolor(blue)) saving(1975, replace)


qui sum median if year==1995
local median_1995=r(mean)
qui sum p15 if year==1995
local p15_1995=r(mean)
qui sum p85 if year==1995
local p85_1995=r(mean)

twoway (kdensity log_earnings_year if year==1995, color(red)), legend(position(6) rows(1)) ytitle("") xtitle("") legend(on pos(11) ring(0) lab(1 "1995")) graphregion(color(white)) ylabel(0 (0.5) 1, labsize(large) angle(horizontal)) xlabel(4 (2) 14) xline(`p15_1995' `median_1995' `p85_1995', lpattern(dash) lcolor(red)) saving(1995, replace)


qui sum median if year==2010
local median_2010=r(mean)
qui sum p15 if year==2010
local p15_2010=r(mean)
qui sum p85 if year==2010
local p85_2010=r(mean)

twoway (kdensity log_earnings_year if year==2010, color(green)), legend(ring(0) position(6) rows(1)) ytitle("") xtitle({bf:log(earnings{sub:i})}, size(large) height(7)) legend(on pos(11) ring(0) lab(1 "2010")) graphregion(color(white)) ylabel(0 (0.5) 1, labsize(large) angle(horizontal)) xlabel(4 (2) 14) xline(`p15_2010' `median_2010' `p85_2010', lpattern(dash) lcolor(green)) saving(2010, replace)

gr combine 1975.gph 1995.gph 2010.gph, col(1) iscale(1)
graph export kernel.png, replace

*twoway (kdensity log_earnings_year if year==1975, color(blue)) (kdensity log_earnings_year if year==1995, color(red)) (kdensity log_earnings_year if year==2010, color(green)), legend(position(6) rows(1))  xtitle({bf:log(earnings{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1995") lab(3 "2010")) graphregion(color(white)) ytitle({bf:f(log(earnings{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(4 (2) 14) xline(`p15_1975' `median_1975' `p85_1975', lpattern(dash) lcolor(blue)) xline(`p15_1995' `median_1995' `p85_1995', lpattern(dash) lcolor(red)) xline(`p15_2010' `median_2010' `p85_2010', lpattern(dash) lcolor(green)) 
*graph export kdens_log_earnings.png, replace




*
twoway (kdensity log_earnings_year_form if form==1 & year==1975) (kdensity log_earnings_year_form if form==1 & year==1985) (kdensity log_earnings_year_form if form==1 & year==1995) (kdensity log_earnings_year_form if form==1 & year==1999) (kdensity log_earnings_year_form if form==1 & year==2004) (kdensity log_earnings_year_form if form==1 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(earnings{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1985") lab(3 "1995") lab(4 "1999") lab(5 "2004") lab(6 "2014")) graphregion(color(white)) ytitle({bf:f(log(earnings{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (2) 14)
graph export kdens_full_time_form.png, replace

twoway (kdensity log_earnings_year_form if form==2 & year==1975) (kdensity log_earnings_year_form if form==2 & year==1985) (kdensity log_earnings_year_form if form==2 & year==1995) (kdensity log_earnings_year_form if form==2 & year==1999) (kdensity log_earnings_year_form if form==2 & year==2004) (kdensity log_earnings_year_form if form==2 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(earnings{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1985") lab(3 "1995") lab(4 "1999") lab(5 "2004") lab(6 "2014")) graphregion(color(white)) ytitle({bf:f(log(earnings{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (2) 14)
graph export kdens_exc_part_time_form.png, replace

twoway (kdensity log_earnings_year_form if form==3 & year==1999) (kdensity log_earnings_year_form if form==3 & year==2004) (kdensity log_earnings_year_form if form==3 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(earnings{sub:i})}, size(large) height(7))  legend(lab(1 "1999") lab(2 "2004") lab(3 "2014")) graphregion(color(white)) ytitle({bf:f(log(earnings{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (2) 14)
graph export kdens_marginal_employment_form.png, replace
*

***
*
***FEMALE***

use "\moments_cross_section_fem",clear
cd ""
sort year

*
rename mean_full_time Full_Time
rename mean_exc_part_time Exclusive_Part_Time
rename mean_marginal_employment Marginal_Employment
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:E[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mean_emp_fem.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment 

rename skew_full_time Full_Time
rename skew_exc_part_time Exclusive_Part_Time
rename skew_marginal_employment Marginal_Employment
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Skew[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export skew_emp_fem.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment

rename sd_full_time Full_Time
rename sd_exc_part_time Exclusive_Part_Time
rename sd_marginal_employment Marginal_Employment
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Var[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0.2 (0.2) 1.4, labsize(large) angle(horizontal))
graph export var_emp_fem.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment

rename kurt_full_time Full_Time
rename kurt_exc_part_time Exclusive_Part_Time
rename kurt_marginal_employment Marginal_Employment
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Kurt[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(2 (2) 10, labsize(large) angle(horizontal))
graph export kurt_emp_fem.png, replace
*

***

drop Full_Time Exclusive_Part_Time Marginal_Employment
*
label variable fract_contr ">2 Contracts"
label variable fract_conc "Concurrent"
quietly twoway line fract_contr fract_conc year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(black black) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export fract_contr_fem.png, replace

rename mean_days_epi Unconditional
rename mean_days_epi_full Full_Time
rename mean_days_epi_part Exclusive_Part_Time
rename mean_days_epi_mini Marginal_Employment

label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"

quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:E[# Days]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (90) 360, labsize(large) angle(horizontal))
graph export mean_days_epi_fem.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

*
rename gini_cs Unconditional
rename gini_cs_full Full_Time
rename gini_cs_part Exclusive_Part_Time
rename gini_cs_mini Marginal_Employment

label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"

quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:G[Earnings]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export gini_form_fem.png, replace

drop Unconditional Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

rename mean Unconditional
rename mean_full_time_form Full_Time
rename mean_exc_part_time_form Exclusive_Part_Time
rename mean_marginal_employment_form Marginal_Employment
label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:E[log(earnings{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mean_emp_form_fem.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

rename skew Unconditional
rename skew_full_time_form Full_Time
rename skew_exc_part_time_form Exclusive_Part_Time
rename skew_marginal_employment_form Marginal_Employment
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"

quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Skew[log(earnings{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export skew_emp_form_fem.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

rename sd Unconditional
rename sd_full_time_form Full_Time
rename sd_exc_part_time_form Exclusive_Part_Time
rename sd_marginal_employment_form Marginal_Employment
label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Var[log(earnings{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0.2 (0.2) 1.4, labsize(large) angle(horizontal))
graph export var_emp_form_fem.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

rename kurt Unconditional
rename kurt_full_time_form Full_Time
rename kurt_exc_part_time_form Exclusive_Part_Time
rename kurt_marginal_employment_form Marginal_Employment
label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Kurt[log(earnings{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(2 (2) 10, labsize(large) angle(horizontal))
graph export kurt_emp_form_fem.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional
*

rename mean_ft Full_Time
rename mean_ept Exclusive_Part_Time
rename mean_me Marginal_Employment
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Fraction}, lcolor(blue red green) size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export fract_emp_fem.png, replace

***

qui sum median if year==1975
local median_1975=r(mean)
qui sum p15 if year==1975
local p15_1975=r(mean)
qui sum p85 if year==1975
local p85_1975=r(mean)

twoway (kdensity log_earnings_year if year==1975, color(blue)), legend(position(6) rows(1)) xtitle("") ytitle("")  legend(on pos(11) ring(0) lab(1 "1975")) graphregion(color(white)) ylabel(0 (0.5) 1, labsize(large) angle(horizontal)) xlabel(4 (2) 14) xline(`p15_1975' `median_1975' `p85_1975', lpattern(dash) lcolor(blue)) saving(1975, replace)


qui sum median if year==1995
local median_1995=r(mean)
qui sum p15 if year==1995
local p15_1995=r(mean)
qui sum p85 if year==1995
local p85_1995=r(mean)

twoway (kdensity log_earnings_year if year==1995, color(red)), legend(position(6) rows(1)) ytitle("") xtitle("") legend(on pos(11) ring(0) lab(1 "1995")) graphregion(color(white)) ylabel(0 (0.5) 1, labsize(large) angle(horizontal)) xlabel(4 (2) 14) xline(`p15_1995' `median_1995' `p85_1995', lpattern(dash) lcolor(red)) saving(1995, replace)


qui sum median if year==2010
local median_2010=r(mean)
qui sum p15 if year==2010
local p15_2010=r(mean)
qui sum p85 if year==2010
local p85_2010=r(mean)

twoway (kdensity log_earnings_year if year==2010, color(green)), legend(position(6) rows(1)) ytitle("") xtitle({bf:log(earnings{sub:i})}, size(large) height(7)) legend(on pos(11) ring(0) lab(1 "2010")) graphregion(color(white)) ylabel(0 (0.5) 1, labsize(large) angle(horizontal)) xlabel(4 (2) 14) xline(`p15_2010' `median_2010' `p85_2010', lpattern(dash) lcolor(green)) saving(2010, replace)

gr combine 1975.gph 1995.gph 2010.gph, col(1) iscale(1)
graph export kernel_fem.png, replace
*
twoway (kdensity log_daily_wage if form==1 & year==1975) (kdensity log_daily_wage if form==1 & year==1985) (kdensity log_daily_wage if form==1 & year==1995) (kdensity log_daily_wage if form==1 & year==1999) (kdensity log_daily_wage if form==1 & year==2004) (kdensity log_daily_wage if form==1 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(w{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1985") lab(3 "1995") lab(4 "1999") lab(5 "2004") lab(6 "2014")) graphregion(color(white)) ytitle({bf:f(log(w{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (1) 8)
graph export kdens_full_time_fem.png, replace

twoway (kdensity log_daily_wage if form==2 & year==1975) (kdensity log_daily_wage if form==2 & year==1985) (kdensity log_daily_wage if form==2 & year==1995) (kdensity log_daily_wage if form==2 & year==1999) (kdensity log_daily_wage if form==2 & year==2004) (kdensity log_daily_wage if form==2 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(w{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1985") lab(3 "1995") lab(4 "1999") lab(5 "2004") lab(6 "2014")) graphregion(color(white)) ytitle({bf:f(log(w{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (1) 8)
graph export kdens_exc_part_time_fem.png, replace

twoway (kdensity log_daily_wage if form==3 & year==1999) (kdensity log_daily_wage if form==3 & year==2004) (kdensity log_daily_wage if form==3 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(w{sub:i})}, size(large) height(7))  legend(lab(1 "1999") lab(2 "2004") lab(3 "2014")) graphregion(color(white)) ytitle({bf:f(log(w{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (1) 8)
graph export kdens_marginal_employment_fem.png, replace
*

*
twoway (kdensity log_earnings_year if year==1975) (kdensity log_earnings_year if year==1985) (kdensity log_earnings_year if year==1995) (kdensity log_earnings_year if year==1999) (kdensity log_earnings_year if year==2004) (kdensity log_earnings_year if year==2014), legend(position(6) rows(1))  xtitle({bf:log(earnings{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1985") lab(3 "1995") lab(4 "1999") lab(5 "2004") lab(6 "2014")) graphregion(color(white)) ytitle({bf:f(log(earnings{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(4 (2) 14)
graph export kdens_log_earnings_fem.png, replace

*
twoway (kdensity log_earnings_year_form if form==1 & year==1975) (kdensity log_earnings_year_form if form==1 & year==1985) (kdensity log_earnings_year_form if form==1 & year==1995) (kdensity log_earnings_year_form if form==1 & year==1999) (kdensity log_earnings_year_form if form==1 & year==2004) (kdensity log_earnings_year_form if form==1 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(earnings{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1985") lab(3 "1995") lab(4 "1999") lab(5 "2004") lab(6 "2014")) graphregion(color(white)) ytitle({bf:f(log(earnings{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (2) 14)
graph export kdens_full_time_form_fem.png, replace

twoway (kdensity log_earnings_year_form if form==2 & year==1975) (kdensity log_earnings_year_form if form==2 & year==1985) (kdensity log_earnings_year_form if form==2 & year==1995) (kdensity log_earnings_year_form if form==2 & year==1999) (kdensity log_earnings_year_form if form==2 & year==2004) (kdensity log_earnings_year_form if form==2 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(earnings{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1985") lab(3 "1995") lab(4 "1999") lab(5 "2004") lab(6 "2014")) graphregion(color(white)) ytitle({bf:f(log(earnings{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (2) 14)
graph export kdens_exc_part_time_form_fem.png, replace

twoway (kdensity log_earnings_year_form if form==3 & year==1999) (kdensity log_earnings_year_form if form==3 & year==2004) (kdensity log_earnings_year_form if form==3 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(earnings{sub:i})}, size(large) height(7))  legend(lab(1 "1999") lab(2 "2004") lab(3 "2014")) graphregion(color(white)) ytitle({bf:f(log(earnings{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (2) 14)
graph export kdens_marginal_employment_form_fem.png, replace
*
*
*
*

*

***Unc

use "\moments_cross_section_unc",clear
cd ""
sort year

*
rename mean_full_time Full_Time
rename mean_exc_part_time Exclusive_Part_Time
rename mean_marginal_employment Marginal_Employment
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:E[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mean_emp_unc.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment 

*rename skew_full_time Full_Time
*rename skew_exc_part_time Exclusive_Part_Time
*rename skew_marginal_employment Marginal_Employment
*label variable Full_Time "Full Time"
*label variable Exclusive_Part_Time "Part Time"
*label variable Marginal_Employment "Mini Jobs"
*quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Skew[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
*graph export skew_emp_unc.png, replace

*drop Full_Time Exclusive_Part_Time Marginal_Employment


rename sd_full_time Full_Time
rename sd_exc_part_time Exclusive_Part_Time
rename sd_marginal_employment Marginal_Employment
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Var[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0.2 (0.2) 1.4, labsize(large) angle(horizontal))
graph export var_emp_unc.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment

rename kurt_full_time Full_Time
rename kurt_exc_part_time Exclusive_Part_Time
rename kurt_marginal_employment Marginal_Employment
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Kurt[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(2 (2) 10, labsize(large) angle(horizontal))
graph export kurt_emp_unc.png, replace
*

***

drop Full_Time Exclusive_Part_Time Marginal_Employment
*
label variable fract_contr ">2 Contracts"
label variable fract_conc "Concurrent"
quietly twoway line fract_contr fract_conc year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(black black) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export fract_contr_unc.png, replace

rename mean_days_epi Unconditional
rename mean_days_epi_full Full_Time
rename mean_days_epi_part Exclusive_Part_Time
rename mean_days_epi_mini Marginal_Employment

label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"

quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:E[# Days]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (90) 360, labsize(large) angle(horizontal))
graph export mean_days_epi_unc.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

*
rename gini_cs Unconditional
rename gini_cs_full Full_Time
rename gini_cs_part Exclusive_Part_Time
rename gini_cs_mini Marginal_Employment

label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"

quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:G[Earnings]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export gini_form_unc.png, replace

drop Unconditional Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

rename mean Unconditional
rename mean_full_time_form Full_Time
rename mean_exc_part_time_form Exclusive_Part_Time
rename mean_marginal_employment_form Marginal_Employment
label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:E[log(earnings{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mean_emp_form_unc.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

rename skew Unconditional
rename skew_full_time_form Full_Time
rename skew_exc_part_time_form Exclusive_Part_Time
rename skew_marginal_employment_form Marginal_Employment
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"

quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Skew[log(earnings{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export skew_emp_form_unc.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

rename sd Unconditional
rename sd_full_time_form Full_Time
rename sd_exc_part_time_form Exclusive_Part_Time
rename sd_marginal_employment_form Marginal_Employment
label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Var[log(earnings{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0.2 (0.2) 1.4, labsize(large) angle(horizontal))
graph export var_emp_form_unc.png, replace

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

rename kurt Unconditional
rename kurt_full_time_form Full_Time
rename kurt_exc_part_time_form Exclusive_Part_Time
rename kurt_marginal_employment_form Marginal_Employment
label variable Unconditional "Unconditional"
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
quietly twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Kurt[log(earnings{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(2 (2) 10, labsize(large) angle(horizontal))
graph export kurt_emp_form_unc.png, replace
*

drop Full_Time Exclusive_Part_Time Marginal_Employment Unconditional

rename mean_ft Full_Time
rename mean_ept Exclusive_Part_Time
rename mean_me Marginal_Employment
label variable Full_Time "Full Time"
label variable Exclusive_Part_Time "Part Time"
label variable Marginal_Employment "Mini Jobs"
twoway line Full_Time Exclusive_Part_Time Marginal_Employment year, ytitle({bf:Fraction}, lcolor(blue red green) size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export fract_emp_unc.png, replace

***

qui sum median if year==1975
local median_1975=r(mean)
qui sum p15 if year==1975
local p15_1975=r(mean)
qui sum p85 if year==1975
local p85_1975=r(mean)

twoway (kdensity log_earnings_year if year==1975, color(blue)), legend(position(6) rows(1)) xtitle("") ytitle("")  legend(on pos(11) ring(0) lab(1 "1975")) graphregion(color(white)) ylabel(0 (0.5) 1, labsize(large) angle(horizontal)) xlabel(4 (2) 14) xline(`p15_1975' `median_1975' `p85_1975', lpattern(dash) lcolor(blue)) saving(1975, replace)


qui sum median if year==1995
local median_1995=r(mean)
qui sum p15 if year==1995
local p15_1995=r(mean)
qui sum p85 if year==1995
local p85_1995=r(mean)

twoway (kdensity log_earnings_year if year==1995, color(red)), legend(position(6) rows(1)) ytitle("") xtitle("") legend(on pos(11) ring(0) lab(1 "1995")) graphregion(color(white)) ylabel(0 (0.5) 1, labsize(large) angle(horizontal)) xlabel(4 (2) 14) xline(`p15_1995' `median_1995' `p85_1995', lpattern(dash) lcolor(red)) saving(1995, replace)


qui sum median if year==2010
local median_2010=r(mean)
qui sum p15 if year==2010
local p15_2010=r(mean)
qui sum p85 if year==2010
local p85_2010=r(mean)

twoway (kdensity log_earnings_year if year==2010, color(green)), legend(position(6) rows(1)) ytitle("") xtitle({bf:log(earnings{sub:i})}, size(large) height(7)) legend(on pos(11) ring(0) lab(1 "2010")) graphregion(color(white)) ylabel(0 (0.5) 1, labsize(large) angle(horizontal)) xlabel(4 (2) 14) xline(`p15_2010' `median_2010' `p85_2010', lpattern(dash) lcolor(green)) saving(2010, replace)

gr combine 1975.gph 1995.gph 2010.gph, col(1) iscale(1)
graph export kernel_unc.png, replace
*
twoway (kdensity log_daily_wage if form==1 & year==1975) (kdensity log_daily_wage if form==1 & year==1985) (kdensity log_daily_wage if form==1 & year==1995) (kdensity log_daily_wage if form==1 & year==1999) (kdensity log_daily_wage if form==1 & year==2004) (kdensity log_daily_wage if form==1 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(w{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1985") lab(3 "1995") lab(4 "1999") lab(5 "2004") lab(6 "2014")) graphregion(color(white)) ytitle({bf:f(log(w{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (1) 8)
graph export kdens_full_time_fem.png, replace

twoway (kdensity log_daily_wage if form==2 & year==1975) (kdensity log_daily_wage if form==2 & year==1985) (kdensity log_daily_wage if form==2 & year==1995) (kdensity log_daily_wage if form==2 & year==1999) (kdensity log_daily_wage if form==2 & year==2004) (kdensity log_daily_wage if form==2 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(w{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1985") lab(3 "1995") lab(4 "1999") lab(5 "2004") lab(6 "2014")) graphregion(color(white)) ytitle({bf:f(log(w{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (1) 8)
graph export kdens_exc_part_time_fem.png, replace

twoway (kdensity log_daily_wage if form==3 & year==1999) (kdensity log_daily_wage if form==3 & year==2004) (kdensity log_daily_wage if form==3 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(w{sub:i})}, size(large) height(7))  legend(lab(1 "1999") lab(2 "2004") lab(3 "2014")) graphregion(color(white)) ytitle({bf:f(log(w{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (1) 8)
graph export kdens_marginal_employment_fem.png, replace
*
*
twoway (kdensity log_earnings_year if year==1975) (kdensity log_earnings_year if year==1985) (kdensity log_earnings_year if year==1995) (kdensity log_earnings_year if year==1999) (kdensity log_earnings_year if year==2004) (kdensity log_earnings_year if year==2014), legend(position(6) rows(1))  xtitle({bf:log(earnings{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1985") lab(3 "1995") lab(4 "1999") lab(5 "2004") lab(6 "2014")) graphregion(color(white)) ytitle({bf:f(log(earnings{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(4 (2) 14)
graph export kdens_log_earnings_unc.png, replace


twoway (kdensity log_earnings_year_form if form==1 & year==1975) (kdensity log_earnings_year_form if form==1 & year==1985) (kdensity log_earnings_year_form if form==1 & year==1995) (kdensity log_earnings_year_form if form==1 & year==1999) (kdensity log_earnings_year_form if form==1 & year==2004) (kdensity log_earnings_year_form if form==1 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(earnings{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1985") lab(3 "1995") lab(4 "1999") lab(5 "2004") lab(6 "2014")) graphregion(color(white)) ytitle({bf:f(log(earnings{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (2) 14)
graph export kdens_full_time_form_unc.png, replace

twoway (kdensity log_earnings_year_form if form==2 & year==1975) (kdensity log_earnings_year_form if form==2 & year==1985) (kdensity log_earnings_year_form if form==2 & year==1995) (kdensity log_earnings_year_form if form==2 & year==1999) (kdensity log_earnings_year_form if form==2 & year==2004) (kdensity log_earnings_year_form if form==2 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(earnings{sub:i})}, size(large) height(7))  legend(lab(1 "1975") lab(2 "1985") lab(3 "1995") lab(4 "1999") lab(5 "2004") lab(6 "2014")) graphregion(color(white)) ytitle({bf:f(log(earnings{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (2) 14)
graph export kdens_exc_part_time_form_unc.png, replace

twoway (kdensity log_earnings_year_form if form==3 & year==1999) (kdensity log_earnings_year_form if form==3 & year==2004) (kdensity log_earnings_year_form if form==3 & year==2014), legend(position(6) rows(1))  xtitle({bf:log(earnings{sub:i})}, size(large) height(7))  legend(lab(1 "1999") lab(2 "2004") lab(3 "2014")) graphregion(color(white)) ytitle({bf:f(log(earnings{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(2 (2) 14)
graph export kdens_marginal_employment_form_unc.png, replace
*

*** Histogram on Days_Epi by Years

use "\Preliminars",clear
cd ""

drop if west==0

keep if female==0

sort year

qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

histogram days_epi if form==1 & reason_perm==1 & year==1975, xlabel(0 (90) 360, labsize(large)) bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_1975.png, replace

histogram days_epi if form==1 & reason_perm==1 & year==1985, xlabel(0 (90) 360, labsize(large)) bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_1985.png, replace

histogram days_epi if form==1 & reason_perm==1 & year==1995, xlabel(0 (90) 360, labsize(large)) bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_1995.png, replace

histogram days_epi if form==1 & reason_perm==1 & year==2005, xlabel(0 (90) 360, labsize(large)) bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_2005.png, replace

histogram days_epi if form==1 & reason_perm==1 & year==2014, xlabel(0 (90) 360, labsize(large)) bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_2014.png, replace

***

use "\Preliminars",clear
cd ""

drop if west==0

keep if female==1

sort year

qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

histogram days_epi if form==1 & reason_perm==1 & year==1975, xlabel(0 (90) 360, labsize(large))  bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_1975_fem.png, replace

histogram days_epi if form==1 & reason_perm==1 & year==1985, xlabel(0 (90) 360, labsize(large))  bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_1985_fem.png, replace

histogram days_epi if form==1 & reason_perm==1 & year==1995, xlabel(0 (90) 360, labsize(large))  bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_1995_fem.png, replace

histogram days_epi if form==1 & reason_perm==1 & year==2005, xlabel(0 (90) 360, labsize(large))  bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_2005_fem.png, replace

histogram days_epi if form==1 & reason_perm==1 & year==2014, xlabel(0 (90) 360, labsize(large))  bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_2014_fem.png, replace

use "\Preliminars",clear
cd ""

drop if west==0

sort year

qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

histogram days_epi if form==1 & reason_perm==1 & year==1975, xlabel(0 (90) 360, labsize(large)) bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_1975_unc.png, replace

histogram days_epi if form==1 & reason_perm==1 & year==1985, xlabel(0 (90) 360, labsize(large)) bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_1985_unc.png, replace

histogram days_epi if form==1 & reason_perm==1 & year==1995, xlabel(0 (90) 360, labsize(large)) bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_1995_unc.png, replace

histogram days_epi if form==1 & reason_perm==1 & year==2005, xlabel(0 (90) 360, labsize(large)) bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_2005_unc.png, replace

histogram days_epi if form==1 & reason_perm==1 & year==2014, xlabel(0 (90) 360, labsize(large)) bin(8) ylabel(0 (0.005) 0.02, labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_2014_unc.png, replace

***


*** fraction contract days above 6 months

use "\Preliminars",clear
cd ""

keep if female==0

sort year

qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

gen above_6m=1 if days_epi>=180 & days_epi<=370 & reason_perm==1
replace above_6m=0 if days_epi<180 & days_epi>0 & reason_perm==1

*gen above_4m=1 if days_epi>120 & days_epi<270 & reason_perm==1
*replace above_4m=0 if days_epi<=120 & days_epi>0 & reason_perm==1
*replace above_4m=0 if days_epi>=270 & days_epi<=370 & reason_perm==1

gen below_6m=1 if days_epi<=180 & days_epi>0 & reason_perm==1
replace below_6m=0 if days_epi>180 & days_epi<=370 & reason_perm==1

bysort year: egen mean_above6m=mean(above_6m)
*bysort year: egen mean_above4m=mean(above_4m)
bysort year: egen mean_below6m=mean(below_6m)

label variable mean_above6m "> 180 Days"
*label variable mean_above4m "4-9 Months"
label variable mean_below6m "< 180 Days"
quietly twoway line mean_above6m mean_below6m year, ytitle({bf:Fraction}, size(large) height(10)) lcolor(blue blue blue) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export mean_month_spell.png, replace

***

use "\Preliminars",clear
cd ""

keep if female==1

sort year

qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

gen above_6m=1 if days_epi>=180 & days_epi<=370 & reason_perm==1
replace above_6m=0 if days_epi<180 & days_epi>0 & reason_perm==1

*gen above_4m=1 if days_epi>120 & days_epi<270 & reason_perm==1
*replace above_4m=0 if days_epi<=120 & days_epi>0 & reason_perm==1
*replace above_4m=0 if days_epi>=270 & days_epi<=370 & reason_perm==1

gen below_6m=1 if days_epi<=180 & days_epi>0 & reason_perm==1
replace below_6m=0 if days_epi>180 & days_epi<=370 & reason_perm==1

bysort year: egen mean_above6m=mean(above_6m)
*bysort year: egen mean_above4m=mean(above_4m)
bysort year: egen mean_below6m=mean(below_6m)

label variable mean_above6m "> 180 Days"
*label variable mean_above4m "4-9 Months"
label variable mean_below6m "< 180 Days"
quietly twoway line mean_above6m mean_below6m year, ytitle({bf:Fraction}, size(large) height(10)) lcolor(blue blue blue) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export mean_month_spell_fem.png, replace

use "\Preliminars",clear
cd ""

sort year

qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

gen above_6m=1 if days_epi>=180 & days_epi<=370 & reason_perm==1
replace above_6m=0 if days_epi<180 & days_epi>0 & reason_perm==1

*gen above_4m=1 if days_epi>120 & days_epi<270 & reason_perm==1
*replace above_4m=0 if days_epi<=120 & days_epi>0 & reason_perm==1
*replace above_4m=0 if days_epi>=270 & days_epi<=370 & reason_perm==1

gen below_6m=1 if days_epi<=180 & days_epi>0 & reason_perm==1
replace below_6m=0 if days_epi>180 & days_epi<=370 & reason_perm==1

bysort year: egen mean_above6m=mean(above_6m)
*bysort year: egen mean_above4m=mean(above_4m)
bysort year: egen mean_below6m=mean(below_6m)

label variable mean_above6m "> 180 Days"
*label variable mean_above4m "4-9 Months"
label variable mean_below6m "< 180 Days"
quietly twoway line mean_above6m mean_below6m year, ytitle({bf:Fraction}, size(large) height(10)) lcolor(blue blue blue) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export mean_month_spell_unc.png, replace

***

use "\moments_cross_section_unc",clear
cd ""
sort year
*ssc install nsplit

keep if year>1998
keep if source==1
bysort year: egen mean_ind_marginal_empl=mean(ind_marginal_empl)
bysort year: egen mean_ind_marginal_empl_midi=mean(ind_marginal_empl_midi)
bysort year: egen mean_ind_marginal_empl_nomidi=mean(ind_marginal_empl_nomidi)

bysort year: gen counter_year=_n
keep if counter_year==1

label variable mean_ind_marginal_empl "Marginal Empl."
label variable mean_ind_marginal_empl_midi "Midi Jobs"
label variable mean_ind_marginal_empl_nomidi "Mini Jobs"

*quietly twoway line mean_ind_marginal_empl mean_ind_marginal_empl_midi mean_ind_marginal_empl_nomidi year if year>1998, ytitle({bf:Fraction}, size(large) height(10)) lcolor(blue blue blue) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.5, labsize(large) angle(horizontal))


*nsplit year, digits(2 2) gen(rest year2)
graph bar (mean) mean_ind_marginal_empl_nomidi mean_ind_marginal_empl_midi if year>1998, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) ylabel(0 (0.1) 0.4, labsize(large) angle(horizontal)) stack  legend( label(1 "Mini Jobs") label(2 "Midi Jobs") )  
*blabel(bar, position(center)  format(%12.2fc ))
graph export mean_marginal_employment_unc.png, replace

use "\moments_cross_section",clear
cd ""
sort year
*ssc install nsplit

keep if year>1998
keep if source==1
bysort year: egen mean_ind_marginal_empl=mean(ind_marginal_empl)
bysort year: egen mean_ind_marginal_empl_midi=mean(ind_marginal_empl_midi)
bysort year: egen mean_ind_marginal_empl_nomidi=mean(ind_marginal_empl_nomidi)

bysort year: gen counter_year=_n
keep if counter_year==1

label variable mean_ind_marginal_empl "Marginal Empl."
label variable mean_ind_marginal_empl_midi "Midi Jobs"
label variable mean_ind_marginal_empl_nomidi "Mini Jobs"

*quietly twoway line mean_ind_marginal_empl mean_ind_marginal_empl_midi mean_ind_marginal_empl_nomidi year if year>1998, ytitle({bf:Fraction}, size(large) height(10)) lcolor(blue blue blue) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.5, labsize(large) angle(horizontal))


*nsplit year, digits(2 2) gen(rest year2)
graph bar (mean) mean_ind_marginal_empl_nomidi mean_ind_marginal_empl_midi if year>1998, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) ylabel(0 (0.1) 0.4, labsize(large) angle(horizontal)) stack  legend( label(1 "Mini Jobs") label(2 "Midi Jobs") )  
*blabel(bar, position(center)  format(%12.2fc ))
graph export mean_marginal_employment.png, replace

use "\moments_cross_section_fem",clear
cd ""
sort year
*ssc install nsplit

keep if year>1998
keep if source==1
bysort year: egen mean_ind_marginal_empl=mean(ind_marginal_empl)
bysort year: egen mean_ind_marginal_empl_midi=mean(ind_marginal_empl_midi)
bysort year: egen mean_ind_marginal_empl_nomidi=mean(ind_marginal_empl_nomidi)

bysort year: gen counter_year=_n
keep if counter_year==1

label variable mean_ind_marginal_empl "Marginal Empl."
label variable mean_ind_marginal_empl_midi "Midi Jobs"
label variable mean_ind_marginal_empl_nomidi "Mini Jobs"

*quietly twoway line mean_ind_marginal_empl mean_ind_marginal_empl_midi mean_ind_marginal_empl_nomidi year if year>1998, ytitle({bf:Fraction}, size(large) height(10)) lcolor(blue blue blue) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.5, labsize(large) angle(horizontal))


*nsplit year, digits(2 2) gen(rest year2)
graph bar (mean) mean_ind_marginal_empl_nomidi mean_ind_marginal_empl_midi if year>1998, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) ylabel(0 (0.1) 0.4, labsize(large) angle(horizontal)) stack  legend( label(1 "Mini Jobs") label(2 "Midi Jobs") )  
*blabel(bar, position(center)  format(%12.2fc ))
graph export mean_marginal_employment_fem.png, replace

*
use "\moments_cross_section",clear
cd ""
sort year

label variable mean_days_epi_cont "Aggregate"
label variable mean_days_epi_full_cont "Full Time"
label variable mean_days_epi_part_cont "Part Time"
label variable mean_days_epi_mini_cont "Mini Jobs"

quietly twoway line mean_days_epi_full_cont mean_days_epi_part_cont mean_days_epi_mini_cont year if year<2014, ytitle({bf:Fraction}, size(large) height(10)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (90) 360, labsize(large) angle(horizontal))
graph export mean_days_epi_cont.png, replace

*
use "\moments_cross_section_fem",clear
cd ""
sort year

label variable mean_days_epi_cont "Aggregate"
label variable mean_days_epi_full_cont "Full Time"
label variable mean_days_epi_part_cont "Part Time"
label variable mean_days_epi_mini_cont "Mini Jobs"

quietly twoway line mean_days_epi_full_cont mean_days_epi_part_cont mean_days_epi_mini_cont year if year<2014, ytitle({bf:Fraction}, size(large) height(10)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (90) 360, labsize(large) angle(horizontal))
graph export mean_days_epi_cont_fem.png, replace

use "\moments_cross_section_unc",clear
cd ""
sort year

label variable mean_days_epi_cont "Aggregate"
label variable mean_days_epi_full_cont "Full Time"
label variable mean_days_epi_part_cont "Part Time"
label variable mean_days_epi_mini_cont "Mini Jobs"

quietly twoway line mean_days_epi_full_cont mean_days_epi_part_cont mean_days_epi_mini_cont year if year<2014, ytitle({bf:Fraction}, size(large) height(10)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (90) 360, labsize(large) angle(horizontal))
graph export mean_days_epi_cont_unc.png, replace

*** Carrillo 32PDF

set more off
use "\Preliminars",clear
cd ""
keep if year>=1999
sort persnr year

drop if source!=1

*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
bysort persnr year: egen max_days_epi_nomg=max(days_epi) if inrange(form,1,2)
gen ind_primary_nomg=1 if max_days_epi_nomg==days_epi
*bysort persnr year: gen ind=_n
*keep if ind==1

gen p85_full=.
gen p50_full=.
gen p15_full=.
gen p85_p50_full=.
gen p85_p15_full=.
gen p50_p15_full=.
gen p85_full_ind_primary=.
gen p50_full_ind_primary=.
gen p15_full_ind_primary=.
gen p85_p50_full_ind_primary=.
gen p85_p15_full_ind_primary=.
gen p50_p15_full_ind_primary=.
gen p85_full_ind_primary_nomg=.
gen p50_full_ind_primary_nomg=.
gen p15_full_ind_primary_nomg=.
gen p85_p50_full_ind_primary_nomg=.
gen p85_p15_full_ind_primary_nomg=.
gen p50_p15_full_ind_primary_nomg=.
levels year, local(reg)
gen log_def_daily_wage=log(def_daily_wage)
foreach r of local reg {
egen p85 = pctile(daily_wage) if year == `r', p(85)
egen p50 = pctile(daily_wage) if year == `r', p(50)
egen p15 = pctile(daily_wage) if year == `r', p(15)
egen p85_ind_primary = pctile(daily_wage) if year == `r' & ind_primary==1, p(85)
egen p50_ind_primary = pctile(daily_wage) if year == `r' & ind_primary==1, p(50)
egen p15_ind_primary = pctile(daily_wage) if year == `r' & ind_primary==1, p(15)
egen p85_ind_primary_nomg = pctile(daily_wage) if year == `r' & ind_primary_nomg==1, p(85)
egen p50_ind_primary_nomg = pctile(daily_wage) if year == `r' & ind_primary_nomg==1, p(50)
egen p15_ind_primary_nomg = pctile(daily_wage) if year == `r' & ind_primary_nomg==1, p(15)
replace p85_full=p85 if year == `r'
replace p15_full=p15 if year == `r'
replace p50_full=p50 if year == `r'
replace p85_full_ind_primary=p85_ind_primary if year == `r' & ind_primary==1
replace p15_full_ind_primary=p15_ind_primary if year == `r' & ind_primary==1
replace p50_full_ind_primary=p50_ind_primary if year == `r' & ind_primary==1
replace p85_full_ind_primary_nomg=p85_ind_primary_nomg if year == `r' & ind_primary_nomg==1
replace p15_full_ind_primary_nomg=p15_ind_primary_nomg if year == `r' & ind_primary_nomg==1
replace p50_full_ind_primary_nomg=p50_ind_primary_nomg if year == `r' & ind_primary_nomg==1
replace p85_p50_full=p85/p50 if year == `r'
replace p85_p15_full=p85/p15 if year == `r'
replace p50_p15_full=p50/p15 if year == `r'
replace p85_p50_full_ind_primary=p85_ind_primary/p50_ind_primary if year == `r' & ind_primary==1
replace p85_p15_full_ind_primary=p85_ind_primary/p15_ind_primary if year == `r' & ind_primary==1
replace p50_p15_full_ind_primary=p50_ind_primary/p15_ind_primary if year == `r' & ind_primary==1
replace p85_p50_full_ind_primary_nomg=p85_ind_primary_nomg/p50_ind_primary_nomg if year == `r' & ind_primary_nomg==1
replace p85_p15_full_ind_primary_nomg=p85_ind_primary_nomg/p15_ind_primary_nomg if year == `r' & ind_primary_nomg==1
replace p50_p15_full_ind_primary_nomg=p50_ind_primary_nomg/p15_ind_primary_nomg if year == `r' & ind_primary_nomg==1
drop p85 p15 p50 p85_ind_primary p15_ind_primary p50_ind_primary p85_ind_primary_nomg p15_ind_primary_nomg p50_ind_primary_nomg
}
*
sort year
label variable p85_p50_full "Tot. Empl."
label variable p50_p15_full "Tot. Empl."
label variable p85_p50_full_ind_primary "Primary Job"
label variable p50_p15_full_ind_primary "Primary Job"
label variable p50_p15_full_ind_primary_nomg "Primary - No Marg."
label variable p85_p50_full_ind_primary_nomg "Primary - No Marg."
*
quietly twoway line p85_p50_full p85_p50_full_ind_primary p85_p50_full_ind_primary_nomg year if year>=1999, ytitle({bf:Percentile Ratios}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(1 (0.2) 2.6, labsize(large) angle(horizontal))
graph export top_wage_ineq.png, replace

quietly twoway line p50_p15_full p50_p15_full_ind_primary p50_p15_full_ind_primary_nomg year if year>=1999, ytitle({bf:Percentile Ratios}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(2 (0.5) 5.5, labsize(large) angle(horizontal))
graph export bottom_wage_ineq.png, replace

***same for earnings:
*earnings_year_work - total employment
bysort persnr year: gen earnings_year_primary=days_epi*daily_wage if ind_primary==1
bysort persnr year: gen earnings_year_primary_nomg=days_epi*daily_wage if ind_primary_nomg==1

*** try not oversize the multiple spells by year for one person:
bysort persnr year: gen ind_earnings_year_work_undef=1 if earnings_year_work_undef!=.
bysort persnr year ind_earnings_year_work_undef: gen counter_earnings_year_work_undef=_n if ind_earnings_year_work_undef==1
replace earnings_year_work_undef=. if counter_earnings_year_work_undef!=1

***

gen p85_earn=.
gen p50_earn=.
gen p15_earn=.
gen p85_p50_earn=.
gen p85_p15_earn=.
gen p50_p15_earn=.
gen p85_earn_ind_primary=.
gen p50_earn_ind_primary=.
gen p15_earn_ind_primary=.
gen p85_p50_earn_ind_primary=.
gen p85_p15_earn_ind_primary=.
gen p50_p15_earn_ind_primary=.
gen p85_earn_ind_primary_nomg=.
gen p50_earn_ind_primary_nomg=.
gen p15_earn_ind_primary_nomg=.
gen p85_p50_earn_ind_primary_nomg=.
gen p85_p15_earn_ind_primary_nomg=.
gen p50_p15_earn_ind_primary_nomg=.
levels year, local(reg)
foreach r of local reg {
egen p85 = pctile(earnings_year_work_undef) if year == `r', p(85)
egen p50 = pctile(earnings_year_work_undef) if year == `r', p(50)
egen p15 = pctile(earnings_year_work_undef) if year == `r', p(15)
egen p85_ind_primary = pctile(earnings_year_primary) if year == `r' & ind_primary==1, p(85)
egen p50_ind_primary = pctile(earnings_year_primary) if year == `r' & ind_primary==1, p(50)
egen p15_ind_primary = pctile(earnings_year_primary) if year == `r' & ind_primary==1, p(15)
egen p85_ind_primary_nomg = pctile(earnings_year_primary_nomg) if year == `r' & ind_primary_nomg==1, p(85)
egen p50_ind_primary_nomg = pctile(earnings_year_primary_nomg) if year == `r' & ind_primary_nomg==1, p(50)
egen p15_ind_primary_nomg = pctile(earnings_year_primary_nomg) if year == `r' & ind_primary_nomg==1, p(15)
replace p85_earn=p85 if year == `r'
replace p15_earn=p15 if year == `r'
replace p50_earn=p50 if year == `r'
replace p85_earn_ind_primary=p85_ind_primary if year == `r' & ind_primary==1
replace p15_earn_ind_primary=p15_ind_primary if year == `r' & ind_primary==1
replace p50_earn_ind_primary=p50_ind_primary if year == `r' & ind_primary==1
replace p85_earn_ind_primary_nomg=p85_ind_primary_nomg if year == `r' & ind_primary_nomg==1
replace p15_earn_ind_primary_nomg=p15_ind_primary_nomg if year == `r' & ind_primary_nomg==1
replace p50_earn_ind_primary_nomg=p50_ind_primary_nomg if year == `r' & ind_primary_nomg==1
replace p85_p50_earn=p85/p50 if year == `r'
replace p85_p15_earn=p85/p15 if year == `r'
replace p50_p15_earn=p50/p15 if year == `r'
replace p85_p50_earn_ind_primary=p85_ind_primary/p50_ind_primary if year == `r' & ind_primary==1
replace p85_p15_earn_ind_primary=p85_ind_primary/p15_ind_primary if year == `r' & ind_primary==1
replace p50_p15_earn_ind_primary=p50_ind_primary/p15_ind_primary if year == `r' & ind_primary==1
replace p85_p50_earn_ind_primary_nomg=p85_ind_primary_nomg/p50_ind_primary_nomg if year == `r' & ind_primary_nomg==1
replace p85_p15_earn_ind_primary_nomg=p85_ind_primary_nomg/p15_ind_primary_nomg if year == `r' & ind_primary_nomg==1
replace p50_p15_earn_ind_primary_nomg=p50_ind_primary_nomg/p15_ind_primary_nomg if year == `r' & ind_primary_nomg==1
drop p85 p15 p50 p85_ind_primary p15_ind_primary p50_ind_primary p85_ind_primary_nomg p15_ind_primary_nomg p50_ind_primary_nomg
}
*
sort year
label variable p85_p50_earn "Tot. Empl."
label variable p50_p15_earn "Tot. Empl."
label variable p85_p50_earn_ind_primary "Primary Job"
label variable p50_p15_earn_ind_primary "Primary Job"
label variable p50_p15_earn_ind_primary_nomg "Primary - No Marg."
label variable p85_p50_earn_ind_primary_nomg "Primary - No Marg."
*
quietly twoway line p85_p50_earn p85_p50_earn_ind_primary p85_p50_earn_ind_primary_nomg year if year>=1999, ytitle({bf:Percentile Ratios}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(1 (0.2) 2.6, labsize(large) angle(horizontal))
graph export top_earn_ineq.png, replace

quietly twoway line p50_p15_earn p50_p15_earn_ind_primary p50_p15_earn_ind_primary_nomg year if year>=1999, ytitle({bf:Percentile Ratios}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(2 (0.5) 5.5, labsize(large) angle(horizontal))
graph export bottom_earn_ineq.png, replace

*** Histogram Days Contracted 5Years:

use "\Preliminars",clear
cd ""

sort year

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

forval i=1999(1)2010 {

preserve

bysort persnr year: gen first=_n
keep if first==1

qui gen begin_`i'=1 if year==`i' & form==1 & age<30
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

bysort persnr: egen days_epi_5year=total(days_year)
*
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

if `i'==1999 {

histogram days_epi_5year if year==1999, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_1999_unc.png, replace

}

if `i'==2001 {

histogram days_epi_5year if year==2001, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2001_unc.png, replace

}

if `i'==2003 {

histogram days_epi_5year if year==2003, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2003_unc.png, replace

}

if `i'==2005 {

histogram days_epi_5year if year==2005, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2005_unc.png, replace

}

if `i'==2007 {

histogram days_epi_5year if year==2007, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2007_unc.png, replace

}

if `i'==2009 {

histogram days_epi_5year if year==2009, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2009_unc.png, replace

}

restore

}
*

use "\Preliminars",clear
cd ""

sort year

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

forval i=1999(1)2010 {

preserve

bysort persnr year: gen first=_n
keep if first==1

qui gen begin_`i'=1 if year==`i' & form==1 & age<30
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

bysort persnr: egen days_epi_5year=total(days_year)
*
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

if `i'==1999 {

histogram days_epi_5year if year==1999, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_1999_male.png, replace

}

if `i'==2001 {

histogram days_epi_5year if year==2001, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2001_male.png, replace

}

if `i'==2003 {

histogram days_epi_5year if year==2003, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2003_male.png, replace

}

if `i'==2005 {

histogram days_epi_5year if year==2005, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2005_male.png, replace

}

if `i'==2007 {

histogram days_epi_5year if year==2007, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2007_male.png, replace

}

if `i'==2009 {

histogram days_epi_5year if year==2009, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2009_male.png, replace

}

restore

}
*

use "\Preliminars",clear
cd ""

sort year

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

forval i=1999(2)2009 {

preserve

bysort persnr year: gen first=_n
keep if first==1

qui gen begin_`i'=1 if year==`i' & form==1 & age<30
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

bysort persnr: egen days_epi_5year=total(days_year)
*
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

if `i'==1999 {

histogram days_epi_5year if year==1999, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_1999_female.png, replace

}

if `i'==2001 {

histogram days_epi_5year if year==2001, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2001_female.png, replace

}

if `i'==2003 {

histogram days_epi_5year if year==2003, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2003_female.png, replace

}

if `i'==2005 {

histogram days_epi_5year if year==2005, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2005_female.png, replace

}

if `i'==2007 {

histogram days_epi_5year if year==2007, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2007_female.png, replace

}

if `i'==2009 {

histogram days_epi_5year if year==2009, bin(8) ylabel(0 (0.0005) 0.002, labsize(large)) xlabel(,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))
graph export hist_days_5year_2009_female.png, replace

}

restore

}
*
