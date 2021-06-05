use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_24",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

bysort year: egen mean_var=mean(var_lt_work_24)
replace var_lt_work_24=mean_var
drop mean_var

bysort year: egen mean_var=mean(gini_lt_work_24)
replace gini_lt_work_24=mean_var
drop mean_var

bysort year: egen mean_var=mean(p85_p15_lt_work_24)
replace p85_p15_lt_work_24=mean_var
drop mean_var

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_29"
bysort year: egen mean_var=mean(var_lt_work_29)
replace var_lt_work_29=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_29)
replace gini_lt_work_29=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_29)
replace p85_p15_lt_work_29=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_34"
bysort year: egen mean_var=mean(var_lt_work_34)
replace var_lt_work_34=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_34)
replace gini_lt_work_34=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_34)
replace p85_p15_lt_work_34=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_39"
bysort year: egen mean_var=mean(var_lt_work_39)
replace var_lt_work_39=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_39)
replace gini_lt_work_39=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_39)
replace p85_p15_lt_work_39=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_44"
bysort year: egen mean_var=mean(var_lt_work_44)
replace var_lt_work_44=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_44)
replace gini_lt_work_44=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_44)
replace p85_p15_lt_work_44=mean_var
drop mean_var

*bysort year: gen counter=_n if gini_lt_work!=.
*keep if counter==1

label variable gini_lt_work_24 "24-34"
label variable var_lt_work_24 "24-34"
label variable p85_p15_lt_work_24 "24-34"
label variable gini_lt_work_29 "29-39"
label variable var_lt_work_29 "29-39"
label variable p85_p15_lt_work_29 "29-39"
label variable gini_lt_work_34 "34-44"
label variable var_lt_work_34 "34-44"
label variable p85_p15_lt_work_34 "34-44"
label variable gini_lt_work_39 "39-49"
label variable var_lt_work_39 "39-49"	
label variable p85_p15_lt_work_39 "39-49"
label variable gini_lt_work_44 "44-54"
label variable var_lt_work_44 "44-54"
label variable p85_p15_lt_work_44 "44-54"


***Gini Coefficients:
quietly twoway line var_lt_work_24 var_lt_work_29 var_lt_work_34 var_lt_work_39 var_lt_work_44 year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green orange magenta) lpattern(solid dash shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_lt.png, replace

quietly twoway line gini_lt_work_24 gini_lt_work_29 gini_lt_work_34 gini_lt_work_39 gini_lt_work_44 year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green orange magenta) lpattern(solid dash shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.1 (0.1) 0.5, labsize(large) angle(horizontal))
graph export gini_work_lt.png, replace

quietly twoway line p85_p15_lt_work_24 p85_p15_lt_work_29 p85_p15_lt_work_34 p85_p15_lt_work_39 p85_p15_lt_work_44 year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(1 (1) 4, labsize(large) angle(horizontal))
graph export perc8515_work_lt.png, replace

*** FEMALES


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_24_fem",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

bysort year: egen mean_var=mean(var_lt_work_24)
replace var_lt_work_24=mean_var
drop mean_var

bysort year: egen mean_var=mean(gini_lt_work_24)
replace gini_lt_work_24=mean_var
drop mean_var

bysort year: egen mean_var=mean(p85_p15_lt_work_24)
replace p85_p15_lt_work_24=mean_var
drop mean_var

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_29_fem"
bysort year: egen mean_var=mean(var_lt_work_29)
replace var_lt_work_29=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_29)
replace gini_lt_work_29=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_29)
replace p85_p15_lt_work_29=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_34_fem"
bysort year: egen mean_var=mean(var_lt_work_34)
replace var_lt_work_34=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_34)
replace gini_lt_work_34=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_34)
replace p85_p15_lt_work_34=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_39_fem"
bysort year: egen mean_var=mean(var_lt_work_39)
replace var_lt_work_39=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_39)
replace gini_lt_work_39=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_39)
replace p85_p15_lt_work_39=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_44_fem"
bysort year: egen mean_var=mean(var_lt_work_44)
replace var_lt_work_44=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_44)
replace gini_lt_work_44=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_44)
replace p85_p15_lt_work_44=mean_var
drop mean_var

*bysort year: gen counter=_n if gini_lt_work!=.
*keep if counter==1

label variable gini_lt_work_24 "24-34"
label variable var_lt_work_24 "24-34"
label variable p85_p15_lt_work_24 "24-34"
label variable gini_lt_work_29 "29-39"
label variable var_lt_work_29 "29-39"
label variable p85_p15_lt_work_29 "29-39"
label variable gini_lt_work_34 "34-44"
label variable var_lt_work_34 "34-44"
label variable p85_p15_lt_work_34 "34-44"
label variable gini_lt_work_39 "39-49"
label variable var_lt_work_39 "39-49"
label variable p85_p15_lt_work_39 "39-49"
label variable gini_lt_work_44 "44-54"
label variable var_lt_work_44 "44-54"
label variable p85_p15_lt_work_44 "44-54"


***Gini Coefficients:
quietly twoway line var_lt_work_24 var_lt_work_29 var_lt_work_34 var_lt_work_39 var_lt_work_44 year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_lt_fem.png, replace

quietly twoway line gini_lt_work_24 gini_lt_work_29 gini_lt_work_34 gini_lt_work_39 gini_lt_work_44 year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.1 (0.1) 0.5, labsize(large) angle(horizontal))
graph export gini_work_lt_fem.png, replace

