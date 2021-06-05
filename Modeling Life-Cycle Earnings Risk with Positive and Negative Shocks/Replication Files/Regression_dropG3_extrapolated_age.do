*
use "PATH\Cleaning_extrapolated.dta", clear
cd "PATH"
sum indivnr
set more off
keep schooling T coh diff_log_earn indivnr year hs age schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland econ_act log_earnings year_birth counter_estab days_year counter_ind
sort indivnr year
gen age2=age^2
*
qui gen col=1 if schooling==5 
qui replace col=1 if schooling==6
qui replace col=0 if schooling==1
qui replace col=0 if schooling==2
qui replace col=0 if schooling==3
qui replace col=0 if schooling==4
*
forval i=1/9 {
preserve
keep if coh==`i'
egen indivnr2=group(indivnr)
drop indivnr
rename indivnr2 indivnr
sum indivnr
restore
}
*
forval i=1/9 {
preserve
keep if coh==`i'
sum year
gen max=r(max)
gen min=r(min)
gen tot=max-min
bysort indivnr: egen imax=max(year)
bysort indivnr: egen imin=min(year)
gen itot=imax-imin
drop if tot!=itot
drop max min imax imin
restore
}
*
sort indivnr
by indivnr: gen g1=log_earnings[_n+1]-log_earnings[_n]
by indivnr: gen g2=log_earnings[_n+2]-log_earnings[_n]
by indivnr: gen g3=log_earnings[_n+3]-log_earnings[_n]
by indivnr: gen g4=log_earnings[_n+4]-log_earnings[_n]
by indivnr: gen g5=log_earnings[_n+5]-log_earnings[_n]
by indivnr: gen g6=log_earnings[_n+6]-log_earnings[_n]
by indivnr: gen g7=log_earnings[_n+7]-log_earnings[_n]
by indivnr: gen g8=log_earnings[_n+8]-log_earnings[_n]
by indivnr: gen g9=log_earnings[_n+9]-log_earnings[_n]
by indivnr: gen g10=log_earnings[_n+10]-log_earnings[_n]
by indivnr: gen g=log_earnings[_n]-log_earnings[_n-1]
by indivnr: gen gm1=log_earnings[_n]-log_earnings[_n-2]
*drop log_earnings
*save temp,replace
g u=.
g um1=.
g u1=.
g u2=.
g u3=.
g u4=.
g u5=.
g u6=.
g u7=.
g u8=.
g u9=.
g u10=.
*** g1
sort indivnr age
forval i=24/54 {
xi: reg g1 i.hs i.col i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act if age==`i'
predict y1, xb
replace u1=g1-y1 if age==`i'
replace g1=u1 if age==`i'
drop y1
}
*sort indivnr age
*save temp,replace
*** g2
sort indivnr age
forval i=24/53 {
xi: reg g2 i.hs i.col i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act  if age==`i'
predict y2, xb
replace u2=g2-y2 if age==`i'
replace g2=u2 if age==`i'
drop y2
}
*sort indivnr age
*save temp,replace
*** g3
sort indivnr age
forval i=24/52 {
xi: reg g3 i.hs i.col i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act if age==`i'
predict y3, xb
replace u3=g3-y3 if age==`i'
replace g3=u3 if age==`i'
drop y3
}
*sort indivnr age
*save temp,replace
*** g4
sort indivnr age
forval i=24/51 {
xi: reg g4 i.hs i.col i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act if age==`i'
predict y4, xb
replace u4=g4-y4 if age==`i'
replace g4=u4 if age==`i'
drop y4
}
*sort indivnr age
*save temp,replace
*** g5
sort indivnr age
forval i=24/50 {
xi: reg g5 i.hs i.col i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act if age==`i'
predict y5, xb
replace u5=g5-y5 if age==`i'
replace g5=u5 if age==`i'
drop y5
}
*sort indivnr age
*save temp,replace
*** g6
sort indivnr age
forval i=24/49 {
xi: reg g6 i.hs i.col i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act if age==`i'
predict y6, xb
replace u6=g6-y6 if age==`i'
replace g6=u6 if age==`i'
drop y6
}
*sort indivnr age
*save temp,replace
*** g7
sort indivnr age
forval i=24/48 {
xi: reg g7 i.hs i.col i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act if age==`i'
predict y7, xb
replace u7=g7-y7 if age==`i'
replace g7=u7 if age==`i'
drop y7
}
*sort indivnr age
*save temp,replace
*** g8
sort indivnr age
forval i=24/47 {
xi: reg g8 i.hs i.col i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act if age==`i'
predict y8, xb
replace u8=g8-y8 if age==`i'
replace g8=u8 if age==`i'
drop y8
}
*sort indivnr age
*save temp,replace
*** g9
sort indivnr age
forval i=24/46 {
xi: reg g9 i.hs i.col i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act if age==`i'
predict y9, xb
replace u9=g9-y9 if age==`i'
replace g9=u9 if age==`i'
drop y9
}
*sort indivnr age
*save temp,replace
*** g10
sort indivnr age
forval i=24/45 {
xi: reg g10 i.hs i.col i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act if age==`i'
predict y10, xb
replace u10=g10-y10 if age==`i'
replace g10=u10 if age==`i'
drop y10
}
*sort indivnr age
*save temp,replace
*** g
sort indivnr age
forval i=25/55 {
xi: reg g i.hs i.col i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act if age==`i'
predict y, xb
replace u=g-y if age==`i'
replace g=u if age==`i'
drop y
}
*sort indivnr age
*save temp,replace
*** gm1
sort indivnr age
forval i=26/55 {
xi: reg gm1 i.hs i.col i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act if age==`i'
predict ym1, xb
replace um1=gm1-ym1 if age==`i'
replace gm1=um1 if age==`i'
drop ym1
}
*sort indivnr age
*save temp,replace
cd "PATH"
*** END
forval i=1/9 {
preserve
*here
drop log_earnings
keep if coh==`i'
keep indivnr age g1 g2 g3 g4 g5 g6 g7 g8 g9 g10 g gm1
drop if g1==.
sort indivnr age 
outsheet using resid_coh_`i'_extrap, comma nolabel nonames replace
restore
}
cd "PATH"
save Regression_extrapolated, replace
