***
/*
cls
clear
cd ""
/*
**set memory 16g
***Initial State 19992002
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
bysort persnr: gen counter=_n
g PT=0
replace PT=1 if empstate==2
reg PT i.educ age if counter==1
*
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
bysort persnr: gen counter=_n
g MJ=0
replace MJ=1 if empstate==3
reg MJ i.educ age if counter==1
*
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
bysort persnr: gen counter=_n
g CJ=0
replace CJ=1 if empstate==5
reg CJ i.educ age if counter==1
***Initial State 20052009
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
bysort persnr: gen counter=_n
g PT=0
replace PT=1 if empstate==2
reg PT i.educ age if counter==1
*
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
bysort persnr: gen counter=_n
g MJ=0
replace MJ=1 if empstate==3
reg MJ i.educ age if counter==1
*
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
bysort persnr: gen counter=_n
g CJ=0
replace CJ=1 if empstate==5
reg CJ i.educ age if counter==1
***Subsequent State 19992002
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
bysort persnr: gen counter=_n
g FT=0
g PT=0
g MJ=0
g NE=0
g CJ=0
replace PT=1 if empstate==2
replace FT=1 if empstate==1
replace MJ=1 if empstate==3
replace NE=1 if empstate==4
replace CJ=1 if empstate==5
g lFT=0 if counter>1
g lPT=0 if counter>1
g lMJ=0 if counter>1
g lNE=0 if counter>1
g lCJ=0 if counter>1
replace lPT=1 if empstate[_n-1]==2 & counter>1
replace lFT=1 if empstate[_n-1]==1 & counter>1
replace lMJ=1 if empstate[_n-1]==3 & counter>1
replace lNE=1 if empstate[_n-1]==4 & counter>1
replace lCJ=1 if empstate[_n-1]==5 & counter>1
reg PT lPT lMJ lNE lCJ i.educ age if counter>1
*
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
bysort persnr: gen counter=_n
g FT=0
g PT=0
g MJ=0
g NE=0
g CJ=0
replace PT=1 if empstate==2
replace FT=1 if empstate==1
replace MJ=1 if empstate==3
replace NE=1 if empstate==4
replace CJ=1 if empstate==5
g lFT=0 if counter>1
g lPT=0 if counter>1
g lMJ=0 if counter>1
g lNE=0 if counter>1
g lCJ=0 if counter>1
replace lPT=1 if empstate[_n-1]==2 & counter>1
replace lFT=1 if empstate[_n-1]==1 & counter>1
replace lMJ=1 if empstate[_n-1]==3 & counter>1
replace lNE=1 if empstate[_n-1]==4 & counter>1
replace lCJ=1 if empstate[_n-1]==5 & counter>1
reg MJ lPT lMJ lNE lCJ i.educ age if counter>1
*
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
bysort persnr: gen counter=_n
g FT=0
g PT=0
g MJ=0
g NE=0
g CJ=0
replace PT=1 if empstate==2
replace FT=1 if empstate==1
replace MJ=1 if empstate==3
replace NE=1 if empstate==4
replace CJ=1 if empstate==5
g lFT=0 if counter>1
g lPT=0 if counter>1
g lMJ=0 if counter>1
g lNE=0 if counter>1
g lCJ=0 if counter>1
replace lPT=1 if empstate[_n-1]==2 & counter>1
replace lFT=1 if empstate[_n-1]==1 & counter>1
replace lMJ=1 if empstate[_n-1]==3 & counter>1
replace lNE=1 if empstate[_n-1]==4 & counter>1
replace lCJ=1 if empstate[_n-1]==5 & counter>1
reg NE lPT lMJ lNE lCJ i.educ age if counter>1
*
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
bysort persnr: gen counter=_n
g FT=0
g PT=0
g MJ=0
g NE=0
g CJ=0
replace PT=1 if empstate==2
replace FT=1 if empstate==1
replace MJ=1 if empstate==3
replace NE=1 if empstate==4
replace CJ=1 if empstate==5
g lFT=0 if counter>1
g lPT=0 if counter>1
g lMJ=0 if counter>1
g lNE=0 if counter>1
g lCJ=0 if counter>1
replace lPT=1 if empstate[_n-1]==2 & counter>1
replace lFT=1 if empstate[_n-1]==1 & counter>1
replace lMJ=1 if empstate[_n-1]==3 & counter>1
replace lNE=1 if empstate[_n-1]==4 & counter>1
replace lCJ=1 if empstate[_n-1]==5 & counter>1
reg CJ lPT lMJ lNE lCJ i.educ age if counter>1
*** Subsequent State 20052009
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
bysort persnr: gen counter=_n
g FT=0
g PT=0
g MJ=0
g NE=0
g CJ=0
replace PT=1 if empstate==2
replace FT=1 if empstate==1
replace MJ=1 if empstate==3
replace NE=1 if empstate==4
replace CJ=1 if empstate==5
g lFT=0 if counter>1
g lPT=0 if counter>1
g lMJ=0 if counter>1
g lNE=0 if counter>1
g lCJ=0 if counter>1
replace lPT=1 if empstate[_n-1]==2 & counter>1
replace lFT=1 if empstate[_n-1]==1 & counter>1
replace lMJ=1 if empstate[_n-1]==3 & counter>1
replace lNE=1 if empstate[_n-1]==4 & counter>1
replace lCJ=1 if empstate[_n-1]==5 & counter>1
reg PT lPT lMJ lNE lCJ i.educ age if counter>1
*
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
bysort persnr: gen counter=_n
g FT=0
g PT=0
g MJ=0
g NE=0
g CJ=0
replace PT=1 if empstate==2
replace FT=1 if empstate==1
replace MJ=1 if empstate==3
replace NE=1 if empstate==4
replace CJ=1 if empstate==5
g lFT=0 if counter>1
g lPT=0 if counter>1
g lMJ=0 if counter>1
g lNE=0 if counter>1
g lCJ=0 if counter>1
replace lPT=1 if empstate[_n-1]==2 & counter>1
replace lFT=1 if empstate[_n-1]==1 & counter>1
replace lMJ=1 if empstate[_n-1]==3 & counter>1
replace lNE=1 if empstate[_n-1]==4 & counter>1
replace lCJ=1 if empstate[_n-1]==5 & counter>1
reg MJ lPT lMJ lNE lCJ i.educ age if counter>1
*
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
bysort persnr: gen counter=_n
g FT=0
g PT=0
g MJ=0
g NE=0
g CJ=0
replace PT=1 if empstate==2
replace FT=1 if empstate==1
replace MJ=1 if empstate==3
replace NE=1 if empstate==4
replace CJ=1 if empstate==5
g lFT=0 if counter>1
g lPT=0 if counter>1
g lMJ=0 if counter>1
g lNE=0 if counter>1
g lCJ=0 if counter>1
replace lPT=1 if empstate[_n-1]==2 & counter>1
replace lFT=1 if empstate[_n-1]==1 & counter>1
replace lMJ=1 if empstate[_n-1]==3 & counter>1
replace lNE=1 if empstate[_n-1]==4 & counter>1
replace lCJ=1 if empstate[_n-1]==5 & counter>1
reg NE lPT lMJ lNE lCJ i.educ age if counter>1
*
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
bysort persnr: gen counter=_n
g FT=0
g PT=0
g MJ=0
g NE=0
g CJ=0
replace PT=1 if empstate==2
replace FT=1 if empstate==1
replace MJ=1 if empstate==3
replace NE=1 if empstate==4
replace CJ=1 if empstate==5
g lFT=0 if counter>1
g lPT=0 if counter>1
g lMJ=0 if counter>1
g lNE=0 if counter>1
g lCJ=0 if counter>1
replace lPT=1 if empstate[_n-1]==2 & counter>1
replace lFT=1 if empstate[_n-1]==1 & counter>1
replace lMJ=1 if empstate[_n-1]==3 & counter>1
replace lNE=1 if empstate[_n-1]==4 & counter>1
replace lCJ=1 if empstate[_n-1]==5 & counter>1
reg CJ lPT lMJ lNE lCJ i.educ age if counter>1
*** Wage Distribution 19992002
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
g FT=0
g PT=0
g MJ=0
g NE=0
g CJ=0
replace PT=1 if empstate==2
replace FT=1 if empstate==1
replace MJ=1 if empstate==3
replace NE=1 if empstate==4
replace CJ=1 if empstate==5
reg log_ave_wage i.educ age PT MJ NE CJ
*
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
g FT=0
g PT=0
g MJ=0
g NE=0
g CJ=0
replace PT=1 if empstate==2
replace FT=1 if empstate==1
replace MJ=1 if empstate==3
replace NE=1 if empstate==4
replace CJ=1 if empstate==5
sum log_ave_wage
sum log_ave_wage if educ==2
sum log_ave_wage if educ==3
sum log_ave_wage if age>40
sum log_ave_wage if PT==1
sum log_ave_wage if MJ==1
sum log_ave_wage if NE==1
*why NE has such volatility??
sum log_ave_wage if CJ==1
*
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
bysort persnr: gen counter=_n
g FT=0
g PT=0
g MJ=0
g NE=0
g CJ=0
replace PT=1 if empstate==2
replace FT=1 if empstate==1
replace MJ=1 if empstate==3
replace NE=1 if empstate==4
replace CJ=1 if empstate==5
g lFT=0 if counter>1
g lPT=0 if counter>1
g lMJ=0 if counter>1
g lNE=0 if counter>1
g lCJ=0 if counter>1
replace lPT=1 if empstate[_n-1]==2 & counter>1
replace lFT=1 if empstate[_n-1]==1 & counter>1
replace lMJ=1 if empstate[_n-1]==3 & counter>1
replace lNE=1 if empstate[_n-1]==4 & counter>1
replace lCJ=1 if empstate[_n-1]==5 & counter>1
sort persnr counter
bysort persnr: g Llog_ave_age=log_ave_wage[_n-1]
reg log_ave_wage Llog_ave_age if FT==1, nocons
reg log_ave_wage Llog_ave_age if FT==1 & age>40, nocons
reg log_ave_wage Llog_ave_age if FT==1 & lPT==1, nocons
reg log_ave_wage Llog_ave_age if FT==1 & lMJ==1, nocons
reg log_ave_wage Llog_ave_age if FT==1 & lNE==1, nocons
reg log_ave_wage Llog_ave_age if FT==1 & lCJ==1, nocons
reg log_ave_wage Llog_ave_age if CJ==1, nocons
reg log_ave_wage Llog_ave_age if CJ==1 & age>40, nocons
reg log_ave_wage Llog_ave_age if CJ==1 & lPT==1, nocons
reg log_ave_wage Llog_ave_age if CJ==1 & lMJ==1, nocons
reg log_ave_wage Llog_ave_age if CJ==1 & lNE==1, nocons
reg log_ave_wage Llog_ave_age if CJ==1 & lFT==1, nocons
*weird NE and FT autocorrelation!
*** Wage Distribution 20052009
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
g FT=0
g PT=0
g MJ=0
g NE=0
g CJ=0
replace PT=1 if empstate==2
replace FT=1 if empstate==1
replace MJ=1 if empstate==3
replace NE=1 if empstate==4
replace CJ=1 if empstate==5
reg log_ave_wage i.educ age PT MJ NE CJ
*
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
g FT=0
g PT=0
g MJ=0
g NE=0
g CJ=0
replace PT=1 if empstate==2
replace FT=1 if empstate==1
replace MJ=1 if empstate==3
replace NE=1 if empstate==4
replace CJ=1 if empstate==5
sum log_ave_wage
sum log_ave_wage if educ==2
sum log_ave_wage if educ==3
sum log_ave_wage if age>40
sum log_ave_wage if PT==1
sum log_ave_wage if MJ==1
sum log_ave_wage if NE==1
*why NE has such volatility??
sum log_ave_wage if CJ==1
*
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
bysort persnr: gen counter=_n
g FT=0
g PT=0
g MJ=0
g NE=0
g CJ=0
replace PT=1 if empstate==2
replace FT=1 if empstate==1
replace MJ=1 if empstate==3
replace NE=1 if empstate==4
replace CJ=1 if empstate==5
g lFT=0 if counter>1
g lPT=0 if counter>1
g lMJ=0 if counter>1
g lNE=0 if counter>1
g lCJ=0 if counter>1
replace lPT=1 if empstate[_n-1]==2 & counter>1
replace lFT=1 if empstate[_n-1]==1 & counter>1
replace lMJ=1 if empstate[_n-1]==3 & counter>1
replace lNE=1 if empstate[_n-1]==4 & counter>1
replace lCJ=1 if empstate[_n-1]==5 & counter>1
sort persnr counter
bysort persnr: g Llog_ave_age=log_ave_wage[_n-1]
reg log_ave_wage Llog_ave_age if FT==1, nocons
reg log_ave_wage Llog_ave_age if FT==1 & age>40, nocons
reg log_ave_wage Llog_ave_age if FT==1 & lPT==1, nocons
reg log_ave_wage Llog_ave_age if FT==1 & lMJ==1, nocons
reg log_ave_wage Llog_ave_age if FT==1 & lNE==1, nocons
reg log_ave_wage Llog_ave_age if FT==1 & lCJ==1, nocons
reg log_ave_wage Llog_ave_age if CJ==1, nocons
reg log_ave_wage Llog_ave_age if CJ==1 & age>40, nocons
reg log_ave_wage Llog_ave_age if CJ==1 & lPT==1, nocons
reg log_ave_wage Llog_ave_age if CJ==1 & lMJ==1, nocons
reg log_ave_wage Llog_ave_age if CJ==1 & lNE==1, nocons
reg log_ave_wage Llog_ave_age if CJ==1 & lFT==1, nocons
*weird NE and FT autocorrelation!
*/
*** CS Mobility Mobility %
*Initial
cls
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
cd ""
di "Initial State"
bysort persnr: gen counter=_n
g FT=0 if counter==1
g PT=0 if counter==1
g MJ=0 if counter==1
g NE=0 if counter==1
replace PT=1 if empstate==2 & counter==1
replace FT=1 if empstate==1 & counter==1
replace MJ=1 if empstate==3 & counter==1
replace NE=1 if empstate==4 & counter==1
sum FT PT MJ NE
*

