clear
set memory 16g
use "\Preliminars.dta", clear
set more off

log using Preliminars_a.log, replace
*
sum persnr
sum year
foreach i of numlist 1975 1985 1995 2005 2014 {
preserve
keep if year==`i'
egen indivnr=group(persnr)
sum indivnr
restore
}
*
tabstat counter_diff_estab, by(year) statistics(mean min max n)
log close

log using Preliminars_b.log, replace
*
tabstat source if source==1, by(year) statistics(n)
tabstat source if source==2, by(year) statistics(n)
tabstat source if source==3, by(year) statistics(n)
tabstat source if source==4, by(year) statistics(n)
*
tabstat female, by(year) statistics(mean n)
tab year_birth
tabstat german, by(year) statistics(mean n)
tabstat requirement, by(year) statistics(mean min max n)
tabstat part_time, by(year) statistics(mean n)
tabstat commuter, by(year) statistics(mean min max n)
tabstat fixed_term, by(year) statistics(mean n)
tabstat temp_agency, by(year) statistics(mean n)
tabstat dur_unemp, by(year) statistics(mean min max n)
tabstat midi_jobs, by(year) statistics(mean min max n)
log close

log using Preliminars_c.log, replace
* dig deeper in richer variables...
tabstat vocational_training if vocational_training==1, by(year) statistics(n)
tabstat vocational_training if vocational_training==2, by(year) statistics(n)
tabstat vocational_training if vocational_training==3, by(year) statistics(n)
tabstat vocational_training if vocational_training==4, by(year) statistics(n)
tabstat vocational_training if vocational_training==5, by(year) statistics(n)
tabstat vocational_training if vocational_training==6, by(year) statistics(n)
tabstat vocational_training if vocational_training==7, by(year) statistics(n)
tabstat vocational_training if vocational_training==8, by(year) statistics(n)
log close

log using Preliminars_d.log, replace
tabstat school_qualification if school_qualification==1, by(year) statistics(n)
tabstat school_qualification if school_qualification==2, by(year) statistics(n)
tabstat school_qualification if school_qualification==3, by(year) statistics(n)
tabstat school_qualification if school_qualification==4, by(year) statistics(n)
tabstat school_qualification if school_qualification==5, by(year) statistics(n)
tabstat school_qualification if school_qualification==6, by(year) statistics(n)
tabstat school_qualification if school_qualification==7, by(year) statistics(n)
log close

log using Preliminars_e.log, replace
tabstat employment_status if employment_status==1, by(year) statistics(n)
tabstat employment_status if employment_status==2, by(year) statistics(n)
tabstat employment_status if employment_status==3, by(year) statistics(n)
tabstat employment_status if employment_status==4, by(year) statistics(n)
tabstat employment_status if employment_status==5, by(year) statistics(n)
tabstat employment_status if employment_status==6, by(year) statistics(n)
tabstat employment_status if employment_status==11, by(year) statistics(n)
tabstat employment_status if employment_status==12, by(year) statistics(n)
tabstat employment_status if employment_status==13, by(year) statistics(n)
tabstat employment_status if employment_status==14, by(year) statistics(n)
tabstat employment_status if employment_status==21, by(year) statistics(n)
tabstat employment_status if employment_status==22, by(year) statistics(n)
tabstat employment_status if employment_status==31, by(year) statistics(n)
tabstat employment_status if employment_status==32, by(year) statistics(n)
log close

log using Preliminars_f.log, replace
tabstat reason if reason==0, by(year) statistics(n)
tabstat reason if reason==1, by(year) statistics(n)
tabstat reason if reason==2, by(year) statistics(n)
tabstat reason if reason==3, by(year) statistics(n)
tabstat reason if reason==4, by(year) statistics(n)
tabstat reason if reason==5, by(year) statistics(n)
tabstat reason if reason==6, by(year) statistics(n)
tabstat reason if reason==7, by(year) statistics(n)
tabstat reason if reason==8, by(year) statistics(n)
tabstat reason if reason==9, by(year) statistics(n)
tabstat reason if reason==10, by(year) statistics(n)
tabstat reason if reason==11, by(year) statistics(n)
tabstat reason if reason==12, by(year) statistics(n)
tabstat reason if reason==13, by(year) statistics(n)
tabstat reason if reason==15, by(year) statistics(n)
tabstat reason if reason==16, by(year) statistics(n)
tabstat reason if reason==20, by(year) statistics(n)
tabstat reason if reason==21, by(year) statistics(n)
tabstat reason if reason==22, by(year) statistics(n)
tabstat reason if reason==23, by(year) statistics(n)
tabstat reason if reason==24, by(year) statistics(n)
tabstat reason if reason==25, by(year) statistics(n)
tabstat reason if reason==26, by(year) statistics(n)
tabstat reason if reason==27, by(year) statistics(n)
tabstat reason if reason==28, by(year) statistics(n)
tabstat reason if reason==29, by(year) statistics(n)
tabstat reason if reason==30, by(year) statistics(n)
tabstat reason if reason==31, by(year) statistics(n)
tabstat reason if reason==32, by(year) statistics(n)
tabstat reason if reason==33, by(year) statistics(n)
tabstat reason if reason==34, by(year) statistics(n)
tabstat reason if reason==35, by(year) statistics(n)
tabstat reason if reason==50, by(year) statistics(n)
tabstat reason if reason==51, by(year) statistics(n)
tabstat reason if reason==52, by(year) statistics(n)
tabstat reason if reason==53, by(year) statistics(n)
tabstat reason if reason==54, by(year) statistics(n)
tabstat reason if reason==55, by(year) statistics(n)
tabstat reason if reason==57, by(year) statistics(n)
tabstat reason if reason==58, by(year) statistics(n)
tabstat reason if reason==59, by(year) statistics(n)
log close
*

log using Preliminars_g.log, replace
tabstat reason if econ_act==1, by(year) statistics(n)
tabstat reason if econ_act==2, by(year) statistics(n)
tabstat reason if econ_act==3, by(year) statistics(n)
tabstat reason if econ_act==4, by(year) statistics(n)
tabstat reason if econ_act==5, by(year) statistics(n)
tabstat reason if econ_act==6, by(year) statistics(n)
tabstat reason if econ_act==7, by(year) statistics(n)
tabstat reason if econ_act==8, by(year) statistics(n)
tabstat reason if econ_act==9, by(year) statistics(n)
tabstat reason if econ_act==10, by(year) statistics(n)
tabstat reason if econ_act==11, by(year) statistics(n)
tabstat reason if econ_act==12, by(year) statistics(n)
tabstat reason if econ_act==13, by(year) statistics(n)
log close
*

log using Preliminars_h.log, replace
bysort persnr year: gen num_contracts=_n if source==1
*foreach i of numlist 1975 1985 1995 2005 2014 {
*sum num_contracts if year==`i' & source==1
*}
tabstat num_contracts, by(year) statistics(mean min max n)
tabstat num_contracts if part_time==1 & employment_status!=3 & midi_jobs!=1 & midi_jobs!=2, by(year) statistics(mean min max n)
tabstat days_epi if part_time==1 & employment_status!=3 & midi_jobs!=1 & midi_jobs!=2, by(year) statistics(mean min max n)
tabstat earnings_epi if part_time==1 & employment_status!=3 & midi_jobs!=1 & midi_jobs!=2, by(year) statistics(mean min max n)
tabstat requirement if part_time==1 & employment_status!=3 & midi_jobs!=1 & midi_jobs!=2, by(year) statistics(mean min max n)
log close

log using Preliminars_i.log, replace
tabstat daily_wage if daily_wage<5 & form==2, by(year) statistics(n)
tabstat daily_wage if daily_wage<7 & form==2, by(year) statistics(n)
tabstat daily_wage if daily_wage<10 & form==2, by(year) statistics(n)
*bysort year: sum daily_wage if daily_wage<5 & form==2
***
*bysort year: sum daily_wage if daily_wage<7 & form==2
***
*bysort year: sum daily_wage if daily_wage<10 & form==2
log close

log using Preliminars_j.log, replace
use "\Preliminars.dta", clear
gen monthly_marginal_earnings=daily_wage*30
gen ind_daily_wage_above=0 if form==3 & daily_wage!=.
replace ind_daily_wage_above=1 if daily_wage>15 & form==3 & daily_wage!=.
tabstat ind_daily_wage_above if form==3, by(year) statistics(mean max min n)
tabstat monthly_marginal_earnings if form==3, by(year) statistics(mean max min n)
tabstat daily_wage if form==3, by(year) statistics(mean max min n)
log close

***
