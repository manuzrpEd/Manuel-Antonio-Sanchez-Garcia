cls
set more off

*** all

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months.dta",clear
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months_fem.dta"
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

drop if age==.

gen monthly_income=def_daily_wage*max_days_full if FT==1
replace monthly_income=def_daily_wage*max_days_part if PT==1
replace monthly_income=def_daily_wage*max_days_mini if MJ==1

gen log_monthly_income=log(monthly_income)

bysort year age: egen ave=mean(log_monthly_income) if female==0
bysort year age: egen ave_fem=mean(log_monthly_income) if female==1

bysort year age: egen ave_FT=mean(log_monthly_income) if female==0 & FT==1
bysort year age: egen ave_FT_fem=mean(log_monthly_income) if female==1 & FT==1

bysort year age: egen ave_PT=mean(log_monthly_income) if female==0 & PT==1
bysort year age: egen ave_PT_fem=mean(log_monthly_income) if female==1 & PT==1

bysort year age: egen ave_MJ=mean(log_monthly_income) if female==0 & MJ==1
bysort year age: egen ave_MJ_fem=mean(log_monthly_income) if female==1 & MJ==1

*bysort year age: egen sd=sd(monthly_income) if female==0
*bysort year age: egen sd_fem=sd(monthly_income) if female==1

*replace sd=sd^2
*replace sd_fem=sd_fem^2

*bysort year age: egen p85=pctile(monthly_income) if female==0, p(90)
*bysort year age: egen p85_fem=pctile(monthly_income) if female==1, p(90)
*bysort year age: egen p15=pctile(monthly_income) if female==0, p(10)
*bysort year age: egen p15_fem=pctile(monthly_income) if female==1, p(10)
*gen p85_p15=p85/p15 if female==0
*gen p85_p15_fem=p85_fem/p15_fem if female==1

label variable ave "Males"
label variable ave_fem "Females"

*label variable sd "Males"
*label variable sd_fem "Females"

