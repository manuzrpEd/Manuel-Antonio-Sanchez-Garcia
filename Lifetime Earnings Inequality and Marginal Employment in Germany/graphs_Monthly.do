*
*1) 
***Cross Sectional Earnings Inequality

cls
set more off
use "\Preliminars_Monthly_persnr.dta", replace
cd ""

drop if empstate==4
drop if female==1

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

bysort persnr year: gen first=_n
keep if first==1
drop first

gen log_earnings=log(earnings_year)
bysort year: egen sd_earnings=sd(log_earnings)
gen var_earnings=sd_earnings^2

levels year, local(reg)

*residual
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_earnings i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_earnings-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_mincer=sd(u_mincer)
gen var_mincer=sd_mincer^2

label variable var_earnings "Data"
label variable var_mincer "Residual"

quietly twoway line var_earnings var_mincer year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.3 (0.1) 0.9, labsize(large) angle(horizontal))
graph export var_work_males_cs.png, replace

*2) 
***CS 5Year Earnings Inequality
cls
set more off
use "\Preliminars_Monthly_persnr.dta", replace
cd ""

drop if empstate==4
drop if female==1

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
*
bysort persnr year: gen first=_n
keep if first==1
drop first
*
*this is for consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
drop jump tot
*
sort persnr year
by persnr: gen earnings_5year=earnings_year+earnings_year[_n+1]+earnings_year[_n+2]+earnings_year[_n+3]+earnings_year[_n+4]
drop earnings

*
*bysort persnr year: gen first=_n
*keep if first==1
*drop first

*

qui gen var_lt_work = .

sort persnr year
*they are deflated
qui gen log_sum_earnings_long_term_work=log(earnings_5year)
by persnr: gen index_work=_n  if  empstate!=4
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1
drop index_work

drop if year>2010

*
levels year, local(reg)
foreach r of local reg {
*
egen sd=sd(log_sum_earnings_long_term_work) if year == `r'
replace var_lt_work=sd if year == `r'
drop sd
}

replace var_lt_work=var_lt_work^2

*

sort year

bysort year: egen mean_var=mean(var_lt_work)
replace var_lt_work=mean_var
drop mean_var

levels year, local(reg)

*residual
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_long_term_work i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_long_term_work-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_mincer=sd(u_mincer)
gen var_mincer=sd_mincer^2

label variable var_lt_work "Data"
label variable var_mincer "Residual"

*
quietly twoway line var_lt_work var_mincer year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.3 (0.1) 0.9, labsize(large) angle(horizontal))
graph export var_work_5y_males_cs.png, replace

*


*
*3)
***5Year Earnings Inequality by Age Groups

cls
set more off
use "\Preliminars_Monthly_persnr.dta", replace
cd ""

drop if empstate==4
drop if female==1

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

forval i=25(5)50 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1
drop first

