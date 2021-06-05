use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_cs",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_cs_work

bysort year: egen mean_var=mean(var_cs_work)
replace var_cs_work=mean_var
drop mean_var

bysort year: egen mean_var=mean(var_cs_full)
replace var_cs_full=mean_var
drop mean_var

bysort year: egen mean_var=mean(var_cs_part)
replace var_cs_part=mean_var
drop mean_var

bysort year: egen mean_var=mean(var_cs_mini)
replace var_cs_mini=mean_var
drop mean_var

bysort year: egen mean_gini=mean(gini_cs_work)
replace gini_cs_work=mean_gini
drop mean_gini

bysort year: egen mean_gini=mean(gini_cs_full) if form==1
replace gini_cs_full=mean_gini if form==1
drop mean_gini

bysort year: egen mean_gini=mean(gini_cs_part) if form==2
replace gini_cs_part=mean_gini if form==2
drop mean_gini

bysort year: egen mean_gini=mean(gini_cs_mini) if form==3
replace gini_cs_mini=mean_gini if form==3
drop mean_gini

label variable gini_cs_work "Cross Sectional Gini"
label variable gini_cs_full "Full Time"
label variable gini_cs_part "Part Time"
label variable gini_cs_mini "Mini Jobs"
label variable var_cs_work "Cross Sectional Var."
label variable var_cs_full "Full Time"
label variable var_cs_part "Part Time"
label variable var_cs_mini "Mini Jobs"
label variable kurt_cs_work "Cross Sectional Kurt"

*** p85, p50, p15 CS evolution

replace p85_cs_work=log(p85_cs_work)
replace p50_cs_work=log(p50_cs_work)
replace p15_cs_work=log(p15_cs_work)

label variable p85_cs_work "P_85"
label variable p50_cs_work "P_50"
label variable p15_cs_work "P_15"

