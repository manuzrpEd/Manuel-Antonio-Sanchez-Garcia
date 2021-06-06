clear
set more off
set memory 16g
use "\pgen_data\apgen.dta", clear
cd "\Codes"

*gen year variable:

gen year=1984

*gen german variable:

gen german=1 if nation84==1
replace german=0 if german!=1 & nation84>0

*gen partner variable:

gen partner=0 if partz84==0
replace partner=1 if partz84>0

*gen married variable:

gen married=1 if afamstd==1 | afamstd==7
replace married=0 if afamstd>1 & afamstd!=7

*second job indicator variable:

gen second_job_indic=1 if sndjob84>0
replace second_job_indic=0 if sndjob84<0

*unemployed (inactive) variable:

gen unemp_indic=1 if stib84==10 | stib84==12
replace unemp_indic=0 if stib84>0 & unemp_indic!=1

*pensioner variable:

gen pensioner_indic=1 if stib84==13
replace pensioner_indic=0 if stib84>0 & pensioner_indic!=1

*apprentice variable:

gen apprentice_indic=1 if stib84>=110 & stib84<=150
replace apprentice_indic=0 if stib84>0 & apprentice_indic!=1

*self employment variable:

gen self_emp_indic=1 if stib84>=410 & stib84<=440
replace self_emp_indic=0 if stib84>0 & self_emp_indic!=1

*civil service variable:

gen civil_serv_indic=1 if stib84>=410 & stib84<=440
replace civil_serv_indic=0 if stib84>0 & civil_serv_indic!=1

*or can use civil service variable itself...

save "\Codes\clean_apgen", replace
