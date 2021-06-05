*Card

*Figure I

*
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
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
*bysort persnr year: gen ind=_n
*keep if ind==1
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
gen dev_p85=(p85-r(mean))*100
*
sum p15_full if year==1999
gen dev_p15=(p15-r(mean))*100
*
sum p50_full if year==1999
gen dev_p50=(p50-r(mean))*100
*
label variable dev_p85 "P85"
label variable dev_p50 "P50"
label variable dev_p15 "P15"
*
sort year
*
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(-35 (5) 10, labsize(large) angle(horizontal))
graph export dev_perc.png, replace

use "\Preliminars",clear
cd ""
sort year

*only full time
drop if female==0
drop if source!=1
drop if form!=1
drop if west==0
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
gen ind_primary=1 if max_days_epi==days_epi
*bysort persnr year: gen ind=_n
*keep if ind==1
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
gen dev_p85=(p85-r(mean))*100
*
sum p15_full if year==1999
gen dev_p15=(p15-r(mean))*100
*
sum p50_full if year==1999
gen dev_p50=(p50-r(mean))*100
*
label variable dev_p85 "P85"
label variable dev_p50 "P50"
label variable dev_p15 "P15"
*
sort year
*
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(-35 (5) 10, labsize(large) angle(horizontal))
graph export dev_perc_fem.png, replace
*

*Figure II
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
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
keep if max_days_epi==days_epi
bysort persnr year: gen ind=_n
keep if ind==1
*gen Log Deviations by year:
gen p85_full=.
gen p50_full=.
gen p15_full=.
gen p50_15_full=.
gen p85_15_full=.
gen p85_50_full=.
levels year, local(reg)
gen log_def_daily_wage=log(def_daily_wage)
foreach r of local reg {
egen p85 = pctile(log_def_daily_wage) if year == `r', p(85)
egen p50 = pctile(log_def_daily_wage) if year == `r', p(50)
egen p15 = pctile(log_def_daily_wage) if year == `r', p(15)
replace p85_full=p85 if year == `r'
replace p15_full=p15 if year == `r'
replace p50_full=p50 if year == `r'
replace p85_15_full=(p85-p15)/(invnormal(0.85)-invnormal(0.15)) if year == `r'
replace p85_50_full=(p85-p50)/(invnormal(0.85)-invnormal(0.5)) if year == `r'
replace p50_15_full=(p50-p15)/(invnormal(0.5)-invnormal(0.15)) if year == `r'
drop p85 p15 p50
}
*
bysort year: egen sd_full=sd(log_def_daily_wage)
*
tabstat p85_15_full p85_50_full p50_15_full sd_full, by(year) stats(mean n)
*
label variable p85_15_full "P85/P15"
label variable p85_50_full "P85/P50"
label variable p50_15_full "P50/P15"
label variable sd_full "Std. Dev."
*
sort year
*
quietly twoway line p85_15_full p85_50_full p50_15_full sd_full year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green) legend(position(6) rows(1)) lpattern(solid dash dash_dot solid) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.3 (0.05) 0.7, labsize(large) angle(horizontal))
graph export wage_ineq.png, replace

use "\Preliminars",clear
cd ""
sort year
*only full time
drop if female==0
drop if source!=1
drop if form!=1
drop if west==0
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
keep if max_days_epi==days_epi
bysort persnr year: gen ind=_n
keep if ind==1
*gen Log Deviations by year:
gen p85_full=.
gen p50_full=.
gen p15_full=.
gen p50_15_full=.
gen p85_15_full=.
gen p85_50_full=.
levels year, local(reg)
gen log_def_daily_wage=log(def_daily_wage)
foreach r of local reg {
egen p85 = pctile(log_def_daily_wage) if year == `r', p(85)
egen p50 = pctile(log_def_daily_wage) if year == `r', p(50)
egen p15 = pctile(log_def_daily_wage) if year == `r', p(15)
replace p85_full=p85 if year == `r'
replace p15_full=p15 if year == `r'
replace p50_full=p50 if year == `r'
replace p85_15_full=(p85-p15)/(invnormal(0.85)-invnormal(0.15)) if year == `r'
replace p85_50_full=(p85-p50)/(invnormal(0.85)-invnormal(0.5)) if year == `r'
replace p50_15_full=(p50-p15)/(invnormal(0.5)-invnormal(0.15)) if year == `r'
drop p85 p15 p50
}
*
bysort year: egen sd_full=sd(log_def_daily_wage)
*
tabstat p85_15_full p85_50_full p50_15_full sd_full, by(year) stats(mean n)
*
label variable p85_15_full "P85/P15"
label variable p85_50_full "P85/P50"
label variable p50_15_full "P50/P15"
label variable sd_full "Std. Dev."
*
sort year
*
quietly twoway line p85_15_full p85_50_full p50_15_full sd_full year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green) legend(position(6) rows(1)) lpattern(solid dash dash_dot solid) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.3 (0.05) 0.7, labsize(large) angle(horizontal))
graph export wage_ineq_fem.png, replace
*

