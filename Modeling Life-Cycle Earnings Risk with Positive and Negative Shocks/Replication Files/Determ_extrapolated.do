clear matrix
use "PATH\Cleaning_extrapolated.dta", clear
cd "PATH"
set more off
*
*tab year, g(year) year1-year35
tab age, g(age)
reg log_earnings age2-age32 i.year_birth
parmby "reg log_earnings age2-age32 i.year_birth",saving(determ,replace) label
use determ,clear
preserve
keep if parmseq<=31
keep estimate
outsheet using determ_age, comma nolabel nonames replace
restore
*preserve
*keep if parmseq <36
*keep estimate
*outsheet using determ_year, comma nolabel nonames replace
*restore
preserve
keep if parmseq >31
keep estimate
outsheet using determ_year_birth, comma nolabel nonames replace
restore
/*
reg log_earnings i.year i.age i.year_birth
reg log_earnings year1975-year2009 age25-age55 year_birth

