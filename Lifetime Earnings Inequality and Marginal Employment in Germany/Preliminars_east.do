clear
*set memory 16g
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_east.dta", clear
set more off

sort persnr begepi endepi
*

***split unemployment periods (as they may be above 1 year), source=2

qui gen years_unemp=year_endepi-year_begepi if source==2
bysort persnr year source: gen counter_per_unemp=_n if source==2
expand years_unemp+1 if source==2 & years_unemp>0 & years_unemp<5, generate(counter_expand)

tab years_unemp
*correct, up to 5 years, but 4th and 5th small density

*drop counter_per_unemp
*bysort persnr year source: gen counter_per_unemp=_n if source==2

bysort persnr year counter_per_unemp counter_expand: gen count_expand=sum(counter_expand)
drop counter_expand
rename count_expand counter_expand
tab counter_expand

*I need to adjust day-month-year begepi-endepi for this expanded observations
*also for age

replace year=year_begepi+1 if source==2 & years_unemp>0 & years_unemp<5 & counter_expand>0

qui gen age=year-year_birth+1
*
replace day_begepi=1 if source==2 & years_unemp>=1 & years_unemp<5 & counter_expand==1
replace month_begepi=1 if source==2 & years_unemp>=1 & years_unemp<5 & counter_expand==1
replace day_endepi=30 if source==2 & years_unemp>=1 & years_unemp<5 & counter_expand==0
replace month_endepi=12 if source==2 & years_unemp>=1 & years_unemp<5 & counter_expand==0
*replace day_endepi=day_endepi if source==2 & years_unemp==1 & counter_expand==1
*replace month_endepi=month_endepi if source==2 & years_unemp==1 & counter_expand==1

replace day_begepi=1 if source==2 & years_unemp>=2 & years_unemp<5 & counter_expand==2
replace month_begepi=1 if source==2 & years_unemp>=2 & years_unemp<5 & counter_expand==2
replace day_endepi=30 if source==2 & years_unemp>2 & years_unemp<5 & counter_expand==1
replace month_endepi=12 if source==2 & years_unemp>2 & years_unemp<5 & counter_expand==1
*replace day_endepi=day_endepi if source==2 & years_unemp==2 & counter_expand==2
*replace month_endepi=month_endepi if source==2 & years_unemp==2 & counter_expand==2

replace day_begepi=1 if source==2 & years_unemp>=3 & years_unemp<5 & counter_expand==3
replace month_begepi=1 if source==2 & years_unemp>=3 & years_unemp<5 & counter_expand==3
replace day_endepi=30 if source==2 & years_unemp>3 & years_unemp<5 & counter_expand==2
replace month_endepi=12 if source==2 & years_unemp>3 & years_unemp<5 & counter_expand==2
*replace day_endepi=day_endepi if source==2 & years_unemp==3 & counter_expand==3
*replace month_endepi=month_endepi if source==2 & years_unemp==3 & counter_expand==3

replace day_begepi=1 if source==2 & years_unemp==4 & counter_expand==4
replace month_begepi=1 if source==2 & years_unemp==4 & counter_expand==4
*replace day_endepi=day_endepi if source==2 & years_unemp==4 & counter_expand==4
*replace month_endepi=month_endepi if source==2 & years_unemp==4 & counter_expand==4

*
*
sort persnr year begepi endepi
drop counter_spell
bysort persnr: gen counter_spell=_n
*

drop years_unemp counter_per_unemp counter_expand

***split unemployment periods (as they may be above 1 year), source=3

qui gen years_unemp=year_endepi-year_begepi if source==3
bysort persnr year source: gen counter_per_unemp=_n if source==3
expand years_unemp+1 if source==3 & years_unemp>0 & years_unemp<8, generate(counter_expand)

tab years_unemp
*correct, up to 5 years, but 4th and 5th small density

*drop counter_per_unemp
*bysort persnr year source: gen counter_per_unemp=_n if source==3

bysort persnr year counter_per_unemp counter_expand: gen count_expand=sum(counter_expand)
drop counter_expand
rename count_expand counter_expand
tab counter_expand

*I need to adjust day-month-year begepi-endepi for this expanded observations
*also for age

replace year=year[_n-1]+1 if source==3 & years_unemp>0 & years_unemp<8 & counter_expand>0

