clear
set more off
*set memory 16g
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta", clear
ssc install fastgini
*ssc install fastgini
*ssc install ginidesc

*** fraction of full-time, part-time, marginal-employment over time

keep if female==0

/*
*adjust daily_wage by the working form/intensity
gen adj_daily_wage=def_daily_wage/0.4 if form==2
replace adj_daily_wage=def_daily_wage/0.33 if form==3
*replace adj_daily_wage=def_daily_wage/0.4 if midi_jobs==2 & source==1
*replace adj_daily_wage=def_daily_wage/0.4 if midi_jobs==1 & source==1
replace adj_daily_wage=def_daily_wage if form==1
*replace adj_daily_wage=def_daily_wage if part_time==0 & employment_status!=3 & midi_jobs!=1 & midi_jobs!=2 & source==1
*/

*tabstat days_epi if inrange(form,1,3), by(year) stats(min max mean n)
*tabstat days_epi if form==1, by(year) stats(min max mean n)
*tabstat days_epi if form==2, by(year) stats(min max mean n)
*tabstat days_epi if form==3, by(year) stats(min max mean n)


qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

qui gen work=1 if source==1
bysort persnr year: egen sum_work=sum(work)
by persnr year: gen last_work=1 if sum_work>0
sort persnr year last_work begepi endepi
by persnr year last_work: gen counter_last_work=_n
by persnr year last_work: gen num_days=begepi-endepi[_n-1] if counter_last_work>1 & counter_last_work!=1 & last_work==1 & begepi>endepi[_n-1]+10
bysort year: egen mean_num_days=mean(num_days)

bysort persnr year last_work reason_perm: gen highest_contract=_N if last_work==1 & reason_perm==1
qui gen above=1 if highest_contract>=2 & highest_contract!=. & last_work==1 & reason_perm==1
qui replace above=0 if highest_contract<2 & highest_contract!=. & last_work==1 & reason_perm==1
bysort year: egen fract_contr=mean(above) if last_work==1 & reason_perm==1
drop above
*tabstat fract_contr, by(year) stats(mean n)
*bysort year: egen mean_num_contracts=mean(num_contracts) if reason_perm==1

*consider dropping last work reason perm into source?
sort persnr year last_work reason_perm begepi endepi
bysort persnr year source reason_perm: gen concurrent=1 if source==1 & begepi<endepi[_n-1] & year==year[_n-1]
bysort persnr year: egen sum_concurrent=sum(concurrent) 
gen above=1 if sum_concurrent>=2 & sum_concurrent!=.
qui replace above=0 if sum_concurrent<2 & sum_concurrent!=.
bysort year source: egen fract_conc=mean(above) if source==1
drop above
*tabstat fract_conc, by(year) stats(mean n)

*bysort year: egen mean_conc_contracts=mean(sum_concurrent) if last_work==1 & reason_perm==1
*replace mean_conc_contracts=mean_conc_contracts+1 if last_work==1 & reason_perm==1


***



bysort year: egen mean_days_epi=mean(days_epi) if inrange(form,1,3) & reason_perm==1
by year: egen mean_days_epi_full=mean(days_epi) if form==1 & reason_perm==1
by year: egen mean_days_epi_part=mean(days_epi) if form==2 & reason_perm==1
by year: egen mean_days_epi_mini=mean(days_epi) if form==3 & reason_perm==1

qui gen log_daily_wage=log(def_daily_wage) if source==1

bysort year: egen mean_full_time=mean(log_daily_wage) if form==1
by year: egen mean_full_time_form=mean(log_earnings_year_form) if form==1
by year: egen kurt_full_time=kurt(log_daily_wage) if form==1
by year: egen kurt_full_time_form=kurt(log_earnings_year_form) if form==1
by year: egen skew_full_time=skew(log_daily_wage) if form==1
by year: egen skew_full_time_form=skew(log_earnings_year_form) if form==1
by year: egen sd_full_time=sd(log_daily_wage) if form==1
by year: egen sd_full_time_form=sd(log_earnings_year_form) if form==1