scatter ave ave_fem age if year==1998, ytitle({bf:Average}, size(large) height(10)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export ave_age_1998.png, replace

scatter ave ave_fem age if year==1999, ytitle({bf:Average}, size(large) height(10)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export ave_age_1999.png, replace

scatter ave ave_fem age if year==2005, ytitle({bf:Average}, size(large) height(10)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export ave_age_2005.png, replace

scatter ave_FT ave_FT_fem age if year==2005, ytitle({bf:Average}, size(large) height(10)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export ave_FT_age_2005.png, replace

scatter ave_PT ave_PT_fem age if year==2005, ytitle({bf:Average}, size(large) height(10)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export ave_PT_age_2005.png, replace

scatter ave_MJ ave_MJ_fem age if year==2005, ytitle({bf:Average}, size(large) height(10)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export ave_MJ_age_2005.png, replace

*scatter sd sd_fem age if year==1998, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
*graph export sd_age_1998.png, replace

*scatter sd sd_fem age if year==1999, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
*graph export sd_age_1999.png, replace

*scatter sd sd_fem age if year==2005, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
*graph export sd_age_2005.png, replace

*scatter p85_p15 p85_p15_fem age if year==1998, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
*graph export p85_p15_age_1998.png, replace

*scatter p85_p15 p85_p15_fem age if year==1999, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
*graph export p85_p15_age_1999.png, replace

*scatter p85_p15 p85_p15_fem age if year==2005, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
*graph export p85_p15_age_2005.png, replace



*exit






***
cls
set more off

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_2.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
label language EN
*drop if civil_servant==1
keep if sample==21 | sample==23

qui drop if age<24
qui drop if age>55

drop if form==0

gen aage=age-23
gen aage2=aage^2

gen full=1 if form==1
replace full=0 if form!=1

gen part=1 if form==2
replace part=0 if form!=2

gen mini=1 if form==3
replace mini=0 if form!=3

drop if educ_years<0

***MALES

**1998
qui reg labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==1998 & female==0
regeffectsize
ineqrbd labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==1998 & female==0, noregression
*rego labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==1998 & female==0
**1999
qui reg labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==1999 & female==0
regeffectsize
ineqrbd labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==1999 & female==0, noregression
*rego labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==1999 & female==0
**2005
qui reg labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==2005 & female==0
regeffectsize
ineqrbd labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==2005 & female==0, noregression
*rego labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==2005 & female==0

***FEMALES

qui reg labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==1998 & female==1
regeffectsize
ineqrbd labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==1998 & female==1, noregression
*rego labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==1998 & female==1
**1999
qui reg labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==1999 & female==1
regeffectsize
ineqrbd labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==1999 & female==1, noregression
*rego labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==1999 & female==1
**2005
qui reg labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==2005 & female==1
regeffectsize
ineqrbd labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==2005 & female==1, noregression
*rego labor_earnings_month full mini educ_years aage aage2 weekly_hours if year==2005 & female==1


*exit


cls
set more off
*** Variance Decomposition
*net from http://research.uni-leipzig.de/*rego
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months.dta",clear
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months_fem.dta"
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

***gen monthly income

gen monthly_income=def_daily_wage*max_days_full if FT==1
replace monthly_income=def_daily_wage*max_days_part if PT==1
replace monthly_income=def_daily_wage*max_days_mini if MJ==1

gen fform=1 if FT==1
replace fform=2 if PT==1
replace fform=3 if MJ==1

drop counter_month

sort persnr year month_begepi
bysort persnr: gen counter_month=_n

xtset persnr counter_month
/*
pvar monthly_income fform educ age requirement

pvarfevd
*/
*domin monthly_income fform educ age requirement if year==2005
*xtrifreg monthly_income full mini educ aage aage2 requirement max_days_month, fe i(persnr) q(90)
*xtmixed monthly_income educ age requirement fform if year==2005

gen aage=age-23
gen aage2=aage^2

gen full=1 if FT==1
replace full=0 if PT==1
replace full=0 if MJ==1

gen part=1 if PT==1
replace part=0 if FT==1
replace part=0 if MJ==1

gen mini=1 if MJ==1
replace mini=0 if PT==1
replace mini=0 if FT==1

***MALES

**1998
qui reg monthly_income full educ aage aage2 requirement max_days_month if year==1998 & month_begepi==6 & female==0
regeffectsize
ineqrbd monthly_income full educ aage aage2 requirement max_days_month if year==1998 & month_begepi==6 & female==0, noregression
*rego monthly_income full educ aage aage2 requirement max_days_month if year==1998 & month_begepi==6 & female==0
**1999
qui reg monthly_income full mini educ aage aage2 requirement max_days_month if year==1999 & month_begepi==6 & female==0
regeffectsize
ineqrbd monthly_income full mini educ aage aage2 requirement max_days_month if year==1999 & month_begepi==6 & female==0, noregression
*rego monthly_income full mini educ aage aage2 requirement max_days_month if year==1999 & month_begepi==6 & female==0

*http://labourstats.blogspot.co.uk/2017/02/making-sense-of-measuring-effect-size.html
*
qui reg monthly_income full mini educ aage aage2 requirement max_days_month if year==2005 & month_begepi==6 & female==0
regeffectsize
*f is a variable:
*    r(sf_Zf), r(mean_Zf),               proportionate inequality contribution, mean, 
*    r(sd_Zf), r(cv_Zf)                  standard deviation, CV for each of variables
*                                        in rhsvars, where "f" is an integer
*                                        1,..., K, indicating the order in which entered in 
*                                        rhsvars.
ineqrbd monthly_income full mini educ aage aage2 requirement max_days_month if year==2005 & month_begepi==6 & female==0, noregression
*
*share of explained variance (measured by R-squared) into contributions by indvidual regressor variables
*rego monthly_income full mini educ aage aage2 requirement max_days_month if year==2005 & month_begepi==6 & female==0







***FEMALES

**1998
qui reg monthly_income full educ aage aage2 requirement max_days_month if year==1998 & month_begepi==6 & female==1
regeffectsize
ineqrbd monthly_income full educ aage aage2 requirement max_days_month if year==1998 & month_begepi==6 & female==1, noregression
*rego monthly_income full educ aage aage2 requirement max_days_month if year==1998 & month_begepi==6 & female==1
**1999
qui reg monthly_income full mini educ aage aage2 requirement max_days_month if year==1999 & month_begepi==6 & female==1
regeffectsize
ineqrbd monthly_income full mini educ aage aage2 requirement max_days_month if year==1999 & month_begepi==6 & female==1, noregression
*rego monthly_income full mini educ aage aage2 requirement max_days_month if year==1999 & month_begepi==6 & female==1
**2005
qui reg monthly_income full mini educ aage aage2 requirement max_days_month if year==2005 & month_begepi==6 & female==1
regeffectsize
ineqrbd monthly_income full mini educ aage aage2 requirement max_days_month if year==2005 & month_begepi==6 & female==1, noregression
*rego monthly_income full mini educ aage aage2 requirement max_days_month if year==2005 & month_begepi==6 & female==1

*exit

cls
set more off

*compl*exity of tasks:
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months.dta",clear
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months_fem.dta"
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

drop if requirement==.

bysort year requirement: egen mean_FT=mean(FT) if female==0
bysort year requirement: egen mean_FT_fem=mean(FT) if female==1

bysort year requirement: egen mean_MJ=mean(MJ) if female==0
bysort year requirement: egen mean_MJ_fem=mean(MJ) if female==1

label variable mean_FT "Males"
label variable mean_FT_fem "Females"
label variable mean_MJ "Males"
label variable mean_MJ_fem "Females"

scatter mean_FT mean_FT_fem requirement if year==1998, connect(l l) ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Educ}, size(large) height(7)) xlabel(1 (1) 4,labsize(large)) xline(1 (1) 4, lstyle(grid)) graphregion(color(white))
graph export FT_requirement_1998.png, replace

scatter mean_FT mean_FT_fem requirement if year==1999, connect(l l) ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Educ}, size(large) height(7)) xlabel(1 (1) 4,labsize(large)) xline(1 (1) 4, lstyle(grid)) graphregion(color(white))
graph export FT_requirement_1999.png, replace

scatter mean_FT mean_FT_fem requirement if year==2005, connect(l l) ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Educ}, size(large) height(7)) xlabel(1 (1) 4,labsize(large)) xline(1 (1) 4, lstyle(grid)) graphregion(color(white))
graph export FT_requirement_2005.png, replace

scatter mean_MJ mean_MJ_fem requirement if year==1999, connect(l l) ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Educ}, size(large) height(7)) xlabel(1 (1) 4,labsize(large)) xline(1 (1) 4, lstyle(grid)) graphregion(color(white))
graph export MJ_requirement_1999.png, replace

scatter mean_MJ mean_MJ_fem requirement if year==2005, connect(l l) ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Educ}, size(large) height(7)) xlabel(1 (1) 4,labsize(large)) xline(1 (1) 4, lstyle(grid)) graphregion(color(white))
graph export MJ_requirement_2005.png, replace

*exit

cls
set more off

*education:
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months.dta",clear
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months_fem.dta"
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

drop if educ==.

bysort year educ: egen mean_FT=mean(FT) if female==0
bysort year educ: egen mean_FT_fem=mean(FT) if female==1

label variable mean_FT "Males"
label variable mean_FT_fem "Females"

scatter mean_FT mean_FT_fem educ if year==1998, connect(l l) ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Educ}, size(large) height(7)) xlabel(1 (1) 3,labsize(large)) xline(1 (1) 3, lstyle(grid)) graphregion(color(white))
graph export FT_educ_1998.png, replace

scatter mean_FT mean_FT_fem educ if year==1999, connect(l l) ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Educ}, size(large) height(7)) xlabel(1 (1) 3,labsize(large)) xline(1 (1) 3, lstyle(grid)) graphregion(color(white))
graph export FT_educ_1999.png, replace

