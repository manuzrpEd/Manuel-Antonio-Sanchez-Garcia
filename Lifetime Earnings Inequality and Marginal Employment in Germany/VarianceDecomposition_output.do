clear
set more off
*set memory 16g
*C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_variance_decomposition.dta", clear
ssc install fastgini
ssc install gllamm
*
keep persnr year month_begepi full_month part_month mini_month unemp_month conc_month null_state tot_earn_month
sort persnr year month_begepi
*
gen log_tot_earn_month=log(tot_earn_month)
*
gen time=month_begepi if year==1975
forval i = 1976/2014 {
replace time=month_begepi+12*(`i'-1975) if year==`i'
}
*
*** generate categorical variable
gen categ=.
replace categ=1 if full_month==1
replace categ=2 if part_month==1
replace categ=3 if mini_month==1
replace categ=4 if unemp_month==1
replace categ=5 if conc_month==1
*
*random intercept model:
*xtmixed log_tot_earn_month c.categ || persnr:

*xtmixed log_tot_earn_month if year==1975 || persnr:, variance nolog mle
*
*oneway log_tot_earn_month categ if year==1975, tabulate
* there is a statistically significant difference between our three group means.
*p=0.0000 
*also, we reject equal variances

***we cant do the next as we reject equal variances:
*pwmean tot_earn_month, over(categ) mcompare(tukey) effects
*xtset persnr time
*no idea on the next
*xtreg tot_earn_month if year==1975, i(categ)
*
*xtmixed log_tot_earn_month categ
*gllamm
*gllamm tot_earn_month categ if year==1975, i(persnr) adapt trace
*loneway log_tot_earn_month categ if year==1975
*
*xi: xtmixed log_tot_earn_month i.categ if year==1975
*decompose
*decomp
xi: anova log_tot_earn_month i.categ
*
replace full_month=0 if full_month==.
replace part_month=0 if part_month==.
replace mini_month=0 if mini_month==.
replace unemp_month=0 if unemp_month==.
replace conc_month=0 if conc_month==.
*
anova log_tot_earn_month full_month##part_month##mini_month##unemp_month##conc_month
*
anova log_tot_earn_month mini_month
anova log_tot_earn_month unemp_month
anova log_tot_earn_month full_month
anova log_tot_earn_month part_month
anova log_tot_earn_month conc_month
*
anova log_tot_earn_month unemp_month full_month part_month mini_month
