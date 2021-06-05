clear
set more off
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_2.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"


keep if female==0
keep if sample==21 | sample==23
*drop if sample==23 & year==1990
*drop if sample==23 & year==1991

qui drop if age<24
qui drop if age>55

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_2.dta", clear

*drop if civil_servant==1
keep if female==0
keep if sample==21 | sample==23

qui drop if age<24
qui drop if age>55

label language EN