scatter mean_FT mean_FT_fem educ if year==2005, connect(l l) ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Educ}, size(large) height(7)) xlabel(1 (1) 3,labsize(large)) xline(1 (1) 3, lstyle(grid)) graphregion(color(white))
graph export FT_educ_2005.png, replace

cls
set more off

*education:
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months.dta",clear
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months_fem.dta"
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

drop if educ==.

bysort year educ: egen mean_MJ=mean(MJ) if female==0
bysort year educ: egen mean_MJ_fem=mean(MJ) if female==1

keep mean_MJ* educ year

label variable mean_MJ "Males"
label variable mean_MJ_fem "Females"

scatter mean_MJ mean_MJ_fem educ if year==1999, connect(l l) ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Educ}, size(large) height(7)) xlabel(1 (1) 3,labsize(large)) xline(1 (1) 3, lstyle(grid)) graphregion(color(white))
graph export MJ_educ_1999.png, replace

scatter mean_MJ mean_MJ_fem educ if year==2005, connect(l l) ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Educ}, size(large) height(7)) xlabel(1 (1) 3,labsize(large)) xline(1 (1) 3, lstyle(grid)) graphregion(color(white))
graph export MJ_educ_2005.png, replace

*exit

cls
set more off
*occupations econ_act 1999-2005 mini jobs?

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months.dta",clear
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months_fem.dta"
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

codebook econ_act, all tabulate(13)

label define econ_act_lab 1 "Agriculture" 2 "Manufacture" 3 "Machinery" 4 "Transport Equipment" 5 "Food & Textiles" 6 "Hotels & Restaurants" 7 "Construction" 8 "Wholesale" 9 "Transport & Storage" 10 "Financial" 11 "Utilities" 12 "Education & Health" 13 "Public Administration"
label values econ_act econ_act_lab

tabulate econ_act

bysort year econ_act: egen mean_MJ=mean(MJ) if female==0
bysort year econ_act: egen mean_MJ_fem=mean(MJ) if female==1

tabstat mean_MJ if female==0 & year==1999, by(econ_act) stat(mean n)
tabstat mean_MJ if female==0 & year==2005, by(econ_act) stat(mean n)
*
tabstat mean_MJ_fem if female==1 & year==1999, by(econ_act) stat(mean n)
tabstat mean_MJ_fem if female==1 & year==2005, by(econ_act) stat(mean n)



***


cls
set more off

*** all

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months.dta",clear
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months_fem.dta"
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

drop if age==.

bysort year age: egen mean_FT=mean(FT) if female==0
bysort year age: egen mean_FT_fem=mean(FT) if female==1

label variable mean_FT "Males"
label variable mean_FT_fem "Females"

scatter mean_FT mean_FT_fem age if year==1998, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export FT_age_1998.png, replace

scatter mean_FT mean_FT_fem age if year==1999, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export FT_age_1999.png, replace

scatter mean_FT mean_FT_fem age if year==2005, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export FT_age_2005.png, replace

***

bysort year age: egen mean_PT=mean(PT) if female==0
bysort year age: egen mean_PT_fem=mean(PT) if female==1

label variable mean_PT "Males"
label variable mean_PT_fem "Females"

scatter mean_PT mean_PT_fem age if year==1998, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export PT_age_1998.png, replace

scatter mean_PT mean_PT_fem age if year==1999, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export PT_age_1999.png, replace

scatter mean_PT mean_PT_fem age if year==2005, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export PT_age_2005.png, replace

***

bysort year age: egen mean_CJ=mean(CJ) if female==0
bysort year age: egen mean_CJ_fem=mean(CJ) if female==1

label variable mean_CJ "Males"
label variable mean_CJ_fem "Females"

scatter mean_CJ mean_CJ_fem age if year==2005, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export CJ_age_2005.png, replace

***

bysort year age: egen mean_Unemp=mean(Unemp) if female==0
bysort year age: egen mean_Unemp_fem=mean(Unemp) if female==1

label variable mean_Unemp "Males"
label variable mean_Unemp_fem "Females"

scatter mean_Unemp mean_Unemp_fem age if year==1998, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export Unemp_age_1998.png, replace

scatter mean_Unemp mean_Unemp_fem age if year==1999, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export Unemp_age_1999.png, replace

scatter mean_Unemp mean_Unemp_fem age if year==2005, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export Unemp_age_2005.png, replace

***

bysort year age: egen mean_MJ=mean(MJ) if female==0
bysort year age: egen mean_MJ_fem=mean(MJ) if female==1

label variable mean_MJ "Males"
label variable mean_MJ_fem "Females"

scatter mean_MJ mean_MJ_fem age if year==1999, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export MJ_age_1999.png, replace

scatter mean_MJ mean_MJ_fem age if year==2005, ytitle({bf:Fraction}, size(large) height(5)) mcolor(black orange) legend(position(6) rows(1)) msymbol(O d) xtitle({bf:Age}, size(large) height(7)) xlabel(20 (5) 60,labsize(large)) xline(20 (5) 60, lstyle(grid)) graphregion(color(white))
graph export MJ_age_2005.png, replace




*exit






cls
set more off

*** all

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

gen fform=1 if FT==1
replace fform=2 if PT==1
replace fform=3 if MJ==1
replace fform=4 if CJ==1
*replace fform=5 if Unemp==1

label define form_define 1 "Full Time" 2 "Part Time" 3 "Mini Job" 4 "Concurrent Jobs"
label values fform form_define

label define educ_define 1 "HS Dropouts" 2 "High-School" 3 "College"
label values educ educ_define

*qui drop if age<24
*qui drop if age>55
*keep if source==1
*keep if female==0

tab1 educ fform if year==1998
tab1 educ fform if year==1999
tab1 educ fform if year==2005

tabulate fform if year==1998, summarize(age)
tabulate fform if year==1999, summarize(age)
tabulate fform if year==2005, summarize(age)

*exit

cls
set more off

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months_fem.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

gen fform=1 if FT==1
replace fform=2 if PT==1
replace fform=3 if MJ==1
replace fform=4 if CJ==1
*replace fform=5 if Unemp==1