by year: egen mean_cond=mean(log_earnings_year_cond)
by year: egen kurt_cond=kurt(log_earnings_year_cond)
by year: egen skew_cond=skew(log_earnings_year_cond)
by year: egen sd_cond=sd(log_earnings_year_cond)
by year: egen mean=mean(log_earnings_year)
by year: egen median_log=median(log_earnings_year)
by year: egen p85 = pctile(log_earnings_year), p(85)
by year: egen p15 = pctile(log_earnings_year), p(15)
by year: egen kurt=kurt(log_earnings_year)
by year: egen skew=skew(log_earnings_year)
by year: egen sd=sd(log_earnings_year)

qui gen ind_full_time=1 if form==1 & reason_perm==1
qui replace ind_full_time=0 if form==2 & reason_perm==1
qui replace ind_full_time=0 if form==3 & reason_perm==1
bysort persnr year: egen some_full_time=max(ind_full_time)
bysort year: egen mean_ft=mean(some_full_time)

by year: egen mean_exc_part_time=mean(log_daily_wage) if form==2
by year: egen mean_exc_part_time_form=mean(log_earnings_year_form) if form==2
by year: egen skew_exc_part_time=skew(log_daily_wage) if form==2
by year: egen skew_exc_part_time_form=skew(log_earnings_year_form) if form==2
by year: egen kurt_exc_part_time=kurt(log_daily_wage) if form==2
by year: egen kurt_exc_part_time_form=kurt(log_earnings_year_form) if form==2
by year: egen sd_exc_part_time=sd(log_daily_wage) if form==2
by year: egen sd_exc_part_time_form=sd(log_earnings_year_form) if form==2

qui gen ind_exc_part_time=1 if form==2 & reason_perm==1
qui replace ind_exc_part_time=0 if form==1 & reason_perm==1
qui replace ind_exc_part_time=0 if form==3 & reason_perm==1
bysort persnr year: egen some_exc_part_time=max(ind_exc_part_time)
bysort year: egen mean_ept=mean(some_exc_part_time)

by year: egen mean_marginal_employment=mean(log_daily_wage) if form==3
by year: egen mean_marginal_employment_form=mean(log_earnings_year_form) if form==3
by year: egen kurt_marginal_employment=kurt(log_daily_wage) if form==3
by year: egen kurt_marginal_employment_form=kurt(log_earnings_year_form) if form==3
by year: egen skew_marginal_employment=skew(log_daily_wage) if form==3
by year: egen skew_marginal_employment_form=skew(log_earnings_year_form) if form==3
by year: egen sd_marginal_employment=sd(log_daily_wage) if form==3
by year: egen sd_marginal_employment_form=sd(log_earnings_year_form) if form==3

qui gen var_full_time=sd_full_time^2
qui gen var_full_time_form=sd_full_time_form^2
qui gen var_exc_part_time=sd_exc_part_time^2
qui gen var_exc_part_time_form=sd_exc_part_time_form^2
qui gen var_marginal_employment=sd_marginal_employment^2
qui gen var_marginal_employment_form=sd_marginal_employment_form^2
qui gen var_cond=sd_cond^2
qui gen var=sd^2

qui gen ind_marginal_employment=1 if form==3 & reason_perm==1
qui replace ind_marginal_employment=0 if form==2 & reason_perm==1
qui replace ind_marginal_employment=0 if form==1 & reason_perm==1
bysort persnr year: egen some_marginal_employment_time=max(ind_marginal_employment)
bysort year: egen mean_me=mean(some_marginal_employment)

levels year, local(reg)
qui ge gini_cs = .
foreach r of local reg {
  qui fastgini earnings_year if year == `r' & source==1
  replace gini_cs = r(gini) if year == `r' & source==1
}
qui ge gini_cs_full = .
foreach r of local reg {
  qui fastgini earnings_year if year == `r' & form==1
  replace gini_cs_full = r(gini) if year == `r' & form==1
}
qui ge gini_cs_part = .
foreach r of local reg {
  qui fastgini earnings_year if year == `r' & form==2
  replace gini_cs_part = r(gini) if year == `r' & form==2
}
qui ge gini_cs_mini = .
forval r =1999/2014 {
  qui fastgini earnings_year if year == `r' & form==3
  replace gini_cs_mini = r(gini) if year == `r' & form==3
}


