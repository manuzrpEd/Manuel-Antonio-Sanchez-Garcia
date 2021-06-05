* FOR HUMP
use "PATH\Cleaning_extrapolated.dta", clear
cd "PATH"
set more off
*
*Drop top / bottom 1% in case outliers shape the profile (bootstrap confidence intervals)
bysort age year_birth: egen p01 = pctile(log_earnings), p(1)
bysort age year_birth: egen p99 = pctile(log_earnings), p(99)
bysort age year_birth: egen p05 = pctile(log_earnings), p(5)
bysort age year_birth: egen p95 = pctile(log_earnings), p(95)
bysort age year_birth: egen p10 = pctile(log_earnings), p(10)
bysort age year_birth: egen p90 = pctile(log_earnings), p(90)
g outside=(log_earnings>p99 | log_earnings<p01)
order log_earnings,last
*drop if outside==1
*
*
bysort age year_birth: egen sdlh=sd(log_earnings)
gen varlh=sdlh^2
egen sdlh40=sd(log_earnings) if age==40
gen varlh40=sdlh40^2
sum varlh40
scalar var_ref=r(mean)
qui tab age, generate(dum_age)
qui tab coh, generate(dum_coh)
qui tab year_birth, generate(dum_year_birth)
qui tab year, generate(dum_year)
parmby "reg varlh i.age i.year_birth",saving(hump_extrapolated,replace) label
*Naming Estimates
use hump_extrapolated,clear
drop if parmseq>32
drop if estimate==0
replace parm=substr(parm,1,length(parm)-4)
encode parm, generate(parme)
*
gen parmet=parme+24
*Variance Scaling as in Deaton and Paxson 1994
gen diff_varlh=var_ref -estimate if parmet==40
egen sum_diff_varlh=total(diff_varlh)
drop diff_varlh
rename sum_diff_varlh diff_varlh
replace estimate=estimate+diff_varlh
replace estimate=var_ref  if parmet==40
*Graphing
sort parmet
twoway line estimate parmet, ytitle("") xtitle(Age) title("Variance of Log of Earnings") connect(l) xlabel(25 (5) 55)
*graph export hump.pdf, replace
keep estimate
outsheet using hump_extrapolated, comma nolabel nonames replace
*

*
* FOR MEAN of Inequality at first employment year
use "PATH\Cleaning_extrapolated.dta", clear
cd "PATH"
set more off
*
*Drop top / bottom 1% in case outliers shape the hump (bootstrap confidence intervals)
bysort age year_birth: egen p01 = pctile(log_earnings), p(1)
bysort age year_birth: egen p99 = pctile(log_earnings), p(99)
bysort age year_birth: egen p05 = pctile(log_earnings), p(5)
bysort age year_birth: egen p95 = pctile(log_earnings), p(95)
bysort age year_birth: egen p10 = pctile(log_earnings), p(10)
bysort age year_birth: egen p90 = pctile(log_earnings), p(90)
g outside=(log_earnings>p99 | log_earnings<p01)
order log_earnings,last
*drop if outside==1
*
*
bysort age year_birth: egen sdlh=sd(log_earnings)
gen varlh=sdlh^2
egen sdlh40=sd(log_earnings) if age==40
gen varlh40=sdlh40^2
sum varlh40
scalar var_ref=r(mean)
qui tab age, generate(dum_age)
qui tab coh, generate(dum_coh)
qui tab year_birth, generate(dum_year_birth)
qui tab year, generate(dum_year)
parmby "reg varlh i.age i.year_birth",saving(hump_extrapolated,replace) label
*Naming Estimates
use hump_extrapolated,clear
*
drop if parmseq<34
keep estimate
outsheet using coh_coeff_extrapolated, comma nolabel nonames replace
*