quietly twoway line p85_p15_lt_work_24 p85_p15_lt_work_29 p85_p15_lt_work_34 p85_p15_lt_work_39 p85_p15_lt_work_44 year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green orange magenta) lpattern(solid dash shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(1 (1) 4, labsize(large) angle(horizontal))
graph export perc8515_work_lt_fem.png, replace

***Unc
*** Unconditional


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_24_unc",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_lt_work

bysort year: egen mean_var=mean(var_lt_work_24)
replace var_lt_work_24=mean_var
drop mean_var

bysort year: egen mean_var=mean(gini_lt_work_24)
replace gini_lt_work_24=mean_var
drop mean_var

bysort year: egen mean_var=mean(p85_p15_lt_work_24)
replace p85_p15_lt_work_24=mean_var
drop mean_var

append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_29_unc"
bysort year: egen mean_var=mean(var_lt_work_29)
replace var_lt_work_29=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_29)
replace gini_lt_work_29=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_29)
replace p85_p15_lt_work_29=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_34_unc"
bysort year: egen mean_var=mean(var_lt_work_34)
replace var_lt_work_34=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_34)
replace gini_lt_work_34=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_34)
replace p85_p15_lt_work_34=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_39_unc"
bysort year: egen mean_var=mean(var_lt_work_39)
replace var_lt_work_39=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_39)
replace gini_lt_work_39=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_39)
replace p85_p15_lt_work_39=mean_var
drop mean_var
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lt_44_unc"
bysort year: egen mean_var=mean(var_lt_work_44)
replace var_lt_work_44=mean_var
drop mean_var
bysort year: egen mean_var=mean(gini_lt_work_44)
replace gini_lt_work_44=mean_var
drop mean_var
bysort year: egen mean_var=mean(p85_p15_lt_work_44)
replace p85_p15_lt_work_44=mean_var
drop mean_var

*bysort year: gen counter=_n if gini_lt_work!=.
*keep if counter==1

label variable gini_lt_work_24 "24-34"
label variable var_lt_work_24 "24-34"
label variable p85_p15_lt_work_24 "24-34"
label variable gini_lt_work_29 "29-39"
label variable var_lt_work_29 "29-39"
label variable p85_p15_lt_work_29 "29-39"
label variable gini_lt_work_34 "34-44"
label variable var_lt_work_34 "34-44"
label variable p85_p15_lt_work_34 "34-44"
label variable gini_lt_work_39 "39-49"
label variable var_lt_work_39 "39-49"
label variable p85_p15_lt_work_39 "39-49"
label variable gini_lt_work_44 "44-54"
label variable var_lt_work_44 "44-54"
label variable p85_p15_lt_work_44 "44-54"


***Gini Coefficients:
quietly twoway line var_lt_work_24 var_lt_work_29 var_lt_work_34 var_lt_work_39 var_lt_work_44 year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_lt_unc.png, replace

quietly twoway line gini_lt_work_24 gini_lt_work_29 gini_lt_work_34 gini_lt_work_39 gini_lt_work_44 year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.1 (0.1) 0.5, labsize(large) angle(horizontal))
graph export gini_work_lt_unc.png, replace

quietly twoway line p85_p15_lt_work_24 p85_p15_lt_work_29 p85_p15_lt_work_34 p85_p15_lt_work_39 p85_p15_lt_work_44 year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1)) lcolor(blue red green orange magenta) lpattern(solid dash shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(1 (1) 4, labsize(large) angle(horizontal))
graph export perc8515_work_lt_unc.png, replace


*** 5 year cross section:

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lfive_unc",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

*tabstat var_cs_work, by(year) statistics(mean n)

***Gini Coefficients:
label variable var_cs_work "R-SIAB7514"
quietly twoway line var_cs_work year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_lfive_unc.png, replace

label variable gini_cs_work "R-SIAB7514"
quietly twoway line gini_cs_work year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.1 (0.1) 0.5, labsize(large) angle(horizontal))
graph export gini_work_lfive_unc.png, replace

label variable p85_p15_cs_work "R-SIAB7514"
quietly twoway line p85_p15_cs_work year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lcolor(blue red green orange magenta) lpattern(solid dash shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(1 (1) 4, labsize(large) angle(horizontal))
graph export perc8515_work_lfive_unc.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lfive",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

*tabstat var_cs_work, by(year) statistics(mean n)

***Gini Coefficients:
label variable var_cs_work "R-SIAB7514"
quietly twoway line var_cs_work year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_lfive.png, replace

label variable gini_cs_work "R-SIAB7514"
quietly twoway line gini_cs_work year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.1 (0.1) 0.5, labsize(large) angle(horizontal))
graph export gini_work_lfive.png, replace

label variable p85_p15_cs_work "R-SIAB7514"
quietly twoway line p85_p15_cs_work year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lcolor(blue red green orange magenta) lpattern(solid dash shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(1 (1) 4, labsize(large) angle(horizontal))
graph export perc8515_work_lfive.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_lfive_fem",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year

*tabstat var_cs_work, by(year) statistics(mean n)

***Gini Coefficients:
label variable var_cs_work "R-SIAB7514"
quietly twoway line var_cs_work year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_work_lfive_fem.png, replace

label variable gini_cs_work "R-SIAB7514"
quietly twoway line gini_cs_work year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.1 (0.1) 0.5, labsize(large) angle(horizontal))
graph export gini_work_lfive_fem.png, replace

label variable p85_p15_cs_work "R-SIAB7514"
quietly twoway line p85_p15_cs_work year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lcolor(blue red green orange magenta) lpattern(solid dash shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(1 (1) 4, labsize(large) angle(horizontal))
graph export perc8515_work_lfive_fem.png, replace
