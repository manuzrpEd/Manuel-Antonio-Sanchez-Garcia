clear
set more off
*set memory 16g

*cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*do pgen_Preliminars.do

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\apequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1984
*
drop hhnrakt hhnr ahhnr x11101ll d1110784 e1110684 e1110784 h1110* i112* renty84 opery84 fopery84 divdy84 fdivdy84 adchb84 fadchb84
drop lossr84 lossc84 flossr84 flossc84 chspt84 fchspt84 chsub84 fchsub84 ichsu84 fchsu84 nursh84 fnursh84 hsup84 fhsup84
drop f* m* w* e1120184
*rename variables
rename *84 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_84.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\bpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1985
*
drop hhnrakt hhnr x11101ll d1110785 e1110685 e1110785 e1120185 renty85 opery85 divdy85 adchb85 lossr85 lossc85 chspt85 chsub85 ichsu85 nursh85 hsup85
drop f* m* w* h1110* i112* bhhnr
*rename variables
rename *85 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_85.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\cpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1986
*
drop hhnrakt hhnr x11101ll d1110786 e1110686 e1110786 e1120186 renty86 opery86 divdy86 adchb86 lossr86 lossc86 chspt86 chsub86 ichsu86 nursh86 hsup86
drop f* m* w* h1110* i112* chhnr
*
*rename variables
rename *86 *
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_86.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\dpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1987
*
drop hhnrakt hhnr x11101ll d1110787 e1110687 e1110787 e1120187 renty87 opery87 divdy87 adchb87 lossr87 lossc87 chspt87 chsub87 ichsu87 nursh87 hsup87
drop f* m* w* h1110* i112* dhhnr
*rename variables
rename *87 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_87.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\epequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1988
*
drop hhnrakt hhnr x11101ll d1110788 e1110688 e1110788 e1120188 renty88 opery88 divdy88 adchb88 lossr88 lossc88 chspt88 chsub88 ichsu88 nursh88 hsup88
drop f* m* w* h1110* i112* ehhnr
*rename variables
rename *88 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_88.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\fpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1989
*
drop hhnrakt hhnr x11101ll d1110789 e1110689 e1110789 e1120189 renty89 opery89 divdy89 adchb89 lossr89 lossc89 chspt89 chsub89 ichsu89 nursh89 hsup89
drop f* m* w* h1110* i112* fhhnr
*rename variables
rename *89 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_89.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\gpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1990
*
drop hhnrakt hhnr x11101ll d1110790 e1110690 e1110790 e1120190 renty90 opery90 divdy90 adchb90 lossr90 lossc90 chspt90 chsub90 ichsu90 nursh90 hsup90
drop f* m* w* h1110* i112* ghhnr
*rename variables
rename *90 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_90.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\hpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1991
*
drop hhnrakt hhnr x11101ll d1110791 e1110691 e1110791 e1120191 renty91 opery91 divdy91 adchb91 lossr91 lossc91 chspt91 chsub91 ichsu91 nursh91 hsup91
drop f* m* w* h1110* i112* hhhnr
*rename variables
rename *91 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_91.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\ipequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1992
*
drop hhnrakt hhnr x11101ll d1110792 e1110692 e1110792 e1120192 renty92 opery92 divdy92 adchb92 lossr92 lossc92 chspt92 chsub92 ichsu92 nursh92 hsup92
drop f* m* w* h1110* i112* ihhnr
*rename variables
rename *92 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_92.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\jpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1993
*
drop hhnrakt hhnr x11101ll d1110793 e1110693 e1110793 e1120193 renty93 opery93 divdy93 adchb93 lossr93 lossc93 chspt93 chsub93 ichsu93 nursh93 hsup93
drop f* m* w* h1110* i112* jhhnr
*rename variables
rename *93 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_93.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\kpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1994
*
drop hhnrakt hhnr x11101ll d1110794 e1110694 e1110794 e1120194 renty94 opery94 divdy94 adchb94 lossr94 lossc94 chspt94 chsub94 ichsu94 nursh94 hsup94
drop f* m* w* h1110* i112* khhnr
*rename variables
rename *94 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_94.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\lpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1995
*
drop hhnrakt hhnr x11101ll d1110795 e1110695 e1110795 e1120195 renty95 opery95 divdy95 adchb95 lossr95 lossc95 chspt95 chsub95 ichsu95 nursh95 hsup95
drop f* m* w* h1110* i112* lhhnr
*rename variables
rename *95 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_95.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\mpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1996
*
drop hhnrakt hhnr x11101ll d1110796 e1110696 e1110796 e1120196 renty96 opery96 divdy96 adchb96 lossr96 lossc96 chspt96 chsub96 ichsu96 nursh96 hsup96
drop f* m* w* h1110* i112* mhhnr
*rename variables
rename *96 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_96.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\npequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1997
*
drop hhnrakt hhnr x11101ll d1110797 e1110697 e1110797 e1120197 renty97 opery97 divdy97 adchb97 lossr97 lossc97 chspt97 chsub97 ichsu97 nursh97 hsup97
drop f* m* w* h1110* i112* nhhnr
*rename variables
rename *97 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_97.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\opequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1998
*
drop hhnrakt hhnr x11101ll d1110798 e1110698 e1110798 e1120198 renty98 opery98 divdy98 adchb98 lossr98 lossc98 chspt98 chsub98 ichsu98 nursh98 hsup98
drop f* m* w* h1110* i112* ohhnr
*rename variables
rename *98 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_98.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\ppequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1999
*
drop hhnrakt hhnr x11101ll d1110799 e1110699 e1110799 e1120199 renty99 opery99 divdy99 adchb99 lossr99 lossc99 chspt99 chsub99 ichsu99 nursh99 hsup99
drop f* m* w* h1110* i112* phhnr
*rename variables
rename *99 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_99.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\qpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2000
*
drop hhnrakt hhnr x11101ll d1110700 e1110600 e1110700 e1120100 renty00 opery00 divdy00 adchb00 lossr00 lossc00 chspt00 chsub00 ichsu00 nursh00 hsup00
drop f* m* w* h1110* i112* qhhnr
*rename variables
rename *00 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_00.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\rpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2001
*
drop hhnrakt hhnr x11101ll d1110701 e1110601 e1110701 e1120101 renty01 opery01 divdy01 adchb01 lossr01 lossc01 chspt01 chsub01 ichsu01 nursh01 hsup01
drop f* m* w* h1110* i112* rhhnr
*rename variables
rename *01 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_01.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\spequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2002
*
drop hhnrakt hhnr x11101ll d1110702 e1110602 e1110702 e1120102 renty02 opery02 divdy02 adchb02 lossr02 lossc02 chspt02 chsub02 ichsu02 nursh02 hsup02
drop f* m* w* h1110* i112* shhnr
*rename variables
rename *02 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_02.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\tpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2003
*
drop hhnrakt hhnr x11101ll d1110703 e1110603 e1110703 e1120103 renty03 opery03 divdy03 adchb03 lossr03 lossc03 chspt03 chsub03 ichsu03 nursh03 hsup03
drop f* m* w* h1110* i112* thhnr
*rename variables
rename *03 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_03.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\upequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2004
*
drop hhnrakt hhnr x11101ll d1110704 e1110604 e1110704 e1120104 renty04 opery04 divdy04 adchb04 lossr04 lossc04 chspt04 chsub04 ichsu04 nursh04 hsup04
drop f* m* w* h1110* i112* uhhnr
*rename variables
rename *04 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_04.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\vpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2005
*
drop hhnrakt hhnr x11101ll d1110705 e1110605 e1110705 e1120105 renty05 opery05 divdy05 adchb05 lossr05 lossc05 chspt05 chsub05 ichsu05 nursh05 hsup05
drop f* m* w* h1110* i112* vhhnr
*rename variables
rename *05 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_05.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\wpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2006
*
drop hhnrakt hhnr x11101ll d1110706 e1110606 e1110706 e1120106 renty06 opery06 divdy06 adchb06 lossr06 lossc06 chspt06 chsub06 ichsu06 nursh06 hsup06
drop f* m* w* h1110* i112* whhnr
*rename variables
rename *06 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_06.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\xpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2007
*
drop hhnrakt hhnr x11101ll d1110707 e1110607 e1110707 e1120107 renty07 opery07 divdy07 adchb07 lossr07 lossc07 chspt07 chsub07 ichsu07 nursh07 hsup07
drop f* m* w* h1110* i112* xhhnr
*rename variables
rename *07 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_07.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\ypequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2008
*
drop hhnrakt hhnr x11101ll d1110708 e1110608 e1110708 e1120108 renty08 opery08 divdy08 adchb08 lossr08 lossc08 chspt08 chsub08 ichsu08 nursh08 hsup08
drop f* m* w* h1110* i112* yhhnr
*rename variables
rename *08 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_08.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\zpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2009
*
drop hhnrakt hhnr x11101ll d1110709 e1110609 e1110709 e1120109 renty09 opery09 divdy09 adchb09 lossr09 lossc09 chspt09 chsub09 ichsu09 nursh09 hsup09
drop f* m* w* h1110* i112* zhhnr
*rename variables
rename *09 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_09.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\bapequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2010
*
drop hhnrakt hhnr x11101ll d1110710 e1110610 e1110710 e1120110 renty10 opery10 divdy10 adchb10 lossr10 lossc10 chspt10 chsub10 ichsu10 nursh10 hsup10
drop f* m* w* h1110* i112* bahhnr
*rename variables
rename *10 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_10.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\bbpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2011
*
drop hhnrakt hhnr x11101ll d1110711 e1110611 e1110711 e1120111 renty11 opery11 divdy11 adchb11 lossr11 lossc11 chspt11 chsub11 ichsu11 nursh11 hsup11
drop f* m* w* h1110* i112* bbhhnr
*rename variables
rename *11 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_11.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\bcpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2012
*
drop hhnrakt hhnr x11101ll d1110712 e1110612 e1110712 e1120112 renty12 opery12 divdy12 adchb12 lossr12 lossc12 chspt12 chsub12 ichsu12 nursh12 hsup12
drop f* m* w* h1110* i112* bchhnr
*rename variables
rename *12 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_12.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\bdpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2013
*
drop hhnrakt hhnr x11101ll d1110713 e1110613 e1110713 e1120113 renty13 opery13 divdy13 adchb13 lossr13 lossc13 chspt13 chsub13 ichsu13 nursh13 hsup13
drop f* m* w* h1110* i112* bdhhnr
*rename variables
rename *13 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_13.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\bepequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2014
*
drop hhnrakt hhnr x11101ll d1110714 e1110614 e1110714 e1120114 renty14 opery14 divdy14 adchb14 lossr14 lossc14 chspt14 chsub14 ichsu14 nursh14 hsup14
drop f* m* w* h1110* i112* behhnr
*rename variables
rename *14 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_14.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pequiv\bfpequiv.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2015
*
drop hhnrakt hhnr x11101ll d1110715 e1110615 e1110715 e1120115 renty15 opery15 divdy15 adchb15 lossr15 lossc15 chspt15 chsub15 ichsu15 nursh15 hsup15
drop f* m* w* h1110* i112* bfhhnr
*rename variables
rename *15 *
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_15.dta", replace