label define form_define 1 "Full Time" 2 "Part Time" 3 "Mini Job" 4 "Concurrent Jobs"
label values fform form_define

label define educ_define 1 "HS Dropouts" 2 "High-School" 3 "College"
label values educ educ_define

*qui drop if age<24
*qui drop if age>55
*keep if source==1
*keep if female==0

tab1 educ fform if year==1998
tab1 educ fform if year==1999
tab1 educ fform if year==2005

tabulate fform if year==1998, summarize(age)
tabulate fform if year==1999, summarize(age)
tabulate fform if year==2005, summarize(age)

*exit

*

*
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

qui drop if age<24
qui drop if age>55

keep if year==1998
keep if source==1
keep if female==0
qui{
*egen persnr_new=group(persnr)
*drop persnr
*rename persnr_new persnr

gen ind_earnings_work=1 if earnings_year_work>0
replace ind_earnings_work=0 if earnings_year_work==0

gen ind_earnings_full=1 if earnings_year_full>0
replace ind_earnings_full=0 if earnings_year_full==0
replace ind_earnings_full=0 if earnings_year_full==.

gen ind_earnings_part=1 if earnings_year_part>0
replace ind_earnings_part=0 if earnings_year_part==0
replace ind_earnings_part=0 if earnings_year_part==.

gen ind_earnings_mini=1 if earnings_year_mini>0
replace ind_earnings_mini=0 if earnings_year_mini==0
replace ind_earnings_mini=0 if earnings_year_mini==.

bysort persnr: gen counter=_n
keep if counter==1

gen aage=age-23
gen aage2=aage^2

egen p25 = pctile(earnings_year_work) , p(25)
egen p50 = pctile(earnings_year_work) , p(50)
egen p75 = pctile(earnings_year_work) , p(75)

gen ranking=0
replace ranking=1 if earnings_year_work<=p25 & earnings_year_work>0
replace ranking=2 if earnings_year_work>p25 & earnings_year_work<=p50
replace ranking=3 if earnings_year_work>p50 & earnings_year_work<=p75
replace ranking=4 if earnings_year_work>p75 & earnings_year_work!=.
}
*probit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years eeduc_years2 i.region 
qui probit ind_earnings_full educ aage aage2 i.region,nocons
estimates table, keep(educ aage aage2) b star
*qui probit ind_earnings_part female educ ranking aage aage2 i.region 
*estimates table, keep(female educ ranking aage aage2) b star
*qui probit ind_earnings_mini female educ ranking aage aage2 i.region 
*estimates table, keep(female educ ranking aage aage2) b star

*
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

qui drop if age<24
qui drop if age>55

keep if year==1999
keep if source==1
keep if female==0
qui{
*egen persnr_new=group(persnr)
*drop persnr
*rename persnr_new persnr

gen ind_earnings_work=1 if earnings_year_work>0
replace ind_earnings_work=0 if earnings_year_work==0

gen ind_earnings_full=1 if earnings_year_full>0
replace ind_earnings_full=0 if earnings_year_full==0
replace ind_earnings_full=0 if earnings_year_full==.

gen ind_earnings_part=1 if earnings_year_part>0
replace ind_earnings_part=0 if earnings_year_part==0
replace ind_earnings_part=0 if earnings_year_part==.

gen ind_earnings_mini=1 if earnings_year_mini>0
replace ind_earnings_mini=0 if earnings_year_mini==0
replace ind_earnings_mini=0 if earnings_year_mini==.

bysort persnr: gen counter=_n
keep if counter==1

gen aage=age-23
gen aage2=aage^2

egen p25 = pctile(earnings_year_work) , p(25)
egen p50 = pctile(earnings_year_work) , p(50)
egen p75 = pctile(earnings_year_work) , p(75)

gen ranking=0
replace ranking=1 if earnings_year_work<=p25 & earnings_year_work>0
replace ranking=2 if earnings_year_work>p25 & earnings_year_work<=p50
replace ranking=3 if earnings_year_work>p50 & earnings_year_work<=p75
replace ranking=4 if earnings_year_work>p75 & earnings_year_work!=.
}
*probit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years eeduc_years2 i.region 
qui probit ind_earnings_full educ aage aage2 i.region,nocons
estimates table, keep(educ aage aage2) b star
*qui probit ind_earnings_part female educ aage aage2 i.region 
*estimates table, keep(female educ ranking aage aage2) b star
*qui probit ind_earnings_mini female educ aage aage2 i.region 
*estimates table, keep(female educ aage aage2) b star




use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

qui drop if age<24
qui drop if age>55

keep if year==2005
keep if source==1
keep if female==0
qui {
*egen persnr_new=group(persnr)
*drop persnr
*rename persnr_new persnr

gen ind_earnings_work=1 if earnings_year_work>0
replace ind_earnings_work=0 if earnings_year_work==0

gen ind_earnings_full=1 if earnings_year_full>0
replace ind_earnings_full=0 if earnings_year_full==0
replace ind_earnings_full=0 if earnings_year_full==.

gen ind_earnings_part=1 if earnings_year_part>0
replace ind_earnings_part=0 if earnings_year_part==0
replace ind_earnings_part=0 if earnings_year_part==.

gen ind_earnings_mini=1 if earnings_year_mini>0
replace ind_earnings_mini=0 if earnings_year_mini==0
replace ind_earnings_mini=0 if earnings_year_mini==.

bysort persnr: gen counter=_n
keep if counter==1

gen aage=age-23
gen aage2=aage^2

egen p25 = pctile(earnings_year_work) , p(25)
egen p50 = pctile(earnings_year_work) , p(50)
egen p75 = pctile(earnings_year_work) , p(75)

gen ranking=0
replace ranking=1 if earnings_year_work<=p25 & earnings_year_work>0
replace ranking=2 if earnings_year_work>p25 & earnings_year_work<=p50
replace ranking=3 if earnings_year_work>p50 & earnings_year_work<=p75
replace ranking=4 if earnings_year_work>p75 & earnings_year_work!=.
}
*probit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years eeduc_years2 i.region 
qui probit ind_earnings_full educ aage aage2 i.region,nocons
estimates table, keep(educ aage aage2) b star
*qui probit ind_earnings_part educ ranking aage aage2 i.region
*estimates table, keep(educ ranking aage aage2) b star
*qui probit ind_earnings_mini educ aage aage2 i.region 
*estimates table, keep(female educ aage aage2) b star