qui replace age=year-year_birth+1 if source==3
/*
replace day_begepi=1 if source==3 & years_unemp>=1 & years_unemp<6 & counter_expand==1
replace month_begepi=1 if source==3 & years_unemp>=1 & years_unemp<6 & counter_expand==1
replace day_endepi=12 if source==3 & years_unemp>1 & years_unemp<6 & counter_expand==1
replace month_endepi=12 if source==3 & years_unemp>1 & years_unemp<6 & counter_expand==1
replace day_endepi=day_endepi if source==3 & years_unemp==1 & counter_expand==1
replace month_endepi=month_endepi if source==3 & years_unemp==1 & counter_expand==1

replace day_begepi=1 if source==3 & years_unemp>=2 & years_unemp<6 & counter_expand==2
replace month_begepi=1 if source==3 & years_unemp>=2 & years_unemp<6 & counter_expand==2
replace day_endepi=12 if source==3 & years_unemp>2 & years_unemp<6 & counter_expand==2
replace month_endepi=12 if source==3 & years_unemp>2 & years_unemp<6 & counter_expand==2
replace day_endepi=day_endepi if source==3 & years_unemp==2  & counter_expand==2
replace month_endepi=month_endepi if source==3 & years_unemp==2 & counter_expand==2

replace day_begepi=1 if source==3 & years_unemp>=3 & years_unemp<6 & counter_expand==3
replace month_begepi=1 if source==3 & years_unemp>=3 & years_unemp<6 & counter_expand==3
replace day_endepi=12 if source==3 & years_unemp>3 & years_unemp<6 & counter_expand==3
replace month_endepi=12 if source==3 & years_unemp>3 & years_unemp<6 & counter_expand==3
replace day_endepi=day_endepi if source==3 & years_unemp==3 & counter_expand==3
replace month_endepi=month_endepi if source==3 & years_unemp==3 & counter_expand==3

replace day_begepi=1 if source==3 & years_unemp>=4 & years_unemp<6 & counter_expand==4
replace month_begepi=1 if source==3 & years_unemp>=4 & years_unemp<6 & counter_expand==4
replace day_endepi=12 if source==3 & years_unemp>4 & years_unemp<6 & counter_expand==4
replace month_endepi=12 if source==3 & years_unemp>4 & years_unemp<6 & counter_expand==4
replace day_endepi=day_endepi if source==3 & years_unemp==4 & counter_expand==4
replace month_endepi=month_endepi if source==3 & years_unemp==4 & counter_expand==4

replace day_begepi=1 if source==3 & years_unemp>=5 & years_unemp<6 & counter_expand==5
replace month_begepi=1 if source==3 & years_unemp>=5 & years_unemp<6 & counter_expand==5
replace day_endepi=12 if source==3 & years_unemp>5 & years_unemp<6 & counter_expand==5
replace month_endepi=12 if source==3 & years_unemp>5 & years_unemp<6 & counter_expand==5
replace day_endepi=day_endepi if source==3 & years_unemp==5 & counter_expand==5
replace month_endepi=month_endepi if source==3 & years_unemp==5 & counter_expand==5
*/
*
sort persnr year begepi endepi
drop counter_spell
bysort persnr: gen counter_spell=_n
*

drop years_unemp counter_per_unemp counter_expand

***split unemployment periods (as they may be above 1 year), source=4

qui gen years_unemp=year_endepi-year_begepi if source==4
bysort persnr year source: gen counter_per_unemp=_n if source==4
expand years_unemp+1 if source==4 & years_unemp>0 & years_unemp<8, generate(counter_expand)

tab years_unemp
*correct, up to 5 years, but 4th and 5th small density

*drop counter_per_unemp
*bysort persnr year source: gen counter_per_unemp=_n if source==4

bysort persnr year counter_per_unemp counter_expand: gen count_expand=sum(counter_expand)
drop counter_expand
rename count_expand counter_expand
tab counter_expand

*I need to adjust day-month-year begepi-endepi for this expanded observations
*also for age

replace year=year[_n-1]+1 if source==4 & years_unemp>0 & years_unemp<8 & counter_expand>0