***append
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_84.dta", clear
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_85.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_86.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_87.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_88.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_89.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_90.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_91.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_92.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_93.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_94.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_95.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_96.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_97.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_98.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_99.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_00.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_01.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_02.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_03.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_04.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_05.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_06.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_07.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_08.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_09.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_10.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_11.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_12.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_13.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_14.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_15.dta", nolabel

sort persnr year

label language EN

rename iself inc_self

rename d11109 educ_years

rename d11102ll female
*1 male 2 female -1 not available
replace female=0 if female==1
replace female=1 if female==2
*dont get confused, it works well.

rename d11101 age

rename l11101 region

rename i11110 labor_earnings

rename e11102 employment_status
tab employment_status

rename e11104 primary_activity

rename e11103 form
*3 is not working
replace form=0 if form==3
*replace form=3 if emplst==4
tab form

rename ijob2 second_earnings

gen ind_second_earnings=1 if second_earnings>0 
replace ind_second_earnings=0 if second_earnings==0 

rename y11101 cpi

rename e11101 work_hours

rename x11104ll sample

rename d11108 educ

rename imilt inc_military

rename igray inc_profit

rename x11105 ind_respondant

rename e11105 occupation

rename l11102 region_west_east

save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_0.dta", replace

***Cleaning to work at annual level

*equiv is a survey on last year
*gen is a survey on current month
*i now correct for that
gen year_new=year-1 if year>0 & year!=.

merge 1:1 persnr year using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen.dta", keepusing(civil_servant nation lfs) nogen

replace civil_servant=-2 if civil_servant==.
bysort persnr: egen max_civil_servant=max(civil_servant)
tab civil_servant
tab max_civil_servant
drop if max_civil_servant>0 & max_civil_servant!=.

replace nation=-2 if nation==.
gen foreigner=1 if nation>1
replace foreigner=0 if nation<=1
bysort persnr: egen max_foreigner=max(foreigner)
tab nation
tab max_foreigner
drop if max_foreigner>0 & max_foreigner!=.

replace lfs=-2 if lfs==.
gen lfs_exclude=1 if lfs==4 | lfs==5
replace lfs_exclude=0 if lfs!=4 & lfs!=5
bysort persnr: egen max_lfs_exclude=max(lfs_exclude)
tab lfs_exclude
tab max_lfs_exclude
drop if max_lfs_exclude>0 & max_lfs_exclude!=.

drop year
rename year_new year

***


*tab civil_servant



*drop if civil_servant==1
*drop if nation!=1
*drop if inrange(lfs,4,5)



*drop if civil_servant==1

replace labor_earnings=labor_earnings-inc_self if inc_self>0
replace labor_earnings=labor_earnings-inc_military if inc_military>0
replace labor_earnings=labor_earnings-inc_profit if inc_profit>0

drop if labor_earnings<=0
*drop if employment_status<=0
*drop if form<=0

*drop if occupation==100
*drop if occupation==5162
*drop if occupation==5163

*drop if region_west_east==2

*+second_earnings+ixmas+iothy+iholy
gen earnings_work=labor_earnings 
*if inrange(form,1,2)
gen def_earnings_work=earnings_work*100/cpi

*+second_earnings+ixmas+iothy+iholy
gen earnings_full=labor_earnings if form==1
gen def_earnings_full=earnings_full*100/cpi

*+second_earnings+ixmas+iothy+iholy
gen earnings_part=labor_earnings if form==2
gen def_earnings_part=earnings_part*100/cpi

*gen earnings_mini=labor_earnings+second_earnings+ixmas+iothy+iholy if form==3
*gen def_earnings_mini=earnings_mini*100/cpi
*2010 euros

gen def_second_earnings= second_earnings*100/cpi 
*if inrange(form,1,2)

