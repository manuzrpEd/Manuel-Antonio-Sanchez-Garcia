cls
set more off
*
use "\pgen.dta", clear
cd ""
*
ssc install fastgini
***cleaning - generate variables/statistics to compare to pequiv

*drop civil servant
replace civil_servant=-2 if civil_servant==.
bysort persnr: egen max_civil_servant=max(civil_servant)
tab civil_servant
tab max_civil_servant
drop if max_civil_servant>0 & max_civil_servant!=.

*drop foreigner
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

save "\pgen_stock.dta", replace

use "\pgen_stock.dta", clear

***unconditional

keep if sample==21 | sample==23

qui drop if age<24
qui drop if age>55

***
g LF=0 if lfs>0 & lfs!=.
replace LF=1 if lfs>1 & lfs!=.

g working=1 if LF==1 &  lfs>6 & lfs!=. & employment_status!=-3 & employment_status!=-1 & employment_status!=5 & employment_status!=6
replace working=0 if LF==1 & lfs==6/*Unemployed*/
replace working=0 if lfs>0 & lfs!=. & LF==0

g unemployed=0 if LF==1
replace unemployed=1 if LF==1 & lfs==6

g FT=0 if working==1
replace FT=1 if working==1 & employment_status==1

g gen_PT=0 if working==1
replace gen_PT=1 if working==1 & employment_status==2
replace gen_PT=1 if working==1 & employment_status==4

g PT=0 if working==1
replace PT=1 if working==1 & employment_status==2

g MJ=0 if working==1
replace MJ=1 if working==1 & employment_status==4

*

bysort year: egen ave_LF=mean(LF)
bysort year: egen ave_Working=mean(working)
bysort year: egen ave_FT=mean(FT)
bysort year: egen ave_gen_PT=mean(gen_PT)
bysort year: egen ave_PT=mean(PT)
bysort year: egen ave_MJ=mean(MJ)
bysort year: egen ave_Unemployed=mean(unemployed)

*
label variable ave_LF "Labour Force"
label variable ave_Working "Employed"
label variable ave_FT "Full Time"
label variable ave_gen_PT "Part Time"
label variable ave_PT "Part Time"
label variable ave_MJ "Marginal Employment"
label variable ave_Unemployed "Unemployed"


twoway line ave_LF ave_Working year if year>1989, ytitle({bf:% of Working Age}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black gray orange) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1990 (5) 2015) xline(1990 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.1) 1, angle(horizontal))
graph export Employment_Stock_Series.png, replace

use "\pgen.dta", clear
cd ""
*
ssc install fastgini
***cleaning - generate variables/statistics to compare to pequiv

*drop civil servant
replace civil_servant=-2 if civil_servant==.
bysort persnr: egen max_civil_servant=max(civil_servant)
tab civil_servant
tab max_civil_servant
drop if max_civil_servant>0 & max_civil_servant!=.

*drop foreigner
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

save "\pgen_stock.dta", replace

use "\pgen_stock.dta", clear

keep if female==0

***unconditional

keep if sample==21 | sample==23

qui drop if age<24
qui drop if age>55

***
g LF=0 if lfs>0 & lfs!=.
replace LF=1 if lfs>1 & lfs!=.

g working=1 if LF==1 &  lfs>6 & lfs!=. & employment_status!=-3 & employment_status!=-1 & employment_status!=5 & employment_status!=6
replace working=0 if LF==1 & lfs==6/*Unemployed*/
replace working=0 if lfs>0 & lfs!=. & LF==0

g unemployed=0 if LF==1
replace unemployed=1 if LF==1 & lfs==6

g FT=0 if working==1
replace FT=1 if working==1 & employment_status==1

g gen_PT=0 if working==1
replace gen_PT=1 if working==1 & employment_status==2
replace gen_PT=1 if working==1 & employment_status==4

g PT=0 if working==1
replace PT=1 if working==1 & employment_status==2

g MJ=0 if working==1
replace MJ=1 if working==1 & employment_status==4

*

bysort year: egen ave_LF=mean(LF)
bysort year: egen ave_Working=mean(working)
bysort year: egen ave_FT=mean(FT)
bysort year: egen ave_gen_PT=mean(gen_PT)
bysort year: egen ave_PT=mean(PT)
bysort year: egen ave_MJ=mean(MJ)
bysort year: egen ave_Unemployed=mean(unemployed)

*
label variable ave_LF "Labour Force"
label variable ave_Working "Employed"
label variable ave_FT "Full Time"
label variable ave_gen_PT "Part Time"
label variable ave_PT "Part Time"
label variable ave_MJ "Marginal Employment"
label variable ave_Unemployed "Unemployed"