*Figure III
cls
set more off
use "\Preliminars",clear
cd ""
sort year
*only full time
drop if source!=1
drop if form!=1
drop if west==0
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
keep if max_days_epi==days_epi
bysort persnr year: gen ind=_n
keep if ind==1
*gen Log Deviations by year:
gen p85_full=.
gen p15_full=.
gen p85_15_full=.
gen p85_full_fem=.
gen p15_full_fem=.
gen p85_15_full_fem=.
levels year, local(reg)
gen log_def_daily_wage=log(def_daily_wage)
foreach r of local reg {
egen p85 = pctile(log_def_daily_wage) if year == `r' & female==0, p(85)
egen p85_fem = pctile(log_def_daily_wage) if year == `r' & female==1, p(85)
egen p15 = pctile(log_def_daily_wage) if year == `r' & female==0, p(15)
egen p15_fem = pctile(log_def_daily_wage) if year == `r' & female==1, p(15)
replace p85_full=p85 if year == `r'  & female==0
replace p15_full=p15 if year == `r'  & female==0
replace p85_full_fem=p85_fem if year == `r'  & female==1
replace p15_full_fem=p15_fem if year == `r'  & female==1
replace p85_15_full=(p85-p15)/(invnormal(0.85)-invnormal(0.15)) if year == `r' & female==0
replace p85_15_full_fem=(p85_fem-p15_fem)/(invnormal(0.85)-invnormal(0.15)) if year == `r' & female==1
drop p85 p15 p85_fem p15_fem
}
*
tabstat p85_15_full p85_15_full_fem, by(year) stats(mean n)
*
label variable p85_15_full "Males"
label variable p85_15_full_fem "Females"
*
sort year
*
quietly twoway line p85_15_full p85_15_full_fem year, ytitle({bf:Dispersion}, size(large) height(10)) lcolor(black blue gray green) legend(position(6) rows(1)) lpattern(solid dash dash_dot solid) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.3 (0.05) 0.7, labsize(large) angle(horizontal))
graph export wage_ineq_samples.png, replace
*

*Figure IVS
cls
set more off
use "\Preliminars",clear
cd ""
set matsize 11000
sort year
*only full time
drop if female==1
drop if source!=1
drop if form!=1
drop if west==0
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
keep if max_days_epi==days_epi
bysort persnr year: gen ind=_n
keep if ind==1
*gen Log Deviations by year:
levels year, local(reg)
gen log_def_daily_wage=log(def_daily_wage)
*
bysort year: egen sd_full=sd(log_def_daily_wage)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_def_daily_wage i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_def_daily_wage-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer=sd(u_mincer)


*

label variable sd_full "Std. Dev."
label variable sd_full_mincer "Std. Dev. Mincer"

quietly twoway line sd_full sd_full_mincer year, ytitle({bf:Dispersion}, size(large) height(15)) lcolor(black blue gray green red) legend(position(6) rows(2)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.3 (0.05) 0.7, labsize(large) angle(horizontal))
graph export mincer_regs.png, replace

*Figure IVS
cls
set more off
use "\Preliminars",clear
cd ""
set matsize 11000
sort year
*only full time
drop if female==0
drop if source!=1
drop if form!=1
drop if west==0
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
keep if max_days_epi==days_epi
bysort persnr year: gen ind=_n
keep if ind==1
*gen Log Deviations by year:
levels year, local(reg)
gen log_def_daily_wage=log(def_daily_wage)
*
bysort year: egen sd_full=sd(log_def_daily_wage)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_def_daily_wage i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_def_daily_wage-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer=sd(u_mincer)