qui replace age=year-year_birth+1 if source==4
/*
replace month_begepi=1 if source==4 & years_unemp>=1 & years_unemp<6 & counter_expand==1
replace month_endepi=12 if source==4 & years_unemp>1 & years_unemp<6 & counter_expand==1
replace month_endepi=month_endepi if source==4 & years_unemp==1 & counter_expand==1

replace month_begepi=1 if source==4 & years_unemp>=2 & years_unemp<6 & counter_expand==2
replace month_endepi=12 if source==4 & years_unemp>2 & years_unemp<6 & counter_expand==2
replace month_endepi=month_endepi if source==4 & years_unemp==2 & counter_expand==2

replace month_begepi=1 if source==4 & years_unemp>=3 & years_unemp<6 & counter_expand==3
replace month_endepi=12 if source==4 & years_unemp>3 & years_unemp<6 & counter_expand==3
replace month_endepi=month_endepi if source==4 & years_unemp==3 & counter_expand==3

replace month_begepi=1 if source==4 & years_unemp>=4 & years_unemp<6 & counter_expand==4
replace month_endepi=12 if source==4 & years_unemp>4 & years_unemp<6 & counter_expand==4
replace month_endepi=month_endepi if source==4 & years_unemp==4 & counter_expand==4

replace month_begepi=1 if source==4 & years_unemp>=5 & years_unemp<6 & counter_expand==5
replace month_endepi=12 if source==4 & years_unemp>5 & years_unemp<6 & counter_expand==5
replace month_endepi=month_endepi if source==4 & years_unemp==5 & counter_expand==5
*/
*
sort persnr year begepi endepi source
drop counter_spell
bysort persnr: gen counter_spell=_n
*

drop years_unemp counter_per_unemp

*daily_wages from aggregate spells extrapolation (Stockton):
*
bysort persnr source year_begorig month_begorig day_begorig begorig endorig: gen counter_begorig=_n if source==1
by persnr source year_begorig month_begorig day_begorig begorig endorig: egen max_counter_begorig=max(counter_begorig) if source==1
tab counter_begorig,m
*none by default from the data set
*by persnr source year_begorig month_begorig day_begorig begorig endorig: replace daily_wage=daily_wage[_n+1] if source==1 & daily_wage==. & daily_wage[_n+1]!=. & max_counter_begorig!=counter_begorig & counter_begorig!=.
by persnr source year_begorig month_begorig day_begorig begorig endorig: replace daily_wage=daily_wage[_n+1] if source==1 & daily_wage==0 & daily_wage[_n+1]!=0 & max_counter_begorig!=counter_begorig & counter_begorig!=.

*delete double entries (lower wage) before Aggregation by year
sort persnr year begepi source daily_wage
qui gen index = 0
by persnr: replace index=1 if begepi==begepi[_n-1] & endepi==endepi[_n-1] & counter_diff_estab_id==counter_diff_estab_id[_n-1] & source==1
qui replace index = index[_n+1]
qui drop if index==1
drop index

gen form=0 if source==1
*full time
replace form=1 if part_time==0 & employment_status!=3 & midi_jobs!=2 & midi_jobs!=1 & source==1
replace form=1 if part_time==.z & employment_status!=3 & midi_jobs!=2 & midi_jobs!=1 & source==1
*marginal employment
replace form=3 if employment_status==3 & source==1
replace form=3 if midi_jobs==1 & source==1
replace form=3 if midi_jobs==2 & source==1
*exclusive part time
replace form=2 if part_time==1 & employment_status!=3 & midi_jobs!=2 & midi_jobs!=1 & source==1

tab form


*observations with daily_wage==0 are interruptions per se:
drop if daily_wage==0 & inrange(source,1,2)

*there aren't by default from the data set
*drop if daily_wage==. & source==1


qui gen days_epi=day_endepi+30*(month_endepi-1)-day_begepi-30*(month_begepi-1)+1 if inrange(source,1,2)
qui gen days_orig=day_endorig+30*(month_endorig-1)-day_begorig-30*(month_begorig-1)+1 if inrange(source,1,2)
bysort persnr year: egen days_year=sum(days_epi) if source==1
*the above definition doesn't take into account that days_year can be in one part of the year and not throughout

*Stockton:
*drop if days_epi<60 & days_orig<60
*because there is concentration:
drop if days_epi<3

*
sort persnr year begepi endepi source
drop counter_spell
bysort persnr: gen counter_spell=_n

*****

*** top coded extrapolation

*first we start with the WEST

*upper daily wage top coded, now we extrapolate here:

* http://fdz.iab.de/en/FDZ_Overview_of_Data/working_tools.aspx