*
qui gen begin_`i'=1 if age==`i'
bysort persnr: egen sum_begin=sum(begin_`i')
bysort persnr: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & age>=`i'
drop begin_`i' sum_begin ind_begin

*this is for consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
drop jump tot
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5
drop max_year_g min_year_g max_diff_year_g 

qui ge var_lt_work_`i' = .

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
by persnr: gen index_work=_n  if  empstate!=4 & diff_year_g<6
drop diff_year_g
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1
drop index_work

*
levels year, local(reg)
foreach r of local reg {
*
egen sd=sd(log_sum_earnings_long_term_work) if year == `r'
replace var_lt_work_`i'=sd if year == `r'
drop sd
}

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year var* 

save bonke_99_lt_`i'_unc.dta, replace

restore

}
*
use bonke_99_lt_25_unc,clear
sort year

bysort year: egen mean_var=mean(var_lt_work_25)
replace var_lt_work_25=mean_var
drop mean_var

append using bonke_99_lt_30_unc
bysort year: egen mean_var=mean(var_lt_work_30)
replace var_lt_work_30=mean_var
drop mean_var

append using bonke_99_lt_35_unc
bysort year: egen mean_var=mean(var_lt_work_35)
replace var_lt_work_35=mean_var
drop mean_var

append using bonke_99_lt_40_unc
bysort year: egen mean_var=mean(var_lt_work_40)
replace var_lt_work_40=mean_var
drop mean_var

append using bonke_99_lt_45_unc
bysort year: egen mean_var=mean(var_lt_work_45)
replace var_lt_work_45=mean_var
drop mean_var

append using bonke_99_lt_50_unc
bysort year: egen mean_var=mean(var_lt_work_50)
replace var_lt_work_50=mean_var
drop mean_var

*append using bonke_99_lt_52_unc
*bysort year: egen mean_var=mean(var_lt_work_52)
*replace var_lt_work_52=mean_var
*drop mean_var

label variable var_lt_work_25 "25"
label variable var_lt_work_30 "30"
label variable var_lt_work_35 "35"
label variable var_lt_work_40 "40"
label variable var_lt_work_45 "45"
label variable var_lt_work_50 "50"
*label variable var_lt_work_52 "52"

quietly twoway line var_lt_work_25 var_lt_work_30 var_lt_work_35 var_lt_work_40 var_lt_work_45 var_lt_work_50 year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_5y_males_ages.png, replace
*

*4)
***Cross Sectional Earnings Inequality

cls
set more off
use "\Preliminars_Monthly_persnr.dta", replace
cd ""

drop if empstate==4
drop if female==0

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

bysort persnr year: gen first=_n
keep if first==1
drop first

gen log_earnings=log(earnings_year)
bysort year: egen sd_earnings=sd(log_earnings)
gen var_earnings=sd_earnings^2

levels year, local(reg)

*residual
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_earnings i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_earnings-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_mincer=sd(u_mincer)
gen var_mincer=sd_mincer^2

label variable var_earnings "Data"
label variable var_mincer "Residual"

quietly twoway line var_earnings var_mincer year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.3 (0.1) 0.9, labsize(large) angle(horizontal))
graph export var_work_females_cs.png, replace

*5) 
***CS 5Year Earnings Inequality
cls
set more off
use "\Preliminars_Monthly_persnr.dta", replace
cd ""

drop if empstate==4
drop if female==0

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
*
bysort persnr year: gen first=_n
keep if first==1
drop first
*
*this is for consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
drop jump tot
*
sort persnr year
by persnr: gen earnings_5year=earnings_year+earnings_year[_n+1]+earnings_year[_n+2]+earnings_year[_n+3]+earnings_year[_n+4]
drop earnings

*
*bysort persnr year: gen first=_n
*keep if first==1
*drop first

*

qui gen var_lt_work = .

sort persnr year
*they are deflated
qui gen log_sum_earnings_long_term_work=log(earnings_5year)
by persnr: gen index_work=_n  if  empstate!=4
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1
drop index_work

drop if year>2010

*
levels year, local(reg)
foreach r of local reg {
*
egen sd=sd(log_sum_earnings_long_term_work) if year == `r'
replace var_lt_work=sd if year == `r'
drop sd
}

replace var_lt_work=var_lt_work^2

*

sort year

bysort year: egen mean_var=mean(var_lt_work)
replace var_lt_work=mean_var
drop mean_var

levels year, local(reg)

*residual
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_sum_earnings_long_term_work i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_sum_earnings_long_term_work-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_mincer=sd(u_mincer)
gen var_mincer=sd_mincer^2

label variable var_lt_work "Data"
label variable var_mincer "Residual"

*
quietly twoway line var_lt_work var_mincer year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.3 (0.1) 0.9, labsize(large) angle(horizontal))
graph export var_work_5y_females_cs.png, replace

*


*
*6)
***5Year Earnings Inequality by Age Groups

cls
set more off
use "\Preliminars_Monthly_persnr.dta", replace
cd ""

drop if empstate==4
drop if female==0

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

forval i=25(5)50 {

preserve

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year: gen first=_n
keep if first==1
drop first

*
qui gen begin_`i'=1 if age==`i'
bysort persnr: egen sum_begin=sum(begin_`i')
bysort persnr: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
keep if ind_begin==1 & age>=`i'
drop begin_`i' sum_begin ind_begin

*this is for consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
drop jump tot
*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
qui drop if max_diff_year_g<4
*the above ensures I keep 5 years at least
*the below ensures I keep only 5 years:
qui keep if diff_year_g<5
drop max_year_g min_year_g max_diff_year_g 

qui ge var_lt_work_`i' = .

sort persnr year
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
by persnr: gen index_work=_n  if  empstate!=4 & diff_year_g<6
drop diff_year_g
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1
drop index_work

*
levels year, local(reg)
foreach r of local reg {
*
egen sd=sd(log_sum_earnings_long_term_work) if year == `r'
replace var_lt_work_`i'=sd if year == `r'
drop sd
}

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year var* 

save bonke_99_lt_`i'_unc.dta, replace

restore

}
*
use bonke_99_lt_25_unc,clear
sort year

bysort year: egen mean_var=mean(var_lt_work_25)
replace var_lt_work_25=mean_var
drop mean_var

append using bonke_99_lt_30_unc
bysort year: egen mean_var=mean(var_lt_work_30)
replace var_lt_work_30=mean_var
drop mean_var

append using bonke_99_lt_35_unc
bysort year: egen mean_var=mean(var_lt_work_35)
replace var_lt_work_35=mean_var
drop mean_var

append using bonke_99_lt_40_unc
bysort year: egen mean_var=mean(var_lt_work_40)
replace var_lt_work_40=mean_var
drop mean_var

append using bonke_99_lt_45_unc
bysort year: egen mean_var=mean(var_lt_work_45)
replace var_lt_work_45=mean_var
drop mean_var

append using bonke_99_lt_50_unc
bysort year: egen mean_var=mean(var_lt_work_50)
replace var_lt_work_50=mean_var
drop mean_var

*append using bonke_99_lt_52_unc
*bysort year: egen mean_var=mean(var_lt_work_52)
*replace var_lt_work_52=mean_var
*drop mean_var

label variable var_lt_work_25 "25"
label variable var_lt_work_30 "30"
label variable var_lt_work_35 "35"
label variable var_lt_work_40 "40"
label variable var_lt_work_45 "45"
label variable var_lt_work_50 "50"
*label variable var_lt_work_52 "52"

quietly twoway line var_lt_work_25 var_lt_work_30 var_lt_work_35 var_lt_work_40 var_lt_work_45 var_lt_work_50 year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_5y_females_ages.png, replace

*7)
*** Daily Wage Inequality by Form of Employment
*I have to change monthly wages to daily wages or plot only for months where days worked are > 25.
*I need to find consistency with previous findings
*or drop other earnings per month, that is, only earnings from the form, strictly. Need to check this.

*
cls
set more off
use "\Preliminars_Monthly_persnr",clear
cd ""
sort year

drop if female==1

*drop if empstate==4

*only full time
drop if empstate!=1

*average wage per year of individuals
bysort persnr year: gen counter=_n
bysort persnr year: egen ave_wage=mean(log_ave_wage)
keep if counter==1
replace log_ave_wage=ave_wage

*
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
bysort persnr year ind_primary: gen ind=_n if ind_primary==1
keep if ind==1
*

*gen Log Deviations by year:
gen p85_full=.
gen p50_full=.
gen p15_full=.
levels year, local(reg)
*
foreach r of local reg {
egen p85 = pctile(log_ave_wage) if year == `r', p(85)
egen p50 = pctile(log_ave_wage) if year == `r', p(50)
egen p15 = pctile(log_ave_wage) if year == `r', p(15)
replace p85_full=p85 if year == `r'
replace p15_full=p15 if year == `r'
replace p50_full=p50 if year == `r'
drop p85 p15 p50
}
*gen deviations with respect to 1999
tabstat p85_full p50_full p15_full, by(year) stats(mean n)
*
sum p85_full if year==1999
gen dev_p85=(p85_full-r(mean))*100
*
sum p15_full if year==1999
gen dev_p15=(p15_full-r(mean))*100
*
sum p50_full if year==1999
gen dev_p50=(p50_full-r(mean))*100
*
label variable dev_p85 "P85"
label variable dev_p50 "P50"
label variable dev_p15 "P15"
*
sort year
*
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(large) angle(horizontal))
graph export dev_perc_full_males.png, replace


*Part Time
cls
set more off
use "\Preliminars_Monthly_persnr",clear
cd ""
sort year

drop if female==1

*drop if empstate==4

*only part time
drop if empstate!=2

*average wage per year of individuals
bysort persnr year: gen counter=_n
bysort persnr year: egen ave_wage=mean(log_ave_wage)
keep if counter==1
replace log_ave_wage=ave_wage

*
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
bysort persnr year ind_primary: gen ind=_n if ind_primary==1
keep if ind==1
*

*gen Log Deviations by year:
gen p85_part=.
gen p50_part=.
gen p15_part=.
levels year, local(reg)
*
foreach r of local reg {
egen p85 = pctile(log_ave_wage) if year == `r', p(85)
egen p50 = pctile(log_ave_wage) if year == `r', p(50)
egen p15 = pctile(log_ave_wage) if year == `r', p(15)
replace p85_part=p85 if year == `r'
replace p15_part=p15 if year == `r'
replace p50_part=p50 if year == `r'
drop p85 p15 p50
}
*gen deviations with respect to 1999
tabstat p85_part p50_part p15_part, by(year) stats(mean n)
*
sum p85_part if year==1999
gen dev_p85=(p85_part-r(mean))*100
*
sum p15_part if year==1999
gen dev_p15=(p15_part-r(mean))*100
*
sum p50_part if year==1999
gen dev_p50=(p50_part-r(mean))*100
*
label variable dev_p85 "P85"
label variable dev_p50 "P50"
label variable dev_p15 "P15"
*
sort year
*
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(large) angle(horizontal))
graph export dev_perc_part_males.png, replace

*Mg
cls
set more off
use "\Preliminars_Monthly_persnr",clear
cd ""
sort year

drop if female==1

*drop if empstate==4

*only mg time
drop if empstate!=3

*average wage per year of individuals
bysort persnr year: gen counter=_n
bysort persnr year: egen ave_wage=mean(log_ave_wage)
keep if counter==1
replace log_ave_wage=ave_wage

*
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
bysort persnr year ind_primary: gen ind=_n if ind_primary==1
keep if ind==1
*

*gen Log Deviations by year:
gen p85_mini=.
gen p50_mini=.
gen p15_mini=.
levels year, local(reg)
*
foreach r of local reg {
egen p85 = pctile(log_ave_wage) if year == `r', p(85)
egen p50 = pctile(log_ave_wage) if year == `r', p(50)
egen p15 = pctile(log_ave_wage) if year == `r', p(15)
replace p85_mini=p85 if year == `r'
replace p15_mini=p15 if year == `r'
replace p50_mini=p50 if year == `r'
drop p85 p15 p50
}
*gen deviations with respect to 1999
tabstat p85_mini p50_mini p15_mini, by(year) stats(mean n)
*
sum p85_mini if year==1999
gen dev_p85=(p85_mini-r(mean))*100
*
sum p15_mini if year==1999
gen dev_p15=(p15_mini-r(mean))*100
*
sum p50_mini if year==1999
gen dev_p50=(p50_mini-r(mean))*100
*
label variable dev_p85 "P85"
label variable dev_p50 "P50"
label variable dev_p15 "P15"
*
sort year
*
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(large) angle(horizontal))
graph export dev_perc_mini_males.png, replace


*8)
*** Daily Wage Inequality by Form of Employment
*I have to change monthly wages to daily wages or plot only for months where days worked are > 25.
*I need to find consistency with previous findings
*or drop other earnings per month, that is, only earnings from the form, strictly. Need to check this.

*
cls
set more off
use "\Preliminars_Monthly_persnr",clear
cd ""
sort year

drop if female==0

*drop if empstate==4

*only full time
drop if empstate!=1

*average wage per year of individuals
bysort persnr year: gen counter=_n
bysort persnr year: egen ave_wage=mean(log_ave_wage)
keep if counter==1
replace log_ave_wage=ave_wage

*
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
bysort persnr year ind_primary: gen ind=_n if ind_primary==1
keep if ind==1
*

*gen Log Deviations by year:
gen p85_full=.
gen p50_full=.
gen p15_full=.
levels year, local(reg)
*
foreach r of local reg {
egen p85 = pctile(log_ave_wage) if year == `r', p(85)
egen p50 = pctile(log_ave_wage) if year == `r', p(50)
egen p15 = pctile(log_ave_wage) if year == `r', p(15)
replace p85_full=p85 if year == `r'
replace p15_full=p15 if year == `r'
replace p50_full=p50 if year == `r'
drop p85 p15 p50
}
*gen deviations with respect to 1999
tabstat p85_full p50_full p15_full, by(year) stats(mean n)
*
sum p85_full if year==1999
gen dev_p85=(p85_full-r(mean))*100
*
sum p15_full if year==1999
gen dev_p15=(p15_full-r(mean))*100
*
sum p50_full if year==1999
gen dev_p50=(p50_full-r(mean))*100
*
label variable dev_p85 "P85"
label variable dev_p50 "P50"
label variable dev_p15 "P15"
*
sort year
*
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(large) angle(horizontal))
graph export dev_perc_full_females.png, replace


*Part Time
cls
set more off
use "\Preliminars_Monthly_persnr",clear
cd ""
sort year

drop if female==0

*drop if empstate==4

*only part time
drop if empstate!=2

*average wage per year of individuals
bysort persnr year: gen counter=_n
bysort persnr year: egen ave_wage=mean(log_ave_wage)
keep if counter==1
replace log_ave_wage=ave_wage

*
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
bysort persnr year ind_primary: gen ind=_n if ind_primary==1
keep if ind==1
*

*gen Log Deviations by year:
gen p85_part=.
gen p50_part=.
gen p15_part=.
levels year, local(reg)
*
foreach r of local reg {
egen p85 = pctile(log_ave_wage) if year == `r', p(85)
egen p50 = pctile(log_ave_wage) if year == `r', p(50)
egen p15 = pctile(log_ave_wage) if year == `r', p(15)
replace p85_part=p85 if year == `r'
replace p15_part=p15 if year == `r'
replace p50_part=p50 if year == `r'
drop p85 p15 p50
}
*gen deviations with respect to 1999
tabstat p85_part p50_part p15_part, by(year) stats(mean n)
*
sum p85_part if year==1999
gen dev_p85=(p85_part-r(mean))*100
*
sum p15_part if year==1999
gen dev_p15=(p15_part-r(mean))*100
*
sum p50_part if year==1999
gen dev_p50=(p50_part-r(mean))*100
*
label variable dev_p85 "P85"
label variable dev_p50 "P50"
label variable dev_p15 "P15"
*
sort year
*
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(large) angle(horizontal))
graph export dev_perc_part_females.png, replace

*Mg
cls
set more off
use "\Preliminars_Monthly_persnr",clear
cd ""
sort year

drop if female==0

*drop if empstate==4

*only mg time
drop if empstate!=3

*average wage per year of individuals
bysort persnr year: gen counter=_n
bysort persnr year: egen ave_wage=mean(log_ave_wage)
keep if counter==1
replace log_ave_wage=ave_wage

*
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
bysort persnr year ind_primary: gen ind=_n if ind_primary==1
keep if ind==1
*

*gen Log Deviations by year:
gen p85_mini=.
gen p50_mini=.
gen p15_mini=.
levels year, local(reg)
*
foreach r of local reg {
egen p85 = pctile(log_ave_wage) if year == `r', p(85)
egen p50 = pctile(log_ave_wage) if year == `r', p(50)
egen p15 = pctile(log_ave_wage) if year == `r', p(15)
replace p85_mini=p85 if year == `r'
replace p15_mini=p15 if year == `r'
replace p50_mini=p50 if year == `r'
drop p85 p15 p50
}
*gen deviations with respect to 1999
tabstat p85_mini p50_mini p15_mini, by(year) stats(mean n)
*
sum p85_mini if year==1999
gen dev_p85=(p85_mini-r(mean))*100
*
sum p15_mini if year==1999
gen dev_p15=(p15_mini-r(mean))*100
*
sum p50_mini if year==1999
gen dev_p50=(p50_mini-r(mean))*100
*
label variable dev_p85 "P85"
label variable dev_p50 "P50"
label variable dev_p15 "P15"
*
sort year
*
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(large) angle(horizontal))
graph export dev_perc_mini_females.png, replace



*9) CS Full Time 75-14
cls
set more off
use "\Preliminars_Yearly.dta", clear
cd ""

sort year

drop if female==1

bysort year: egen sd_log_tot_full_earnings=sd(log_tot_full_earnings)

gen var_log_tot_full_earnings=sd_log_tot_full_earnings^2

levels year, local(reg)

*residual
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_tot_full_earnings i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_tot_full_earnings-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_mincer=sd(u_mincer)
gen var_mincer=sd_mincer^2

label variable var_log_tot_full_earnings "Data"
label variable var_mincer "Residual"

quietly twoway line var_log_tot_full_earnings var_mincer year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large) angle(45)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.3 (0.1) 0.9, labsize(large) angle(horizontal))
graph export var_full_males_cs_7514.png, replace


*10) 5year 75-10
cls
set more off
use "\Preliminars_Yearly.dta", clear
cd ""

drop if female==1

*
bysort persnr year: gen first=_n
keep if first==1
drop first
*
*this is for consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
drop jump tot
*
sort persnr year
by persnr: gen log_tot_full_earnings_5year=log_tot_full_earnings+log_tot_full_earnings[_n+1]+log_tot_full_earnings[_n+2]+log_tot_full_earnings[_n+3]+log_tot_full_earnings[_n+4]
*drop earnings

*
*bysort persnr year: gen first=_n
*keep if first==1
*drop first

*

qui gen var_lt_work = .

sort persnr year
*they are deflated

drop if year>2010

*
levels year, local(reg)
foreach r of local reg {
*
egen sd=sd(log_tot_full_earnings_5year) if year == `r'
replace var_lt_work=sd if year == `r'
drop sd
}

replace var_lt_work=var_lt_work^2

levels year, local(reg)

*residual
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_tot_full_earnings_5year i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_tot_full_earnings_5year-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_mincer=sd(u_mincer)
gen var_mincer=sd_mincer^2

label variable var_lt_work "Data"
label variable var_mincer "Residual"

quietly twoway line var_lt_work var_mincer year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large) angle(45)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.3 (0.1) 0.9, labsize(large) angle(horizontal))
graph export var_full_males_5year_7510.png, replace

*11) CS Full Time 75-14
cls
set more off
use "\Preliminars_Yearly.dta", clear
cd ""

sort year

drop if female==0

bysort year: egen sd_log_tot_full_earnings=sd(log_tot_full_earnings)

gen var_log_tot_full_earnings=sd_log_tot_full_earnings^2

levels year, local(reg)

*residual
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_tot_full_earnings i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_tot_full_earnings-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_mincer=sd(u_mincer)
gen var_mincer=sd_mincer^2

label variable var_log_tot_full_earnings "Data"
label variable var_mincer "Residual"

quietly twoway line var_log_tot_full_earnings var_mincer year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large) angle(45)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.3 (0.1) 0.9, labsize(large) angle(horizontal))
graph export var_full_females_cs_7514.png, replace


*12) 5year 75-10
cls
set more off
use "\Preliminars_Yearly.dta", clear
cd ""

drop if female==0

*
bysort persnr year: gen first=_n
keep if first==1
drop first
*
*this is for consecutive earnings
bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 
drop jump tot
*
sort persnr year
by persnr: gen log_tot_full_earnings_5year=log_tot_full_earnings+log_tot_full_earnings[_n+1]+log_tot_full_earnings[_n+2]+log_tot_full_earnings[_n+3]+log_tot_full_earnings[_n+4]
*drop earnings

*
*bysort persnr year: gen first=_n
*keep if first==1
*drop first

*

qui gen var_lt_work = .

sort persnr year
*they are deflated

drop if year>2010

*
levels year, local(reg)
foreach r of local reg {
*
egen sd=sd(log_tot_full_earnings_5year) if year == `r'
replace var_lt_work=sd if year == `r'
drop sd
}

replace var_lt_work=var_lt_work^2

levels year, local(reg)

*residual
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_tot_full_earnings_5year i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_tot_full_earnings_5year-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_mincer=sd(u_mincer)
gen var_mincer=sd_mincer^2

label variable var_lt_work "Data"
label variable var_mincer "Residual"

quietly twoway line var_lt_work var_mincer year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large) angle(45)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.3 (0.1) 0.9, labsize(large) angle(horizontal))
graph export var_full_females_5year_7510.png, replace


*13) Unconditional Stocks
cls
set more off
use "C:\Users\manuz\Desktop\Projects\RSIAB7514\Codes\Preliminars_Monthly_persnr.dta", clear
cd "C:\Users\manuz\Desktop\Projects\RSIAB7514\Codes"

*bysort year: gen count_year=_n
*keep if count_year==1

sort persnr year month
gen FT=0
gen PT=0
gen MJ=0
gen NE=0
gen CJ=0

bysort persnr: replace FT=1 if empstate==1
bysort persnr: replace PT=1 if empstate==2
bysort persnr: replace MJ=1 if empstate==3
bysort persnr: replace NE=1 if empstate==4
bysort persnr: replace CJ=1 if empstate==5

bysort year month: egen stock_FT=total(FT)
bysort year month: egen stock_PT=total(PT)
bysort year month: egen stock_MJ=total(MJ)
bysort year month: egen stock_NE=total(NE)
bysort year month: egen stock_CJ=total(CJ)

bysort year month: gen stock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_NE_share=stock_NE/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)

bysort year month: gen tstock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)

***this is the aggregation part:

sort year month

bysort year: egen ave_tstock_FT_share=mean(tstock_FT_share)
bysort year: egen ave_tstock_PT_share=mean(tstock_PT_share)
bysort year: egen ave_tstock_MJ_share=mean(tstock_MJ_share)
bysort year: egen ave_tstock_CJ_share=mean(tstock_CJ_share)

bysort year: egen ave_stock_FT_share=mean(stock_FT_share)
bysort year: egen ave_stock_PT_share=mean(stock_PT_share)
bysort year: egen ave_stock_MJ_share=mean(stock_MJ_share)
bysort year: egen ave_stock_NE_share=mean(stock_NE_share)
bysort year: egen ave_stock_CJ_share=mean(stock_CJ_share)

*

label variable ave_tstock_FT_share "FT"
label variable ave_tstock_PT_share "PT"
label variable ave_tstock_MJ_share "MJ"
label variable ave_tstock_CJ_share "CJ"

label variable ave_stock_FT_share "FT"
label variable ave_stock_PT_share "PT"
label variable ave_stock_MJ_share "MJ"
label variable ave_stock_NE_share "NE"
label variable ave_stock_CJ_share "CJ"

quietly twoway line ave_tstock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.05) 0.9, labsize(large) angle(horizontal))
graph export tstock_FT_unc.png, replace

quietly twoway line ave_tstock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.1 (0.02) 0.2, labsize(large) angle(horizontal))
graph export tstock_PT_unc.png, replace

quietly twoway line ave_tstock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_MJ_unc.png, replace

g ave_tstock_ME_share=ave_tstock_MJ_share+ave_tstock_CJ_share
replace ave_tstock_ME_share=ave_tstock_ME_share/(ave_tstock_FT_share+ave_tstock_PT_share+ave_tstock_ME_share)
quietly twoway line ave_tstock_ME_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.04) 0.2, labsize(large) angle(horizontal))
graph export tstock_ME_unc.png, replace
preserve
collapse ave_tstock_ME_share, by(year)
save "C:\Users\manuz\Desktop\Projects\ABS_HMCM\ME.dta", replace
restore

*

quietly twoway line ave_tstock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_CJ_unc.png, replace

*

quietly twoway line ave_stock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.05) 0.9, labsize(large) angle(horizontal))
graph export stock_FT_unc.png, replace

quietly twoway line ave_stock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.1 (0.02) 0.2, labsize(large) angle(horizontal))
graph export stock_PT_unc.png, replace

quietly twoway line ave_stock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_MJ_unc.png, replace

quietly twoway line ave_stock_NE_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_NE_unc.png, replace

quietly twoway line ave_stock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_CJ_unc.png, replace
*
*14) Males Stocks
cls
set more off
use "\Preliminars_Monthly_persnr.dta", clear
cd ""

*bysort year: gen count_year=_n
*keep if count_year==1
drop if female==1

sort persnr year month
gen FT=0
gen PT=0
gen MJ=0
gen NE=0
gen CJ=0

bysort persnr: replace FT=1 if empstate==1
bysort persnr: replace PT=1 if empstate==2
bysort persnr: replace MJ=1 if empstate==3
bysort persnr: replace NE=1 if empstate==4
bysort persnr: replace CJ=1 if empstate==5

bysort year month: egen stock_FT=total(FT)
bysort year month: egen stock_PT=total(PT)
bysort year month: egen stock_MJ=total(MJ)
bysort year month: egen stock_NE=total(NE)
bysort year month: egen stock_CJ=total(CJ)

bysort year month: gen stock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_NE_share=stock_NE/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)

bysort year month: gen tstock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)

***this is the aggregation part:

sort year month

bysort year: egen ave_tstock_FT_share=mean(tstock_FT_share)
bysort year: egen ave_tstock_PT_share=mean(tstock_PT_share)
bysort year: egen ave_tstock_MJ_share=mean(tstock_MJ_share)
bysort year: egen ave_tstock_CJ_share=mean(tstock_CJ_share)

bysort year: egen ave_stock_FT_share=mean(stock_FT_share)
bysort year: egen ave_stock_PT_share=mean(stock_PT_share)
bysort year: egen ave_stock_MJ_share=mean(stock_MJ_share)
bysort year: egen ave_stock_NE_share=mean(stock_NE_share)
bysort year: egen ave_stock_CJ_share=mean(stock_CJ_share)

*

label variable ave_tstock_FT_share "FT"
label variable ave_tstock_PT_share "PT"
label variable ave_tstock_MJ_share "MJ"
label variable ave_tstock_CJ_share "CJ"

label variable ave_stock_FT_share "FT"
label variable ave_stock_PT_share "PT"
label variable ave_stock_MJ_share "MJ"
label variable ave_stock_NE_share "NE"
label variable ave_stock_CJ_share "CJ"



quietly twoway line ave_tstock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.8 (0.04) 1, labsize(large) angle(horizontal))
graph export tstock_FT_male.png, replace

quietly twoway line ave_tstock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_PT_male.png, replace

quietly twoway line ave_tstock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_MJ_male.png, replace

quietly twoway line ave_tstock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_CJ_male.png, replace

*

quietly twoway line ave_stock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.05) 0.9, labsize(large) angle(horizontal))
graph export stock_FT_male.png, replace

quietly twoway line ave_stock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.1 (0.02) 0.2, labsize(large) angle(horizontal))
graph export stock_PT_male.png, replace

quietly twoway line ave_stock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_MJ_male.png, replace

quietly twoway line ave_stock_NE_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_NE_male.png, replace

quietly twoway line ave_stock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_CJ_male.png, replace
*
*15) Female Stocks
cls
set more off
use "\Preliminars_Monthly_persnr.dta", clear
cd ""

*bysort year: gen count_year=_n
*keep if count_year==1
drop if female==0

sort persnr year month
gen FT=0
gen PT=0
gen MJ=0
gen NE=0
gen CJ=0

bysort persnr: replace FT=1 if empstate==1
bysort persnr: replace PT=1 if empstate==2
bysort persnr: replace MJ=1 if empstate==3
bysort persnr: replace NE=1 if empstate==4
bysort persnr: replace CJ=1 if empstate==5

bysort year month: egen stock_FT=total(FT)
bysort year month: egen stock_PT=total(PT)
bysort year month: egen stock_MJ=total(MJ)
bysort year month: egen stock_NE=total(NE)
bysort year month: egen stock_CJ=total(CJ)

bysort year month: gen stock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_NE_share=stock_NE/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)

bysort year month: gen tstock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)

***this is the aggregation part:

sort year month

bysort year: egen ave_tstock_FT_share=mean(tstock_FT_share)
bysort year: egen ave_tstock_PT_share=mean(tstock_PT_share)
bysort year: egen ave_tstock_MJ_share=mean(tstock_MJ_share)
bysort year: egen ave_tstock_CJ_share=mean(tstock_CJ_share)

bysort year: egen ave_stock_FT_share=mean(stock_FT_share)
bysort year: egen ave_stock_PT_share=mean(stock_PT_share)
bysort year: egen ave_stock_MJ_share=mean(stock_MJ_share)
bysort year: egen ave_stock_NE_share=mean(stock_NE_share)
bysort year: egen ave_stock_CJ_share=mean(stock_CJ_share)

*

label variable ave_tstock_FT_share "FT"
label variable ave_tstock_PT_share "PT"
label variable ave_tstock_MJ_share "MJ"
label variable ave_tstock_CJ_share "CJ"

label variable ave_stock_FT_share "FT"
label variable ave_stock_PT_share "PT"
label variable ave_stock_MJ_share "MJ"
label variable ave_stock_NE_share "NE"
label variable ave_stock_CJ_share "CJ"

quietly twoway line ave_tstock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.05) 0.9, labsize(large) angle(horizontal))
graph export tstock_FT_female.png, replace

quietly twoway line ave_tstock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.1 (0.02) 0.2, labsize(large) angle(horizontal))
graph export tstock_PT_female.png, replace

quietly twoway line ave_tstock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_MJ_female.png, replace

quietly twoway line ave_tstock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_CJ_female.png, replace

*

quietly twoway line ave_stock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.05) 0.9, labsize(large) angle(horizontal))
graph export stock_FT_female.png, replace

quietly twoway line ave_stock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.1 (0.02) 0.2, labsize(large) angle(horizontal))
graph export stock_PT_female.png, replace

quietly twoway line ave_stock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_MJ_female.png, replace

quietly twoway line ave_stock_NE_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_NE_female.png, replace

quietly twoway line ave_stock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_CJ_female.png, replace

*16) Unconditional OutFlows
cls
set more off
use "\Preliminars_Monthly_persnr.dta", clear
cd ""

sort persnr year month
*bysort year: gen count_year=_n
*keep if count_year==1

bysort persnr: gen flow=1 if empstate!=empstate[_n-1]

gen FTP=0
gen FTM=0
gen FTN=0
gen FTC=0

gen PTF=0
gen PTM=0
gen PTN=0
gen PTC=0

gen MTF=0
gen MTP=0
gen MTN=0
gen MTC=0

gen NTF=0
gen NTP=0
gen NTM=0
gen NTC=0

gen CTF=0
gen CTP=0
gen CTM=0
gen CTN=0

bysort persnr: replace FTP=1 if empstate[_n-1]==1 & empstate==2 & flow==1
bysort persnr: replace FTM=1 if empstate[_n-1]==1 & empstate==3 & flow==1
bysort persnr: replace FTN=1 if empstate[_n-1]==1 & empstate==4 & flow==1
bysort persnr: replace FTC=1 if empstate[_n-1]==1 & empstate==5 & flow==1

bysort persnr: replace PTF=1 if empstate[_n-1]==2 & empstate==1 & flow==1
bysort persnr: replace PTM=1 if empstate[_n-1]==2 & empstate==3 & flow==1
bysort persnr: replace PTN=1 if empstate[_n-1]==2 & empstate==4 & flow==1
bysort persnr: replace PTC=1 if empstate[_n-1]==2 & empstate==5 & flow==1

bysort persnr: replace MTF=1 if empstate[_n-1]==3 & empstate==1 & flow==1
bysort persnr: replace MTP=1 if empstate[_n-1]==3 & empstate==2 & flow==1
bysort persnr: replace MTN=1 if empstate[_n-1]==3 & empstate==4 & flow==1
bysort persnr: replace MTC=1 if empstate[_n-1]==3 & empstate==5 & flow==1

bysort persnr: replace NTF=1 if empstate[_n-1]==4 & empstate==1 & flow==1
bysort persnr: replace NTP=1 if empstate[_n-1]==4 & empstate==2 & flow==1
bysort persnr: replace NTM=1 if empstate[_n-1]==4 & empstate==3 & flow==1
bysort persnr: replace NTC=1 if empstate[_n-1]==4 & empstate==5 & flow==1

bysort persnr: replace CTF=1 if empstate[_n-1]==5 & empstate==1 & flow==1
bysort persnr: replace CTP=1 if empstate[_n-1]==5 & empstate==2 & flow==1
bysort persnr: replace CTM=1 if empstate[_n-1]==5 & empstate==3 & flow==1
bysort persnr: replace CTN=1 if empstate[_n-1]==5 & empstate==5 & flow==1

bysort year month: egen tot_FTP=total(FTP)
bysort year month: egen tot_FTM=total(FTM)
bysort year month: egen tot_FTN=total(FTN)
bysort year month: egen tot_FTC=total(FTC)

bysort year month: egen tot_PTF=total(PTF)
bysort year month: egen tot_PTM=total(PTM)
bysort year month: egen tot_PTN=total(PTN)
bysort year month: egen tot_PTC=total(PTC)

bysort year month: egen tot_MTF=total(MTF)
bysort year month: egen tot_MTP=total(MTP)
bysort year month: egen tot_MTN=total(MTN)
bysort year month: egen tot_MTC=total(MTC)

bysort year month: egen tot_NTF=total(NTF)
bysort year month: egen tot_NTP=total(NTP)
bysort year month: egen tot_NTM=total(NTM)
bysort year month: egen tot_NTC=total(NTC)

bysort year month: egen tot_CTF=total(CTF)
bysort year month: egen tot_CTP=total(CTP)
bysort year month: egen tot_CTM=total(CTM)
bysort year month: egen tot_CTN=total(CTN)

bysort year month: gen FTP_share=tot_FTP/(tot_FTP+tot_FTM+tot_FTN+tot_FTC)
bysort year month: gen FTM_share=tot_FTM/(tot_FTP+tot_FTM+tot_FTN+tot_FTC)
bysort year month: gen FTN_share=tot_FTN/(tot_FTP+tot_FTM+tot_FTN+tot_FTC)
bysort year month: gen FTC_share=tot_FTC/(tot_FTP+tot_FTM+tot_FTN+tot_FTC)

bysort year month: gen PTF_share=tot_PTF/(tot_PTF+tot_PTM+tot_PTN+tot_PTC)
bysort year month: gen PTM_share=tot_PTM/(tot_PTF+tot_PTM+tot_PTN+tot_PTC)
bysort year month: gen PTN_share=tot_PTN/(tot_PTF+tot_PTM+tot_PTN+tot_PTC)
bysort year month: gen PTC_share=tot_PTC/(tot_PTF+tot_PTM+tot_PTN+tot_PTC)

bysort year month: gen MTF_share=tot_MTF/(tot_MTF+tot_MTP+tot_MTN+tot_MTC)
bysort year month: gen MTP_share=tot_MTP/(tot_MTF+tot_MTP+tot_MTN+tot_MTC)
bysort year month: gen MTN_share=tot_MTN/(tot_MTF+tot_MTP+tot_MTN+tot_MTC)
bysort year month: gen MTC_share=tot_MTC/(tot_MTF+tot_MTP+tot_MTN+tot_MTC)

bysort year month: gen NTF_share=tot_NTF/(tot_NTF+tot_NTP+tot_NTM+tot_NTC)
bysort year month: gen NTP_share=tot_NTP/(tot_NTF+tot_NTP+tot_NTM+tot_NTC)
bysort year month: gen NTM_share=tot_NTM/(tot_NTF+tot_NTP+tot_NTM+tot_NTC)
bysort year month: gen NTC_share=tot_NTC/(tot_NTF+tot_NTP+tot_NTM+tot_NTC)

bysort year month: gen CTF_share=tot_CTF/(tot_CTF+tot_CTP+tot_CTM+tot_CTN)
bysort year month: gen CTP_share=tot_CTP/(tot_CTF+tot_CTP+tot_CTM+tot_CTN)
bysort year month: gen CTM_share=tot_CTM/(tot_CTF+tot_CTP+tot_CTM+tot_CTN)
bysort year month: gen CTN_share=tot_CTN/(tot_CTF+tot_CTP+tot_CTM+tot_CTN)

bysort year: egen ave_year_FTP=mean(FTP_share)
bysort year: egen ave_year_FTM=mean(FTM_share)
bysort year: egen ave_year_FTN=mean(FTN_share)
bysort year: egen ave_year_FTC=mean(FTC_share)

bysort year: egen ave_year_PTF=mean(PTF_share)
bysort year: egen ave_year_PTM=mean(PTM_share)
bysort year: egen ave_year_PTN=mean(PTN_share)
bysort year: egen ave_year_PTC=mean(PTC_share)

bysort year: egen ave_year_MTF=mean(MTF_share)
bysort year: egen ave_year_MTP=mean(MTP_share)
bysort year: egen ave_year_MTN=mean(MTN_share)
bysort year: egen ave_year_MTC=mean(MTC_share)

bysort year: egen ave_year_NTF=mean(NTF_share)
bysort year: egen ave_year_NTP=mean(NTP_share)
bysort year: egen ave_year_NTM=mean(NTM_share)
bysort year: egen ave_year_NTC=mean(NTC_share)

bysort year: egen ave_year_CTF=mean(CTF_share)
bysort year: egen ave_year_CTP=mean(CTP_share)
bysort year: egen ave_year_CTM=mean(CTM_share)
bysort year: egen ave_year_CTN=mean(CTN_share)

label variable ave_year_FTP "PT"
label variable ave_year_FTM "ME"
label variable ave_year_FTN "NE"
label variable ave_year_FTC "CJ"

label variable ave_year_PTF "FT"
label variable ave_year_PTM "ME"
label variable ave_year_PTN "NE"
label variable ave_year_PTC "CJ"

label variable ave_year_MTF "FT"
label variable ave_year_MTP "PT"
label variable ave_year_MTN "NE"
label variable ave_year_MTC "CJ"

label variable ave_year_NTF "FT"
label variable ave_year_NTP "PT"
label variable ave_year_NTM "ME"
label variable ave_year_NTC "CJ"

label variable ave_year_CTF "FT"
label variable ave_year_CTP "PT"
label variable ave_year_CTM "ME"
label variable ave_year_CTN "NE"

quietly twoway line ave_year_FTP ave_year_FTM ave_year_FTN ave_year_FTC year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_FT_unc.png, replace

quietly twoway line ave_year_PTF ave_year_PTM ave_year_PTN ave_year_PTC year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(blue green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_PT_unc.png, replace

quietly twoway line ave_year_MTF ave_year_MTP ave_year_MTN ave_year_MTC year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(blue red brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_ME_unc.png, replace

quietly twoway line ave_year_NTF ave_year_NTP ave_year_NTM ave_year_NTC year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(blue red magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_NE_unc.png, replace

quietly twoway line ave_year_CTF ave_year_CTP ave_year_CTM ave_year_CTN year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(blue red green brown magenta purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_CJ_unc.png, replace
*

*17) Male OutFlows
cls
set more off
use "\Preliminars_Monthly_persnr.dta", clear
cd ""

drop if female==1

sort persnr year month
*bysort year: gen count_year=_n
*keep if count_year==1

bysort persnr: gen flow=1 if empstate!=empstate[_n-1]

gen FTP=0
gen FTM=0
gen FTN=0
gen FTC=0

gen PTF=0
gen PTM=0
gen PTN=0
gen PTC=0

gen MTF=0
gen MTP=0
gen MTN=0
gen MTC=0

gen NTF=0
gen NTP=0
gen NTM=0
gen NTC=0

gen CTF=0
gen CTP=0
gen CTM=0
gen CTN=0

bysort persnr: replace FTP=1 if empstate[_n-1]==1 & empstate==2 & flow==1
bysort persnr: replace FTM=1 if empstate[_n-1]==1 & empstate==3 & flow==1
bysort persnr: replace FTN=1 if empstate[_n-1]==1 & empstate==4 & flow==1
bysort persnr: replace FTC=1 if empstate[_n-1]==1 & empstate==5 & flow==1

bysort persnr: replace PTF=1 if empstate[_n-1]==2 & empstate==1 & flow==1
bysort persnr: replace PTM=1 if empstate[_n-1]==2 & empstate==3 & flow==1
bysort persnr: replace PTN=1 if empstate[_n-1]==2 & empstate==4 & flow==1
bysort persnr: replace PTC=1 if empstate[_n-1]==2 & empstate==5 & flow==1

bysort persnr: replace MTF=1 if empstate[_n-1]==3 & empstate==1 & flow==1
bysort persnr: replace MTP=1 if empstate[_n-1]==3 & empstate==2 & flow==1
bysort persnr: replace MTN=1 if empstate[_n-1]==3 & empstate==4 & flow==1
bysort persnr: replace MTC=1 if empstate[_n-1]==3 & empstate==5 & flow==1

bysort persnr: replace NTF=1 if empstate[_n-1]==4 & empstate==1 & flow==1
bysort persnr: replace NTP=1 if empstate[_n-1]==4 & empstate==2 & flow==1
bysort persnr: replace NTM=1 if empstate[_n-1]==4 & empstate==3 & flow==1
bysort persnr: replace NTC=1 if empstate[_n-1]==4 & empstate==5 & flow==1

bysort persnr: replace CTF=1 if empstate[_n-1]==5 & empstate==1 & flow==1
bysort persnr: replace CTP=1 if empstate[_n-1]==5 & empstate==2 & flow==1
bysort persnr: replace CTM=1 if empstate[_n-1]==5 & empstate==3 & flow==1
bysort persnr: replace CTN=1 if empstate[_n-1]==5 & empstate==5 & flow==1

bysort year month: egen tot_FTP=total(FTP)
bysort year month: egen tot_FTM=total(FTM)
bysort year month: egen tot_FTN=total(FTN)
bysort year month: egen tot_FTC=total(FTC)

bysort year month: egen tot_PTF=total(PTF)
bysort year month: egen tot_PTM=total(PTM)
bysort year month: egen tot_PTN=total(PTN)
bysort year month: egen tot_PTC=total(PTC)

bysort year month: egen tot_MTF=total(MTF)
bysort year month: egen tot_MTP=total(MTP)
bysort year month: egen tot_MTN=total(MTN)
bysort year month: egen tot_MTC=total(MTC)

bysort year month: egen tot_NTF=total(NTF)
bysort year month: egen tot_NTP=total(NTP)
bysort year month: egen tot_NTM=total(NTM)
bysort year month: egen tot_NTC=total(NTC)

bysort year month: egen tot_CTF=total(CTF)
bysort year month: egen tot_CTP=total(CTP)
bysort year month: egen tot_CTM=total(CTM)
bysort year month: egen tot_CTN=total(CTN)

bysort year month: gen FTP_share=tot_FTP/(tot_FTP+tot_FTM+tot_FTN+tot_FTC)
bysort year month: gen FTM_share=tot_FTM/(tot_FTP+tot_FTM+tot_FTN+tot_FTC)
bysort year month: gen FTN_share=tot_FTN/(tot_FTP+tot_FTM+tot_FTN+tot_FTC)
bysort year month: gen FTC_share=tot_FTC/(tot_FTP+tot_FTM+tot_FTN+tot_FTC)

bysort year month: gen PTF_share=tot_PTF/(tot_PTF+tot_PTM+tot_PTN+tot_PTC)
bysort year month: gen PTM_share=tot_PTM/(tot_PTF+tot_PTM+tot_PTN+tot_PTC)
bysort year month: gen PTN_share=tot_PTN/(tot_PTF+tot_PTM+tot_PTN+tot_PTC)
bysort year month: gen PTC_share=tot_PTC/(tot_PTF+tot_PTM+tot_PTN+tot_PTC)

bysort year month: gen MTF_share=tot_MTF/(tot_MTF+tot_MTP+tot_MTN+tot_MTC)
bysort year month: gen MTP_share=tot_MTP/(tot_MTF+tot_MTP+tot_MTN+tot_MTC)
bysort year month: gen MTN_share=tot_MTN/(tot_MTF+tot_MTP+tot_MTN+tot_MTC)
bysort year month: gen MTC_share=tot_MTC/(tot_MTF+tot_MTP+tot_MTN+tot_MTC)

bysort year month: gen NTF_share=tot_NTF/(tot_NTF+tot_NTP+tot_NTM+tot_NTC)
bysort year month: gen NTP_share=tot_NTP/(tot_NTF+tot_NTP+tot_NTM+tot_NTC)
bysort year month: gen NTM_share=tot_NTM/(tot_NTF+tot_NTP+tot_NTM+tot_NTC)
bysort year month: gen NTC_share=tot_NTC/(tot_NTF+tot_NTP+tot_NTM+tot_NTC)

bysort year month: gen CTF_share=tot_CTF/(tot_CTF+tot_CTP+tot_CTM+tot_CTN)
bysort year month: gen CTP_share=tot_CTP/(tot_CTF+tot_CTP+tot_CTM+tot_CTN)
bysort year month: gen CTM_share=tot_CTM/(tot_CTF+tot_CTP+tot_CTM+tot_CTN)
bysort year month: gen CTN_share=tot_CTN/(tot_CTF+tot_CTP+tot_CTM+tot_CTN)

bysort year: egen ave_year_FTP=mean(FTP_share)
bysort year: egen ave_year_FTM=mean(FTM_share)
bysort year: egen ave_year_FTN=mean(FTN_share)
bysort year: egen ave_year_FTC=mean(FTC_share)

bysort year: egen ave_year_PTF=mean(PTF_share)
bysort year: egen ave_year_PTM=mean(PTM_share)
bysort year: egen ave_year_PTN=mean(PTN_share)
bysort year: egen ave_year_PTC=mean(PTC_share)

bysort year: egen ave_year_MTF=mean(MTF_share)
bysort year: egen ave_year_MTP=mean(MTP_share)
bysort year: egen ave_year_MTN=mean(MTN_share)
bysort year: egen ave_year_MTC=mean(MTC_share)

bysort year: egen ave_year_NTF=mean(NTF_share)
bysort year: egen ave_year_NTP=mean(NTP_share)
bysort year: egen ave_year_NTM=mean(NTM_share)
bysort year: egen ave_year_NTC=mean(NTC_share)

bysort year: egen ave_year_CTF=mean(CTF_share)
bysort year: egen ave_year_CTP=mean(CTP_share)
bysort year: egen ave_year_CTM=mean(CTM_share)
bysort year: egen ave_year_CTN=mean(CTN_share)

label variable ave_year_FTP "PT"
label variable ave_year_FTM "ME"
label variable ave_year_FTN "NE"
label variable ave_year_FTC "CJ"

label variable ave_year_PTF "FT"
label variable ave_year_PTM "ME"
label variable ave_year_PTN "NE"
label variable ave_year_PTC "CJ"

label variable ave_year_MTF "FT"
label variable ave_year_MTP "PT"
label variable ave_year_MTN "NE"
label variable ave_year_MTC "CJ"

label variable ave_year_NTF "FT"
label variable ave_year_NTP "PT"
label variable ave_year_NTM "ME"
label variable ave_year_NTC "CJ"

label variable ave_year_CTF "FT"
label variable ave_year_CTP "PT"
label variable ave_year_CTM "ME"
label variable ave_year_CTN "NE"

quietly twoway line ave_year_FTP ave_year_FTM ave_year_FTN ave_year_FTC year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_FT_male.png, replace

quietly twoway line ave_year_PTF ave_year_PTM ave_year_PTN ave_year_PTC year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(blue green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_PT_male.png, replace

quietly twoway line ave_year_MTF ave_year_MTP ave_year_MTN ave_year_MTC year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(blue red brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_ME_male.png, replace

quietly twoway line ave_year_NTF ave_year_NTP ave_year_NTM ave_year_NTC year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(blue red magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_NE_male.png, replace

quietly twoway line ave_year_CTF ave_year_CTP ave_year_CTM ave_year_CTN year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(blue red green brown magenta purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_CJ_male.png, replace
*

*18) Female OutFlows
cls
set more off
use "\Preliminars_Monthly_persnr.dta", clear
cd ""

drop if female==0

sort persnr year month
*bysort year: gen count_year=_n
*keep if count_year==1

bysort persnr: gen flow=1 if empstate!=empstate[_n-1]

gen FTP=0
gen FTM=0
gen FTN=0
gen FTC=0

gen PTF=0
gen PTM=0
gen PTN=0
gen PTC=0

gen MTF=0
gen MTP=0
gen MTN=0
gen MTC=0

gen NTF=0
gen NTP=0
gen NTM=0
gen NTC=0

gen CTF=0
gen CTP=0
gen CTM=0
gen CTN=0

bysort persnr: replace FTP=1 if empstate[_n-1]==1 & empstate==2 & flow==1
bysort persnr: replace FTM=1 if empstate[_n-1]==1 & empstate==3 & flow==1
bysort persnr: replace FTN=1 if empstate[_n-1]==1 & empstate==4 & flow==1
bysort persnr: replace FTC=1 if empstate[_n-1]==1 & empstate==5 & flow==1

bysort persnr: replace PTF=1 if empstate[_n-1]==2 & empstate==1 & flow==1
bysort persnr: replace PTM=1 if empstate[_n-1]==2 & empstate==3 & flow==1
bysort persnr: replace PTN=1 if empstate[_n-1]==2 & empstate==4 & flow==1
bysort persnr: replace PTC=1 if empstate[_n-1]==2 & empstate==5 & flow==1

bysort persnr: replace MTF=1 if empstate[_n-1]==3 & empstate==1 & flow==1
bysort persnr: replace MTP=1 if empstate[_n-1]==3 & empstate==2 & flow==1
bysort persnr: replace MTN=1 if empstate[_n-1]==3 & empstate==4 & flow==1
bysort persnr: replace MTC=1 if empstate[_n-1]==3 & empstate==5 & flow==1

bysort persnr: replace NTF=1 if empstate[_n-1]==4 & empstate==1 & flow==1
bysort persnr: replace NTP=1 if empstate[_n-1]==4 & empstate==2 & flow==1
bysort persnr: replace NTM=1 if empstate[_n-1]==4 & empstate==3 & flow==1
bysort persnr: replace NTC=1 if empstate[_n-1]==4 & empstate==5 & flow==1

bysort persnr: replace CTF=1 if empstate[_n-1]==5 & empstate==1 & flow==1
bysort persnr: replace CTP=1 if empstate[_n-1]==5 & empstate==2 & flow==1
bysort persnr: replace CTM=1 if empstate[_n-1]==5 & empstate==3 & flow==1
bysort persnr: replace CTN=1 if empstate[_n-1]==5 & empstate==5 & flow==1

bysort year month: egen tot_FTP=total(FTP)
bysort year month: egen tot_FTM=total(FTM)
bysort year month: egen tot_FTN=total(FTN)
bysort year month: egen tot_FTC=total(FTC)

bysort year month: egen tot_PTF=total(PTF)
bysort year month: egen tot_PTM=total(PTM)
bysort year month: egen tot_PTN=total(PTN)
bysort year month: egen tot_PTC=total(PTC)

bysort year month: egen tot_MTF=total(MTF)
bysort year month: egen tot_MTP=total(MTP)
bysort year month: egen tot_MTN=total(MTN)
bysort year month: egen tot_MTC=total(MTC)

bysort year month: egen tot_NTF=total(NTF)
bysort year month: egen tot_NTP=total(NTP)
bysort year month: egen tot_NTM=total(NTM)
bysort year month: egen tot_NTC=total(NTC)

bysort year month: egen tot_CTF=total(CTF)
bysort year month: egen tot_CTP=total(CTP)
bysort year month: egen tot_CTM=total(CTM)
bysort year month: egen tot_CTN=total(CTN)

bysort year month: gen FTP_share=tot_FTP/(tot_FTP+tot_FTM+tot_FTN+tot_FTC)
bysort year month: gen FTM_share=tot_FTM/(tot_FTP+tot_FTM+tot_FTN+tot_FTC)
bysort year month: gen FTN_share=tot_FTN/(tot_FTP+tot_FTM+tot_FTN+tot_FTC)
bysort year month: gen FTC_share=tot_FTC/(tot_FTP+tot_FTM+tot_FTN+tot_FTC)

bysort year month: gen PTF_share=tot_PTF/(tot_PTF+tot_PTM+tot_PTN+tot_PTC)
bysort year month: gen PTM_share=tot_PTM/(tot_PTF+tot_PTM+tot_PTN+tot_PTC)
bysort year month: gen PTN_share=tot_PTN/(tot_PTF+tot_PTM+tot_PTN+tot_PTC)
bysort year month: gen PTC_share=tot_PTC/(tot_PTF+tot_PTM+tot_PTN+tot_PTC)

bysort year month: gen MTF_share=tot_MTF/(tot_MTF+tot_MTP+tot_MTN+tot_MTC)
bysort year month: gen MTP_share=tot_MTP/(tot_MTF+tot_MTP+tot_MTN+tot_MTC)
bysort year month: gen MTN_share=tot_MTN/(tot_MTF+tot_MTP+tot_MTN+tot_MTC)
bysort year month: gen MTC_share=tot_MTC/(tot_MTF+tot_MTP+tot_MTN+tot_MTC)

bysort year month: gen NTF_share=tot_NTF/(tot_NTF+tot_NTP+tot_NTM+tot_NTC)
bysort year month: gen NTP_share=tot_NTP/(tot_NTF+tot_NTP+tot_NTM+tot_NTC)
bysort year month: gen NTM_share=tot_NTM/(tot_NTF+tot_NTP+tot_NTM+tot_NTC)
bysort year month: gen NTC_share=tot_NTC/(tot_NTF+tot_NTP+tot_NTM+tot_NTC)

bysort year month: gen CTF_share=tot_CTF/(tot_CTF+tot_CTP+tot_CTM+tot_CTN)
bysort year month: gen CTP_share=tot_CTP/(tot_CTF+tot_CTP+tot_CTM+tot_CTN)
bysort year month: gen CTM_share=tot_CTM/(tot_CTF+tot_CTP+tot_CTM+tot_CTN)
bysort year month: gen CTN_share=tot_CTN/(tot_CTF+tot_CTP+tot_CTM+tot_CTN)

bysort year: egen ave_year_FTP=mean(FTP_share)
bysort year: egen ave_year_FTM=mean(FTM_share)
bysort year: egen ave_year_FTN=mean(FTN_share)
bysort year: egen ave_year_FTC=mean(FTC_share)

bysort year: egen ave_year_PTF=mean(PTF_share)
bysort year: egen ave_year_PTM=mean(PTM_share)
bysort year: egen ave_year_PTN=mean(PTN_share)
bysort year: egen ave_year_PTC=mean(PTC_share)

bysort year: egen ave_year_MTF=mean(MTF_share)
bysort year: egen ave_year_MTP=mean(MTP_share)
bysort year: egen ave_year_MTN=mean(MTN_share)
bysort year: egen ave_year_MTC=mean(MTC_share)

bysort year: egen ave_year_NTF=mean(NTF_share)
bysort year: egen ave_year_NTP=mean(NTP_share)
bysort year: egen ave_year_NTM=mean(NTM_share)
bysort year: egen ave_year_NTC=mean(NTC_share)

bysort year: egen ave_year_CTF=mean(CTF_share)
bysort year: egen ave_year_CTP=mean(CTP_share)
bysort year: egen ave_year_CTM=mean(CTM_share)
bysort year: egen ave_year_CTN=mean(CTN_share)

label variable ave_year_FTP "PT"
label variable ave_year_FTM "ME"
label variable ave_year_FTN "NE"
label variable ave_year_FTC "CJ"

label variable ave_year_PTF "FT"
label variable ave_year_PTM "ME"
label variable ave_year_PTN "NE"
label variable ave_year_PTC "CJ"

label variable ave_year_MTF "FT"
label variable ave_year_MTP "PT"
label variable ave_year_MTN "NE"
label variable ave_year_MTC "CJ"

label variable ave_year_NTF "FT"
label variable ave_year_NTP "PT"
label variable ave_year_NTM "ME"
label variable ave_year_NTC "CJ"

label variable ave_year_CTF "FT"
label variable ave_year_CTP "PT"
label variable ave_year_CTM "ME"
label variable ave_year_CTN "NE"

quietly twoway line ave_year_FTP ave_year_FTM ave_year_FTN ave_year_FTC year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_FT_female.png, replace

quietly twoway line ave_year_PTF ave_year_PTM ave_year_PTN ave_year_PTC year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(blue green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_PT_female.png, replace

quietly twoway line ave_year_MTF ave_year_MTP ave_year_MTN ave_year_MTC year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(blue red brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_ME_female.png, replace

quietly twoway line ave_year_NTF ave_year_NTP ave_year_NTM ave_year_NTC year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(blue red magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_NE_female.png, replace

quietly twoway line ave_year_CTF ave_year_CTP ave_year_CTM ave_year_CTN year if year>=1999, ytitle({bf:(%) Outflows}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lcolor(blue red green brown magenta purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 1, labsize(large) angle(horizontal))
graph export outflows_CJ_female.png, replace
*

*19) 
cls
set more off
use "\Preliminars_Monthly_persnr.dta", clear
cd ""

sort persnr year month

g counter_FT=.
g counter_PT=.
g counter_ME=.
g counter_NE=.
g counter_CJ=.

*month 1
bysort persnr year: replace counter_FT=1 if month==1
bysort persnr year: replace counter_PT=1 if month==1
bysort persnr year: replace counter_ME=1 if month==1
bysort persnr year: replace counter_NE=1 if month==1
bysort persnr year: replace counter_CJ=1 if month==1
*any other beginning periods
bysort persnr year: replace counter_FT=1 if empstate==1 & empstate[_n-1]!=1
bysort persnr year: replace counter_PT=1 if empstate==2 & empstate[_n-1]!=2
bysort persnr year: replace counter_ME=1 if empstate==3 & empstate[_n-1]!=3
bysort persnr year: replace counter_NE=1 if empstate==4 & empstate[_n-1]!=4
bysort persnr year: replace counter_CJ=1 if empstate==5 & empstate[_n-1]!=5
*fill in
bysort persnr year: replace counter_FT=counter_FT[_n-1]+1 if empstate==empstate[_n-1] & empstate==1
bysort persnr year: replace counter_PT=counter_PT[_n-1]+1 if empstate==empstate[_n-1] & empstate==2
bysort persnr year: replace counter_ME=counter_ME[_n-1]+1 if empstate==empstate[_n-1] & empstate==3
bysort persnr year: replace counter_NE=counter_NE[_n-1]+1 if empstate==empstate[_n-1] & empstate==4
bysort persnr year: replace counter_CJ=counter_CJ[_n-1]+1 if empstate==empstate[_n-1] & empstate==5
*gen max counters
bysort persnr year: egen max_counter_FT=max(counter_FT)
bysort persnr year: egen max_counter_PT=max(counter_PT)
bysort persnr year: egen max_counter_ME=max(counter_ME)
bysort persnr year: egen max_counter_NE=max(counter_NE)
bysort persnr year: egen max_counter_CJ=max(counter_CJ)
*year averages
bysort year: egen ave_max_counter_FT=mean(max_counter_FT)
bysort year: egen ave_max_counter_PT=mean(max_counter_PT)
bysort year: egen ave_max_counter_ME=mean(max_counter_ME)
bysort year: egen ave_max_counter_NE=mean(max_counter_NE)
bysort year: egen ave_max_counter_CJ=mean(max_counter_CJ)

keep if month==1

label variable ave_max_counter_FT "FT"
label variable ave_max_counter_PT "PT"
label variable ave_max_counter_ME "ME"
label variable ave_max_counter_NE "NE"
label variable ave_max_counter_CJ "CJ"


quietly twoway line ave_max_counter_FT ave_max_counter_PT ave_max_counter_ME ave_max_counter_NE ave_max_counter_CJ year, ytitle({bf:E[# Months]}, size(large) height(5)) lcolor(blue red green brown magenta gold purple) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (2) 12, labsize(large) angle(horizontal))
graph export mean_month_unc.png, replace


*20) 
cls
set more off
use "\Preliminars_Monthly_persnr.dta", clear
cd ""

drop if female==1

sort persnr year month

g counter_FT=.
g counter_PT=.
g counter_ME=.
g counter_NE=.
g counter_CJ=.

*month 1
bysort persnr year: replace counter_FT=1 if month==1
bysort persnr year: replace counter_PT=1 if month==1
bysort persnr year: replace counter_ME=1 if month==1
bysort persnr year: replace counter_NE=1 if month==1
bysort persnr year: replace counter_CJ=1 if month==1
*any other beginning periods
bysort persnr year: replace counter_FT=1 if empstate==1 & empstate[_n-1]!=1
bysort persnr year: replace counter_PT=1 if empstate==2 & empstate[_n-1]!=2
bysort persnr year: replace counter_ME=1 if empstate==3 & empstate[_n-1]!=3
bysort persnr year: replace counter_NE=1 if empstate==4 & empstate[_n-1]!=4
bysort persnr year: replace counter_CJ=1 if empstate==5 & empstate[_n-1]!=5
*fill in
bysort persnr year: replace counter_FT=counter_FT[_n-1]+1 if empstate==empstate[_n-1] & empstate==1
bysort persnr year: replace counter_PT=counter_PT[_n-1]+1 if empstate==empstate[_n-1] & empstate==2
bysort persnr year: replace counter_ME=counter_ME[_n-1]+1 if empstate==empstate[_n-1] & empstate==3
bysort persnr year: replace counter_NE=counter_NE[_n-1]+1 if empstate==empstate[_n-1] & empstate==4
bysort persnr year: replace counter_CJ=counter_CJ[_n-1]+1 if empstate==empstate[_n-1] & empstate==5
*gen max counters
bysort persnr year: egen max_counter_FT=max(counter_FT)
bysort persnr year: egen max_counter_PT=max(counter_PT)
bysort persnr year: egen max_counter_ME=max(counter_ME)
bysort persnr year: egen max_counter_NE=max(counter_NE)
bysort persnr year: egen max_counter_CJ=max(counter_CJ)
*year averages
bysort year: egen ave_max_counter_FT=mean(max_counter_FT)
bysort year: egen ave_max_counter_PT=mean(max_counter_PT)
bysort year: egen ave_max_counter_ME=mean(max_counter_ME)
bysort year: egen ave_max_counter_NE=mean(max_counter_NE)
bysort year: egen ave_max_counter_CJ=mean(max_counter_CJ)

keep if month==1

label variable ave_max_counter_FT "FT"
label variable ave_max_counter_PT "PT"
label variable ave_max_counter_ME "ME"
label variable ave_max_counter_NE "NE"
label variable ave_max_counter_CJ "CJ"


quietly twoway line ave_max_counter_FT ave_max_counter_PT ave_max_counter_ME ave_max_counter_NE ave_max_counter_CJ year, ytitle({bf:E[# Months]}, size(large) height(5)) lcolor(blue red green brown magenta gold purple) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (2) 12, labsize(large) angle(horizontal))
graph export mean_month_male.png, replace


*21) 
cls
set more off
use "\Preliminars_Monthly_persnr.dta", clear
cd ""

drop if female==0

sort persnr year month

g counter_FT=.
g counter_PT=.
g counter_ME=.
g counter_NE=.
g counter_CJ=.

*month 1
bysort persnr year: replace counter_FT=1 if month==1
bysort persnr year: replace counter_PT=1 if month==1
bysort persnr year: replace counter_ME=1 if month==1
bysort persnr year: replace counter_NE=1 if month==1
bysort persnr year: replace counter_CJ=1 if month==1
*any other beginning periods
bysort persnr year: replace counter_FT=1 if empstate==1 & empstate[_n-1]!=1
bysort persnr year: replace counter_PT=1 if empstate==2 & empstate[_n-1]!=2
bysort persnr year: replace counter_ME=1 if empstate==3 & empstate[_n-1]!=3
bysort persnr year: replace counter_NE=1 if empstate==4 & empstate[_n-1]!=4
bysort persnr year: replace counter_CJ=1 if empstate==5 & empstate[_n-1]!=5
*fill in
bysort persnr year: replace counter_FT=counter_FT[_n-1]+1 if empstate==empstate[_n-1] & empstate==1
bysort persnr year: replace counter_PT=counter_PT[_n-1]+1 if empstate==empstate[_n-1] & empstate==2
bysort persnr year: replace counter_ME=counter_ME[_n-1]+1 if empstate==empstate[_n-1] & empstate==3
bysort persnr year: replace counter_NE=counter_NE[_n-1]+1 if empstate==empstate[_n-1] & empstate==4
bysort persnr year: replace counter_CJ=counter_CJ[_n-1]+1 if empstate==empstate[_n-1] & empstate==5
*gen max counters
bysort persnr year: egen max_counter_FT=max(counter_FT)
bysort persnr year: egen max_counter_PT=max(counter_PT)
bysort persnr year: egen max_counter_ME=max(counter_ME)
bysort persnr year: egen max_counter_NE=max(counter_NE)
bysort persnr year: egen max_counter_CJ=max(counter_CJ)
*year averages
bysort year: egen ave_max_counter_FT=mean(max_counter_FT)
bysort year: egen ave_max_counter_PT=mean(max_counter_PT)
bysort year: egen ave_max_counter_ME=mean(max_counter_ME)
bysort year: egen ave_max_counter_NE=mean(max_counter_NE)
bysort year: egen ave_max_counter_CJ=mean(max_counter_CJ)

keep if month==1

label variable ave_max_counter_FT "FT"
label variable ave_max_counter_PT "PT"
label variable ave_max_counter_ME "ME"
label variable ave_max_counter_NE "NE"
label variable ave_max_counter_CJ "CJ"


quietly twoway line ave_max_counter_FT ave_max_counter_PT ave_max_counter_ME ave_max_counter_NE ave_max_counter_CJ year, ytitle({bf:E[# Months]}, size(large) height(5)) lcolor(blue red green brown magenta gold purple) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (2) 12, labsize(large) angle(horizontal))
graph export mean_month_female.png, replace

*22) CS Inequality by form of Employment
***Cross Sectional Earnings Inequality

cls
set more off
use "\Preliminars_Monthly_persnr.dta", replace
cd ""

drop if empstate==4
*drop if female==1

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year empstate: egen earnings_year=total(earnings)
drop earnings

*bysort persnr year: gen first=_n
*keep if first==1
*drop first

gen log_earnings=log(earnings_year)
bysort year: egen sd_earnings_FT=sd(log_earnings) if empstate==1
bysort year: egen sd_earnings_PT=sd(log_earnings) if empstate==2
bysort year: egen sd_earnings_ME=sd(log_earnings) if empstate==3
bysort year: egen sd_earnings_CJ=sd(log_earnings) if empstate==5
gen var_earnings_FT=sd_earnings_FT^2
gen var_earnings_PT=sd_earnings_PT^2
gen var_earnings_ME=sd_earnings_ME^2
gen var_earnings_CJ=sd_earnings_CJ^2

label variable var_earnings_FT "FT"
label variable var_earnings_PT "PT"
label variable var_earnings_ME "ME"
label variable var_earnings_CJ "CJ"

quietly twoway line var_earnings_FT var_earnings_PT var_earnings_ME var_earnings_CJ year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.3 (0.1) 0.9, labsize(large) angle(horizontal))
graph export var_form_unc_cs.png, replace

*23) CS Inequality by form of Employment - MALE
***Cross Sectional Earnings Inequality

cls
set more off
use "\Preliminars_Monthly_persnr.dta", replace
cd ""

drop if empstate==4
drop if female==1

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year empstate: egen earnings_year=total(earnings)
drop earnings

*bysort persnr year: gen first=_n
*keep if first==1
*drop first

gen log_earnings=log(earnings_year)
bysort year: egen sd_earnings_FT=sd(log_earnings) if empstate==1
bysort year: egen sd_earnings_PT=sd(log_earnings) if empstate==2
bysort year: egen sd_earnings_ME=sd(log_earnings) if empstate==3
bysort year: egen sd_earnings_CJ=sd(log_earnings) if empstate==5
gen var_earnings_FT=sd_earnings_FT^2
gen var_earnings_PT=sd_earnings_PT^2
gen var_earnings_ME=sd_earnings_ME^2
gen var_earnings_CJ=sd_earnings_CJ^2

label variable var_earnings_FT "FT"
label variable var_earnings_PT "PT"
label variable var_earnings_ME "ME"
label variable var_earnings_CJ "CJ"

quietly twoway line var_earnings_FT var_earnings_PT var_earnings_ME var_earnings_CJ year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.3 (0.1) 0.9, labsize(large) angle(horizontal))
graph export var_form_male_cs.png, replace

*24) CS Inequality by form of Employment - Female
***Cross Sectional Earnings Inequality

cls
set more off
use "\Preliminars_Monthly_persnr.dta", replace
cd ""

drop if empstate==4
drop if female==0

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year empstate: egen earnings_year=total(earnings)
drop earnings

*bysort persnr year: gen first=_n
*keep if first==1
*drop first

gen log_earnings=log(earnings_year)
bysort year: egen sd_earnings_FT=sd(log_earnings) if empstate==1
bysort year: egen sd_earnings_PT=sd(log_earnings) if empstate==2
bysort year: egen sd_earnings_ME=sd(log_earnings) if empstate==3
bysort year: egen sd_earnings_CJ=sd(log_earnings) if empstate==5
gen var_earnings_FT=sd_earnings_FT^2
gen var_earnings_PT=sd_earnings_PT^2
gen var_earnings_ME=sd_earnings_ME^2
gen var_earnings_CJ=sd_earnings_CJ^2

label variable var_earnings_FT "FT"
label variable var_earnings_PT "PT"
label variable var_earnings_ME "ME"
label variable var_earnings_CJ "CJ"

quietly twoway line var_earnings_FT var_earnings_PT var_earnings_ME var_earnings_CJ year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.3 (0.1) 0.9, labsize(large) angle(horizontal))
graph export var_form_female_cs.png, replace

*25) Mean and Variance 5 year by Form of Employment

*Ranking

cls
clear
set more off

*
*set memory 16g
use "\Preliminars_Monthly_persnr", clear

drop if empstate==4

sort persnr year month

*full time
forval i=1999(1)2010 {

preserve

bysort persnr year: g month_earnings=(exp(log_ave_wage))*30
bysort persnr year: egen earnings_year=total(month_earnings)
drop month_earnings

bysort persnr year empstate: gen first=_n if empstate==1
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini, CJ)
qui gen begin_`i'=1 if year==`i' & empstate==1
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

qui ge var_lt_work_`i' = .


sort persnr year empstate
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  empstate==1 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
qui egen mean_sum_earnings_long_term_work=mean(sum_earnings_long_term_work)
qui egen meanlog_earnings_long_term=mean(log_sum_earnings_long_term_work)
*
qui egen mean_sum_earnings_yearly_work=mean(sum_earnings_yearly_work)
qui egen meanlog_earnings_yearly=mean(log_sum_earnings_yearly_work)
*
egen sd=sd(log_sum_earnings_long_term_work)
replace var_lt_work_`i'=sd
drop sd
*
*

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep




*** Keep

keep year var* mean* log* educ* age* year_birth*

display `i'

saveold "\bonke_`i'_5years_unc_full.dta", replace

restore

}

*


*part

clear
set more off

*
*set memory 16g
use "\Preliminars_Monthly_persnr", clear
ssc install fastgini

*** Cross Sectional Gini on Long Term Earnings

*keep if female==0
drop if empstate==4

sort persnr year month
forval i=1999(1)2010 {

preserve

bysort persnr year: g month_earnings=(exp(log_ave_wage))*30
bysort persnr year: egen earnings_year=total(month_earnings)
drop month_earnings

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year empstate: gen first=_n if empstate==2
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==2
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

qui ge var_lt_work_`i' = .

sort persnr year empstate
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  empstate==2 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
qui egen mean_sum_earnings_long_term_work=mean(sum_earnings_long_term_work)
qui egen meanlog_earnings_long_term=mean(log_sum_earnings_long_term_work)
*
qui egen mean_sum_earnings_yearly_work=mean(sum_earnings_yearly_work)
qui egen meanlog_earnings_yearly=mean(log_sum_earnings_yearly_work)

egen sd=sd(log_sum_earnings_long_term_work)
replace var_lt_work_`i'=sd
drop sd
*
*

replace var_lt_work_`i'=var_lt_work_`i'^2

*** Keep

keep year var* mean* log* educ* age* year_birth*


display `i'

saveold "\bonke_`i'_5years_unc_part.dta", replace

restore

}

*

*mini
cls
clear
set more off

*
*set memory 16g
use "\Preliminars_Monthly_persnr", clear
ssc install fastgini

drop if empstate==4
*** Cross Sectional Gini on Long Term Earnings

*keep if female==0


sort persnr year month
forval i=1999(1)2010 {

preserve

bysort persnr year: g month_earnings=(exp(log_ave_wage))*30
bysort persnr year: egen earnings_year=total(month_earnings)
drop month_earnings

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year empstate: gen first=_n if empstate==3
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==3
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

qui ge var_lt_work_`i' = .
*

sort persnr year empstate
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  empstate==3 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
qui egen mean_sum_earnings_long_term_work=mean(sum_earnings_long_term_work)
qui egen meanlog_earnings_long_term=mean(log_sum_earnings_long_term_work)
*
qui egen mean_sum_earnings_yearly_work=mean(sum_earnings_yearly_work)
qui egen meanlog_earnings_yearly=mean(log_sum_earnings_yearly_work)
egen sd=sd(log_sum_earnings_long_term_work)
replace var_lt_work_`i'=sd
drop sd
*
*

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year var* mean* log* educ* age* year_birth*


display `i'

saveold "\bonke_`i'_5years_unc_mini.dta", replace

restore

}
*

*concurrent
cls
clear
set more off

*
*set memory 16g
use "\Preliminars_Monthly_persnr", clear
ssc install fastgini

drop if empstate==4
*** Cross Sectional Gini on Long Term Earnings

*keep if female==0


sort persnr year month
forval i=1999(1)2010 {

preserve

bysort persnr year: g month_earnings=(exp(log_ave_wage))*30
bysort persnr year: egen earnings_year=total(month_earnings)
drop month_earnings

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*keep first observation by year for each person
bysort persnr year empstate: gen first=_n if empstate==5
keep if first==1

*to get observations by person from that year on and who this year have worked in category (full, part, mini)
qui gen begin_`i'=1 if year==`i' & empstate==5
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

qui ge var_lt_work_`i' = .
*

sort persnr year empstate
*they are deflated
bysort persnr: egen sum_earnings_long_term_work=total(earnings_year)
bysort persnr: gen sum_earnings_yearly_work=sum_earnings_long_term_work/5
qui gen log_sum_earnings_long_term_work=log(sum_earnings_long_term_work)
qui gen log_sum_earnings_yearly_work=log(sum_earnings_yearly_work)
by persnr: gen index_work=_n  if  empstate==5 & diff_year_g<6
*keep only the first observation where it is computed total earnings in 5 years:
keep if index_work == 1

*
qui egen mean_sum_earnings_long_term_work=mean(sum_earnings_long_term_work)
qui egen meanlog_earnings_long_term=mean(log_sum_earnings_long_term_work)
*
qui egen mean_sum_earnings_yearly_work=mean(sum_earnings_yearly_work)
qui egen meanlog_earnings_yearly=mean(log_sum_earnings_yearly_work)
egen sd=sd(log_sum_earnings_long_term_work)
replace var_lt_work_`i'=sd
drop sd
*
*

replace var_lt_work_`i'=var_lt_work_`i'^2


*** Keep

keep year var* mean* log* educ* age* year_birth*


display `i'

saveold "\bonke_`i'_5years_unc_cj.dta", replace

restore

}
*

*Graphs * Unconditional

use "\bonke_1999_5years_unc_full",clear
cd ""
sort year

rename var_lt_work_1999 var_lt_work_1999_full
rename meanlog_earnings_long_term meanlog_earnings_long_term_full
rename meanlog_earnings_yearly meanlog_earnings_yearly_full

forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_full"
replace var_lt_work_1999_full=var_lt_work_`i' if year==`i' 
replace meanlog_earnings_long_term_full=meanlog_earnings_long_term if year==`i'
replace meanlog_earnings_yearly_full=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' meanlog_earnings_long_term meanlog_earnings_yearly
}
*

append using "\bonke_1999_5years_unc_part"
rename var_lt_work_1999 var_lt_work_1999_part
rename meanlog_earnings_long_term meanlog_earnings_long_term_part
rename meanlog_earnings_yearly meanlog_earnings_yearly_part
forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_part"
replace var_lt_work_1999_part=var_lt_work_`i' if year==`i' 
replace meanlog_earnings_long_term_part=meanlog_earnings_long_term if year==`i'
replace meanlog_earnings_yearly_part=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' meanlog_earnings_long_term meanlog_earnings_yearly
}
*

append using "\bonke_1999_5years_unc_mini"
rename var_lt_work_1999 var_lt_work_1999_mini
rename meanlog_earnings_long_term meanlog_earnings_long_term_mini
rename meanlog_earnings_yearly meanlog_earnings_yearly_mini
forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_mini"
replace var_lt_work_1999_mini=var_lt_work_`i' if year==`i' 
replace meanlog_earnings_long_term_mini=meanlog_earnings_long_term if year==`i'
replace meanlog_earnings_yearly_mini=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' meanlog_earnings_long_term meanlog_earnings_yearly
}
*

append using "\bonke_1999_5years_unc_cj"
rename var_lt_work_1999 var_lt_work_1999_cj
rename meanlog_earnings_long_term meanlog_earnings_long_term_cj
rename meanlog_earnings_yearly meanlog_earnings_yearly_cj
forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_cj"
replace var_lt_work_1999_cj=var_lt_work_`i' if year==`i' 
replace meanlog_earnings_long_term_cj=meanlog_earnings_long_term if year==`i'
replace meanlog_earnings_yearly_cj=meanlog_earnings_yearly if year==`i'
drop var_lt_work_`i' meanlog_earnings_long_term meanlog_earnings_yearly
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

bysort year: egen mean_cj=mean(meanlog_earnings_long_term_cj)
replace meanlog_earnings_long_term_cj=mean_cj
drop mean_cj

bysort year: egen mean_full=mean(meanlog_earnings_yearly_full)
replace meanlog_earnings_yearly_full=mean_full
drop mean_full

bysort year: egen mean_part=mean(meanlog_earnings_yearly_part)
replace meanlog_earnings_yearly_part=mean_part
drop mean_part

bysort year: egen mean_mini=mean(meanlog_earnings_yearly_mini)
replace meanlog_earnings_yearly_mini=mean_mini
drop mean_mini

bysort year: egen mean_cj=mean(meanlog_earnings_yearly_cj)
replace meanlog_earnings_yearly_cj=mean_cj
drop mean_cj

bysort year: egen mean_var_full=mean(var_lt_work_1999_full)
replace var_lt_work_1999_full=mean_var_full
drop mean_var_full

bysort year: egen mean_var_part=mean(var_lt_work_1999_part)
replace var_lt_work_1999_part=mean_var_part
drop mean_var_part

bysort year: egen mean_var_mini=mean(var_lt_work_1999_mini)
replace var_lt_work_1999_mini=mean_var_mini
drop mean_var_mini

bysort year: egen mean_var_cj=mean(var_lt_work_1999_cj)
replace var_lt_work_1999_cj=mean_var_cj
drop mean_var_cj


*bysort year: gen counter=_n if gini_lt_work!=.
*keep if counter==1

label variable meanlog_earnings_long_term_full "Full Time"
label variable meanlog_earnings_long_term_part "Part Time"
label variable meanlog_earnings_long_term_mini "Marg. Employment"
label variable meanlog_earnings_long_term_cj "CJ"
label variable meanlog_earnings_yearly_full "Full Time"
label variable meanlog_earnings_yearly_part "Part Time"
label variable meanlog_earnings_yearly_mini "Marg. Employment"
label variable meanlog_earnings_yearly_cj "CJ"
label variable var_lt_work_1999_full "Full Time"
label variable var_lt_work_1999_part "Part Time"
label variable var_lt_work_1999_mini "Mini Jobs"
label variable var_lt_work_1999_cj "CJ"

***Gini Coefficients:

quietly twoway line meanlog_earnings_long_term_full meanlog_earnings_long_term_part meanlog_earnings_long_term_mini meanlog_earnings_long_term_cj year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc.png, replace

quietly twoway line meanlog_earnings_yearly_full meanlog_earnings_yearly_part meanlog_earnings_yearly_mini meanlog_earnings_yearly_cj year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc.png, replace

quietly twoway line var_lt_work_1999_full var_lt_work_1999_part var_lt_work_1999_mini var_lt_work_1999_cj year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.2 (0.02) 0.3, labsize(large) angle(horizontal))
graph export var_work_1999_5years_unc.png, replace
*

quietly twoway line meanlog_earnings_long_term_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc_full.png, replace
quietly twoway line meanlog_earnings_long_term_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc_part.png, replace
quietly twoway line meanlog_earnings_long_term_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc_mini.png, replace
quietly twoway line meanlog_earnings_long_term_cj year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5years_unc_cj.png, replace

quietly twoway line meanlog_earnings_yearly_full year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc_full.png, replace
quietly twoway line meanlog_earnings_yearly_part year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(red green brown magenta gold purple) lpattern(dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc_part.png, replace
quietly twoway line meanlog_earnings_yearly_mini year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc_mini.png, replace
quietly twoway line meanlog_earnings_yearly_cj year, ytitle({bf:E[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(green brown magenta gold purple) lpattern(shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export mean_work_1999_5yearly_unc_cj.png, replace
*

*
***
*26) Fraction of Days in a 5-Year Period

*** Shares of Full Part Mini 5 years ahead:

 cls
 set more off

*** Unconditional Shares

use "\bonke_1999_5years_unc_full_shares",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_full_shares"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_full_shares_days.png, replace

use "\bonke_1999_5years_unc_part_shares",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_part_shares"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_part_shares_days.png, replace


use "\bonke_1999_5years_unc_mini_shares",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_unc_mini_shares"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_unc_mini_shares_days.png, replace


*** Female Shares

use "\bonke_1999_5years_female_full_shares",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_female_full_shares"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_full_shares_days.png, replace

use "\bonke_1999_5years_female_part_shares",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_female_part_shares"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_part_shares_days.png, replace


use "\bonke_1999_5years_female_mini_shares",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_female_mini_shares"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_female_mini_shares_days.png, replace


*** Male Shares

use "\bonke_1999_5years_male_full_shares",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_male_full_shares"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_full_shares_days.png, replace

use "\bonke_1999_5years_male_part_shares",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_male_part_shares"
}
*

graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_part_shares_days.png, replace


use "\bonke_1999_5years_male_mini_shares",clear
cd ""
sort year

forval i=2000/2010 {
append using "\bonke_`i'_5years_male_mini_shares"
}
*
graph bar (mean) share_full_days share_part_days share_mini_days, over(year, label(labsize(large) angle(45))) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(1)) graphregion(color(white)) stack  legend( label(1 "Full Time") label(2 "Part Time") label(3 "Marg. Employment") ) exclude0 yla(0(0.1)1, labsize(large))
graph export mean_5years_male_mini_shares_days.png, replace