***
/*

***
qui gen unemp=1 if source==2
qui replace unemp=1 if source==5
qui replace unemp=1 if days_year<180 & days_year>1 & source==1
qui replace unemp=0 if source==1 & days_year>180 & days_year<5000

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

***
qui gen unemp=1 if source==2
qui replace unemp=1 if source==5
qui replace unemp=0 if source==1

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp2=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

***
qui gen unemp=1 if source==2
qui replace unemp=0 if source==1

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp3=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

***
qui gen unemp=1 if source==5
qui replace unemp=0 if source==1

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp4=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

***
qui gen unemp=1 if days_epi>180 & days_epi!=. & source==2
qui replace unemp=0 if source==1

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp5=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

label variable fract_unemp "Gap Years + Some Unemp + <180days"
label variable fract_unemp2 "Gap Years + Some Unemp"
label variable fract_unemp3 "Some Unemp"
label variable fract_unemp4 "Gap Year"
label variable fract_unemp5 "Unemp>180 days"

*/


*keep only one observation per worker by year

*bysort persnr year: gen counter_spell_year=_n

*keep if counter_spell_year==1

keep year mean* skew* kurt* sd* var* form log_daily_wage log_earnings_year* fract* gini* median* p85* p15* num* persnr
*fract_unemp*

saveold "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\moments_cross_section.dta", replace

***EAST***
/*
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_east.dta", clear

*** fraction of full-time, part-time, marginal-employment over time

keep if female==0

/*
*adjust daily_wage by the working form/intensity
gen adj_daily_wage=def_daily_wage/0.4 if form==2 & reason_perm==1
replace adj_daily_wage=def_daily_wage/0.33 if form==3 & reason_perm==1
*replace adj_daily_wage=def_daily_wage/0.4 if midi_jobs==2 & source==1
*replace adj_daily_wage=def_daily_wage/0.4 if midi_jobs==1 & source==1
replace adj_daily_wage=def_daily_wage if form==1 & reason_perm==1
*replace adj_daily_wage=def_daily_wage if part_time==0 & employment_status!=3 & midi_jobs!=1 & midi_jobs!=2 & source==1
*/
/*
qui gen working=1 if inrange(form,1,3) & reason_perm==1
sort persnr working counter_spell
bysort persnr working: gen counter_days=_n if working==1
by persnr working: gen num_days=begepi-endepi[_n-1] if working==1  & counter_days>1  & begepi>endepi[_n-1] & begepi-endepi[_n-1]>10
bysort year: egen mean_num_days=mean(num_days)
drop working counter_days num_days

qui gen working=1 if inrange(form,1,3) & reason_perm==1
sort persnr working counter_spell
bysort persnr working: gen counter_days=_n if working==1
by persnr working: gen num_days=begepi-endepi[_n-1] if working==1  & counter_days>1  & begepi>endepi[_n-1] & begepi-endepi[_n-1]>10 & form==1
bysort year: egen mean_num_days_full=mean(num_days)
drop working counter_days num_days

qui gen working=1 if inrange(form,1,3) & reason_perm==1
sort persnr working counter_spell
bysort persnr working: gen counter_days=_n if working==1
by persnr working: gen num_days=begepi-endepi[_n-1] if working==1  & counter_days>1  & begepi>endepi[_n-1] & begepi-endepi[_n-1]>10 & form==2
bysort year: egen mean_num_days_part=mean(num_days)
drop working counter_days num_days

qui gen working=1 if inrange(form,1,3) & reason_perm==1
sort persnr working counter_spell
bysort persnr working: gen counter_days=_n if working==1
by persnr working: gen num_days=begepi-endepi[_n-1] if working==1  & counter_days>1  & begepi>endepi[_n-1] & begepi-endepi[_n-1]>10 & form==3
bysort year: egen mean_num_days_mini=mean(num_days)
drop working counter_days num_days
*/

qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

qui gen work=1 if source==1
bysort persnr year: egen sum_work=sum(work)
by persnr year: gen last_work=1 if sum_work>0
sort persnr year last_work begepi endepi
by persnr year last_work: gen counter_last_work=_n
by persnr year last_work: gen num_days=begepi-endepi[_n-1] if counter_last_work>1 & counter_last_work!=1 & last_work==1 & begepi>endepi[_n-1]+10
bysort year: egen mean_num_days=mean(num_days)

bysort persnr year last_work reason_perm: gen highest_contract=_N if last_work==1 & reason_perm==1
qui gen above=1 if highest_contract>=2 & highest_contract!=. & last_work==1 & reason_perm==1
qui replace above=0 if highest_contract<2 & highest_contract!=. & last_work==1 & reason_perm==1
bysort year: egen fract_contr=mean(above) if last_work==1 & reason_perm==1
drop above
*tabstat fract_contr, by(year) stats(mean n)
*bysort year: egen mean_num_contracts=mean(num_contracts) if reason_perm==1

sort persnr year last_work reason_perm begepi endepi
bysort persnr year source reason_perm: gen concurrent=1 if source==1 & begepi<endepi[_n-1] & year==year[_n-1]
bysort persnr year: egen sum_concurrent=sum(concurrent) 
qui gen above=1 if sum_concurrent>=2 & sum_concurrent!=.
qui replace above=0 if sum_concurrent<2 & sum_concurrent!=.
bysort year source: egen fract_conc=mean(above) if source==1
drop above
*tabstat fract_conc, by(year) stats(mean n)

*bysort year: egen mean_conc_contracts=mean(sum_concurrent) if last_work==1 & reason_perm==1
*replace mean_conc_contracts=mean_conc_contracts+1 if last_work==1 & reason_perm==1
***



bysort year: egen mean_days_epi=mean(days_epi) if inrange(form,1,3) & reason_perm==1
by year: egen mean_days_epi_full=mean(days_epi) if form==1 & reason_perm==1
by year: egen mean_days_epi_part=mean(days_epi) if form==2 & reason_perm==1
by year: egen mean_days_epi_mini=mean(days_epi) if form==3 & reason_perm==1

qui gen log_daily_wage=log(def_daily_wage) if source==1

bysort year: egen mean_full_time=mean(log_daily_wage) if form==1
by year: egen mean_full_time_form=mean(log_earnings_year_form) if form==1
by year: egen kurt_full_time=kurt(log_daily_wage) if form==1
by year: egen kurt_full_time_form=kurt(log_earnings_year_form) if form==1
by year: egen skew_full_time=skew(log_daily_wage) if form==1
by year: egen skew_full_time_form=skew(log_earnings_year_form) if form==1
by year: egen sd_full_time=sd(log_daily_wage) if form==1
by year: egen sd_full_time_form=sd(log_earnings_year_form) if form==1

by year: egen mean_cond=mean(log_earnings_year_cond)
by year: egen kurt_cond=kurt(log_earnings_year_cond)
by year: egen skew_cond=skew(log_earnings_year_cond)
by year: egen sd_cond=sd(log_earnings_year_cond)
by year: egen mean=mean(log_earnings_year)
by year: egen median_log=median(log_earnings_year)
by year: egen p85 = pctile(log_earnings_year), p(85)
by year: egen p15 = pctile(log_earnings_year), p(15)
by year: egen kurt=kurt(log_earnings_year)
by year: egen skew=skew(log_earnings_year)
by year: egen sd=sd(log_earnings_year)

qui gen ind_full_time=1 if form==1 & reason_perm==1
qui replace ind_full_time=0 if form==2 & reason_perm==1
qui replace ind_full_time=0 if form==3 & reason_perm==1
bysort persnr year: egen some_full_time=max(ind_full_time)
bysort year: egen mean_ft=mean(some_full_time)