* FOR COV1 and COV2
cls
use "PATH\Cleaning_extrapolated.dta", clear
cd "PATH"
set more off
sort indivnr age
bysort indivnr: g log_earnings_1=log_earnings[_n+1]
sort indivnr age
bysort indivnr: g log_earnings_2=log_earnings[_n+2]
sort indivnr age
bysort indivnr: g log_earnings_3=log_earnings[_n+3]
sort indivnr age
bysort indivnr: g log_earnings_4=log_earnings[_n+4]
sort indivnr age
bysort indivnr: g log_earnings_5=log_earnings[_n+5]
sort indivnr age
bysort indivnr: g log_earnings_6=log_earnings[_n+6]
sort indivnr age
bysort indivnr: g log_earnings_7=log_earnings[_n+7]
sort indivnr age
bysort indivnr: g log_earnings_8=log_earnings[_n+8]
sort indivnr age
bysort indivnr: g log_earnings_9=log_earnings[_n+9]
sort indivnr age
bysort indivnr: g log_earnings_10=log_earnings[_n+10]
*
*create acv
sort year_birth age
*
*
sort age year_birth
egen cov1=corr(log_earnings_1 log_earnings), covariance by(age year_birth)
egen cov2=corr(log_earnings_2 log_earnings), covariance by(age year_birth)
egen cov3=corr(log_earnings_3 log_earnings), covariance by(age year_birth)
egen cov4=corr(log_earnings_4 log_earnings), covariance by(age year_birth)
egen cov5=corr(log_earnings_5 log_earnings), covariance by(age year_birth)
egen cov6=corr(log_earnings_6 log_earnings), covariance by(age year_birth)
egen cov7=corr(log_earnings_7 log_earnings), covariance by(age year_birth)
egen cov8=corr(log_earnings_8 log_earnings), covariance by(age year_birth)
egen cov9=corr(log_earnings_9 log_earnings), covariance by(age year_birth)
egen cov10=corr(log_earnings_10 log_earnings), covariance by(age year_birth)
*
g cov1_40=.
g cov2_40=.
g cov3_40=.
g cov4_40=.
g cov5_40=.
g cov6_40=.
g cov7_40=.
g cov8_40=.
g cov9_40=.
g cov10_40=.
quietly correlate log_earnings_1 log_earnings if age==40, covariance
quietly replace cov1_40=r(cov_12) if age==40
quietly correlate log_earnings_2 log_earnings if age==40, covariance
quietly replace cov2_40=r(cov_12) if age==40
quietly correlate log_earnings_3 log_earnings if age==40, covariance
quietly replace cov3_40=r(cov_12) if age==40
quietly correlate log_earnings_4 log_earnings if age==40, covariance
quietly replace cov4_40=r(cov_12) if age==40
quietly correlate log_earnings_5 log_earnings if age==40, covariance
quietly replace cov5_40=r(cov_12) if age==40
quietly correlate log_earnings_6 log_earnings if age==40, covariance
quietly replace cov6_40=r(cov_12) if age==40
quietly correlate log_earnings_7 log_earnings if age==40, covariance
quietly replace cov7_40=r(cov_12) if age==40
quietly correlate log_earnings_8 log_earnings if age==40, covariance
quietly replace cov8_40=r(cov_12) if age==40
quietly correlate log_earnings_9 log_earnings if age==40, covariance
quietly replace cov9_40=r(cov_12) if age==40
quietly correlate log_earnings_10 log_earnings if age==40, covariance
quietly replace cov10_40=r(cov_12) if age==40
*
sum cov1_40
scalar scale_cov1_40=r(mean)
*.1276451
sum cov2_40
scalar scale_cov2_40=r(mean)
sum cov3_40
scalar scale_cov3_40=r(mean)
sum cov4_40
scalar scale_cov4_40=r(mean)
sum cov5_40
scalar scale_cov5_40=r(mean)
sum cov6_40
scalar scale_cov6_40=r(mean)
sum cov7_40
scalar scale_cov7_40=r(mean)
sum cov8_40
scalar scale_cov8_40=r(mean)
sum cov9_40
scalar scale_cov9_40=r(mean)
sum cov10_40
scalar scale_cov10_40=r(mean)
*.1208287
*sum varlh40
*scalar var_ref=r(mean)

qui tab age, generate(dum_age)
qui tab coh, generate(dum_coh)
qui tab year_birth, generate(dum_year_birth)
qui tab year, generate(dum_year)