*
cls
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
set more off
di "Initial State"
bysort persnr: gen counter=_n
g FT=0 if counter==1
g PT=0 if counter==1
g MJ=0 if counter==1
g NE=0 if counter==1
g CJ=0 if counter==1
replace PT=1 if empstate==2 & counter==1
replace FT=1 if empstate==1 & counter==1
replace MJ=1 if empstate==3 & counter==1
replace NE=1 if empstate==4 & counter==1
replace CJ=1 if empstate==5 & counter==1
sum FT PT MJ NE CJ
*Subsequent
cls
set more off
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
cd ""
di "Subsequent State"
bysort persnr: gen counter=_n
g FT=0 if counter>1
g PT=0 if counter>1
g MJ=0 if counter>1
g NE=0 if counter>1
replace PT=1 if empstate==2 & counter>1
replace FT=1 if empstate==1 & counter>1
replace MJ=1 if empstate==3 & counter>1
replace NE=1 if empstate==4 & counter>1
sum FT PT MJ NE
bysort age: egen ave_FT=mean(FT)
bysort age: egen ave_PT=mean(PT)
bysort age: egen ave_ME=mean(MJ)
bysort age: egen ave_NE=mean(NE)
line ave_FT age, saving(ave_FT, replace) graphregion(color(white)) ytitle("% FT", size(vlarge) height(5)) xlabel(, labsize(large)) ylabel(0 (0.2) 1,  labsize(large)) xtitle("Age", size(vlarge) height(5)) xline(20 (5) 60, lstyle(grid)) lwidth(thick) lcolor(black)
graph export ave_FT_19992002_female.png,replace
line ave_PT age, saving(ave_PT, replace) graphregion(color(white)) ytitle("% PT", size(vlarge) height(5)) xlabel(, labsize(large)) ylabel(0 (0.2) 1,  labsize(large)) xtitle("Age", size(vlarge) height(5)) xline(20 (5) 60, lstyle(grid)) lwidth(thick) lcolor(black)
graph export ave_PT_19992002_female.png,replace
line ave_ME age, saving(ave_MJ, replace) graphregion(color(white)) ytitle("% ME", size(vlarge) height(5)) xlabel(, labsize(large)) ylabel(0 (0.2) 1,  labsize(large)) xtitle("Age", size(vlarge) height(5)) xline(20 (5) 60, lstyle(grid)) lwidth(thick) lcolor(black)
graph export ave_ME_19992002_female.png,replace
line ave_NE age, saving(ave_NE, replace) graphregion(color(white)) ytitle("% NE", size(vlarge) height(5)) xlabel(, labsize(large)) ylabel(0 (0.2) 1,  labsize(large)) xtitle("Age", size(vlarge) height(5)) xline(20 (5) 60, lstyle(grid)) lwidth(thick) lcolor(black)
graph export ave_NE_19992002_female.png,replace
*
gr combine ave_FT.gph ave_PT.gph ave_MJ.gph ave_NE.gph, ycommon graphregion(color(white))
graph export emp_stock_female_19992002_female.png,replace
*age mean and variance by age:
cls
set more off
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
cd ""
di "Subsequent State"
bysort age: egen ave_wage=mean(log_ave_wage) if ne!=1
line ave_wage age, graphregion(color(white)) ytitle("Log Ave Wage", size(vlarge) height(10)) xlabel(, labsize(large)) ylabel(6.5 (0.5) 8,  labsize(large)) xtitle("Age", size(vlarge) height(5)) xline(20 (5) 60, lstyle(grid)) lwidth(thick) lcolor(black)
graph export ave_wage_19992002_female.png,replace
*
cls
set more off
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
cd ""
di "Subsequent State"
bysort persnr: gen counter=_n
g FT=0 if counter>1
g PT=0 if counter>1
g MJ=0 if counter>1
g NE=0 if counter>1
g CJ=0 if counter>1
replace PT=1 if empstate==2 & counter>1
replace FT=1 if empstate==1 & counter>1
replace MJ=1 if empstate==3 & counter>1
replace NE=1 if empstate==4 & counter>1
replace CJ=1 if empstate==5 & counter>1
sum FT PT MJ NE CJ
bysort age: egen ave_FT=mean(FT)
bysort age: egen ave_PT=mean(PT)
bysort age: egen ave_ME=mean(MJ)
bysort age: egen ave_NE=mean(NE)
bysort age: egen ave_CJ=mean(CJ)
line ave_FT age, saving(ave_FT, replace) graphregion(color(white)) ytitle("% FT", size(vlarge) height(5)) xlabel(, labsize(large)) ylabel(0 (0.2) 1,  labsize(large)) xtitle("Age", size(vlarge) height(5)) xline(20 (5) 60, lstyle(grid)) lwidth(thick) lcolor(black)
graph export ave_FT_20052009_female.png,replace
line ave_PT age, saving(ave_PT, replace) graphregion(color(white)) ytitle("% PT", size(vlarge) height(5)) xlabel(, labsize(large)) ylabel(0 (0.2) 1,  labsize(large)) xtitle("Age", size(vlarge) height(5)) xline(20 (5) 60, lstyle(grid)) lwidth(thick) lcolor(black)
graph export ave_PT_20052009_female.png,replace
line ave_ME age, saving(ave_MJ, replace) graphregion(color(white)) ytitle("% ME", size(vlarge) height(5)) xlabel(, labsize(large)) ylabel(0 (0.2) 1,  labsize(large)) xtitle("Age", size(vlarge) height(5)) xline(20 (5) 60, lstyle(grid)) lwidth(thick) lcolor(black)
graph export ave_ME_20052009_female.png,replace
line ave_NE age, saving(ave_NE, replace) graphregion(color(white)) ytitle("% NE", size(vlarge) height(5)) xlabel(, labsize(large)) ylabel(0 (0.2) 1,  labsize(large)) xtitle("Age", size(vlarge) height(5)) xline(20 (5) 60, lstyle(grid)) lwidth(thick) lcolor(black)
graph export ave_NE_20052009_female.png,replace
line ave_CJ age, saving(ave_CJ, replace) graphregion(color(white)) ytitle("% NE", size(vlarge) height(5)) xlabel(, labsize(large)) ylabel(0 (0.2) 1,  labsize(large)) xtitle("Age", size(vlarge) height(5)) xline(20 (5) 60, lstyle(grid)) lwidth(thick) lcolor(black)
graph export ave_CJ_20052009_female.png,replace
*
gr combine ave_FT.gph ave_PT.gph ave_MJ.gph ave_NE.gph, ycommon graphregion(color(white))
graph export emp_stock_female_20052009_female.png,replace
*age mean and variance by age:
cls
set more off
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
cd ""
di "Subsequent State"
bysort age: egen ave_wage=mean(log_ave_wage) if ne!=1
line ave_wage age, graphregion(color(white)) ytitle("Log Ave Wage", size(vlarge) height(10)) xlabel(, labsize(large)) ylabel(6.5 (0.5) 8,  labsize(large)) xtitle("Age", size(vlarge) height(5)) xline(20 (5) 60, lstyle(grid)) lwidth(thick) lcolor(black)
graph export ave_wage_20052009_female.png,replace
*
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
di "State Mobility"
set more off
bysort persnr: gen counter=_n
g FT=0 if counter>1
g PT=0 if counter>1
g MJ=0 if counter>1
g NE=0 if counter>1
replace PT=1 if empstate==2 & counter>1
replace FT=1 if empstate==1 & counter>1
replace MJ=1 if empstate==3 & counter>1
replace NE=1 if empstate==4 & counter>1
replace FT=1 if empstate==5 & counter>1
g lFT=0 if counter>1
g lPT=0 if counter>1
g lMJ=0 if counter>1
g lNE=0 if counter>1
replace lPT=1 if empstate[_n-1]==2 & counter>1
replace lFT=1 if empstate[_n-1]==1 & counter>1
replace lMJ=1 if empstate[_n-1]==3 & counter>1
replace lNE=1 if empstate[_n-1]==4 & counter>1
replace lFT=1 if empstate[_n-1]==5 & counter>1
*
g FT_FT=0 if counter>1
g FT_PT=0 if counter>1
g FT_MJ=0 if counter>1
g FT_NE=0 if counter>1
*
g PT_FT=0 if counter>1
g PT_PT=0 if counter>1
g PT_MJ=0 if counter>1
g PT_NE=0 if counter>1
*
g MJ_FT=0 if counter>1
g MJ_PT=0 if counter>1
g MJ_MJ=0 if counter>1
g MJ_NE=0 if counter>1
*
g NE_FT=0 if counter>1
g NE_PT=0 if counter>1
g NE_MJ=0 if counter>1
g NE_NE=0 if counter>1
*
replace FT_FT=1 if counter>1 & lFT==1 & FT==1
replace FT_PT=1 if counter>1 & lFT==1 & PT==1
replace FT_MJ=1 if counter>1 & lFT==1 & MJ==1
replace FT_NE=1 if counter>1 & lFT==1 & NE==1
*
replace PT_FT=1 if counter>1 & lPT==1 & FT==1
replace PT_PT=1 if counter>1 & lPT==1 & PT==1
replace PT_MJ=1 if counter>1 & lPT==1 & MJ==1
replace PT_NE=1 if counter>1 & lPT==1 & NE==1
*
replace MJ_FT=1 if counter>1 & lMJ==1 & FT==1
replace MJ_PT=1 if counter>1 & lMJ==1 & PT==1
replace MJ_MJ=1 if counter>1 & lMJ==1 & MJ==1
replace MJ_NE=1 if counter>1 & lMJ==1 & NE==1
*
replace NE_FT=1 if counter>1 & lNE==1 & FT==1
replace NE_PT=1 if counter>1 & lNE==1 & PT==1
replace NE_MJ=1 if counter>1 & lNE==1 & MJ==1
replace NE_NE=1 if counter>1 & lNE==1 & NE==1
*
egen tot_FT=total(lFT)
egen tot_PT=total(lPT)
egen tot_MJ=total(lMJ)
egen tot_NE=total(lNE)
*
egen tot_FT_FT=total(FT_FT)
egen tot_FT_PT=total(FT_PT)
egen tot_FT_MJ=total(FT_MJ)
egen tot_FT_NE=total(FT_NE)
*
egen tot_PT_FT=total(PT_FT)
egen tot_PT_PT=total(PT_PT)
egen tot_PT_MJ=total(PT_MJ)
egen tot_PT_NE=total(PT_NE)
*
egen tot_MJ_FT=total(MJ_FT)
egen tot_MJ_PT=total(MJ_PT)
egen tot_MJ_MJ=total(MJ_MJ)
egen tot_MJ_NE=total(MJ_NE)
*
egen tot_NE_FT=total(NE_FT)
egen tot_NE_PT=total(NE_PT)
egen tot_NE_MJ=total(NE_MJ)
egen tot_NE_NE=total(NE_NE)
*
g fract_FT_FT=tot_FT_FT/tot_FT
g fract_FT_PT=tot_FT_PT/tot_FT
g fract_FT_MJ=tot_FT_MJ/tot_FT
g fract_FT_NE=tot_FT_NE/tot_FT
*
g fract_PT_FT=tot_PT_FT/tot_PT
g fract_PT_PT=tot_PT_PT/tot_PT
g fract_PT_MJ=tot_PT_MJ/tot_PT
g fract_PT_NE=tot_PT_NE/tot_PT
*
g fract_MJ_FT=tot_MJ_FT/tot_MJ
g fract_MJ_PT=tot_MJ_PT/tot_MJ
g fract_MJ_MJ=tot_MJ_MJ/tot_MJ
g fract_MJ_NE=tot_MJ_NE/tot_MJ
*
g fract_NE_FT=tot_NE_FT/tot_NE
g fract_NE_PT=tot_NE_PT/tot_NE
g fract_NE_MJ=tot_NE_MJ/tot_NE
g fract_NE_NE=tot_NE_NE/tot_NE
*
sum fract*
*
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
di "State Mobility"
set more off
bysort persnr: gen counter=_n
g FT=0 if counter>1
g PT=0 if counter>1
g MJ=0 if counter>1
g NE=0 if counter>1
g CJ=0 if counter>1
replace PT=1 if empstate==2 & counter>1
replace FT=1 if empstate==1 & counter>1
replace MJ=1 if empstate==3 & counter>1
replace NE=1 if empstate==4 & counter>1
replace CJ=1 if empstate==5 & counter>1
g lFT=0 if counter>1
g lPT=0 if counter>1
g lMJ=0 if counter>1
g lNE=0 if counter>1
g lCJ=0 if counter>1
replace lPT=1 if empstate[_n-1]==2 & counter>1
replace lFT=1 if empstate[_n-1]==1 & counter>1
replace lMJ=1 if empstate[_n-1]==3 & counter>1
replace lNE=1 if empstate[_n-1]==4 & counter>1
replace lCJ=1 if empstate[_n-1]==5 & counter>1
*
g FT_FT=0 if counter>1
g FT_PT=0 if counter>1
g FT_MJ=0 if counter>1
g FT_NE=0 if counter>1
g FT_CJ=0 if counter>1
*
g PT_FT=0 if counter>1
g PT_PT=0 if counter>1
g PT_MJ=0 if counter>1
g PT_NE=0 if counter>1
g PT_CJ=0 if counter>1
*
g MJ_FT=0 if counter>1
g MJ_PT=0 if counter>1
g MJ_MJ=0 if counter>1
g MJ_NE=0 if counter>1
g MJ_CJ=0 if counter>1
*
g NE_FT=0 if counter>1
g NE_PT=0 if counter>1
g NE_MJ=0 if counter>1
g NE_NE=0 if counter>1
g NE_CJ=0 if counter>1
*
g CJ_FT=0 if counter>1
g CJ_PT=0 if counter>1
g CJ_MJ=0 if counter>1
g CJ_NE=0 if counter>1
g CJ_CJ=0 if counter>1
*
replace FT_FT=1 if counter>1 & lFT==1 & FT==1
replace FT_PT=1 if counter>1 & lFT==1 & PT==1
replace FT_MJ=1 if counter>1 & lFT==1 & MJ==1
replace FT_NE=1 if counter>1 & lFT==1 & NE==1
replace FT_CJ=1 if counter>1 & lFT==1 & CJ==1
*
replace PT_FT=1 if counter>1 & lPT==1 & FT==1
replace PT_PT=1 if counter>1 & lPT==1 & PT==1
replace PT_MJ=1 if counter>1 & lPT==1 & MJ==1
replace PT_NE=1 if counter>1 & lPT==1 & NE==1
replace PT_CJ=1 if counter>1 & lPT==1 & CJ==1
*
replace MJ_FT=1 if counter>1 & lMJ==1 & FT==1
replace MJ_PT=1 if counter>1 & lMJ==1 & PT==1
replace MJ_MJ=1 if counter>1 & lMJ==1 & MJ==1
replace MJ_NE=1 if counter>1 & lMJ==1 & NE==1
replace MJ_CJ=1 if counter>1 & lMJ==1 & CJ==1
*
replace NE_FT=1 if counter>1 & lNE==1 & FT==1
replace NE_PT=1 if counter>1 & lNE==1 & PT==1
replace NE_MJ=1 if counter>1 & lNE==1 & MJ==1
replace NE_NE=1 if counter>1 & lNE==1 & NE==1
replace NE_CJ=1 if counter>1 & lNE==1 & CJ==1
*
replace CJ_FT=1 if counter>1 & lCJ==1 & FT==1
replace CJ_PT=1 if counter>1 & lCJ==1 & PT==1
replace CJ_MJ=1 if counter>1 & lCJ==1 & MJ==1
replace CJ_NE=1 if counter>1 & lCJ==1 & NE==1
replace CJ_CJ=1 if counter>1 & lCJ==1 & CJ==1
*
egen tot_FT=total(lFT)
egen tot_PT=total(lPT)
egen tot_MJ=total(lMJ)
egen tot_NE=total(lNE)
egen tot_CJ=total(lCJ)
*
egen tot_FT_FT=total(FT_FT)
egen tot_FT_PT=total(FT_PT)
egen tot_FT_MJ=total(FT_MJ)
egen tot_FT_NE=total(FT_NE)
egen tot_FT_CJ=total(FT_CJ)
*
egen tot_PT_FT=total(PT_FT)
egen tot_PT_PT=total(PT_PT)
egen tot_PT_MJ=total(PT_MJ)
egen tot_PT_NE=total(PT_NE)
egen tot_PT_CJ=total(PT_CJ)
*
egen tot_MJ_FT=total(MJ_FT)
egen tot_MJ_PT=total(MJ_PT)
egen tot_MJ_MJ=total(MJ_MJ)
egen tot_MJ_NE=total(MJ_NE)
egen tot_MJ_CJ=total(MJ_CJ)
*
egen tot_NE_FT=total(NE_FT)
egen tot_NE_PT=total(NE_PT)
egen tot_NE_MJ=total(NE_MJ)
egen tot_NE_NE=total(NE_NE)
egen tot_NE_CJ=total(NE_CJ)
*
egen tot_CJ_FT=total(CJ_FT)
egen tot_CJ_PT=total(CJ_PT)
egen tot_CJ_MJ=total(CJ_MJ)
egen tot_CJ_NE=total(CJ_NE)
egen tot_CJ_CJ=total(CJ_CJ)
*
g fract_FT_FT=tot_FT_FT/tot_FT
g fract_FT_PT=tot_FT_PT/tot_FT
g fract_FT_MJ=tot_FT_MJ/tot_FT
g fract_FT_NE=tot_FT_NE/tot_FT
g fract_FT_CJ=tot_FT_CJ/tot_FT
*
g fract_PT_FT=tot_PT_FT/tot_PT
g fract_PT_PT=tot_PT_PT/tot_PT
g fract_PT_MJ=tot_PT_MJ/tot_PT
g fract_PT_NE=tot_PT_NE/tot_PT
g fract_PT_CJ=tot_PT_CJ/tot_PT
*
g fract_MJ_FT=tot_MJ_FT/tot_MJ
g fract_MJ_PT=tot_MJ_PT/tot_MJ
g fract_MJ_MJ=tot_MJ_MJ/tot_MJ
g fract_MJ_NE=tot_MJ_NE/tot_MJ
g fract_MJ_CJ=tot_MJ_CJ/tot_MJ
*
g fract_NE_FT=tot_NE_FT/tot_NE
g fract_NE_PT=tot_NE_PT/tot_NE
g fract_NE_MJ=tot_NE_MJ/tot_NE
g fract_NE_NE=tot_NE_NE/tot_NE
g fract_NE_CJ=tot_NE_CJ/tot_NE
*
g fract_CJ_FT=tot_CJ_FT/tot_CJ
g fract_CJ_PT=tot_CJ_PT/tot_CJ
g fract_CJ_MJ=tot_CJ_MJ/tot_CJ
g fract_CJ_NE=tot_CJ_NE/tot_CJ
g fract_CJ_CJ=tot_CJ_CJ/tot_CJ
*
sum fract*
*
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
di "CS Wage Moments"
set more off
g elligible=1 if unemp_ben==1
replace elligible=1 if empstate==1
replace elligible=1 if empstate==2
replace elligible=1 if empstate==3
replace elligible=1 if empstate==5
bysort persnr: gen counter=_n
g FT=0 if counter>1 & elligible==1
g PT=0 if counter>1 & elligible==1
g MJ=0 if counter>1 & elligible==1
g NE=0 if counter>1 & elligible==1
replace PT=1 if empstate==2 & counter>1 & elligible==1
replace FT=1 if empstate==1 & counter>1 & elligible==1
replace MJ=1 if empstate==3 & counter>1 & elligible==1
replace NE=1 if empstate==4 & counter>1 & elligible==1
replace FT=1 if empstate==5 & counter>1 & elligible==1
*
sum log_ave_wage if elligible==1
sum log_ave_wage if FT==1 & elligible==1
sum log_ave_wage if PT==1 & elligible==1
sum log_ave_wage if MJ==1 & elligible==1
sum log_ave_wage if NE==1 & elligible==1
*
cls
set more off
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
di "CS Wage Moments"
set more off
g elligible=1 if unemp_ben==1
replace elligible=1 if empstate==1
replace elligible=1 if empstate==2
replace elligible=1 if empstate==3
replace elligible=1 if empstate==5
bysort persnr: gen counter=_n
g FT=0 if counter>1 & elligible==1
g PT=0 if counter>1 & elligible==1
g MJ=0 if counter>1 & elligible==1
g NE=0 if counter>1 & elligible==1
g CJ=0 if counter>1 & elligible==1
replace PT=1 if empstate==2 & counter>1 & elligible==1
replace FT=1 if empstate==1 & counter>1 & elligible==1
replace MJ=1 if empstate==3 & counter>1 & elligible==1
replace NE=1 if empstate==4 & counter>1 & elligible==1
replace CJ=1 if empstate==5 & counter>1 & elligible==1
*
sum log_ave_wage if elligible==1
sum log_ave_wage if FT==1 & elligible==1
sum log_ave_wage if PT==1 & elligible==1
sum log_ave_wage if MJ==1 & elligible==1
sum log_ave_wage if NE==1 & elligible==1
sum log_ave_wage if CJ==1 & elligible==1
*
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
di "Income Mobility"
set more off
bysort persnr: gen counter=_n
*compute fraction of unemp_benefit coming from
g init_unemp_ben=1 if unemp_ben==1 & persnr[_n]==persnr[_n-1] & unemp_ben[_n-1]!=1
g bef_unemp_ben=1 if init_unemp_ben[_n+1]==1 & persnr[_n]==persnr[_n-1]
sum empstate if empstate==1 & bef_unemp_ben==1
sum empstate if empstate==2 & bef_unemp_ben==1
sum empstate if empstate==3 & bef_unemp_ben==1
sum empstate if empstate==4 & bef_unemp_ben==1
*
g group_month=(12*(year-1999))+month
g elligible=1 if unemp_ben==1
replace elligible=1 if empstate==1
replace elligible=1 if empstate==2
replace elligible=1 if empstate==3
*
bysort group_month: egen p20 = pctile(log_ave_wage) if elligible==1, p(20)
bysort group_month: egen p40 = pctile(log_ave_wage) if elligible==1, p(40)
bysort group_month: egen p60 = pctile(log_ave_wage) if elligible==1, p(60)
bysort group_month: egen p80 = pctile(log_ave_wage) if elligible==1, p(80)
*
sort persnr year month
*
g d1=0 if counter>1 & elligible==1
g d2=0 if counter>1 & elligible==1
g d3=0 if counter>1 & elligible==1
g d4=0 if counter>1 & elligible==1
g d5=0 if counter>1 & elligible==1
*
replace d1=1 if log_ave_wage<p20 & counter>1 & elligible==1
replace d2=1 if log_ave_wage>p20 & log_ave_wage<p40 & counter>1 & elligible==1
replace d3=1 if log_ave_wage>p40 & log_ave_wage<p60 & counter>1 & elligible==1
replace d4=1 if log_ave_wage>p60 & log_ave_wage<p80 & counter>1 & elligible==1
replace d5=1 if log_ave_wage>p80 & counter>1 & elligible==1
*
g d1_d1=0 if counter>2 & elligible==1
g d1_d2=0 if counter>2 & elligible==1
g d1_d3=0 if counter>2 & elligible==1
g d1_d4=0 if counter>2 & elligible==1
g d1_d5=0 if counter>2 & elligible==1
g d2_d1=0 if counter>2 & elligible==1
g d2_d2=0 if counter>2 & elligible==1
g d2_d3=0 if counter>2 & elligible==1
g d2_d4=0 if counter>2 & elligible==1
g d2_d5=0 if counter>2 & elligible==1
g d3_d1=0 if counter>2 & elligible==1
g d3_d2=0 if counter>2 & elligible==1
g d3_d3=0 if counter>2 & elligible==1
g d3_d4=0 if counter>2 & elligible==1
g d3_d5=0 if counter>2 & elligible==1
g d4_d1=0 if counter>2 & elligible==1
g d4_d2=0 if counter>2 & elligible==1
g d4_d3=0 if counter>2 & elligible==1
g d4_d4=0 if counter>2 & elligible==1
g d4_d5=0 if counter>2 & elligible==1
g d5_d1=0 if counter>2 & elligible==1
g d5_d2=0 if counter>2 & elligible==1
g d5_d3=0 if counter>2 & elligible==1
g d5_d4=0 if counter>2 & elligible==1
g d5_d5=0 if counter>2 & elligible==1
*
sort persnr year month
bysort persnr: replace d1_d1=1 if d1==1 & d1[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d1_d2=1 if d2==1 & d1[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d1_d3=1 if d3==1 & d1[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d1_d4=1 if d4==1 & d1[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d1_d5=1 if d5==1 & d1[_n-1]==1 & counter>2 & elligible==1
*
bysort persnr: replace d2_d1=1 if d1==1 & d2[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d2_d2=1 if d2==1 & d2[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d2_d3=1 if d3==1 & d2[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d2_d4=1 if d4==1 & d2[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d2_d5=1 if d5==1 & d2[_n-1]==1 & counter>2 & elligible==1
*
bysort persnr: replace d3_d1=1 if d1==1 & d3[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d3_d2=1 if d2==1 & d3[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d3_d3=1 if d3==1 & d3[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d3_d4=1 if d4==1 & d3[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d3_d5=1 if d5==1 & d3[_n-1]==1 & counter>2 & elligible==1
*
bysort persnr: replace d4_d1=1 if d1==1 & d4[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d4_d2=1 if d2==1 & d4[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d4_d3=1 if d3==1 & d4[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d4_d4=1 if d4==1 & d4[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d4_d5=1 if d5==1 & d4[_n-1]==1 & counter>2 & elligible==1
*
bysort persnr: replace d5_d1=1 if d1==1 & d5[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d5_d2=1 if d2==1 & d5[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d5_d3=1 if d3==1 & d5[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d5_d4=1 if d4==1 & d5[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d5_d5=1 if d5==1 & d5[_n-1]==1 & counter>2 & elligible==1
*
egen tot_d1=total(d1)
egen tot_d2=total(d2)
egen tot_d3=total(d3)
egen tot_d4=total(d4)
egen tot_d5=total(d5)
*
egen tot_d1_d1=total(d1_d1)
egen tot_d1_d2=total(d1_d2)
egen tot_d1_d3=total(d1_d3)
egen tot_d1_d4=total(d1_d4)
egen tot_d1_d5=total(d1_d5)
*
egen tot_d2_d1=total(d2_d1)
egen tot_d2_d2=total(d2_d2)
egen tot_d2_d3=total(d2_d3)
egen tot_d2_d4=total(d2_d4)
egen tot_d2_d5=total(d2_d5)
*
egen tot_d3_d1=total(d3_d1)
egen tot_d3_d2=total(d3_d2)
egen tot_d3_d3=total(d3_d3)
egen tot_d3_d4=total(d3_d4)
egen tot_d3_d5=total(d3_d5)
*
egen tot_d4_d1=total(d4_d1)
egen tot_d4_d2=total(d4_d2)
egen tot_d4_d3=total(d4_d3)
egen tot_d4_d4=total(d4_d4)
egen tot_d4_d5=total(d4_d5)
*
egen tot_d5_d1=total(d5_d1)
egen tot_d5_d2=total(d5_d2)
egen tot_d5_d3=total(d5_d3)
egen tot_d5_d4=total(d5_d4)
egen tot_d5_d5=total(d5_d5)
*
g avg_d1_d1=tot_d1_d1/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
g avg_d1_d2=tot_d1_d2/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
g avg_d1_d3=tot_d1_d3/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
g avg_d1_d4=tot_d1_d4/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
g avg_d1_d5=tot_d1_d5/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
*
g avg_d2_d1=tot_d2_d1/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
g avg_d2_d2=tot_d2_d2/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
g avg_d2_d3=tot_d2_d3/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
g avg_d2_d4=tot_d2_d4/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
g avg_d2_d5=tot_d2_d5/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
*
g avg_d3_d1=tot_d3_d1/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
g avg_d3_d2=tot_d3_d2/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
g avg_d3_d3=tot_d3_d3/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
g avg_d3_d4=tot_d3_d4/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
g avg_d3_d5=tot_d3_d5/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
*
g avg_d4_d1=tot_d4_d1/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
g avg_d4_d2=tot_d4_d2/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
g avg_d4_d3=tot_d4_d3/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
g avg_d4_d4=tot_d4_d4/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
g avg_d4_d5=tot_d4_d5/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
*
g avg_d5_d1=tot_d5_d1/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
g avg_d5_d2=tot_d5_d2/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
g avg_d5_d3=tot_d5_d3/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
g avg_d5_d4=tot_d5_d4/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
g avg_d5_d5=tot_d5_d5/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
*
sum avg*
*
cls
set more off
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
di "Income Mobility"
set more off
bysort persnr: gen counter=_n
*
g group_month=(12*(year-2005))+month
*
bysort group_month: egen p20 = pctile(log_ave_wage), p(20)
bysort group_month: egen p40 = pctile(log_ave_wage), p(40)
bysort group_month: egen p60 = pctile(log_ave_wage), p(60)
bysort group_month: egen p80 = pctile(log_ave_wage), p(80)
g elligible=1 if unemp_ben==1
replace elligible=1 if empstate==1
replace elligible=1 if empstate==2
replace elligible=1 if empstate==3
replace elligible=1 if empstate==5
*
sort persnr year month
*
g d1=0 if counter>1 & elligible==1
g d2=0 if counter>1 & elligible==1
g d3=0 if counter>1 & elligible==1
g d4=0 if counter>1 & elligible==1
g d5=0 if counter>1 & elligible==1
*
replace d1=1 if log_ave_wage<p20 & counter>1 & elligible==1
replace d2=1 if log_ave_wage>p20 & log_ave_wage<p40 & counter>1 & elligible==1
replace d3=1 if log_ave_wage>p40 & log_ave_wage<p60 & counter>1 & elligible==1
replace d4=1 if log_ave_wage>p60 & log_ave_wage<p80 & counter>1 & elligible==1
replace d5=1 if log_ave_wage>p80 & counter>1 & elligible==1
*
g d1_d1=0 if counter>2 & elligible==1
g d1_d2=0 if counter>2 & elligible==1
g d1_d3=0 if counter>2 & elligible==1
g d1_d4=0 if counter>2 & elligible==1
g d1_d5=0 if counter>2 & elligible==1
g d2_d1=0 if counter>2 & elligible==1
g d2_d2=0 if counter>2 & elligible==1
g d2_d3=0 if counter>2 & elligible==1
g d2_d4=0 if counter>2 & elligible==1
g d2_d5=0 if counter>2 & elligible==1
g d3_d1=0 if counter>2 & elligible==1
g d3_d2=0 if counter>2 & elligible==1
g d3_d3=0 if counter>2 & elligible==1
g d3_d4=0 if counter>2 & elligible==1
g d3_d5=0 if counter>2 & elligible==1
g d4_d1=0 if counter>2 & elligible==1
g d4_d2=0 if counter>2 & elligible==1
g d4_d3=0 if counter>2 & elligible==1
g d4_d4=0 if counter>2 & elligible==1
g d4_d5=0 if counter>2 & elligible==1
g d5_d1=0 if counter>2 & elligible==1
g d5_d2=0 if counter>2 & elligible==1
g d5_d3=0 if counter>2 & elligible==1
g d5_d4=0 if counter>2 & elligible==1
g d5_d5=0 if counter>2 & elligible==1
*
sort persnr year month
bysort persnr: replace d1_d1=1 if d1==1 & d1[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d1_d2=1 if d2==1 & d1[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d1_d3=1 if d3==1 & d1[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d1_d4=1 if d4==1 & d1[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d1_d5=1 if d5==1 & d1[_n-1]==1 & counter>2 & elligible==1
*
bysort persnr: replace d2_d1=1 if d1==1 & d2[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d2_d2=1 if d2==1 & d2[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d2_d3=1 if d3==1 & d2[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d2_d4=1 if d4==1 & d2[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d2_d5=1 if d5==1 & d2[_n-1]==1 & counter>2 & elligible==1
*
bysort persnr: replace d3_d1=1 if d1==1 & d3[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d3_d2=1 if d2==1 & d3[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d3_d3=1 if d3==1 & d3[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d3_d4=1 if d4==1 & d3[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d3_d5=1 if d5==1 & d3[_n-1]==1 & counter>2 & elligible==1
*
bysort persnr: replace d4_d1=1 if d1==1 & d4[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d4_d2=1 if d2==1 & d4[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d4_d3=1 if d3==1 & d4[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d4_d4=1 if d4==1 & d4[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d4_d5=1 if d5==1 & d4[_n-1]==1 & counter>2 & elligible==1
*
bysort persnr: replace d5_d1=1 if d1==1 & d5[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d5_d2=1 if d2==1 & d5[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d5_d3=1 if d3==1 & d5[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d5_d4=1 if d4==1 & d5[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d5_d5=1 if d5==1 & d5[_n-1]==1 & counter>2 & elligible==1
*
egen tot_d1=total(d1)
egen tot_d2=total(d2)
egen tot_d3=total(d3)
egen tot_d4=total(d4)
egen tot_d5=total(d5)
*
egen tot_d1_d1=total(d1_d1)
egen tot_d1_d2=total(d1_d2)
egen tot_d1_d3=total(d1_d3)
egen tot_d1_d4=total(d1_d4)
egen tot_d1_d5=total(d1_d5)
*
egen tot_d2_d1=total(d2_d1)
egen tot_d2_d2=total(d2_d2)
egen tot_d2_d3=total(d2_d3)
egen tot_d2_d4=total(d2_d4)
egen tot_d2_d5=total(d2_d5)
*
egen tot_d3_d1=total(d3_d1)
egen tot_d3_d2=total(d3_d2)
egen tot_d3_d3=total(d3_d3)
egen tot_d3_d4=total(d3_d4)
egen tot_d3_d5=total(d3_d5)
*
egen tot_d4_d1=total(d4_d1)
egen tot_d4_d2=total(d4_d2)
egen tot_d4_d3=total(d4_d3)
egen tot_d4_d4=total(d4_d4)
egen tot_d4_d5=total(d4_d5)
*
egen tot_d5_d1=total(d5_d1)
egen tot_d5_d2=total(d5_d2)
egen tot_d5_d3=total(d5_d3)
egen tot_d5_d4=total(d5_d4)
egen tot_d5_d5=total(d5_d5)
*
g avg_d1_d1=tot_d1_d1/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
g avg_d1_d2=tot_d1_d2/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
g avg_d1_d3=tot_d1_d3/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
g avg_d1_d4=tot_d1_d4/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
g avg_d1_d5=tot_d1_d5/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
*
g avg_d2_d1=tot_d2_d1/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
g avg_d2_d2=tot_d2_d2/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
g avg_d2_d3=tot_d2_d3/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
g avg_d2_d4=tot_d2_d4/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
g avg_d2_d5=tot_d2_d5/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
*
g avg_d3_d1=tot_d3_d1/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
g avg_d3_d2=tot_d3_d2/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
g avg_d3_d3=tot_d3_d3/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
g avg_d3_d4=tot_d3_d4/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
g avg_d3_d5=tot_d3_d5/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
*
g avg_d4_d1=tot_d4_d1/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
g avg_d4_d2=tot_d4_d2/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
g avg_d4_d3=tot_d4_d3/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
g avg_d4_d4=tot_d4_d4/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
g avg_d4_d5=tot_d4_d5/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
*
g avg_d5_d1=tot_d5_d1/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
g avg_d5_d2=tot_d5_d2/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
g avg_d5_d3=tot_d5_d3/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
g avg_d5_d4=tot_d5_d4/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
g avg_d5_d5=tot_d5_d5/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
*
sum avg*
*/
cls
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
cd ""
di "Likelihood Unemp. Benefits"
set more off
egen min_yr_birth=min(year_birth)
replace year_birth=year_birth-min_yr_birth
*
g elligible=0 if empstate==4
replace elligible=1 if unemp_ben==1
drop if elligible==.
*
g ed2=0
replace ed2=1 if educ==2
g ed3=0
replace ed3=1 if educ==3
g lFT=0
replace lFT=1 if lempstate==1 & persnr[_n]==persnr[_n-1]
g lPT=0
replace lPT=1 if lempstate==2 & persnr[_n]==persnr[_n-1]
g lMJ=0
replace lMJ=1 if lempstate==3 & persnr[_n]==persnr[_n-1]
g lNE=0
replace lNE=1 if lempstate==4 & elligible[_n-1]==0 & persnr[_n]==persnr[_n-1]
g lelligible=0
replace lelligible=1 if elligible[_n-1]==1 & persnr[_n]==persnr[_n-1]
*
*probit elligible ed2 ed3, nocons
*margins, dydx(ed2)
*margins, dydx(ed3)
probit elligible year_birth ed2 ed3 lFT lPT lMJ lNE lelligible, nocons
margins, dydx(ed2)
margins, dydx(ed3)
margins, dydx(lFT)
margins, dydx(lPT)
margins, dydx(lMJ)
margins, dydx(lNE)
margins, dydx(lelligible)
margins, dydx(year_birth)
*
reg elligible year_birth ed2 ed3 lFT lPT lMJ lNE lelligible, nocons
*
cls
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
cd ""
di "Likelihood Unemp. Benefits"
set more off
egen min_yr_birth=min(year_birth)
replace year_birth=year_birth-min_yr_birth
*
g elligible=0 if empstate==4
replace elligible=1 if unemp_ben==1
drop if elligible==.
*
g ed2=0
replace ed2=1 if educ==2
g ed3=0
replace ed3=1 if educ==3
g lFT=0
replace lFT=1 if lempstate==1 & persnr[_n]==persnr[_n-1]
g lPT=0
replace lPT=1 if lempstate==2 & persnr[_n]==persnr[_n-1]
g lMJ=0
replace lMJ=1 if lempstate==3 & persnr[_n]==persnr[_n-1]
g lNE=0
replace lNE=1 if lempstate==4 & elligible[_n-1]==0 & persnr[_n]==persnr[_n-1]
g lCJ=0
replace lCJ=1 if lempstate==5 & elligible[_n-1]==0 & persnr[_n]==persnr[_n-1]
g lelligible=0
replace lelligible=1 if elligible[_n-1]==1 & persnr[_n]==persnr[_n-1]
*
*probit elligible ed2 ed3, nocons
*margins, dydx(ed2)
*margins, dydx(ed3)
probit elligible year_birth ed2 ed3 lFT lPT lMJ lNE lCJ lelligible, nocons
margins, dydx(ed2)
margins, dydx(ed3)
margins, dydx(lFT)
margins, dydx(lPT)
margins, dydx(lMJ)
margins, dydx(lNE)
margins, dydx(lCJ)
margins, dydx(lelligible)
margins, dydx(year_birth)
*
reg elligible year_birth ed2 ed3 lFT lPT lMJ lNE lCJ lelligible, nocons

***2010-2014
*
cls
use "\Preliminars_Monthly_persnr_females_20102014.dta", clear
cd ""
di "Likelihood Unemp. Benefits"
set more off
egen min_yr_birth=min(year_birth)
replace year_birth=year_birth-min_yr_birth
*
g elligible=0 if empstate==4
replace elligible=1 if unemp_ben==1
drop if elligible==.
*
g ed2=0
replace ed2=1 if educ==2
g ed3=0
replace ed3=1 if educ==3
g lFT=0
replace lFT=1 if lempstate==1 & persnr[_n]==persnr[_n-1]
g lPT=0
replace lPT=1 if lempstate==2 & persnr[_n]==persnr[_n-1]
g lMJ=0
replace lMJ=1 if lempstate==3 & persnr[_n]==persnr[_n-1]
g lNE=0
replace lNE=1 if lempstate==4 & elligible[_n-1]==0 & persnr[_n]==persnr[_n-1]
g lCJ=0
replace lCJ=1 if lempstate==5 & elligible[_n-1]==0 & persnr[_n]==persnr[_n-1]
g lelligible=0
replace lelligible=1 if elligible[_n-1]==1 & persnr[_n]==persnr[_n-1]
*
*probit elligible ed2 ed3, nocons
*margins, dydx(ed2)
*margins, dydx(ed3)
probit elligible year_birth ed2 ed3 lFT lPT lMJ lNE lCJ lelligible, nocons
margins, dydx(ed2)
margins, dydx(ed3)
margins, dydx(lFT)
margins, dydx(lPT)
margins, dydx(lMJ)
margins, dydx(lNE)
margins, dydx(lCJ)
margins, dydx(lelligible)
margins, dydx(year_birth)
*
reg elligible year_birth ed2 ed3 lFT lPT lMJ lNE lCJ lelligible, nocons
*
/*
cls
use "\Preliminars_Monthly_persnr_females_19992002.dta", clear
cd ""
di "AutoCorrelations"
set more off
*
g elligible=1 if unemp_ben==1
replace elligible=1 if empstate==1
replace elligible=1 if empstate==2
replace elligible=1 if empstate==3
*
bysort persnr: gen counter=_n
g FT=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g PT=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g MJ=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g NE=0 if counter>1 & elligible==1 & elligible[_n-1]==1
replace PT=1 if empstate==2 & counter>1 & elligible==1 & elligible[_n-1]==1
replace FT=1 if empstate==1 & counter>1 & elligible==1 & elligible[_n-1]==1
replace MJ=1 if empstate==3 & counter>1 & elligible==1 & elligible[_n-1]==1
replace NE=1 if empstate==4 & counter>1 & elligible==1 & elligible[_n-1]==1
replace FT=1 if empstate==5 & counter>1 & elligible==1 & elligible[_n-1]==1
g lFT=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g lPT=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g lMJ=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g lNE=0 if counter>1 & elligible==1 & elligible[_n-1]==1
replace lPT=1 if empstate[_n-1]==2 & counter>1 & elligible==1 & elligible[_n-1]==1
replace lFT=1 if empstate[_n-1]==1 & counter>1 & elligible==1 & elligible[_n-1]==1
replace lMJ=1 if empstate[_n-1]==3 & counter>1 & elligible==1 & elligible[_n-1]==1
replace lNE=1 if empstate[_n-1]==4 & counter>1 & elligible==1 & elligible[_n-1]==1
*
bysort persnr: g lag=log_ave_wage[_n-1] if counter>1 & elligible==1 & elligible[_n-1]==1
*
g FT_FT=1 if lFT==1 & FT==1 & elligible==1 & elligible[_n-1]==1
g PT_FT=1 if lPT==1 & FT==1 & elligible==1 & elligible[_n-1]==1
g MJ_FT=1 if lMJ==1 & FT==1 & elligible==1 & elligible[_n-1]==1
g NE_FT=1 if lNE==1 & FT==1 & elligible==1 & elligible[_n-1]==1
*
g PT_PT=1 if lPT==1 & PT==1 & elligible==1 & elligible[_n-1]==1
g MJ_PT=1 if lMJ==1 & PT==1 & elligible==1 & elligible[_n-1]==1
g NE_PT=1 if lNE==1 & PT==1 & elligible==1 & elligible[_n-1]==1
g FT_PT=1 if lFT==1 & PT==1 & elligible==1 & elligible[_n-1]==1
*
g MJ_MJ=1 if lMJ==1 & MJ==1 & elligible==1 & elligible[_n-1]==1
g NE_MJ=1 if lNE==1 & MJ==1 & elligible==1 & elligible[_n-1]==1
g FT_MJ=1 if lFT==1 & MJ==1 & elligible==1 & elligible[_n-1]==1
g PT_MJ=1 if lPT==1 & MJ==1 & elligible==1 & elligible[_n-1]==1
*
g NE_NE=1 if lNE==1 & NE==1 & elligible==1 & elligible[_n-1]==1
g FT_NE=1 if lFT==1 & NE==1 & elligible==1 & elligible[_n-1]==1
g PT_NE=1 if lPT==1 & NE==1 & elligible==1 & elligible[_n-1]==1
g MJ_NE=1 if lMJ==1 & NE==1 & elligible==1 & elligible[_n-1]==1
*
corr log_ave_wage lag if FT_FT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if PT_FT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if MJ_FT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if NE_FT==1 & elligible==1 & elligible[_n-1]==1

corr log_ave_wage lag if FT_PT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if PT_PT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if MJ_PT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if NE_PT==1 & elligible==1 & elligible[_n-1]==1

corr log_ave_wage lag if FT_MJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if PT_MJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if MJ_MJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if NE_MJ==1 & elligible==1 & elligible[_n-1]==1

corr log_ave_wage lag if FT_NE==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if PT_NE==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if MJ_NE==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if NE_NE==1 & elligible==1 & elligible[_n-1]==1

corr log_ave_wage lag if FT_FT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if FT_FT==1) (lfit log_ave_wage lag if FT_FT==1, subtitle(Correlation `corr') lwidth(thick)),  xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export FT_FT_19992002_female.png, replace
corr log_ave_wage lag if PT_FT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if PT_FT==1) (lfit log_ave_wage lag if PT_FT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export PT_FT_19992002_female.png, replace
corr log_ave_wage lag if MJ_FT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if MJ_FT==1) (lfit log_ave_wage lag if MJ_FT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export MJ_FT_19992002_female.png, replace
corr log_ave_wage lag if NE_FT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if NE_FT==1) (lfit log_ave_wage lag if NE_FT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export NE_FT_19992002_female.png, replace
*
corr log_ave_wage lag if FT_PT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if FT_PT==1) (lfit log_ave_wage lag if FT_PT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export FT_PT_19992002_female.png, replace
corr log_ave_wage lag if PT_PT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if PT_PT==1) (lfit log_ave_wage lag if PT_PT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export PT_PT_19992002_female.png, replace
corr log_ave_wage lag if MJ_PT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if MJ_PT==1) (lfit log_ave_wage lag if MJ_PT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export MJ_PT_19992002_female.png, replace
corr log_ave_wage lag if NE_PT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if NE_PT==1) (lfit log_ave_wage lag if NE_PT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export NE_PT_19992002_female.png, replace
*
corr log_ave_wage lag if FT_MJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if FT_MJ==1) (lfit log_ave_wage lag if FT_MJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export FT_MJ_19992002_female.png, replace
corr log_ave_wage lag if PT_MJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if PT_MJ==1) (lfit log_ave_wage lag if PT_MJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export PT_MJ_19992002_female.png, replace
corr log_ave_wage lag if MJ_MJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if MJ_MJ==1) (lfit log_ave_wage lag if MJ_MJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export MJ_MJ_19992002_female.png, replace
corr log_ave_wage lag if NE_MJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if NE_MJ==1) (lfit log_ave_wage lag if NE_MJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export NE_MJ_19992002_female.png, replace
*
corr log_ave_wage lag if FT_NE==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if FT_NE==1) (lfit log_ave_wage lag if FT_NE==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export FT_NE_19992002_female.png, replace
corr log_ave_wage lag if PT_NE==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if PT_NE==1) (lfit log_ave_wage lag if PT_NE==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export PT_NE_19992002_female.png, replace
corr log_ave_wage lag if MJ_NE==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if MJ_NE==1) (lfit log_ave_wage lag if MJ_NE==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export MJ_NE_19992002_female.png, replace
corr log_ave_wage lag if NE_NE==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if NE_NE==1) (lfit log_ave_wage lag if NE_NE==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export NE_NE_19992002_female.png, replace

*
cls
use "\Preliminars_Monthly_persnr_females_20052009.dta", clear
cd ""
di "AutoCorrelations"
set more off
*
g elligible=1 if unemp_ben==1
replace elligible=1 if empstate==1
replace elligible=1 if empstate==2
replace elligible=1 if empstate==3
replace elligible=1 if empstate==5
*
bysort persnr: gen counter=_n
g FT=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g PT=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g MJ=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g NE=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g CJ=0 if counter>1 & elligible==1 & elligible[_n-1]==1
replace PT=1 if empstate==2 & counter>1 & elligible==1 & elligible[_n-1]==1
replace FT=1 if empstate==1 & counter>1 & elligible==1 & elligible[_n-1]==1
replace MJ=1 if empstate==3 & counter>1 & elligible==1 & elligible[_n-1]==1
replace NE=1 if empstate==4 & counter>1 & elligible==1 & elligible[_n-1]==1
replace CJ=1 if empstate==5 & counter>1 & elligible==1 & elligible[_n-1]==1
g lFT=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g lPT=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g lMJ=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g lNE=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g lCJ=0 if counter>1 & elligible==1 & elligible[_n-1]==1
replace lPT=1 if empstate[_n-1]==2 & counter>1 & elligible==1 & elligible[_n-1]==1
replace lFT=1 if empstate[_n-1]==1 & counter>1 & elligible==1 & elligible[_n-1]==1
replace lMJ=1 if empstate[_n-1]==3 & counter>1 & elligible==1 & elligible[_n-1]==1
replace lNE=1 if empstate[_n-1]==4 & counter>1 & elligible==1 & elligible[_n-1]==1
replace lCJ=1 if empstate[_n-1]==5 & counter>1 & elligible==1 & elligible[_n-1]==1
*
bysort persnr: g lag=log_ave_wage[_n-1] if counter>1 & elligible==1 & elligible[_n-1]==1
*
g FT_FT=1 if lFT==1 & FT==1 & elligible==1 & elligible[_n-1]==1
g PT_FT=1 if lPT==1 & FT==1 & elligible==1 & elligible[_n-1]==1
g MJ_FT=1 if lMJ==1 & FT==1 & elligible==1 & elligible[_n-1]==1
g NE_FT=1 if lNE==1 & FT==1 & elligible==1 & elligible[_n-1]==1
g CJ_FT=1 if lCJ==1 & FT==1 & elligible==1 & elligible[_n-1]==1
*
g PT_PT=1 if lPT==1 & PT==1 & elligible==1 & elligible[_n-1]==1
g MJ_PT=1 if lMJ==1 & PT==1 & elligible==1 & elligible[_n-1]==1
g NE_PT=1 if lNE==1 & PT==1 & elligible==1 & elligible[_n-1]==1
g FT_PT=1 if lFT==1 & PT==1 & elligible==1 & elligible[_n-1]==1
g CJ_PT=1 if lCJ==1 & PT==1 & elligible==1 & elligible[_n-1]==1
*
g MJ_MJ=1 if lMJ==1 & MJ==1 & elligible==1 & elligible[_n-1]==1
g NE_MJ=1 if lNE==1 & MJ==1 & elligible==1 & elligible[_n-1]==1
g FT_MJ=1 if lFT==1 & MJ==1 & elligible==1 & elligible[_n-1]==1
g PT_MJ=1 if lPT==1 & MJ==1 & elligible==1 & elligible[_n-1]==1
g CJ_MJ=1 if lCJ==1 & MJ==1 & elligible==1 & elligible[_n-1]==1
*
g NE_NE=1 if lNE==1 & NE==1 & elligible==1 & elligible[_n-1]==1
g FT_NE=1 if lFT==1 & NE==1 & elligible==1 & elligible[_n-1]==1
g PT_NE=1 if lPT==1 & NE==1 & elligible==1 & elligible[_n-1]==1
g MJ_NE=1 if lMJ==1 & NE==1 & elligible==1 & elligible[_n-1]==1
g CJ_NE=1 if lCJ==1 & NE==1 & elligible==1 & elligible[_n-1]==1
*
g NE_CJ=1 if lNE==1 & CJ==1 & elligible==1 & elligible[_n-1]==1
g FT_CJ=1 if lFT==1 & CJ==1 & elligible==1 & elligible[_n-1]==1
g PT_CJ=1 if lPT==1 & CJ==1 & elligible==1 & elligible[_n-1]==1
g MJ_CJ=1 if lMJ==1 & CJ==1 & elligible==1 & elligible[_n-1]==1
g CJ_CJ=1 if lCJ==1 & CJ==1 & elligible==1 & elligible[_n-1]==1
*
corr log_ave_wage lag if FT_FT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if PT_FT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if MJ_FT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if NE_FT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if CJ_FT==1 & elligible==1 & elligible[_n-1]==1

corr log_ave_wage lag if FT_PT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if PT_PT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if MJ_PT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if NE_PT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if CJ_PT==1 & elligible==1 & elligible[_n-1]==1

corr log_ave_wage lag if FT_MJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if PT_MJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if MJ_MJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if NE_MJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if CJ_MJ==1 & elligible==1 & elligible[_n-1]==1

corr log_ave_wage lag if FT_NE==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if PT_NE==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if MJ_NE==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if NE_NE==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if CJ_NE==1 & elligible==1 & elligible[_n-1]==1

corr log_ave_wage lag if FT_CJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if PT_CJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if MJ_CJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if NE_CJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if CJ_CJ==1 & elligible==1 & elligible[_n-1]==1

corr log_ave_wage lag if FT_FT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if FT_FT==1) (lfit log_ave_wage lag if FT_FT==1, subtitle(Correlation `corr') lwidth(thick)),  xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export FT_FT_20052009_female.png, replace
corr log_ave_wage lag if PT_FT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if PT_FT==1) (lfit log_ave_wage lag if PT_FT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export PT_FT_20052009_female.png, replace
corr log_ave_wage lag if MJ_FT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if MJ_FT==1) (lfit log_ave_wage lag if MJ_FT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export MJ_FT_20052009_female.png, replace
corr log_ave_wage lag if NE_FT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if NE_FT==1) (lfit log_ave_wage lag if NE_FT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export NE_FT_20052009_female.png, replace
corr log_ave_wage lag if CJ_FT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if CJ_FT==1) (lfit log_ave_wage lag if CJ_FT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export CJ_FT_20052009_female.png, replace
*
corr log_ave_wage lag if FT_PT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if FT_PT==1) (lfit log_ave_wage lag if FT_PT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export FT_PT_20052009_female.png, replace
corr log_ave_wage lag if PT_PT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if PT_PT==1) (lfit log_ave_wage lag if PT_PT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export PT_PT_20052009_female.png, replace
corr log_ave_wage lag if MJ_PT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if MJ_PT==1) (lfit log_ave_wage lag if MJ_PT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export MJ_PT_20052009_female.png, replace
corr log_ave_wage lag if NE_PT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if NE_PT==1) (lfit log_ave_wage lag if NE_PT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export NE_PT_20052009_female.png, replace
corr log_ave_wage lag if CJ_PT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if CJ_PT==1) (lfit log_ave_wage lag if CJ_PT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export CJ_PT_20052009_female.png, replace
*
corr log_ave_wage lag if FT_MJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if FT_MJ==1) (lfit log_ave_wage lag if FT_MJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export FT_MJ_20052009_female.png, replace
corr log_ave_wage lag if PT_MJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if PT_MJ==1) (lfit log_ave_wage lag if PT_MJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export PT_MJ_20052009_female.png, replace
corr log_ave_wage lag if MJ_MJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if MJ_MJ==1) (lfit log_ave_wage lag if MJ_MJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export MJ_MJ_20052009_female.png, replace
corr log_ave_wage lag if NE_MJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if NE_MJ==1) (lfit log_ave_wage lag if NE_MJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export NE_MJ_20052009_female.png, replace
corr log_ave_wage lag if CJ_MJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if CJ_MJ==1) (lfit log_ave_wage lag if CJ_MJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export CJ_MJ_20052009_female.png, replace
*
corr log_ave_wage lag if FT_NE==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if FT_NE==1) (lfit log_ave_wage lag if FT_NE==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export FT_NE_20052009_female.png, replace
corr log_ave_wage lag if PT_NE==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if PT_NE==1) (lfit log_ave_wage lag if PT_NE==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export PT_NE_20052009_female.png, replace
corr log_ave_wage lag if MJ_NE==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if MJ_NE==1) (lfit log_ave_wage lag if MJ_NE==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export MJ_NE_20052009_female.png, replace
corr log_ave_wage lag if NE_NE==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if NE_NE==1) (lfit log_ave_wage lag if NE_NE==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export NE_NE_20052009_female.png, replace
corr log_ave_wage lag if CJ_NE==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if CJ_NE==1) (lfit log_ave_wage lag if CJ_NE==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export CJ_NE_20052009_female.png, replace
*
corr log_ave_wage lag if FT_CJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if FT_CJ==1) (lfit log_ave_wage lag if FT_CJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export FT_CJ_20052009_female.png, replace
corr log_ave_wage lag if PT_CJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if PT_CJ==1) (lfit log_ave_wage lag if PT_CJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export PT_CJ_20052009_female.png, replace
corr log_ave_wage lag if MJ_CJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if MJ_CJ==1) (lfit log_ave_wage lag if MJ_CJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export MJ_CJ_20052009_female.png, replace
corr log_ave_wage lag if NE_CJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if NE_CJ==1) (lfit log_ave_wage lag if NE_CJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export NE_CJ_20052009_female.png, replace
corr log_ave_wage lag if CJ_CJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if CJ_CJ==1) (lfit log_ave_wage lag if CJ_CJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export CJ_CJ_20052009_female.png, replace

*2010-2014

*
cls
set more off
use "\Preliminars_Monthly_persnr_females_20102014.dta", clear
di "Income Mobility"
set more off
bysort persnr: gen counter=_n
*
g group_month=(12*(year-2010))+month
*
bysort group_month: egen p20 = pctile(log_ave_wage), p(20)
bysort group_month: egen p40 = pctile(log_ave_wage), p(40)
bysort group_month: egen p60 = pctile(log_ave_wage), p(60)
bysort group_month: egen p80 = pctile(log_ave_wage), p(80)
g elligible=1 if unemp_ben==1
replace elligible=1 if empstate==1
replace elligible=1 if empstate==2
replace elligible=1 if empstate==3
replace elligible=1 if empstate==5
*
sort persnr year month
*
g d1=0 if counter>1 & elligible==1
g d2=0 if counter>1 & elligible==1
g d3=0 if counter>1 & elligible==1
g d4=0 if counter>1 & elligible==1
g d5=0 if counter>1 & elligible==1
*
replace d1=1 if log_ave_wage<p20 & counter>1 & elligible==1
replace d2=1 if log_ave_wage>p20 & log_ave_wage<p40 & counter>1 & elligible==1
replace d3=1 if log_ave_wage>p40 & log_ave_wage<p60 & counter>1 & elligible==1
replace d4=1 if log_ave_wage>p60 & log_ave_wage<p80 & counter>1 & elligible==1
replace d5=1 if log_ave_wage>p80 & counter>1 & elligible==1
*
g d1_d1=0 if counter>2 & elligible==1
g d1_d2=0 if counter>2 & elligible==1
g d1_d3=0 if counter>2 & elligible==1
g d1_d4=0 if counter>2 & elligible==1
g d1_d5=0 if counter>2 & elligible==1
g d2_d1=0 if counter>2 & elligible==1
g d2_d2=0 if counter>2 & elligible==1
g d2_d3=0 if counter>2 & elligible==1
g d2_d4=0 if counter>2 & elligible==1
g d2_d5=0 if counter>2 & elligible==1
g d3_d1=0 if counter>2 & elligible==1
g d3_d2=0 if counter>2 & elligible==1
g d3_d3=0 if counter>2 & elligible==1
g d3_d4=0 if counter>2 & elligible==1
g d3_d5=0 if counter>2 & elligible==1
g d4_d1=0 if counter>2 & elligible==1
g d4_d2=0 if counter>2 & elligible==1
g d4_d3=0 if counter>2 & elligible==1
g d4_d4=0 if counter>2 & elligible==1
g d4_d5=0 if counter>2 & elligible==1
g d5_d1=0 if counter>2 & elligible==1
g d5_d2=0 if counter>2 & elligible==1
g d5_d3=0 if counter>2 & elligible==1
g d5_d4=0 if counter>2 & elligible==1
g d5_d5=0 if counter>2 & elligible==1
*
sort persnr year month
bysort persnr: replace d1_d1=1 if d1==1 & d1[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d1_d2=1 if d2==1 & d1[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d1_d3=1 if d3==1 & d1[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d1_d4=1 if d4==1 & d1[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d1_d5=1 if d5==1 & d1[_n-1]==1 & counter>2 & elligible==1
*
bysort persnr: replace d2_d1=1 if d1==1 & d2[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d2_d2=1 if d2==1 & d2[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d2_d3=1 if d3==1 & d2[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d2_d4=1 if d4==1 & d2[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d2_d5=1 if d5==1 & d2[_n-1]==1 & counter>2 & elligible==1
*
bysort persnr: replace d3_d1=1 if d1==1 & d3[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d3_d2=1 if d2==1 & d3[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d3_d3=1 if d3==1 & d3[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d3_d4=1 if d4==1 & d3[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d3_d5=1 if d5==1 & d3[_n-1]==1 & counter>2 & elligible==1
*
bysort persnr: replace d4_d1=1 if d1==1 & d4[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d4_d2=1 if d2==1 & d4[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d4_d3=1 if d3==1 & d4[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d4_d4=1 if d4==1 & d4[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d4_d5=1 if d5==1 & d4[_n-1]==1 & counter>2 & elligible==1
*
bysort persnr: replace d5_d1=1 if d1==1 & d5[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d5_d2=1 if d2==1 & d5[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d5_d3=1 if d3==1 & d5[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d5_d4=1 if d4==1 & d5[_n-1]==1 & counter>2 & elligible==1
bysort persnr: replace d5_d5=1 if d5==1 & d5[_n-1]==1 & counter>2 & elligible==1
*
egen tot_d1=total(d1)
egen tot_d2=total(d2)
egen tot_d3=total(d3)
egen tot_d4=total(d4)
egen tot_d5=total(d5)
*
egen tot_d1_d1=total(d1_d1)
egen tot_d1_d2=total(d1_d2)
egen tot_d1_d3=total(d1_d3)
egen tot_d1_d4=total(d1_d4)
egen tot_d1_d5=total(d1_d5)
*
egen tot_d2_d1=total(d2_d1)
egen tot_d2_d2=total(d2_d2)
egen tot_d2_d3=total(d2_d3)
egen tot_d2_d4=total(d2_d4)
egen tot_d2_d5=total(d2_d5)
*
egen tot_d3_d1=total(d3_d1)
egen tot_d3_d2=total(d3_d2)
egen tot_d3_d3=total(d3_d3)
egen tot_d3_d4=total(d3_d4)
egen tot_d3_d5=total(d3_d5)
*
egen tot_d4_d1=total(d4_d1)
egen tot_d4_d2=total(d4_d2)
egen tot_d4_d3=total(d4_d3)
egen tot_d4_d4=total(d4_d4)
egen tot_d4_d5=total(d4_d5)
*
egen tot_d5_d1=total(d5_d1)
egen tot_d5_d2=total(d5_d2)
egen tot_d5_d3=total(d5_d3)
egen tot_d5_d4=total(d5_d4)
egen tot_d5_d5=total(d5_d5)
*
g avg_d1_d1=tot_d1_d1/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
g avg_d1_d2=tot_d1_d2/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
g avg_d1_d3=tot_d1_d3/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
g avg_d1_d4=tot_d1_d4/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
g avg_d1_d5=tot_d1_d5/(tot_d1_d1+tot_d1_d2+tot_d1_d3+tot_d1_d4+tot_d1_d5)
*
g avg_d2_d1=tot_d2_d1/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
g avg_d2_d2=tot_d2_d2/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
g avg_d2_d3=tot_d2_d3/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
g avg_d2_d4=tot_d2_d4/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
g avg_d2_d5=tot_d2_d5/(tot_d2_d1+tot_d2_d2+tot_d2_d3+tot_d2_d4+tot_d1_d5)
*
g avg_d3_d1=tot_d3_d1/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
g avg_d3_d2=tot_d3_d2/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
g avg_d3_d3=tot_d3_d3/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
g avg_d3_d4=tot_d3_d4/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
g avg_d3_d5=tot_d3_d5/(tot_d3_d1+tot_d3_d2+tot_d3_d3+tot_d3_d4+tot_d3_d5)
*
g avg_d4_d1=tot_d4_d1/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
g avg_d4_d2=tot_d4_d2/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
g avg_d4_d3=tot_d4_d3/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
g avg_d4_d4=tot_d4_d4/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
g avg_d4_d5=tot_d4_d5/(tot_d4_d1+tot_d4_d2+tot_d4_d3+tot_d4_d4+tot_d4_d5)
*
g avg_d5_d1=tot_d5_d1/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
g avg_d5_d2=tot_d5_d2/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
g avg_d5_d3=tot_d5_d3/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
g avg_d5_d4=tot_d5_d4/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
g avg_d5_d5=tot_d5_d5/(tot_d5_d1+tot_d5_d2+tot_d5_d3+tot_d5_d4+tot_d5_d5)
*
sum avg*

*
cls
use "\Preliminars_Monthly_persnr_females_20102014.dta", clear
di "State Mobility"
set more off
bysort persnr: gen counter=_n
g FT=0 if counter>1
g PT=0 if counter>1
g MJ=0 if counter>1
g NE=0 if counter>1
g CJ=0 if counter>1
replace PT=1 if empstate==2 & counter>1
replace FT=1 if empstate==1 & counter>1
replace MJ=1 if empstate==3 & counter>1
replace NE=1 if empstate==4 & counter>1
replace CJ=1 if empstate==5 & counter>1
g lFT=0 if counter>1
g lPT=0 if counter>1
g lMJ=0 if counter>1
g lNE=0 if counter>1
g lCJ=0 if counter>1
replace lPT=1 if empstate[_n-1]==2 & counter>1
replace lFT=1 if empstate[_n-1]==1 & counter>1
replace lMJ=1 if empstate[_n-1]==3 & counter>1
replace lNE=1 if empstate[_n-1]==4 & counter>1
replace lCJ=1 if empstate[_n-1]==5 & counter>1
*
g FT_FT=0 if counter>1
g FT_PT=0 if counter>1
g FT_MJ=0 if counter>1
g FT_NE=0 if counter>1
g FT_CJ=0 if counter>1
*
g PT_FT=0 if counter>1
g PT_PT=0 if counter>1
g PT_MJ=0 if counter>1
g PT_NE=0 if counter>1
g PT_CJ=0 if counter>1
*
g MJ_FT=0 if counter>1
g MJ_PT=0 if counter>1
g MJ_MJ=0 if counter>1
g MJ_NE=0 if counter>1
g MJ_CJ=0 if counter>1
*
g NE_FT=0 if counter>1
g NE_PT=0 if counter>1
g NE_MJ=0 if counter>1
g NE_NE=0 if counter>1
g NE_CJ=0 if counter>1
*
g CJ_FT=0 if counter>1
g CJ_PT=0 if counter>1
g CJ_MJ=0 if counter>1
g CJ_NE=0 if counter>1
g CJ_CJ=0 if counter>1
*
replace FT_FT=1 if counter>1 & lFT==1 & FT==1
replace FT_PT=1 if counter>1 & lFT==1 & PT==1
replace FT_MJ=1 if counter>1 & lFT==1 & MJ==1
replace FT_NE=1 if counter>1 & lFT==1 & NE==1
replace FT_CJ=1 if counter>1 & lFT==1 & CJ==1
*
replace PT_FT=1 if counter>1 & lPT==1 & FT==1
replace PT_PT=1 if counter>1 & lPT==1 & PT==1
replace PT_MJ=1 if counter>1 & lPT==1 & MJ==1
replace PT_NE=1 if counter>1 & lPT==1 & NE==1
replace PT_CJ=1 if counter>1 & lPT==1 & CJ==1
*
replace MJ_FT=1 if counter>1 & lMJ==1 & FT==1
replace MJ_PT=1 if counter>1 & lMJ==1 & PT==1
replace MJ_MJ=1 if counter>1 & lMJ==1 & MJ==1
replace MJ_NE=1 if counter>1 & lMJ==1 & NE==1
replace MJ_CJ=1 if counter>1 & lMJ==1 & CJ==1
*
replace NE_FT=1 if counter>1 & lNE==1 & FT==1
replace NE_PT=1 if counter>1 & lNE==1 & PT==1
replace NE_MJ=1 if counter>1 & lNE==1 & MJ==1
replace NE_NE=1 if counter>1 & lNE==1 & NE==1
replace NE_CJ=1 if counter>1 & lNE==1 & CJ==1
*
replace CJ_FT=1 if counter>1 & lCJ==1 & FT==1
replace CJ_PT=1 if counter>1 & lCJ==1 & PT==1
replace CJ_MJ=1 if counter>1 & lCJ==1 & MJ==1
replace CJ_NE=1 if counter>1 & lCJ==1 & NE==1
replace CJ_CJ=1 if counter>1 & lCJ==1 & CJ==1
*
egen tot_FT=total(lFT)
egen tot_PT=total(lPT)
egen tot_MJ=total(lMJ)
egen tot_NE=total(lNE)
egen tot_CJ=total(lCJ)
*
egen tot_FT_FT=total(FT_FT)
egen tot_FT_PT=total(FT_PT)
egen tot_FT_MJ=total(FT_MJ)
egen tot_FT_NE=total(FT_NE)
egen tot_FT_CJ=total(FT_CJ)
*
egen tot_PT_FT=total(PT_FT)
egen tot_PT_PT=total(PT_PT)
egen tot_PT_MJ=total(PT_MJ)
egen tot_PT_NE=total(PT_NE)
egen tot_PT_CJ=total(PT_CJ)
*
egen tot_MJ_FT=total(MJ_FT)
egen tot_MJ_PT=total(MJ_PT)
egen tot_MJ_MJ=total(MJ_MJ)
egen tot_MJ_NE=total(MJ_NE)
egen tot_MJ_CJ=total(MJ_CJ)
*
egen tot_NE_FT=total(NE_FT)
egen tot_NE_PT=total(NE_PT)
egen tot_NE_MJ=total(NE_MJ)
egen tot_NE_NE=total(NE_NE)
egen tot_NE_CJ=total(NE_CJ)
*
egen tot_CJ_FT=total(CJ_FT)
egen tot_CJ_PT=total(CJ_PT)
egen tot_CJ_MJ=total(CJ_MJ)
egen tot_CJ_NE=total(CJ_NE)
egen tot_CJ_CJ=total(CJ_CJ)
*
g fract_FT_FT=tot_FT_FT/tot_FT
g fract_FT_PT=tot_FT_PT/tot_FT
g fract_FT_MJ=tot_FT_MJ/tot_FT
g fract_FT_NE=tot_FT_NE/tot_FT
g fract_FT_CJ=tot_FT_CJ/tot_FT
*
g fract_PT_FT=tot_PT_FT/tot_PT
g fract_PT_PT=tot_PT_PT/tot_PT
g fract_PT_MJ=tot_PT_MJ/tot_PT
g fract_PT_NE=tot_PT_NE/tot_PT
g fract_PT_CJ=tot_PT_CJ/tot_PT
*
g fract_MJ_FT=tot_MJ_FT/tot_MJ
g fract_MJ_PT=tot_MJ_PT/tot_MJ
g fract_MJ_MJ=tot_MJ_MJ/tot_MJ
g fract_MJ_NE=tot_MJ_NE/tot_MJ
g fract_MJ_CJ=tot_MJ_CJ/tot_MJ
*
g fract_NE_FT=tot_NE_FT/tot_NE
g fract_NE_PT=tot_NE_PT/tot_NE
g fract_NE_MJ=tot_NE_MJ/tot_NE
g fract_NE_NE=tot_NE_NE/tot_NE
g fract_NE_CJ=tot_NE_CJ/tot_NE
*
g fract_CJ_FT=tot_CJ_FT/tot_CJ
g fract_CJ_PT=tot_CJ_PT/tot_CJ
g fract_CJ_MJ=tot_CJ_MJ/tot_CJ
g fract_CJ_NE=tot_CJ_NE/tot_CJ
g fract_CJ_CJ=tot_CJ_CJ/tot_CJ
*
sum fract*
*
cls
use "\Preliminars_Monthly_persnr_females_20102014.dta", clear
set more off
di "Initial State"
bysort persnr: gen counter=_n
g FT=0 if counter==1
g PT=0 if counter==1
g MJ=0 if counter==1
g NE=0 if counter==1
g CJ=0 if counter==1
replace PT=1 if empstate==2 & counter==1
replace FT=1 if empstate==1 & counter==1
replace MJ=1 if empstate==3 & counter==1
replace NE=1 if empstate==4 & counter==1
replace CJ=1 if empstate==5 & counter==1
sum FT PT MJ NE CJ

cls
set more off
use "\Preliminars_Monthly_persnr_females_20102014.dta", clear
di "Subsequent State"
bysort persnr: gen counter=_n
g FT=0 if counter>1
g PT=0 if counter>1
g MJ=0 if counter>1
g NE=0 if counter>1
g CJ=0 if counter>1
replace PT=1 if empstate==2 & counter>1
replace FT=1 if empstate==1 & counter>1
replace MJ=1 if empstate==3 & counter>1
replace NE=1 if empstate==4 & counter>1
replace CJ=1 if empstate==5 & counter>1
sum FT PT MJ NE CJ

cls
set more off
use "\Preliminars_Monthly_persnr_females_20102014.dta", clear
di "CS Wage Moments"
set more off
g elligible=1 if unemp_ben==1
replace elligible=1 if empstate==1
replace elligible=1 if empstate==2
replace elligible=1 if empstate==3
replace elligible=1 if empstate==5
bysort persnr: gen counter=_n
g FT=0 if counter>1 & elligible==1
g PT=0 if counter>1 & elligible==1
g MJ=0 if counter>1 & elligible==1
g NE=0 if counter>1 & elligible==1
g CJ=0 if counter>1 & elligible==1
replace PT=1 if empstate==2 & counter>1 & elligible==1
replace FT=1 if empstate==1 & counter>1 & elligible==1
replace MJ=1 if empstate==3 & counter>1 & elligible==1
replace NE=1 if empstate==4 & counter>1 & elligible==1
replace CJ=1 if empstate==5 & counter>1 & elligible==1
*
sum log_ave_wage if elligible==1
sum log_ave_wage if FT==1 & elligible==1
sum log_ave_wage if PT==1 & elligible==1
sum log_ave_wage if MJ==1 & elligible==1
sum log_ave_wage if NE==1 & elligible==1
sum log_ave_wage if CJ==1 & elligible==1

*
cls
use "\Preliminars_Monthly_persnr_females_20102014.dta", clear
cd ""
di "AutoCorrelations"
set more off
*
g elligible=1 if unemp_ben==1
replace elligible=1 if empstate==1
replace elligible=1 if empstate==2
replace elligible=1 if empstate==3
replace elligible=1 if empstate==5
*
bysort persnr: gen counter=_n
g FT=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g PT=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g MJ=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g NE=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g CJ=0 if counter>1 & elligible==1 & elligible[_n-1]==1
replace PT=1 if empstate==2 & counter>1 & elligible==1 & elligible[_n-1]==1
replace FT=1 if empstate==1 & counter>1 & elligible==1 & elligible[_n-1]==1
replace MJ=1 if empstate==3 & counter>1 & elligible==1 & elligible[_n-1]==1
replace NE=1 if empstate==4 & counter>1 & elligible==1 & elligible[_n-1]==1
replace CJ=1 if empstate==5 & counter>1 & elligible==1 & elligible[_n-1]==1
g lFT=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g lPT=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g lMJ=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g lNE=0 if counter>1 & elligible==1 & elligible[_n-1]==1
g lCJ=0 if counter>1 & elligible==1 & elligible[_n-1]==1
replace lPT=1 if empstate[_n-1]==2 & counter>1 & elligible==1 & elligible[_n-1]==1
replace lFT=1 if empstate[_n-1]==1 & counter>1 & elligible==1 & elligible[_n-1]==1
replace lMJ=1 if empstate[_n-1]==3 & counter>1 & elligible==1 & elligible[_n-1]==1
replace lNE=1 if empstate[_n-1]==4 & counter>1 & elligible==1 & elligible[_n-1]==1
replace lCJ=1 if empstate[_n-1]==5 & counter>1 & elligible==1 & elligible[_n-1]==1
*
bysort persnr: g lag=log_ave_wage[_n-1] if counter>1 & elligible==1 & elligible[_n-1]==1
*
g FT_FT=1 if lFT==1 & FT==1 & elligible==1 & elligible[_n-1]==1
g PT_FT=1 if lPT==1 & FT==1 & elligible==1 & elligible[_n-1]==1
g MJ_FT=1 if lMJ==1 & FT==1 & elligible==1 & elligible[_n-1]==1
g NE_FT=1 if lNE==1 & FT==1 & elligible==1 & elligible[_n-1]==1
g CJ_FT=1 if lCJ==1 & FT==1 & elligible==1 & elligible[_n-1]==1
*
g PT_PT=1 if lPT==1 & PT==1 & elligible==1 & elligible[_n-1]==1
g MJ_PT=1 if lMJ==1 & PT==1 & elligible==1 & elligible[_n-1]==1
g NE_PT=1 if lNE==1 & PT==1 & elligible==1 & elligible[_n-1]==1
g FT_PT=1 if lFT==1 & PT==1 & elligible==1 & elligible[_n-1]==1
g CJ_PT=1 if lCJ==1 & PT==1 & elligible==1 & elligible[_n-1]==1
*
g MJ_MJ=1 if lMJ==1 & MJ==1 & elligible==1 & elligible[_n-1]==1
g NE_MJ=1 if lNE==1 & MJ==1 & elligible==1 & elligible[_n-1]==1
g FT_MJ=1 if lFT==1 & MJ==1 & elligible==1 & elligible[_n-1]==1
g PT_MJ=1 if lPT==1 & MJ==1 & elligible==1 & elligible[_n-1]==1
g CJ_MJ=1 if lCJ==1 & MJ==1 & elligible==1 & elligible[_n-1]==1
*
g NE_NE=1 if lNE==1 & NE==1 & elligible==1 & elligible[_n-1]==1
g FT_NE=1 if lFT==1 & NE==1 & elligible==1 & elligible[_n-1]==1
g PT_NE=1 if lPT==1 & NE==1 & elligible==1 & elligible[_n-1]==1
g MJ_NE=1 if lMJ==1 & NE==1 & elligible==1 & elligible[_n-1]==1
g CJ_NE=1 if lCJ==1 & NE==1 & elligible==1 & elligible[_n-1]==1
*
g NE_CJ=1 if lNE==1 & CJ==1 & elligible==1 & elligible[_n-1]==1
g FT_CJ=1 if lFT==1 & CJ==1 & elligible==1 & elligible[_n-1]==1
g PT_CJ=1 if lPT==1 & CJ==1 & elligible==1 & elligible[_n-1]==1
g MJ_CJ=1 if lMJ==1 & CJ==1 & elligible==1 & elligible[_n-1]==1
g CJ_CJ=1 if lCJ==1 & CJ==1 & elligible==1 & elligible[_n-1]==1
*
corr log_ave_wage lag if FT_FT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if PT_FT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if MJ_FT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if NE_FT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if CJ_FT==1 & elligible==1 & elligible[_n-1]==1

corr log_ave_wage lag if FT_PT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if PT_PT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if MJ_PT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if NE_PT==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if CJ_PT==1 & elligible==1 & elligible[_n-1]==1

corr log_ave_wage lag if FT_MJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if PT_MJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if MJ_MJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if NE_MJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if CJ_MJ==1 & elligible==1 & elligible[_n-1]==1

corr log_ave_wage lag if FT_NE==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if PT_NE==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if MJ_NE==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if NE_NE==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if CJ_NE==1 & elligible==1 & elligible[_n-1]==1

corr log_ave_wage lag if FT_CJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if PT_CJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if MJ_CJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if NE_CJ==1 & elligible==1 & elligible[_n-1]==1
corr log_ave_wage lag if CJ_CJ==1 & elligible==1 & elligible[_n-1]==1

corr log_ave_wage lag if FT_FT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if FT_FT==1) (lfit log_ave_wage lag if FT_FT==1, subtitle(Correlation `corr') lwidth(thick)),  xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export FT_FT_20102014_female.png, replace
corr log_ave_wage lag if PT_FT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if PT_FT==1) (lfit log_ave_wage lag if PT_FT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export PT_FT_20102014_female.png, replace
corr log_ave_wage lag if MJ_FT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if MJ_FT==1) (lfit log_ave_wage lag if MJ_FT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export MJ_FT_20102014_female.png, replace
corr log_ave_wage lag if NE_FT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if NE_FT==1) (lfit log_ave_wage lag if NE_FT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export NE_FT_20102014_female.png, replace
corr log_ave_wage lag if CJ_FT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if CJ_FT==1) (lfit log_ave_wage lag if CJ_FT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export CJ_FT_20102014_female.png, replace
*
corr log_ave_wage lag if FT_PT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if FT_PT==1) (lfit log_ave_wage lag if FT_PT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export FT_PT_20102014_female.png, replace
corr log_ave_wage lag if PT_PT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if PT_PT==1) (lfit log_ave_wage lag if PT_PT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export PT_PT_20102014_female.png, replace
corr log_ave_wage lag if MJ_PT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if MJ_PT==1) (lfit log_ave_wage lag if MJ_PT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export MJ_PT_20102014_female.png, replace
corr log_ave_wage lag if NE_PT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if NE_PT==1) (lfit log_ave_wage lag if NE_PT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export NE_PT_20102014_female.png, replace
corr log_ave_wage lag if CJ_PT==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if CJ_PT==1) (lfit log_ave_wage lag if CJ_PT==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export CJ_PT_20102014_female.png, replace
*
corr log_ave_wage lag if FT_MJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if FT_MJ==1) (lfit log_ave_wage lag if FT_MJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export FT_MJ_20102014_female.png, replace
corr log_ave_wage lag if PT_MJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if PT_MJ==1) (lfit log_ave_wage lag if PT_MJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export PT_MJ_20102014_female.png, replace
corr log_ave_wage lag if MJ_MJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if MJ_MJ==1) (lfit log_ave_wage lag if MJ_MJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export MJ_MJ_20102014_female.png, replace
corr log_ave_wage lag if NE_MJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if NE_MJ==1) (lfit log_ave_wage lag if NE_MJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export NE_MJ_20102014_female.png, replace
corr log_ave_wage lag if CJ_MJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if CJ_MJ==1) (lfit log_ave_wage lag if CJ_MJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export CJ_MJ_20102014_female.png, replace
*
corr log_ave_wage lag if FT_NE==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if FT_NE==1) (lfit log_ave_wage lag if FT_NE==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export FT_NE_20102014_female.png, replace
corr log_ave_wage lag if PT_NE==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if PT_NE==1) (lfit log_ave_wage lag if PT_NE==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export PT_NE_20102014_female.png, replace
corr log_ave_wage lag if MJ_NE==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if MJ_NE==1) (lfit log_ave_wage lag if MJ_NE==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export MJ_NE_20102014_female.png, replace
corr log_ave_wage lag if NE_NE==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if NE_NE==1) (lfit log_ave_wage lag if NE_NE==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export NE_NE_20102014_female.png, replace
corr log_ave_wage lag if CJ_NE==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if CJ_NE==1) (lfit log_ave_wage lag if CJ_NE==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export CJ_NE_20102014_female.png, replace
*
corr log_ave_wage lag if FT_CJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if FT_CJ==1) (lfit log_ave_wage lag if FT_CJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export FT_CJ_20102014_female.png, replace
corr log_ave_wage lag if PT_CJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if PT_CJ==1) (lfit log_ave_wage lag if PT_CJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export PT_CJ_20102014_female.png, replace
corr log_ave_wage lag if MJ_CJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if MJ_CJ==1) (lfit log_ave_wage lag if MJ_CJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export MJ_CJ_20102014_female.png, replace
corr log_ave_wage lag if NE_CJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if NE_CJ==1) (lfit log_ave_wage lag if NE_CJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export NE_CJ_20102014_female.png, replace
corr log_ave_wage lag if CJ_CJ==1
local corr : di %4.3f r(rho)
twoway (scatter log_ave_wage lag if CJ_CJ==1) (lfit log_ave_wage lag if CJ_CJ==1, subtitle(Correlation `corr') lwidth(thick)), xlabel(3 (1) 12, labsize(large)) ylabel(3 (1) 12,  labsize(large)) ytitle("Log Monthly Earnings t", size(vlarge) height(10)) legend(off) graphregion(color(white)) xtitle("Log Monthly Earnings t-1", size(vlarge) height(10))
graph export CJ_CJ_20102014_female.png, replace
