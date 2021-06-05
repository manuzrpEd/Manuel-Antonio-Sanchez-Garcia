clear
set more off
*set memory 16g

***this dataset is monthly!

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\apgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1984
*
**drop hhnrakt hhnr ahhnr x11101ll d1110784 e1110684 e1110784 h1110* i112* renty84 opery84 fopery84 divdy84 fdivdy84 adchb84 fadchb84
*drop lossr84 lossc84 flossr84 flossc84 chspt84 fchspt84 chsub84 fchsub84 ichsu84 fchsu84 nursh84 fnursh84 hsup84 fhsup84
**drop f* m* w* e1120184
*rename variables
rename *84 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_84.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\bpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1985
*
*drop hhnrakt hhnr x11101ll d1110785 e1110685 e1110785 e1120185 renty85 opery85 divdy85 adchb85 lossr85 lossc85 chspt85 chsub85 ichsu85 nursh85 hsup85
*drop f* m* w* h1110* i112* bhhnr
*rename variables
rename *85 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_85.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\cpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1986
*
*drop hhnrakt hhnr x11101ll d1110786 e1110686 e1110786 e1120186 renty86 opery86 divdy86 adchb86 lossr86 lossc86 chspt86 chsub86 ichsu86 nursh86 hsup86
*drop f* m* w* h1110* i112* chhnr
*
*rename variables
rename *86 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_86.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\dpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1987
*
*drop hhnrakt hhnr x11101ll d1110787 e1110687 e1110787 e1120187 renty87 opery87 divdy87 adchb87 lossr87 lossc87 chspt87 chsub87 ichsu87 nursh87 hsup87
*drop f* m* w* h1110* i112* dhhnr
*rename variables
rename *87 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_87.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\epgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1988
*
*drop hhnrakt hhnr x11101ll d1110788 e1110688 e1110788 e1120188 renty88 opery88 divdy88 adchb88 lossr88 lossc88 chspt88 chsub88 ichsu88 nursh88 hsup88
*drop f* m* w* h1110* i112* ehhnr
*rename variables
rename *88 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_88.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\fpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1989
*
*drop hhnrakt hhnr x11101ll d1110789 e1110689 e1110789 e1120189 renty89 opery89 divdy89 adchb89 lossr89 lossc89 chspt89 chsub89 ichsu89 nursh89 hsup89
*drop f* m* w* h1110* i112* fhhnr
*rename variables
rename *89 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_89.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\gpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1990
*
*drop hhnrakt hhnr x11101ll d1110790 e1110690 e1110790 e1120190 renty90 opery90 divdy90 adchb90 lossr90 lossc90 chspt90 chsub90 ichsu90 nursh90 hsup90
*drop f* m* w* h1110* i112* ghhnr
*rename variables
rename *90 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_90.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\hpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1991
*
*drop hhnrakt hhnr x11101ll d1110791 e1110691 e1110791 e1120191 renty91 opery91 divdy91 adchb91 lossr91 lossc91 chspt91 chsub91 ichsu91 nursh91 hsup91
*drop f* m* w* h1110* i112* hhhnr
*rename variables
rename *91 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_91.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\ipgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1992
*
*drop hhnrakt hhnr x11101ll d1110792 e1110692 e1110792 e1120192 renty92 opery92 divdy92 adchb92 lossr92 lossc92 chspt92 chsub92 ichsu92 nursh92 hsup92
*drop f* m* w* h1110* i112* ihhnr
*rename variables
rename *92 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_92.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\jpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1993
*
*drop hhnrakt hhnr x11101ll d1110793 e1110693 e1110793 e1120193 renty93 opery93 divdy93 adchb93 lossr93 lossc93 chspt93 chsub93 ichsu93 nursh93 hsup93
*drop f* m* w* h1110* i112* jhhnr
*rename variables
rename *93 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_93.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\kpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1994
*
*drop hhnrakt hhnr x11101ll d1110794 e1110694 e1110794 e1120194 renty94 opery94 divdy94 adchb94 lossr94 lossc94 chspt94 chsub94 ichsu94 nursh94 hsup94
*drop f* m* w* h1110* i112* khhnr
*rename variables
rename *94 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_94.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\lpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1995
*
*drop hhnrakt hhnr x11101ll d1110795 e1110695 e1110795 e1120195 renty95 opery95 divdy95 adchb95 lossr95 lossc95 chspt95 chsub95 ichsu95 nursh95 hsup95
*drop f* m* w* h1110* i112* lhhnr
*rename variables
rename *95 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_95.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\mpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1996
*
*drop hhnrakt hhnr x11101ll d1110796 e1110696 e1110796 e1120196 renty96 opery96 divdy96 adchb96 lossr96 lossc96 chspt96 chsub96 ichsu96 nursh96 hsup96
*drop f* m* w* h1110* i112* mhhnr
*rename variables
rename *96 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_96.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\npgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1997
*
*drop hhnrakt hhnr x11101ll d1110797 e1110697 e1110797 e1120197 renty97 opery97 divdy97 adchb97 lossr97 lossc97 chspt97 chsub97 ichsu97 nursh97 hsup97
*drop f* m* w* h1110* i112* nhhnr
*rename variables
rename *97 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_97.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\opgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1998
*
*drop hhnrakt hhnr x11101ll d1110798 e1110698 e1110798 e1120198 renty98 opery98 divdy98 adchb98 lossr98 lossc98 chspt98 chsub98 ichsu98 nursh98 hsup98
*drop f* m* w* h1110* i112* ohhnr
*rename variables
rename *98 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_98.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\ppgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=1999
*
*drop hhnrakt hhnr x11101ll d1110799 e1110699 e1110799 e1120199 renty99 opery99 divdy99 adchb99 lossr99 lossc99 chspt99 chsub99 ichsu99 nursh99 hsup99
*drop f* m* w* h1110* i112* phhnr
*rename variables
rename *99 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_99.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\qpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2000
*
*drop hhnrakt hhnr x11101ll d1110700 e1110600 e1110700 e1120100 renty00 opery00 divdy00 adchb00 lossr00 lossc00 chspt00 chsub00 ichsu00 nursh00 hsup00
*drop f* m* w* h1110* i112* qhhnr
*rename variables
rename *00 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_00.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\rpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2001
*
*drop hhnrakt hhnr x11101ll d1110701 e1110601 e1110701 e1120101 renty01 opery01 divdy01 adchb01 lossr01 lossc01 chspt01 chsub01 ichsu01 nursh01 hsup01
*drop f* m* w* h1110* i112* rhhnr
*rename variables
rename *01 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_01.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\spgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2002
*
*drop hhnrakt hhnr x11101ll d1110702 e1110602 e1110702 e1120102 renty02 opery02 divdy02 adchb02 lossr02 lossc02 chspt02 chsub02 ichsu02 nursh02 hsup02
*drop f* m* w* h1110* i112* shhnr
*rename variables
rename *02 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_02.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\tpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2003
*
*drop hhnrakt hhnr x11101ll d1110703 e1110603 e1110703 e1120103 renty03 opery03 divdy03 adchb03 lossr03 lossc03 chspt03 chsub03 ichsu03 nursh03 hsup03
*drop f* m* w* h1110* i112* thhnr
*rename variables
rename *03 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_03.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\upgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2004
*
*drop hhnrakt hhnr x11101ll d1110704 e1110604 e1110704 e1120104 renty04 opery04 divdy04 adchb04 lossr04 lossc04 chspt04 chsub04 ichsu04 nursh04 hsup04
*drop f* m* w* h1110* i112* uhhnr
*rename variables
rename *04 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_04.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\vpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2005
*
*drop hhnrakt hhnr x11101ll d1110705 e1110605 e1110705 e1120105 renty05 opery05 divdy05 adchb05 lossr05 lossc05 chspt05 chsub05 ichsu05 nursh05 hsup05
*drop f* m* w* h1110* i112* vhhnr
*rename variables
rename *05 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_05.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\wpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2006
*
*drop hhnrakt hhnr x11101ll d1110706 e1110606 e1110706 e1120106 renty06 opery06 divdy06 adchb06 lossr06 lossc06 chspt06 chsub06 ichsu06 nursh06 hsup06
*drop f* m* w* h1110* i112* whhnr
*rename variables
rename *06 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_06.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\xpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2007
*
*drop hhnrakt hhnr x11101ll d1110707 e1110607 e1110707 e1120107 renty07 opery07 divdy07 adchb07 lossr07 lossc07 chspt07 chsub07 ichsu07 nursh07 hsup07
*drop f* m* w* h1110* i112* xhhnr
*rename variables
rename *07 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_07.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\ypgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2008
*
*drop hhnrakt hhnr x11101ll d1110708 e1110608 e1110708 e1120108 renty08 opery08 divdy08 adchb08 lossr08 lossc08 chspt08 chsub08 ichsu08 nursh08 hsup08
*drop f* m* w* h1110* i112* yhhnr
*rename variables
rename *08 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_08.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\zpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2009
*
*drop hhnrakt hhnr x11101ll d1110709 e1110609 e1110709 e1120109 renty09 opery09 divdy09 adchb09 lossr09 lossc09 chspt09 chsub09 ichsu09 nursh09 hsup09
*drop f* m* w* h1110* i112* zhhnr
*rename variables
rename *09 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_09.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\bapgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2010
*
*drop hhnrakt hhnr x11101ll d1110710 e1110610 e1110710 e1120110 renty10 opery10 divdy10 adchb10 lossr10 lossc10 chspt10 chsub10 ichsu10 nursh10 hsup10
*drop f* m* w* h1110* i112* bahhnr
*rename variables
rename *10 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_10.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\bbpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2011
*
*drop hhnrakt hhnr x11101ll d1110711 e1110611 e1110711 e1120111 renty11 opery11 divdy11 adchb11 lossr11 lossc11 chspt11 chsub11 ichsu11 nursh11 hsup11
*drop f* m* w* h1110* i112* bbhhnr
*rename variables
rename *11 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_11.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\bcpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2012
*
*drop hhnrakt hhnr x11101ll d1110712 e1110612 e1110712 e1120112 renty12 opery12 divdy12 adchb12 lossr12 lossc12 chspt12 chsub12 ichsu12 nursh12 hsup12
*drop f* m* w* h1110* i112* bchhnr
*rename variables
rename *12 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_12.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\bdpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2013
*
*drop hhnrakt hhnr x11101ll d1110713 e1110613 e1110713 e1120113 renty13 opery13 divdy13 adchb13 lossr13 lossc13 chspt13 chsub13 ichsu13 nursh13 hsup13
*drop f* m* w* h1110* i112* bdhhnr
*rename variables
rename *13 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_13.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\bepgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2014
*
*drop hhnrakt hhnr x11101ll d1110714 e1110614 e1110714 e1120114 renty14 opery14 divdy14 adchb14 lossr14 lossc14 chspt14 chsub14 ichsu14 nursh14 hsup14
*drop f* m* w* h1110* i112* behhnr
*rename variables
rename *14 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_14.dta", replace

