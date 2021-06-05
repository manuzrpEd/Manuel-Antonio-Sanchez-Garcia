clear
set more off
set memory 16g
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta", clear

*** fraction of full-time, part-time, marginal-employment over time

keep if female==1

*adjust daily_wage by the working form/intensity
gen adj_daily_wage=def_daily_wage/0.4 if part_time==1 & employment_status!=3 & midi_jobs!=1 & midi_jobs!=2 & source==1
replace adj_daily_wage=def_daily_wage/0.33 if employment_status==3 & source==1
replace adj_daily_wage=def_daily_wage/0.4 if midi_jobs==2 & source==1
replace adj_daily_wage=def_daily_wage/0.4 if midi_jobs==1 & source==1
replace adj_daily_wage=def_daily_wage if part_time==0 & employment_status!=3 & midi_jobs!=1 & midi_jobs!=2 & source==1

gen log_daily_wage=log(adj_daily_wage) if source==1

bysort year: egen mean_full_time=mean(log_daily_wage) if form==1
bysort year: egen mean_full_time_form=mean(log_earnings_year_form) if form==1
bysort year: egen kurt_full_time=kurt(log_daily_wage) if form==1
bysort year: egen kurt_full_time_form=kurt(log_earnings_year_form) if form==1
bysort year: egen skew_full_time=skew(log_daily_wage) if form==1
bysort year: egen skew_full_time_form=skew(log_earnings_year_form) if form==1
bysort year: egen sd_full_time=sd(log_daily_wage) if form==1
bysort year: egen sd_full_time_form=sd(log_earnings_year_form) if form==1

gen ind_full_time=1 if form==1
replace ind_full_time=0 if form==2
replace ind_full_time=0 if form==3
bysort persnr year: egen some_full_time=max(ind_full_time)
bysort year: egen mean_ft=mean(some_full_time)

bysort year: egen mean_exc_part_time=mean(log_daily_wage) if form==2
bysort year: egen mean_exc_part_time_form=mean(log_earnings_year_form) if form==2
bysort year: egen skew_exc_part_time=skew(log_daily_wage) if form==2
bysort year: egen skew_exc_part_time_form=skew(log_earnings_year_form) if form==2
bysort year: egen kurt_exc_part_time=kurt(log_daily_wage) if form==2
bysort year: egen kurt_exc_part_time_form=kurt(log_earnings_year_form) if form==2
bysort year: egen sd_exc_part_time=sd(log_daily_wage) if form==2
bysort year: egen sd_exc_part_time_form=sd(log_earnings_year_form) if form==2

gen ind_exc_part_time=1 if form==2
replace ind_exc_part_time=0 if form==1
replace ind_exc_part_time=0 if form==3
bysort persnr year: egen some_exc_part_time=max(ind_exc_part_time)
bysort year: egen mean_ept=mean(some_exc_part_time)

bysort year: egen mean_marginal_employment=mean(log_daily_wage) if form==3
bysort year: egen mean_marginal_employment_form=mean(log_earnings_year_form) if form==3
bysort year: egen kurt_marginal_employment=kurt(log_daily_wage) if form==3
bysort year: egen kurt_marginal_employment_form=kurt(log_earnings_year_form) if form==3
bysort year: egen skew_marginal_employment=skew(log_daily_wage) if form==3
bysort year: egen skew_marginal_employment_form=skew(log_earnings_year_form) if form==3
bysort year: egen sd_marginal_employment=sd(log_daily_wage) if form==3
bysort year: egen sd_marginal_employment_form=sd(log_earnings_year_form) if form==3

gen ind_marginal_employment=1 if form==3
replace ind_marginal_employment=0 if form==2
replace ind_marginal_employment=0 if form==1
bysort persnr year: egen some_marginal_employment_time=max(ind_marginal_employment)
bysort year: egen mean_me=mean(some_marginal_employment)

*keep only one observation per worker by year

bysort persnr year: gen counter_spell_year=_n

keep if counter_spell_year==1

keep year mean* skew* kurt* sd*

save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\moments_cross_section_fem.dta", replace

*