*

*27)

*Kernel Densities Male/Female

**CS Wage:

cls
set more off

use "\Preliminars_monthly",clear
cd ""

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if empstate==4

sort persnr year month

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year empstate: egen earnings_year=total(earnings)
g log_earnings_year=log(earnings_year)
qui gen log_earnings_year_full=log(earnings_year) if empstate==1
qui gen log_earnings_year_part=log(earnings_year) if empstate==2
qui gen log_earnings_year_mini=log(earnings_year) if empstate==3
drop earnings

***kdens of wages:

qui gen log_daily_wage=log_ave_wage
qui gen log_daily_wage_full=log_ave_wage if empstate==1
qui gen log_daily_wage_part=log_ave_wage if empstate==2
qui gen log_daily_wage_mini=log_ave_wage if empstate==3

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
by persnr: gen index_work=_n  if  diff_year_g<6
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
qui gen begin_`i'=1 if year==`i' & empstate==1
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
by persnr: gen index_work=_n  if  diff_year_g<6
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
qui gen begin_`i'=1 if year==`i' & empstate==2
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
by persnr: gen index_work=_n  if  diff_year_g<6
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
qui gen begin_`i'=1 if year==`i' & empstate==3
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
by persnr: gen index_work=_n  if  diff_year_g<6
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