use "C:\Users\Tony\Desktop\Projects\RSIAB7514\EarningsDynamics&Institutions\GSOEP\GSOEP_Data\pgen\bfpgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*gen year variable:
gen year=2015
*
*drop hhnrakt hhnr x11101ll d1110715 e1110615 e1110715 e1120115 renty15 opery15 divdy15 adchb15 lossr15 lossc15 chspt15 chsub15 ichsu15 nursh15 hsup15
*drop f* m* w* h1110* i112* bfhhnr
*rename variables
rename *15 *
rename *tatzeit weekly_hours
rename *uebstd over_weekly_hours
*
save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_15.dta", replace

***append
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_84.dta", clear
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_85.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_86.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_87.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_88.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_89.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_90.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_91.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_92.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_93.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_94.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_95.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_96.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_97.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_98.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_99.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_00.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_01.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_02.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_03.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_04.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_05.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_06.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_07.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_08.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_09.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_10.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_11.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_12.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_13.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_14.dta", nolabel
append using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_15.dta", nolabel

label language EN

rename oeffd civil_servant

rename emplst employment_status
tab employment_status

gen form=0
replace form=1 if employment_status==1
replace form=2 if employment_status==2
replace form=3 if employment_status==4

replace civil_servant=0 if civil_servant==2