***

*
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

qui drop if age<24
qui drop if age>30

keep if year==1999
keep if source==1
keep if female==0
qui {
*egen persnr_new=group(persnr)
*drop persnr
*rename persnr_new persnr

gen ind_earnings_work=1 if earnings_year_work>0
replace ind_earnings_work=0 if earnings_year_work==0

gen ind_earnings_full=1 if earnings_year_full>0
replace ind_earnings_full=0 if earnings_year_full==0
replace ind_earnings_full=0 if earnings_year_full==.

gen ind_earnings_part=1 if earnings_year_part>0
replace ind_earnings_part=0 if earnings_year_part==0
replace ind_earnings_part=0 if earnings_year_part==.

gen ind_earnings_mini=1 if earnings_year_mini>0
replace ind_earnings_mini=0 if earnings_year_mini==0
replace ind_earnings_mini=0 if earnings_year_mini==.

bysort persnr: gen counter=_n
keep if counter==1

gen aage=age-23
gen aage2=aage^2

egen p25 = pctile(earnings_year_work) , p(25)
egen p50 = pctile(earnings_year_work) , p(50)
egen p75 = pctile(earnings_year_work) , p(75)

gen ranking=0
replace ranking=1 if earnings_year_work<=p25 & earnings_year_work>0
replace ranking=2 if earnings_year_work>p25 & earnings_year_work<=p50
replace ranking=3 if earnings_year_work>p50 & earnings_year_work<=p75
replace ranking=4 if earnings_year_work>p75 & earnings_year_work!=.
}
*probit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years eeduc_years2 i.region 
qui probit ind_earnings_full educ aage i.region,nocons
estimates table, keep(educ aage) b star
*qui probit ind_earnings_part female educ ranking aage i.region 
*estimates table, keep(female educ ranking aage) b star
*qui probit ind_earnings_mini female educ ranking aage i.region 
*estimates table, keep(female educ ranking aage) b star


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

qui drop if age<24
qui drop if age>30

keep if year==2005
keep if source==1
keep if female==0
qui {
*egen persnr_new=group(persnr)
*drop persnr
*rename persnr_new persnr

gen ind_earnings_work=1 if earnings_year_work>0
replace ind_earnings_work=0 if earnings_year_work==0

gen ind_earnings_full=1 if earnings_year_full>0
replace ind_earnings_full=0 if earnings_year_full==0
replace ind_earnings_full=0 if earnings_year_full==.

gen ind_earnings_part=1 if earnings_year_part>0
replace ind_earnings_part=0 if earnings_year_part==0
replace ind_earnings_part=0 if earnings_year_part==.

gen ind_earnings_mini=1 if earnings_year_mini>0
replace ind_earnings_mini=0 if earnings_year_mini==0
replace ind_earnings_mini=0 if earnings_year_mini==.

bysort persnr: gen counter=_n
keep if counter==1

gen aage=age-23
gen aage2=aage^2

egen p25 = pctile(earnings_year_work) , p(25)
egen p50 = pctile(earnings_year_work) , p(50)
egen p75 = pctile(earnings_year_work) , p(75)

gen ranking=0
replace ranking=1 if earnings_year_work<=p25 & earnings_year_work>0
replace ranking=2 if earnings_year_work>p25 & earnings_year_work<=p50
replace ranking=3 if earnings_year_work>p50 & earnings_year_work<=p75
replace ranking=4 if earnings_year_work>p75 & earnings_year_work!=.
}
*probit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years eeduc_years2 i.region 
qui probit ind_earnings_full educ aage i.region,nocons
estimates table, keep(educ aage) b star
*qui probit ind_earnings_part female educ ranking aage i.region 
*estimates table, keep(female educ ranking aage) b star
*qui probit ind_earnings_mini female educ ranking aage i.region 
*estimates table, keep(female educ ranking aage) b star

***

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

qui drop if age<40
qui drop if age>55

keep if year==1999
keep if source==1
keep if female==0
qui {
*egen persnr_new=group(persnr)
*drop persnr
*rename persnr_new persnr

gen ind_earnings_work=1 if earnings_year_work>0
replace ind_earnings_work=0 if earnings_year_work==0

gen ind_earnings_full=1 if earnings_year_full>0
replace ind_earnings_full=0 if earnings_year_full==0
replace ind_earnings_full=0 if earnings_year_full==.

gen ind_earnings_part=1 if earnings_year_part>0
replace ind_earnings_part=0 if earnings_year_part==0
replace ind_earnings_part=0 if earnings_year_part==.

gen ind_earnings_mini=1 if earnings_year_mini>0
replace ind_earnings_mini=0 if earnings_year_mini==0
replace ind_earnings_mini=0 if earnings_year_mini==.

bysort persnr: gen counter=_n
keep if counter==1

gen aage=age-39
gen aage2=aage^2

egen p25 = pctile(earnings_year_work) , p(25)
egen p50 = pctile(earnings_year_work) , p(50)
egen p75 = pctile(earnings_year_work) , p(75)

gen ranking=0
replace ranking=1 if earnings_year_work<=p25 & earnings_year_work>0
replace ranking=2 if earnings_year_work>p25 & earnings_year_work<=p50
replace ranking=3 if earnings_year_work>p50 & earnings_year_work<=p75
replace ranking=4 if earnings_year_work>p75 & earnings_year_work!=.
}
*probit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years eeduc_years2 i.region 
qui probit ind_earnings_full educ aage i.region,nocons
estimates table, keep(educ aage) b star
*qui probit ind_earnings_part educ aage i.region 
*estimates table, keep(educ aage) b star
*qui probit ind_earnings_mini educ aage i.region 
*estimates table, keep(educ aage) b star


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

