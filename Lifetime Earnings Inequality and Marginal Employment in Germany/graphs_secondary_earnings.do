*pending to run
cls
clear
set more off
*set memory 16g
*set maxvar 10000
*


use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\apkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1984
*
rename ap* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_84.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\bpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1985
*
rename bp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_85.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\cpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1986
*
rename cp* p*
*rename *86 *
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_86.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\dpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1987
*
rename dp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_87.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\epkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1988
*
rename ep* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_88.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\fpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1989
*
rename fp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_89.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\gpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1990
*
rename gp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_90.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\hpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1991
*
rename hp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_91.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\ipkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1992
*
rename ip* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_92.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\jpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1993
*
rename jp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_93.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\kpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1994
*
rename kp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_94.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\lpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1995
*
rename lp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_95.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\mpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1996
*
rename mp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_96.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\npkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1997
*
rename np* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_97.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\opkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1998
*
rename op* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_98.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\ppkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1999
*
rename pp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_99.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\qpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2000
*
rename qp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_00.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\rpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2001
*
rename rp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_01.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\spkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2002
*
rename sp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_02.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\tpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2003
*
rename tp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_03.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\upkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2004
*
rename up* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_04.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\vpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2005
*
rename vp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_05.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\wpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2006
*
rename wp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_06.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\xpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2007
*
rename xp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_07.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\ypkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2008
*
rename yp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_08.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\zpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2009
*
rename zp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_09.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\bapkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2010
*
rename bap* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_10.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\bbpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2011
*
rename bbp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_11.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\bcpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2012
*
rename bcp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_12.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\bdpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2013
*
rename bdp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_13.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\bepkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2014
*
rename bep* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_14.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pkal\bfpkal.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2015
*
rename bfp* p*
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_15.dta", replace

***append
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_84.dta", clear
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_85.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_86.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_87.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_88.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_89.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_90.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_91.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_92.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_93.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_94.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_95.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_96.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_97.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_98.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_99.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_00.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_01.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_02.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_03.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_04.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_05.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_06.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_07.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_08.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_09.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_10.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_11.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_12.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_13.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_14.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pkal_15.dta", nolabel

sort persnr year

order persnr year

label language EN

rename p2c01 secondary_job_ind
rename p2c02 sec_job_months
rename p2c03 tot_sec_job_earnings

*keep if sample==21 | sample==23

bysort year: egen mean_sec_job_months=mean(sec_job_months) if sec_job_months>=0

twoway line mean_sec_job_months year, ytitle({bf:E[#Months]}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015,labsize(large)) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(8(1)12, labsize(large) angle(horizontal))
graph export sec_job_months.png, replace

***
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_2.dta", clear
sort year

bysort year: egen mean_ind_second_earnings=mean(ind_second_earnings) if form==1

twoway line mean_ind_second_earnings year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015,labsize(large)) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(0(0.05)0.2, labsize(large) angle(horizontal))
graph export sec_job_months_full.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_2.dta", clear
sort year

bysort year: egen mean_ind_second_earnings=mean(ind_second_earnings) if form==2

twoway line mean_ind_second_earnings year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015,labsize(large)) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(0(0.05)0.25, labsize(large) angle(horizontal))
graph export sec_job_months_part.png, replace

***