by year: egen mean_exc_part_time=mean(log_daily_wage) if form==2
by year: egen mean_exc_part_time_form=mean(log_earnings_year_form) if form==2
by year: egen skew_exc_part_time=skew(log_daily_wage) if form==2
by year: egen skew_exc_part_time_form=skew(log_earnings_year_form) if form==2
by year: egen kurt_exc_part_time=kurt(log_daily_wage) if form==2
by year: egen kurt_exc_part_time_form=kurt(log_earnings_year_form) if form==2
by year: egen sd_exc_part_time=sd(log_daily_wage) if form==2
by year: egen sd_exc_part_time_form=sd(log_earnings_year_form) if form==2

qui gen ind_exc_part_time=1 if form==2 & reason_perm==1
qui replace ind_exc_part_time=0 if form==1 & reason_perm==1
qui replace ind_exc_part_time=0 if form==3 & reason_perm==1
bysort persnr year: egen some_exc_part_time=max(ind_exc_part_time)
bysort year: egen mean_ept=mean(some_exc_part_time)

by year: egen mean_marginal_employment=mean(log_daily_wage) if form==3
by year: egen mean_marginal_employment_form=mean(log_earnings_year_form) if form==3
by year: egen kurt_marginal_employment=kurt(log_daily_wage) if form==3
by year: egen kurt_marginal_employment_form=kurt(log_earnings_year_form) if form==3
by year: egen skew_marginal_employment=skew(log_daily_wage) if form==3
by year: egen skew_marginal_employment_form=skew(log_earnings_year_form) if form==3
by year: egen sd_marginal_employment=sd(log_daily_wage) if form==3
by year: egen sd_marginal_employment_form=sd(log_earnings_year_form) if form==3

qui gen var_full_time=sd_full_time^2
qui gen var_full_time_form=sd_full_time_form^2
qui gen var_exc_part_time=sd_exc_part_time^2
qui gen var_exc_part_time_form=sd_exc_part_time_form^2
qui gen var_marginal_employment=sd_marginal_employment^2
qui gen var_marginal_employment_form=sd_marginal_employment_form^2
qui gen var_cond=sd_cond^2
qui gen var=sd^2

qui gen ind_marginal_employment=1 if form==3 & reason_perm==1
qui replace ind_marginal_employment=0 if form==2 & reason_perm==1
qui replace ind_marginal_employment=0 if form==1 & reason_perm==1
bysort persnr year: egen some_marginal_employment_time=max(ind_marginal_employment)
bysort year: egen mean_me=mean(some_marginal_employment)

levels year, local(reg)
ge gini_cs = .
foreach r of local reg {
  qui fastgini earnings_year if year == `r' & source==1
  replace gini_cs = r(gini) if year == `r' & source==1
}
ge gini_cs_full = .
foreach r of local reg {
  qui fastgini earnings_year if year == `r' & form==1
  replace gini_cs_full = r(gini) if year == `r' & form==1
}
ge gini_cs_part = .
foreach r of local reg {
  qui fastgini earnings_year if year == `r' & form==2
  replace gini_cs_part = r(gini) if year == `r' & form==2
}
ge gini_cs_mini = .
forval r =1999/2014 {
  qui fastgini earnings_year if year == `r' & form==3
  replace gini_cs_mini = r(gini) if year == `r' & form==3
}


/*
***
qui gen unemp=1 if source==2
qui replace unemp=1 if source==5
qui replace unemp=1 if days_year<180 & days_year>1 & source==1
qui replace unemp=0 if source==1 & days_year>180 & days_year<5000

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

***
qui gen unemp=1 if source==2
qui replace unemp=1 if source==5
qui replace unemp=0 if source==1

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp2=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

***
qui gen unemp=1 if source==2
qui replace unemp=0 if source==1

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp3=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

***
qui gen unemp=1 if source==5
qui replace unemp=0 if source==1

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp4=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

***
qui gen unemp=1 if days_epi>180 & days_epi!=. & source==2
qui replace unemp=0 if source==1

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp5=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

label variable fract_unemp "Gap Years + Some Unemp + <180days"
label variable fract_unemp2 "Gap Years + Some Unemp"
label variable fract_unemp3 "Some Unemp"
label variable fract_unemp4 "Gap Year"
label variable fract_unemp5 "Unemp>180 days"

*/
*keep only one observation per worker by year

