*Log Earnings to construct Hump in S.E. Bootstrap
use "PATH\Cleaning_extrapolated.dta", clear
cd "PATH"
set more off
keep age indivnr log_earnings coh year_birth year
sort indivnr age 
order age indivnr log_earnings year_birth year coh, last
outsheet using hump_logearnings_se_extrapolated, comma nolabel nonames replace
*Log Earnings to construct Hump in S.E. Bootstrap
*create percentiles by age:
use "PATH\Cleaning_extrapolated.dta", clear
cd "PATH"
set more off
keep age indivnr adj_earnings_year log_earnings coh year_birth year
sort indivnr age 
bysort age: egen p1=pctile(adj_earnings_year), p(1)
bysort age: egen p5=pctile(adj_earnings_year), p(5)
bysort age: egen p10=pctile(adj_earnings_year), p(10)
bysort age: egen p20=pctile(adj_earnings_year), p(20)
bysort age: egen p50=pctile(adj_earnings_year), p(50)
bysort age: egen p90=pctile(adj_earnings_year), p(90)
bysort age: egen p95=pctile(adj_earnings_year), p(95)
bysort age: egen p99=pctile(adj_earnings_year), p(99)
*
bysort indivnr: gen tot=_N
egen max_tot=max(tot)
drop if tot!=max_tot
*
sort indivnr age 
egen indivnr2=group(indivnr)
drop indivnr
rename indivnr2 indivnr
*
sort indivnr age 
drop if indivnr!=1
*
bysort age: gen p99_p50=p99/p50
bysort age: gen p50_p1=p50/p1
*
graph twoway line p99_p50 age
*
keep p1 p5 p10 p20 p50 p90 p95 p99
outsheet using perc_data, comma nolabel nonames replace

*create gini earnings by age:
cls
use "PATH\Cleaning_extrapolated.dta", clear
cd "PATH"
set more off
keep age indivnr adj_earnings_year log_earnings coh year_birth year
sort indivnr age 
*
g gini_age=.
forval i=24/55 {
qui fastgini adj_earnings_year if age==`i'
replace gini_age=r(gini) if age==`i'
}
*
bysort indivnr: gen tot=_N
egen max_tot=max(tot)
drop if tot!=max_tot
*
sort indivnr age 
egen indivnr2=group(indivnr)
drop indivnr
rename indivnr2 indivnr
*
sort indivnr age 
drop if indivnr!=1
*
graph twoway line gini_age age
*
keep gini_age
outsheet using gini_age_data, comma nolabel nonames replace
*