save temp.dta, replace

use temp.dta, clear

parmby "reg cov1 i.age i.year_birth",saving(cov1_extrapolated,replace) label
*Naming Estimates
use cov1_extrapolated,clear
drop if parmseq>31
drop if estimate==0
replace parm=substr(parm,1,length(parm)-4)
encode parm, generate(parme)
*
gen parmet=parme+24
*Variance Scaling as in Deaton and Paxson 1994
gen diff_varlh=scale_cov1_40 -estimate if parmet==40
egen sum_diff_varlh=total(diff_varlh)
drop diff_varlh
rename sum_diff_varlh diff_varlh
replace estimate=estimate+diff_varlh
replace estimate=scale_cov1_40  if parmet==40
*Graphing
sort parmet
twoway line estimate parmet, ytitle("") xtitle(Age) title("COV1 Log of Earnings") connect(l) xlabel(25 (5) 55)
*save temp_cov1.dta, replace
graph export cov1_extrapolated.png, replace
keep estimate
outsheet using cov1_extrapolated, comma nolabel nonames replace

use temp.dta, clear
*
parmby "reg cov2 i.age i.year_birth",saving(cov2_extrapolated,replace) label
*Naming Estimates
use cov2_extrapolated,clear
drop if parmseq>30
drop if estimate==0
replace parm=substr(parm,1,length(parm)-4)
encode parm, generate(parme)
*
gen parmet=parme+24
*Variance Scaling as in Deaton and Paxson 1994
gen diff_varlh=scale_cov2_40 -estimate if parmet==40
egen sum_diff_varlh=total(diff_varlh)
drop diff_varlh
rename sum_diff_varlh diff_varlh
replace estimate=estimate+diff_varlh
replace estimate=scale_cov2_40  if parmet==40
*Graphing
sort parmet
twoway line estimate parmet, ytitle("") xtitle(Age) title("COV2 Log of Earnings") connect(l) xlabel(25 (5) 55)
*save temp_cov2.dta, replace
graph export cov2_extrapolated.png, replace
keep estimate
outsheet using cov2_extrapolated, comma nolabel nonames replace

use temp.dta, clear
*
parmby "reg cov3 i.age i.year_birth",saving(cov3_extrapolated,replace) label
*Naming Estimates
use cov3_extrapolated,clear
drop if parmseq>29
drop if estimate==0
replace parm=substr(parm,1,length(parm)-4)
encode parm, generate(parme)
*
gen parmet=parme+24
*Variance Scaling as in Deaton and Paxson 1994
gen diff_varlh=scale_cov3_40 -estimate if parmet==40
egen sum_diff_varlh=total(diff_varlh)
drop diff_varlh
rename sum_diff_varlh diff_varlh
replace estimate=estimate+diff_varlh
replace estimate=scale_cov3_40  if parmet==40
*Graphing
sort parmet
twoway line estimate parmet, ytitle("") xtitle(Age) title("cov3 Log of Earnings") connect(l) xlabel(25 (5) 55)
*save temp_cov3.dta, replace
graph export cov3_extrapolated.png, replace
keep estimate
outsheet using cov3_extrapolated, comma nolabel nonames replace

use temp.dta, clear
*
parmby "reg cov4 i.age i.year_birth",saving(cov4_extrapolated,replace) label
*Naming Estimates
use cov4_extrapolated,clear
drop if parmseq>28
drop if estimate==0
replace parm=substr(parm,1,length(parm)-4)
encode parm, generate(parme)
*
gen parmet=parme+24
*Variance Scaling as in Deaton and Paxson 1994
gen diff_varlh=scale_cov4_40 -estimate if parmet==40
egen sum_diff_varlh=total(diff_varlh)
drop diff_varlh
rename sum_diff_varlh diff_varlh
replace estimate=estimate+diff_varlh
replace estimate=scale_cov4_40  if parmet==40
*Graphing
sort parmet
twoway line estimate parmet, ytitle("") xtitle(Age) title("cov4 Log of Earnings") connect(l) xlabel(25 (5) 55)
*save temp_cov4.dta, replace
graph export cov4_extrapolated.png, replace
keep estimate
outsheet using cov4_extrapolated, comma nolabel nonames replace