***

*/

/*
*1) Fig1 Bonke:

*a) Males

cls
ssc install fastgini
set more off
use "\Preliminars_Monthly_persnr.dta", replace
cd ""

drop if empstate==4
drop if female==1

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

*year earnings kept
bysort persnr year: gen first=_n
keep if first==1
bysort persnr: egen tot_years=total(first)
keep if tot_years>4
drop first

bysort persnr: g counter_years=_n
bysort persnr: g years_left=tot_years-counter_years

sort persnr year

by persnr: gen five_year_earnings=earnings_year+earnings_year[_n+1]+earnings_year[_n+2]+earnings_year[_n+3]+earnings_year[_n+4] if years_left>=4

g five_year_gini_25=.
g five_year_gini_35=.
g five_year_gini_45=.

g cs_gini=.

forval i=1999/2014 {
fastgini earnings_year if year==`i'
replace cs_gini=r(gini) if year==`i'
}
forval i=1999/2010 {
fastgini five_year_earnings if year==`i' & age==25
replace five_year_gini_25=r(gini) if year==`i' & age==25
fastgini five_year_earnings if year==`i' & age==35
replace five_year_gini_35=r(gini) if year==`i' & age==35
fastgini five_year_earnings if year==`i' & age==45
replace five_year_gini_45=r(gini) if year==`i' & age==45
}
sort year cs_gini five_year_gini_25 five_year_gini_35 five_year_gini_45

label variable cs_gini "Yearly Cross-Section"
label variable five_year_gini_25 "5-Year Earnings (Age 25)"
label variable five_year_gini_35 "5-Year Earnings (Age 35)"
label variable five_year_gini_45 "5-Year Earnings (Age 45)"
*
quietly twoway (connected cs_gini year, lcolor(blue) lwidth(medthick) lpattern(solid) msymbol(O) mcolor(blue blue)) (line five_year_gini_45 year,lwidth(medthick) lcolor(blue) lpattern(dash) connect(l)), ytitle({bf: Gini}, size(large) height(10)) legend(position(6) rows(2)) xtitle({bf:Year}, size(large) height(7)) xlabel(1999 (2) 2014, labsize(large) angle(45)) ylabel(, format(%3.2f) labsize(large) angle(horizontal)) xline(1999 (1) 2014, lstyle(grid)) yline(0.25 (0.05) 0.45, lstyle(grid)) ylabel(0.25 (0.05) 0.45, labsize(large) angle(horizontal)) graphregion(color(white)) graphregion(color(white))
graph export gini_males.png, replace


label variable cs_gini "Cross-Section Male"

quietly twoway line five_year_gini_25 five_year_gini_35 five_year_gini_45 year, ytitle({bf: Gini}, size(large) height(10)) legend(position(6) rows(2)) lpattern(solid) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) ylabel(, labsize(large) angle(horizontal)) xline(1999 (1) 2014, lstyle(grid)) ylabel(0.3 (0.05) 0.5, labsize(large) angle(horizontal))


save gini_males.dta, replace
*


*b) Females

cls
ssc install fastgini
set more off
use "\Preliminars_Monthly_persnr.dta", replace
cd ""

drop if empstate==4
drop if female==0

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

*year earnings kept
bysort persnr year: gen first=_n
keep if first==1
bysort persnr: egen tot_years=total(first)
keep if tot_years>4
drop first

bysort persnr: g counter_years=_n
bysort persnr: g years_left=tot_years-counter_years

sort persnr year

by persnr: gen five_year_earnings=earnings_year+earnings_year[_n+1]+earnings_year[_n+2]+earnings_year[_n+3]+earnings_year[_n+4] if years_left>=4

g five_year_gini_25_fem=.
g five_year_gini_35_fem=.
g five_year_gini_45_fem=.
g five_year_gini_30_fem=.
g five_year_gini_40_fem=.
g five_year_gini_50_fem=.

g cs_gini_fem=.

forval i=1999/2014 {
fastgini earnings_year if year==`i'
replace cs_gini_fem=r(gini) if year==`i'
}
forval i=1999/2010 {
fastgini five_year_earnings if year==`i' & age==25
replace five_year_gini_25_fem=r(gini) if year==`i' & age==25
fastgini five_year_earnings if year==`i' & age==35
replace five_year_gini_35_fem=r(gini) if year==`i' & age==35
fastgini five_year_earnings if year==`i' & age==45
replace five_year_gini_45_fem=r(gini) if year==`i' & age==45
fastgini five_year_earnings if year==`i' & age==30
replace five_year_gini_30_fem=r(gini) if year==`i' & age==30
fastgini five_year_earnings if year==`i' & age==40
replace five_year_gini_40_fem=r(gini) if year==`i' & age==40
fastgini five_year_earnings if year==`i' & age==50
replace five_year_gini_50_fem=r(gini) if year==`i' & age==50
}
sort year cs_gini_fem five_year_gini_25_fem five_year_gini_35_fem five_year_gini_45_fem

label variable cs_gini_fem "Yearly Cross-Section"
label variable five_year_gini_25_fem "5-Year Earnings (Age 25)"
label variable five_year_gini_35_fem "5-Year Earnings (Age 35)"
label variable five_year_gini_45_fem "5-Year Earnings (Age 45)"
label variable five_year_gini_30_fem "5-Year Earnings (Age 30)"
label variable five_year_gini_40_fem "5-Year Earnings (Age 40)"
label variable five_year_gini_50_fem "5-Year Earnings (Age 50)"
*
quietly twoway (connected cs_gini year, lcolor(red) lwidth(medthick) lpattern(solid) msymbol(O) mcolor(red)) (line five_year_gini_45 year,lwidth(medthick) lcolor(red) lpattern(dash) connect(l)), ytitle({bf: Gini}, size(large) height(10)) legend(position(6) rows(2)) xtitle({bf:Year}, size(large) height(7)) xlabel(1999 (2) 2014, labsize(large) angle(45)) ylabel(, format(%3.2f) labsize(large) angle(horizontal)) xline(1999 (1) 2014, lstyle(grid)) yline(0.25 (0.05) 0.45, lstyle(grid)) ylabel(0.25 (0.05) 0.45, labsize(large) angle(horizontal)) graphregion(color(white)) graphregion(color(white))
graph export gini_females.png, replace

label variable cs_gini_fem "Cross-Section Fem."

quietly twoway line cs_gini_fem five_year_gini_25_fem five_year_gini_35_fem five_year_gini_45_fem year, ytitle({bf: Gini}, size(large) height(10)) legend(position(6) rows(2)) lpattern(solid) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) ylabel(, labsize(large) angle(horizontal)) xline(1999 (1) 2014, lstyle(grid)) ylabel(0.25 (0.05) 0.45, labsize(large) angle(horizontal))


quietly twoway line five_year_gini_25_fem five_year_gini_30_fem five_year_gini_35_fem five_year_gini_40_fem five_year_gini_45_fem five_year_gini_50_fem year, ytitle({bf: Gini}, size(large) height(10)) legend(position(6) rows(2)) lpattern(solid) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) ylabel(, labsize(large) angle(horizontal)) xline(1999 (1) 2014, lstyle(grid)) ylabel(0.3 (0.05) 0.5, labsize(large) angle(horizontal))


save gini_females.dta,replace

append using gini_males.dta

quietly twoway (connected cs_gini year, lcolor(blue) lwidth(medthick) lpattern(solid) msymbol(O) mcolor(blue blue)) (line five_year_gini_45 year,lwidth(medthick) lcolor(blue) lpattern(dash) connect(l)), ytitle({bf: Gini}, size(large) height(10)) legend(position(6) rows(2)) xtitle({bf:Year}, size(large) height(7)) xlabel(1999 (2) 2014, labsize(large) angle(45)) ylabel(, format(%3.2f) labsize(large) angle(horizontal)) xline(1999 (1) 2014, lstyle(grid)) yline(0.25 (0.05) 0.45, lstyle(grid)) ylabel(0.25 (0.05) 0.45, labsize(large) angle(horizontal)) graphregion(color(white)) graphregion(color(white))
graph export gini.png, replace

*quietly twoway (line cs_gini five_year_gini_45 year if female==0) (line cs_gini five_year_gini_45 year if female==1), ytitle({bf: Gini}, size(large) height(10)) legend(position(6) rows(2)) lpattern(solid solid solid solid) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) ylabel(, labsize(large) angle(horizontal)) xline(1999 (1) 2014, lstyle(grid)) ylabel(0.25 (0.05) 0.45, labsize(large) angle(horizontal))

*

clear
cls
set more off
cd ""
*
input double year
1999
2000
2001
2002
2003
2004
2005
2006
2007
2008
2009
2010
2011
2012
2013
2014
end
*
g reforms=.
*xline(2003, lpattern(solid) lcolor(red) lwidth(medthick)) xline(2004, lpattern(dash) lcolor(brown) lwidth(medthick)) xline(2005, lpattern(shortdash_dot) lcolor(orange) lwidth(medthick))
*
tw (line reforms year) (pcarrowi 0 2003 1 2003, lpattern(solid) lcolor(red) lwidth(medthick) msize(zero)) (pcarrowi 0 2004 1 2004, lpattern(dash) lcolor(brown) lwidth(medthick) msize(zero)) (pcarrowi 0 2005 1 2005, lpattern(dot) lcolor(orange) lwidth(medthick) msize(zero)), legend(position(3) col(1) order(2 "Hartz I-II" 3 "Hartz III" 4 "Hartz IV")) xtitle({bf:Year}, size(large) height(7)) xlabel(1999 2003 2004 2005 2009 2014, angle(45)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(,nolabels notick)
graph export reforms.png, replace

*caca

*sysuse auto, clear

*tw (kdensity mpg) (pcarrowi 0 16.1 .08 16.1, msize(zero)) (pcarrowi 0 22.22 0.08 22.22, lpattern(dash) msize(zero)) (pcarrowi 0 28.33 .08 28.33, lpattern(dash_dot_dot) msize(zero)),legend(order(1 "mpg density" 2 "16.1" 3 "22.22" 4 "28.33"))
*******
*/