gen log_earnings_work=log(def_earnings_work)
gen log_earnings_full=log(def_earnings_full)
gen log_earnings_part=log(def_earnings_part)

sort persnr year

order persnr year def_earnings_work

save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_2.dta", replace

***

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_2.dta", clear

tabstat persnr if sample==21, statistics(n) by(year)
tabstat persnr if sample==23, statistics(n) by(year)

keep if female==0
*keep if sample==21 | sample==23 | sample==23

qui drop if age<24
qui drop if age>55

tabstat def_earnings_work, statistics(mean n max min) by(year)




***

ssc install fastgini
***cleaning - generate variables/statistics to compare to RSIAB7514

***males


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_2.dta", clear


keep if female==0
keep if sample==21 | sample==23
*drop if sample==23 & year==1990
*drop if sample==23 & year==1991

qui drop if age<24
qui drop if age>55

***

levels year, local(reg)
qui ge gini_cs_work = .
qui ge gini_cs_full = .
qui ge gini_cs_part = .
qui ge var_cs_full = .
qui ge var_cs_part = .
qui ge var_cs_work = .
qui ge kurt_cs_work = .
qui ge p85_cs_work = .
qui ge p15_cs_work = .
qui ge p85_cs_full = .
qui ge p15_cs_full = .
qui ge p85_cs_part = .
qui ge p15_cs_part = .
qui gen p85_p15_cs_full = .
qui gen p85_p15_cs_part = .
qui ge p50_cs_work = .
qui gen p85_p15_cs_work = .
qui gen p85_p50_cs_work = .
qui gen p50_p15_cs_work = .
foreach r of local reg {
qui fastgini def_earnings_work if year == `r' 
replace gini_cs_work = r(gini) if year == `r'   
qui fastgini def_earnings_full if year == `r' & form==1  
replace gini_cs_full = r(gini) if year == `r' & form==1  
qui fastgini def_earnings_part if year == `r' & form==2  
replace gini_cs_part = r(gini) if year == `r' & form==2  
egen sd=sd(log_earnings_work) if year == `r' 
egen sd_full=sd(log_earnings_full) if year == `r' & form==1
egen sd_part=sd(log_earnings_part) if year == `r' & form==2
egen kurt=kurt(log_earnings_work) if year == `r'  
replace var_cs_full=sd_full if year == `r' & form==1 
replace var_cs_part=sd_part if year == `r' & form==2 
replace var_cs_work=sd if year == `r' 
replace kurt_cs_work=kurt if year == `r' 
egen p85 = pctile(def_earnings_work) if year == `r'   , p(85)
egen p50 = pctile(def_earnings_work) if year == `r'  , p(50)
egen p15 = pctile(def_earnings_work) if year == `r'  , p(15)
egen p85_full = pctile(def_earnings_full) if year == `r' & form==1  , p(85)
egen p15_full = pctile(def_earnings_full) if year == `r' & form==1  , p(15)
egen p85_part = pctile(def_earnings_part) if year == `r' & form==2  , p(85)
egen p15_part = pctile(def_earnings_part) if year == `r' & form==2  , p(15)
replace p85_cs_full=p85_full if year == `r' & form==1  
replace p15_cs_full=p15_full if year == `r' & form==1 
replace p85_cs_part=p85_part if year == `r' & form==2  
replace p15_cs_part=p15_part if year == `r' & form==2 
replace p85_cs_work=p85 if year == `r' 
replace p50_cs_work=p50 if year == `r'  
replace p15_cs_work=p15 if year == `r'
replace p85_p15_cs_full=p85_full/p15_full if year == `r' & form==1  
replace p85_p15_cs_part=p85_part/p15_part if year == `r' & form==2  
replace p85_p15_cs_work=p85/p15 if year == `r'  
replace p50_p15_cs_work=p50/p15 if year == `r' 
replace p85_p50_cs_work=p85/p50 if year == `r'   
drop sd kurt p85 p50 p15 p85_full p85_part p15_full p15_part sd_full sd_part
}
*
replace var_cs_work=var_cs_work^2
replace var_cs_part=var_cs_part^2
replace var_cs_full=var_cs_full^2

***fraction of full/part time by year
gen work=1 
gen full=1 if form==1
replace full=0 if form==2
gen part=1 if form==2
replace part=0 if form==1
bysort year: egen mean_full=mean(full)
bysort year: egen mean_part=mean(part)

bysort year: egen mean_work_hours=mean(work_hours)
bysort year: egen mean_work_hours_full=mean(work_hours) if form==1
bysort year: egen mean_work_hours_part=mean(work_hours) if form==2

bysort year: egen mean_second=mean(def_second_earnings) if  ind_second_earnings==1
bysort year: egen mean_ind_second=mean(ind_second_earnings)

***

sort year

***Gini Coefficients:

label variable gini_cs_work "Cross Sectional Gini"
label variable gini_cs_full "Full Time"
label variable gini_cs_part "Part Time"
label variable var_cs_work "Cross Sectional Var."
label variable var_cs_full "Full Time"
label variable var_cs_part "Part Time"
label variable p85_p15_cs_full "Part Time"
label variable p85_p15_cs_part "Part Time"
label variable p85_p15_cs_work "Cross Sectional P85/P15"
label variable mean_work_hours "Aggregate"
label variable mean_work_hours_full "Full Time"
label variable mean_work_hours_part "Part Time"

rename mean_full Full_Time
rename mean_part Part_Time
label variable Full_Time "Full Time"
label variable Part_Time "Part Time"
twoway line Full_Time Part_Time year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.2) 1, angle(horizontal))
graph export fract_emp_soep.png, replace

twoway line mean_second year, ytitle({bf:Euros}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lcolor(blue) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (200) 800, angle(horizontal))
graph export mean_second_soep.png, replace

twoway line mean_ind_second year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lcolor(black) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.05) 0.2, angle(horizontal))
graph export mean_ind_second_soep.png, replace

twoway line mean_work_hours mean_work_hours_full mean_work_hours_part year, ytitle({bf:Hours}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid solid dash dash_dot) lwidth(medthick medthick thick) lcolor(black blue red)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal))
graph export mean_hours_soep.png, replace

label variable gini_cs_work "G-SOEP8415"
quietly twoway line gini_cs_work year, ytitle({bf:G[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lcolor(blue red) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.1) 0.6, angle(horizontal))
graph export gini_work_soep.png, replace

quietly twoway line gini_cs_full gini_cs_part year, ytitle({bf:G[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red) lpattern(solid dash short_dash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.1) 0.6, angle(horizontal))
graph export gini_form_soep.png, replace

label variable var_cs_work "G-SOEP8415"
quietly twoway line var_cs_work year, ytitle({bf:Var[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.2) 1, angle(horizontal))
graph export var_work_soep.png, replace

quietly twoway line var_cs_full var_cs_part year, ytitle({bf:Var[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue) lcolor(blue red) lpattern(solid dash short_dash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.3) 1.2, angle(horizontal))
graph export var_form_soep.png, replace

label variable p85_p15_cs_work "G-SOEP8415"
quietly twoway line p85_p15_cs_work year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(2 (2) 10, angle(horizontal))
graph export perc8515_work_soep.png, replace

quietly twoway line p85_p15_cs_full p85_p15_cs_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(5)) lcolor(blue red) legend(position(6) rows(1)) lpattern(solid dash short_dash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(2 (2) 10, angle(horizontal))
graph export perc8515_form_soep.png, replace

label variable p85_p50_cs_work "G-SOEP8415"
quietly twoway line p85_p50_cs_work year, ytitle({bf:P{sub:85}/P{sub:50}[Earnings]}, size(large) height(5)) lcolor(blue) legend(position(6) rows(1) on) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(1 (1) 4, angle(horizontal)) ylabel(, angle(horizontal))
graph export perc8550_work_soep.png, replace

label variable p50_p15_cs_work "G-SOEP8415"
quietly twoway line p50_p15_cs_work year, ytitle({bf:P{sub:50}/P{sub:15}[Earnings]}, size(large) height(5)) lcolor(blue) legend(position(6) rows(1) on) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(1 (1) 4, angle(horizontal)) ylabel(, angle(horizontal))
graph export perc5015_work_soep.png, replace

*** p85, p50, p15 CS evolution

replace p85_cs_work=log(p85_cs_work)
replace p50_cs_work=log(p50_cs_work)
replace p15_cs_work=log(p15_cs_work)

label variable p85_cs_work "P_85"
label variable p50_cs_work "P_50"
label variable p15_cs_work "P_15"

quietly twoway line p85_cs_work p50_cs_work p15_cs_work year, ytitle({bf:P[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black black black) lpattern(solid dash shortdash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(8 (1) 11, angle(horizontal))
graph export perc_work_soep.png, replace

bysort year: egen median=median(log_earnings_work)
bysort year: egen p85 = pctile(log_earnings_work), p(85)
bysort year: egen p15 = pctile(log_earnings_work), p(15)

qui sum median if year==1983
local median_1983=r(mean)
qui sum p15 if year==1983
local p15_1983=r(mean)
qui sum p85 if year==1983
local p85_1983=r(mean)

twoway (kdensity log_earnings_work if year==1983, color(blue)), graphregion(color(white))  xtitle("") ytitle("") legend(on pos(11) ring(0) label(1 "1983"))  ylabel(0 (0.5) 1, angle(horizontal)) xlabel(4 (2) 14) xline(`p15_1983' `median_1983' `p85_1983', lpattern(dash) lcolor(blue)) saving(1983, replace)


qui sum median if year==2000
local median_2000=r(mean)
qui sum p15 if year==2000
local p15_2000=r(mean)
qui sum p85 if year==2000
local p85_2000=r(mean)

twoway (kdensity log_earnings_work if year==2000, color(red)), legend(position(6) rows(1)) ytitle("") xtitle("") legend(on pos(11) ring(0) lab(1 "2000")) graphregion(color(white)) ylabel(0 (0.5) 1, angle(horizontal)) xlabel(4 (2) 14) xline(`p15_2000' `median_2000' `p85_2000', lpattern(dash) lcolor(red)) saving(2000, replace)


qui sum median if year==2014
local median_2014=r(mean)
qui sum p15 if year==2014
local p15_2014=r(mean)
qui sum p85 if year==2014
local p85_2014=r(mean)

twoway (kdensity log_earnings_work if year==2014, color(green)), legend(ring(0) position(6) rows(1)) ytitle("") xtitle({bf:log(earnings{sub:i})}, size(large) height(7)) legend(on pos(11) ring(0) lab(1 "2014")) graphregion(color(white)) ylabel(0 (0.5) 1, angle(horizontal)) xlabel(4 (2) 14) xline(`p15_2014' `median_2014' `p85_2014', lpattern(dash) lcolor(green)) saving(2014, replace)

gr combine 1984.gph 2000.gph 2014.gph, col(1) iscale(1)
graph export kernel_soep.png, replace




***females


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_2.dta", clear


keep if female==1
keep if sample==21 | sample==23
*drop if sample==23 & year==1990
*drop if sample==23 & year==1991
*keep if sample==21 | sample==23 | sample==23

qui drop if age<24
qui drop if age>55

***

levels year, local(reg)
qui ge gini_cs_work = .
qui ge gini_cs_full = .
qui ge gini_cs_part = .
qui ge var_cs_full = .
qui ge var_cs_part = .
qui ge var_cs_work = .
qui ge kurt_cs_work = .
qui ge p85_cs_work = .
qui ge p15_cs_work = .
qui ge p85_cs_full = .
qui ge p15_cs_full = .
qui ge p85_cs_part = .
qui ge p15_cs_part = .
qui gen p85_p15_cs_full = .
qui gen p85_p15_cs_part = .
qui ge p50_cs_work = .
qui gen p85_p15_cs_work = .
qui gen p85_p50_cs_work = .
qui gen p50_p15_cs_work = .
foreach r of local reg {
qui fastgini def_earnings_work if year == `r'  
replace gini_cs_work = r(gini) if year == `r' 
qui fastgini def_earnings_full if year == `r' & form==1  
replace gini_cs_full = r(gini) if year == `r' & form==1  
qui fastgini def_earnings_part if year == `r' & form==2  
replace gini_cs_part = r(gini) if year == `r' & form==2  
egen sd=sd(log_earnings_work) if year == `r' 
egen sd_full=sd(log_earnings_full) if year == `r' & form==1
egen sd_part=sd(log_earnings_part) if year == `r' & form==2
egen kurt=kurt(log_earnings_work) if year == `r'   
replace var_cs_full=sd_full if year == `r' & form==1 
replace var_cs_part=sd_part if year == `r' & form==2 
replace var_cs_work=sd if year == `r' 
replace kurt_cs_work=kurt if year == `r' 
egen p85 = pctile(def_earnings_work) if year == `r'  , p(85)
egen p50 = pctile(def_earnings_work) if year == `r'   , p(50)
egen p15 = pctile(def_earnings_work) if year == `r' , p(15)
egen p85_full = pctile(def_earnings_full) if year == `r' & form==1  , p(85)
egen p15_full = pctile(def_earnings_full) if year == `r' & form==1  , p(15)
egen p85_part = pctile(def_earnings_part) if year == `r' & form==2  , p(85)
egen p15_part = pctile(def_earnings_part) if year == `r' & form==2  , p(15)
replace p85_cs_full=p85_full if year == `r' & form==1  
replace p15_cs_full=p15_full if year == `r' & form==1 
replace p85_cs_part=p85_part if year == `r' & form==2  
replace p15_cs_part=p15_part if year == `r' & form==2 
replace p85_cs_work=p85 if year == `r' 
replace p50_cs_work=p50 if year == `r'
replace p15_cs_work=p15 if year == `r'  
replace p85_p15_cs_full=p85_full/p15_full if year == `r' & form==1  
replace p85_p15_cs_part=p85_part/p15_part if year == `r' & form==2  
replace p85_p15_cs_work=p85/p15 if year == `r'  
replace p50_p15_cs_work=p50/p15 if year == `r'
replace p85_p50_cs_work=p85/p50 if year == `r' 
drop sd kurt p85 p50 p15 p85_full p85_part p15_full p15_part sd_full sd_part
}
*
replace var_cs_work=var_cs_work^2
replace var_cs_part=var_cs_part^2
replace var_cs_full=var_cs_full^2