rename labgro labor_earnings_month
rename sndjob second_earnings_month

sort persnr year

save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_0.dta", replace

merge 1:1 persnr year using "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pequiv.dta", keepusing(female age cpi sample educ_years) nogen

save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen.dta", replace

ssc install fastgini
***cleaning - generate variables/statistics to compare to pequiv

replace labor_earnings_month=labor_earnings_month*100/cpi
replace second_earnings_month=second_earnings_month*100/cpi

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

*drop year
*rename year_new year

***


*tab civil_servant



*drop if civil_servant==1
*drop if nation!=1
*drop if inrange(lfs,4,5)



*drop if civil_servant==1

*replace labor_earnings=labor_earnings-inc_self if inc_self>0
*replace labor_earnings=labor_earnings-inc_military if inc_military>0
*replace labor_earnings=labor_earnings-inc_profit if inc_profit>0

*drop if employment_status<=0
*drop if form<=0
*drop if occupation==100
*drop if occupation==5162
*drop if occupation==5163
*drop if region_west_east==2

sort persnr year

save "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_2.dta", replace

***males


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_2.dta", clear

*drop if civil_servant==1
keep if female==0
keep if sample==21 | sample==23

qui drop if age<24
qui drop if age>55

***

gen work=1
gen full=1 if form==1
replace full=0 if form==2
replace full=0 if form==3
gen part=1 if form==2
replace part=0 if form==1
replace part=0 if form==3
gen mini=1 if form==3
replace mini=0 if form==1
replace mini=0 if form==2
*bysort year month: egen mean_full=mean(full) if work==1
*bysort year month: egen mean_part=mean(part) if work==1
*bysort year month: egen mean_mini=mean(mini) if work==1
bysort year: egen ave_mean_full=mean(full) if work==1
bysort year: egen ave_mean_part=mean(part) if work==1
bysort year: egen ave_mean_mini=mean(mini) if work==1

