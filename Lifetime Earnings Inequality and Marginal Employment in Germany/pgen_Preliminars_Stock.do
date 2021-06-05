cls
set more off
*
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*
ssc install fastgini
***cleaning - generate variables/statistics to compare to pequiv

replace civil_servant=-2 if civil_servant==.
bysort persnr: egen max_civil_servant=max(civil_servant)
tab civil_servant
tab max_civil_servant
drop if max_civil_servant>0 & max_civil_servant!=.

replace nation=-2 if nation==.
gen foreigner=1 if nation>1
replace foreigner=0 if nation<=1
bysort persnr: egen max_foreigner=max(foreigner)
tab nation
tab max_foreigner
drop if max_foreigner>0 & max_foreigner!=.

*drop military service and maternity leave:
replace lfs=-2 if lfs==.
gen lfs_exclude=1 if lfs==4 | lfs==5
replace lfs_exclude=0 if lfs!=4 & lfs!=5
bysort persnr: egen max_lfs_exclude=max(lfs_exclude)
tab lfs_exclude
tab max_lfs_exclude
drop if max_lfs_exclude>0 & max_lfs_exclude!=.

*drop students:
drop if lfs==3

*drop retirees:
drop if lfs==2

save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_stock.dta", replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_stock.dta", clear

***unconditional

*drop if civil_servant==1
*keep if female==0
keep if sample==21 | sample==23

qui drop if age<24
qui drop if age>55

***

gen work=1 if inrange(lfs,8,12)
replace work=0 if lfs!=11 & lfs!=12 & lfs!=9 & lfs!=8 & lfs!=10
*
gen reg_sec_job=1 if lfs==10 & work==1
replace reg_sec_job=0 if lfs!=10 & work==1
*
gen temp_sec_job=1 if inrange(lfs,8,9) & work==1
replace temp_sec_job=0 if lfs!=8 & lfs!=9 & work==1
*
gen sec_job=1 if reg_sec_job==1 & work==1
replace sec_job=1 if temp_sec_job==1 & work==1
replace sec_job=0 if reg_sec_job==0 & temp_sec_job==0 & work==1
*
gen unemployed=1 if lfs==6
replace unemployed=0 if lfs!=6
*
gen nonworking=1 if lfs==1
replace nonworking=0 if lfs!=1

*
*bysort year month: egen mean_full=mean(full) if work==1
*bysort year month: egen mean_part=mean(part) if work==1
*bysort year month: egen mean_mini=mean(mini) if work==1
bysort year: egen ave_work=mean(work)
bysort year: egen ave_reg_sec_job=mean(reg_sec_job)
bysort year: egen ave_temp_sec_job=mean(temp_sec_job)
bysort year: egen ave_sec_job=mean(sec_job)
bysort year: egen ave_unemployed=mean(unemployed)
bysort year: egen ave_nonworking=mean(nonworking)

*
label variable ave_work "Working"
*label variable ave_reg_sec_job "Reg. 2nd Job"
*label variable ave_temp_sec_job "Temp. 2nd Job"
label variable ave_unemployed "Unemployed"
label variable ave_nonworking "Non-working"
twoway line ave_work ave_unemployed ave_nonworking year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black gray orange) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.2) 1, angle(horizontal))
graph export stock_soep_gen_unc.png, replace

label variable ave_sec_job "2nd Job"
*label variable ave_reg_sec_job "Reg. 2nd Job"
*label variable ave_temp_sec_job "Temp. 2nd Job"
label variable ave_reg_sec_job "Reg. 2nd Job"
label variable ave_temp_sec_job "Temp. 2nd Job"
twoway line ave_reg_sec_job ave_temp_sec_job year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red green) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, angle(horizontal))
graph export sec_reg_temp_soep_gen_unc.png, replace

twoway line ave_sec_job year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue red green) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, angle(horizontal))
graph export sec_soep_gen_unc.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_stock.dta", clear

***males

*drop if civil_servant==1
keep if female==0
keep if sample==21 | sample==23

qui drop if age<24
qui drop if age>55

***

gen work=1 if inrange(lfs,8,12)
replace work=0 if lfs!=11 & lfs!=12 & lfs!=9 & lfs!=8 & lfs!=10
*
gen reg_sec_job=1 if lfs==10 & work==1
replace reg_sec_job=0 if lfs!=10 & work==1
*
gen temp_sec_job=1 if inrange(lfs,8,9) & work==1
replace temp_sec_job=0 if lfs!=8 & lfs!=9 & work==1
*
gen sec_job=1 if reg_sec_job==1 & work==1
replace sec_job=1 if temp_sec_job==1 & work==1
replace sec_job=0 if reg_sec_job==0 & temp_sec_job==0 & work==1
*
gen unemployed=1 if lfs==6
replace unemployed=0 if lfs!=6
*
gen nonworking=1 if lfs==1
replace nonworking=0 if lfs!=1