twoway line ave_LF ave_Working year if year>1989, ytitle({bf:% of Working Age}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black gray orange) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1990 (5) 2015) xline(1990 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.1) 1, angle(horizontal))
graph export Employment_Stock_Series_Males.png, replace

use "\pgen.dta", clear
cd ""
*
ssc install fastgini
***cleaning - generate variables/statistics to compare to pequiv

*drop civil servant
replace civil_servant=-2 if civil_servant==.
bysort persnr: egen max_civil_servant=max(civil_servant)
tab civil_servant
tab max_civil_servant
drop if max_civil_servant>0 & max_civil_servant!=.

*drop foreigner
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

save "\pgen_stock.dta", replace

use "\pgen_stock.dta", clear

keep if female==1

***unconditional

keep if sample==21 | sample==23

qui drop if age<24
qui drop if age>55

***
g LF=0 if lfs>0 & lfs!=.
replace LF=1 if lfs>1 & lfs!=.

g working=1 if LF==1 &  lfs>6 & lfs!=. & employment_status!=-3 & employment_status!=-1 & employment_status!=5 & employment_status!=6
replace working=0 if LF==1 & lfs==6/*Unemployed*/
replace working=0 if lfs>0 & lfs!=. & LF==0

g unemployed=0 if LF==1
replace unemployed=1 if LF==1 & lfs==6

g FT=0 if working==1
replace FT=1 if working==1 & employment_status==1

g gen_PT=0 if working==1
replace gen_PT=1 if working==1 & employment_status==2
replace gen_PT=1 if working==1 & employment_status==4

g PT=0 if working==1
replace PT=1 if working==1 & employment_status==2

g MJ=0 if working==1
replace MJ=1 if working==1 & employment_status==4

*

bysort year: egen ave_LF=mean(LF)
bysort year: egen ave_Working=mean(working)
bysort year: egen ave_FT=mean(FT)
bysort year: egen ave_gen_PT=mean(gen_PT)
bysort year: egen ave_PT=mean(PT)
bysort year: egen ave_MJ=mean(MJ)
bysort year: egen ave_Unemployed=mean(unemployed)

*
label variable ave_LF "Labour Force"
label variable ave_Working "Employed"
label variable ave_FT "Full Time"
label variable ave_gen_PT "Part Time"
label variable ave_PT "Part Time"
label variable ave_MJ "Marginal Employment"
label variable ave_Unemployed "Unemployed"


twoway line ave_LF ave_Working year if year>1989, ytitle({bf:% of Working Age}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black gray orange) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1990 (5) 2015) xline(1990 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.1) 1, angle(horizontal))
graph export Employment_Stock_Series_Females.png, replace

/*
twoway line ave_FT ave_gen_PT ave_PT ave_MJ year if year>1989, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black gray orange) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1990 (5) 2015) xline(1990 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.2) 1, angle(horizontal))
graph export Employment_Types_Series.png, replace
*/


*Unconditional Stocks
cls
set more off
use "\Preliminars_Monthly_persnr.dta", clear
cd ""

*bysort year: gen count_year=_n
*keep if count_year==1

sort persnr year month
gen FT=0
gen PT=0
gen MJ=0
gen NE=0
gen CJ=0

g part_time=0
replace part_time=1 if empstate==2 | empstate==3

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
bysort year month: egen stock_part_time=total(part_time)
/*
bysort year month: gen stock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_NE_share=stock_NE/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
*/
bysort year month: gen tstock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_part_time_share=stock_part_time/(stock_FT+stock_PT+stock_MJ+stock_CJ)

***this is the aggregation part:

sort year month
*
bysort year: egen ave_tstock_FT_share=mean(tstock_FT_share)
bysort year: egen ave_tstock_PT_share=mean(tstock_PT_share)
bysort year: egen ave_tstock_MJ_share=mean(tstock_MJ_share)
bysort year: egen ave_tstock_CJ_share=mean(tstock_CJ_share)
bysort year: egen ave_tstock_part_time_share=mean(tstock_part_time_share)
*
/*
bysort year: egen ave_stock_FT_share=mean(stock_FT_share)
bysort year: egen ave_stock_PT_share=mean(stock_PT_share)
bysort year: egen ave_stock_MJ_share=mean(stock_MJ_share)
bysort year: egen ave_stock_NE_share=mean(stock_NE_share)
bysort year: egen ave_stock_CJ_share=mean(stock_CJ_share)
bysort year: egen ave_stock_part_time_share=mean(stock_part_time_share)
*/
bysort year: gen counter_year=_n
keep if counter_year==1