/*
*14) Employment Stocks
cls
set more off
use "\Preliminars_Monthly_persnr.dta", clear
cd ""

*bysort year: gen count_year=_n
*keep if count_year==1
drop if female==1

sort persnr year month
gen FT=0
gen PT=0
gen MJ=0
gen NE=0
gen CJ=0

bysort persnr: replace FT=1 if empstate==1
bysort persnr: replace PT=1 if empstate==2
bysort persnr: replace MJ=1 if empstate==3
bysort persnr: replace NE=1 if empstate==4
bysort persnr: replace CJ=1 if empstate==5

bysort year month: egen stock_FT=total(FT)
bysort year month: egen stock_PT=total(PT)
bysort year month: egen stock_MJ=total(MJ)
bysort year month: egen stock_NE=total(NE)
bysort year month: egen stock_CJ=total(CJ)

bysort year month: gen stock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_NE_share=stock_NE/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)

bysort year month: gen tstock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)

***this is the aggregation part:

sort year month

bysort year: egen ave_tstock_FT_share=mean(tstock_FT_share)
bysort year: egen ave_tstock_PT_share=mean(tstock_PT_share)
bysort year: egen ave_tstock_MJ_share=mean(tstock_MJ_share)
bysort year: egen ave_tstock_CJ_share=mean(tstock_CJ_share)

bysort year: egen ave_stock_FT_share=mean(stock_FT_share)
bysort year: egen ave_stock_PT_share=mean(stock_PT_share)
bysort year: egen ave_stock_MJ_share=mean(stock_MJ_share)
bysort year: egen ave_stock_NE_share=mean(stock_NE_share)
bysort year: egen ave_stock_CJ_share=mean(stock_CJ_share)

bysort year: g counter=_n
keep if counter==1

*

label variable ave_tstock_FT_share "Male"
label variable ave_tstock_PT_share "Male"
label variable ave_tstock_MJ_share "Male"
label variable ave_tstock_CJ_share "Male"

label variable ave_stock_FT_share "FT"
label variable ave_stock_PT_share "PT"
label variable ave_stock_MJ_share "MJ"
label variable ave_stock_NE_share "NE"
label variable ave_stock_CJ_share "CJ"



quietly twoway line ave_tstock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.8 (0.04) 1, labsize(large) angle(horizontal))
graph export tstock_FT_male.png, replace

quietly twoway line ave_tstock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_PT_male.png, replace

quietly twoway line ave_tstock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_MJ_male.png, replace

quietly twoway line ave_tstock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_CJ_male.png, replace

*

quietly twoway line ave_stock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.05) 0.9, labsize(large) angle(horizontal))
graph export stock_FT_male.png, replace

quietly twoway line ave_stock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.1 (0.02) 0.2, labsize(large) angle(horizontal))
graph export stock_PT_male.png, replace

quietly twoway line ave_stock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_MJ_male.png, replace

quietly twoway line ave_stock_NE_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_NE_male.png, replace

quietly twoway line ave_stock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_CJ_male.png, replace

save stocks_male.dta,replace

*
cls
set more off
use "\Preliminars_Monthly_persnr.dta", clear
cd ""

*bysort year: gen count_year=_n
*keep if count_year==1
drop if female==0

sort persnr year month
gen FT=0
gen PT=0
gen MJ=0
gen NE=0
gen CJ=0

bysort persnr: replace FT=1 if empstate==1
bysort persnr: replace PT=1 if empstate==2
bysort persnr: replace MJ=1 if empstate==3
bysort persnr: replace NE=1 if empstate==4
bysort persnr: replace CJ=1 if empstate==5

bysort year month: egen stock_FT=total(FT)
bysort year month: egen stock_PT=total(PT)
bysort year month: egen stock_MJ=total(MJ)
bysort year month: egen stock_NE=total(NE)
bysort year month: egen stock_CJ=total(CJ)

bysort year month: gen stock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_NE_share=stock_NE/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)

bysort year month: gen tstock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)

***this is the aggregation part:

sort year month

bysort year: egen ave_tstock_FT_share_fem=mean(tstock_FT_share)
bysort year: egen ave_tstock_PT_share_fem=mean(tstock_PT_share)
bysort year: egen ave_tstock_MJ_share_fem=mean(tstock_MJ_share)
bysort year: egen ave_tstock_CJ_share_fem=mean(tstock_CJ_share)

bysort year: egen ave_stock_FT_share_fem=mean(stock_FT_share)
bysort year: egen ave_stock_PT_share_fem=mean(stock_PT_share)
bysort year: egen ave_stock_MJ_share_fem=mean(stock_MJ_share)
bysort year: egen ave_stock_NE_share_fem=mean(stock_NE_share)
bysort year: egen ave_stock_CJ_share_fem=mean(stock_CJ_share)

bysort year: g counter=_n
keep if counter==1

*

label variable ave_tstock_FT_share_fem "Female"
label variable ave_tstock_PT_share_fem "Female"
label variable ave_tstock_MJ_share_fem "Female"
label variable ave_tstock_CJ_share_fem "Female"

label variable ave_stock_FT_share_fem "FT"
label variable ave_stock_PT_share_fem "PT"
label variable ave_stock_MJ_share_fem "MJ"
label variable ave_stock_NE_share_fem "NE"
label variable ave_stock_CJ_share_fem "CJ"

append using stocks_male.dta



quietly twoway line ave_tstock_FT_share ave_tstock_FT_share_fem year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.5 (0.1) 1 ,format(%3.2f) labsize(large) angle(horizontal)) xline(2003 2005, lcolor(blue) lpattern(dash_dot))
graph export tstock_FT.png, replace

quietly twoway line ave_tstock_PT_share ave_tstock_PT_share_fem year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.05) 0.3 ,format(%3.2f) labsize(large) angle(horizontal)) xline(2003 2005, lcolor(blue) lpattern(dash_dot))
graph export tstock_PT.png, replace

quietly twoway line ave_tstock_MJ_share ave_tstock_MJ_share_fem year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.04) 0.2 ,format(%3.2f) labsize(large) angle(horizontal)) xline(2003 2005, lcolor(blue) lpattern(dash_dot))
graph export tstock_MJ.png, replace

quietly twoway line ave_tstock_CJ_share ave_tstock_CJ_share_fem year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1 ,format(%3.2f) labsize(large) angle(horizontal)) xline(2003 2005, lcolor(blue) lpattern(dash_dot))
graph export tstock_CJ.png, replace

/*
quietly twoway line ave_tstock_FT_share ave_tstock_FT_share_fem year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.05) 0.9, labsize(large) angle(horizontal))
graph export stock_FT_male.png, replace

quietly twoway line ave_tstock_PT_share ave_tstock_PT_share_fem year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.1 (0.02) 0.2, labsize(large) angle(horizontal))
graph export stock_PT_male.png, replace

quietly twoway line ave_tstock_MJ_share ave_tstock_MJ_share_fem year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_MJ_male.png, replace

quietly twoway line ave_tstock_NE_share ave_tstock_NE_share_fem year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_NE_male.png, replace

quietly twoway line ave_tstock_CJ_share ave_tstock_CJ_share_fem year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export stock_CJ_male.png, replace
*/
*