*
*bysort year month: egen mean_full=mean(full) if work==1
*bysort year month: egen mean_part=mean(part) if work==1
*bysort year month: egen mean_mini=mean(mini) if work==1
bysort year: egen ave_work=mean(work)
bysort year: egen ave_reg_sec_job=mean(reg_sec_job)
bysort year: egen ave_temp_sec_job=mean(temp_sec_job)
bysort year: egen ave_sec_job=mean(sec_job)
bysort year: egen ave_unemployed=mean(unemployed)
bysort year: egen ave_nonworking=mean(nonworking)

*
label variable ave_work "Working"
*label variable ave_reg_sec_job "Reg. 2nd Job"
*label variable ave_temp_sec_job "Temp. 2nd Job"
label variable ave_unemployed "Unemployed"
label variable ave_nonworking "Non-working"
twoway line ave_work ave_unemployed ave_nonworking year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black gray orange) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.2) 1, angle(horizontal))
graph export stock_soep_gen.png, replace

label variable ave_sec_job "2nd Job"
*label variable ave_reg_sec_job "Reg. 2nd Job"
*label variable ave_temp_sec_job "Temp. 2nd Job"
label variable ave_reg_sec_job "Reg. 2nd Job"
label variable ave_temp_sec_job "Temp. 2nd Job"
twoway line ave_reg_sec_job ave_temp_sec_job year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red green) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, angle(horizontal))
graph export sec_reg_temp_soep_gen.png, replace

twoway line ave_sec_job year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue red green) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, angle(horizontal))
graph export sec_soep_gen.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_stock.dta", clear

***female

*drop if civil_servant==1
keep if female==1
keep if sample==21 | sample==23

qui drop if age<24
qui drop if age>55

***

gen work=1 if inrange(lfs,8,12)
replace work=0 if lfs!=11 & lfs!=12 & lfs!=9 & lfs!=8 & lfs!=10
*
gen reg_sec_job=1 if lfs==10 & work==1
replace reg_sec_job=0 if lfs!=10 & work==1
*
gen temp_sec_job=1 if inrange(lfs,8,9) & work==1
replace temp_sec_job=0 if lfs!=8 & lfs!=9 & work==1
*
gen sec_job=1 if reg_sec_job==1 & work==1
replace sec_job=1 if temp_sec_job==1 & work==1
replace sec_job=0 if reg_sec_job==0 & temp_sec_job==0 & work==1
*
gen unemployed=1 if lfs==6
replace unemployed=0 if lfs!=6
*
gen nonworking=1 if lfs==1
replace nonworking=0 if lfs!=1

*
*bysort year month: egen mean_full=mean(full) if work==1
*bysort year month: egen mean_part=mean(part) if work==1
*bysort year month: egen mean_mini=mean(mini) if work==1
bysort year: egen ave_work=mean(work)
bysort year: egen ave_reg_sec_job=mean(reg_sec_job)
bysort year: egen ave_temp_sec_job=mean(temp_sec_job)
bysort year: egen ave_sec_job=mean(sec_job)
bysort year: egen ave_unemployed=mean(unemployed)
bysort year: egen ave_nonworking=mean(nonworking)

*
label variable ave_work "Working"
*label variable ave_reg_sec_job "Reg. 2nd Job"
*label variable ave_temp_sec_job "Temp. 2nd Job"
label variable ave_unemployed "Unemployed"
label variable ave_nonworking "Non-working"
twoway line ave_work ave_unemployed ave_nonworking year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black gray orange) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.2) 1, angle(horizontal))
graph export stock_soep_gen_fem.png, replace

label variable ave_sec_job "2nd Job"
*label variable ave_reg_sec_job "Reg. 2nd Job"
*label variable ave_temp_sec_job "Temp. 2nd Job"
label variable ave_reg_sec_job "Reg. 2nd Job"
label variable ave_temp_sec_job "Temp. 2nd Job"
twoway line ave_reg_sec_job ave_temp_sec_job year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red green) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, angle(horizontal))
graph export sec_reg_temp_soep_gen_fem.png, replace

twoway line ave_sec_job year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue red green) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, angle(horizontal))
graph export sec_soep_gen_fem.png, replace
