*
*
use "PATH\rsiab7510.dta", clear
cd "PATH"
sum persnr

set more off
drop counter_person
rename persnr indivnr
qui drop if training==.
qui drop if econ_act==.z
qui drop if occupation==.z
qui drop if region==.z
qui drop if german==.z

drop if german==0

*keep only employees liable to social security
qui drop if inrange(data_source,2,4)
qui drop if inrange(emp_status,2,6)

qui drop if occup_stat==.z
qui drop if occup_stat==0
qui drop if occup_stat==7

*
qui drop if emp_stat==.z
*
qui drop if inrange(reason,2,7)
qui drop if reason==.z
*months in successive years
qui gen year_begepi=year(begepi)
qui gen month_begepi=month(begepi)
qui gen year_endepi=year(endepi)
qui gen month_endepi=month(endepi)
qui gen year_begendepi = year_begepi if year_begepi==year_endepi
*age selection 
bysort indivnr: gen ch=1 if year_birth!=year_birth
gen age=year_begendepi-year_birth+1
*
qui drop if age<24
qui drop if age>55
*
*females drop 
rename training schooling
qui drop if schooling==.z
rename schooling_degree vocation
rename gender female
qui drop if female==.z
qui drop if female==1
*
bysort indivnr age: gen counter_ind=_n
numlabel, add
*regions
qui gen schleswig_holstein=1 if region>=1000 & region<3000
qui replace schleswig_holstein=0 if schleswig_holstein==.
qui gen lower_saxony=1 if region>=3000 & region<5000
qui replace lower_saxony=0 if lower_saxony==.
qui gen north_rhine_westphalia=1 if region>=5000 & region<6000
qui replace north_rhine_westphalia=0 if north_rhine_westphalia==.
qui gen hesse=1 if region>=6000 & region<7000
qui replace hesse=0 if hesse==.
qui gen rhineland_palatinate=1 if region>=7000 & region<8000
qui replace rhineland_palatinate=0 if rhineland_palatinate==.
qui gen badden_wurttemberg=1 if region>=8000 & region<9000
qui replace badden_wurttemberg=0 if badden_wurttemberg==.
qui gen bavaria=1 if region>=9000 & region<10000
qui replace bavaria=0 if bavaria==.
qui gen saarland=1 if region>=10000 & region<11000
qui replace saarland=0 if saarland==.
qui gen berlin=1 if region>=11000 & region <12000
qui replace berlin=0 if berlin==.
*east germany drop 
qui drop if berlin==1
qui replace berlin=0 if berlin==.
*
*
*upper daily wage top coded, now we extrapolate here:

*
gen indtc=0
*
gen tc=0 if year_begendepi==1975 & data_source==1
replace tc=1 if daily_wage>=47 & year_begendepi==1975 & data_source==1
replace indtc=1 if daily_wage>=47 & year_begendepi==1975 & data_source==1
local T=47
sum tc