/*
*Long Term Earnings, West Germany Full Time + Part Time:

*1) Fig1 Bonke:

*a) Males

cls
ssc install fastgini
set more off
use "\Preliminars_Monthly_persnr_West_AllYears.dta", replace
cd ""

*drop if empstate==4
drop if female==1

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

*year earnings kept
bysort persnr year: gen first=_n
keep if first==1
bysort persnr: egen tot_years=total(first)
keep if tot_years>4
drop first

bysort persnr: g counter_years=_n
bysort persnr: g years_left=tot_years-counter_years

sort persnr year

by persnr: gen five_year_earnings=earnings_year+earnings_year[_n+1]+earnings_year[_n+2]+earnings_year[_n+3]+earnings_year[_n+4] if years_left>=4

g five_year_gini_25=.
g five_year_gini_35=.
g five_year_gini_45=.

g cs_gini=.

forval i=1975/2014 {
fastgini earnings_year if year==`i'
replace cs_gini=r(gini) if year==`i'
}
forval i=1975/2010 {
fastgini five_year_earnings if year==`i' & age==25
replace five_year_gini_25=r(gini) if year==`i' & age==25
fastgini five_year_earnings if year==`i' & age==35
replace five_year_gini_35=r(gini) if year==`i' & age==35
fastgini five_year_earnings if year==`i' & age==45
replace five_year_gini_45=r(gini) if year==`i' & age==45
}
sort year cs_gini five_year_gini_25 five_year_gini_35 five_year_gini_45

label variable cs_gini "Yearly Cross-Section"
label variable five_year_gini_25 "5-Year Earnings (Age 25)"
label variable five_year_gini_35 "5-Year Earnings (Age 35)"
label variable five_year_gini_45 "5-Year Earnings (Age 45)"
*
quietly twoway connected cs_gini five_year_gini_45 year, ytitle({bf: Gini}, size(large) height(10)) legend(position(6) rows(2)) msymbol(O O) mcolor(blue blue) connect(l) lwidth(medthick medthick) lcolor(blue blue) lpattern(solid dash) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large) angle(45)) ylabel(, labsize(large) angle(horizontal)) xline(1975 (5) 2014, lstyle(grid)) ylabel(0.25 (0.05) 0.45, labsize(large) angle(horizontal)) graphregion(color(white)) graphregion(color(white))
graph export gini_males_West_AllYears.png, replace

label variable cs_gini "Cross-Section Male"

quietly twoway line five_year_gini_25 five_year_gini_35 five_year_gini_45 year, ytitle({bf: Gini}, size(large) height(10)) legend(position(6) rows(2)) lpattern(solid) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large) angle(45)) ylabel(, labsize(large) angle(horizontal)) xline(1975 (5) 2014, lstyle(grid)) ylabel(0.3 (0.05) 0.5, labsize(large) angle(horizontal))


save gini_males_West_AllYears.dta, replace
*


*b) Females

cls
ssc install fastgini
set more off
use "\Preliminars_Monthly_persnr_West_AllYears.dta", replace
cd ""

*drop if empstate==4
drop if female==0

gen ave_wage=exp(log_ave_wage)

gen earnings=ave_wage*30
drop ave_wage

bysort persnr year: egen earnings_year=total(earnings)
drop earnings

*year earnings kept
bysort persnr year: gen first=_n
keep if first==1
bysort persnr: egen tot_years=total(first)
keep if tot_years>4
drop first

bysort persnr: g counter_years=_n
bysort persnr: g years_left=tot_years-counter_years

sort persnr year

by persnr: gen five_year_earnings=earnings_year+earnings_year[_n+1]+earnings_year[_n+2]+earnings_year[_n+3]+earnings_year[_n+4] if years_left>=4

g five_year_gini_25_fem=.
g five_year_gini_35_fem=.
g five_year_gini_45_fem=.
g five_year_gini_30_fem=.
g five_year_gini_40_fem=.
g five_year_gini_50_fem=.

g cs_gini_fem=.

forval i=1975/2014 {
fastgini earnings_year if year==`i'
replace cs_gini_fem=r(gini) if year==`i'
}
forval i=1975/2010 {
fastgini five_year_earnings if year==`i' & age==25
replace five_year_gini_25_fem=r(gini) if year==`i' & age==25
fastgini five_year_earnings if year==`i' & age==35
replace five_year_gini_35_fem=r(gini) if year==`i' & age==35
fastgini five_year_earnings if year==`i' & age==45
replace five_year_gini_45_fem=r(gini) if year==`i' & age==45
fastgini five_year_earnings if year==`i' & age==30
replace five_year_gini_30_fem=r(gini) if year==`i' & age==30
fastgini five_year_earnings if year==`i' & age==40
replace five_year_gini_40_fem=r(gini) if year==`i' & age==40
fastgini five_year_earnings if year==`i' & age==50
replace five_year_gini_50_fem=r(gini) if year==`i' & age==50
}
sort year cs_gini_fem five_year_gini_25_fem five_year_gini_35_fem five_year_gini_45_fem

label variable cs_gini_fem "Yearly Cross-Section"
label variable five_year_gini_25_fem "5-Year Earnings (Age 25)"
label variable five_year_gini_35_fem "5-Year Earnings (Age 35)"
label variable five_year_gini_45_fem "5-Year Earnings (Age 45)"
label variable five_year_gini_30_fem "5-Year Earnings (Age 30)"
label variable five_year_gini_40_fem "5-Year Earnings (Age 40)"
label variable five_year_gini_50_fem "5-Year Earnings (Age 50)"
*
quietly twoway connected cs_gini_fem five_year_gini_45_fem year, ytitle({bf: Gini}, size(large) height(10)) legend(position(6) rows(2)) msymbol(O O) mcolor(red red) connect(l) lwidth(medthick medthick) lcolor(red red) lpattern(solid dash) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large) angle(45)) ylabel(, labsize(large) angle(horizontal)) xline(1975 (5) 2014, lstyle(grid)) ylabel(0.3 (0.05) 0.5, labsize(large) angle(horizontal)) graphregion(color(white))
graph export gini_females_West_AllYears.png, replace

label variable cs_gini_fem "Cross-Section Fem."

quietly twoway line cs_gini_fem five_year_gini_25_fem five_year_gini_35_fem five_year_gini_45_fem year, ytitle({bf: Gini}, size(large) height(10)) legend(position(6) rows(2)) lpattern(solid) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large) angle(45)) ylabel(, labsize(large) angle(horizontal)) xline(1975 (5) 2014, lstyle(grid)) ylabel(0.25 (0.05) 0.45, labsize(large) angle(horizontal))


quietly twoway line five_year_gini_25_fem five_year_gini_30_fem five_year_gini_35_fem five_year_gini_40_fem five_year_gini_45_fem five_year_gini_50_fem year, ytitle({bf: Gini}, size(large) height(10)) legend(position(6) rows(2)) lpattern(solid) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large) angle(45)) ylabel(, labsize(large) angle(horizontal)) xline(1975 (5) 2014, lstyle(grid)) ylabel(0.3 (0.05) 0.5, labsize(large) angle(horizontal))


save gini_females_West_AllYears.dta,replace

append using gini_males_West_AllYears.dta

quietly twoway (connected cs_gini year if female==0, msymbol(O) mcolor(blue) connect(l) lwidth(medthick) lcolor(blue) lpattern(solid)) (line five_year_gini_45 year if female==0, msymbol(O) mcolor(blue) connect(l) lwidth(medthick) lcolor(blue) lpattern(dash)) (connected cs_gini_fem year if female==1, msymbol(T) mcolor(red) lcolor(red) lwidth(medthick) lpattern(solid) connect(l)) (line five_year_gini_45_fem year if female==1, msymbol(T) mcolor(red) lcolor(red) lwidth(medthick) lpattern(dash) connect(l)), ytitle({bf: Gini}, size(large) height(10)) legend(position(6) rows(2)) xtitle({bf:Year}, size(large) height(7)) xlabel(1975 (5) 2014, labsize(large) angle(45)) ylabel(, format(%3.2f) labsize(large) angle(horizontal)) xline(1975 (5) 2014, lstyle(grid)) ylabel(0.15 (0.05) 0.45, labsize(large) angle(horizontal)) graphregion(color(white))
graph export gini_West_AllYears.png, replace
*/