*bysort persnr year: gen counter_spell_year=_n

*keep if counter_spell_year==1

keep year mean* skew* kurt* sd* var* form log_daily_wage log_earnings_year* fract* gini*  median* p85* p15* num* persnr
*fract_unemp*

saveold "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\moments_cross_section_east.dta", replace
*/
***FEMALES***

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta", clear

*** fraction of full-time, part-time, marginal-employment over time

keep if female==1

/*
*adjust daily_wage by the working form/intensity
gen adj_daily_wage=def_daily_wage/0.4 if form==2 & reason_perm==1
replace adj_daily_wage=def_daily_wage/0.33 if form==3 & reason_perm==1
*replace adj_daily_wage=def_daily_wage/0.4 if midi_jobs==2 & source==1
*replace adj_daily_wage=def_daily_wage/0.4 if midi_jobs==1 & source==1
replace adj_daily_wage=def_daily_wage if form==1 & reason_perm==1
*replace adj_daily_wage=def_daily_wage if part_time==0 & employment_status!=3 & midi_jobs!=1 & midi_jobs!=2 & source==1
*/
/*
qui gen working=1 if inrange(form,1,3) & reason_perm==1
sort persnr working counter_spell
bysort persnr working: gen counter_days=_n if working==1
by persnr working: gen num_days=begepi-endepi[_n-1] if working==1  & counter_days>1  & begepi>endepi[_n-1] & begepi-endepi[_n-1]>10
bysort year: egen mean_num_days=mean(num_days)
drop working counter_days num_days

qui gen working=1 if inrange(form,1,3) & reason_perm==1
sort persnr working counter_spell
bysort persnr working: gen counter_days=_n if working==1
by persnr working: gen num_days=begepi-endepi[_n-1] if working==1  & counter_days>1  & begepi>endepi[_n-1] & begepi-endepi[_n-1]>10 & form==1
bysort year: egen mean_num_days_full=mean(num_days)
drop working counter_days num_days

qui gen working=1 if inrange(form,1,3) & reason_perm==1
sort persnr working counter_spell
bysort persnr working: gen counter_days=_n if working==1
by persnr working: gen num_days=begepi-endepi[_n-1] if working==1  & counter_days>1  & begepi>endepi[_n-1] & begepi-endepi[_n-1]>10 & form==2
bysort year: egen mean_num_days_part=mean(num_days)
drop working counter_days num_days

qui gen working=1 if inrange(form,1,3) & reason_perm==1
sort persnr working counter_spell
bysort persnr working: gen counter_days=_n if working==1
by persnr working: gen num_days=begepi-endepi[_n-1] if working==1  & counter_days>1  & begepi>endepi[_n-1] & begepi-endepi[_n-1]>10 & form==3
bysort year: egen mean_num_days_mini=mean(num_days)
drop working counter_days num_days
*/

qui gen reason_perm=1 if reason_notif==0 | reason_notif==6

qui gen work=1 if source==1
bysort persnr year: egen sum_work=sum(work)
by persnr year: gen last_work=1 if sum_work>0
sort persnr year last_work begepi endepi
by persnr year last_work: gen counter_last_work=_n
by persnr year last_work: gen num_days=begepi-endepi[_n-1] if counter_last_work>1 & counter_last_work!=1 & last_work==1 & begepi>endepi[_n-1]+10
bysort year: egen mean_num_days_mini=mean(num_days)

bysort persnr year last_work reason_perm: gen highest_contract=_N if last_work==1 & reason_perm==1
qui gen above=1 if highest_contract>=2 & highest_contract!=. & last_work==1 & reason_perm==1
qui replace above=0 if highest_contract<2 & highest_contract!=. & last_work==1 & reason_perm==1
bysort year: egen fract_contr=mean(above) if last_work==1 & reason_perm==1
drop above
*tabstat fract_contr, by(year) stats(mean n)
*bysort year: egen mean_num_contracts=mean(num_contracts) if reason_perm==1

