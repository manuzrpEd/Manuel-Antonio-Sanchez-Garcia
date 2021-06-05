*** bottom coded part time - this is the one

*clear
set more off
use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
cd "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\Codes"

keep if female==0

*adjust daily_wage by the working form/intensity - I think it is confusing for identifying bottom coding
/*
gen def_daily_wage=def_daily_wage/0.4 if part_time==1 & employment_status!=3 & midi_jobs!=1 & midi_jobs!=2 & source==1
replace def_daily_wage=def_daily_wage/0.33 if employment_status==3 & source==1
replace def_daily_wage=def_daily_wage/0.4 if midi_jobs==2 & source==1
replace def_daily_wage=def_daily_wage/0.4 if midi_jobs==1 & source==1
replace def_daily_wage=def_daily_wage if part_time==0 & employment_status!=3 & midi_jobs!=1 & midi_jobs!=2 & source==1

gen log_def_daily_wage=log(def_daily_wage) if source==1
*/
gen log_def_daily_wage=log(def_daily_wage) if source==1

*** loop starting

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & reason_notif==0
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_reason_notif_0.png, replace
drop Exclusive_Part_Time

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & reason_notif==1
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_reason_notif_1.png, replace
drop Exclusive_Part_Time

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & reason_notif==6
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_reason_notif_6.png, replace
drop Exclusive_Part_Time

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & reason_notif==9
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_reason_notif_9.png, replace
drop Exclusive_Part_Time

***

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & requirement==1
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_requirement_1.png, replace
drop Exclusive_Part_Time

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & requirement==2
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_requirement_2.png, replace
drop Exclusive_Part_Time

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & requirement==3
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_requirement_3.png, replace
drop Exclusive_Part_Time

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & requirement==4
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_requirement_4.png, replace
drop Exclusive_Part_Time

***

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & employment_status==1
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_employment_status_1.png, replace
drop Exclusive_Part_Time

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & employment_status==2
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_employment_status_2.png, replace
drop Exclusive_Part_Time

***

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & educ==1
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_educ_1.png, replace
drop Exclusive_Part_Time

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & educ==2
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_educ_2.png, replace
drop Exclusive_Part_Time

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & educ==3
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_educ_3.png, replace
drop Exclusive_Part_Time

***

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & def_daily_wage>=5
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_above_5.png, replace
drop Exclusive_Part_Time

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & def_daily_wage>=10
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_above_10.png, replace
drop Exclusive_Part_Time

bysort year: egen mean_exc_part_time=mean(log_def_daily_wage) if form==2 & def_daily_wage>=14
rename mean_exc_part_time Exclusive_Part_Time
quietly twoway line Exclusive_Part_Time year, ytitle("") xtitle(Year) title("Mean of log_def_daily_Wage") connect(l) xlabel(1975 (5) 2014) xline(1999)
graph export mean_above_14.png, replace
drop Exclusive_Part_Time

***
preserve
drop if def_daily_wage<14
twoway (kdensity log_def_daily_wage if form==2 & year==1998) (kdensity log_def_daily_wage if form==2 & year==1999), ytitle("") xtitle(Year) title("Kernel Part-Time") legend(lab(1 "1998") lab(2 "1999"))
restore