*

label variable ave_tstock_FT_share "FT"
label variable ave_tstock_PT_share "PT"
label variable ave_tstock_MJ_share "MJ"
label variable ave_tstock_CJ_share "CJ"
/*
label variable ave_stock_FT_share "FT"
label variable ave_stock_PT_share "PT"
label variable ave_stock_MJ_share "MJ"
label variable ave_stock_NE_share "NE"
label variable ave_stock_CJ_share "CJ"
*
label variable ave_tstock_part_time_share "Part Time"

quietly twoway line ave_tstock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.05) 0.9, labsize(large) angle(horizontal))
graph export tstock_FT_unc.png, replace

quietly twoway line ave_tstock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.1 (0.02) 0.2, labsize(large) angle(horizontal))
graph export tstock_PT_unc.png, replace

quietly twoway line ave_tstock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_MJ_unc.png, replace

quietly twoway line ave_tstock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_CJ_unc.png, replace
*/
quietly twoway line ave_tstock_part_time_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.4, labsize(large) angle(horizontal))
graph export tstock_part_time_unc.png, replace

*Unconditional Stocks
cls
set more off
use "\Preliminars_Monthly_persnr.dta", clear
cd ""

*bysort year: gen count_year=_n
*keep if count_year==1

keep if female==0

sort persnr year month
gen FT=0
gen PT=0
gen MJ=0
gen NE=0
gen CJ=0

g part_time=0
replace part_time=1 if empstate==2 | empstate==3

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
bysort year month: egen stock_part_time=total(part_time)
/*
bysort year month: gen stock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_NE_share=stock_NE/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
*/
bysort year month: gen tstock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_part_time_share=stock_part_time/(stock_FT+stock_PT+stock_MJ+stock_CJ)

***this is the aggregation part:

sort year month
*
bysort year: egen ave_tstock_FT_share=mean(tstock_FT_share)
bysort year: egen ave_tstock_PT_share=mean(tstock_PT_share)
bysort year: egen ave_tstock_MJ_share=mean(tstock_MJ_share)
bysort year: egen ave_tstock_CJ_share=mean(tstock_CJ_share)
bysort year: egen ave_tstock_part_time_share=mean(tstock_part_time_share)
*
/*
bysort year: egen ave_stock_FT_share=mean(stock_FT_share)
bysort year: egen ave_stock_PT_share=mean(stock_PT_share)
bysort year: egen ave_stock_MJ_share=mean(stock_MJ_share)
bysort year: egen ave_stock_NE_share=mean(stock_NE_share)
bysort year: egen ave_stock_CJ_share=mean(stock_CJ_share)
bysort year: egen ave_stock_part_time_share=mean(stock_part_time_share)
*/
bysort year: gen counter_year=_n
keep if counter_year==1

*

label variable ave_tstock_FT_share "FT"
label variable ave_tstock_PT_share "PT"
label variable ave_tstock_MJ_share "MJ"
label variable ave_tstock_CJ_share "CJ"
/*
label variable ave_stock_FT_share "FT"
label variable ave_stock_PT_share "PT"
label variable ave_stock_MJ_share "MJ"
label variable ave_stock_NE_share "NE"
label variable ave_stock_CJ_share "CJ"
*
label variable ave_tstock_part_time_share "Part Time"

quietly twoway line ave_tstock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.05) 0.9, labsize(large) angle(horizontal))
graph export tstock_FT_unc.png, replace

quietly twoway line ave_tstock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.1 (0.02) 0.2, labsize(large) angle(horizontal))
graph export tstock_PT_unc.png, replace

quietly twoway line ave_tstock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_MJ_unc.png, replace

quietly twoway line ave_tstock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_CJ_unc.png, replace
*/
quietly twoway line ave_tstock_part_time_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.4, labsize(large) angle(horizontal))
graph export tstock_part_time_males.png, replace


cls
set more off
use "\Preliminars_Monthly_persnr.dta", clear
cd ""

*bysort year: gen count_year=_n
*keep if count_year==1

keep if female==1

sort persnr year month
gen FT=0
gen PT=0
gen MJ=0
gen NE=0
gen CJ=0

g part_time=0
replace part_time=1 if empstate==2 | empstate==3

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
bysort year month: egen stock_part_time=total(part_time)
/*
bysort year month: gen stock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_NE_share=stock_NE/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
bysort year month: gen stock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_NE+stock_CJ)
*/
bysort year month: gen tstock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_CJ)
bysort year month: gen tstock_part_time_share=stock_part_time/(stock_FT+stock_PT+stock_MJ+stock_CJ)

