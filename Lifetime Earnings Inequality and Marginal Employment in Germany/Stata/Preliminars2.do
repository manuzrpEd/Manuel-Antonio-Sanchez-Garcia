clear
set memory 16g
*** top coded extrapolation
use "\Preliminars.dta", clear

forval i = 1/2 {

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


}

}

***marginal employment thresholds:
gen monthly_marginal_earnings=daily_wage*30 if form==3
drop if monthly_marginal_earnings>322.11 & inrange(year,1999,2001)
drop if monthly_marginal_earnings>325 & year==2002
drop if monthly_marginal_earnings>325 & year==2002 & year_begepi<4
drop if monthly_marginal_earnings>400 & year==2002 & year_begepi>=4
drop if monthly_marginal_earnings>400 & inrange(year,2003,2012)
drop if monthly_marginal_earnings>450 & inrange(year,2013,2014)

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

gen log_earnings_year=log(earnings_year)
gen log_earnings_year_form=log(earnings_year_form)

*

bysort persnr: gen counter_pers_spell=_n
bysort persnr: gen ind_ch=1 if female!=female[_n-1] & counter_pers_spell!=1
tab ind_ch,m

*drop id

order persnr female counter_spell begepi endepi year age days_epi days_year source reason_notif part_time employment_status midi_jobs counter_diff_estab_id daily_wage west requirement german year_birth school_qualification occupation
sum persnr

save "\Preliminars.dta", replace

do Preliminars_east.do