qui drop if age<40
qui drop if age>55

keep if year==2005
keep if source==1
keep if female==0
qui {

*egen persnr_new=group(persnr)
*drop persnr
*rename persnr_new persnr

gen ind_earnings_work=1 if earnings_year_work>0
replace ind_earnings_work=0 if earnings_year_work==0

gen ind_earnings_full=1 if earnings_year_full>0
replace ind_earnings_full=0 if earnings_year_full==0
replace ind_earnings_full=0 if earnings_year_full==.

gen ind_earnings_part=1 if earnings_year_part>0
replace ind_earnings_part=0 if earnings_year_part==0
replace ind_earnings_part=0 if earnings_year_part==.

gen ind_earnings_mini=1 if earnings_year_mini>0
replace ind_earnings_mini=0 if earnings_year_mini==0
replace ind_earnings_mini=0 if earnings_year_mini==.

bysort persnr: gen counter=_n
keep if counter==1

gen aage=age-39
gen aage2=aage^2

egen p25 = pctile(earnings_year_work) , p(25)
egen p50 = pctile(earnings_year_work) , p(50)
egen p75 = pctile(earnings_year_work) , p(75)

gen ranking=0
replace ranking=1 if earnings_year_work<=p25 & earnings_year_work>0
replace ranking=2 if earnings_year_work>p25 & earnings_year_work<=p50
replace ranking=3 if earnings_year_work>p50 & earnings_year_work<=p75
replace ranking=4 if earnings_year_work>p75 & earnings_year_work!=.
}
*probit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years eeduc_years2 i.region 
qui probit ind_earnings_full educ aage i.region, nocons
estimates table, keep(educ aage) b star
*qui probit ind_earnings_part female educ ranking aage aage2 i.region 
*estimates table, keep(female educ ranking aage) b star
*qui probit ind_earnings_mini female educ ranking aage aage2 i.region, iterate(10)
*estimates table, keep(female educ ranking aage) b star



*** FEMALES

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

qui drop if age<24
qui drop if age>55

keep if year==1998
keep if source==1
keep if female==1
qui {
*egen persnr_new=group(persnr)
*drop persnr
*rename persnr_new persnr

gen ind_earnings_work=1 if earnings_year_work>0
replace ind_earnings_work=0 if earnings_year_work==0

gen ind_earnings_full=1 if earnings_year_full>0
replace ind_earnings_full=0 if earnings_year_full==0
replace ind_earnings_full=0 if earnings_year_full==.

gen ind_earnings_part=1 if earnings_year_part>0
replace ind_earnings_part=0 if earnings_year_part==0
replace ind_earnings_part=0 if earnings_year_part==.

gen ind_earnings_mini=1 if earnings_year_mini>0
replace ind_earnings_mini=0 if earnings_year_mini==0
replace ind_earnings_mini=0 if earnings_year_mini==.

bysort persnr: gen counter=_n
keep if counter==1

gen aage=age-23
gen aage2=aage^2

egen p25 = pctile(earnings_year_work) , p(25)
egen p50 = pctile(earnings_year_work) , p(50)
egen p75 = pctile(earnings_year_work) , p(75)

gen ranking=0
replace ranking=1 if earnings_year_work<=p25 & earnings_year_work>0
replace ranking=2 if earnings_year_work>p25 & earnings_year_work<=p50
replace ranking=3 if earnings_year_work>p50 & earnings_year_work<=p75
replace ranking=4 if earnings_year_work>p75 & earnings_year_work!=.
}
*probit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years eeduc_years2 i.region 
qui probit ind_earnings_full educ aage aage2 i.region,nocons
estimates table, keep(educ aage aage2) b star
*qui probit ind_earnings_part female educ ranking aage aage2 i.region 
*estimates table, keep(female educ ranking aage aage2) b star
*qui probit ind_earnings_mini female educ ranking aage aage2 i.region 
*estimates table, keep(female educ ranking aage aage2) b star

*
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

qui drop if age<24
qui drop if age>55

keep if year==1999
keep if source==1
keep if female==1
qui {
*egen persnr_new=group(persnr)
*drop persnr
*rename persnr_new persnr

gen ind_earnings_work=1 if earnings_year_work>0
replace ind_earnings_work=0 if earnings_year_work==0

gen ind_earnings_full=1 if earnings_year_full>0
replace ind_earnings_full=0 if earnings_year_full==0
replace ind_earnings_full=0 if earnings_year_full==.

gen ind_earnings_part=1 if earnings_year_part>0
replace ind_earnings_part=0 if earnings_year_part==0
replace ind_earnings_part=0 if earnings_year_part==.

gen ind_earnings_mini=1 if earnings_year_mini>0
replace ind_earnings_mini=0 if earnings_year_mini==0
replace ind_earnings_mini=0 if earnings_year_mini==.

bysort persnr: gen counter=_n
keep if counter==1

gen aage=age-23
gen aage2=aage^2

egen p25 = pctile(earnings_year_work) , p(25)
egen p50 = pctile(earnings_year_work) , p(50)
egen p75 = pctile(earnings_year_work) , p(75)

gen ranking=0
replace ranking=1 if earnings_year_work<=p25 & earnings_year_work>0
replace ranking=2 if earnings_year_work>p25 & earnings_year_work<=p50
replace ranking=3 if earnings_year_work>p50 & earnings_year_work<=p75
replace ranking=4 if earnings_year_work>p75 & earnings_year_work!=.
}
*probit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years eeduc_years2 i.region 
qui probit ind_earnings_full educ aage aage2 i.region,nocons 
estimates table, keep(educ aage aage2) b star
*qui probit ind_earnings_part female educ aage aage2 i.region 
*estimates table, keep(female educ ranking aage aage2) b star
*qui probit ind_earnings_mini female educ aage aage2 i.region 
*estimates table, keep(female educ aage aage2) b star


*


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

qui drop if age<24
qui drop if age>55