sort persnr year last_work reason_perm begepi endepi
bysort persnr year source reason_perm: gen concurrent=1 if source==1 & begepi<endepi[_n-1] & year==year[_n-1]
bysort persnr year: egen sum_concurrent=sum(concurrent) 
qui gen above=1 if sum_concurrent>=2 & sum_concurrent!=.
qui replace above=0 if sum_concurrent<2 & sum_concurrent!=.
bysort year source: egen fract_conc=mean(above) if source==1
drop above
*tabstat fract_conc, by(year) stats(mean n)

*bysort year: egen mean_conc_contracts=mean(sum_concurrent) if last_work==1 & reason_perm==1
*replace mean_conc_contracts=mean_conc_contracts+1 if last_work==1 & reason_perm==1
***



bysort year: egen mean_days_epi=mean(days_epi) if inrange(form,1,3) & reason_perm==1
by year: egen mean_days_epi_full=mean(days_epi) if form==1 & reason_perm==1
by year: egen mean_days_epi_part=mean(days_epi) if form==2 & reason_perm==1
by year: egen mean_days_epi_mini=mean(days_epi) if form==3 & reason_perm==1

qui gen log_daily_wage=log(def_daily_wage) if source==1

bysort year: egen mean_full_time=mean(log_daily_wage) if form==1
by year: egen mean_full_time_form=mean(log_earnings_year_form) if form==1
by year: egen kurt_full_time=kurt(log_daily_wage) if form==1
by year: egen kurt_full_time_form=kurt(log_earnings_year_form) if form==1
by year: egen skew_full_time=skew(log_daily_wage) if form==1
by year: egen skew_full_time_form=skew(log_earnings_year_form) if form==1
by year: egen sd_full_time=sd(log_daily_wage) if form==1
by year: egen sd_full_time_form=sd(log_earnings_year_form) if form==1

by year: egen mean_cond=mean(log_earnings_year_cond)
by year: egen kurt_cond=kurt(log_earnings_year_cond)
by year: egen skew_cond=skew(log_earnings_year_cond)
by year: egen sd_cond=sd(log_earnings_year_cond)
by year: egen mean=mean(log_earnings_year)
by year: egen median=median(log_earnings_year)
by year: egen p85 = pctile(log_earnings_year), p(85)
by year: egen p15 = pctile(log_earnings_year), p(15)
by year: egen kurt=kurt(log_earnings_year)
by year: egen skew=skew(log_earnings_year)
by year: egen sd=sd(log_earnings_year)

qui gen ind_full_time=1 if form==1 & reason_perm==1
qui replace ind_full_time=0 if form==2 & reason_perm==1
qui replace ind_full_time=0 if form==3 & reason_perm==1
bysort persnr year: egen some_full_time=max(ind_full_time)
bysort year: egen mean_ft=mean(some_full_time)

by year: egen mean_exc_part_time=mean(log_daily_wage) if form==2
by year: egen mean_exc_part_time_form=mean(log_earnings_year_form) if form==2
by year: egen skew_exc_part_time=skew(log_daily_wage) if form==2
by year: egen skew_exc_part_time_form=skew(log_earnings_year_form) if form==2
by year: egen kurt_exc_part_time=kurt(log_daily_wage) if form==2
by year: egen kurt_exc_part_time_form=kurt(log_earnings_year_form) if form==2
by year: egen sd_exc_part_time=sd(log_daily_wage) if form==2 
by year: egen sd_exc_part_time_form=sd(log_earnings_year_form) if form==2

qui gen ind_exc_part_time=1 if form==2 & reason_perm==1
qui replace ind_exc_part_time=0 if form==1 & reason_perm==1
qui replace ind_exc_part_time=0 if form==3 & reason_perm==1
bysort persnr year: egen some_exc_part_time=max(ind_exc_part_time)
bysort year: egen mean_ept=mean(some_exc_part_time)

