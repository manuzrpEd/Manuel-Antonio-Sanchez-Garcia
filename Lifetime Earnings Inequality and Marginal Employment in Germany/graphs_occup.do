***ECON Sector

**Unconditional

cls
set more off

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

order occupational_group occupation, last
*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

*label dir

*label list beruf_gr_en
*label list beruf2010_gr_en
tab occupation if form==1
tab occupational_group if form==1

tab occupation if form==2
tab occupational_group if form==2

tab occupation if form==3
tab occupational_group if form==3

*codebook occupation if occupation==
*codebook occupational_group if occupational_group==

**Males

cls
set more off

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

order occupational_group occupation, last
keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

*label dir

*label list beruf_gr_en
*label list beruf2010_gr_en
tab occupation if form==1
tab occupational_group if form==1

tab occupation if form==2
tab occupational_group if form==2

tab occupation if form==3
tab occupational_group if form==3

*codebook occupation if occupation==
*codebook occupational_group if occupational_group==

**Unconditional

cls
set more off

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

order occupational_group occupation, last
keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

*label dir

*label list beruf_gr_en
*label list beruf2010_gr_en
tab occupation if form==1
tab occupational_group if form==1

tab occupation if form==2
tab occupational_group if form==2

tab occupation if form==3
tab occupational_group if form==3

*codebook occupation if occupation==
*codebook occupational_group if occupational_group==

***CONCENTRATION INDEX!!!
*https://en.wikipedia.org/wiki/Herfindahl_index

*ALL & Unconditional

cls
set more off

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

order occupational_group occupation, last

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort year: egen pc_occupation=pc(occupation)
bysort year: egen pc_occupational_group=pc(occupational_group)

save temp.dta, replace

bysort year occupation: gen ind=_n
keep if ind==1

gen sq_pc=pc_occupation^2
bysort year: egen sum_sq_pc=total(sq_pc)

quietly twoway line sum_sq_pc year, ytitle({bf:HHI}, size(large) height(7)) lcolor(black) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export occ_all_unc.png, replace

bysort year: gen counter_year=_n
keep if counter_year==1
sum sum_sq_pc

use temp.dta,clear

bysort year occupational_group: gen ind=_n
keep if ind==1

gen sq_pc=pc_occupational_group^2
bysort year: egen sum_sq_pc=total(sq_pc)

quietly twoway line sum_sq_pc year, ytitle({bf:HHI}, size(large) height(7)) lcolor(black) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export occ_group_all_unc.png, replace

bysort year: gen counter_year=_n
keep if counter_year==1
sum sum_sq_pc

*ALL & Males

cls
set more off

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

order occupational_group occupation, last

keep if year>=1999 & year!=.
keep if female==0

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort year: egen pc_occupation=pc(occupation)
bysort year: egen pc_occupational_group=pc(occupational_group)

save temp.dta, replace

bysort year occupation: gen ind=_n
keep if ind==1

gen sq_pc=pc_occupation^2
bysort year: egen sum_sq_pc=total(sq_pc)

quietly twoway line sum_sq_pc year, ytitle({bf:HHI}, size(large) height(7)) lcolor(black) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export occ_all_male.png, replace

bysort year: gen counter_year=_n
keep if counter_year==1
sum sum_sq_pc

use temp.dta,clear

bysort year occupational_group: gen ind=_n
keep if ind==1

gen sq_pc=pc_occupational_group^2
bysort year: egen sum_sq_pc=total(sq_pc)

quietly twoway line sum_sq_pc year, ytitle({bf:HHI}, size(large) height(7)) lcolor(black) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export occ_group_all_male.png, replace

bysort year: gen counter_year=_n
keep if counter_year==1
sum sum_sq_pc

*ALL & Female

cls
set more off

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

order occupational_group occupation, last

keep if year>=1999 & year!=.
keep if female==1

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort year: egen pc_occupation=pc(occupation)
bysort year: egen pc_occupational_group=pc(occupational_group)

save temp.dta, replace

bysort year occupation: gen ind=_n
keep if ind==1