keep if year==2005
keep if source==1
keep if female==1
qui {
*egen persnr_new=group(persnr)
*drop persnr
*rename persnr_new persnr

gen ind_earnings_work=1 if earnings_year_work>0
replace ind_earnings_work=0 if earnings_year_work==0

gen ind_earnings_full=1 if earnings_year_full>0
replace ind_earnings_full=0 if earnings_year_full==0
replace ind_earnings_full=0 if earnings_year_full==.

gen ind_earnings_part=1 if earnings_year_part>0
replace ind_earnings_part=0 if earnings_year_part==0
replace ind_earnings_part=0 if earnings_year_part==.

gen ind_earnings_mini=1 if earnings_year_mini>0
replace ind_earnings_mini=0 if earnings_year_mini==0
replace ind_earnings_mini=0 if earnings_year_mini==.

bysort persnr: gen counter=_n
keep if counter==1

gen aage=age-23
gen aage2=aage^2

egen p25 = pctile(earnings_year_work) , p(25)
egen p50 = pctile(earnings_year_work) , p(50)
egen p75 = pctile(earnings_year_work) , p(75)

gen ranking=0
replace ranking=1 if earnings_year_work<=p25 & earnings_year_work>0
replace ranking=2 if earnings_year_work>p25 & earnings_year_work<=p50
replace ranking=3 if earnings_year_work>p50 & earnings_year_work<=p75
replace ranking=4 if earnings_year_work>p75 & earnings_year_work!=.
}
*probit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years eeduc_years2 i.region 
qui probit ind_earnings_full educ aage aage2 i.region,nocons
estimates table, keep(educ aage aage2) b star
*qui probit ind_earnings_part educ ranking aage aage2 i.region
*estimates table, keep(educ ranking aage aage2) b star
*qui probit ind_earnings_mini educ aage aage2 i.region 
*estimates table, keep(female educ aage aage2) b star

***

*
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

qui drop if age<24
qui drop if age>30

keep if year==1999
keep if source==1
keep if female==1
qui {
*egen persnr_new=group(persnr)
*drop persnr
*rename persnr_new persnr

gen ind_earnings_work=1 if earnings_year_work>0
replace ind_earnings_work=0 if earnings_year_work==0

gen ind_earnings_full=1 if earnings_year_full>0
replace ind_earnings_full=0 if earnings_year_full==0
replace ind_earnings_full=0 if earnings_year_full==.

gen ind_earnings_part=1 if earnings_year_part>0
replace ind_earnings_part=0 if earnings_year_part==0
replace ind_earnings_part=0 if earnings_year_part==.

gen ind_earnings_mini=1 if earnings_year_mini>0
replace ind_earnings_mini=0 if earnings_year_mini==0
replace ind_earnings_mini=0 if earnings_year_mini==.

bysort persnr: gen counter=_n
keep if counter==1

gen aage=age-23
gen aage2=aage^2

egen p25 = pctile(earnings_year_work) , p(25)
egen p50 = pctile(earnings_year_work) , p(50)
egen p75 = pctile(earnings_year_work) , p(75)

gen ranking=0
replace ranking=1 if earnings_year_work<=p25 & earnings_year_work>0
replace ranking=2 if earnings_year_work>p25 & earnings_year_work<=p50
replace ranking=3 if earnings_year_work>p50 & earnings_year_work<=p75
replace ranking=4 if earnings_year_work>p75 & earnings_year_work!=.
}
*probit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years eeduc_years2 i.region 
qui probit ind_earnings_full educ aage i.region,nocons
estimates table, keep(educ aage) b star
*qui probit ind_earnings_part female educ ranking aage i.region 
*estimates table, keep(female educ ranking aage) b star
*qui probit ind_earnings_mini female educ ranking aage i.region 
*estimates table, keep(female educ ranking aage) b star


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

qui drop if age<24
qui drop if age>30

keep if year==2005
keep if source==1
keep if female==1
qui {
*egen persnr_new=group(persnr)
*drop persnr
*rename persnr_new persnr

gen ind_earnings_work=1 if earnings_year_work>0
replace ind_earnings_work=0 if earnings_year_work==0

gen ind_earnings_full=1 if earnings_year_full>0
replace ind_earnings_full=0 if earnings_year_full==0
replace ind_earnings_full=0 if earnings_year_full==.

gen ind_earnings_part=1 if earnings_year_part>0
replace ind_earnings_part=0 if earnings_year_part==0
replace ind_earnings_part=0 if earnings_year_part==.

gen ind_earnings_mini=1 if earnings_year_mini>0
replace ind_earnings_mini=0 if earnings_year_mini==0
replace ind_earnings_mini=0 if earnings_year_mini==.

bysort persnr: gen counter=_n
keep if counter==1

gen aage=age-23
gen aage2=aage^2

egen p25 = pctile(earnings_year_work) , p(25)
egen p50 = pctile(earnings_year_work) , p(50)
egen p75 = pctile(earnings_year_work) , p(75)

gen ranking=0
replace ranking=1 if earnings_year_work<=p25 & earnings_year_work>0
replace ranking=2 if earnings_year_work>p25 & earnings_year_work<=p50
replace ranking=3 if earnings_year_work>p50 & earnings_year_work<=p75
replace ranking=4 if earnings_year_work>p75 & earnings_year_work!=.
}
*probit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years eeduc_years2 i.region 
qui probit ind_earnings_full educ aage i.region,nocons 
estimates table, keep(educ aage) b star
*qui probit ind_earnings_part female educ ranking aage i.region 
*estimates table, keep(female educ ranking aage) b star
*qui probit ind_earnings_mini female educ ranking aage i.region 
*estimates table, keep(female educ ranking aage) b star

***

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

qui drop if age<40
qui drop if age>55

