***Duration Unemployment


**CS:

*Unconditional

cls
set more off

use "\Preliminars",clear
cd ""

*keep if female==0

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort persnr: gen jump=1 if begepi>endepi[_n-1]+2

bysort persnr: gen days_jump=begepi-endepi[_n-1] if jump==1

bysort year: egen mean_days_jump=mean(days_jump)
bysort year: egen sd_days_jump=sd(days_jump)
*drop p90 p50 p10
by year: egen p90 = pctile(days_jump), p(90)
by year: egen p50 = pctile(days_jump), p(50)
by year: egen p10 = pctile(days_jump), p(10)
by year: gen skew_days_jump=(p90+p10-2*p50)/(p90-p10)

quietly twoway line skew_days_jump year if year>=1984, ytitle({bf:Skewness}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2014,labsize(large) angle(45)) xline(1984 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export skew_days_jump_cs_unc.png, replace

quietly twoway line sd_days_jump year if year>=1984, ytitle({bf:Std. Dev.}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2014,labsize(large) angle(45)) xline(1984 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export sd_days_jump_cs_unc.png, replace

quietly twoway line mean_days_jump year if year>=1984, ytitle({bf:Average Days}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2014,labsize(large) angle(45)) xline(1984 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (100) 400, labsize(large) angle(horizontal))
graph export mean_days_jump_cs_unc.png, replace

*Male

cls
set more off

use "\Preliminars",clear
cd ""

keep if female==0

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort persnr: gen jump=1 if begepi>endepi[_n-1]+2

bysort persnr: gen days_jump=begepi-endepi[_n-1] if jump==1

bysort year: egen mean_days_jump=mean(days_jump)
bysort year: egen sd_days_jump=sd(days_jump)
*drop p90 p50 p10
by year: egen p90 = pctile(days_jump), p(90)
by year: egen p50 = pctile(days_jump), p(50)
by year: egen p10 = pctile(days_jump), p(10)
by year: gen skew_days_jump=(p90+p10-2*p50)/(p90-p10)

quietly twoway line skew_days_jump year if year>=1984, ytitle({bf:Skewness}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2014,labsize(large) angle(45)) xline(1984 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export skew_days_jump_cs_male.png, replace

quietly twoway line sd_days_jump year if year>=1984, ytitle({bf:Std. Dev.}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2014,labsize(large) angle(45)) xline(1984 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export sd_days_jump_cs_male.png, replace

quietly twoway line mean_days_jump year if year>=1984, ytitle({bf:Average Days}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2014,labsize(large) angle(45)) xline(1984 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (100) 400, labsize(large) angle(horizontal))
graph export mean_days_jump_cs_male.png, replace

*Female

cls
set more off

use "\Preliminars",clear
cd ""

keep if female==1

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort persnr: gen jump=1 if begepi>endepi[_n-1]+2

bysort persnr: gen days_jump=begepi-endepi[_n-1] if jump==1

bysort year: egen mean_days_jump=mean(days_jump)
bysort year: egen sd_days_jump=sd(days_jump)
*drop p90 p50 p10
by year: egen p90 = pctile(days_jump), p(90)
by year: egen p50 = pctile(days_jump), p(50)
by year: egen p10 = pctile(days_jump), p(10)
by year: gen skew_days_jump=(p90+p10-2*p50)/(p90-p10)

quietly twoway line skew_days_jump year if year>=1984, ytitle({bf:Skewness}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2014,labsize(large) angle(45)) xline(1984 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export skew_days_jump_cs_female.png, replace

quietly twoway line sd_days_jump year if year>=1984, ytitle({bf:Std. Dev.}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2014,labsize(large) angle(45)) xline(1984 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export sd_days_jump_cs_female.png, replace

quietly twoway line mean_days_jump year if year>=1984, ytitle({bf:Average Days}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2014,labsize(large) angle(45)) xline(1984 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (100) 400, labsize(large) angle(horizontal))
graph export mean_days_jump_cs_female.png, replace


*** 5 Years working period

**Unconditional

clear
set more off
use "\Preliminars",clear
cd ""

*keep if female==0

sort year

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort persnr: gen jumpy=1 if begepi>endepi[_n-1]+2

bysort persnr: gen days_jump=begepi-endepi[_n-1] if jumpy==1

*

forval i=1999(1)2010 {

preserve

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

bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

bysort persnr: egen mean_days_jump=mean(days_jump)

sort persnr year

bysort persnr: gen counter_persnr=_n
keep if counter_persnr==1

egen ave_mean_days_jump=mean(mean_days_jump)
egen sd_mean_days_jump=sd(mean_days_jump)
*drop p90 p50 p10
bysort year: egen p90 = pctile(mean_days_jump), p(90)
by year: egen p50 = pctile(mean_days_jump), p(50)
by year: egen p10 = pctile(mean_days_jump), p(10)
by year: gen skew_mean_days_jump=(p90+p10-2*p50)/(p90-p10)

gen counter=_n
keep if counter==1

keep year ave_mean_days_jump sd_mean_days_jump skew_mean_days_jump

save sum_unemp_`i'.dta, replace

restore

}
*

use sum_unemp_1999.dta, clear
forval i=2000(1)2010 {
append using sum_unemp_`i'.dta
}
*
quietly twoway line skew_mean_days_jump year, ytitle({bf:Skewness}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export skew_mean_days_jump_5years_unc.png, replace

quietly twoway line sd_mean_days_jump year, ytitle({bf:Std. Dev.}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export sd_mean_days_jump_5years_unc.png, replace

quietly twoway line ave_mean_days_jump year, ytitle({bf:Average Days}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(0 (100) 400, labsize(large) angle(horizontal))
graph export ave_mean_days_jump_5years_unc.png, replace

*


**Male

clear
set more off
use "\Preliminars",clear
cd ""

keep if female==0

sort year

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort persnr: gen jumpy=1 if begepi>endepi[_n-1]+2

bysort persnr: gen days_jump=begepi-endepi[_n-1] if jumpy==1

*

forval i=1999(1)2010 {

preserve

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

bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

bysort persnr: egen mean_days_jump=mean(days_jump)

sort persnr year

bysort persnr: gen counter_persnr=_n
keep if counter_persnr==1

egen ave_mean_days_jump=mean(mean_days_jump)
egen sd_mean_days_jump=sd(mean_days_jump)
*drop p90 p50 p10
bysort year: egen p90 = pctile(mean_days_jump), p(90)
by year: egen p50 = pctile(mean_days_jump), p(50)
by year: egen p10 = pctile(mean_days_jump), p(10)
by year: gen skew_mean_days_jump=(p90+p10-2*p50)/(p90-p10)

gen counter=_n
keep if counter==1

keep year ave_mean_days_jump sd_mean_days_jump skew_mean_days_jump

save sum_unemp_`i'.dta, replace

restore

}
*

use sum_unemp_1999.dta, clear
forval i=2000(1)2010 {
append using sum_unemp_`i'.dta
}
*
quietly twoway line skew_mean_days_jump year, ytitle({bf:Skewness}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export skew_mean_days_jump_5years_male.png, replace
quietly twoway line sd_mean_days_jump year, ytitle({bf:Std. Dev.}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export sd_mean_days_jump_5years_male.png, replace
quietly twoway line ave_mean_days_jump year, ytitle({bf:Average Days}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(0 (100) 400, labsize(large) angle(horizontal))
graph export ave_mean_days_jump_5years_male.png, replace

*


**Female

clear
set more off
use "\Preliminars",clear
cd ""

keep if female==1

sort year

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort persnr: gen jumpy=1 if begepi>endepi[_n-1]+2

bysort persnr: gen days_jump=begepi-endepi[_n-1] if jumpy==1

*

forval i=1999(1)2010 {

preserve

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

bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5

bysort persnr: egen mean_days_jump=mean(days_jump)

sort persnr year

bysort persnr: gen counter_persnr=_n
keep if counter_persnr==1

egen ave_mean_days_jump=mean(mean_days_jump)
egen sd_mean_days_jump=sd(mean_days_jump)
*drop p90 p50 p10
bysort year: egen p90 = pctile(mean_days_jump), p(90)
by year: egen p50 = pctile(mean_days_jump), p(50)
by year: egen p10 = pctile(mean_days_jump), p(10)
by year: gen skew_mean_days_jump=(p90+p10-2*p50)/(p90-p10)

gen counter=_n
keep if counter==1

keep year ave_mean_days_jump sd_mean_days_jump skew_mean_days_jump

save sum_unemp_`i'.dta, replace

restore

}
*

use sum_unemp_1999.dta, clear
forval i=2000(1)2010 {
append using sum_unemp_`i'.dta
}
*
quietly twoway line skew_mean_days_jump year, ytitle({bf:Skewness}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export skew_mean_days_jump_5years_female.png, replace
quietly twoway line sd_mean_days_jump year, ytitle({bf:Std. Dev.}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export sd_mean_days_jump_5years_female.png, replace
quietly twoway line ave_mean_days_jump year, ytitle({bf:Average Days}, size(large) height(10)) lcolor(black blue gray green red) legend(position(6) rows(1)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010,labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(0 (100) 400, labsize(large) angle(horizontal))
graph export ave_mean_days_jump_5years_female.png, replace

*

***HISTOGRAMS

* Histogram Unemployment Days 5Years:

**Unconditional

use "\Preliminars",clear
cd ""

sort year

*keep if female==0

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort persnr: gen jumpy=1 if begepi>endepi[_n-1]+2

bysort persnr: gen days_jump=begepi-endepi[_n-1] if jumpy==1

forval i=1985(1)2010 {

preserve

bysort persnr year: gen first=_n
keep if first==1

qui gen begin_`i'=1 if year==`i'
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

bysort persnr: egen mean_days_jump=mean(days_jump)

sort persnr year

bysort persnr: gen counter_persnr=_n
keep if counter_persnr==1

egen ave_mean_days_jump=mean(mean_days_jump)
*
*

label variable ave_mean_days_jump "Average Days"
label variable mean_days_jump "Nonemp. Days"

if `i'==1985 {

histogram mean_days_jump if year==1985 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_1985_unc.png, replace

}

if `i'==1995 {

histogram mean_days_jump if year==1995 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_1995_unc.png, replace

}

if `i'==1999 {

histogram mean_days_jump if year==1999 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_1999_unc.png, replace

}

if `i'==2003 {

histogram mean_days_jump if year==2003 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_2003_unc.png, replace

}

if `i'==2005 {

histogram mean_days_jump if year==2005 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_2005_unc.png, replace

}

if `i'==2007 {

histogram mean_days_jump if year==2007 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_2007_unc.png, replace

}

if `i'==2010 {

histogram mean_days_jump if year==2010 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_2010_unc.png, replace

}


restore

}
*

**Male

use "\Preliminars",clear
cd ""

sort year

keep if female==0

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort persnr: gen jumpy=1 if begepi>endepi[_n-1]+2

bysort persnr: gen days_jump=begepi-endepi[_n-1] if jumpy==1

forval i=1999(1)2010 {

preserve

bysort persnr year: gen first=_n
keep if first==1

qui gen begin_`i'=1 if year==`i'
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

bysort persnr: egen mean_days_jump=mean(days_jump)

sort persnr year

bysort persnr: gen counter_persnr=_n
keep if counter_persnr==1

egen ave_mean_days_jump=mean(mean_days_jump)
*
*

label variable ave_mean_days_jump "Average Days"
label variable mean_days_jump "Nonemp. Days"

if `i'==1999 {

histogram mean_days_jump if year==1999 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_1999_male.png, replace

}

if `i'==2003 {

histogram mean_days_jump if year==2003 & days_jump<2000, bin(8)  ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_2003_male.png, replace

}

if `i'==2005 {

histogram mean_days_jump if year==2005 & days_jump<2000, bin(8)  ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_2005_male.png, replace

}

if `i'==2007 {

histogram mean_days_jump if year==2007 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_2007_male.png, replace

}

if `i'==2010 {

histogram mean_days_jump if year==2010 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_2010_male.png, replace

}


restore

}
*



**Female

use "\Preliminars",clear
cd ""

sort year

keep if female==1

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort persnr: gen jumpy=1 if begepi>endepi[_n-1]+2

bysort persnr: gen days_jump=begepi-endepi[_n-1] if jumpy==1

forval i=1999(1)2010 {

preserve

bysort persnr year: gen first=_n
keep if first==1

qui gen begin_`i'=1 if year==`i'
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

bysort persnr: egen mean_days_jump=mean(days_jump)

sort persnr year

bysort persnr: gen counter_persnr=_n
keep if counter_persnr==1

egen ave_mean_days_jump=mean(mean_days_jump)
*
*

label variable ave_mean_days_jump "Average Days"
label variable mean_days_jump "Nonemp. Days"

if `i'==1999 {

histogram mean_days_jump if year==1999 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_1999_female.png, replace

}

if `i'==2003 {

histogram mean_days_jump if year==2003 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_2003_female.png, replace

}

if `i'==2005 {

histogram mean_days_jump if year==2005 & days_jump<2000, bin(8)  ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_2005_female.png, replace

}

if `i'==2007 {

histogram mean_days_jump if year==2007 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_2007_female.png, replace

}

if `i'==2010 {

histogram mean_days_jump if year==2010 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_5year_2010_female.png, replace

}


restore

}
*


*** CS:

* Histogram Unemployment Days CS:

**Unconditional

use "\Preliminars",clear
cd ""

sort year

*keep if female==0

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort persnr: gen jump=1 if begepi>endepi[_n-1]+2

bysort persnr: gen days_jump=begepi-endepi[_n-1] if jump==1

bysort year: egen mean_days_jump=mean(days_jump)

label variable days_jump "Nonemp. Days"

histogram days_jump if year==1985 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10))xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_1985_unc.png, replace

histogram days_jump if year==1995 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_1995_unc.png, replace

histogram days_jump if year==1999 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_1999_unc.png, replace

histogram days_jump if year==2003 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2003_unc.png, replace

histogram days_jump if year==2005 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2005_unc.png, replace

histogram days_jump if year==2007 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2007_unc.png, replace

histogram days_jump if year==2010 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2010_unc.png, replace

histogram days_jump if year==2014 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2014_unc.png, replace

*


**Female

use "\Preliminars",clear
cd ""

sort year

keep if female==1

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort persnr: gen jump=1 if begepi>endepi[_n-1]+2

bysort persnr: gen days_jump=begepi-endepi[_n-1] if jump==1

bysort year: egen mean_days_jump=mean(days_jump)

label variable days_jump "Nonemp. Days"

histogram days_jump if year==1985 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_1985_female.png, replace

histogram days_jump if year==1995 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_1995_female.png, replace

histogram days_jump if year==1999 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_1999_female.png, replace

histogram days_jump if year==2003 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2003_female.png, replace

histogram days_jump if year==2005 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2005_female.png, replace

histogram days_jump if year==2007 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2007_female.png, replace

histogram days_jump if year==2010 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2010_female.png, replace

histogram days_jump if year==2014 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2014_female.png, replace

*

**Males

use "\Preliminars",clear
cd ""

sort year

keep if female==0

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort persnr: gen jump=1 if begepi>endepi[_n-1]+2

bysort persnr: gen days_jump=begepi-endepi[_n-1] if jump==1

bysort year: egen mean_days_jump=mean(days_jump)

label variable days_jump "Nonemp. Days"

histogram days_jump if year==1985 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_1985_male.png, replace

histogram days_jump if year==1995 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_1995_male.png, replace

histogram days_jump if year==1999 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_1999_male.png, replace

histogram days_jump if year==2003 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2003_male.png, replace

histogram days_jump if year==2005 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2005_male.png, replace

histogram days_jump if year==2007 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2007_male.png, replace

histogram days_jump if year==2010 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large))  xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2010_male.png, replace

histogram days_jump if year==2014 & days_jump<2000, bin(8) ylabel(0 (0.0005) 0.003, labsize(large)) xlabel(0 (500) 2000,labsize(large)) bcolor(blue) graphregion(color(white)) ytitle({bf:Density}, size(large) height(10)) xtitle({bf:NonEmpl. Days}, size(large) height(10))
graph export hist_days_jump_cs_2014_male.png, replace

*