gen sq_pc=pc_occupation^2
bysort year: egen sum_sq_pc=total(sq_pc)

quietly twoway line sum_sq_pc year, ytitle({bf:HHI}, size(large) height(7)) lcolor(black) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export occ_all_female.png, replace

bysort year: gen counter_year=_n
keep if counter_year==1
sum sum_sq_pc

use temp.dta,clear

bysort year occupational_group: gen ind=_n
keep if ind==1

gen sq_pc=pc_occupational_group^2
bysort year: egen sum_sq_pc=total(sq_pc)

quietly twoway line sum_sq_pc year, ytitle({bf:HHI}, size(large) height(7)) lcolor(black) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export occ_group_all_female.png, replace

bysort year: gen counter_year=_n
keep if counter_year==1
sum sum_sq_pc

*Form & Unconditional

cls
set more off

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

order occupational_group occupation, last

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort year form: egen pc_occupation=pc(occupation)
bysort year form: egen pc_occupational_group=pc(occupational_group)

save temp.dta, replace

bysort year form occupation: gen ind=_n
keep if ind==1

gen sq_pc=pc_occupation^2
bysort year form: egen sum_sq_pc_full=total(sq_pc) if form==1
bysort year form: egen sum_sq_pc_part=total(sq_pc) if form==2
bysort year form: egen sum_sq_pc_mini=total(sq_pc) if form==3

label variable sum_sq_pc_full "Full Time"
label variable sum_sq_pc_part "Part Time"
label variable sum_sq_pc_mini "Marg. Empl."

quietly twoway line sum_sq_pc_full sum_sq_pc_part sum_sq_pc_mini year, ytitle({bf:HHI}, size(large) height(7)) lcolor(black) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export occ_form_unc.png, replace

bysort year form: gen counter_year=_n
keep if counter_year==1
sum sum_sq_pc_full
sum sum_sq_pc_part
sum sum_sq_pc_mini

use temp.dta,clear

bysort year form occupational_group: gen ind=_n
keep if ind==1

gen sq_pc=pc_occupational_group^2
bysort year form: egen sum_sq_pc_full=total(sq_pc) if form==1
bysort year form: egen sum_sq_pc_part=total(sq_pc) if form==2
bysort year form: egen sum_sq_pc_mini=total(sq_pc) if form==3

label variable sum_sq_pc_full "Full Time"
label variable sum_sq_pc_part "Part Time"
label variable sum_sq_pc_mini "Marg. Empl."

quietly twoway line sum_sq_pc_full sum_sq_pc_part sum_sq_pc_mini year, ytitle({bf:HHI}, size(large) height(7)) lcolor(black) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export occ_group_form_unc.png, replace

bysort year form: gen counter_year=_n
keep if counter_year==1
sum sum_sq_pc_full
sum sum_sq_pc_part
sum sum_sq_pc_mini

*Form & Males

cls
set more off

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

order occupational_group occupation, last

keep if year>=1999 & year!=.
keep if female==0

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort year form: egen pc_occupation=pc(occupation)
bysort year form: egen pc_occupational_group=pc(occupational_group)

save temp.dta, replace

bysort year form occupation: gen ind=_n
keep if ind==1

gen sq_pc=pc_occupation^2
bysort year form: egen sum_sq_pc_full=total(sq_pc) if form==1
bysort year form: egen sum_sq_pc_part=total(sq_pc) if form==2
bysort year form: egen sum_sq_pc_mini=total(sq_pc) if form==3

label variable sum_sq_pc_full "Full Time"
label variable sum_sq_pc_part "Part Time"
label variable sum_sq_pc_mini "Marg. Empl."

quietly twoway line sum_sq_pc_full sum_sq_pc_part sum_sq_pc_mini year, ytitle({bf:HHI}, size(large) height(7)) lcolor(black) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export occ_form_male.png, replace

bysort year form: gen counter_year=_n
keep if counter_year==1
sum sum_sq_pc_full
sum sum_sq_pc_part
sum sum_sq_pc_mini

use temp.dta,clear

