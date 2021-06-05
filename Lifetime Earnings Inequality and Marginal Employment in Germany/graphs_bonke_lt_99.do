 cls
 set more off

***Unc
*** Unconditional


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_22_unc",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

bysort year: egen mean_var=mean(var_lt_work_22)
replace var_lt_work_22=mean_var
drop mean_var

bysort year: egen mean_var=mean(gini_lt_work_22)
replace gini_lt_work_22=mean_var
drop mean_var

bysort year: egen mean_var=mean(p85_p15_lt_work_22)
replace p85_p15_lt_work_22=mean_var
drop mean_var

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_27_unc"
bysort year: egen mean_var=mean(var_lt_work_27)
replace var_lt_work_27=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_27)
replace gini_lt_work_27=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_27)
replace p85_p15_lt_work_27=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_32_unc"
bysort year: egen mean_var=mean(var_lt_work_32)
replace var_lt_work_32=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_32)
replace gini_lt_work_32=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_32)
replace p85_p15_lt_work_32=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_37_unc"
bysort year: egen mean_var=mean(var_lt_work_37)
replace var_lt_work_37=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_37)
replace gini_lt_work_37=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_37)
replace p85_p15_lt_work_37=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_42_unc"
bysort year: egen mean_var=mean(var_lt_work_42)
replace var_lt_work_42=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_42)
replace gini_lt_work_42=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_42)
replace p85_p15_lt_work_42=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_47_unc"
bysort year: egen mean_var=mean(var_lt_work_47)
replace var_lt_work_47=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_47)
replace gini_lt_work_47=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_47)
replace p85_p15_lt_work_47=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_52_unc"
bysort year: egen mean_var=mean(var_lt_work_52)
replace var_lt_work_52=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_52)
replace gini_lt_work_52=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_52)
replace p85_p15_lt_work_52=mean_var
drop mean_var

*bysort year: gen counter=_n if gini_lt_work!=.
*keep if counter==1

label variable gini_lt_work_22 "22"
label variable var_lt_work_22 "22"
label variable p85_p15_lt_work_22 "22"
label variable gini_lt_work_27 "27"
label variable var_lt_work_27 "27"
label variable p85_p15_lt_work_27 "27"
*
label variable gini_lt_work_32 "32"
label variable var_lt_work_32 "32"
label variable p85_p15_lt_work_32 "32"
label variable gini_lt_work_37 "37"
label variable var_lt_work_37 "37"
label variable p85_p15_lt_work_37 "37"
*
label variable gini_lt_work_42 "42"
label variable var_lt_work_42 "42"
label variable p85_p15_lt_work_42 "42"
label variable gini_lt_work_47 "47"
label variable var_lt_work_47 "47"
label variable p85_p15_lt_work_47 "47"
*
label variable gini_lt_work_52 "52"
label variable var_lt_work_52 "52"
label variable p85_p15_lt_work_52 "52"


***Gini Coefficients:
quietly twoway line var_lt_work_22 var_lt_work_27 var_lt_work_32 var_lt_work_37 var_lt_work_42 var_lt_work_47 var_lt_work_52 year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_99_lt_unc.png, replace

quietly twoway line gini_lt_work_22 gini_lt_work_27 gini_lt_work_32 gini_lt_work_37 gini_lt_work_42 gini_lt_work_47 gini_lt_work_52 year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.1 (0.1) 0.4, labsize(large) angle(horizontal))
graph export gini_work_99_lt_unc.png, replace

quietly twoway line p85_p15_lt_work_22 p85_p15_lt_work_27 p85_p15_lt_work_32 p85_p15_lt_work_37 p85_p15_lt_work_42 p85_p15_lt_work_47 p85_p15_lt_work_52 year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(1 (1) 4, labsize(large) angle(horizontal))
graph export perc8515_work_99_lt_unc.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_22_male",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

bysort year: egen mean_var=mean(var_lt_work_22)
replace var_lt_work_22=mean_var
drop mean_var

bysort year: egen mean_var=mean(gini_lt_work_22)
replace gini_lt_work_22=mean_var
drop mean_var

bysort year: egen mean_var=mean(p85_p15_lt_work_22)
replace p85_p15_lt_work_22=mean_var
drop mean_var

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_27_male"
bysort year: egen mean_var=mean(var_lt_work_27)
replace var_lt_work_27=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_27)
replace gini_lt_work_27=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_27)
replace p85_p15_lt_work_27=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_32_male"
bysort year: egen mean_var=mean(var_lt_work_32)
replace var_lt_work_32=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_32)
replace gini_lt_work_32=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_32)
replace p85_p15_lt_work_32=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_37_male"
bysort year: egen mean_var=mean(var_lt_work_37)
replace var_lt_work_37=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_37)
replace gini_lt_work_37=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_37)
replace p85_p15_lt_work_37=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_42_male"
bysort year: egen mean_var=mean(var_lt_work_42)
replace var_lt_work_42=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_42)
replace gini_lt_work_42=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_42)
replace p85_p15_lt_work_42=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_47_male"
bysort year: egen mean_var=mean(var_lt_work_47)
replace var_lt_work_47=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_47)
replace gini_lt_work_47=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_47)
replace p85_p15_lt_work_47=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_52_male"
bysort year: egen mean_var=mean(var_lt_work_52)
replace var_lt_work_52=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_52)
replace gini_lt_work_52=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_52)
replace p85_p15_lt_work_52=mean_var
drop mean_var

*bysort year: gen counter=_n if gini_lt_work!=.
*keep if counter==1