use temp.dta, clear
*
parmby "reg cov5 i.age i.year_birth",saving(cov5_extrapolated,replace) label
*Naming Estimates
use cov5_extrapolated,clear
drop if parmseq>27
drop if estimate==0
replace parm=substr(parm,1,length(parm)-4)
encode parm, generate(parme)
*
gen parmet=parme+24
*Variance Scaling as in Deaton and Paxson 1994
gen diff_varlh=scale_cov5_40 -estimate if parmet==40
egen sum_diff_varlh=total(diff_varlh)
drop diff_varlh
rename sum_diff_varlh diff_varlh
replace estimate=estimate+diff_varlh
replace estimate=scale_cov5_40  if parmet==40
*Graphing
sort parmet
twoway line estimate parmet, ytitle("") xtitle(Age) title("cov5 Log of Earnings") connect(l) xlabel(25 (5) 55)
*save temp_cov5.dta, replace
graph export cov5_extrapolated.png, replace
keep estimate
outsheet using cov5_extrapolated, comma nolabel nonames replace

use temp.dta, clear
*
parmby "reg cov6 i.age i.year_birth",saving(cov6_extrapolated,replace) label
*Naming Estimates
use cov6_extrapolated,clear
drop if parmseq>26
drop if estimate==0
replace parm=substr(parm,1,length(parm)-4)
encode parm, generate(parme)
*
gen parmet=parme+24
*Variance Scaling as in Deaton and Paxson 1994
gen diff_varlh=scale_cov6_40 -estimate if parmet==40
egen sum_diff_varlh=total(diff_varlh)
drop diff_varlh
rename sum_diff_varlh diff_varlh
replace estimate=estimate+diff_varlh
replace estimate=scale_cov6_40  if parmet==40
*Graphing
sort parmet
twoway line estimate parmet, ytitle("") xtitle(Age) title("cov6 Log of Earnings") connect(l) xlabel(25 (5) 55)
*save temp_cov6.dta, replace
graph export cov6_extrapolated.png, replace
keep estimate
outsheet using cov6_extrapolated, comma nolabel nonames replace

use temp.dta, clear
*
parmby "reg cov7 i.age i.year_birth",saving(cov7_extrapolated,replace) label
*Naming Estimates
use cov7_extrapolated,clear
drop if parmseq>25
drop if estimate==0
replace parm=substr(parm,1,length(parm)-4)
encode parm, generate(parme)
*
gen parmet=parme+24
*Variance Scaling as in Deaton and Paxson 1994
gen diff_varlh=scale_cov7_40 -estimate if parmet==40
egen sum_diff_varlh=total(diff_varlh)
drop diff_varlh
rename sum_diff_varlh diff_varlh
replace estimate=estimate+diff_varlh
replace estimate=scale_cov7_40  if parmet==40
*Graphing
sort parmet
twoway line estimate parmet, ytitle("") xtitle(Age) title("cov7 Log of Earnings") connect(l) xlabel(25 (5) 55)
*save temp_cov7.dta, replace
graph export cov7_extrapolated.png, replace
keep estimate
outsheet using cov7_extrapolated, comma nolabel nonames replace

use temp.dta, clear
*
parmby "reg cov8 i.age i.year_birth",saving(cov8_extrapolated,replace) label
*Naming Estimates
use cov8_extrapolated,clear
drop if parmseq>24
drop if estimate==0
replace parm=substr(parm,1,length(parm)-4)
encode parm, generate(parme)
*
gen parmet=parme+24
*Variance Scaling as in Deaton and Paxson 1994
gen diff_varlh=scale_cov8_40 -estimate if parmet==40
egen sum_diff_varlh=total(diff_varlh)
drop diff_varlh
rename sum_diff_varlh diff_varlh
replace estimate=estimate+diff_varlh
replace estimate=scale_cov8_40  if parmet==40
*Graphing
sort parmet
twoway line estimate parmet, ytitle("") xtitle(Age) title("cov8 Log of Earnings") connect(l) xlabel(25 (5) 55)
*save temp_cov8.dta, replace
graph export cov8_extrapolated.png, replace
keep estimate
outsheet using cov8_extrapolated, comma nolabel nonames replace

