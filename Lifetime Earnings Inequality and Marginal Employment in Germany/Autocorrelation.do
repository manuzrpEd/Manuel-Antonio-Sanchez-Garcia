***Autocorrelation
cls
clear
**set memory 16g
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_Monthly_persnr_males_20052009.dta", clear
g time_var=0
replace time_var=12 if year==2006
replace time_var=24 if year==2007
replace time_var=36 if year==2008
replace time_var=48 if year==2009
*
replace time_var=time_var+month
*
xtset persnr time_var
sort persnr time_var
*
reg log_ave_wage age L1.log_ave_wage