*graphs Card Figure I:
*/
cls
set more off
use "\Preliminars",clear
cd ""
sort year

*only full time
drop if female==1
drop if source!=1
drop if form!=1
drop if west==0
drop if year<1999
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
bysort persnr year ind_primary: gen ind=_n if ind_primary==1
keep if ind==1
*gen Log Deviations by year:
gen p85_full=.
gen p50_full=.
gen p15_full=.
levels year, local(reg)
gen log_def_daily_wage=log(def_daily_wage)
foreach r of local reg {
egen p85 = pctile(log_def_daily_wage) if year == `r', p(85)
egen p50 = pctile(log_def_daily_wage) if year == `r', p(50)
egen p15 = pctile(log_def_daily_wage) if year == `r', p(15)
replace p85_full=p85 if year == `r'
replace p15_full=p15 if year == `r'
replace p50_full=p50 if year == `r'
drop p85 p15 p50
}
*gen deviations with respect to 1999
tabstat p85_full p50_full p15_full, by(year) stats(mean n)
*
sum p85_full if year==1999
gen dev_p85=(p85_full-r(mean))*100
*
sum p15_full if year==1999
gen dev_p15=(p15_full-r(mean))*100
*
sum p50_full if year==1999
gen dev_p50=(p50_full-r(mean))*100
*
label variable dev_p85 "P85"
label variable dev_p50 "P50"
label variable dev_p15 "P15"
*
sort year
*
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal)) xline(2003 2005, lcolor(red) lpattern(dash_dot))
*quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal))
graph export dev_perc_full.png, replace