label variable gini_lt_work_22 "22"
label variable var_lt_work_22 "22"
label variable p85_p15_lt_work_22 "22"
label variable gini_lt_work_27 "27"
label variable var_lt_work_27 "27"
label variable p85_p15_lt_work_27 "27"
*
label variable gini_lt_work_32 "32"
label variable var_lt_work_32 "32"
label variable p85_p15_lt_work_32 "32"
label variable gini_lt_work_37 "37"
label variable var_lt_work_37 "37"
label variable p85_p15_lt_work_37 "37"
*
label variable gini_lt_work_42 "42"
label variable var_lt_work_42 "42"
label variable p85_p15_lt_work_42 "42"
label variable gini_lt_work_47 "47"
label variable var_lt_work_47 "47"
label variable p85_p15_lt_work_47 "47"
*
label variable gini_lt_work_52 "52"
label variable var_lt_work_52 "52"
label variable p85_p15_lt_work_52 "52"


***Gini Coefficients:
quietly twoway line var_lt_work_22 var_lt_work_27 var_lt_work_32 var_lt_work_37 var_lt_work_42 var_lt_work_47 var_lt_work_52 year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_99_lt_male.png, replace

quietly twoway line gini_lt_work_22 gini_lt_work_27 gini_lt_work_32 gini_lt_work_37 gini_lt_work_42 gini_lt_work_47 gini_lt_work_52 year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.1 (0.1) 0.4, labsize(large) angle(horizontal))
graph export gini_work_99_lt_male.png, replace

quietly twoway line p85_p15_lt_work_22 p85_p15_lt_work_27 p85_p15_lt_work_32 p85_p15_lt_work_37 p85_p15_lt_work_42 p85_p15_lt_work_47 p85_p15_lt_work_52 year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(1 (1) 4, labsize(large) angle(horizontal))
graph export perc8515_work_99_lt_male.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_22_female",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

bysort year: egen mean_var=mean(var_lt_work_22)
replace var_lt_work_22=mean_var
drop mean_var

bysort year: egen mean_var=mean(gini_lt_work_22)
replace gini_lt_work_22=mean_var
drop mean_var

bysort year: egen mean_var=mean(p85_p15_lt_work_22)
replace p85_p15_lt_work_22=mean_var
drop mean_var

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_27_female"
bysort year: egen mean_var=mean(var_lt_work_27)
replace var_lt_work_27=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_27)
replace gini_lt_work_27=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_27)
replace p85_p15_lt_work_27=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_32_female"
bysort year: egen mean_var=mean(var_lt_work_32)
replace var_lt_work_32=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_32)
replace gini_lt_work_32=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_32)
replace p85_p15_lt_work_32=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_37_female"
bysort year: egen mean_var=mean(var_lt_work_37)
replace var_lt_work_37=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_37)
replace gini_lt_work_37=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_37)
replace p85_p15_lt_work_37=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_42_female"
bysort year: egen mean_var=mean(var_lt_work_42)
replace var_lt_work_42=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_42)
replace gini_lt_work_42=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_42)
replace p85_p15_lt_work_42=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_47_female"
bysort year: egen mean_var=mean(var_lt_work_47)
replace var_lt_work_47=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_47)
replace gini_lt_work_47=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_47)
replace p85_p15_lt_work_47=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_99_lt_52_female"
bysort year: egen mean_var=mean(var_lt_work_52)
replace var_lt_work_52=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_52)
replace gini_lt_work_52=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_52)
replace p85_p15_lt_work_52=mean_var
drop mean_var

*bysort year: gen counter=_n if gini_lt_work!=.
*keep if counter==1

label variable gini_lt_work_22 "22"
label variable var_lt_work_22 "22"
label variable p85_p15_lt_work_22 "22"
label variable gini_lt_work_27 "27"
label variable var_lt_work_27 "27"
label variable p85_p15_lt_work_27 "27"
*
label variable gini_lt_work_32 "32"
label variable var_lt_work_32 "32"
label variable p85_p15_lt_work_32 "32"
label variable gini_lt_work_37 "37"
label variable var_lt_work_37 "37"
label variable p85_p15_lt_work_37 "37"
*
label variable gini_lt_work_42 "42"
label variable var_lt_work_42 "42"
label variable p85_p15_lt_work_42 "42"
label variable gini_lt_work_47 "47"
label variable var_lt_work_47 "47"
label variable p85_p15_lt_work_47 "47"
*
label variable gini_lt_work_52 "52"
label variable var_lt_work_52 "52"
label variable p85_p15_lt_work_52 "52"


***Gini Coefficients:
quietly twoway line var_lt_work_22 var_lt_work_27 var_lt_work_32 var_lt_work_37 var_lt_work_42 var_lt_work_47 var_lt_work_52 year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_99_lt_female.png, replace

quietly twoway line gini_lt_work_22 gini_lt_work_27 gini_lt_work_32 gini_lt_work_37 gini_lt_work_42 gini_lt_work_47 gini_lt_work_52 year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lcolor(blue red green brown magenta gold purple) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.1 (0.1) 0.4, labsize(large) angle(horizontal))
graph export gini_work_99_lt_female.png, replace

quietly twoway line p85_p15_lt_work_22 p85_p15_lt_work_27 p85_p15_lt_work_32 p85_p15_lt_work_37 p85_p15_lt_work_42 p85_p15_lt_work_47 p85_p15_lt_work_52 year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green brown magenta gold purple) lpattern(solid dash shortdash_dot dash_dot shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2010, labsize(large) angle(45)) xline(1999 (1) 2010, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(1 (1) 4, labsize(large) angle(horizontal))
graph export perc8515_work_99_lt_female.png, replace