bysort year: egen mean_weekly_hours=mean(weekly_hours) 
bysort year: egen mean_weekly_hours_full=mean(weekly_hours) if form==1
bysort year: egen mean_weekly_hours_part=mean(weekly_hours) if form==2
bysort year: egen mean_weekly_hours_mini=mean(weekly_hours) if form==3

bysort year: egen mean_over_weekly_hours=mean(over_weekly_hours) 
bysort year: egen mean_over_weekly_hours_full=mean(over_weekly_hours) if form==1
bysort year: egen mean_over_weekly_hours_part=mean(over_weekly_hours) if form==2
bysort year: egen mean_over_weekly_hours_mini=mean(over_weekly_hours) if form==3

sort year month

order persnr year month form ave_mean_full

rename ave_mean_full Full_Time
rename ave_mean_part Part_Time
rename ave_mean_mini Marginal
label variable Full_Time "Full Time"
label variable Part_Time "Part Time"
label variable Marginal "Marginal"
twoway line Full_Time Part_Time Marginal year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red green) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.2) 1, angle(horizontal))
graph export fract_emp_soep_gen.png, replace

label variable mean_weekly_hours "Aggregate"
label variable mean_weekly_hours_full "Full Time"
label variable mean_weekly_hours_part "Part Time"
label variable mean_weekly_hours_mini "Marginal"
twoway line mean_weekly_hours mean_weekly_hours_full mean_weekly_hours_part mean_weekly_hours_mini year, ytitle({bf:Hours}, size(large) height(20)) legend(position(6) rows(1)) lpattern(solid solid dash dash_dot) lwidth(medthick medthick medthick medthick) lcolor(black blue red green)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(10 (10) 50, angle(horizontal))
graph export mean_hours_soep_gen.png, replace

label variable mean_over_weekly_hours "Aggregate"
label variable mean_over_weekly_hours_full "Full Time"
label variable mean_over_weekly_hours_part "Part Time"
label variable mean_over_weekly_hours_mini "Marginal"
twoway line mean_over_weekly_hours mean_over_weekly_hours_full mean_over_weekly_hours_part mean_over_weekly_hours_mini year, ytitle({bf:Hours}, size(large) height(20)) legend(position(6) rows(1)) lpattern(solid solid dash dash_dot) lwidth(medthick medthick medthick medthick) lcolor(black blue red green)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (1) 5, angle(horizontal))
graph export mean_over_hours_soep_gen.png, replace


***females


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_2.dta", clear

*drop if civil_servant==1
keep if female==1
keep if sample==21 | sample==23

qui drop if age<24
qui drop if age>55

***

gen work=1
gen full=1 if form==1
replace full=0 if form==2
replace full=0 if form==3
gen part=1 if form==2
replace part=0 if form==1
replace part=0 if form==3
gen mini=1 if form==3
replace mini=0 if form==1
replace mini=0 if form==2
*bysort year month: egen mean_full=mean(full) if work==1
*bysort year month: egen mean_part=mean(part) if work==1
*bysort year month: egen mean_mini=mean(mini) if work==1
bysort year: egen ave_mean_full=mean(full) if work==1
bysort year: egen ave_mean_part=mean(part) if work==1
bysort year: egen ave_mean_mini=mean(mini) if work==1

bysort year: egen mean_weekly_hours=mean(weekly_hours) 
bysort year: egen mean_weekly_hours_full=mean(weekly_hours) if form==1
bysort year: egen mean_weekly_hours_part=mean(weekly_hours) if form==2
bysort year: egen mean_weekly_hours_mini=mean(weekly_hours) if form==3

bysort year: egen mean_over_weekly_hours=mean(over_weekly_hours) 
bysort year: egen mean_over_weekly_hours_full=mean(over_weekly_hours) if form==1
bysort year: egen mean_over_weekly_hours_part=mean(over_weekly_hours) if form==2
bysort year: egen mean_over_weekly_hours_mini=mean(over_weekly_hours) if form==3

sort year month

order persnr year month form ave_mean_full

rename ave_mean_full Full_Time
rename ave_mean_part Part_Time
rename ave_mean_mini Marginal
label variable Full_Time "Full Time"
label variable Part_Time "Part Time"
label variable Marginal "Marginal"
twoway line Full_Time Part_Time Marginal year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red green) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.2) 1, angle(horizontal))
graph export fract_emp_soep_gen_fem.png, replace