label variable sd_full "Std. Dev."
label variable sd_full_mincer "Std. Dev. Mincer"
quietly twoway line sd_full sd_full_mincer year, ytitle({bf:Dispersion}, size(large) height(15)) lcolor(black blue gray green red) legend(position(6) rows(2)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.3 (0.05) 0.7, labsize(large) angle(horizontal))
graph export mincer_regs_female.png, replace

/*
*Figure IVS
cls
set more off
use "\Preliminars",clear
cd ""
set matsize 11000
sort year
*only full time
drop if female==1
drop if source!=1
drop if form!=1
drop if west==0
*keep longest spell within year
bysort persnr year: egen max_days_epi=max(days_epi)
keep if max_days_epi==days_epi
bysort persnr year: gen ind=_n
keep if ind==1
*gen Log Deviations by year:
levels year, local(reg)
gen log_def_daily_wage=log(def_daily_wage)
*
bysort year: egen sd_full=sd(log_def_daily_wage)
*
gen u_mincer=.
foreach r of local reg {
xi: reg log_def_daily_wage i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer=log_def_daily_wage-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer=sd(u_mincer)

*
gen u_mincer_region=.
foreach r of local reg {
xi: reg log_def_daily_wage i.educ*i.age i.region if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_region=log_def_daily_wage-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer_region=sd(u_mincer_region)

*
gen u_mincer_region_econ=.
foreach r of local reg {
xi: reg log_def_daily_wage i.educ*i.age i.region i.econ_act if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_region_econ=log_def_daily_wage-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer_region_econ=sd(u_mincer_region_econ)

*
gen u_mincer_region_econ_task=.
foreach r of local reg {
xi: reg log_def_daily_wage i.educ*i.age i.region i.econ_act i.requirement if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_region_econ_task=log_def_daily_wage-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer_region_econ_task=sd(u_mincer_region_econ_task)

*
gen u_mincer_occup=.
levels year, local(reg)
*
foreach r of local reg {
xi: reg log_def_daily_wage i.educ*i.age i.occupation i.occupational_group if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_occup=log_def_daily_wage-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer_occup=sd(u_mincer_occup)

*
gen u_mincer_birth=.
levels year, local(reg)
*
foreach r of local reg {
xi: reg log_def_daily_wage i.educ*i.age i.year_birth if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_birth=log_def_daily_wage-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer_birth=sd(u_mincer_birth)

*
label variable sd_full "Std. Dev."
label variable sd_full_mincer "Std. Dev. Mincer"
label variable sd_full_mincer_region "Region"
label variable sd_full_mincer_region_econ "Econ. Sector"
label variable sd_full_mincer_region_econ_task "Task Requirement"
label variable sd_full_mincer_occup "Occup."
label variable sd_full_mincer_birth "Birth"
*
sort year
*
quietly twoway line sd_full sd_full_mincer sd_full_mincer_region sd_full_mincer_region_econ sd_full_mincer_region_econ_task year, ytitle({bf:Dispersion}, size(large) height(15)) lcolor(black blue gray green red) legend(position(6) rows(2)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.3 (0.05) 0.7, labsize(large) angle(horizontal))
graph export mincer_regs.png, replace

quietly twoway line sd_full sd_full_mincer sd_full_mincer_occup year, ytitle({bf:Dispersion}, size(large) height(15)) lcolor(black blue gray green red) legend(position(6) rows(2)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.3 (0.05) 0.7, labsize(large) angle(horizontal))
graph export mincer_regs_occup.png, replace

quietly twoway line sd_full sd_full_mincer sd_full_mincer_birth year, ytitle({bf:Dispersion}, size(large) height(15)) lcolor(black blue gray green red) legend(position(6) rows(2)) lpattern(solid dash dash_dot longdash shortdash) lwidth(medthick medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.3 (0.05) 0.7, labsize(large) angle(horizontal))
graph export mincer_regs_occup.png, replace
*/