forval i = 1/3 {

if form==`i' {

gen tc=0 if year==1975 & source==1 & west==1
replace tc=1 if daily_wage>=47 & year==1975 & source==1 & west==1
local T=47
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1975 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1976 & source==1 & west==1

replace tc=1 if daily_wage>=51 & year==1976 & source==1 & west==1
local T=51
qui sum tc
local F2=r(mean)
_pctile daily_wage if daily_wage!=0 & year==1976 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1977 & source==1 & west==1

replace tc=1 if daily_wage>=57 & year==1977 & source==1 & west==1
local T=57
qui sum tc
local F2=r(mean)
_pctile daily_wage if daily_wage!=0 & year==1977 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1978 & source==1 & west==1

replace tc=1 if daily_wage>=62 & year==1978 & source==1 & west==1
local T=62
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1978 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1979 & source==1 & west==1

replace tc=1 if daily_wage>=67 & year==1979 & source==1 & west==1
local T=67
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1979 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1980 & source==1 & west==1

replace tc=1 if daily_wage>=70 & year==1980 & source==1 & west==1
local T=70
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1980 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1981 & source==1 & west==1

replace tc=1 if daily_wage>=73 & year==1981 & source==1 & west==1
local T=73
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1981 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1982 & source==1 & west==1

replace tc=1 if daily_wage>=79 & year==1982 & source==1 & west==1
local T=79
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1982 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1983 & source==1 & west==1

replace tc=1 if daily_wage>=84 & year==1983 & source==1 & west==1
local T=84
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1983 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1984 & source==1 & west==1

replace tc=1 if daily_wage>=87 & year==1984 & source==1 & west==1
local T=87
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1984 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1985 & source==1 & west==1

replace tc=1 if daily_wage>=90 & year==1985 & source==1 & west==1
local T=90
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1985 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1986 & source==1 & west==1

replace tc=1 if daily_wage>=94 & year==1986 & source==1 & west==1
local T=94
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1986 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1987 & source==1 & west==1

replace tc=1 if daily_wage>=95 & year==1987 & source==1 & west==1
local T=95
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1987 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1988 & source==1 & west==1

replace tc=1 if daily_wage>=100 & year==1988 & source==1 & west==1
local T=100
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1988 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1989 & source==1 & west==1

replace tc=1 if daily_wage>=102 & year==1989 & source==1 & west==1
local T=102
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1989 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1990 & source==1 & west==1

replace tc=1 if daily_wage>=105 & year==1990 & source==1 & west==1
local T=105
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1990 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1991 & source==1 & west==1

replace tc=1 if daily_wage>=108 & year==1991 & source==1 & west==1
local T=108
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1991 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1992 & source==1 & west==1

replace tc=1 if daily_wage>=113 & year==1992 & source==1 & west==1
local T=113
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1992 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1993 & source==1 & west==1

replace tc=1 if daily_wage>=120 & year==1993 & source==1 & west==1
local T=120
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1993 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1994 & source==1 & west==1

replace tc=1 if daily_wage>=127 & year==1994 & source==1 & west==1
local T=127
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1994 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1995 & source==1 & west==1

replace tc=1 if daily_wage>=130 & year==1995 & source==1 & west==1
local T=130
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1995 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1996 & source==1 & west==1

replace tc=1 if daily_wage>=133 & year==1996 & source==1 & west==1
local T=133
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1996 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1997 & source==1 & west==1

replace tc=1 if daily_wage>=137 & year==1997 & source==1 & west==1
local T=137
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1997 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1998 & source==1 & west==1

replace tc=1 if daily_wage>=140 & year==1998 & source==1 & west==1
local T=140
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1998 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1999 & source==1 & west==1

replace tc=1 if daily_wage>=141 & year==1999 & source==1 & west==1
local T=141
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1999 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2000 & source==1 & west==1

replace tc=1 if daily_wage>=143 & year==2000 & source==1 & west==1
local T=143
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2000 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2001 & source==1 & west==1

replace tc=1 if daily_wage>=145 & year==2001 & source==1 & west==1
local T=145
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2001 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2002 & source==1 & west==1

replace tc=1 if daily_wage>=146 & year==2002 & source==1 & west==1
local T=146
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2002 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2003 & source==1 & west==1

replace tc=1 if daily_wage>=166 & year==2003 & source==1 & west==1
local T=166
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2003 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2004 & source==1 & west==1

replace tc=1 if daily_wage>=168 & year==2004 & source==1 & west==1
local T=168
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2004 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2005 & source==1 & west==1

replace tc=1 if daily_wage>=170 & year==2005 & source==1 & west==1
local T=170
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2005 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2006 & source==1 & west==1

replace tc=1 if daily_wage>=171 & year==2006 & source==1 & west==1
local T=171
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2006 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2007 & source==1 & west==1

replace tc=1 if daily_wage>=171 & year==2007 & source==1 & west==1
local T=171
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2007 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2008 & source==1 & west==1

replace tc=1 if daily_wage>=171 & year==2008 & source==1 & west==1
local T=171
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2008 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2009 & source==1 & west==1

replace tc=1 if daily_wage>=176 & year==2009 & source==1 & west==1
local T=176
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2009 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2010 & source==1 & west==1

replace tc=1 if daily_wage>=179 & year==2010 & source==1 & west==1
local T=179
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2010 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2011 & source==1 & west==1

replace tc=1 if daily_wage>=179 & year==2011 & source==1 & west==1
local T=179
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2011 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2012 & source==1 & west==1

replace tc=1 if daily_wage>=183 & year==2012 & source==1 & west==1
local T=183
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2012 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2013 & source==1 & west==1

replace tc=1 if daily_wage>=190 & year==2013 & source==1 & west==1
local T=190
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2013 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2014 & source==1 & west==1

replace tc=1 if daily_wage>=195 & year==2014 & source==1 & west==1
local T=195
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2014 & source==1 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1


*second we finish with the EAST

*upper daily wage top coded, now we extrapolate here:

* http://fdz.iab.de/en/FDZ_Overview_of_Data/working_tools.aspx

drop tc
gen tc=0 if year==1990 & source==1 & west==0

replace tc=1 if daily_wage>=45 & year==1990 & source==1 & west==0
local T=45
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1990 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1991 & source==1 & west==0

replace tc=1 if daily_wage>=50 & year==1991 & source==1 & west==0
local T=50
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1991 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1992 & source==1 & west==0

replace tc=1 if daily_wage>=80 & year==1992 & source==1 & west==0
local T=80
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1992 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1993 & source==1 & west==0

replace tc=1 if daily_wage>=89 & year==1993 & source==1 & west==0
local T=89
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1993 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1994 & source==1 & west==0

replace tc=1 if daily_wage>=99 & year==1994 & source==1 & west==0
local T=99
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1994 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1995 & source==1 & west==0

replace tc=1 if daily_wage>=107 & year==1995 & source==1 & west==0
local T=107
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1995 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1996 & source==1 & west==0

replace tc=1 if daily_wage>=113 & year==1996 & source==1 & west==0
local T=113
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1996 & west==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1997 & source==1 & west==0

replace tc=1 if daily_wage>=119 & year==1997 & source==1 & west==0
local T=119
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1997 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1998 & source==1 & west==0

replace tc=1 if daily_wage>=117 & year==1998 & source==1 & west==0
local T=117
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1998 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==1999 & source==1 & west==0

replace tc=1 if daily_wage>=121 & year==1999 & source==1 & west==0
local T=121
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==1999 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2000 & source==1 & west==0

replace tc=1 if daily_wage>=119 & year==2000 & source==1 & west==0
local T=119
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2000 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2001 & source==1 & west==0

replace tc=1 if daily_wage>=122 & year==2001 & source==1 & west==0
local T=122
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2001 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2002 & source==1 & west==0

replace tc=1 if daily_wage>=123 & year==2002 & source==1 & west==0
local T=123
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2002 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2003 & source==1 & west==0

replace tc=1 if daily_wage>=139 & year==2003 & source==1 & west==0
local T=139
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2003 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2004 & source==1 & west==0

replace tc=1 if daily_wage>=142 & year==2004 & source==1 & west==0
local T=142
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2004 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2005 & source==1 & west==0

replace tc=1 if daily_wage>=144 & year==2005 & source==1 & west==0
local T=144
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2005 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2006 & source==1 & west==0

replace tc=1 if daily_wage>=144 & year==2006 & source==1 & west==0
local T=144
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2006 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2007 & source==1 & west==0

replace tc=1 if daily_wage>=149 & year==2007 & source==1 & west==0
local T=149
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2007 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2008 & source==1 & west==0

replace tc=1 if daily_wage>=147 & year==2008 & source==1 & west==0
local T=147
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2008 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2009 & source==1 & west==0

replace tc=1 if daily_wage>=149 & year==2009 & source==1 & west==0
local T=149
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2009 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2010 & source==1 & west==0

replace tc=1 if daily_wage>=152 & year==2010 & source==1 & west==0
local T=152
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2010 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2011 & source==1 & west==0

replace tc=1 if daily_wage>=157 & year==2011 & source==1 & west==0
local T=157
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2011 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2012 & source==1 & west==0

replace tc=1 if daily_wage>=157 & year==2012 & source==1 & west==0
local T=157
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2012 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2013 & source==1 & west==0

replace tc=1 if daily_wage>=161 & year==2013 & source==1 & west==0
local T=161
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2013 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

drop tc
gen tc=0 if year==2014 & source==1 & west==0

replace tc=1 if daily_wage>=164 & year==2014 & source==1 & west==0
local T=164
qui sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year==2014 & source==1 & west==0, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')

replace daily_wage=`T'/((1-runiform())^(1/`alpha8')) if tc==1

}

}

