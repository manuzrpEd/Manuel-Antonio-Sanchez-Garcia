clear
set more off
set memory 16g
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_monthly.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

*bysort year: gen count_year=_n
*keep if count_year==1

label variable ave_hazard_rate_FTF "FT"
label variable ave_hazard_rate_PTF "FT"
label variable ave_hazard_rate_MTF "FT"
label variable ave_hazard_rate_UTF "FT"
label variable ave_hazard_rate_CTF "FT"

label variable ave_hazard_rate_FTP "PT"
label variable ave_hazard_rate_PTP "PT"
label variable ave_hazard_rate_MTP "PT"
label variable ave_hazard_rate_UTP "PT"
label variable ave_hazard_rate_CTP "PT"

label variable ave_hazard_rate_FTM "MJ"
label variable ave_hazard_rate_PTM "MJ"
label variable ave_hazard_rate_MTM "MJ"
label variable ave_hazard_rate_UTM "MJ"
label variable ave_hazard_rate_CTM "MJ"

label variable ave_hazard_rate_FTU "Unempl."
label variable ave_hazard_rate_PTU "Unempl."
label variable ave_hazard_rate_MTU "Unempl."
label variable ave_hazard_rate_CTU "Unempl."

label variable ave_hazard_rate_FTC "CJ"
label variable ave_hazard_rate_PTC "CJ"
label variable ave_hazard_rate_MTC "CJ"
label variable ave_hazard_rate_UTC "CJ"
label variable ave_hazard_rate_CTC "CJ"

label variable ave_year_FTF "FT"
label variable ave_year_PTF "FT"
label variable ave_year_MTF "FT"
label variable ave_year_UTF "FT"
label variable ave_year_CTF "FT"

label variable ave_year_FTP "PT"
label variable ave_year_PTP "PT"
label variable ave_year_MTP "PT"
label variable ave_year_UTP "PT"
label variable ave_year_CTP "PT"

label variable ave_year_FTM "MJ"
label variable ave_year_PTM "MJ"
label variable ave_year_MTM "MJ"
label variable ave_year_UTM "MJ"
label variable ave_year_CTM "MJ"

label variable ave_year_FTU "Unempl."
label variable ave_year_PTU "Unempl."
label variable ave_year_MTU "Unempl."
label variable ave_year_CTU "Unempl."

label variable ave_year_FTC "CJ"
label variable ave_year_PTC "CJ"
label variable ave_year_MTC "CJ"
label variable ave_year_UTC "CJ"
label variable ave_year_CTC "CJ"

replace ave_year_MTF=. if year<1999
replace ave_year_MTM=. if year<1999
replace ave_year_MTP=. if year<1999
replace ave_year_MTC=. if year<1999
replace ave_year_MTU=. if year<1999

replace ave_hazard_rate_MTF=. if year<1999
replace ave_hazard_rate_MTM=. if year<1999
replace ave_hazard_rate_MTP=. if year<1999
replace ave_hazard_rate_MTC=. if year<1999
replace ave_hazard_rate_MTU=. if year<1999

replace ave_hazard_rate_FTM=. if year<1999
replace ave_hazard_rate_CTM=. if year<1999
replace ave_hazard_rate_PTM=. if year<1999
replace ave_hazard_rate_UTM=. if year<1999

***Graphs
quietly twoway line ave_hazard_rate_FTF ave_hazard_rate_FTP ave_hazard_rate_FTM ave_hazard_rate_FTU ave_hazard_rate_FTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ft.png, replace

quietly twoway line ave_hazard_rate_PTF ave_hazard_rate_PTP ave_hazard_rate_PTM ave_hazard_rate_PTU ave_hazard_rate_PTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export pt.png, replace

quietly twoway line ave_hazard_rate_MTF ave_hazard_rate_MTP ave_hazard_rate_MTM ave_hazard_rate_MTU ave_hazard_rate_MTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mt.png, replace

