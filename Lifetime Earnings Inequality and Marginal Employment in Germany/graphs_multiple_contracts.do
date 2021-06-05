use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
ssc install fastgini
*ssc install fastgini
*ssc install ginidesc

*** fraction of full-time, part-time, marginal-employment over time

*keep if female==0
*
*
qui gen reason_perm=1 if reason_notif==0 | reason_notif==6
qui gen work=1 if source==1
bysort persnr year: egen sum_work=sum(work)
by persnr year: gen last_work=1 if sum_work>0
sort persnr year last_work begepi endepi

bysort persnr year last_work reason_perm: gen highest_contract=_N if last_work==1 & reason_perm==1
qui gen above=1 if highest_contract>=2 & highest_contract!=. & last_work==1 & reason_perm==1
qui replace above=0 if highest_contract<2 & highest_contract!=. & last_work==1 & reason_perm==1
bysort persnr year last_work reason_perm: gen counter=_n if last_work==1 & reason_perm==1
keep if counter==1
bysort year: egen fract_contr=mean(above) if last_work==1 & reason_perm==1

label variable fract_contr ">2 Contracts"
quietly twoway line fract_contr year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(black black) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014,labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export mult_contr_unc.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
ssc install fastgini
*ssc install fastgini
*ssc install ginidesc

*** fraction of full-time, part-time, marginal-employment over time

keep if female==0
*
*
qui gen reason_perm=1 if reason_notif==0 | reason_notif==6
qui gen work=1 if source==1
bysort persnr year: egen sum_work=sum(work)
by persnr year: gen last_work=1 if sum_work>0
sort persnr year last_work begepi endepi

bysort persnr year last_work reason_perm: gen highest_contract=_N if last_work==1 & reason_perm==1
qui gen above=1 if highest_contract>=2 & highest_contract!=. & last_work==1 & reason_perm==1
qui replace above=0 if highest_contract<2 & highest_contract!=. & last_work==1 & reason_perm==1
bysort persnr year last_work reason_perm: gen counter=_n if last_work==1 & reason_perm==1
keep if counter==1
bysort year: egen fract_contr=mean(above) if last_work==1 & reason_perm==1


label variable fract_contr ">2 Contracts"
quietly twoway line fract_contr year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(black black) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014,labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export mult_contr_male.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
ssc install fastgini
*ssc install fastgini
*ssc install ginidesc

*** fraction of full-time, part-time, marginal-employment over time

keep if female==1
*
*
qui gen reason_perm=1 if reason_notif==0 | reason_notif==6
qui gen work=1 if source==1
bysort persnr year: egen sum_work=sum(work)
by persnr year: gen last_work=1 if sum_work>0
sort persnr year last_work begepi endepi

bysort persnr year last_work reason_perm: gen highest_contract=_N if last_work==1 & reason_perm==1
qui gen above=1 if highest_contract>=2 & highest_contract!=. & last_work==1 & reason_perm==1
qui replace above=0 if highest_contract<2 & highest_contract!=. & last_work==1 & reason_perm==1
bysort persnr year last_work reason_perm: gen counter=_n if last_work==1 & reason_perm==1
keep if counter==1
bysort year: egen fract_contr=mean(above) if last_work==1 & reason_perm==1


label variable fract_contr ">2 Contracts"
quietly twoway line fract_contr year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(black black) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014,labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export mult_contr_female.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
ssc install fastgini
*ssc install fastgini
*ssc install ginidesc

*** fraction of full-time, part-time, marginal-employment over time

*keep if female==0
*
drop if source!=1
bysort persnr: gen sum=_N
keep if sum>5
*
qui gen reason_perm=1 if reason_notif==0 | reason_notif==6
qui gen work=1 if source==1
bysort persnr year: egen sum_work=sum(work)
by persnr year: gen last_work=1 if sum_work>0
sort persnr year last_work begepi endepi

bysort persnr year last_work reason_perm: gen highest_contract=_N if last_work==1 & reason_perm==1
qui gen above=1 if highest_contract>=2 & highest_contract!=. & last_work==1 & reason_perm==1
qui replace above=0 if highest_contract<2 & highest_contract!=. & last_work==1 & reason_perm==1
bysort persnr year last_work reason_perm: gen counter=_n if last_work==1 & reason_perm==1
keep if counter==1
bysort year: egen fract_contr=mean(above) if last_work==1 & reason_perm==1


label variable fract_contr ">2 Contracts"
quietly twoway line fract_contr year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(black black) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014,labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export mult_contr_unc_long.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
ssc install fastgini
*ssc install fastgini
*ssc install ginidesc

*** fraction of full-time, part-time, marginal-employment over time

*keep if female==0
*
drop if source!=1
keep if form==1
*
qui gen reason_perm=1 if reason_notif==0 | reason_notif==6
qui gen work=1 if source==1
bysort persnr year: egen sum_work=sum(work)
by persnr year: gen last_work=1 if sum_work>0
sort persnr year last_work begepi endepi

bysort persnr year last_work reason_perm: gen highest_contract=_N if last_work==1 & reason_perm==1
qui gen above=1 if highest_contract>=2 & highest_contract!=. & last_work==1 & reason_perm==1
qui replace above=0 if highest_contract<2 & highest_contract!=. & last_work==1 & reason_perm==1
bysort persnr year last_work reason_perm: gen counter=_n if last_work==1 & reason_perm==1
keep if counter==1
bysort year: egen fract_contr=mean(above) if last_work==1 & reason_perm==1


label variable fract_contr ">2 Contracts"
quietly twoway line fract_contr year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(black black) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014,labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export mult_contr_unc_full.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
ssc install fastgini
*ssc install fastgini
*ssc install ginidesc

*** fraction of full-time, part-time, marginal-employment over time