***marginal employment thresholds:
qui gen monthly_marginal_earnings=daily_wage*30 if form==3
qui drop if monthly_marginal_earnings>322.11 & inrange(year,1999,2001) & form==3
qui drop if monthly_marginal_earnings>325 & year==2002 & form==3
qui drop if monthly_marginal_earnings>325 & year==2002 & year_begepi<4 & form==3
qui drop if monthly_marginal_earnings>400 & year==2002 & year_begepi>=4 & form==3
qui drop if monthly_marginal_earnings>400 & inrange(year,2003,2012) & form==3
qui drop if monthly_marginal_earnings>450 & inrange(year,2013,2014) & form==3

*inflation adjustment
*source: https://data.oecd.org/price/inflation-cpi.htm
*2010 euros
qui gen cpi=100
qui replace cpi=42.8 if year==1975
qui replace cpi=44.6 if year==1976
qui replace cpi=46.3 if year==1977
qui replace cpi=47.6 if year==1978
qui replace cpi=49.5 if year==1979
qui replace cpi=52.2 if year==1980
qui replace cpi=55.5 if year==1981
qui replace cpi=58.4 if year==1982
qui replace cpi=60.3 if year==1983
qui replace cpi=61.8 if year==1984
qui replace cpi=63 if year==1985
qui replace cpi=63 if year==1986
qui replace cpi=63.1 if year==1987
qui replace cpi=63.9 if year==1988
qui replace cpi=65.7 if year==1989
qui replace cpi=67.5 if year==1990
qui replace cpi=70.2 if year==1991
qui replace cpi=73.8 if year==1992
qui replace cpi=77.1 if year==1993
qui replace cpi=79.1 if year==1994
qui replace cpi=80.5 if year==1995
qui replace cpi=81.6 if year==1996
qui replace cpi=83.2 if year==1997
qui replace cpi=84 if year==1998
qui replace cpi=84.5 if year==1999
qui replace cpi=85.7 if year==2000
qui replace cpi=87.4 if year==2001
qui replace cpi=88.6 if year==2002
qui replace cpi=89.6 if year==2003
qui replace cpi=91 if year==2004
qui replace cpi=92.5 if year==2005
qui replace cpi=93.9 if year==2006
qui replace cpi=96.1 if year==2007
qui replace cpi=98.6 if year==2008
qui replace cpi=98.9 if year==2009
*
qui replace cpi=102.1 if year==2011
qui replace cpi=104.1 if year==2012
qui replace cpi=105.7 if year==2013
qui replace cpi=106.6 if year==2014