quietly twoway line ave_hazard_rate_UTF ave_hazard_rate_UTP ave_hazard_rate_UTM ave_hazard_rate_UTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green magenta) legend(position(6) rows(1)) lpattern(solid dash longdash shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ut.png, replace

quietly twoway line ave_hazard_rate_CTF ave_hazard_rate_CTP ave_hazard_rate_CTM ave_hazard_rate_CTU ave_hazard_rate_CTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct.png, replace

quietly twoway line ave_year_FTF ave_year_FTP ave_year_FTM ave_year_FTU ave_year_FTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ft_flow.png, replace

quietly twoway line ave_year_PTF ave_year_PTP ave_year_PTM ave_year_PTU ave_year_PTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export pt_flow.png, replace

quietly twoway line ave_year_MTF ave_year_MTP ave_year_MTM ave_year_MTU ave_year_MTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mt_flow.png, replace

quietly twoway line ave_year_UTF ave_year_UTP ave_year_UTM ave_year_UTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green magenta) legend(position(6) rows(1)) lpattern(solid dash longdash shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ut_flow.png, replace

quietly twoway line ave_year_CTF ave_year_CTP ave_year_CTM ave_year_CTU ave_year_CTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct_flow.png, replace

***Graphs 99 on
quietly twoway line ave_hazard_rate_FTF ave_hazard_rate_FTP ave_hazard_rate_FTM ave_hazard_rate_FTU ave_hazard_rate_FTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ft_99.png, replace

quietly twoway line ave_hazard_rate_PTF ave_hazard_rate_PTP ave_hazard_rate_PTM ave_hazard_rate_PTU ave_hazard_rate_PTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export pt_99.png, replace

quietly twoway line ave_hazard_rate_MTF ave_hazard_rate_MTP ave_hazard_rate_MTM ave_hazard_rate_MTU ave_hazard_rate_MTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mt_99.png, replace

quietly twoway line ave_hazard_rate_UTF ave_hazard_rate_UTP ave_hazard_rate_UTM ave_hazard_rate_UTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green magenta) legend(position(6) rows(1)) lpattern(solid dash longdash shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ut_99.png, replace

quietly twoway line ave_hazard_rate_CTF ave_hazard_rate_CTP ave_hazard_rate_CTM ave_hazard_rate_CTU ave_hazard_rate_CTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct_99.png, replace

quietly twoway line ave_year_FTF ave_year_FTP ave_year_FTM ave_year_FTU ave_year_FTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ft_flow_99.png, replace

quietly twoway line ave_year_PTF ave_year_PTP ave_year_PTM ave_year_PTU ave_year_PTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export pt_flow_99.png, replace

quietly twoway line ave_year_MTF ave_year_MTP ave_year_MTM ave_year_MTU ave_year_MTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mt_flow_99.png, replace

quietly twoway line ave_year_UTF ave_year_UTP ave_year_UTM ave_year_UTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green magenta) legend(position(6) rows(1)) lpattern(solid dash longdash shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ut_flow_99.png, replace

quietly twoway line ave_year_CTF ave_year_CTP ave_year_CTM ave_year_CTU ave_year_CTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct_flow_99.png, replace

*
label variable ave_stock_FT "FT"
label variable ave_stock_PT "PT"
label variable ave_stock_MJ "MJ"
label variable ave_stock_Unemp "Unemp"
label variable ave_stock_CJ "CJ"

label variable ave_stock_FT_share "FT"
label variable ave_stock_PT_share "PT"
label variable ave_stock_MJ_share "MJ"
label variable ave_stock_Unemp_share "Unemp"
label variable ave_stock_CJ_share "CJ"

replace ave_stock_MJ_share=. if year<1999

quietly twoway line ave_stock_FT_share ave_stock_PT_share ave_stock_MJ_share ave_stock_Unemp_share ave_stock_CJ_share year, legend(position(6) rows(1)) lcolor(blue red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export stock.png, replace

*
label variable ave_tstock_FT "FT"
label variable ave_tstock_PT "PT"
label variable ave_tstock_MJ "MJ"
label variable ave_tstock_CJ "CJ"

label variable ave_tstock_FT_share "FT"
label variable ave_tstock_PT_share "PT"
label variable ave_tstock_MJ_share "MJ"
label variable ave_tstock_CJ_share "CJ"

replace ave_tstock_MJ_share=. if year<1999

quietly twoway line ave_tstock_FT_share ave_tstock_PT_share ave_tstock_MJ_share ave_tstock_CJ_share year, legend(position(6) rows(1)) lcolor(blue red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export tstock.png, replace

quietly twoway line ave_tstock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.8 (0.05) 1, labsize(large) angle(horizontal))
graph export tstock_FT.png, replace

quietly twoway line ave_tstock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_PT.png, replace

quietly twoway line ave_tstock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_MJ.png, replace

quietly twoway line ave_tstock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_CJ.png, replace

*


***

use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_monthly_fem.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

*bysort year: gen count_year=_n
*keep if count_year==1

label variable ave_hazard_rate_FTF "FT"
label variable ave_hazard_rate_PTF "FT"
label variable ave_hazard_rate_MTF "FT"
label variable ave_hazard_rate_UTF "FT"
label variable ave_hazard_rate_CTF "FT"

label variable ave_hazard_rate_FTP "PT"
label variable ave_hazard_rate_PTP "PT"
label variable ave_hazard_rate_MTP "PT"
label variable ave_hazard_rate_UTP "PT"
label variable ave_hazard_rate_CTP "PT"

label variable ave_hazard_rate_FTM "MJ"
label variable ave_hazard_rate_PTM "MJ"
label variable ave_hazard_rate_MTM "MJ"
label variable ave_hazard_rate_UTM "MJ"
label variable ave_hazard_rate_CTM "MJ"

label variable ave_hazard_rate_FTU "Unempl."
label variable ave_hazard_rate_PTU "Unempl."
label variable ave_hazard_rate_MTU "Unempl."
label variable ave_hazard_rate_CTU "Unempl."

label variable ave_hazard_rate_FTC "CJ"
label variable ave_hazard_rate_PTC "CJ"
label variable ave_hazard_rate_MTC "CJ"
label variable ave_hazard_rate_UTC "CJ"
label variable ave_hazard_rate_CTC "CJ"

label variable ave_year_FTF "FT"
label variable ave_year_PTF "FT"
label variable ave_year_MTF "FT"
label variable ave_year_UTF "FT"
label variable ave_year_CTF "FT"

label variable ave_year_FTP "PT"
label variable ave_year_PTP "PT"
label variable ave_year_MTP "PT"
label variable ave_year_UTP "PT"
label variable ave_year_CTP "PT"

label variable ave_year_FTM "MJ"
label variable ave_year_PTM "MJ"
label variable ave_year_MTM "MJ"
label variable ave_year_UTM "MJ"
label variable ave_year_CTM "MJ"

label variable ave_year_FTU "Unempl."
label variable ave_year_PTU "Unempl."
label variable ave_year_MTU "Unempl."
label variable ave_year_CTU "Unempl."

label variable ave_year_FTC "CJ"
label variable ave_year_PTC "CJ"
label variable ave_year_MTC "CJ"
label variable ave_year_UTC "CJ"
label variable ave_year_CTC "CJ"

replace ave_year_MTF=. if year<1999
replace ave_year_MTM=. if year<1999
replace ave_year_MTP=. if year<1999
replace ave_year_MTC=. if year<1999
replace ave_year_MTU=. if year<1999

replace ave_hazard_rate_MTF=. if year<1999
replace ave_hazard_rate_MTM=. if year<1999
replace ave_hazard_rate_MTP=. if year<1999
replace ave_hazard_rate_MTC=. if year<1999
replace ave_hazard_rate_MTU=. if year<1999

replace ave_hazard_rate_FTM=. if year<1999
replace ave_hazard_rate_CTM=. if year<1999
replace ave_hazard_rate_PTM=. if year<1999
replace ave_hazard_rate_UTM=. if year<1999

***Graphs
quietly twoway line ave_hazard_rate_FTF ave_hazard_rate_FTP ave_hazard_rate_FTM ave_hazard_rate_FTU ave_hazard_rate_FTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ft_fem.png, replace

quietly twoway line ave_hazard_rate_PTF ave_hazard_rate_PTP ave_hazard_rate_PTM ave_hazard_rate_PTU ave_hazard_rate_PTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export pt_fem.png, replace

quietly twoway line ave_hazard_rate_MTF ave_hazard_rate_MTP ave_hazard_rate_MTM ave_hazard_rate_MTU ave_hazard_rate_MTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mt_fem.png, replace

quietly twoway line ave_hazard_rate_UTF ave_hazard_rate_UTP ave_hazard_rate_UTM ave_hazard_rate_UTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green magenta) legend(position(6) rows(1)) lpattern(solid dash longdash shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ut_fem.png, replace

quietly twoway line ave_hazard_rate_CTF ave_hazard_rate_CTP ave_hazard_rate_CTM ave_hazard_rate_CTU ave_hazard_rate_CTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct_fem.png, replace

quietly twoway line ave_year_FTF ave_year_FTP ave_year_FTM ave_year_FTU ave_year_FTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ft_flow_fem.png, replace

quietly twoway line ave_year_PTF ave_year_PTP ave_year_PTM ave_year_PTU ave_year_PTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export pt_flow_fem.png, replace

quietly twoway line ave_year_MTF ave_year_MTP ave_year_MTM ave_year_MTU ave_year_MTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mt_flow_fem.png, replace

quietly twoway line ave_year_UTF ave_year_UTP ave_year_UTM ave_year_UTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green magenta) legend(position(6) rows(1)) lpattern(solid dash longdash shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ut_flow_fem.png, replace

quietly twoway line ave_year_CTF ave_year_CTP ave_year_CTM ave_year_CTU ave_year_CTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct_flow_fem.png, replace

***Graphs 99 on
quietly twoway line ave_hazard_rate_FTF ave_hazard_rate_FTP ave_hazard_rate_FTM ave_hazard_rate_FTU ave_hazard_rate_FTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ft_99_fem.png, replace

quietly twoway line ave_hazard_rate_PTF ave_hazard_rate_PTP ave_hazard_rate_PTM ave_hazard_rate_PTU ave_hazard_rate_PTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export pt_99_fem.png, replace

quietly twoway line ave_hazard_rate_MTF ave_hazard_rate_MTP ave_hazard_rate_MTM ave_hazard_rate_MTU ave_hazard_rate_MTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mt_99_fem.png, replace

quietly twoway line ave_hazard_rate_UTF ave_hazard_rate_UTP ave_hazard_rate_UTM ave_hazard_rate_UTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green magenta) legend(position(6) rows(1)) lpattern(solid dash longdash shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ut_99_fem.png, replace

quietly twoway line ave_hazard_rate_CTF ave_hazard_rate_CTP ave_hazard_rate_CTM ave_hazard_rate_CTU ave_hazard_rate_CTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct_99_fem.png, replace

quietly twoway line ave_year_FTF ave_year_FTP ave_year_FTM ave_year_FTU ave_year_FTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ft_flow_99_fem.png, replace

quietly twoway line ave_year_PTF ave_year_PTP ave_year_PTM ave_year_PTU ave_year_PTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export pt_flow_99_fem.png, replace

quietly twoway line ave_year_MTF ave_year_MTP ave_year_MTM ave_year_MTU ave_year_MTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mt_flow_99_fem.png, replace

quietly twoway line ave_year_UTF ave_year_UTP ave_year_UTM ave_year_UTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green magenta) legend(position(6) rows(1)) lpattern(solid dash longdash shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ut_flow_99_fem.png, replace

quietly twoway line ave_year_CTF ave_year_CTP ave_year_CTM ave_year_CTU ave_year_CTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct_flow_99_fem.png, replace


***
*
label variable ave_stock_FT "FT"
label variable ave_stock_PT "PT"
label variable ave_stock_MJ "MJ"
label variable ave_stock_Unemp "Unemp"
label variable ave_stock_CJ "CJ"

label variable ave_stock_FT_share "FT"
label variable ave_stock_PT_share "PT"
label variable ave_stock_MJ_share "MJ"
label variable ave_stock_Unemp_share "Unemp"
label variable ave_stock_CJ_share "CJ"

replace ave_stock_MJ_share=. if year<1999

quietly twoway line ave_stock_FT_share ave_stock_PT_share ave_stock_MJ_share ave_stock_Unemp_share ave_stock_CJ_share year, legend(position(6) rows(1)) lcolor(blue red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export stock_fem.png, replace

*
label variable ave_tstock_FT "FT"
label variable ave_tstock_PT "PT"
label variable ave_tstock_MJ "MJ"
label variable ave_tstock_CJ "CJ"

label variable ave_tstock_FT_share "FT"
label variable ave_tstock_PT_share "PT"
label variable ave_tstock_MJ_share "MJ"
label variable ave_tstock_CJ_share "CJ"

replace ave_tstock_MJ_share=. if year<1999

quietly twoway line ave_tstock_FT_share ave_tstock_PT_share ave_tstock_MJ_share ave_tstock_CJ_share year, legend(position(6) rows(1)) lcolor(blue red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export tstock_fem.png, replace

quietly twoway line ave_tstock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.5 (0.05) 0.7, labsize(large) angle(horizontal))
graph export tstock_FT_fem.png, replace

quietly twoway line ave_tstock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.20 (0.05) 0.35, labsize(large) angle(horizontal))
graph export tstock_PT_fem.png, replace

quietly twoway line ave_tstock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.05 (0.05) 0.2, labsize(large) angle(horizontal))
graph export tstock_MJ_fem.png, replace

quietly twoway line ave_tstock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_CJ_fem.png, replace

*

***unc
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_monthly_unc.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"

*bysort year: gen count_year=_n
*keep if count_year==1

label variable ave_hazard_rate_FTF "FT"
label variable ave_hazard_rate_PTF "FT"
label variable ave_hazard_rate_MTF "FT"
label variable ave_hazard_rate_UTF "FT"
label variable ave_hazard_rate_CTF "FT"

label variable ave_hazard_rate_FTP "PT"
label variable ave_hazard_rate_PTP "PT"
label variable ave_hazard_rate_MTP "PT"
label variable ave_hazard_rate_UTP "PT"
label variable ave_hazard_rate_CTP "PT"

label variable ave_hazard_rate_FTM "MJ"
label variable ave_hazard_rate_PTM "MJ"
label variable ave_hazard_rate_MTM "MJ"
label variable ave_hazard_rate_UTM "MJ"
label variable ave_hazard_rate_CTM "MJ"

label variable ave_hazard_rate_FTU "Unempl."
label variable ave_hazard_rate_PTU "Unempl."
label variable ave_hazard_rate_MTU "Unempl."
label variable ave_hazard_rate_CTU "Unempl."

label variable ave_hazard_rate_FTC "CJ"
label variable ave_hazard_rate_PTC "CJ"
label variable ave_hazard_rate_MTC "CJ"
label variable ave_hazard_rate_UTC "CJ"
label variable ave_hazard_rate_CTC "CJ"

label variable ave_year_FTF "FT"
label variable ave_year_PTF "FT"
label variable ave_year_MTF "FT"
label variable ave_year_UTF "FT"
label variable ave_year_CTF "FT"

label variable ave_year_FTP "PT"
label variable ave_year_PTP "PT"
label variable ave_year_MTP "PT"
label variable ave_year_UTP "PT"
label variable ave_year_CTP "PT"

label variable ave_year_FTM "MJ"
label variable ave_year_PTM "MJ"
label variable ave_year_MTM "MJ"
label variable ave_year_UTM "MJ"
label variable ave_year_CTM "MJ"

label variable ave_year_FTU "Unempl."
label variable ave_year_PTU "Unempl."
label variable ave_year_MTU "Unempl."
label variable ave_year_CTU "Unempl."

label variable ave_year_FTC "CJ"
label variable ave_year_PTC "CJ"
label variable ave_year_MTC "CJ"
label variable ave_year_UTC "CJ"
label variable ave_year_CTC "CJ"

replace ave_year_MTF=. if year<1999
replace ave_year_MTM=. if year<1999
replace ave_year_MTP=. if year<1999
replace ave_year_MTC=. if year<1999
replace ave_year_MTU=. if year<1999

replace ave_hazard_rate_MTF=. if year<1999
replace ave_hazard_rate_MTM=. if year<1999
replace ave_hazard_rate_MTP=. if year<1999
replace ave_hazard_rate_MTC=. if year<1999
replace ave_hazard_rate_MTU=. if year<1999

replace ave_hazard_rate_FTM=. if year<1999
replace ave_hazard_rate_CTM=. if year<1999
replace ave_hazard_rate_PTM=. if year<1999
replace ave_hazard_rate_UTM=. if year<1999

***Graphs
quietly twoway line ave_hazard_rate_FTF ave_hazard_rate_FTP ave_hazard_rate_FTM ave_hazard_rate_FTU ave_hazard_rate_FTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ft_unc.png, replace

quietly twoway line ave_hazard_rate_PTF ave_hazard_rate_PTP ave_hazard_rate_PTM ave_hazard_rate_PTU ave_hazard_rate_PTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export pt_unc.png, replace

quietly twoway line ave_hazard_rate_MTF ave_hazard_rate_MTP ave_hazard_rate_MTM ave_hazard_rate_MTU ave_hazard_rate_MTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mt_unc.png, replace

quietly twoway line ave_hazard_rate_UTF ave_hazard_rate_UTP ave_hazard_rate_UTM ave_hazard_rate_UTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green magenta) legend(position(6) rows(1)) lpattern(solid dash longdash shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ut_unc.png, replace

quietly twoway line ave_hazard_rate_CTF ave_hazard_rate_CTP ave_hazard_rate_CTM ave_hazard_rate_CTU ave_hazard_rate_CTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct_unc.png, replace

quietly twoway line ave_year_FTF ave_year_FTP ave_year_FTM ave_year_FTU ave_year_FTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ft_flow_unc.png, replace

quietly twoway line ave_year_PTF ave_year_PTP ave_year_PTM ave_year_PTU ave_year_PTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export pt_flow_unc.png, replace

quietly twoway line ave_year_MTF ave_year_MTP ave_year_MTM ave_year_MTU ave_year_MTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mt_flow_unc.png, replace

quietly twoway line ave_year_UTF ave_year_UTP ave_year_UTM ave_year_UTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green magenta) legend(position(6) rows(1)) lpattern(solid dash longdash shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ut_flow_unc.png, replace

quietly twoway line ave_year_CTF ave_year_CTP ave_year_CTM ave_year_CTU ave_year_CTC year, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct_flow_unc.png, replace

***Graphs 99 on
quietly twoway line ave_hazard_rate_FTF ave_hazard_rate_FTP ave_hazard_rate_FTM ave_hazard_rate_FTU ave_hazard_rate_FTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ft_99_unc.png, replace

quietly twoway line ave_hazard_rate_PTF ave_hazard_rate_PTP ave_hazard_rate_PTM ave_hazard_rate_PTU ave_hazard_rate_PTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export pt_99_unc.png, replace

quietly twoway line ave_hazard_rate_MTF ave_hazard_rate_MTP ave_hazard_rate_MTM ave_hazard_rate_MTU ave_hazard_rate_MTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mt_99_unc.png, replace

quietly twoway line ave_hazard_rate_UTF ave_hazard_rate_UTP ave_hazard_rate_UTM ave_hazard_rate_UTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green magenta) legend(position(6) rows(1)) lpattern(solid dash longdash shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ut_99_unc.png, replace

quietly twoway line ave_hazard_rate_CTF ave_hazard_rate_CTP ave_hazard_rate_CTM ave_hazard_rate_CTU ave_hazard_rate_CTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct_99_unc.png, replace

quietly twoway line ave_year_FTF ave_year_FTP ave_year_FTM ave_year_FTU ave_year_FTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ft_flow_99_unc.png, replace

quietly twoway line ave_year_PTF ave_year_PTP ave_year_PTM ave_year_PTU ave_year_PTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export pt_flow_99_unc.png, replace

quietly twoway line ave_year_MTF ave_year_MTP ave_year_MTM ave_year_MTU ave_year_MTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export mt_flow_99_unc.png, replace

quietly twoway line ave_year_UTF ave_year_UTP ave_year_UTM ave_year_UTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green magenta) legend(position(6) rows(1)) lpattern(solid dash longdash shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ut_flow_99_unc.png, replace

quietly twoway line ave_year_CTF ave_year_CTP ave_year_CTM ave_year_CTU ave_year_CTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct_flow_99_unc.png, replace


***
*
label variable ave_stock_FT "FT"
label variable ave_stock_PT "PT"
label variable ave_stock_MJ "MJ"
label variable ave_stock_Unemp "Unemp"
label variable ave_stock_CJ "CJ"

label variable ave_stock_FT_share "FT"
label variable ave_stock_PT_share "PT"
label variable ave_stock_MJ_share "MJ"
label variable ave_stock_Unemp_share "Unemp"
label variable ave_stock_CJ_share "CJ"

replace ave_stock_MJ_share=. if year<1999

quietly twoway line ave_stock_FT_share ave_stock_PT_share ave_stock_MJ_share ave_stock_Unemp_share ave_stock_CJ_share year, legend(position(6) rows(1)) lcolor(blue red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export stock_unc.png, replace

*
label variable ave_tstock_FT "FT"
label variable ave_tstock_PT "PT"
label variable ave_tstock_MJ "MJ"
label variable ave_tstock_CJ "CJ"

label variable ave_tstock_FT_share "FT"
label variable ave_tstock_PT_share "PT"
label variable ave_tstock_MJ_share "MJ"
label variable ave_tstock_CJ_share "CJ"

replace ave_tstock_MJ_share=. if year<1999

quietly twoway line ave_tstock_FT_share ave_tstock_PT_share ave_tstock_MJ_share ave_tstock_CJ_share year, legend(position(6) rows(1)) lcolor(blue red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1975 (5) 2014, labsize(large)) xline(1975 (5) 2014, lstyle(grid)) xline(1999, lpattern(dash) lcolor(black)) graphregion(color(white)) ylabel(0 (0.2) 1, labsize(large) angle(horizontal))
graph export tstock_unc.png, replace

quietly twoway line ave_tstock_FT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.6 (0.05) 0.9, labsize(large) angle(horizontal))
graph export tstock_FT_unc.png, replace

quietly twoway line ave_tstock_PT_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0.1 (0.02) 0.2, labsize(large) angle(horizontal))
graph export tstock_PT_unc.png, replace