by year: egen mean_marginal_employment=mean(log_daily_wage) if form==3
by year: egen mean_marginal_employment_form=mean(log_earnings_year_form) if form==3
by year: egen kurt_marginal_employment=kurt(log_daily_wage) if form==3
by year: egen kurt_marginal_employment_form=kurt(log_earnings_year_form) if form==3
by year: egen skew_marginal_employment=skew(log_daily_wage) if form==3
by year: egen skew_marginal_employment_form=skew(log_earnings_year_form) if form==3
by year: egen sd_marginal_employment=sd(log_daily_wage) if form==3
by year: egen sd_marginal_employment_form=sd(log_earnings_year_form) if form==3

qui gen var_full_time=sd_full_time^2
qui gen var_full_time_form=sd_full_time_form^2
qui gen var_exc_part_time=sd_exc_part_time^2
qui gen var_exc_part_time_form=sd_exc_part_time_form^2
qui gen var_marginal_employment=sd_marginal_employment^2
qui gen var_marginal_employment_form=sd_marginal_employment_form^2
qui gen var_cond=sd_cond^2
qui gen var=sd^2

qui gen ind_marginal_employment=1 if form==3 & reason_perm==1
qui replace ind_marginal_employment=0 if form==2 & reason_perm==1
qui replace ind_marginal_employment=0 if form==1 & reason_perm==1
bysort persnr year: egen some_marginal_employment_time=max(ind_marginal_employment)
bysort year: egen mean_me=mean(some_marginal_employment)

levels year, local(reg)
qui ge gini_cs = .
foreach r of local reg {
  qui fastgini earnings_year if year == `r' & source==1
  replace gini_cs = r(gini) if year == `r' & source==1
}
qui ge gini_cs_full = .
foreach r of local reg {
  qui fastgini earnings_year if year == `r' & form==1
  replace gini_cs_full = r(gini) if year == `r' & form==1
}
qui ge gini_cs_part = .
foreach r of local reg {
  qui fastgini earnings_year if year == `r' & form==2
  replace gini_cs_part = r(gini) if year == `r' & form==2
}
qui ge gini_cs_mini = .
forval r = 1999/2014 {
  qui fastgini earnings_year if year == `r' & form==3
  replace gini_cs_mini = r(gini) if year == `r' & form==3
}

/*
***
qui gen unemp=1 if source==2
qui replace unemp=1 if source==5
qui replace unemp=1 if days_year<180 & days_year>1 & source==1
qui replace unemp=0 if source==1 & days_year>180 & days_year<5000

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

***
qui gen unemp=1 if source==2
qui replace unemp=1 if source==5
qui replace unemp=0 if source==1

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp2=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

***
qui gen unemp=1 if source==2
qui replace unemp=0 if source==1

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp3=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

***
qui gen unemp=1 if source==5
qui replace unemp=0 if source==1

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp4=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

***
qui gen unemp=1 if days_epi>180 & days_epi!=. & source==2
qui replace unemp=0 if source==1

bysort persnr year: egen max_unemp=max(unemp)
tab max_unemp
qui gen counter_unemp=1 if max_unemp==1
qui replace counter_unemp=0 if max_unemp==0

bysort year: egen fract_unemp5=mean(counter_unemp)

drop counter_unemp max_unemp unemp
***

label variable fract_unemp "Gap Years + Some Unemp + <180days"
label variable fract_unemp2 "Gap Years + Some Unemp"
label variable fract_unemp3 "Some Unemp"
label variable fract_unemp4 "Gap Year"
label variable fract_unemp5 "Unemp>180 days"

*keep only one observation per worker by year
*/
*bysort persnr year: gen counter_spell_year=_n

*keep if counter_spell_year==1

keep year mean* skew* kurt* sd* var* form log_daily_wage log_earnings_year* fract* gini* median* p85* p15* num* persnr

*fract_unemp*

saveold "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\moments_cross_section_fem.dta", replace

do bonke.do

*