***this is the aggregation part:

sort year month
*
bysort year: egen ave_tstock_FT_share=mean(tstock_FT_share)
bysort year: egen ave_tstock_PT_share=mean(tstock_PT_share)
bysort year: egen ave_tstock_MJ_share=mean(tstock_MJ_share)
bysort year: egen ave_tstock_CJ_share=mean(tstock_CJ_share)
bysort year: egen ave_tstock_part_time_share=mean(tstock_part_time_share)
*
/*
bysort year: egen ave_stock_FT_share=mean(stock_FT_share)
bysort year: egen ave_stock_PT_share=mean(stock_PT_share)
bysort year: egen ave_stock_MJ_share=mean(stock_MJ_share)
bysort year: egen ave_stock_NE_share=mean(stock_NE_share)
bysort year: egen ave_stock_CJ_share=mean(stock_CJ_share)
bysort year: egen ave_stock_part_time_share=mean(stock_part_time_share)
*/
bysort year: gen counter_year=_n
keep if counter_year==1

*

label variable ave_tstock_FT_share "FT"
label variable ave_tstock_PT_share "PT"
label variable ave_tstock_MJ_share "MJ"
label variable ave_tstock_CJ_share "CJ"
/*
label variable ave_stock_FT_share "FT"
label variable ave_stock_PT_share "PT"
label variable ave_stock_MJ_share "MJ"
label variable ave_stock_NE_share "NE"
label variable ave_stock_CJ_share "CJ"
*
label variable ave_tstock_part_time_share "Part Time"

quietly twoway line ave_tstock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.05) 0.9, labsize(large) angle(horizontal))
graph export tstock_FT_unc.png, replace

quietly twoway line ave_tstock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.1 (0.02) 0.2, labsize(large) angle(horizontal))
graph export tstock_PT_unc.png, replace

quietly twoway line ave_tstock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_MJ_unc.png, replace

quietly twoway line ave_tstock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_CJ_unc.png, replace
*/
quietly twoway line ave_tstock_part_time_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.4, labsize(large) angle(horizontal))
graph export tstock_part_time_females.png, replace

***
*graphs Card:

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
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) xline(2003) xline(2005) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal))
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
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal)) xline(2003) xline(2005)
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
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal)) xline(2003) xline(2005)
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
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal)) xline(2003) xline(2005)
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
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal)) xline(2003) xline(2005)
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
quietly twoway line dev_p85 dev_p50 dev_p15 year, ytitle({bf:Log Deviations}, size(vlarge) height(10)) lcolor(black blue gray) legend(position(6) rows(1) size(vlarge)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick medthick)  xtitle({bf:Year}, size(vlarge) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(-35 (10) 35, labsize(vlarge) angle(horizontal)) xline(2003) xline(2005)
graph export dev_perc_mg_fem.png, replace

***
*graphs employment stock:
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



quietly twoway line ave_tstock_FT_share ave_tstock_FT_share_fem year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) size(vlarge) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.5 (0.05) 1, labsize(large) angle(horizontal)) xline(2003) xline(2005)
graph export tstock_FT.png, replace

quietly twoway line ave_tstock_PT_share ave_tstock_PT_share_fem year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) size(vlarge) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.05) 0.3, labsize(large) angle(horizontal)) xline(2003) xline(2005)
graph export tstock_PT.png, replace

quietly twoway line ave_tstock_MJ_share ave_tstock_MJ_share_fem year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) size(vlarge) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.04) 0.2, labsize(large) angle(horizontal)) xline(2003) xline(2005)
graph export tstock_MJ.png, replace

quietly twoway line ave_tstock_CJ_share ave_tstock_CJ_share_fem year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) size(vlarge) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal)) xline(2003) xline(2005)
graph export tstock_CJ.png, replace
*

cls
set more off
use "\Preliminars_Monthly_persnr.dta", clear
cd ""

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

*new code
bysort year: g counter=_n
keep if counter==1

quietly twoway line ave_tstock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) size(vlarge) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.05) 0.9, labsize(large) angle(horizontal)) xline(2003) xline(2005)
graph export tstock_FT_unc.png, replace

quietly twoway line ave_tstock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) size(vlarge) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.1 (0.02) 0.2, labsize(large) angle(horizontal)) xline(2003) xline(2005)
graph export tstock_PT_unc.png, replace

quietly twoway line ave_tstock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) size(vlarge) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal)) xline(2003) xline(2005)
graph export tstock_MJ_unc.png, replace

quietly twoway line ave_tstock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) size(vlarge) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal)) xline(2003) xline(2005)
graph export tstock_CJ_unc.png, replace
*
