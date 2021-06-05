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
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(large) angle(horizontal))
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
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(large) angle(horizontal))
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
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(large) angle(horizontal))
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
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(large) angle(horizontal))
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
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(large) angle(horizontal))
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
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(large) height(10)) lcolor(black blue gray) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(large) angle(horizontal))
graph export dev_perc_mg_fem.png, replace