twoway line mean_weekly_hours mean_weekly_hours_full mean_weekly_hours_part mean_weekly_hours_mini year, ytitle({bf:Hours}, size(large) height(20)) legend(position(6) rows(1)) lpattern(solid solid dash dash_dot) lwidth(medthick medthick medthick medthick) lcolor(black blue red green)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(10 (10) 50, angle(horizontal))
graph export mean_hours_soep_gen_fem.png, replace

label variable mean_over_weekly_hours "Aggregate"
label variable mean_over_weekly_hours_full "Full Time"
label variable mean_over_weekly_hours_part "Part Time"
label variable mean_over_weekly_hours_mini "Marginal"
twoway line mean_over_weekly_hours mean_over_weekly_hours_full mean_over_weekly_hours_part mean_over_weekly_hours_mini year, ytitle({bf:Hours}, size(large) height(20)) legend(position(6) rows(1)) lpattern(solid solid dash dash_dot) lwidth(medthick medthick medthick medthick) lcolor(black blue red green)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (1) 5, angle(horizontal))
graph export mean_over_hours_soep_gen_fem.png, replace

***unconditional


use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_2.dta", clear

drop if civil_servant==1
*keep if female==1
keep if sample==21 | sample==23

qui drop if age<24
qui drop if age>55

***

gen work=1 
gen full=1 if form==1
replace full=0 if form==2
replace full=0 if form==3
gen part=1 if form==2
replace part=0 if form==1
replace part=0 if form==3
gen mini=1 if form==3
replace mini=0 if form==1
replace mini=0 if form==2
*bysort year month: egen mean_full=mean(full) if work==1
*bysort year month: egen mean_part=mean(part) if work==1
*bysort year month: egen mean_mini=mean(mini) if work==1
bysort year: egen ave_mean_full=mean(full) if work==1
bysort year: egen ave_mean_part=mean(part) if work==1
bysort year: egen ave_mean_mini=mean(mini) if work==1

bysort year: egen mean_weekly_hours=mean(weekly_hours) 
bysort year: egen mean_weekly_hours_full=mean(weekly_hours) if form==1
bysort year: egen mean_weekly_hours_part=mean(weekly_hours) if form==2
bysort year: egen mean_weekly_hours_mini=mean(weekly_hours) if form==3

bysort year: egen mean_over_weekly_hours=mean(over_weekly_hours) 
bysort year: egen mean_over_weekly_hours_full=mean(over_weekly_hours) if form==1
bysort year: egen mean_over_weekly_hours_part=mean(over_weekly_hours) if form==2
bysort year: egen mean_over_weekly_hours_mini=mean(over_weekly_hours) if form==3

sort year month

order persnr year month form ave_mean_full

rename ave_mean_full Full_Time
rename ave_mean_part Part_Time
rename ave_mean_mini Marginal
label variable Full_Time "Full Time"
label variable Part_Time "Part Time"
label variable Marginal "Marginal"
twoway line Full_Time Part_Time Marginal year, ytitle({bf:Fraction}, size(large) height(5)) legend(position(6) rows(1)) lcolor(blue red green) lpattern(solid dash shortdash) lwidth(medthick medthick medthick)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.2) 1, angle(horizontal))
graph export fract_emp_soep_gen_unc.png, replace

label variable mean_weekly_hours "Aggregate"
label variable mean_weekly_hours_full "Full Time"
label variable mean_weekly_hours_part "Part Time"
label variable mean_weekly_hours_mini "Marginal"
twoway line mean_weekly_hours mean_weekly_hours_full mean_weekly_hours_part mean_weekly_hours_mini year, ytitle({bf:Hours}, size(large) height(20)) legend(position(6) rows(1)) lpattern(solid solid dash dash_dot) lwidth(medthick medthick medthick medthick) lcolor(black blue red green)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(10 (10) 50, angle(horizontal))
graph export mean_hours_soep_gen_unc.png, replace

label variable mean_over_weekly_hours "Aggregate"
label variable mean_over_weekly_hours_full "Full Time"
label variable mean_over_weekly_hours_part "Part Time"
label variable mean_over_weekly_hours_mini "Marginal"
twoway line mean_over_weekly_hours mean_over_weekly_hours_full mean_over_weekly_hours_part mean_over_weekly_hours_mini year, ytitle({bf:Hours}, size(large) height(20)) legend(position(6) rows(1)) lpattern(solid solid dash dash_dot) lwidth(medthick medthick medthick medthick) lcolor(black blue red green)  xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (1) 5, angle(horizontal))
graph export mean_over_hours_soep_gen_unc.png, replace