use temp.dta, clear
*
parmby "reg cov9 i.age i.year_birth",saving(cov9_extrapolated,replace) label
*Naming Estimates
use cov9_extrapolated,clear
drop if parmseq>23
drop if estimate==0
replace parm=substr(parm,1,length(parm)-4)
encode parm, generate(parme)
*
gen parmet=parme+24
*Variance Scaling as in Deaton and Paxson 1994
gen diff_varlh=scale_cov9_40 -estimate if parmet==40
egen sum_diff_varlh=total(diff_varlh)
drop diff_varlh
rename sum_diff_varlh diff_varlh
replace estimate=estimate+diff_varlh
replace estimate=scale_cov9_40  if parmet==40
*Graphing
sort parmet
twoway line estimate parmet, ytitle("") xtitle(Age) title("cov9 Log of Earnings") connect(l) xlabel(25 (5) 55)
*save temp_cov9.dta, replace
graph export cov9_extrapolated.png, replace
keep estimate
outsheet using cov9_extrapolated, comma nolabel nonames replace

use temp.dta, clear
*
parmby "reg cov10 i.age i.year_birth",saving(cov10_extrapolated,replace) label
*Naming Estimates
use cov10_extrapolated,clear
drop if parmseq>22
drop if estimate==0
replace parm=substr(parm,1,length(parm)-4)
encode parm, generate(parme)
*
gen parmet=parme+24
*Variance Scaling as in Deaton and Paxson 1994
gen diff_varlh=scale_cov10_40 -estimate if parmet==40
egen sum_diff_varlh=total(diff_varlh)
drop diff_varlh
rename sum_diff_varlh diff_varlh
replace estimate=estimate+diff_varlh
replace estimate=scale_cov10_40  if parmet==40
*Graphing
sort parmet
twoway line estimate parmet, ytitle("") xtitle(Age) title("cov10 Log of Earnings") connect(l) xlabel(25 (5) 55)
*save temp_cov10.dta, replace
graph export cov10_extrapolated.png, replace
keep estimate
outsheet using cov10_extrapolated, comma nolabel nonames replace

*continue!
use cov1_extrapolated.dta, clear
drop if parmseq<33
keep estimate
outsheet using cov1_coeff_extrapolated, comma nolabel nonames replace
*
use cov2_extrapolated.dta, clear
drop if parmseq<32
keep estimate
outsheet using cov2_coeff_extrapolated, comma nolabel nonames replace
*
use cov3_extrapolated.dta, clear
drop if parmseq<31
keep estimate
outsheet using cov3_coeff_extrapolated, comma nolabel nonames replace
*
use cov4_extrapolated.dta, clear
drop if parmseq<30
keep estimate
outsheet using cov4_coeff_extrapolated, comma nolabel nonames replace
*
use cov5_extrapolated.dta, clear
drop if parmseq<29
keep estimate
outsheet using cov5_coeff_extrapolated, comma nolabel nonames replace
*
use cov6_extrapolated.dta, clear
drop if parmseq<28
keep estimate
outsheet using cov6_coeff_extrapolated, comma nolabel nonames replace
*
use cov7_extrapolated.dta, clear
drop if parmseq<27
keep estimate
outsheet using cov7_coeff_extrapolated, comma nolabel nonames replace
*
use cov8_extrapolated.dta, clear
drop if parmseq<26
keep estimate
outsheet using cov8_coeff_extrapolated, comma nolabel nonames replace
*
use cov9_extrapolated.dta, clear
drop if parmseq<25
keep estimate
outsheet using cov9_coeff_extrapolated, comma nolabel nonames replace
*
use cov10_extrapolated.dta, clear
drop if parmseq<24
keep estimate
outsheet using cov10_coeff_extrapolated, comma nolabel nonames replace