local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1975 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
gen check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1975
replace daily_wage=check if tc==1 & year_begendepi==1975 & data_source==1
drop tc
gen tc=0 if year_begendepi==1976
replace check=.
replace tc=1 if daily_wage>=51 & year_begendepi==1976 & data_source==1
replace indtc=1 if daily_wage>=51 & year_begendepi==1976 & data_source==1
local T=51
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1976 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1976
replace daily_wage=check if tc==1 & year_begendepi==1976 & data_source==1
drop tc
gen tc=0 if year_begendepi==1977
replace check=.
replace tc=1 if daily_wage>=57 & year_begendepi==1977 & data_source==1
replace indtc=1 if daily_wage>=57 & year_begendepi==1977 & data_source==1
local T=57
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1977 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1977
replace daily_wage=check if tc==1 & year_begendepi==1977 & data_source==1
drop tc
gen tc=0 if year_begendepi==1978
replace check=.
replace tc=1 if daily_wage>=62 & year_begendepi==1978 & data_source==1
replace indtc=1 if daily_wage>=62 & year_begendepi==1978 & data_source==1
local T=62
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1978 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1978
replace daily_wage=check if tc==1 & year_begendepi==1978 & data_source==1
drop tc
gen tc=0 if year_begendepi==1979
replace check=.
replace tc=1 if daily_wage>=67 & year_begendepi==1979 & data_source==1
replace indtc=1 if daily_wage>=67 & year_begendepi==1979 & data_source==1
local T=67
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1979 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1979
replace daily_wage=check if tc==1 & year_begendepi==1979 & data_source==1
drop tc
gen tc=0 if year_begendepi==1980
replace check=.
replace tc=1 if daily_wage>=70 & year_begendepi==1980 & data_source==1
replace indtc=1 if daily_wage>=70 & year_begendepi==1980 & data_source==1
local T=70
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1980 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1980
replace daily_wage=check if tc==1 & year_begendepi==1980 & data_source==1
drop tc
gen tc=0 if year_begendepi==1981
replace check=.
replace tc=1 if daily_wage>=73 & year_begendepi==1981 & data_source==1
replace indtc=1 if daily_wage>=73 & year_begendepi==1981 & data_source==1
local T=73
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1981 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1981
replace daily_wage=check if tc==1 & year_begendepi==1981 & data_source==1
drop tc
gen tc=0 if year_begendepi==1982
replace check=.
replace tc=1 if daily_wage>=79 & year_begendepi==1982 & data_source==1
replace indtc=1 if daily_wage>=79 & year_begendepi==1982 & data_source==1
local T=79
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1982 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1982
replace daily_wage=check if tc==1 & year_begendepi==1982 & data_source==1
drop tc
gen tc=0 if year_begendepi==1983
replace check=.
replace tc=1 if daily_wage>=84 & year_begendepi==1983 & data_source==1
replace indtc=1 if daily_wage>=84 & year_begendepi==1983 & data_source==1
local T=84
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1983 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1983
replace daily_wage=check if tc==1 & year_begendepi==1983 & data_source==1
drop tc
gen tc=0 if year_begendepi==1984
replace check=.
replace tc=1 if daily_wage>=87 & year_begendepi==1984 & data_source==1
replace indtc=1 if daily_wage>=87 & year_begendepi==1984 & data_source==1
local T=87
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1984 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1984
replace daily_wage=check if tc==1 & year_begendepi==1984 & data_source==1
drop tc
gen tc=0 if year_begendepi==1985
replace check=.
replace tc=1 if daily_wage>=90 & year_begendepi==1985 & data_source==1
replace indtc=1 if daily_wage>=90 & year_begendepi==1985 & data_source==1
local T=90
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1985 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1985
replace daily_wage=check if tc==1 & year_begendepi==1985 & data_source==1
drop tc
gen tc=0 if year_begendepi==1986
replace check=.
replace tc=1 if daily_wage>=94 & year_begendepi==1986 & data_source==1
replace indtc=1 if daily_wage>=94 & year_begendepi==1986 & data_source==1
local T=94
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1986 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1986
replace daily_wage=check if tc==1 & year_begendepi==1986 & data_source==1
drop tc
gen tc=0 if year_begendepi==1987
replace check=.
replace tc=1 if daily_wage>=95 & year_begendepi==1987 & data_source==1
replace indtc=1 if daily_wage>=95 & year_begendepi==1987 & data_source==1
local T=95
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1987 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1987
replace daily_wage=check if tc==1 & year_begendepi==1987 & data_source==1
drop tc
gen tc=0 if year_begendepi==1988
replace check=.
replace tc=1 if daily_wage>=100 & year_begendepi==1988 & data_source==1
replace indtc=1 if daily_wage>=100 & year_begendepi==1988 & data_source==1
local T=100
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1988 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1988
replace daily_wage=check if tc==1 & year_begendepi==1988 & data_source==1
drop tc
gen tc=0 if year_begendepi==1989
replace check=.
replace tc=1 if daily_wage>=102 & year_begendepi==1989 & data_source==1
replace indtc=1 if daily_wage>=102 & year_begendepi==1989 & data_source==1
local T=102
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1989 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1989
replace daily_wage=check if tc==1 & year_begendepi==1989 & data_source==1
drop tc
gen tc=0 if year_begendepi==1990
replace check=.
replace tc=1 if daily_wage>=105 & year_begendepi==1990 & data_source==1
replace indtc=1 if daily_wage>=105 & year_begendepi==1990 & data_source==1
local T=105
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1990 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1990
replace daily_wage=check if tc==1 & year_begendepi==1990 & data_source==1
drop tc
gen tc=0 if year_begendepi==1991
replace check=.
replace tc=1 if daily_wage>=108 & year_begendepi==1991 & data_source==1
replace indtc=1 if daily_wage>=108 & year_begendepi==1991 & data_source==1
local T=108
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1991 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1991
replace daily_wage=check if tc==1 & year_begendepi==1991 & data_source==1
drop tc
gen tc=0 if year_begendepi==1992
replace check=.
replace tc=1 if daily_wage>=113 & year_begendepi==1992 & data_source==1
replace indtc=1 if daily_wage>=113 & year_begendepi==1992 & data_source==1
local T=113
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1992 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1992
replace daily_wage=check if tc==1 & year_begendepi==1992 & data_source==1
drop tc
gen tc=0 if year_begendepi==1993
replace check=.
replace tc=1 if daily_wage>=120 & year_begendepi==1993 & data_source==1
replace indtc=1 if daily_wage>=120 & year_begendepi==1993 & data_source==1
local T=120
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1993 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1993
replace daily_wage=check if tc==1 & year_begendepi==1993 & data_source==1
drop tc
gen tc=0 if year_begendepi==1994
replace check=.
replace tc=1 if daily_wage>=127 & year_begendepi==1994 & data_source==1
replace indtc=1 if daily_wage>=127 & year_begendepi==1994 & data_source==1
local T=127
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1994 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1994
replace daily_wage=check if tc==1 & year_begendepi==1994 & data_source==1
drop tc
gen tc=0 if year_begendepi==1995
replace check=.
replace tc=1 if daily_wage>=130 & year_begendepi==1995 & data_source==1
replace indtc=1 if daily_wage>=130 & year_begendepi==1995 & data_source==1
local T=130
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1995 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1995
replace daily_wage=check if tc==1 & year_begendepi==1995 & data_source==1
drop tc
gen tc=0 if year_begendepi==1996
replace check=.
replace tc=1 if daily_wage>=133 & year_begendepi==1996 & data_source==1
replace indtc=1 if daily_wage>=133 & year_begendepi==1996 & data_source==1
local T=133
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1996, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1996
replace daily_wage=check if tc==1 & year_begendepi==1996 & data_source==1
drop tc
gen tc=0 if year_begendepi==1997
replace check=.
replace tc=1 if daily_wage>=137 & year_begendepi==1997 & data_source==1
replace indtc=1 if daily_wage>=137 & year_begendepi==1997 & data_source==1
local T=137
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1997 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1997
replace daily_wage=check if tc==1 & year_begendepi==1997 & data_source==1
drop tc
gen tc=0 if year_begendepi==1998
replace check=.
replace tc=1 if daily_wage>=140 & year_begendepi==1998 & data_source==1
replace indtc=1 if daily_wage>=140 & year_begendepi==1998 & data_source==1
local T=140
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1998 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1998
replace daily_wage=check if tc==1 & year_begendepi==1998 & data_source==1
drop tc
gen tc=0 if year_begendepi==1999
replace check=.
replace tc=1 if daily_wage>=141 & year_begendepi==1999 & data_source==1
replace indtc=1 if daily_wage>=141 & year_begendepi==1999 & data_source==1
local T=141
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==1999 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==1999
replace daily_wage=check if tc==1 & year_begendepi==1999 & data_source==1
drop tc
gen tc=0 if year_begendepi==2000
replace check=.
replace tc=1 if daily_wage>=143 & year_begendepi==2000 & data_source==1
replace indtc=1 if daily_wage>=143 & year_begendepi==2000 & data_source==1
local T=143
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==2000 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==2000
replace daily_wage=check if tc==1 & year_begendepi==2000 & data_source==1
drop tc
gen tc=0 if year_begendepi==2001
replace check=.
replace tc=1 if daily_wage>=145 & year_begendepi==2001 & data_source==1
replace indtc=1 if daily_wage>=145 & year_begendepi==2001 & data_source==1
local T=145
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==2001 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==2001
replace daily_wage=check if tc==1 & year_begendepi==2001 & data_source==1
drop tc
gen tc=0 if year_begendepi==2002
replace check=.
replace tc=1 if daily_wage>=146 & year_begendepi==2002 & data_source==1
replace indtc=1 if daily_wage>=146 & year_begendepi==2002 & data_source==1
local T=146
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==2002 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==2002
replace daily_wage=check if tc==1 & year_begendepi==2002 & data_source==1
drop tc
gen tc=0 if year_begendepi==2003
replace check=.
replace tc=1 if daily_wage>=166 & year_begendepi==2003 & data_source==1
replace indtc=1 if daily_wage>=166 & year_begendepi==2003 & data_source==1
local T=166
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==2003 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==2003
replace daily_wage=check if tc==1 & year_begendepi==2003 & data_source==1
drop tc
gen tc=0 if year_begendepi==2004
replace check=.
replace tc=1 if daily_wage>=168 & year_begendepi==2004 & data_source==1
replace indtc=1 if daily_wage>=168 & year_begendepi==2004 & data_source==1
local T=168
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==2004 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==2004
replace daily_wage=check if tc==1 & year_begendepi==2004 & data_source==1
drop tc
gen tc=0 if year_begendepi==2005
replace check=.
replace tc=1 if daily_wage>=170 & year_begendepi==2005 & data_source==1
replace indtc=1 if daily_wage>=170 & year_begendepi==2005 & data_source==1
local T=170
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==2005 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==2005
replace daily_wage=check if tc==1 & year_begendepi==2005 & data_source==1
drop tc
gen tc=0 if year_begendepi==2006
replace check=.
replace tc=1 if daily_wage>=171 & year_begendepi==2006 & data_source==1
replace indtc=1 if daily_wage>=171 & year_begendepi==2006 & data_source==1
local T=171
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==2006 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==2006
replace daily_wage=check if tc==1 & year_begendepi==2006 & data_source==1
drop tc
gen tc=0 if year_begendepi==2007
replace check=.
replace tc=1 if daily_wage>=171 & year_begendepi==2007 & data_source==1
replace indtc=1 if daily_wage>=171 & year_begendepi==2007 & data_source==1
local T=171
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==2007 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==2007
replace daily_wage=check if tc==1 & year_begendepi==2007 & data_source==1
drop tc
gen tc=0 if year_begendepi==2008
replace check=.
replace tc=1 if daily_wage>=171 & year_begendepi==2008 & data_source==1
replace indtc=1 if daily_wage>=171 & year_begendepi==2008 & data_source==1
local T=171
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==2008 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==2008
replace daily_wage=check if tc==1 & year_begendepi==2008 & data_source==1
drop tc
gen tc=0 if year_begendepi==2009
replace check=.
replace tc=1 if daily_wage>=176 & year_begendepi==2009 & data_source==1
replace indtc=1 if daily_wage>=176 & year_begendepi==2009 & data_source==1
local T=176
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==2009 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==2009
replace daily_wage=check if tc==1 & year_begendepi==2009 & data_source==1
drop tc
gen tc=0 if year_begendepi==2010
replace check=.
replace tc=1 if daily_wage>=179 & year_begendepi==2010 & data_source==1
replace indtc=1 if daily_wage>=179 & year_begendepi==2010 & data_source==1
local T=179
sum tc
local F2=r(mean) 
_pctile daily_wage if daily_wage!=0 & year_begendepi==2010 & data_source==1, p(80)
local y8=r(r1)
local alpha8=ln((1-0.8)/(`F2'))/ln(`T'/`y8')
replace check=`T'/((1-runiform())^(1/`alpha8')) if tc==1 & year_begendepi==2010
replace daily_wage=check if tc==1 & year_begendepi==2010 & data_source==1
*
qui drop counter_ind
sort indivnr begepi
bysort indivnr: gen counter_ind=_n



*inflation adjustment
qui gen cpi=100
qui replace cpi=42.8 if year_begendepi==1975
qui replace cpi=44.6 if year_begendepi==1976
qui replace cpi=46.3 if year_begendepi==1977
qui replace cpi=47.6 if year_begendepi==1978
qui replace cpi=49.5 if year_begendepi==1979
qui replace cpi=52.2 if year_begendepi==1980
qui replace cpi=55.5 if year_begendepi==1981
qui replace cpi=58.4 if year_begendepi==1982
qui replace cpi=60.3 if year_begendepi==1983
qui replace cpi=61.8 if year_begendepi==1984
qui replace cpi=63 if year_begendepi==1985
qui replace cpi=63 if year_begendepi==1986
qui replace cpi=63.1 if year_begendepi==1987
qui replace cpi=63.9 if year_begendepi==1988
qui replace cpi=65.7 if year_begendepi==1989
qui replace cpi=67.5 if year_begendepi==1990
qui replace cpi=70.2 if year_begendepi==1991
qui replace cpi=73.8 if year_begendepi==1992
qui replace cpi=77.1 if year_begendepi==1993
qui replace cpi=79.1 if year_begendepi==1994
qui replace cpi=80.5 if year_begendepi==1995
qui replace cpi=81.6 if year_begendepi==1996
qui replace cpi=83.2 if year_begendepi==1997
qui replace cpi=84 if year_begendepi==1998
qui replace cpi=84.5 if year_begendepi==1999
qui replace cpi=85.7 if year_begendepi==2000
qui replace cpi=87.4 if year_begendepi==2001
qui replace cpi=88.6 if year_begendepi==2002
qui replace cpi=89.6 if year_begendepi==2003
qui replace cpi=91 if year_begendepi==2004
qui replace cpi=92.5 if year_begendepi==2005
qui replace cpi=93.9 if year_begendepi==2006
qui replace cpi=96.1 if year_begendepi==2007
qui replace cpi=98.6 if year_begendepi==2008
qui replace cpi=98.9 if year_begendepi==2009
qui gen def_daily_wage=daily_wage*100/cpi
*deflated daily wage floor
qui drop if def_daily_wage<=5

qui gen hs=1 if schooling==3 
qui replace hs=1 if schooling==4
qui replace hs=0 if schooling==1
qui replace hs=0 if schooling==2
qui replace hs=1 if schooling==6
qui replace hs=1 if schooling==5
drop if hs==.

*delete double entries before Aggregation
sort indivnr begepi daily_wage
gen index = 0
by indivnr: replace index=1 if begepi==begepi[_n-1] & endepi==endepi[_n-1] & counter_estab==counter_estab[_n-1]
replace index = index[_n+1]
drop if index==1
drop index
*
qui drop counter_ind
sort indivnr begepi
bysort indivnr: gen counter_ind=_n
*drop records if the combined duration of job spells within a year is below 90 calendar days
*gen days episode
qui gen days_epi=day(endepi)+30*(month(endepi)-1)-day(begepi)-30*(month(begepi)-1)+1 if daily_wage!=.
*earnings by years
qui gen earnings_epi=days_epi*daily_wage
*sum combined days duration of job spell
bysort indivnr age: egen days_year=sum(days_epi)
*days worked per year floor
qui drop if days_year<90
*
*
*One Observation per year // Agregation by Year keep oldest job
qui drop counter_ind
sort indivnr begepi
bysort indivnr: gen counter_ind=_n
bysort indivnr age: egen earnings_year=sum(earnings_epi)
sort indivnr age
bysort indivnr: gen corner_beg=0
bysort indivnr: gen corner_end=0
bysort indivnr: gen N=_N
bysort indivnr: replace corner_beg=1 if counter_ind==1 
bysort indivnr: replace corner_end=1 if counter_ind==N 
gen index_beg = 0
replace index_beg=1 if counter_ind==1 & month_begepi>1
gen pot_month_beg = 12-(month_begepi-1) if index_beg==1
gen index_end = 0
replace index_end=1 if counter_ind==N & month_endepi<12
gen pot_month_end = (month_endepi) if index_end==1
bysort indivnr year_begendepi: egen pot_month_bega=sum(pot_month_beg)
bysort indivnr year_begendepi: egen pot_month_enda=sum(pot_month_end)
bysort indivnr: drop if counter_ind > counter_ind[_n-1] & age==age[_n-1] & corner_beg==0
*kept the first spell in the year
qui drop if year_begendepi==.
qui drop counter_ind corner_beg corner_end pot_month_beg pot_month_end
sort indivnr begepi
bysort indivnr: gen counter_ind=_n
*adjustment of earnings for inflation
gen adj_earnings_year=earnings_year*100/cpi
*
sort indivnr age begepi
qui gen log_earnings=log(adj_earnings_year)
*
qui drop counter_ind
sort indivnr begepi
bysort indivnr: gen counter_ind=_n
*
egen indivnr2=group(indivnr)
qui drop indivnr
rename indivnr2 indivnr
*
*breaks elimination, keep longest consecutive spell 1
qui drop counter_ind
sort indivnr age
bysort indivnr: gen counter_ind=_n
bysort indivnr: gen corner=0
bysort indivnr: replace corner=1 if counter_ind==1 
bysort indivnr: replace corner=1 if counter_ind==_N
bysort indivnr: gen year_distance_one=0
bysort indivnr: replace year_distance_one=age-age[_n-1] if corner==0
bysort indivnr: replace year_distance_one=age-age[_n-1] if counter_ind==_N
bysort indivnr: gen ind_break=0
bysort indivnr: replace ind_break=1 if year_distance_one>=2 & year_distance_one!=.
bysort indivnr: gen sum_breaks=sum(ind_break)
*
bysort indivnr: egen tot_breaks1=total(ind_break)
*
egen indivnr2 = group(indivnr sum_breaks)
gen index =1
sort indivnr2 age
by indivnr2: egen index2 = sum(index) 
sort indivnr age
by indivnr: egen index3 = max(index2) 
drop if index3 != index2
drop index index2 index3 indivnr2
*drop repeated spells within individual
bys indivnr: gen count_max=_n
bys indivnr: gen max_stat=0 if count_max==1
bys indivnr: replace max_stat=1 if sum_breaks!=sum_breaks[_n-1] & count_max>1
bys indivnr: gen sum_max_stat=sum(max_stat)
qui drop if sum_max_stat!=0
qui drop count_max
qui drop sum_max_stat
qui drop max_stat corner year_distance_one
*drop if spell lasts less than 7 years
sort indivnr age
by indivnr: gen max_years_spell = _N
qui drop if max_years_spell <7
qui drop max_years_spell
* Cohorts Construction
gen coh = 0
replace coh=1 if year_birth>=1923 & year_birth<1930
*none
replace coh=2 if year_birth>=1930 & year_birth<1937
*55-54
replace coh=3 if year_birth>=1937 & year_birth<1944
*47-54
replace coh=4 if year_birth>=1944 & year_birth<1951
*40-47
replace coh=5 if year_birth>=1951 & year_birth<1958
*33-40
replace coh=6 if year_birth>=1958 & year_birth<1965
*26-33
replace coh=7 if year_birth>=1965 & year_birth<1973
*25-26
replace coh=8 if year_birth>=1973 & year_birth<1980
replace coh=9 if year_birth>=1980 & year_birth<1987
*
*drop of first & last entry to labor consecutive spell
qui drop counter_ind
sort indivnr year_begendepi begepi
bysort indivnr: gen counter_ind=_n
replace earnings_year= earnings_year*(12/pot_month_bega) if pot_month_bega!=0
*
qui drop counter_ind
sort indivnr age begepi
bysort indivnr: gen counter_ind=_n
replace earnings_year= earnings_year*(12/pot_month_enda) if pot_month_enda!=0
*
qui drop counter_ind
sort indivnr age begepi
bysort indivnr: gen counter_ind=_n
bysort indivnr: gen diff_log_earn=log_earnings-log_earnings[_n-1] if counter_ind!=1
bysort indivnr: egen T=count(diff_log_earn) if diff_log_earn!=.
bysort indivnr: gen T_diff=_n-1 if diff_log_earn!=.
*
egen indivnr2=group(indivnr)
drop indivnr
rename indivnr2 indivnr
*
rename year_begendepi year
sum indivnr
save "PATH\Cleaning_extrapolated.dta",replace

***Bootstrapping:

cls
set more off
use "PATH\Cleaning_extrapolated.dta",clear
cd "PATH"
order indivnr age year log_earnings diff_log_earn days_year counter_estab
keep indivnr age year log_earnings diff_log_earn hs schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland econ_act counter_estab days_year

sort indivnr year
*
g unemployment=1 if days_year!=. & days_year<300 & days_year[_n-1]!=. & days_year[_n-1]>300
bysort indivnr: g JJ_trans=1 if diff_log_earn!=. & diff_log_earn>0 & days_year>300 & days_year[_n-1]>300 & counter_estab[_n]!=counter_estab[_n-1] & counter_estab[_n]!=. & counter_estab[_n-1]!=.
*
bysort indivnr: g counter=_n
bysort indivnr: g diff_log_earn_1=log_earnings-log_earnings[_n-1] if counter>1
*Bootstrapping:
save temp.dta,replace
set seed 12345
*loc ru=runiform()
*gen ui = floor((251352-1+1)*`ru' + 1)
*keep if indivnr==ui
*drop ui
sort indivnr age
bsample, cluster(indivnr) idcluster(new_indivnr) 
rename indivnr old_indivnr
rename new_indivnr indivnr
sort indivnr age
order indivnr old_indivnr age
save temp_boots.dta,replace
*
*
forval j=25/55 {
qui reg diff_log_earn_1 i.hs i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act if age==`j'
predict diff_log_earn_resid_1_`j' if age==`j', residuals
}
g diff_log_earn_resid_1=.
forval j=25/55 {
replace diff_log_earn_resid_1=diff_log_earn_resid_1_`j' if age==`j'
}
*
drop diff_log_earn_resid_1_*
*
order indivnr age year log_earnings diff_log_earn days_year unemployment counter_estab diff*
*
g resid_1=diff_log_earn_resid_1
bysort indivnr: g resid_2=resid_1+diff_log_earn_resid_1[_n+1]
bysort indivnr: g resid_3=resid_2+diff_log_earn_resid_1[_n+2]
bysort indivnr: g resid_4=resid_3+diff_log_earn_resid_1[_n+3]
bysort indivnr: g resid_5=resid_4+diff_log_earn_resid_1[_n+4]
bysort indivnr: g resid_6=resid_5+diff_log_earn_resid_1[_n+5]
*
egen ave_unemp_resid_1=mean(resid_1) if unemployment==1
egen ave_unemp_resid_2=mean(resid_2) if unemployment==1
egen ave_unemp_resid_3=mean(resid_3) if unemployment==1
egen ave_unemp_resid_4=mean(resid_4) if unemployment==1
egen ave_unemp_resid_5=mean(resid_5) if unemployment==1
egen ave_unemp_resid_6=mean(resid_6) if unemployment==1
*
egen ave_JJ_trans_resid_1=mean(resid_1) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_2=mean(resid_2) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_3=mean(resid_3) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_4=mean(resid_4) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_5=mean(resid_5) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_6=mean(resid_6) if JJ_trans==1 & resid_1>0
*
egen max_ave_unemp_resid_1=max(ave_unemp_resid_1)
egen max_ave_unemp_resid_2=max(ave_unemp_resid_2)
egen max_ave_unemp_resid_3=max(ave_unemp_resid_3)
egen max_ave_unemp_resid_4=max(ave_unemp_resid_4)
egen max_ave_unemp_resid_5=max(ave_unemp_resid_5)
egen max_ave_unemp_resid_6=max(ave_unemp_resid_6)
*
egen max_ave_JJ_trans_resid_1=max(ave_JJ_trans_resid_1)
egen max_ave_JJ_trans_resid_2=max(ave_JJ_trans_resid_2)
egen max_ave_JJ_trans_resid_3=max(ave_JJ_trans_resid_3)
egen max_ave_JJ_trans_resid_4=max(ave_JJ_trans_resid_4)
egen max_ave_JJ_trans_resid_5=max(ave_JJ_trans_resid_5)
egen max_ave_JJ_trans_resid_6=max(ave_JJ_trans_resid_6)
*
g counter_tot=_n
keep if counter_tot==1

keep max_ave_*
save boot_leads.dta,replace

forval q=2/50 {
use temp.dta,clear
sort indivnr age
bsample, cluster(indivnr) idcluster(new_indivnr) 
rename indivnr old_indivnr
rename new_indivnr indivnr
sort indivnr age
order indivnr old_indivnr age
save temp_boots.dta,replace
*
*
forval j=25/55 {
qui reg diff_log_earn_1 i.hs i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act if age==`j'
predict diff_log_earn_resid_1_`j' if age==`j', residuals
}
g diff_log_earn_resid_1=.
forval j=25/55 {
replace diff_log_earn_resid_1=diff_log_earn_resid_1_`j' if age==`j'
}
*
drop diff_log_earn_resid_1_*
*
order indivnr age year log_earnings diff_log_earn days_year unemployment counter_estab diff*
*
g resid_1=diff_log_earn_resid_1
bysort indivnr: g resid_2=resid_1+diff_log_earn_resid_1[_n+1]
bysort indivnr: g resid_3=resid_2+diff_log_earn_resid_1[_n+2]
bysort indivnr: g resid_4=resid_3+diff_log_earn_resid_1[_n+3]
bysort indivnr: g resid_5=resid_4+diff_log_earn_resid_1[_n+4]
bysort indivnr: g resid_6=resid_5+diff_log_earn_resid_1[_n+5]
*
egen ave_unemp_resid_1=mean(resid_1) if unemployment==1
egen ave_unemp_resid_2=mean(resid_2) if unemployment==1
egen ave_unemp_resid_3=mean(resid_3) if unemployment==1
egen ave_unemp_resid_4=mean(resid_4) if unemployment==1
egen ave_unemp_resid_5=mean(resid_5) if unemployment==1
egen ave_unemp_resid_6=mean(resid_6) if unemployment==1
*
egen ave_JJ_trans_resid_1=mean(resid_1) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_2=mean(resid_2) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_3=mean(resid_3) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_4=mean(resid_4) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_5=mean(resid_5) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_6=mean(resid_6) if JJ_trans==1 & resid_1>0
*
egen max_ave_unemp_resid_1=max(ave_unemp_resid_1)
egen max_ave_unemp_resid_2=max(ave_unemp_resid_2)
egen max_ave_unemp_resid_3=max(ave_unemp_resid_3)
egen max_ave_unemp_resid_4=max(ave_unemp_resid_4)
egen max_ave_unemp_resid_5=max(ave_unemp_resid_5)
egen max_ave_unemp_resid_6=max(ave_unemp_resid_6)
*
egen max_ave_JJ_trans_resid_1=max(ave_JJ_trans_resid_1)
egen max_ave_JJ_trans_resid_2=max(ave_JJ_trans_resid_2)
egen max_ave_JJ_trans_resid_3=max(ave_JJ_trans_resid_3)
egen max_ave_JJ_trans_resid_4=max(ave_JJ_trans_resid_4)
egen max_ave_JJ_trans_resid_5=max(ave_JJ_trans_resid_5)
egen max_ave_JJ_trans_resid_6=max(ave_JJ_trans_resid_6)
*
g counter_tot=_n
keep if counter_tot==1

keep max_ave_*
save boot_leads_`q'.dta, replace
use boot_leads.dta,clear
append using boot_leads_`q'.dta
save boot_leads.dta,replace
}
*95% CI distribution:
egen p95_max_ave_unemp_resid_1=pctile(max_ave_unemp_resid_1), p(95)
egen p95_max_ave_unemp_resid_2=pctile(max_ave_unemp_resid_2), p(95)
egen p95_max_ave_unemp_resid_3=pctile(max_ave_unemp_resid_3), p(95)
egen p95_max_ave_unemp_resid_4=pctile(max_ave_unemp_resid_4), p(95)
egen p95_max_ave_unemp_resid_5=pctile(max_ave_unemp_resid_5), p(95)
egen p95_max_ave_unemp_resid_6=pctile(max_ave_unemp_resid_6), p(95)
*
egen p5_max_ave_unemp_resid_1=pctile(max_ave_unemp_resid_1), p(5)
egen p5_max_ave_unemp_resid_2=pctile(max_ave_unemp_resid_2), p(5)
egen p5_max_ave_unemp_resid_3=pctile(max_ave_unemp_resid_3), p(5)
egen p5_max_ave_unemp_resid_4=pctile(max_ave_unemp_resid_4), p(5)
egen p5_max_ave_unemp_resid_5=pctile(max_ave_unemp_resid_5), p(5)
egen p5_max_ave_unemp_resid_6=pctile(max_ave_unemp_resid_6), p(5)
*
egen p95_max_ave_JJ_trans_resid_1=pctile(max_ave_JJ_trans_resid_1), p(95)
egen p95_max_ave_JJ_trans_resid_2=pctile(max_ave_JJ_trans_resid_2), p(95)
egen p95_max_ave_JJ_trans_resid_3=pctile(max_ave_JJ_trans_resid_3), p(95)
egen p95_max_ave_JJ_trans_resid_4=pctile(max_ave_JJ_trans_resid_4), p(95)
egen p95_max_ave_JJ_trans_resid_5=pctile(max_ave_JJ_trans_resid_5), p(95)
egen p95_max_ave_JJ_trans_resid_6=pctile(max_ave_JJ_trans_resid_6), p(95)
*
egen p5_max_ave_JJ_trans_resid_1=pctile(max_ave_JJ_trans_resid_1), p(5)
egen p5_max_ave_JJ_trans_resid_2=pctile(max_ave_JJ_trans_resid_2), p(5)
egen p5_max_ave_JJ_trans_resid_3=pctile(max_ave_JJ_trans_resid_3), p(5)
egen p5_max_ave_JJ_trans_resid_4=pctile(max_ave_JJ_trans_resid_4), p(5)
egen p5_max_ave_JJ_trans_resid_5=pctile(max_ave_JJ_trans_resid_5), p(5)
egen p5_max_ave_JJ_trans_resid_6=pctile(max_ave_JJ_trans_resid_6), p(5)
*

g counter_tot=_n
keep if counter_tot==1

keep p* counter_tot

reshape long p95_max_ave_JJ_trans_resid_ p95_max_ave_unemp_resid_ p5_max_ave_JJ_trans_resid_ p5_max_ave_unemp_resid_, i(counter_tot) j(lead)
drop counter_tot

*
expand 2 if lead==1
sort lead
bysort lead: g counter=_n
replace lead=0 if counter==1 & lead==1
drop counter
*
replace p95_max_ave_unemp_resid_=0 if lead==0
replace p95_max_ave_JJ_trans_resid_=0 if lead==0
replace p5_max_ave_unemp_resid_=0 if lead==0
replace p5_max_ave_JJ_trans_resid_=0 if lead==0
*
replace lead=lead-1
drop if lead==-1
save boot_unemp_JJ_leads.dta,replace

use boot_unemp_JJ_leads.dta,clear
*
label variable lead "Lead"
label variable p95_max_ave_unemp_resid_ "Residual Log Earnings"
label variable p95_max_ave_JJ_trans_resid_ "Residual Log Earnings"
label variable p5_max_ave_unemp_resid_ "Residual Log Earnings"
label variable p5_max_ave_JJ_trans_resid_ "Residual Log Earnings"
*
twoway (line p95_max_ave_unemp_resid_ lead, lcolor(black) lpattern(dash)) (line p5_max_ave_unemp_resid_ lead, lcolor(black) lpattern(dash)), title({bf:Unemployment}) graphregion(color(white)) xlabel(#8,) yline(0, lcolor(black) lpattern(dash)) ylabel(#8,format(%03.1f)) xtitle({bf:Lead}, size(large) height(10)) ytitle({bf:Residual Log Earnings}, size(large) height(10)) legend(off)
graph export overshooting_unemployment.png, replace
twoway (line p95_max_ave_JJ_trans_resid_ lead, lcolor(black) lpattern(dash)) (line p5_max_ave_JJ_trans_resid_ lead, lcolor(black) lpattern(dash)), title({bf:Job To Job}) graphregion(color(white)) xlabel(#8,) yline(0, lcolor(black) lpattern(dash)) ylabel(#8,format(%03.2f)) xtitle({bf:Lead}, size(large) height(10)) ytitle({bf:Residual Log Earnings}, size(large) height(10)) legend(off)
graph export overshooting_jobtojob_pos.png, replace


***Overshooting for Unemployment and JJ Transitions: JJ Transitions only when the initial shock is positive.
cls
set more off
use "PATH\Cleaning_extrapolated.dta",clear
cd "PATH"
order indivnr age year log_earnings diff_log_earn days_year counter_estab
keep indivnr age year log_earnings diff_log_earn hs schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland econ_act counter_estab days_year

sort indivnr year
*
g unemployment=1 if days_year!=. & days_year<300 & days_year[_n-1]!=. & days_year[_n-1]>300
bysort indivnr: g JJ_trans=1 if diff_log_earn!=. & diff_log_earn>0 & days_year>300 & days_year[_n-1]>300 & counter_estab[_n]!=counter_estab[_n-1] & counter_estab[_n]!=. & counter_estab[_n-1]!=.
bysort indivnr: g remain=1 if days_year>300 & days_year[_n-1]>300 & counter_estab[_n]==counter_estab[_n-1] & counter_estab[_n]!=. & counter_estab[_n-1]!=.

*
bysort indivnr: g counter=_n
bysort indivnr: g diff_log_earn_1=log_earnings-log_earnings[_n-1] if counter>1

*
forval j=25/55 {
qui reg diff_log_earn_1 i.hs i.year schleswig_holstein lower_saxony north_rhine_westphalia hesse rhineland_palatinate badden_wurttemberg bavaria saarland i.econ_act if age==`j'
predict diff_log_earn_resid_1_`j' if age==`j', residuals
}
g diff_log_earn_resid_1=.
forval j=25/55 {
replace diff_log_earn_resid_1=diff_log_earn_resid_1_`j' if age==`j'
}
*
drop diff_log_earn_resid_1_*
*
order indivnr age year log_earnings diff_log_earn days_year  unemployment counter_estab diff*
*
g resid_1=diff_log_earn_resid_1
bysort indivnr: g resid_2=resid_1+diff_log_earn_resid_1[_n+1]
bysort indivnr: g resid_3=resid_2+diff_log_earn_resid_1[_n+2]
bysort indivnr: g resid_4=resid_3+diff_log_earn_resid_1[_n+3]
bysort indivnr: g resid_5=resid_4+diff_log_earn_resid_1[_n+4]
bysort indivnr: g resid_6=resid_5+diff_log_earn_resid_1[_n+5]

*
egen ave_unemp_resid_1=mean(resid_1) if unemployment==1
egen ave_unemp_resid_2=mean(resid_2) if unemployment==1
egen ave_unemp_resid_3=mean(resid_3) if unemployment==1
egen ave_unemp_resid_4=mean(resid_4) if unemployment==1
egen ave_unemp_resid_5=mean(resid_5) if unemployment==1
egen ave_unemp_resid_6=mean(resid_6) if unemployment==1

egen ave_JJ_trans_resid_1=mean(resid_1) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_2=mean(resid_2) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_3=mean(resid_3) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_4=mean(resid_4) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_5=mean(resid_5) if JJ_trans==1 & resid_1>0
egen ave_JJ_trans_resid_6=mean(resid_6) if JJ_trans==1 & resid_1>0

egen ave_remain_resid_1=mean(resid_1) if remain==1
egen ave_remain_resid_2=mean(resid_2) if remain==1
egen ave_remain_resid_3=mean(resid_3) if remain==1
egen ave_remain_resid_4=mean(resid_4) if remain==1
egen ave_remain_resid_5=mean(resid_5) if remain==1
egen ave_remain_resid_6=mean(resid_6) if remain==1

egen max_ave_unemp_resid_1=max(ave_unemp_resid_1)
egen max_ave_unemp_resid_2=max(ave_unemp_resid_2)
egen max_ave_unemp_resid_3=max(ave_unemp_resid_3)
egen max_ave_unemp_resid_4=max(ave_unemp_resid_4)
egen max_ave_unemp_resid_5=max(ave_unemp_resid_5)
egen max_ave_unemp_resid_6=max(ave_unemp_resid_6)

egen max_ave_JJ_trans_resid_1=max(ave_JJ_trans_resid_1)
egen max_ave_JJ_trans_resid_2=max(ave_JJ_trans_resid_2)
egen max_ave_JJ_trans_resid_3=max(ave_JJ_trans_resid_3)
egen max_ave_JJ_trans_resid_4=max(ave_JJ_trans_resid_4)
egen max_ave_JJ_trans_resid_5=max(ave_JJ_trans_resid_5)
egen max_ave_JJ_trans_resid_6=max(ave_JJ_trans_resid_6)

egen max_ave_remain_resid_1=max(ave_remain_resid_1)
egen max_ave_remain_resid_2=max(ave_remain_resid_2)
egen max_ave_remain_resid_3=max(ave_remain_resid_3)
egen max_ave_remain_resid_4=max(ave_remain_resid_4)
egen max_ave_remain_resid_5=max(ave_remain_resid_5)
egen max_ave_remain_resid_6=max(ave_remain_resid_6)

g counter_tot=_n
keep if counter_tot==1

keep max_ave_* counter_tot

reshape long max_ave_JJ_trans_resid_ max_ave_unemp_resid_ max_ave_remain_resid_, i(counter_tot) j(lead)
drop counter_tot

*
expand 2 if lead==1
sort lead
bysort lead: g counter=_n
replace lead=0 if counter==1 & lead==1
drop counter
replace max_ave_unemp_resid_=0 if lead==0
replace max_ave_JJ_trans_resid_=0 if lead==0
replace max_ave_remain_resid_=0 if lead==0
*
replace lead=lead-1
*
label variable lead "Lead"
label variable max_ave_unemp_resid_ "Residual Log Earnings"
label variable max_ave_JJ_trans_resid_ "Residual Log Earnings"
label variable max_ave_remain_resid_ "Residual Log Earnings"
line max_ave_unemp_resid_ lead, title({bf:Unemployment}) graphregion(color(white)) xlabel(#8,) yline(0, lcolor(black) lpattern(dash)) ylabel(#8,format(%03.1f)) xtitle({bf:Lead}, size(large) height(10)) ytitle({bf:Residual Log Earnings}, size(large) height(10))
graph export overshooting_unemployment.png, replace
line max_ave_JJ_trans_resid_ lead, title({bf:Job To Job}) graphregion(color(white)) xlabel(#8,) yline(0, lcolor(black) lpattern(dash)) ylabel(#8,format(%03.2f)) xtitle({bf:Lead}, size(large) height(10)) ytitle({bf:Residual Log Earnings}, size(large) height(10))
graph export overshooting_jobtojob_pos.png, replace
line max_ave_remain_resid_ lead, title("Remain")
graph export overshooting_remain.png, replace
*graph bootstrap

append using boot_unemp_JJ_leads.dta
/*
label variable lead "Lead"
label variable p95_max_ave_unemp_resid_ "Residual Log Earnings"
label variable p95_max_ave_JJ_trans_resid_ "Residual Log Earnings"
label variable p5_max_ave_unemp_resid_ "Residual Log Earnings"
label variable p5_max_ave_JJ_trans_resid_ "Residual Log Earnings"
*/
twoway (line max_ave_unemp_resid_ lead, lcolor(blue)) (line p95_max_ave_unemp_resid_ lead, lcolor(blue) lpattern(dash)) (line p5_max_ave_unemp_resid_ lead, lcolor(blue) lpattern(dash)), graphregion(color(white)) xlabel(#8,) yline(0, lcolor(black) lpattern(dash)) ylabel(#8,format(%03.1f) angle(0)) xtitle({bf:Lead}, size(large) height(10)) ytitle({bf: E [ y{sub:i,h}]}, size(large) height(10)) legend(off)
graph export overshooting_unemp.png, replace
twoway (line max_ave_JJ_trans_resid_ lead, lcolor(blue)) (line p95_max_ave_JJ_trans_resid_ lead, lcolor(blue) lpattern(dash)) (line p5_max_ave_JJ_trans_resid_ lead, lcolor(blue) lpattern(dash)), graphregion(color(white)) xlabel(#8,) yline(0, lcolor(black) lpattern(dash)) ylabel(#8,format(%03.2f) angle(0)) xtitle({bf:Lead}, size(large) height(10)) ytitle({bf: E [ y{sub:i,h}]}, size(large) height(10)) legend(off)
graph export overshooting_JTJ.png, replace

*This with the bootstrap from before.
drop max_ave_remain_resid_
export delimited using "PATH\overshooting.csv", replace
*
***