quietly twoway line p85_cs_work p50_cs_work p15_cs_work year, ytitle({bf:P[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black black black) lpattern(solid dash shortdash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014,labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(8 (1) 11, labsize(large) angle(horizontal))
graph export perc_work.png, replace

***Gini Coefficients:

label variable gini_cs_work "R-SIAB7514"
quietly twoway line gini_cs_work year, ytitle({bf:G[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lpattern(solid dash) lcolor(blue) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export gini_work.png, replace

quietly twoway line gini_cs_full gini_cs_part gini_cs_mini year, ytitle({bf:G[Earnings]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export gini_form.png, replace

label variable var_cs_work "R-SIAB7514"
quietly twoway line var_cs_work year, ytitle({bf:Var[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lpattern(solid dash shortdash) lcolor(blue) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export var_work.png, replace

quietly twoway line var_cs_full var_cs_part var_cs_mini year, ytitle({bf:Var[Earnings]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.3) 1.2, labsize(large) angle(horizontal))
graph export var_form.png, replace

label variable var_cs_full "Full Time"
label variable var_cs_part "Part Time"
label variable var_cs_mini "Marg. Employment"
quietly twoway line var_cs_full var_cs_part var_cs_mini year, ytitle({bf:Var[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_wage.png, replace

label variable p85_p15_cs_work "R-SIAB7514"
quietly twoway line p85_p15_cs_work year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (2) 10, labsize(large) angle(horizontal))
graph export perc8515_work.png, replace

quietly twoway line p85_p15_cs_full p85_p15_cs_part p85_p15_cs_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (2) 10, labsize(large) angle(horizontal))
graph export perc8515_form.png, replace

label variable p85_p50_cs_work "R-SIAB7514"
quietly twoway line p85_p50_cs_work year, ytitle({bf:P{sub:85}/P{sub:50}[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(1 (1) 4, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc8550_work.png, replace

label variable p50_p15_cs_work "R-SIAB7514"
quietly twoway line p50_p15_cs_work year, ytitle({bf:P{sub:50}/P{sub:15}[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(1 (1) 4, labsize(large) angle(horizontal)) ylabel(, labsize(large) angle(horizontal))
graph export perc5015_work.png, replace

*quietly twoway line kurt_cs_work year, ytitle({bf:Kurt[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (5) 30, labsize(large) angle(horizontal))
*graph export kurt_work.png, replace


*** FEMALES


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_cs_fem",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_cs_work

bysort year: egen mean_var=mean(var_cs_work)
replace var_cs_work=mean_var
drop mean_var

bysort year: egen mean_var=mean(var_cs_full)
replace var_cs_full=mean_var
drop mean_var

bysort year: egen mean_var=mean(var_cs_part)
replace var_cs_part=mean_var
drop mean_var

bysort year: egen mean_var=mean(var_cs_mini)
replace var_cs_mini=mean_var
drop mean_var

bysort year: egen mean_gini=mean(gini_cs_work)
replace gini_cs_work=mean_gini
drop mean_gini

bysort year: egen mean_gini=mean(gini_cs_full) if form==1
replace gini_cs_full=mean_gini if form==1
drop mean_gini

bysort year: egen mean_gini=mean(gini_cs_part) if form==2
replace gini_cs_part=mean_gini if form==2
drop mean_gini

bysort year: egen mean_gini=mean(gini_cs_mini) if form==3
replace gini_cs_mini=mean_gini if form==3
drop mean_gini

label variable gini_cs_work "Cross Sectional Gini"
label variable gini_cs_full "Full Time"
label variable gini_cs_part "Part Time"
label variable gini_cs_mini "Mini Jobs"
label variable var_cs_work "Cross Sectional Var."
label variable var_cs_full "Full Time"
label variable var_cs_part "Part Time"
label variable var_cs_mini "Mini Jobs"
label variable kurt_cs_work "Cross Sectional Kurt"

*** p85, p50, p15 CS evolution

replace p85_cs_work=log(p85_cs_work)
replace p50_cs_work=log(p50_cs_work)
replace p15_cs_work=log(p15_cs_work)

label variable p85_cs_work "P_85"
label variable p50_cs_work "P_50"
label variable p15_cs_work "P_15"

quietly twoway line p85_cs_work p50_cs_work p15_cs_work year, ytitle({bf:P[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black black black) lpattern(solid dash shortdash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(8 (1) 11, labsize(large) angle(horizontal))
graph export perc_work_fem.png, replace

***Gini Coefficients:
label variable gini_cs_work "R-SIAB7514"
quietly twoway line gini_cs_work year, ytitle({bf:G[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lpattern(solid dash) lcolor(blue) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export gini_work_fem.png, replace

quietly twoway line gini_cs_full gini_cs_part gini_cs_mini year, ytitle({bf:G[Earnings]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export gini_form_fem.png, replace

label variable var_cs_work "R-SIAB7514"
quietly twoway line var_cs_work year, ytitle({bf:Var[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lpattern(solid dash dash_dot) lcolor(blue) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export var_work_fem.png, replace

quietly twoway line var_cs_full var_cs_part var_cs_mini year, ytitle({bf:Var[Earnings]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.3) 1.2, labsize(large) angle(horizontal))
graph export var_form_fem.png, replace

label variable var_cs_full "Full Time"
label variable var_cs_part "Part Time"
label variable var_cs_mini "Marg. Employment"
quietly twoway line var_cs_full var_cs_part var_cs_mini year, ytitle({bf:Var[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_wage_fem.png, replace

label variable p85_p15_cs_work "R-SIAB7514"
quietly twoway line p85_p15_cs_work year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (2) 10, labsize(large) angle(horizontal))
graph export perc8515_work_fem.png, replace

quietly twoway line p85_p15_cs_full p85_p15_cs_part p85_p15_cs_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (2) 10, labsize(large) angle(horizontal))
graph export perc8515_form_fem.png, replace

label variable p85_p50_cs_work "R-SIAB7514"
quietly twoway line p85_p50_cs_work year, ytitle({bf:P{sub:85}/P{sub:50}[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(1 (1) 4, labsize(large) angle(horizontal))
graph export perc8550_work_fem.png, replace

label variable p50_p15_cs_work "R-SIAB7514"
quietly twoway line p50_p15_cs_work year, ytitle({bf:P{sub:50}/P{sub:15}[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(1 (1) 4, labsize(large) angle(horizontal))
graph export perc5015_work_fem.png, replace

*quietly twoway line kurt_cs_work year, ytitle({bf:Kurt[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (4) 20, labsize(large) angle(horizontal))
*graph export kurt_work_fem.png, replace

***
*** Unconditional

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\bonke_cs_unc",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort year gini_cs_work

bysort year: egen mean_var=mean(var_cs_work)
replace var_cs_work=mean_var
drop mean_var

bysort year: egen mean_var=mean(var_cs_full)
replace var_cs_full=mean_var
drop mean_var

bysort year: egen mean_var=mean(var_cs_part)
replace var_cs_part=mean_var
drop mean_var

bysort year: egen mean_var=mean(var_cs_mini)
replace var_cs_mini=mean_var
drop mean_var

bysort year: egen mean_gini=mean(gini_cs_work)
replace gini_cs_work=mean_gini
drop mean_gini

bysort year: egen mean_gini=mean(gini_cs_full) if form==1
replace gini_cs_full=mean_gini if form==1
drop mean_gini

bysort year: egen mean_gini=mean(gini_cs_part) if form==2
replace gini_cs_part=mean_gini if form==2
drop mean_gini

bysort year: egen mean_gini=mean(gini_cs_mini) if form==3
replace gini_cs_mini=mean_gini if form==3
drop mean_gini

label variable gini_cs_work "Cross Sectional Gini"
label variable gini_cs_full "Full Time"
label variable gini_cs_part "Part Time"
label variable gini_cs_mini "Mini Jobs"
label variable var_cs_work "Cross Sectional Var."
label variable var_cs_full "Full Time"
label variable var_cs_part "Part Time"
label variable var_cs_mini "Mini Jobs"
label variable kurt_cs_work "Cross Sectional Kurt"

*** p85, p50, p15 CS evolution

replace p85_cs_work=log(p85_cs_work)
replace p50_cs_work=log(p50_cs_work)
replace p15_cs_work=log(p15_cs_work)

label variable p85_cs_work "P_85"
label variable p50_cs_work "P_50"
label variable p15_cs_work "P_15"

label variable var_cs_full "Full Time"
label variable var_cs_mini "Marg. Employment"
label variable var_cs_part "Part Time"

quietly twoway line p85_cs_work p50_cs_work p15_cs_work year, ytitle({bf:P[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black black black) lpattern(solid dash shortdash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(8 (1) 11, labsize(large) angle(horizontal))
graph export perc_work_unc.png, replace

***Gini Coefficients:
label variable gini_cs_work "R-SIAB7514"
quietly twoway line gini_cs_work year, ytitle({bf:G[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lpattern(solid dash) lcolor(blue) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export gini_work_unc.png, replace

quietly twoway line gini_cs_full gini_cs_part gini_cs_mini year, ytitle({bf:G[Earnings]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0.1 (0.1) 0.5, labsize(large) angle(horizontal))
graph export gini_form_unc.png, replace

label variable var_cs_work "R-SIAB7514"
quietly twoway line var_cs_work year, ytitle({bf:Var[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lpattern(solid dash shortdash) lcolor(blue) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export var_work_unc.png, replace

quietly twoway line var_cs_full var_cs_part var_cs_mini year, ytitle({bf:Var[log(Earnings)]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.9, labsize(large) angle(horizontal))
graph export var_form_unc.png, replace

quietly twoway line var_cs_full var_cs_part var_cs_mini year, ytitle({bf:Var[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_wage_unc.png, replace

quietly twoway line var_cs_full var_cs_part var_cs_mini year if year>=1999, ytitle({bf:Var[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_wage_99_unc.png, replace

label variable p85_p15_cs_work "R-SIAB7514"
quietly twoway line p85_p15_cs_work year, ytitle({bf:P{sub:85}/P{sub:15}[log(Earnings)]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (2) 10, labsize(large) angle(horizontal))
graph export perc8515_work_unc.png, replace

quietly twoway line p85_p15_cs_full p85_p15_cs_part p85_p15_cs_mini year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(2 (1) 6, labsize(large) angle(horizontal))
graph export perc8515_form_unc.png, replace

label variable p85_p50_cs_work "R-SIAB7514"
quietly twoway line p85_p50_cs_work year, ytitle({bf:P{sub:85}/P{sub:50}[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(1 (1) 4, labsize(large) angle(horizontal))
graph export perc8550_work_unc.png, replace

label variable p50_p15_cs_work "R-SIAB7514"
quietly twoway line p50_p15_cs_work year, ytitle({bf:P{sub:50}/P{sub:15}[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(1 (1) 4, labsize(large) angle(horizontal))
graph export perc5015_work_unc.png, replace

*quietly twoway line kurt_cs_work year, ytitle({bf:Kurt[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (4) 20, labsize(large) angle(horizontal))
*graph export kurt_work_fem.png, replace

*** do the above RESIDUAL
/*
cls
clear
set more off
*set memory 16g
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
ssc install fastgini

*keep if female==1

*** Cross Sectional Gini on Long Term Earnings

qui drop if age<24
qui drop if age>55
*this is to keep those that are in the sample starting at age 24...
*gen begin=1 if age==24
*bysort persn: egen sum_begin=sum(begin)
*bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
*keep if ind_begin==1

*qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
*drop if max_diff_year_g<15
*
gen log_daily_wage_full=log(daily_wage) if form==1
gen log_daily_wage_part=log(daily_wage) if form==2
gen log_daily_wage_mini=log(daily_wage) if form==3
*
*gen Log Deviations by year:
levels year, local(reg)
*foreach r of local reg {
*egen sd_full=sd(log_daily_wage) if year == `r' & form==1
*egen sd_part=sd(log_daily_wage) if year == `r' & form==2
*replace var_cs_full=sd_full if year == `r' & form==1 
*replace var_cs_part=sd_part if year == `r' & form==2 
*drop sd_full sd_part
*}
*forval r=1999/2014 {
*egen sd_mini=sd(log_daily_wage) if year == `r' & form==3
*replace var_cs_mini=sd_mini if year == `r' & form==3 
*drop sd_mini
*}
*
*replace var_cs_mini=var_cs_mini^2
*replace var_cs_part=var_cs_part^2
*replace var_cs_full=var_cs_full^2
*
gen u_mincer_full=.
foreach r of local reg {
xi: reg log_daily_wage_full i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_full=log_daily_wage_full-y1 if year == `r'
drop y1
}
*
*
gen u_mincer_part=.
foreach r of local reg {
xi: reg log_daily_wage_part i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_part=log_daily_wage_part-y1 if year == `r'
drop y1
}
*
*
gen u_mincer_mini=.
forval r=1999/2014 {
xi: reg log_daily_wage_mini i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_mini=log_daily_wage_mini-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer=sd(u_mincer_full)
bysort year: egen sd_part_mincer=sd(u_mincer_part)
bysort year: egen sd_mini_mincer=sd(u_mincer_mini)
*drop var_cs_full var_cs_part var_cs_mini
gen var_cs_full=sd_full_mincer^2
gen var_cs_part=sd_part_mincer^2
gen var_cs_mini=sd_mini_mincer^2

label variable var_cs_full "Full Time"
label variable var_cs_part "Part Time"
label variable var_cs_mini "Marg. Employment"

quietly twoway line var_cs_full var_cs_part var_cs_mini year, ytitle({bf:Var[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_wage_unc_resid.png, replace

cls
clear
set more off
*set memory 16g
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
ssc install fastgini

keep if female==0

*** Cross Sectional Gini on Long Term Earnings

qui drop if age<24
qui drop if age>55
*this is to keep those that are in the sample starting at age 24...
*gen begin=1 if age==24
*bysort persn: egen sum_begin=sum(begin)
*bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
*keep if ind_begin==1

*qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
*drop if max_diff_year_g<15
*
gen log_daily_wage_full=log(daily_wage) if form==1
gen log_daily_wage_part=log(daily_wage) if form==2
gen log_daily_wage_mini=log(daily_wage) if form==3
*
*gen Log Deviations by year:
levels year, local(reg)
*foreach r of local reg {
*egen sd_full=sd(log_daily_wage) if year == `r' & form==1
*egen sd_part=sd(log_daily_wage) if year == `r' & form==2
*replace var_cs_full=sd_full if year == `r' & form==1 
*replace var_cs_part=sd_part if year == `r' & form==2 
*drop sd_full sd_part
*}
*forval r=1999/2014 {
*egen sd_mini=sd(log_daily_wage) if year == `r' & form==3
*replace var_cs_mini=sd_mini if year == `r' & form==3 
*drop sd_mini
*}
*
*replace var_cs_mini=var_cs_mini^2
*replace var_cs_part=var_cs_part^2
*replace var_cs_full=var_cs_full^2
*
gen u_mincer_full=.
foreach r of local reg {
xi: reg log_daily_wage_full i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_full=log_daily_wage_full-y1 if year == `r'
drop y1
}
*
*
gen u_mincer_part=.
foreach r of local reg {
xi: reg log_daily_wage_part i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_part=log_daily_wage_part-y1 if year == `r'
drop y1
}
*
*
gen u_mincer_mini=.
forval r=1999/2014 {
xi: reg log_daily_wage_mini i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_mini=log_daily_wage_mini-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer=sd(u_mincer_full)
bysort year: egen sd_part_mincer=sd(u_mincer_part)
bysort year: egen sd_mini_mincer=sd(u_mincer_mini)
*drop var_cs_full var_cs_part var_cs_mini
gen var_cs_full=sd_full_mincer^2
gen var_cs_part=sd_part_mincer^2
gen var_cs_mini=sd_mini_mincer^2

label variable var_cs_full "Full Time"
label variable var_cs_part "Part Time"
label variable var_cs_mini "Marg. Employment"

quietly twoway line var_cs_full var_cs_part var_cs_mini year, ytitle({bf:Var[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_wage_resid.png, replace

*Figure IVS
cls
clear
set more off
*set memory 16g
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
ssc install fastgini

keep if female==1

*** Cross Sectional Gini on Long Term Earnings

qui drop if age<24
qui drop if age>55
*this is to keep those that are in the sample starting at age 24...
*gen begin=1 if age==24
*bysort persn: egen sum_begin=sum(begin)
*bysort persn: gen ind_begin=1 if sum_begin>0 & sum_begin!=.
*keep if ind_begin==1

*qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn: gen max_diff_year_g=max_year_g-min_year_g
bysort persn: gen diff_year_g=year-min_year_g
*drop if max_diff_year_g<15
*
gen log_daily_wage_full=log(daily_wage) if form==1
gen log_daily_wage_part=log(daily_wage) if form==2
gen log_daily_wage_mini=log(daily_wage) if form==3
*
*gen Log Deviations by year:
levels year, local(reg)
*foreach r of local reg {
*egen sd_full=sd(log_daily_wage) if year == `r' & form==1
*egen sd_part=sd(log_daily_wage) if year == `r' & form==2
*replace var_cs_full=sd_full if year == `r' & form==1 
*replace var_cs_part=sd_part if year == `r' & form==2 
*drop sd_full sd_part
*}
*forval r=1999/2014 {
*egen sd_mini=sd(log_daily_wage) if year == `r' & form==3
*replace var_cs_mini=sd_mini if year == `r' & form==3 
*drop sd_mini
*}
*
*replace var_cs_mini=var_cs_mini^2
*replace var_cs_part=var_cs_part^2
*replace var_cs_full=var_cs_full^2
*
gen u_mincer_full=.
foreach r of local reg {
xi: reg log_daily_wage_full i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_full=log_daily_wage_full-y1 if year == `r'
drop y1
}
*
*
gen u_mincer_part=.
foreach r of local reg {
xi: reg log_daily_wage_part i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_part=log_daily_wage_part-y1 if year == `r'
drop y1
}
*
*
gen u_mincer_mini=.
forval r=1999/2014 {
xi: reg log_daily_wage_mini i.educ*i.age  if year == `r'
predict y1 if year == `r', xb 
replace u_mincer_mini=log_daily_wage_mini-y1 if year == `r'
drop y1
}
*
bysort year: egen sd_full_mincer=sd(u_mincer_full)
bysort year: egen sd_part_mincer=sd(u_mincer_part)
bysort year: egen sd_mini_mincer=sd(u_mincer_mini)
*drop var_cs_full var_cs_part var_cs_mini
gen var_cs_full=sd_full_mincer^2
gen var_cs_part=sd_part_mincer^2
gen var_cs_mini=sd_mini_mincer^2

label variable var_cs_full "Full Time"
label variable var_cs_part "Part Time"
label variable var_cs_mini "Marg. Employment"

quietly twoway line var_cs_full var_cs_part var_cs_mini year, ytitle({bf:Var[log(w{sub:i})]}, size(large) height(5)) lcolor(blue red green) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export var_wage_fem_resid.png, replace
*/