*keep if female==0
*
drop if source!=1
keep if form==2
*
qui gen reason_perm=1 if reason_notif==0 | reason_notif==6
qui gen work=1 if source==1
bysort persnr year: egen sum_work=sum(work)
by persnr year: gen last_work=1 if sum_work>0
sort persnr year last_work begepi endepi

bysort persnr year last_work reason_perm: gen highest_contract=_N if last_work==1 & reason_perm==1
qui gen above=1 if highest_contract>=2 & highest_contract!=. & last_work==1 & reason_perm==1
qui replace above=0 if highest_contract<2 & highest_contract!=. & last_work==1 & reason_perm==1
bysort persnr year last_work reason_perm: gen counter=_n if last_work==1 & reason_perm==1
keep if counter==1
bysort year: egen fract_contr=mean(above) if last_work==1 & reason_perm==1


label variable fract_contr ">2 Contracts"
quietly twoway line fract_contr year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(black black) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014,labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export mult_contr_unc_part.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
ssc install fastgini
*ssc install fastgini
*ssc install ginidesc

*** fraction of full-time, part-time, marginal-employment over time

*keep if female==0
*
drop if source!=1
keep if form==3
*
qui gen reason_perm=1 if reason_notif==0 | reason_notif==6
qui gen work=1 if source==1
bysort persnr year: egen sum_work=sum(work)
by persnr year: gen last_work=1 if sum_work>0
sort persnr year last_work begepi endepi

bysort persnr year last_work reason_perm: gen highest_contract=_N if last_work==1 & reason_perm==1
qui gen above=1 if highest_contract>=2 & highest_contract!=. & last_work==1 & reason_perm==1
qui replace above=0 if highest_contract<2 & highest_contract!=. & last_work==1 & reason_perm==1
bysort persnr year last_work reason_perm: gen counter=_n if last_work==1 & reason_perm==1
keep if counter==1
bysort year: egen fract_contr=mean(above) if last_work==1 & reason_perm==1


label variable fract_contr ">2 Contracts"
quietly twoway line fract_contr year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(black black) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014,labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.1) 0.6, labsize(large) angle(horizontal))
graph export mult_contr_unc_mini.png, replace

***Concurrent

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*ssc install fastgini

*** fraction of full-time, part-time, marginal-employment over time

*keep if female==0
*
*
qui gen reason_perm=1 if reason_notif==0 | reason_notif==6
qui gen work=1 if source==1
bysort persnr year: egen sum_work=sum(work)
by persnr year: gen last_work=1 if sum_work>0
sort persnr year last_work begepi endepi

sort persnr year last_work reason_perm begepi endepi
bysort persnr year source reason_perm: gen concurrent=1 if source==1 & begepi<endepi[_n-1] & year==year[_n-1] & reason_perm==1
bysort persnr year: egen sum_concurrent=sum(concurrent) 
gen above=1 if sum_concurrent>=2 & sum_concurrent!=.
qui replace above=0 if sum_concurrent<2 & sum_concurrent!=.
bysort persnr year last_work reason_perm: gen counter=_n if last_work==1 & reason_perm==1
keep if counter==1
bysort year source: egen fract_conc=mean(above) if source==1

label variable fract_conc "Concurrent"
quietly twoway line fract_conc year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(black black) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014,labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.05) 0.2, labsize(large) angle(horizontal))
graph export fract_conc_unc.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*ssc install fastgini

*** fraction of full-time, part-time, marginal-employment over time

keep if female==0
*
*
qui gen reason_perm=1 if reason_notif==0 | reason_notif==6
qui gen work=1 if source==1
bysort persnr year: egen sum_work=sum(work)
by persnr year: gen last_work=1 if sum_work>0
sort persnr year last_work begepi endepi

sort persnr year last_work reason_perm begepi endepi
bysort persnr year source reason_perm: gen concurrent=1 if source==1 & begepi<endepi[_n-1] & year==year[_n-1] & reason_perm==1
bysort persnr year: egen sum_concurrent=sum(concurrent) 
gen above=1 if sum_concurrent>=2 & sum_concurrent!=.
qui replace above=0 if sum_concurrent<2 & sum_concurrent!=.
bysort persnr year last_work reason_perm: gen counter=_n if last_work==1 & reason_perm==1
keep if counter==1
bysort year source: egen fract_conc=mean(above) if source==1

label variable fract_conc "Concurrent"
quietly twoway line fract_conc year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(black black) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014,labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.05) 0.2, labsize(large) angle(horizontal))
graph export fract_conc_male.png, replace

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars.dta",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*ssc install fastgini

*** fraction of full-time, part-time, marginal-employment over time

keep if female==1
*
*
qui gen reason_perm=1 if reason_notif==0 | reason_notif==6
qui gen work=1 if source==1
bysort persnr year: egen sum_work=sum(work)
by persnr year: gen last_work=1 if sum_work>0
sort persnr year last_work begepi endepi

sort persnr year last_work reason_perm begepi endepi
bysort persnr year source reason_perm: gen concurrent=1 if source==1 & begepi<endepi[_n-1] & year==year[_n-1] & reason_perm==1
bysort persnr year: egen sum_concurrent=sum(concurrent) 
gen above=1 if sum_concurrent>=2 & sum_concurrent!=.
qui replace above=0 if sum_concurrent<2 & sum_concurrent!=.
bysort persnr year last_work reason_perm: gen counter=_n if last_work==1 & reason_perm==1
keep if counter==1
bysort year source: egen fract_conc=mean(above) if source==1

label variable fract_conc "Concurrent"
quietly twoway line fract_conc year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(black black) legend(position(6) rows(1)) lpattern(solid dash) lwidth(medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014,labsize(large)) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.05) 0.2, labsize(large) angle(horizontal))
graph export fract_conc_female.png, replace