*Part Time
cls
set more off
use "\Preliminars",clear
cd ""
sort year

*only full time
drop if female==1
drop if source!=1
drop if form!=2
drop if west==0
drop if year<1999
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
bysort persnr year ind_primary: gen ind=_n if ind_primary==1
keep if ind==1
*gen Log Deviations by year:
gen p85_part=.
gen p50_part=.
gen p15_part=.
levels year, local(reg)
gen log_def_daily_wage=log(def_daily_wage)
foreach r of local reg {
egen p85 = pctile(log_def_daily_wage) if year == `r', p(85)
egen p50 = pctile(log_def_daily_wage) if year == `r', p(50)
egen p15 = pctile(log_def_daily_wage) if year == `r', p(15)
replace p85_part=p85 if year == `r'
replace p15_part=p15 if year == `r'
replace p50_part=p50 if year == `r'
drop p85 p15 p50
}
*gen deviations with respect to 1999
tabstat p85_part p50_part p15_part, by(year) stats(mean n)
*
sum p85_part if year==1999
gen dev_p85=(p85_part-r(mean))*100
*
sum p15_part if year==1999
gen dev_p15=(p15_part-r(mean))*100
*
sum p50_part if year==1999
gen dev_p50=(p50_part-r(mean))*100
*
label variable dev_p85 "P85"
label variable dev_p50 "P50"
label variable dev_p15 "P15"
*
sort year
*
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal)) xline(2003 2005, lcolor(red) lpattern(dash_dot))
*quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal))
graph export dev_perc_part.png, replace

*Mg
cls
set more off
use "\Preliminars",clear
cd ""
sort year

*only full time
drop if female==1
drop if source!=1
drop if form!=3
drop if west==0
drop if year<1999
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
bysort persnr year ind_primary: gen ind=_n if ind_primary==1
keep if ind==1
*gen Log Deviations by year:
gen p85_mg=.
gen p50_mg=.
gen p15_mg=.
levels year, local(reg)
gen log_def_daily_wage=log(def_daily_wage)
foreach r of local reg {
egen p85 = pctile(log_def_daily_wage) if year == `r', p(85)
egen p50 = pctile(log_def_daily_wage) if year == `r', p(50)
egen p15 = pctile(log_def_daily_wage) if year == `r', p(15)
replace p85_mg=p85 if year == `r'
replace p15_mg=p15 if year == `r'
replace p50_mg=p50 if year == `r'
drop p85 p15 p50
}
*gen deviations with respect to 1999
tabstat p85_mg p50_mg p15_mg, by(year) stats(mean n)
*
sum p85_mg if year==1999
gen dev_p85=(p85_mg-r(mean))*100
*
sum p15_mg if year==1999
gen dev_p15=(p15_mg-r(mean))*100
*
sum p50_mg if year==1999
gen dev_p50=(p50_mg-r(mean))*100
*
label variable dev_p85 "P85"
label variable dev_p50 "P50"
label variable dev_p15 "P15"
*
sort year
*
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal)) xline(2003 2005, lcolor(red) lpattern(dash_dot))
*quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal))
graph export dev_perc_mg.png, replace


*** Females:

use "\Preliminars",clear
cd ""
sort year

*only full time
drop if female==0
drop if source!=1
drop if form!=1
drop if west==0
drop if year<1999
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
bysort persnr year ind_primary: gen ind=_n if ind_primary==1
keep if ind==1
*gen Log Deviations by year:
gen p85_full=.
gen p50_full=.
gen p15_full=.
levels year, local(reg)
gen log_def_daily_wage=log(def_daily_wage)
foreach r of local reg {
egen p85 = pctile(log_def_daily_wage) if year == `r', p(85)
egen p50 = pctile(log_def_daily_wage) if year == `r', p(50)
egen p15 = pctile(log_def_daily_wage) if year == `r', p(15)
replace p85_full=p85 if year == `r'
replace p15_full=p15 if year == `r'
replace p50_full=p50 if year == `r'
drop p85 p15 p50
}
*gen deviations with respect to 1999
tabstat p85_full p50_full p15_full, by(year) stats(mean n)
*
sum p85_full if year==1999
gen dev_p85=(p85_full-r(mean))*100
*
sum p15_full if year==1999
gen dev_p15=(p15_full-r(mean))*100
*
sum p50_full if year==1999
gen dev_p50=(p50_full-r(mean))*100
*
label variable dev_p85 "P85"
label variable dev_p50 "P50"
label variable dev_p15 "P15"
*
sort year
*
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal)) xline(2003 2005, lcolor(red) lpattern(dash_dot))
*quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal))
graph export dev_perc_full_fem.png, replace


*Part Time
cls
set more off
use "\Preliminars",clear
cd ""
sort year

*only full time
drop if female==0
drop if source!=1
drop if form!=2
drop if west==0
drop if year<1999
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
bysort persnr year ind_primary: gen ind=_n if ind_primary==1
keep if ind==1
*gen Log Deviations by year:
gen p85_part=.
gen p50_part=.
gen p15_part=.
levels year, local(reg)
gen log_def_daily_wage=log(def_daily_wage)
foreach r of local reg {
egen p85 = pctile(log_def_daily_wage) if year == `r', p(85)
egen p50 = pctile(log_def_daily_wage) if year == `r', p(50)
egen p15 = pctile(log_def_daily_wage) if year == `r', p(15)
replace p85_part=p85 if year == `r'
replace p15_part=p15 if year == `r'
replace p50_part=p50 if year == `r'
drop p85 p15 p50
}
*gen deviations with respect to 1999
tabstat p85_part p50_part p15_part, by(year) stats(mean n)
*
sum p85_part if year==1999
gen dev_p85=(p85_part-r(mean))*100
*
sum p15_part if year==1999
gen dev_p15=(p15_part-r(mean))*100
*
sum p50_part if year==1999
gen dev_p50=(p50_part-r(mean))*100
*
label variable dev_p85 "P85"
label variable dev_p50 "P50"
label variable dev_p15 "P15"
*
sort year
*
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal)) xline(2003 2005, lcolor(red) lpattern(dash_dot))
*quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal))
graph export dev_perc_part_fem.png, replace

*Mg
cls
set more off
use "\Preliminars",clear
cd ""
sort year

*only full time
drop if female==0
drop if source!=1
drop if form!=3
drop if west==0
drop if year<1999
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
bysort persnr year ind_primary: gen ind=_n if ind_primary==1
keep if ind==1
*gen Log Deviations by year:
gen p85_mg=.
gen p50_mg=.
gen p15_mg=.
levels year, local(reg)
gen log_def_daily_wage=log(def_daily_wage)
foreach r of local reg {
egen p85 = pctile(log_def_daily_wage) if year == `r', p(85)
egen p50 = pctile(log_def_daily_wage) if year == `r', p(50)
egen p15 = pctile(log_def_daily_wage) if year == `r', p(15)
replace p85_mg=p85 if year == `r'
replace p15_mg=p15 if year == `r'
replace p50_mg=p50 if year == `r'
drop p85 p15 p50
}
*gen deviations with respect to 1999
tabstat p85_mg p50_mg p15_mg, by(year) stats(mean n)
*
sum p85_mg if year==1999
gen dev_p85=(p85_mg-r(mean))*100
*
sum p15_mg if year==1999
gen dev_p15=(p15_mg-r(mean))*100
*
sum p50_mg if year==1999
gen dev_p50=(p50_mg-r(mean))*100
*
label variable dev_p85 "P85"
label variable dev_p50 "P50"
label variable dev_p15 "P15"
*
sort year
*
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal)) xline(2003 2005, lcolor(red) lpattern(dash_dot))
*quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal))
graph export dev_perc_mg_fem.png, replace