*Galasi
cls
set more off
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_2.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*
tab lfs if year==2005 & age>17 & age<65 & lfs>0
*
tab employment_status if year==2005 & age>17 & age<65 & lfs>0 & lfs==11
*
sum weekly_hours if employment_status==1 & year==2005 & age>17 & age<65 & lfs>0 & lfs==11 & weekly_hours>0
sum weekly_hours if employment_status==2 & year==2005 & age>17 & age<65 & lfs>0 & lfs==11 & weekly_hours>0
sum weekly_hours if employment_status==4 & year==2005 & age>17 & age<65 & lfs>0 & lfs==11 & weekly_hours>0
*
gen hourly_wage=labor_earnings_month/(weekly_hours*4)
*
sum hourly_wage if employment_status==1 & year==2005 & age>17 & age<65 & lfs>0 & lfs==11 & hourly_wage>0
sum hourly_wage if employment_status==2 & year==2005 & age>17 & age<65 & lfs>0 & lfs==11 & hourly_wage>0
sum hourly_wage if employment_status==4 & year==2005 & age>17 & age<65 & lfs>0 & lfs==11 & hourly_wage>0
*
sum labor_earnings_month if employment_status==1 & year==2005 & age>17 & age<65 & lfs>0 & lfs==11 & labor_earnings_month>0 & hourly_wage>0 & weekly_hours>0
sum labor_earnings_month if employment_status==2 & year==2005 & age>17 & age<65 & lfs>0 & lfs==11 & labor_earnings_month>0 & hourly_wage>0 & weekly_hours>0
sum labor_earnings_month if employment_status==4 & year==2005 & age>17 & age<65 & lfs>0 & lfs==11 & labor_earnings_month>0 & hourly_wage>0 & weekly_hours>0