qui gen def_daily_wage=daily_wage*100/cpi

*bias from bad spelling notifications, Dustmann, Stockton
qui drop if def_daily_wage<5 & source==1
*break after 1999
qui drop if def_daily_wage<14 & source==1 & form==2

* assume >3 years is out of labor force
* assume between<=3 years is unemployed
* keep longest consecutive spell (employed + unemployed <=3 periods)

egen persnr2=group(persnr)
drop persnr
rename persnr2 persnr

*breaks elimination, keep longest consecutive spell 1
qui drop counter_spell
sort persnr age begepi
by persnr: gen counter_spell=_n
by persnr: gen corner=0
by persnr: replace corner=1 if counter_spell==1 
by persnr: replace corner=1 if counter_spell==_N
by persnr: gen year_distance_one=0
by persnr: replace year_distance_one=year[_n+1]-year if corner==0
by persnr: replace year_distance_one=year[_n+1]-year if counter_spell==1
by persnr: gen ind_break=0
by persnr: replace ind_break=1 if year_distance_one>=2 & year_distance_one!=.

*index between <=3 years unemployment:
expand year_distance_one if year_distance_one<=3 & year_distance_one>1
sort persnr year begepi ind_break
by persnr year begepi ind_break: gen counter_year_jump=_n if ind_break==1 & year_distance_one<=3
*<=4 Hofmann

