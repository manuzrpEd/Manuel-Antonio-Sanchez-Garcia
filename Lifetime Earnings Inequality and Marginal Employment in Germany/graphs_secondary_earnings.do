*pending to run
cls
clear
set more off

use "\pkal\apkal.dta", clear
cd ""
*gen year variable:
gen year=1984
*
rename ap* p*
*
save "\pkal_84.dta", replace

use "\pkal\bpkal.dta", clear
cd ""
*gen year variable:
gen year=1985
*
rename bp* p*
*
save "\pkal_85.dta", replace

use "\pkal\cpkal.dta", clear
cd ""
*gen year variable:
gen year=1986
*
rename cp* p*
*rename *86 *
save "\pkal_86.dta", replace

use "\pkal\dpkal.dta", clear
cd ""
*gen year variable:
gen year=1987
*
rename dp* p*
*
save "\pkal_87.dta", replace

use "\pkal\epkal.dta", clear
cd ""
*gen year variable:
gen year=1988
*
rename ep* p*
*
save "\pkal_88.dta", replace

use "\pkal\fpkal.dta", clear
cd ""
*gen year variable:
gen year=1989
*
rename fp* p*
*
save "\pkal_89.dta", replace

use "\pkal\gpkal.dta", clear
cd ""
*gen year variable:
gen year=1990
*
rename gp* p*
*
save "\pkal_90.dta", replace

use "\pkal\hpkal.dta", clear
cd ""
*gen year variable:
gen year=1991
*
rename hp* p*
*
save "\pkal_91.dta", replace

use "\pkal\ipkal.dta", clear
cd ""
*gen year variable:
gen year=1992
*
rename ip* p*
*
save "\pkal_92.dta", replace

use "\pkal\jpkal.dta", clear
cd ""
*gen year variable:
gen year=1993
*
rename jp* p*
*
save "\pkal_93.dta", replace

use "\pkal\kpkal.dta", clear
cd ""
*gen year variable:
gen year=1994
*
rename kp* p*
*
save "\pkal_94.dta", replace

use "\pkal\lpkal.dta", clear
cd ""
*gen year variable:
gen year=1995
*
rename lp* p*
*
save "\pkal_95.dta", replace

use "\pkal\mpkal.dta", clear
cd ""
*gen year variable:
gen year=1996
*
rename mp* p*
*
save "\pkal_96.dta", replace

use "\pkal\npkal.dta", clear
cd ""
*gen year variable:
gen year=1997
*
rename np* p*
*
save "\pkal_97.dta", replace

use "\pkal\opkal.dta", clear
cd ""
*gen year variable:
gen year=1998
*
rename op* p*
*
save "\pkal_98.dta", replace

use "\pkal\ppkal.dta", clear
cd ""
*gen year variable:
gen year=1999
*
rename pp* p*
*
save "\pkal_99.dta", replace

use "\pkal\qpkal.dta", clear
cd ""
*gen year variable:
gen year=2000
*
rename qp* p*
*
save "\pkal_00.dta", replace

use "\pkal\rpkal.dta", clear
cd ""
*gen year variable:
gen year=2001
*
rename rp* p*
*
save "\pkal_01.dta", replace

use "\pkal\spkal.dta", clear
cd ""
*gen year variable:
gen year=2002
*
rename sp* p*
*
save "\pkal_02.dta", replace

use "\pkal\tpkal.dta", clear
cd ""
*gen year variable:
gen year=2003
*
rename tp* p*
*
save "\pkal_03.dta", replace

use "\pkal\upkal.dta", clear
cd ""
*gen year variable:
gen year=2004
*
rename up* p*
*
save "\pkal_04.dta", replace

use "\pkal\vpkal.dta", clear
cd ""
*gen year variable:
gen year=2005
*
rename vp* p*
*
save "\pkal_05.dta", replace

use "\pkal\wpkal.dta", clear
cd ""
*gen year variable:
gen year=2006
*
rename wp* p*
*
save "\pkal_06.dta", replace

use "\pkal\xpkal.dta", clear
cd ""
*gen year variable:
gen year=2007
*
rename xp* p*
*
save "\pkal_07.dta", replace

use "\pkal\ypkal.dta", clear
cd ""
*gen year variable:
gen year=2008
*
rename yp* p*
*
save "\pkal_08.dta", replace

use "\pkal\zpkal.dta", clear
cd ""
*gen year variable:
gen year=2009
*
rename zp* p*
*
save "\pkal_09.dta", replace

use "\pkal\bapkal.dta", clear
cd ""
*gen year variable:
gen year=2010
*
rename bap* p*
*
save "\pkal_10.dta", replace

use "\pkal\bbpkal.dta", clear
cd ""
*gen year variable:
gen year=2011
*
rename bbp* p*
*
save "\pkal_11.dta", replace

use "\pkal\bcpkal.dta", clear
cd ""
*gen year variable:
gen year=2012
*
rename bcp* p*
*
save "\pkal_12.dta", replace

use "\pkal\bdpkal.dta", clear
cd ""
*gen year variable:
gen year=2013
*
rename bdp* p*
*
save "\pkal_13.dta", replace

use "\pkal\bepkal.dta", clear
cd ""
*gen year variable:
gen year=2014
*
rename bep* p*
*
save "\pkal_14.dta", replace

use "\pkal\bfpkal.dta", clear
cd ""
*gen year variable:
gen year=2015
*
rename bfp* p*
*
save "\pkal_15.dta", replace

***append
use "\pkal_84.dta", clear
append using "\pkal_85.dta", nolabel
append using "\pkal_86.dta", nolabel
append using "\pkal_87.dta", nolabel
append using "\pkal_88.dta", nolabel
append using "\pkal_89.dta", nolabel
append using "\pkal_90.dta", nolabel
append using "\pkal_91.dta", nolabel
append using "\pkal_92.dta", nolabel
append using "\pkal_93.dta", nolabel
append using "\pkal_94.dta", nolabel
append using "\pkal_95.dta", nolabel
append using "\pkal_96.dta", nolabel
append using "\pkal_97.dta", nolabel
append using "\pkal_98.dta", nolabel
append using "\pkal_99.dta", nolabel
append using "\pkal_00.dta", nolabel
append using "\pkal_01.dta", nolabel
append using "\pkal_02.dta", nolabel
append using "\pkal_03.dta", nolabel
append using "\pkal_04.dta", nolabel
append using "\pkal_05.dta", nolabel
append using "\pkal_06.dta", nolabel
append using "\pkal_07.dta", nolabel
append using "\pkal_08.dta", nolabel
append using "\pkal_09.dta", nolabel
append using "\pkal_10.dta", nolabel
append using "\pkal_11.dta", nolabel
append using "\pkal_12.dta", nolabel
append using "\pkal_13.dta", nolabel
append using "\pkal_14.dta", nolabel
append using "\pkal_15.dta", nolabel

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
use "\pequiv_2.dta", clear
sort year

bysort year: egen mean_ind_second_earnings=mean(ind_second_earnings) if form==1

twoway line mean_ind_second_earnings year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015,labsize(large)) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(0(0.05)0.2, labsize(large) angle(horizontal))
graph export sec_job_months_full.png, replace

use "\pequiv_2.dta", clear
sort year

bysort year: egen mean_ind_second_earnings=mean(ind_second_earnings) if form==2

twoway line mean_ind_second_earnings year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015,labsize(large)) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(0(0.05)0.25, labsize(large) angle(horizontal))
graph export sec_job_months_part.png, replace

***