bysort year form occupational_group: gen ind=_n
keep if ind==1

gen sq_pc=pc_occupational_group^2
bysort year form: egen sum_sq_pc_full=total(sq_pc) if form==1
bysort year form: egen sum_sq_pc_part=total(sq_pc) if form==2
bysort year form: egen sum_sq_pc_mini=total(sq_pc) if form==3

label variable sum_sq_pc_full "Full Time"
label variable sum_sq_pc_part "Part Time"
label variable sum_sq_pc_mini "Marg. Empl."

quietly twoway line sum_sq_pc_full sum_sq_pc_part sum_sq_pc_mini year, ytitle({bf:HHI}, size(large) height(7)) lcolor(black) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export occ_group_form_male.png, replace

bysort year form: gen counter_year=_n
keep if counter_year==1
sum sum_sq_pc_full
sum sum_sq_pc_part
sum sum_sq_pc_mini

*Form & Females

cls
set more off

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

order occupational_group occupation, last

keep if year>=1999 & year!=.
keep if female==1

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

bysort year form: egen pc_occupation=pc(occupation)
bysort year form: egen pc_occupational_group=pc(occupational_group)

save temp.dta, replace

bysort year form occupation: gen ind=_n
keep if ind==1

gen sq_pc=pc_occupation^2
bysort year form: egen sum_sq_pc_full=total(sq_pc) if form==1
bysort year form: egen sum_sq_pc_part=total(sq_pc) if form==2
bysort year form: egen sum_sq_pc_mini=total(sq_pc) if form==3

label variable sum_sq_pc_full "Full Time"
label variable sum_sq_pc_part "Part Time"
label variable sum_sq_pc_mini "Marg. Empl."

quietly twoway line sum_sq_pc_full sum_sq_pc_part sum_sq_pc_mini year, ytitle({bf:HHI}, size(large) height(7)) lcolor(black) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export occ_form_female.png, replace

bysort year form: gen counter_year=_n
keep if counter_year==1
sum sum_sq_pc_full
sum sum_sq_pc_part
sum sum_sq_pc_mini

use temp.dta,clear

bysort year form occupational_group: gen ind=_n
keep if ind==1

gen sq_pc=pc_occupational_group^2
bysort year form: egen sum_sq_pc_full=total(sq_pc) if form==1
bysort year form: egen sum_sq_pc_part=total(sq_pc) if form==2
bysort year form: egen sum_sq_pc_mini=total(sq_pc) if form==3

label variable sum_sq_pc_full "Full Time"
label variable sum_sq_pc_part "Part Time"
label variable sum_sq_pc_mini "Marg. Empl."

quietly twoway line sum_sq_pc_full sum_sq_pc_part sum_sq_pc_mini year, ytitle({bf:HHI}, size(large) height(7)) lcolor(black) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lwidth(medthick medthick thick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export occ_group_form_female.png, replace

bysort year form: gen counter_year=_n
keep if counter_year==1
sum sum_sq_pc_full
sum sum_sq_pc_part
sum sum_sq_pc_mini

***CHECK SPELLS at the beginning of the month? 
*85% starting < day 6
*60% starting < day 6 if starting after January
*83% finishing > day 25
*60% starting > day 25 if finishing before December

cls
set more off

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

gen count_beg=0

replace count_beg=1 if day_begepi<6 & day_begepi!=.

gen count_end=0

replace count_end=1 if day_endepi>25 & day_endepi!=.

sum count_beg

sum count_beg if month_begepi!=. & month_begepi>1

sum count_end

sum count_end if month_endepi!=. & month_endepi<12

***same for Unemployment Spells:
*so many spells are partitioned at "random" days, hence not really informative

cls
set more off

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars",clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=2

gen count_beg=0

replace count_beg=1 if day_begepi<6 & day_begepi!=.

gen count_end=0

replace count_end=1 if day_endepi>25 & day_endepi!=.

sum count_beg

sum count_beg if month_begepi!=. & month_begepi>1

sum count_end

sum count_end if month_endepi!=. & month_endepi<12
