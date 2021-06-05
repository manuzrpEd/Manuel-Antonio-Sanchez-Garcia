*Kernel Densities Male/Female

**CS Wage:

cls
set more off

use "\Preliminars",clear
cd ""

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

***kdens of wages:

qui gen log_daily_wage=log(def_daily_wage) if source==1
qui gen log_daily_wage_full=log(def_daily_wage) if source==1 & form==1
qui gen log_daily_wage_part=log(def_daily_wage) if source==1 & form==2
qui gen log_daily_wage_mini=log(def_daily_wage) if source==1 & form==3

*xlabel(2 (1) 8)
twoway (kdensity log_daily_wage if female==0, clwidth(thick)) (kdensity log_daily_wage if female==1, clwidth(thick)), legend(position(6) rows(1))  xtitle({bf:log(w{sub:i})}, size(large) height(7))  legend(lab(1 "Male") lab(2 "Female")) graphregion(color(white)) ytitle({bf:f(log(w{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(, labsize(large))  
graph export kdens_wage.png, replace

twoway (kdensity log_daily_wage_full if female==0, clwidth(thick)) (kdensity log_daily_wage_full if female==1, clwidth(thick)), legend(position(6) rows(1))  xtitle({bf:log(w{sub:i})}, size(large) height(7))  legend(lab(1 "Male") lab(2 "Female")) graphregion(color(white)) ytitle({bf:f(log(w{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(, labsize(large))  
graph export kdens_wage_full.png, replace

twoway (kdensity log_daily_wage_part if female==0, clwidth(thick)) (kdensity log_daily_wage_part if female==1, clwidth(thick)), legend(position(6) rows(1))  xtitle({bf:log(w{sub:i})}, size(large) height(7))  legend(lab(1 "Male") lab(2 "Female")) graphregion(color(white)) ytitle({bf:f(log(w{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(, labsize(large))  
graph export kdens_wage_part.png, replace

twoway (kdensity log_daily_wage_mini if female==0, clwidth(thick)) (kdensity log_daily_wage_mini if female==1, clwidth(thick)), legend(position(6) rows(1))  xtitle({bf:log(w{sub:i})}, size(large) height(7))  legend(lab(1 "Male") lab(2 "Female")) graphregion(color(white)) ytitle({bf:f(log(w{sub:i}))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(, labsize(large))  
graph export kdens_wage_mini.png, replace


*log_earnings_year is log of earnings in work, for all forms too


*xlabel(2 (1) 8)
twoway (kdensity log_earnings_year if female==0, clwidth(thick)) (kdensity log_earnings_year if female==1, clwidth(thick)), legend(position(6) rows(1))  xtitle({bf:log(Earnings)}, size(large) height(7))  legend(lab(1 "Male") lab(2 "Female")) graphregion(color(white)) ytitle({bf:f(log(Earnings))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(, labsize(large))  
graph export kdens_earnings.png, replace

twoway (kdensity log_earnings_year_full if female==0, clwidth(thick)) (kdensity log_earnings_year_full if female==1, clwidth(thick)), legend(position(6) rows(1))  xtitle({bf:log(Earnings)}, size(large) height(7))  legend(lab(1 "Male") lab(2 "Female")) graphregion(color(white)) ytitle({bf:f(log(Earnings))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(, labsize(large))  
graph export kdens_earnings_full.png, replace

twoway (kdensity log_earnings_year_part if female==0, clwidth(thick)) (kdensity log_earnings_year_part if female==1, clwidth(thick)), legend(position(6) rows(1))  xtitle({bf:log(Earnings)}, size(large) height(7))  legend(lab(1 "Male") lab(2 "Female")) graphregion(color(white)) ytitle({bf:f(log(Earnings))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(, labsize(large))  
graph export kdens_earnings_part.png, replace

twoway (kdensity log_earnings_year_mini if female==0, clwidth(thick)) (kdensity log_earnings_year_mini if female==1, clwidth(thick)), legend(position(6) rows(1))  xtitle({bf:log(Earnings)}, size(large) height(7))  legend(lab(1 "Male") lab(2 "Female")) graphregion(color(white)) ytitle({bf:f(log(Earnings))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(, labsize(large))  
graph export kdens_earnings_mini.png, replace


***5-Year Earnings:


forval i=1999(1)2010 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
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

*** Keep

keep year persnr log* female

display `i'

save 5year_unc_lt_`i'.dta, replace

restore

}

*


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
qui gen log_sum_earnings_long_term_full=log(sum_earnings_long_term_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*** Keep

keep year persnr log* female

display `i'

save 5year_unc_lt_`i'_full.dta, replace

restore

}
*


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
qui gen log_sum_earnings_long_term_part=log(sum_earnings_long_term_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*** Keep

keep year persnr log* female

display `i'

save 5year_unc_lt_`i'_part.dta, replace

restore

}
*


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
qui gen log_sum_earnings_long_term_mini=log(sum_earnings_long_term_work)
by persnr: gen index_work=_n  if  source==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*** Keep

keep year persnr log* female

display `i'

save 5year_unc_lt_`i'_mini.dta, replace

restore

}
*



use 5year_unc_lt_1999.dta, clear
forval i=2000/2010 {
append using 5year_unc_lt_`i'.dta
}
*

*xlabel(2 (1) 8)
twoway (kdensity log_sum_earnings_long_term_work if female==0, clwidth(thick)) (kdensity log_sum_earnings_long_term_work if female==1, clwidth(thick)), legend(position(6) rows(1))  xtitle({bf:log(Earnings)}, size(large) height(7))  legend(lab(1 "Male") lab(2 "Female")) graphregion(color(white)) ytitle({bf:f(log(Earnings))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(, labsize(large))  
graph export kdens_log_sum_earnings_long_term_work.png, replace

use 5year_unc_lt_1999_full.dta, clear
forval i=2000/2010 {
append using 5year_unc_lt_`i'_full.dta
}
*

twoway (kdensity log_sum_earnings_long_term_full if female==0, clwidth(thick)) (kdensity log_sum_earnings_long_term_full if female==1, clwidth(thick)), legend(position(6) rows(1))  xtitle({bf:log(Earnings)}, size(large) height(7))  legend(lab(1 "Male") lab(2 "Female")) graphregion(color(white)) ytitle({bf:f(log(Earnings))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(, labsize(large))  
graph export kdens_log_sum_earnings_long_term_full.png, replace

use 5year_unc_lt_1999_part.dta, clear
forval i=2000/2010 {
append using 5year_unc_lt_`i'_part.dta
}
*

twoway (kdensity log_sum_earnings_long_term_part if female==0, clwidth(thick)) (kdensity log_sum_earnings_long_term_part if female==1, clwidth(thick)), legend(position(6) rows(1))  xtitle({bf:log(Earnings)}, size(large) height(7))  legend(lab(1 "Male") lab(2 "Female")) graphregion(color(white)) ytitle({bf:f(log(Earnings))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(, labsize(large))  
graph export kdens_log_sum_earnings_long_term_part.png, replace

use 5year_unc_lt_1999_mini.dta, clear
forval i=2000/2010 {
append using 5year_unc_lt_`i'_mini.dta
}
*

twoway (kdensity log_sum_earnings_long_term_mini if female==0, clwidth(thick)) (kdensity log_sum_earnings_long_term_mini if female==1, clwidth(thick)),  legend(position(6) rows(1))  xtitle({bf:log(Earnings)}, size(large) height(7))  legend(lab(1 "Male") lab(2 "Female")) graphregion(color(white)) ytitle({bf:f(log(Earnings))}, size(large) height(7)) ylabel(, labsize(large) angle(horizontal)) xlabel(, labsize(large)) 
graph export kdens_log_sum_earnings_long_term_mini.png, replace