*Carrillo 3/43
cls
set more off
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*
keep if sample==21
*keep if sample==21 | sample==23
*
drop if lfs<0
*
gen labor_force=1 if lfs==11
replace labor_force=1 if lfs==6
replace labor_force=0 if lfs!=11 & lfs!=6 & lfs>0
*
bysort year: egen mean_labor_force=mean(labor_force)
*
sort year
*
quietly twoway line mean_labor_force year, ytitle({bf:Var[Earnings]}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(blue red green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014) xline(1975 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0 (0.2) 1, angle(horizontal))
graph export mean_labor_force_soep.png, replace


*Carrillo 3/43
cls
set more off
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_0.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*
*keep if sample==21 
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
replace tot_emp=1 if lfs!=1 & lfs!=6 & lfs!=8 & lfs!=9 & lfs!=10
*
tab employment_status if lfs!=1 & lfs!=6
gen full_time=0
replace full_time=1 if lfs!=1 & lfs!=6 & lfs!=8 & lfs!=9 & lfs!=10 & employment_status==1
*
bysort year: egen mean_labor_force=mean(labor_force)
bysort year: egen mean_tot_emp=mean(tot_emp)
bysort year: egen mean_full_time=mean(full_time)
*
sort year
label variable mean_labor_force "Labour Force" 
label variable mean_tot_emp "Total Employment" 
label variable mean_full_time "Full Time" 
*
quietly twoway line mean_labor_force mean_tot_emp year, ytitle({bf:Share of WAP}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(red blue green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.7 (0.05) 0.9, angle(horizontal))
graph export mean_labor_force_soep.png, replace

quietly twoway line mean_labor_force mean_tot_emp year if year>=1999, ytitle({bf:Share of WAP}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(red blue green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2015, angle(45)) xline(1999 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.7 (0.05) 0.9, angle(horizontal))
graph export mean_labor_force_soep_99.png, replace

quietly twoway line mean_tot_emp mean_full_time year, ytitle({bf:Share of WAP}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(dash shortdash longdash longdash_dot) lcolor(blue green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.4 (0.05) 0.8, angle(horizontal))
graph export mean_full_time_soep.png, replace

quietly twoway line mean_tot_emp mean_full_time year if year>=1999, ytitle({bf:Share of WAP}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(dash shortdash longdash longdash_dot) lcolor(blue green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2015, angle(45)) xline(1999 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.3 (0.1) 0.9, angle(horizontal))
graph export mean_full_time_soep_99.png, replace

***
gen marg_emp_rate=0 if tot_emp==1
replace marg_emp_rate=1 if tot_emp==1 & employment_status==4
tabstat marg_emp_rate, by(year) stat(mean n)

gen unemp_rate=0 if labor_force==1
replace unemp_rate=1 if labor_force==1 & lfs==6

bysort year: egen mean_marg_emp_rate=mean(marg_emp_rate)
bysort year: egen mean_unemp_rate=mean(unemp_rate)

label variable mean_marg_emp_rate "Marginal Employment Rate" 
label variable mean_unemp_rate "Unemployment Rate" 

quietly twoway line mean_marg_emp_rate mean_unemp_rate year, ytitle({bf:Rate}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.05 (0.01) 0.15, angle(horizontal))
graph export mean_marg_emp_soep.png, replace

quietly twoway line mean_marg_emp_rate mean_unemp_rate year if year>=1995, ytitle({bf:Rate}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1995 (5) 2015, angle(45)) xline(1995 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.02 (0.01) 0.15, angle(horizontal))
graph export mean_marg_emp_soep_95.png, replace


***males

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*
keep if female==0
*keep if sample==21 
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
replace tot_emp=1 if lfs!=1 & lfs!=6 & lfs!=8 & lfs!=9 & lfs!=10
*
tab employment_status if lfs!=1 & lfs!=6
gen full_time=0
replace full_time=1 if lfs!=1 & lfs!=6 & lfs!=8 & lfs!=9 & lfs!=10 & employment_status==1
*
bysort year: egen mean_labor_force=mean(labor_force)
bysort year: egen mean_tot_emp=mean(tot_emp)
bysort year: egen mean_full_time=mean(full_time)
*
sort year
label variable mean_labor_force "Labour Force" 
label variable mean_tot_emp "Total Employment" 
label variable mean_full_time "Full Time" 
*
quietly twoway line mean_labor_force mean_tot_emp year, ytitle({bf:Share of WAP}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(red blue green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.7 (0.05) 0.9, angle(horizontal))
graph export mean_labor_force_soep_male.png, replace

quietly twoway line mean_labor_force mean_tot_emp year if year>=1999, ytitle({bf:Share of WAP}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(red blue green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2015, angle(45)) xline(1999 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.7 (0.05) 0.9, angle(horizontal))
graph export mean_labor_force_soep_99_male.png, replace

quietly twoway line mean_tot_emp mean_full_time year, ytitle({bf:Share of WAP}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(dash shortdash longdash longdash_dot) lcolor(blue green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.4 (0.05) 0.8, angle(horizontal))
graph export mean_full_time_soep_male.png, replace

quietly twoway line mean_tot_emp mean_full_time year if year>=1999, ytitle({bf:Share of WAP}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(dash shortdash longdash longdash_dot) lcolor(blue green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2015, angle(45)) xline(1999 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.3 (0.1) 0.9, angle(horizontal))
graph export mean_full_time_soep_99_male.png, replace

***
gen marg_emp_rate=0 if tot_emp==1
replace marg_emp_rate=1 if tot_emp==1 & employment_status==4
tabstat marg_emp_rate, by(year) stat(mean n)

gen unemp_rate=0 if labor_force==1
replace unemp_rate=1 if labor_force==1 & lfs==6

bysort year: egen mean_marg_emp_rate=mean(marg_emp_rate)
bysort year: egen mean_unemp_rate=mean(unemp_rate)

label variable mean_marg_emp_rate "Marginal Employment Rate" 
label variable mean_unemp_rate "Unemployment Rate" 

quietly twoway line mean_marg_emp_rate mean_unemp_rate year, ytitle({bf:Rate}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.05 (0.01) 0.15, angle(horizontal))
graph export mean_marg_emp_soep_male.png, replace

quietly twoway line mean_marg_emp_rate mean_unemp_rate year if year>=1995, ytitle({bf:Rate}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1995 (5) 2015, angle(45)) xline(1995 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.02 (0.01) 0.15, angle(horizontal))
graph export mean_marg_emp_soep_99_male.png, replace


***females

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*
keep if female==1
*keep if sample==21 
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
replace tot_emp=1 if lfs!=1 & lfs!=6 & lfs!=8 & lfs!=9 & lfs!=10
*
tab employment_status if lfs!=1 & lfs!=6
gen full_time=0
replace full_time=1 if lfs!=1 & lfs!=6 & lfs!=8 & lfs!=9 & lfs!=10 & employment_status==1
*
bysort year: egen mean_labor_force=mean(labor_force)
bysort year: egen mean_tot_emp=mean(tot_emp)
bysort year: egen mean_full_time=mean(full_time)
*
sort year
label variable mean_labor_force "Labour Force" 
label variable mean_tot_emp "Total Employment" 
label variable mean_full_time "Full Time" 
*
quietly twoway line mean_labor_force mean_tot_emp year, ytitle({bf:Share of WAP}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(red blue green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.7 (0.05) 0.9, angle(horizontal))
graph export mean_labor_force_soep_fem.png, replace

quietly twoway line mean_labor_force mean_tot_emp year if year>=1999, ytitle({bf:Share of WAP}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(red blue green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2015, angle(45)) xline(1999 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.7 (0.05) 0.9, angle(horizontal))
graph export mean_labor_force_soep_99_fem.png, replace

quietly twoway line mean_tot_emp mean_full_time year, ytitle({bf:Share of WAP}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(dash shortdash longdash longdash_dot) lcolor(blue green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.4 (0.05) 0.8, angle(horizontal))
graph export mean_full_time_soep_fem.png, replace

quietly twoway line mean_tot_emp mean_full_time year if year>=1999, ytitle({bf:Share of WAP}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(dash shortdash longdash longdash_dot) lcolor(blue green orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2015, angle(45)) xline(1999 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.3 (0.1) 0.9, angle(horizontal))
graph export mean_full_time_soep_99_fem.png, replace

***
gen marg_emp_rate=0 if tot_emp==1
replace marg_emp_rate=1 if tot_emp==1 & employment_status==4
tabstat marg_emp_rate, by(year) stat(mean n)

gen unemp_rate=0 if labor_force==1
replace unemp_rate=1 if labor_force==1 & lfs==6

bysort year: egen mean_marg_emp_rate=mean(marg_emp_rate)
bysort year: egen mean_unemp_rate=mean(unemp_rate)

label variable mean_marg_emp_rate "Marginal Employment Rate" 
label variable mean_unemp_rate "Unemployment Rate" 

quietly twoway line mean_marg_emp_rate mean_unemp_rate year, ytitle({bf:Rate}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1984 (5) 2015) xline(1984 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.05 (0.01) 0.15, angle(horizontal))
graph export mean_marg_emp_soep_fem.png, replace

quietly twoway line mean_marg_emp_rate mean_unemp_rate year if year>=1995, ytitle({bf:Rate}, size(large) height(10)) legend(position(6) rows(1) on) lpattern(solid dash shortdash longdash longdash_dot) lcolor(orange magenta) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1995 (5) 2015, angle(45)) xline(1995 (5) 2015, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal)) ylabel(0.02 (0.01) 0.15, angle(horizontal))
graph export mean_marg_emp_soep_99_fem.png, replace



*Carrillo 36/43
cls
set more off
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\pgen_0.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
*
bysort persnr year: gen unemployed=1 if lfs==6
bysort persnr year: gen employed=1 if lfs==11
*generate flows
bysort persnr: gen flow=1 if unemployed[_n-1]==1 & employed==1
bysort persnr: replace flow=1 if unemployed[_n-1]==1 & lfs==1
*destination states
gen dest_full=0 if flow==1
gen dest_part=0 if flow==1
gen dest_mg=0 if flow==1
gen dest_nw=0 if flow==1
*
sort persnr year
bysort persnr: replace dest_full=1 if flow==1 & employed==1 & employment_status==1
bysort persnr: replace dest_part=1 if flow==1 & employed==1 & employment_status==2
bysort persnr: replace dest_mg=1 if flow==1 & employed==1 & employment_status==4
bysort persnr: replace dest_nw=1 if flow==1 & lfs==1
*gen means
bysort year: egen mean_dest_full=mean(dest_full)
bysort year: egen mean_dest_part=mean(dest_part)
bysort year: egen mean_dest_mg=mean(dest_mg)
bysort year: egen mean_dest_nw=mean(dest_nw)
*
label variable mean_dest_full "Full Time"
label variable mean_dest_part "Part Time"
label variable mean_dest_mg "Marginal Employment"
label variable mean_dest_nw "Non Working"
*
quietly twoway line mean_dest_full mean_dest_nw year if year>=1999, ytitle({bf:(%) Share}, size(large) height(5))legend(position(6) rows(1)) lcolor(black black green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.2 (0.05) 0.6, angle(horizontal))
graph export dest_states_unemp_full.png, replace

quietly twoway line mean_dest_part mean_dest_mg year if year>=1999, ytitle({bf:(%) Share}, size(large) height(5))legend(position(6) rows(1)) lcolor(black black green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.05) 0.25, angle(horizontal))
graph export dest_states_unemp_part.png, replace

*quietly twoway line mean_dest_mg year if year>=1999, ytitle({bf:(%) Share}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.2, angle(horizontal))
*graph export dest_states_unemp_mg.png, replace

*quietly twoway line mean_dest_nw year if year>=1999, ytitle({bf:(%) Share}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, angle(horizontal))
*graph export dest_states_unemp_nw.png, replace