***fraction of full/part time by year
gen work=1 
gen full=1 if form==1
replace full=0 if form==2
gen part=1 if form==2
replace part=0 if form==1
bysort year: egen mean_full=mean(full)
bysort year: egen mean_part=mean(part)

bysort year: egen mean_work_hours=mean(work_hours) 
bysort year: egen mean_work_hours_full=mean(work_hours) if form==1
bysort year: egen mean_work_hours_part=mean(work_hours) if form==2

bysort year: egen mean_second=mean(def_second_earnings) if  ind_second_earnings==1
bysort year: egen mean_ind_second=mean(ind_second_earnings) 

***

sort year

***Gini Coefficients:

label variable gini_cs_work "Cross Sectional Gini"
label variable gini_cs_full "Full Time"
label variable gini_cs_part "Part Time"
label variable var_cs_work "Cross Sectional Var."
label variable var_cs_full "Full Time"
label variable var_cs_part "Part Time"
label variable p85_p15_cs_full "Part Time"
label variable p85_p15_cs_part "Part Time"
label variable p85_p15_cs_work "Cross Sectional P85/P15"
label variable mean_work_hours "Aggregate"
label variable mean_work_hours_full "Full Time"
label variable mean_work_hours_part "Part Time"

rename mean_full Full_Time
rename mean_part Part_Time
label variable Full_Time "Full Time"
label variable Part_Time "Part Time"
twoway line Full_Time Part_Time year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.2) 1, angle(horizontal))
graph export fract_emp_soep_fem.png, replace