*update years, age, days_epi daily wage here:
replace source=5 if counter_year_jump!=. & counter_year_jump>1
*source==5 for unemployed without subsidies (assumption)

replace form=. if source==5

replace year=year+counter_year_jump-1 if source==5
replace age=age+counter_year_jump-1 if source==5

*gen days_epi=0
qui replace days_epi=90 if source==5
qui replace daily_wage=5 if source==5

qui replace days_year=. if source==5

*re do ind_break now for periods of imputed unemployment
qui drop counter_spell
sort persnr age begepi
by persnr: gen counter_spell=_n
drop corner year_distance_one ind_break counter_year_jump
*
by persnr: gen corner=0
by persnr: replace corner=1 if counter_spell==1 
by persnr: replace corner=1 if counter_spell==_N
by persnr: gen year_distance_one=0
by persnr: replace year_distance_one=age-age[_n-1] if corner==0
by persnr: replace year_distance_one=age-age[_n-1] if counter_spell==_N
by persnr: gen ind_break=0
by persnr: replace ind_break=1 if year_distance_one>=2 & year_distance_one!=.
*generate consecutive spells indicator
by persnr: gen sum_breaks=sum(ind_break)

*

*keep the longest consecutive spell
egen persnr2 = group(persnr sum_breaks)
gen index =1
sort persnr2 age begepi
by persnr2: egen index2 = sum(index) 
sort persnr age begepi
by persnr: egen index3 = max(index2) 
drop if index3 != index2
drop index index2 index3 persnr2
*
*drop possible repeated spells within individual
sort persnr age begepi
by persnr: gen count_max=_n
by persnr: gen max_stat=0 if count_max==1
by persnr: replace max_stat=1 if sum_breaks!=sum_breaks[_n-1] & count_max>1
by persnr: gen sum_max_stat=sum(max_stat)
qui drop if sum_max_stat!=0
qui drop count_max sum_max_stat max_stat corner year_distance_one ind_break sum_breaks
*drop if spell lasts less than 7 years
*sort persnr age begepi
*by persnr: gen max_years_spell = _N
*qui drop if max_years_spell <7
*qui drop max_years_spell

*keep if max years > some threshold

sort persnr age begepi
by persnr: egen max_year=max(year)
by persnr: egen min_year=min(year)
gen num_year=max_year-min_year
*drop if num_year<5

sort persnr year begepi endepi source
drop counter_spell
by persnr: gen counter_spell=_n

egen persnr2=group(persnr)
drop persnr
rename persnr2 persnr

qui gen earnings_epi=days_epi*def_daily_wage
bysort persnr year: egen earnings_year=sum(earnings_epi)
bysort persnr year form: egen earnings_year_form=sum(earnings_epi)

qui gen earnings_epi_cond=days_epi*def_daily_wage if inrange(form,1,2)
bysort persnr year: egen earnings_year_cond=sum(earnings_epi_cond) if inrange(form,1,2)

qui gen log_earnings_year=log(earnings_year)
qui gen log_earnings_year_cond=log(earnings_year_cond)
qui gen log_earnings_year_form=log(earnings_year_form)

*

bysort persnr: gen counter_pers_spell=_n
bysort persnr: gen ind_ch=1 if female!=female[_n-1] & counter_pers_spell!=1
tab ind_ch,m

*drop id

sort persnr year begepi endepi source form

order persnr female counter_spell begepi endepi year age days_epi days_year source reason_notif part_time employment_status midi_jobs counter_diff_estab_id daily_wage west requirement german year_birth school_qualification occupation
sum persnr

save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_east.dta", replace

do moments_cross_section.do