keep if year==1999
keep if source==1
keep if female==1
qui {
*egen persnr_new=group(persnr)
*drop persnr
*rename persnr_new persnr

gen ind_earnings_work=1 if earnings_year_work>0
replace ind_earnings_work=0 if earnings_year_work==0

gen ind_earnings_full=1 if earnings_year_full>0
replace ind_earnings_full=0 if earnings_year_full==0
replace ind_earnings_full=0 if earnings_year_full==.

gen ind_earnings_part=1 if earnings_year_part>0
replace ind_earnings_part=0 if earnings_year_part==0
replace ind_earnings_part=0 if earnings_year_part==.

gen ind_earnings_mini=1 if earnings_year_mini>0
replace ind_earnings_mini=0 if earnings_year_mini==0
replace ind_earnings_mini=0 if earnings_year_mini==.

bysort persnr: gen counter=_n
keep if counter==1

gen aage=age-39
gen aage2=aage^2

egen p25 = pctile(earnings_year_work) , p(25)
egen p50 = pctile(earnings_year_work) , p(50)
egen p75 = pctile(earnings_year_work) , p(75)

gen ranking=0
replace ranking=1 if earnings_year_work<=p25 & earnings_year_work>0
replace ranking=2 if earnings_year_work>p25 & earnings_year_work<=p50
replace ranking=3 if earnings_year_work>p50 & earnings_year_work<=p75
replace ranking=4 if earnings_year_work>p75 & earnings_year_work!=.
}
*probit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years eeduc_years2 i.region 
qui probit ind_earnings_full educ aage i.region,nocons 
estimates table, keep(educ aage) b star
*qui probit ind_earnings_part educ aage i.region 
*estimates table, keep(educ aage) b star
*qui probit ind_earnings_mini educ aage i.region 
*estimates table, keep(educ aage) b star


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

qui drop if age<40
qui drop if age>55

keep if year==2005
keep if source==1
keep if female==1
qui {
*egen persnr_new=group(persnr)
*drop persnr
*rename persnr_new persnr

*tabstat educ age female, statistics(mean) format(%12.2fc)
*tabstat educ age female if form==1, statistics(mean) format(%12.2fc)
*tabstat educ age female if form==2, statistics(mean) format(%12.2fc)
*tabstat educ age female if form==3, statistics(mean) format(%12.2fc)

gen ind_earnings_work=1 if earnings_year_work>0
replace ind_earnings_work=0 if earnings_year_work==0

gen ind_earnings_full=1 if earnings_year_full>0
replace ind_earnings_full=0 if earnings_year_full==0
replace ind_earnings_full=0 if earnings_year_full==.

gen ind_earnings_part=1 if earnings_year_part>0
replace ind_earnings_part=0 if earnings_year_part==0
replace ind_earnings_part=0 if earnings_year_part==.

gen ind_earnings_mini=1 if earnings_year_mini>0
replace ind_earnings_mini=0 if earnings_year_mini==0
replace ind_earnings_mini=0 if earnings_year_mini==.

bysort persnr: gen counter=_n
keep if counter==1

gen aage=age-39
gen aage2=aage^2

egen p25 = pctile(earnings_year_work) , p(25)
egen p50 = pctile(earnings_year_work) , p(50)
egen p75 = pctile(earnings_year_work) , p(75)

gen ranking=0
replace ranking=1 if earnings_year_work<=p25 & earnings_year_work>0
replace ranking=2 if earnings_year_work>p25 & earnings_year_work<=p50
replace ranking=3 if earnings_year_work>p50 & earnings_year_work<=p75
replace ranking=4 if earnings_year_work>p75 & earnings_year_work!=.
}
*probit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years eeduc_years2 i.region 
qui probit ind_earnings_full educ aage i.region,nocons
estimates table, keep(educ aage) b star
*qui probit ind_earnings_part female educ ranking aage aage2 i.region 
*estimates table, keep(female educ ranking aage) b star
*qui probit ind_earnings_mini female educ ranking aage aage2 i.region, iterate(10)
*estimates table, keep(female educ ranking aage) b star


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

drop if region<0
*keep if female==0
keep if sample==21 | sample==23

qui drop if age<24
qui drop if age>55

qui {

replace educ=. if educ==-1
replace educ_years=. if educ_years<0

sort persnr year

bysort persnr: egen max_educ=max(educ)
order persnr educ max_educ

***

replace labor_earnings=labor_earnings-inc_self if inc_self>0
replace labor_earnings=labor_earnings-inc_military if inc_military>0
replace labor_earnings=labor_earnings-inc_profit if inc_profit>0

*+second_earnings+ixmas+iothy+iholy
gen earnings_work=labor_earnings 
*if inrange(form,1,2)
gen def_earnings_work=earnings_work*100/cpi

replace def_earnings_work=0 if def_earnings_work<=0

replace def_earnings_work=0 if def_earnings_work==.

gen ind_earnings_work=1 if def_earnings_work>0
replace ind_earnings_work=0 if def_earnings_work==0

*keep if max_educ==3

qui tab year, generate(tab_yr)
qui tab age, generate(tab_ag)

gen yyear=year-1983
gen aage=age-23
gen eeduc_years=educ_years-6

gen aage2=aage^2
gen yyear2=yyear^2
gen eeduc_years2=eeduc_years^2

egen p25 = pctile(def_earnings_work) , p(25)
egen p50 = pctile(def_earnings_work) , p(50)
egen p75 = pctile(def_earnings_work) , p(75)

gen ranking=.
replace ranking=1 if def_earnings_work<=p25 & def_earnings_work>0
replace ranking=2 if def_earnings_work>p25 & def_earnings_work<=p50
replace ranking=3 if def_earnings_work>p50 & def_earnings_work<=p75
replace ranking=4 if def_earnings_work>p75 & def_earnings_work!=.
}

qui probit ind_earnings_work female yyear yyear2 eeduc_years eeduc_years2 aage aage2 i.region, nocons
estimates table, keep(female yyear yyear2 eeduc_years eeduc_years2 aage aage2) b star

*margins, dydx(*) atmeans
*estimates table, keep(female yyear yyear2 eeduc_years eeduc_years2 aage aage2) b star

*xtset persnr year

*xtprobit ind_earnings_work female yyear yyear2 aage aage2 eeduc_years i.region 