twoway line mean_second year, ytitle({bf:Euros}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lcolor(blue) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (200) 800, angle(horizontal))
graph export mean_second_soep_fem.png, replace

twoway line mean_ind_second year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lcolor(black) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.05) 0.2, angle(horizontal))
graph export mean_ind_second_soep_fem.png, replace

twoway line mean_work_hours mean_work_hours_full mean_work_hours_part year, ytitle({bf:Hours}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid solid dash dash_dot) lwidth(medthick medthick thick) lcolor(black blue red)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal))
graph export mean_hours_soep_fem.png, replace

label variable gini_cs_work "G-SOEP8415"
quietly twoway line gini_cs_work year, ytitle({bf:G[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lcolor(blue red) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.1) 0.6, angle(horizontal))
graph export gini_work_soep_fem.png, replace

quietly twoway line gini_cs_full gini_cs_part year, ytitle({bf:G[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red) lpattern(solid dash short_dash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.1) 0.6, angle(horizontal))
graph export gini_form_soep_fem.png, replace

label variable var_cs_work "G-SOEP8415"
quietly twoway line var_cs_work year, ytitle({bf:Var[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.2) 1, angle(horizontal))
graph export var_work_soep_fem.png, replace

quietly twoway line var_cs_full var_cs_part year, ytitle({bf:Var[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue) lcolor(blue red) lpattern(solid dash short_dash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.3) 1.2, angle(horizontal))
graph export var_form_soep_fem.png, replace

label variable p85_p15_cs_work "G-SOEP8415"
quietly twoway line p85_p15_cs_work year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(2 (2) 10, angle(horizontal))
graph export perc8515_work_soep_fem.png, replace

quietly twoway line p85_p15_cs_full p85_p15_cs_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(5)) lcolor(blue red) legend(position(6) rows(1)) lpattern(solid dash short_dash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(2 (2) 10, angle(horizontal))
graph export perc8515_form_soep_fem.png, replace

label variable p85_p50_cs_work "G-SOEP8415"
quietly twoway line p85_p50_cs_work year, ytitle({bf:P{sub:85}/P{sub:50}[Earnings]}, size(large) height(5)) lcolor(blue) legend(position(6) rows(1) on) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(1 (1) 4, angle(horizontal)) ylabel(, angle(horizontal))
graph export perc8550_work_soep_fem.png, replace

label variable p50_p15_cs_work "G-SOEP8415"
quietly twoway line p50_p15_cs_work year, ytitle({bf:P{sub:50}/P{sub:15}[Earnings]}, size(large) height(5)) lcolor(blue) legend(position(6) rows(1) on) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(1 (1) 4, angle(horizontal)) ylabel(, angle(horizontal))
graph export perc5015_work_soep_fem.png, replace

*** p85, p50, p15 CS evolution

replace p85_cs_work=log(p85_cs_work)
replace p50_cs_work=log(p50_cs_work)
replace p15_cs_work=log(p15_cs_work)

label variable p85_cs_work "P_85"
label variable p50_cs_work "P_50"
label variable p15_cs_work "P_15"

quietly twoway line p85_cs_work p50_cs_work p15_cs_work year, ytitle({bf:P[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black black black) lpattern(solid dash shortdash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(8 (1) 11, angle(horizontal))
graph export perc_work_soep_fem.png, replace

bysort year: egen median=median(log_earnings_work)
bysort year: egen p85 = pctile(log_earnings_work), p(85)
bysort year: egen p15 = pctile(log_earnings_work), p(15)

qui sum median if year==1983
local median_1983=r(mean)
qui sum p15 if year==1983
local p15_1983=r(mean)
qui sum p85 if year==1983
local p85_1983=r(mean)

twoway (kdensity log_earnings_work if year==1983, color(blue)), graphregion(color(white))  xtitle("") ytitle("") legend(on pos(11) ring(0) label(1 "1983"))  ylabel(0 (0.5) 1, angle(horizontal)) xlabel(4 (2) 14) xline(`p15_1983' `median_1983' `p85_1983', lpattern(dash) lcolor(blue)) saving(1983, replace)


qui sum median if year==2000
local median_2000=r(mean)
qui sum p15 if year==2000
local p15_2000=r(mean)
qui sum p85 if year==2000
local p85_2000=r(mean)

twoway (kdensity log_earnings_work if year==2000, color(red)), legend(position(6) rows(1)) ytitle("") xtitle("") legend(on pos(11) ring(0) lab(1 "2000")) graphregion(color(white)) ylabel(0 (0.5) 1, angle(horizontal)) xlabel(4 (2) 14) xline(`p15_2000' `median_2000' `p85_2000', lpattern(dash) lcolor(red)) saving(2000, replace)


qui sum median if year==2014
local median_2014=r(mean)
qui sum p15 if year==2014
local p15_2014=r(mean)
qui sum p85 if year==2014
local p85_2014=r(mean)

twoway (kdensity log_earnings_work if year==2014, color(green)), legend(ring(0) position(6) rows(1)) ytitle("") xtitle({bf:log(earnings{sub:i})}, size(large) height(7)) legend(on pos(11) ring(0) lab(1 "2014")) graphregion(color(white)) ylabel(0 (0.5) 1, angle(horizontal)) xlabel(4 (2) 14) xline(`p15_2014' `median_2014' `p85_2014', lpattern(dash) lcolor(green)) saving(2014, replace)

gr combine 1983.gph 2000.gph 2014.gph, col(1) iscale(1)
graph export kernel_soep_fem.png, replace



***unconditional


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_2.dta", clear


*keep if female==1
keep if sample==21 | sample==23
*drop if sample==23 & year==1990
*drop if sample==23 & year==1991
*keep if sample==21 | sample==23 | sample==23

qui drop if age<24
qui drop if age>55

***

levels year, local(reg)
qui ge gini_cs_work = .
qui ge gini_cs_full = .
qui ge gini_cs_part = .
qui ge var_cs_full = .
qui ge var_cs_part = .
qui ge var_cs_work = .
qui ge kurt_cs_work = .
qui ge p85_cs_work = .
qui ge p15_cs_work = .
qui ge p85_cs_full = .
qui ge p15_cs_full = .
qui ge p85_cs_part = .
qui ge p15_cs_part = .
qui gen p85_p15_cs_full = .
qui gen p85_p15_cs_part = .
qui ge p50_cs_work = .
qui gen p85_p15_cs_work = .
qui gen p85_p50_cs_work = .
qui gen p50_p15_cs_work = .
foreach r of local reg {
qui fastgini def_earnings_work if year == `r' 
replace gini_cs_work = r(gini) if year == `r'  
qui fastgini def_earnings_full if year == `r' & form==1  
replace gini_cs_full = r(gini) if year == `r' & form==1  
qui fastgini def_earnings_part if year == `r' & form==2  
replace gini_cs_part = r(gini) if year == `r' & form==2  
egen sd=sd(log_earnings_work) if year == `r' 
egen sd_full=sd(log_earnings_full) if year == `r' & form==1
egen sd_part=sd(log_earnings_part) if year == `r' & form==2
egen kurt=kurt(log_earnings_work) if year == `r' 
replace var_cs_full=sd_full if year == `r' & form==1 
replace var_cs_part=sd_part if year == `r' & form==2 
replace var_cs_work=sd if year == `r' 
replace kurt_cs_work=kurt if year == `r'  
egen p85 = pctile(def_earnings_work) if year == `r'  , p(85)
egen p50 = pctile(def_earnings_work) if year == `r'  , p(50)
egen p15 = pctile(def_earnings_work) if year == `r'  , p(15)
egen p85_full = pctile(def_earnings_full) if year == `r' & form==1  , p(85)
egen p15_full = pctile(def_earnings_full) if year == `r' & form==1  , p(15)
egen p85_part = pctile(def_earnings_part) if year == `r' & form==2  , p(85)
egen p15_part = pctile(def_earnings_part) if year == `r' & form==2  , p(15)
replace p85_cs_full=p85_full if year == `r' & form==1  
replace p15_cs_full=p15_full if year == `r' & form==1 
replace p85_cs_part=p85_part if year == `r' & form==2  
replace p15_cs_part=p15_part if year == `r' & form==2 
replace p85_cs_work=p85 if year == `r'  
replace p50_cs_work=p50 if year == `r'  
replace p15_cs_work=p15 if year == `r'  
replace p85_p15_cs_full=p85_full/p15_full if year == `r' & form==1  
replace p85_p15_cs_part=p85_part/p15_part if year == `r' & form==2  
replace p85_p15_cs_work=p85/p15 if year == `r' 
replace p50_p15_cs_work=p50/p15 if year == `r'  
replace p85_p50_cs_work=p85/p50 if year == `r'   
drop sd kurt p85 p50 p15 p85_full p85_part p15_full p15_part sd_full sd_part
}
*
replace var_cs_work=var_cs_work^2
replace var_cs_part=var_cs_part^2
replace var_cs_full=var_cs_full^2

***fraction of full/part time by year
gen work=1 
gen full=1 if form==1
replace full=0 if form==2
gen part=1 if form==2
replace part=0 if form==1
bysort year: egen mean_full=mean(full)
bysort year: egen mean_part=mean(part)

bysort year: egen mean_work_hours=mean(work_hours) 
bysort year: egen mean_work_hours_full=mean(work_hours) if form==1
bysort year: egen mean_work_hours_part=mean(work_hours) if form==2

bysort year: egen mean_second=mean(def_second_earnings) if ind_second_earnings==1
bysort year: egen mean_ind_second=mean(ind_second_earnings) 

***

sort year

***Gini Coefficients:

label variable gini_cs_work "Cross Sectional Gini"
label variable gini_cs_full "Full Time"
label variable gini_cs_part "Part Time"
label variable var_cs_work "Cross Sectional Var."
label variable var_cs_full "Full Time"
label variable var_cs_part "Part Time"
label variable p85_p15_cs_full "Part Time"
label variable p85_p15_cs_part "Part Time"
label variable p85_p15_cs_work "Cross Sectional P85/P15"
label variable mean_work_hours "Aggregate"
label variable mean_work_hours_full "Full Time"
label variable mean_work_hours_part "Part Time"

rename mean_full Full_Time
rename mean_part Part_Time
label variable Full_Time "Full Time"
label variable Part_Time "Part Time"
twoway line Full_Time Part_Time year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red) lpattern(solid dash dash_dot) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.2) 1, angle(horizontal))
graph export fract_emp_soep_unc.png, replace

twoway line mean_second year, ytitle({bf:Euros}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lcolor(blue) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (200) 800, angle(horizontal))
graph export mean_second_soep_unc.png, replace

twoway line mean_ind_second year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid dash dash_dot) lcolor(black) lwidth(medthick medthick thick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.05) 0.2, angle(horizontal))
graph export mean_ind_second_soep_unc.png, replace

twoway line mean_work_hours mean_work_hours_full mean_work_hours_part year, ytitle({bf:Hours}, size(large) height(5)) legend(position(6) rows(1)) lpattern(solid solid dash dash_dot) lwidth(medthick medthick thick) lcolor(black blue red)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal))
graph export mean_hours_soep_unc.png, replace

label variable gini_cs_work "G-SOEP8415"
quietly twoway line gini_cs_work year, ytitle({bf:G[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lcolor(blue red) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.1) 0.6, angle(horizontal))
graph export gini_work_soep_unc.png, replace

quietly twoway line gini_cs_full gini_cs_part year, ytitle({bf:G[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red) lpattern(solid dash short_dash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.1) 0.6, angle(horizontal))
graph export gini_form_soep_unc.png, replace

label variable var_cs_work "G-SOEP8415"
quietly twoway line var_cs_work year, ytitle({bf:Var[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.2) 1, angle(horizontal))
graph export var_work_soep_unc.png, replace

quietly twoway line var_cs_full var_cs_part year, ytitle({bf:Var[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue) lcolor(blue red) lpattern(solid dash short_dash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.3) 1.2, angle(horizontal))
graph export var_form_soep_unc.png, replace

label variable p85_p15_cs_work "G-SOEP8415"
quietly twoway line p85_p15_cs_work year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(5)) legend(position(6) rows(1) on) lcolor(blue) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(2 (2) 10, angle(horizontal))
graph export perc8515_work_soep_unc.png, replace

quietly twoway line p85_p15_cs_full p85_p15_cs_part year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(5)) lcolor(blue red) legend(position(6) rows(1)) lpattern(solid dash short_dash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(2 (2) 10, angle(horizontal))
graph export perc8515_form_soep_unc.png, replace

label variable p85_p50_cs_work "G-SOEP8415"
quietly twoway line p85_p50_cs_work year, ytitle({bf:P{sub:85}/P{sub:50}[Earnings]}, size(large) height(5)) lcolor(blue) legend(position(6) rows(1) on) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(1 (1) 4, angle(horizontal)) ylabel(, angle(horizontal))
graph export perc8550_work_soep_unc.png, replace

label variable p50_p15_cs_work "G-SOEP8415"
quietly twoway line p50_p15_cs_work year, ytitle({bf:P{sub:50}/P{sub:15}[Earnings]}, size(large) height(5)) lcolor(blue) legend(position(6) rows(1) on) lpattern(solid dash) lwidth(medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(1 (1) 4, angle(horizontal)) ylabel(, angle(horizontal))
graph export perc5015_work_soep_unc.png, replace

*** p85, p50, p15 CS evolution

replace p85_cs_work=log(p85_cs_work)
replace p50_cs_work=log(p50_cs_work)
replace p15_cs_work=log(p15_cs_work)

label variable p85_cs_work "P_85"
label variable p50_cs_work "P_50"
label variable p15_cs_work "P_15"

quietly twoway line p85_cs_work p50_cs_work p15_cs_work year, ytitle({bf:P[Earnings]}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black black black) lpattern(solid dash shortdash) lwidth(medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(8 (1) 11, angle(horizontal))
graph export perc_work_soep_unc.png, replace

bysort year: egen median=median(log_earnings_work)
bysort year: egen p85 = pctile(log_earnings_work), p(85)
bysort year: egen p15 = pctile(log_earnings_work), p(15)

qui sum median if year==1983
local median_1983=r(mean)
qui sum p15 if year==1983
local p15_1983=r(mean)
qui sum p85 if year==1983
local p85_1983=r(mean)

twoway (kdensity log_earnings_work if year==1983, color(blue)), graphregion(color(white))  xtitle("") ytitle("") legend(on pos(11) ring(0) label(1 "1983"))  ylabel(0 (0.5) 1, angle(horizontal)) xlabel(4 (2) 14) xline(`p15_1983' `median_1983' `p85_1983', lpattern(dash) lcolor(blue)) saving(1983, replace)


qui sum median if year==2000
local median_2000=r(mean)
qui sum p15 if year==2000
local p15_2000=r(mean)
qui sum p85 if year==2000
local p85_2000=r(mean)

twoway (kdensity log_earnings_work if year==2000, color(red)), legend(position(6) rows(1)) ytitle("") xtitle("") legend(on pos(11) ring(0) lab(1 "2000")) graphregion(color(white)) ylabel(0 (0.5) 1, angle(horizontal)) xlabel(4 (2) 14) xline(`p15_2000' `median_2000' `p85_2000', lpattern(dash) lcolor(red)) saving(2000, replace)


qui sum median if year==2014
local median_2014=r(mean)
qui sum p15 if year==2014
local p15_2014=r(mean)
qui sum p85 if year==2014
local p85_2014=r(mean)

twoway (kdensity log_earnings_work if year==2014, color(green)), legend(ring(0) position(6) rows(1)) ytitle("") xtitle({bf:log(earnings{sub:i})}, size(large) height(7)) legend(on pos(11) ring(0) lab(1 "2014")) graphregion(color(white)) ylabel(0 (0.5) 1, angle(horizontal)) xlabel(4 (2) 14) xline(`p15_2014' `median_2014' `p85_2014', lpattern(dash) lcolor(green)) saving(2014, replace)

gr combine 1983.gph 2000.gph 2014.gph, col(1) iscale(1)
graph export kernel_soep_unc.png, replace

*** long term earnings inequality

*** 5 year time series


*set memory 16g
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_2.dta", clear
ssc install fastgini

*keep if female==0

*** Cross Sectional Gini on Long Term Earnings

keep if sample==21 | sample==23
*drop if sample==23 & year==1990
*drop if sample==23 & year==1991

qui drop if age<24
qui drop if age>55

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*drop if form!=1 & form!=2
sort persnr year
*bysort persnr year: gen first=_n
*keep if first==1

bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 

*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn year: gen max_diff_year_g=max_year_g-year
drop if max_year_g-min_year_g<4
*

levels year, local(reg)
qui ge gini_cs_work = .
qui ge var_cs_work = .
qui ge kurt_cs_work = .
qui ge p85_cs_work = .
qui ge p15_cs_work = .
qui ge p50_cs_work = .
qui gen p85_p15_cs_work = .
qui gen p85_p50_cs_work = .
qui gen p50_p15_cs_work = .
forval r =1983/2010 {
bysort persnr: gen sum_def_earnings_work=def_earnings_work+def_earnings_work[_n+1]+def_earnings_work[_n+2]+def_earnings_work[_n+3]+def_earnings_work[_n+4] if max_diff_year_g>=4  & year==`r'
qui fastgini sum_def_earnings_work if year == `r'
replace gini_cs_work = r(gini) if year == `r'  
gen log_sum_def_earnings_work=log(sum_def_earnings_work)
egen sd=sd(log_sum_def_earnings_work) if year == `r'   
egen kurt=kurt(log_sum_def_earnings_work) if year == `r'  
replace var_cs_work=sd if year == `r' 
replace kurt_cs_work=kurt if year == `r'  
egen p85 = pctile(sum_def_earnings_work) if year == `r'  , p(85)
egen p50 = pctile(sum_def_earnings_work) if year == `r'  , p(50)
egen p15 = pctile(sum_def_earnings_work) if year == `r'   , p(15)
replace p85_cs_work=p85 if year == `r'  
replace p50_cs_work=p50 if year == `r' 
replace p15_cs_work=p15 if year == `r'  
replace p85_p15_cs_work=p85/p15 if year == `r'  
replace p50_p15_cs_work=p50/p15 if year == `r' 
replace p85_p50_cs_work=p85/p50 if year == `r'
drop sd kurt p85 p50 p15
drop sum_def_earnings_work log_sum_def_earnings_work
}

replace var_cs_work=var_cs_work^2

sort year

*tabstat var_cs_work, by(year) statistics(mean n)

***Gini Coefficients:
label variable var_cs_work "G-SOEP8415"
quietly twoway line var_cs_work year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.1) 0.6, angle(horizontal))
graph export var_work_lfive_unc_soep.png, replace

label variable gini_cs_work "G-SOEP8415"
quietly twoway line gini_cs_work year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.1 (0.1) 0.5, angle(horizontal))
graph export gini_work_lfive_unc_soep.png, replace

label variable p85_p15_cs_work "G-SOEP8415"
quietly twoway line p85_p15_cs_work year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lcolor(blue red green orange magenta) lpattern(solid dash shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(1 (1) 4, angle(horizontal))
graph export perc8515_work_lfive_unc_soep.png, replace


*


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_2.dta", clear
ssc install fastgini

keep if female==0

*** Cross Sectional Gini on Long Term Earnings

keep if sample==21 | sample==23
*drop if sample==23 & year==1990
*drop if sample==23 & year==1991

qui drop if age<24
qui drop if age>55

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*drop if form!=1 & form!=2
sort persnr year
*bysort persnr year: gen first=_n
*keep if first==1

bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 

*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn year: gen max_diff_year_g=max_year_g-year
drop if max_year_g-min_year_g<4
*

levels year, local(reg)
qui ge gini_cs_work = .
qui ge var_cs_work = .
qui ge kurt_cs_work = .
qui ge p85_cs_work = .
qui ge p15_cs_work = .
qui ge p50_cs_work = .
qui gen p85_p15_cs_work = .
qui gen p85_p50_cs_work = .
qui gen p50_p15_cs_work = .
forval r =1983/2010 {
bysort persnr: gen sum_def_earnings_work=def_earnings_work+def_earnings_work[_n+1]+def_earnings_work[_n+2]+def_earnings_work[_n+3]+def_earnings_work[_n+4] if max_diff_year_g>=4 & year==`r'
qui fastgini sum_def_earnings_work if year == `r' 
replace gini_cs_work = r(gini) if year == `r' 
gen log_sum_def_earnings_work=log(sum_def_earnings_work)
egen sd=sd(log_sum_def_earnings_work) if year == `r'  
egen kurt=kurt(log_sum_def_earnings_work) if year == `r'  
replace var_cs_work=sd if year == `r' 
replace kurt_cs_work=kurt if year == `r'   
egen p85 = pctile(sum_def_earnings_work) if year == `r'  , p(85)
egen p50 = pctile(sum_def_earnings_work) if year == `r'   , p(50)
egen p15 = pctile(sum_def_earnings_work) if year == `r'  , p(15)
replace p85_cs_work=p85 if year == `r'  
replace p50_cs_work=p50 if year == `r'  
replace p15_cs_work=p15 if year == `r'  
replace p85_p15_cs_work=p85/p15 if year == `r'  
replace p50_p15_cs_work=p50/p15 if year == `r'  
replace p85_p50_cs_work=p85/p50 if year == `r'  
drop sd kurt p85 p50 p15
drop sum_def_earnings_work log_sum_def_earnings_work
}

replace var_cs_work=var_cs_work^2

sort year

*tabstat var_cs_work, by(year) statistics(mean n)

***Gini Coefficients:
label variable var_cs_work "G-SOEP8415"
quietly twoway line var_cs_work year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.1) 0.6, angle(horizontal))
graph export var_work_lfive_soep.png, replace

label variable gini_cs_work "G-SOEP8415"
quietly twoway line gini_cs_work year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.1 (0.1) 0.5, angle(horizontal))
graph export gini_work_lfive_soep.png, replace

label variable p85_p15_cs_work "G-SOEP8415"
quietly twoway line p85_p15_cs_work year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lcolor(blue red green orange magenta) lpattern(solid dash shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(1 (1) 4, angle(horizontal))
graph export perc8515_work_lfive_soep.png, replace


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_2.dta", clear
ssc install fastgini

keep if female==1

*** Cross Sectional Gini on Long Term Earnings

keep if sample==21 | sample==23
*drop if sample==23 & year==1990
*drop if sample==23 & year==1991

qui drop if age<24
qui drop if age>55

*bysort persnr year source: gen first=_n if source==1
*keep if first==1
*drop if form!=1 & form!=2
sort persnr year
*bysort persnr year: gen first=_n
*keep if first==1

bysort persnr: gen jump=1 if year-year[_n-1]>1 & year-year[_n-1]!=. 
bysort persnr: egen tot=total(jump)
drop if tot>0 & tot!=. 

*
bysort persn: egen max_year_g=max(year)
bysort persn: egen min_year_g=min(year)
bysort persn year: gen max_diff_year_g=max_year_g-year
drop if max_year_g-min_year_g<4
*

levels year, local(reg)
qui ge gini_cs_work = .
qui ge var_cs_work = .
qui ge kurt_cs_work = .
qui ge p85_cs_work = .
qui ge p15_cs_work = .
qui ge p50_cs_work = .
qui gen p85_p15_cs_work = .
qui gen p85_p50_cs_work = .
qui gen p50_p15_cs_work = .
forval r =1983/2010 {
bysort persnr: gen sum_def_earnings_work=def_earnings_work+def_earnings_work[_n+1]+def_earnings_work[_n+2]+def_earnings_work[_n+3]+def_earnings_work[_n+4] if max_diff_year_g>=4  & year==`r'
qui fastgini sum_def_earnings_work if year == `r' 
replace gini_cs_work = r(gini) if year == `r'  
gen log_sum_def_earnings_work=log(sum_def_earnings_work)
egen sd=sd(log_sum_def_earnings_work) if year == `r'  
egen kurt=kurt(log_sum_def_earnings_work) if year == `r' 
replace var_cs_work=sd if year == `r'   
replace kurt_cs_work=kurt if year == `r'  
egen p85 = pctile(sum_def_earnings_work) if year == `r'  , p(85)
egen p50 = pctile(sum_def_earnings_work) if year == `r'  , p(50)
egen p15 = pctile(sum_def_earnings_work) if year == `r'  , p(15)
replace p85_cs_work=p85 if year == `r' 
replace p50_cs_work=p50 if year == `r'  
replace p15_cs_work=p15 if year == `r'  
replace p85_p15_cs_work=p85/p15 if year == `r'  
replace p50_p15_cs_work=p50/p15 if year == `r'  
replace p85_p50_cs_work=p85/p50 if year == `r'  
drop sd kurt p85 p50 p15
drop sum_def_earnings_work log_sum_def_earnings_work
}

replace var_cs_work=var_cs_work^2

sort year

*tabstat var_cs_work, by(year) statistics(mean n)

***Gini Coefficients:
label variable var_cs_work "G-SOEP8415"
quietly twoway line var_cs_work year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.1) 0.6, angle(horizontal))
graph export var_work_lfive_fem_soep.png, replace

label variable gini_cs_work "G-SOEP8415"
quietly twoway line gini_cs_work year, ytitle({bf:G[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.1 (0.1) 0.5, angle(horizontal))
graph export gini_work_lfive_fem_soep.png, replace

label variable p85_p15_cs_work "G-SOEP8415"
quietly twoway line p85_p15_cs_work year, ytitle({bf:P{sub:85}/P{sub:15}[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lcolor(blue red green orange magenta) lpattern(solid dash shortdash longdash longdash_dot) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(1 (1) 4, angle(horizontal))
graph export perc8515_work_lfive_fem_soep.png, replace


*3/43 Carrillo
cls
set more off
*_2
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_0.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

*ssc install fastgini
*employment status
*lfs
*form
*
keep if sample==21
*keep if sample==21 | sample==23
*
drop if employment_status<0
gen employed=0
replace employed=1 if employment_status==1
tabstat employment_status, by(year) stat(mean n)
*
gen active=1 if employment_status==1
replace active=0 if employment_status==0
*
gen full_time=1 if employment_status==1 & form==1
replace full_time=0 if employment_status==1 & form==2
replace full_time=0 if employment_status==0
*
gen part_time=1 if employment_status==1& form==2
replace part_time=0 if employment_status==0
replace part_time=0 if employment_status==1& form==1
*
bysort year: egen mean_full_time=mean(full_time)
bysort year: egen mean_part_time=mean(part_time)
bysort year: egen mean_active=mean(active)

label variable mean_active "Total Employment"
label variable mean_full_time "Full-Time Employment"
label variable mean_part_time "Part-Time Employment"
sort year
quietly twoway line mean_active mean_full_time mean_part_time year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.2) 1, angle(horizontal))
graph export total_employment_soep.png, replace


*
*3/43 Carrillo
cls
set more off
*_2
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_2.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

*
keep if sample==21 
*keep if sample==21 | sample==23
*
tab lfs
drop if lfs<0
drop if lfs==2
drop if lfs==3
drop if lfs==4
drop if lfs==5
tab lfs
*
gen labor_force=1
replace labor_force=0 if lfs==1
tabstat labor_force, by(year) stat(mean n)
*
gen tot_emp=0
replace tot_emp=1 if lfs!=1 & lfs!=6
*
bysort year: egen mean_labor_force=mean(labor_force)
bysort year: egen mean_tot_emp=mean(tot_emp)
*
sort year
label variable mean_labor_force "Labour Force" 
label variable mean_tot_emp "Total Employment" 
*
quietly twoway line mean_labor_force mean_tot_emp year, ytitle({bf:Share of WAP}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(red blue green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.7 (0.05) 0.9, angle(horizontal))
graph export mean_labor_force_soep.png, replace


*
*36/43 Carrillo
cls
set more off
*_2
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv_0.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

*
keep if sample==21 
*keep if sample==21 | sample==23
*
tab lfs
drop if lfs<0
drop if lfs==2
drop if lfs==3
drop if lfs==4
drop if lfs==5
tab lfs
*
gen labor_force=1
replace labor_force=0 if lfs==1
tabstat labor_force, by(year) stat(mean n)
*
gen tot_emp=0
replace tot_emp=1 if lfs!=1 & lfs!=6
*
bysort year: egen mean_labor_force=mean(labor_force)
bysort year: egen mean_tot_emp=mean(tot_emp)
*
sort year
label variable mean_labor_force "Labour Force" 
label variable mean_tot_emp "Total Employment" 
*
quietly twoway line mean_labor_force mean_tot_emp year, ytitle({bf:Share of WAP}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(red blue green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.7 (0.05) 0.9, angle(horizontal))
graph export mean_labor_force_soep.png, replace