quietly twoway line ave_tstock_MJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5)) legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_MJ_unc.png, replace

quietly twoway line ave_tstock_CJ_share year if year>=1999, ytitle({bf:(%) Employment}, size(large) height(5))legend(position(6) rows(1)) lcolor(black red green orange magenta) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (5) 2014, labsize(large)) xline(1999 (5) 2014, lstyle(grid)) graphregion(color(white)) ylabel(0 (0.02) 0.1, labsize(large) angle(horizontal))
graph export tstock_CJ_unc.png, replace

***concurrent influx

label variable ave_year_FTC "FT"
label variable ave_year_PTC "PT"
label variable ave_year_MTC "MJ"
label variable ave_year_CTC "CJ"

label variable ave_year_CTF "FT"
label variable ave_year_CTP "PT"
label variable ave_year_MTC "MJ"

quietly twoway line ave_year_FTC ave_year_PTC ave_year_MTC ave_year_CTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct_influx_flow_99_unc.png, replace

quietly twoway line ave_year_CTF ave_year_CTP ave_year_CTM year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct_outflux_flow_99_unc.png, replace

quietly twoway line ave_hazard_rate_CTF ave_hazard_rate_CTP ave_hazard_rate_CTM ave_hazard_rate_CTC year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green orange magenta) legend(position(6) rows(1)) lpattern(solid dash longdash dash_dot shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ct_99_unc_hazard.png, replace

quietly twoway line ave_hazard_rate_UTF ave_hazard_rate_UTP ave_hazard_rate_UTM year if year>=1999, ytitle({bf:Fraction}, size(large) height(5)) lcolor(blue red green magenta) legend(position(6) rows(1)) lpattern(solid dash longdash shortdash) lwidth(medthick medthick medthick medthick medthick) xtitle({bf:Year}, size(large) height(7))  connect(l) xlabel(1999 (1) 2014, labsize(large) angle(45)) xline(1999 (1) 2014, lstyle(grid)) graphregion(color(white)) ylabel(, labsize(large) angle(horizontal))
graph export ut_99_unc_hazard.png, replace

*

*Galasi:
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months_unc.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort persnr year month_begepi

bysort persnr year month_begepi: gen monthly_earnings=days_full*def_daily_wage if FT==1
bysort persnr year month_begepi: replace monthly_earnings=days_part*def_daily_wage if PT==1
bysort persnr year month_begepi: replace monthly_earnings=days_mini*def_daily_wage if MJ==1

twoway (kdensity monthly_earnings if year==2002, xline(325, lpattern(dash) lwidth(medthick) lcolor(blue)) lwidth(medthick) range(0 1600) lcolor(blue)) (kdensity monthly_earnings if year==2005, xline(400, lpattern(dash) lwidth(medthick) lcolor(red)) lwidth(medthick) range(0 1600) lcolor(red)),    legend(position(6) rows(1))  xtitle({bf:Euros/Month}, size(large) height(7))  legend(lab(1 "2002") lab(2 "2005")) graphregion(color(white)) ytitle({bf:Density}, size(large) height(7)) ylabel(, nogrid noticks nolabels) xlabel(0 (400) 1600, labsize(large))
graph export kdens_monthly_earnings_unc.png, replace

*Galasi:
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort persnr year month_begepi

bysort persnr year month_begepi: gen monthly_earnings=days_full*def_daily_wage if FT==1
bysort persnr year month_begepi: replace monthly_earnings=days_part*def_daily_wage if PT==1
bysort persnr year month_begepi: replace monthly_earnings=days_mini*def_daily_wage if MJ==1

twoway (kdensity monthly_earnings if year==2002, xline(325, lpattern(dash) lwidth(medthick) lcolor(blue)) lwidth(medthick) range(0 1600) lcolor(blue)) (kdensity monthly_earnings if year==2005, xline(400, lpattern(dash) lwidth(medthick) lcolor(red)) lwidth(medthick) range(0 1600) lcolor(red)),    legend(position(6) rows(1))  xtitle({bf:Euros/Month}, size(large) height(7))  legend(lab(1 "2002") lab(2 "2005")) graphregion(color(white)) ytitle({bf:Density}, size(large) height(7)) ylabel(, nogrid noticks nolabels) xlabel(0 (400) 1600, labsize(large))
graph export kdens_monthly_earnings.png, replace

*Galasi:
use "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes\Preliminars_months_fem.dta", clear
cd "C:\Users\manuz\Desktop\RSIAB7514\EarningsDynamics&Institutions\Codes"
sort persnr year month_begepi

bysort persnr year month_begepi: gen monthly_earnings=days_full*def_daily_wage if FT==1
bysort persnr year month_begepi: replace monthly_earnings=days_part*def_daily_wage if PT==1
bysort persnr year month_begepi: replace monthly_earnings=days_mini*def_daily_wage if MJ==1

twoway (kdensity monthly_earnings if year==2002, xline(325, lpattern(dash) lwidth(medthick) lcolor(blue)) lwidth(medthick) range(0 1600) lcolor(blue)) (kdensity monthly_earnings if year==2005, xline(400, lpattern(dash) lwidth(medthick) lcolor(red)) lwidth(medthick) range(0 1600) lcolor(red)),    legend(position(6) rows(1))  xtitle({bf:Euros/Month}, size(large) height(7))  legend(lab(1 "2002") lab(2 "2005")) graphregion(color(white)) ytitle({bf:Density}, size(large) height(7)) ylabel(, nogrid noticks nolabels) xlabel(0 (400) 1600, labsize(large))
graph export kdens_monthly_earnings_fem.png, replace
