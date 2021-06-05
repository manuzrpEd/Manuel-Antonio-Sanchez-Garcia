* Set working directory
set more off
cd "PATH"


*********************************************************************

use "PATH\P1.dta", clear
quietly do labels_P.do 

*Keep main household respondant
keep if ra0100==1
/*
RA0100 relationship to reference person
THERE IS NO SUCH QUESTION IN THE QUESTIONNAIRE. INFORMATION TO BE COMPLETED FROM THE HOUSEHOLD SCREENER.
Reference unit: All household members
Reference period: Current
Coding:
1 - Reference person (RP)
2 - Spouse or Partner of RP
3 - Son/daughter of RP
4 - Parent of RP
5 - Parent in law of RP
6 - Grandparent of RP
7 - Grandchild of RP
8 - Brother/sister of RP
9 - Another relative of RP
*/
merge  1:1 sa0010 sa0100  using D1.dta /* HH number and country*/
quietly do labels_D.do 
keep if sa0100=="DE" /* only German */


preserve
keep if ra0300_b<7 /* age brackets . This doesnt have implications...*/
/*
tab ra0300_b

   RA0300_B |
      age - |
   brackets |      Freq.     Percent        Cum.
------------+-----------------------------------
          4 |        714        1.14        1.14
          5 |      1,731        2.77        3.91
          6 |      2,729        4.36        8.28
          7 |      3,673        5.87       14.15
          8 |      4,515        7.22       21.37
          9 |      5,715        9.14       30.51
         10 |      6,285       10.05       40.57
         11 |      6,283       10.05       50.61
         12 |      6,257       10.01       60.62
         13 |      6,629       10.60       71.23
         14 |      5,168        8.27       79.49
         15 |      4,753        7.60       87.09
         16 |      3,801        6.08       93.17
         17 |      2,642        4.23       97.40
         18 |      1,626        2.60      100.00
------------+-----------------------------------
      Total |     62,521      100.00
Age is top-coded at 85.
A twin variable RA0300_B contains age coded in the following brackets:
0-6 =>1, 7-13 =>2, 14-15 =>3, 16-19=>4, 20-24 =>5, 25-29 =>6, 30-34 =>7, 35-39 =>8, 40-44 =>9, 45-49 =>10, 50-54 =>11, 55-59 =>12, 60-64 =>13, 65-69 =>14, 70-74 =>15, 75-79 =>16, 80-84 =>17, 85+ =>18.
*/
keep dn3001 pg0110 /* net wealth - gross cash income employee*/
sort dn3001
keep if pg0110>500
gen wealthInc=dn3001/pg0110
sort wealthInc
restore

****** Wealth Germany
keep if ra0200==1 /* gender;  */
/*
RA0200 |
     gender |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     35,078       56.11       56.11
          2 |     27,443       43.89      100.00
------------+-----------------------------------
      Total |     62,521      100.00
Coding:
1 - Male
2 - Female
*/
keep if pe0100a==1
/*
tab pe0100a

    PE0100a |
     labour |
 status a - |
MAIN labour |
     status |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     31,464       50.33       50.33
          2 |        264        0.42       50.75
          3 |      3,269        5.23       55.98
          4 |      1,444        2.31       58.29
          5 |     20,820       33.30       91.59
          6 |      1,064        1.70       93.29
          7 |         45        0.07       93.36
          8 |      3,656        5.85       99.21
          9 |        495        0.79      100.00
------------+-----------------------------------
      Total |     62,521      100.00
Coding:
1 - Doing regular work for pay / self-employed/working in family business . Need to drop self employment (next)!
2 - On sick/maternity/other leave (except holidays), planning to return to work
3 - Unemployed
4 - Student/pupil/unpaid intern
5 - Retiree or early retiree
6 - Permanently disabled
7 - Compulsory military service or equivalent social service
8 - Fulfilling domestic tasks
9 - Other not working for pay (specify)
*/
keep if pe0200==1
/*
tab pe0200

     PE0200 |
  status in |
 employment |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     24,429       77.50       77.50
          2 |      2,689        8.53       86.03
          3 |      4,321       13.71       99.74
          4 |         81        0.26      100.00
------------+-----------------------------------
      Total |     31,520      100.00
Coding:
1 - Employee
2 - Self-employed - with employees
3 - Self-employed - without employees
4 - Unpaid family worker
*/
keep if pg0110>(90*5)/4 /* gross cash employee income I think the restriction should be 30 days * 5 Euros = 150*/
*Felix says: we should probably restict to earnings>(90*5)/4 (earnings are reported quarterly)
keep if ra0300_b>5
keep if ra0300_b<12 /* Wave 1 definitions!*/
*keep if ra0300_b>24
*keep if ra0300_b<55 /* Wave 2 definitions!*/
/*
tab ra0300_b

   RA0300_B |
      age - |
   brackets |      Freq.     Percent        Cum.
------------+-----------------------------------
          4 |        714        1.14        1.14
          5 |      1,731        2.77        3.91
          6 |      2,729        4.36        8.28
          7 |      3,673        5.87       14.15
          8 |      4,515        7.22       21.37
          9 |      5,715        9.14       30.51
         10 |      6,285       10.05       40.57
         11 |      6,283       10.05       50.61
         12 |      6,257       10.01       60.62
         13 |      6,629       10.60       71.23
         14 |      5,168        8.27       79.49
         15 |      4,753        7.60       87.09
         16 |      3,801        6.08       93.17
         17 |      2,642        4.23       97.40
         18 |      1,626        2.60      100.00
------------+-----------------------------------
      Total |     62,521      100.00
Age is top-coded at 85.
A twin variable RA0300_B contains age coded in the following brackets:
0-6 =>1, 7-13 =>2, 14-15 =>3, 16-19=>4, 20-24 =>5, 25-29 =>6, 30-34 =>7, 35-39 =>8, 40-44 =>9, 45-49 =>10, 50-54 =>11, 55-59 =>12, 60-64 =>13, 65-69 =>14, 70-74 =>15, 75-79 =>16, 80-84 =>17, 85+ =>18.
*/

*life-cycle: ??? This is too large. I wonder if more restrictions are needed. Marginal Employment? Long Attachment?
preserve
sort ra0300_b /* age*/
by ra0300_b: egen p99 = pctile(pg0110), p(99) /* cash employee earnings*/
by ra0300_b: egen p90 = pctile(pg0110), p(90)
by ra0300_b: egen p50 = pctile(pg0110), p(50)
by ra0300_b: egen p10 = pctile(pg0110), p(10)
collapse (median) p99 p90 p50 p10, by(ra0300_b)
gen p99_50_1 = p99/p50
gen p90_50_1 = p90/p50
gen p50_10_1 = p50/p10
by ra0300_b: sum p99_50_1 p90_50_1 p50_10_1
*
keep p99_50_1 p90_50_1 p50_10_1 ra0300_b
save lc_perc_earnings_1.dta, replace
*
restore

*life-cycle: 
preserve
keep ra0300_b dn3001
save Felix_1.dta, replace
restore
preserve
sort ra0300_b /* age*/
by ra0300_b: egen p99 = pctile(dn3001), p(99) /* wealth*/
by ra0300_b: egen p90 = pctile(dn3001), p(90)
by ra0300_b: egen p50 = pctile(dn3001), p(50)
by ra0300_b: egen p20 = pctile(dn3001), p(20)
by ra0300_b: egen tot_wealth=total(dn3001)
by ra0300_b: egen tot_wealth_ab90=total(dn3001) if dn3001>=p90
by ra0300_b: egen tot_wealth_ab99=total(dn3001) if dn3001>=p99
collapse (median) p99 p90 p50 p20 tot_wealth_ab90 tot_wealth_ab99 tot_wealth, by(ra0300_b)
gen p99_50_1 = p99/p50
gen p90_50_1 = p90/p50
gen p50_20_1 = p50/p20
g share_wealth_ab90_1=tot_wealth_ab90/tot_wealth
g share_wealth_ab99_1=tot_wealth_ab90/tot_wealth
by ra0300_b: sum p99_50_1 p90_50_1 p50_20_1 share_wealth_ab90_1 share_wealth_ab99_1
*
keep p99_50_1 p90_50_1 p50_20_1 share_wealth_ab90_1 share_wealth_ab99_1 ra0300_b
save lc_perc_net_wealth_1.dta, replace
*
restore

ssc install ineqdeco
preserve
keep if dn3001>0 /* net wealth*/
ineqdeco dn3001, by(ra0300_b)
gen lw = log(dn3001)
sort ra0300_b
by ra0300_b: egen varlw = sd(lw)
replace varlw = varlw^2
collapse (median) varlw, by(ra0300_b)
restore

*cross section
tabstat dn3001, statistics( median ) by(ra0300_b)
ineqdeco dn3001

preserve
egen p99 = pctile(dn3001), p(99)
egen p95 = pctile(dn3001), p(95)
egen p50 = pctile(dn3001), p(50)

gen prct = 0
replace prct = 99 if dn3001>=p99
replace prct = 95 if dn3001>=p95 & dn3001<p99
replace prct = 75 if dn3001>=p50 & dn3001<p95
replace prct = 50 if dn3001<p50

collapse (sum) dn3001 (median) p99 p95 p50, by(prct)
egen total_wealth = sum(dn3001)
gen share_wealth = dn3001/total_wealth
restore

preserve
keep if pg0110>(90*5)/4
g log_earn_1=log(pg0110)
collapse (sd) log_earn_1
g common=1
save cs_ineq_earn_1.dta, replace
restore


****** Wealth income ratio Germany
keep if pg0110>(90*5)/4
gen wealthInc_1=dn3001/pg0110
tabstat wealthInc_1, statistics( median ) by(ra0300_b)
*
keep wealthInc_1 ra0300_b
collapse (median) wealthInc_1, by(ra0300_b)
save cs_ineq_net_wealth_1.dta, replace
*
*gen wealthInc2=dn3001/di2000
*tabstat wealthInc2, statistics( median ) by(ra0300_b)
*tabstat pg0110 di2000, statistics( median ) by(ra0300_b)



*********************************************************************
use "PATH\P2.dta", clear
quietly do labels_P.do 

*Keep main household respondant
keep if ra0100==1
merge  1:1 sa0010 sa0100  using D2.dta
quietly do labels_D.do 
keep if sa0100=="DE"

****** Wealth Germany
keep if ra0200==1
keep if pe0100a==1
keep if pe0200==1
keep if pg0110>(90*5)/4
keep if ra0300_b>5
keep if ra0300_b<12 /* Wave 1 definitions!*/
*keep if ra0300_b>24
*keep if ra0300_b<55 /* Wave 2 definitions!*/

*life-cycle
preserve
keep ra0300_b dn3001
save Felix_2.dta, replace
restore
preserve
sort ra0300_b
by ra0300_b: egen p99 = pctile(dn3001), p(99)
by ra0300_b: egen p90 = pctile(dn3001), p(90)
by ra0300_b: egen p50 = pctile(dn3001), p(50)
by ra0300_b: egen p20 = pctile(dn3001), p(20)
by ra0300_b: egen tot_wealth=total(dn3001)
by ra0300_b: egen tot_wealth_ab90=total(dn3001) if dn3001>=p90
by ra0300_b: egen tot_wealth_ab99=total(dn3001) if dn3001>=p99
collapse (median) p99 p90 p50 p20 tot_wealth_ab90 tot_wealth_ab99 tot_wealth, by(ra0300_b)
gen p99_50_2 = p99/p50
gen p90_50_2 = p90/p50
gen p50_20_2 = p50/p20
g share_wealth_ab90_2=tot_wealth_ab90/tot_wealth
g share_wealth_ab99_2=tot_wealth_ab99/tot_wealth
by ra0300_b: sum p99_50_2 p90_50_2 p50_20_2 share_wealth_ab90_2 share_wealth_ab99_2
*
keep p99_50_2 p90_50_2 p50_20_2 share_wealth_ab90_2 share_wealth_ab99_2 ra0300_b
save lc_perc_net_wealth_2.dta, replace
*
restore

preserve
sort ra0300_b /* age*/
by ra0300_b: egen p99 = pctile(pg0110), p(99) /* cash income employee*/
by ra0300_b: egen p90 = pctile(pg0110), p(90)
by ra0300_b: egen p50 = pctile(pg0110), p(50)
by ra0300_b: egen p10 = pctile(pg0110), p(10)
collapse (median) p99 p90 p50 p10, by(ra0300_b)
gen p99_50_2 = p99/p50
gen p90_50_2 = p90/p50
gen p50_10_2 = p50/p10
by ra0300_b: sum p99_50_2 p90_50_2 p50_10_2
*
keep p99_50_2 p90_50_2 p50_10_2 ra0300_b
save lc_perc_earnings_2.dta, replace
*
restore


preserve
keep if dn3001>0
ineqdeco dn3001, by(ra0300_b)
gen lw = log(dn3001)
sort ra0300_b
by ra0300_b: egen varlw = sd(lw)
replace varlw = varlw^2
collapse (median) varlw, by(ra0300_b)
restore


*cross section
tabstat dn3001, statistics( median ) by(ra0300_b)
ineqdeco dn3001


preserve
egen p99 = pctile(dn3001), p(99)
egen p95 = pctile(dn3001), p(95)
egen p50 = pctile(dn3001), p(50)

gen prct = 0
replace prct = 99 if dn3001>=p99
replace prct = 95 if dn3001>=p95 & dn3001<p99
replace prct = 75 if dn3001>=p50 & dn3001<p95
replace prct = 50 if dn3001<p50

collapse (sum) dn3001 (median) p99 p95 p50, by(prct)
egen total_wealth = sum(dn3001)
gen share_wealth = dn3001/total_wealth
restore

preserve
keep if pg0110>(90*5)/4
g log_earn_2=log(pg0110)
collapse (sd) log_earn_2
g common=1
save cs_ineq_earn_2.dta, replace
restore

****** Wealth income ratio Germany
keep if pg0110>(90*5)/4
gen wealthInc_2=dn3001/pg0110
tabstat wealthInc_2, statistics( median ) by(ra0300_b)
*
keep wealthInc_2 ra0300_b
collapse (median) wealthInc_2, by(ra0300_b)
save cs_ineq_net_wealth_2.dta, replace
*
*gen wealthInc2=dn3001/di2000
*tabstat wealthInc2, statistics( median ) by(ra0300_b)

*********************************************************************

use "PATH\P3.dta", clear
quietly do labels_P.do 

*Keep main household respondant
keep if ra0100==1
merge  1:1 sa0010 sa0100  using D3.dta
quietly do labels_D.do 
keep if sa0100=="DE"

****** Wealth Germany
keep if ra0200==1
keep if pe0100a==1
keep if pe0200==1
keep if pg0110>(90*5)/4
keep if ra0300_b>5
keep if ra0300_b<12 /* Wave 1 definitions!*/
*keep if ra0300_b>24
*keep if ra0300_b<55 /* Wave 2 definitions!*/

preserve
keep ra0300_b dn3001
save Felix_3.dta, replace
restore
*life-cycle
preserve
sort ra0300_b
by ra0300_b: egen p99 = pctile(dn3001), p(99)
by ra0300_b: egen p90 = pctile(dn3001), p(90)
by ra0300_b: egen p50 = pctile(dn3001), p(50)
by ra0300_b: egen p20 = pctile(dn3001), p(20)
by ra0300_b: egen tot_wealth=total(dn3001)
by ra0300_b: egen tot_wealth_ab90=total(dn3001) if dn3001>=p90
by ra0300_b: egen tot_wealth_ab99=total(dn3001) if dn3001>=p99
collapse (median) p99 p90 p50 p20 tot_wealth_ab90 tot_wealth_ab99 tot_wealth, by(ra0300_b)
gen p99_50_3 = p99/p50
gen p90_50_3 = p90/p50
gen p50_20_3 = p50/p20
g share_wealth_ab90_3=tot_wealth_ab90/tot_wealth
g share_wealth_ab99_3=tot_wealth_ab90/tot_wealth
by ra0300_b: sum p99_50_3 p90_50_3 p50_20_3 share_wealth_ab90_3 share_wealth_ab99_3
*
keep p99_50_3 p90_50_3 p50_20_3 share_wealth_ab90_3 share_wealth_ab99_3 ra0300_b
save lc_perc_net_wealth_3.dta, replace
*
restore

preserve
sort ra0300_b /* age*/
by ra0300_b: egen p99 = pctile(pg0110), p(99) /* cash income employee*/
by ra0300_b: egen p90 = pctile(pg0110), p(90)
by ra0300_b: egen p50 = pctile(pg0110), p(50)
by ra0300_b: egen p10 = pctile(pg0110), p(10)
collapse (median) p99 p90 p50 p10, by(ra0300_b)
gen p99_50_3 = p99/p50
gen p90_50_3 = p90/p50
gen p50_10_3 = p50/p10
by ra0300_b: sum p99_50_3 p90_50_3 p50_10_3
*
keep p99_50_3 p90_50_3 p50_10_3 ra0300_b
save lc_perc_earnings_3.dta, replace
*
restore

preserve
keep if dn3001>0
ineqdeco dn3001, by(ra0300_b)
gen lw = log(dn3001)
sort ra0300_b
by ra0300_b: egen varlw = sd(lw)
replace varlw = varlw^2
collapse (median) varlw, by(ra0300_b)
restore


*cross section
tabstat dn3001, statistics( median ) by(ra0300_b)
ineqdeco dn3001

preserve
egen p99 = pctile(dn3001), p(99)
egen p95 = pctile(dn3001), p(95)
egen p50 = pctile(dn3001), p(50)

gen prct = 0
replace prct = 99 if dn3001>=p99
replace prct = 95 if dn3001>=p95 & dn3001<p99
replace prct = 75 if dn3001>=p50 & dn3001<p95
replace prct = 50 if dn3001<p50

collapse (sum) dn3001 (median) p99 p95 p50, by(prct)
egen total_wealth = sum(dn3001)
gen share_wealth = dn3001/total_wealth
restore

preserve
keep if pg0110>(90*5)/4
g log_earn_3=log(pg0110)
collapse (sd) log_earn_3
g common=1
save cs_ineq_earn_3.dta, replace
restore


****** Wealth income ratio Germany
keep if pg0110>(90*5)/4
gen wealthInc_3=dn3001/pg0110
tabstat wealthInc_3, statistics( median ) by(ra0300_b)
*
keep wealthInc_3 ra0300_b
collapse (median) wealthInc_3, by(ra0300_b)
save cs_ineq_net_wealth_3.dta, replace
*
*gen wealthInc2=dn3001/di2000
*tabstat wealthInc2, statistics( median ) by(ra0300_b)


*********************************************************************

use "PATH\P4.dta", clear
quietly do labels_P.do 

*Keep main household respondant
keep if ra0100==1
merge  1:1 sa0010 sa0100  using D4.dta
quietly do labels_D.do 
keep if sa0100=="DE"

****** Wealth Germany
keep if ra0200==1
keep if pe0100a==1
keep if pe0200==1
keep if pg0110>(90*5)/4
keep if ra0300_b>5
keep if ra0300_b<12 /* Wave 1 definitions!*/
*keep if ra0300_b>24
*keep if ra0300_b<55 /* Wave 2 definitions!*/

preserve
keep ra0300_b dn3001
save Felix_4.dta, replace
restore
*life-cycle
preserve
sort ra0300_b
by ra0300_b: egen p99 = pctile(dn3001), p(99)
by ra0300_b: egen p90 = pctile(dn3001), p(90)
by ra0300_b: egen p50 = pctile(dn3001), p(50)
by ra0300_b: egen p20 = pctile(dn3001), p(20)
by ra0300_b: egen tot_wealth=total(dn3001)
by ra0300_b: egen tot_wealth_ab90=total(dn3001) if dn3001>=p90
by ra0300_b: egen tot_wealth_ab99=total(dn3001) if dn3001>=p99
collapse (median) p99 p90 p50 p20  tot_wealth_ab90 tot_wealth_ab99 tot_wealth, by(ra0300_b)
gen p99_50_4 = p99/p50
gen p90_50_4 = p90/p50
gen p50_20_4 = p50/p20
g share_wealth_ab90_4=tot_wealth_ab90/tot_wealth
g share_wealth_ab99_4=tot_wealth_ab90/tot_wealth
by ra0300_b: sum p99_50_4 p90_50_4 p50_20_4 share_wealth_ab90_4 share_wealth_ab99_4
*
keep p99_50_4 p90_50_4 p50_20_4 share_wealth_ab90_4 share_wealth_ab99_4 ra0300_b
save lc_perc_net_wealth_4.dta, replace
*
restore

preserve
sort ra0300_b /* age*/
by ra0300_b: egen p99 = pctile(pg0110), p(99) /* cash income employee*/
by ra0300_b: egen p90 = pctile(pg0110), p(90)
by ra0300_b: egen p50 = pctile(pg0110), p(50)
by ra0300_b: egen p10 = pctile(pg0110), p(10)
collapse (median) p99 p90 p50 p10, by(ra0300_b)
gen p99_50_4 = p99/p50
gen p90_50_4 = p90/p50
gen p50_10_4 = p50/p10
by ra0300_b: sum p99_50_4 p90_50_4 p50_10_4
*
keep p99_50_4 p90_50_4 p50_10_4 ra0300_b
save lc_perc_earnings_4.dta, replace
*
restore


preserve
keep if dn3001>0
ineqdeco dn3001, by(ra0300_b)
gen lw = log(dn3001)
sort ra0300_b
by ra0300_b: egen varlw = sd(lw)
replace varlw = varlw^2
collapse (median) varlw, by(ra0300_b)
restore

*cross section
tabstat dn3001, statistics( median ) by(ra0300_b)
ineqdeco dn3001

preserve
egen p99 = pctile(dn3001), p(99)
egen p95 = pctile(dn3001), p(95)
egen p50 = pctile(dn3001), p(50)

gen prct = 0
replace prct = 99 if dn3001>=p99
replace prct = 95 if dn3001>=p95 & dn3001<p99
replace prct = 75 if dn3001>=p50 & dn3001<p95
replace prct = 50 if dn3001<p50

collapse (sum) dn3001 (median) p99 p95 p50, by(prct)
egen total_wealth = sum(dn3001)
gen share_wealth = dn3001/total_wealth
restore

preserve
keep if pg0110>(90*5)/4
g log_earn_4=log(pg0110)
collapse (sd) log_earn_4
g common=1
save cs_ineq_earn_4.dta, replace
restore


****** Wealth income ratio Germany
keep if pg0110>(90*5)/4
gen wealthInc_4=dn3001/pg0110
tabstat wealthInc_4, statistics( median ) by(ra0300_b)
*
keep wealthInc_4 ra0300_b
collapse (median) wealthInc_4, by(ra0300_b)
save cs_ineq_net_wealth_4.dta, replace
*
*gen wealthInc2=dn3001/di2000
*tabstat wealthInc2, statistics( median ) by(ra0300_b)

*********************************************************************

use "PATH\P5.dta", clear
quietly do labels_P.do 

*Keep main household respondant
keep if ra0100==1
merge  1:1 sa0010 sa0100  using D5.dta
quietly do labels_D.do 
keep if sa0100=="DE"

****** Wealth Germany
keep if ra0200==1
keep if pe0100a==1
keep if pe0200==1
keep if pg0110>(90*5)/4
keep if ra0300_b>5
keep if ra0300_b<12 /* Wave 1 definitions!*/
*keep if ra0300_b>24
*keep if ra0300_b<55 /* Wave 2 definitions!*/

preserve
keep ra0300_b dn3001
save Felix_5.dta, replace
restore
*life-cycle
preserve
sort ra0300_b
by ra0300_b: egen p99 = pctile(pg0110), p(99)
by ra0300_b: egen p90 = pctile(pg0110), p(90)
by ra0300_b: egen p50 = pctile(pg0110), p(50)
by ra0300_b: egen p10 = pctile(pg0110), p(10)
collapse (median) p99 p90 p50 p10, by(ra0300_b)
gen p99_50_5 = p99/p50
gen p90_50_5 = p90/p50
gen p50_10_5 = p50/p10
by ra0300_b: sum p99_50_5 p90_50_5 p50_10_5
*
keep p99_50_5 p90_50_5 p50_10_5 ra0300_b
save lc_perc_earnings_5.dta, replace
*
restore

preserve
sort ra0300_b /* age*/
by ra0300_b: egen p99 = pctile(dn3001), p(99) /* cash income employee*/
by ra0300_b: egen p90 = pctile(dn3001), p(90)
by ra0300_b: egen p50 = pctile(dn3001), p(50)
by ra0300_b: egen p20 = pctile(dn3001), p(20)
by ra0300_b: egen tot_wealth=total(dn3001)
by ra0300_b: egen tot_wealth_ab90=total(dn3001) if dn3001>=p90
by ra0300_b: egen tot_wealth_ab99=total(dn3001) if dn3001>=p99
collapse (median) p99 p90 p50 p20 tot_wealth_ab90 tot_wealth_ab99 tot_wealth, by(ra0300_b)
gen p99_50_5 = p99/p50
gen p90_50_5 = p90/p50
gen p50_20_5 = p50/p20
g share_wealth_ab90_5=tot_wealth_ab90/tot_wealth
g share_wealth_ab99_5=tot_wealth_ab90/tot_wealth
by ra0300_b: sum p99_50_5 p90_50_5 p50_20_5 share_wealth_ab90_5 share_wealth_ab99_5
*
keep p99_50_5 p90_50_5 p50_20_5 share_wealth_ab90_5 share_wealth_ab99_5 ra0300_b
save lc_perc_net_wealth_5.dta, replace
*
restore


preserve
keep if dn3001>0
ineqdeco dn3001, by(ra0300_b)
gen lw = log(dn3001)
sort ra0300_b
by ra0300_b: egen varlw = sd(lw)
replace varlw = varlw^2
collapse (median) varlw, by(ra0300_b)
restore

*cross section
tabstat dn3001, statistics( median ) by(ra0300_b)
ineqdeco dn3001

preserve
egen p99 = pctile(dn3001), p(99)
egen p95 = pctile(dn3001), p(95)
egen p50 = pctile(dn3001), p(50)

gen prct = 0
replace prct = 99 if dn3001>=p99
replace prct = 95 if dn3001>=p95 & dn3001<p99
replace prct = 75 if dn3001>=p50 & dn3001<p95
replace prct = 50 if dn3001<p50

collapse (sum) dn3001 (median) p99 p95 p50, by(prct)
egen total_wealth = sum(dn3001)
gen share_wealth = dn3001/total_wealth
restore

preserve
keep if pg0110>(90*5)/4
g log_earn_5=log(pg0110)
collapse (sd) log_earn_5
g common=1
save cs_ineq_earn_5.dta, replace
restore


****** Wealth income ratio Germany
keep if pg0110>(90*5)/4
gen wealthInc_5=dn3001/pg0110
tabstat wealthInc_5, statistics( median ) by(ra0300_b)
*
keep wealthInc_5 ra0300_b
collapse (median) wealthInc_5, by(ra0300_b)
save cs_ineq_net_wealth_5.dta, replace
*
*gen wealthInc2=dn3001/di2000
*tabstat wealthInc2, statistics( median ) by(ra0300_b)


*ra0300_b = 6 [  25         29
*ra0300_b = 7 [   30         34
*ra0300_b = 8[  35         39
*ra0300_b = 9[ 40         44
*ra0300_b = 10[ 45         49
*ra0300_b = 11[ 50         54

*compute averages across 5 sets:
*wealth to income ratio CS
use cs_ineq_net_wealth_1.dta, clear
merge 1:1 ra0300_b using cs_ineq_net_wealth_2.dta, nogen
merge 1:1 ra0300_b using cs_ineq_net_wealth_3.dta, nogen
merge 1:1 ra0300_b using cs_ineq_net_wealth_4.dta, nogen
merge 1:1 ra0300_b using cs_ineq_net_wealth_5.dta, nogen

g lc_wealthInc=(wealthInc_1+wealthInc_2+wealthInc_3+wealthInc_4+wealthInc_5)/5
order ra0300_b lc_wealthInc
di ("Median Wealth/Income over the Life Cycle")
list ra0300_b lc_wealthInc

*
use lc_perc_net_wealth_1.dta, clear
merge 1:1 ra0300_b using lc_perc_net_wealth_2.dta, nogen
merge 1:1 ra0300_b using lc_perc_net_wealth_3.dta, nogen
merge 1:1 ra0300_b using lc_perc_net_wealth_4.dta, nogen
merge 1:1 ra0300_b using lc_perc_net_wealth_5.dta, nogen

g p99_50_wealth=(p99_50_1+p99_50_2+p99_50_3+p99_50_4+p99_50_5)/5
g p90_50_wealth=(p90_50_1+p90_50_2+p90_50_3+p90_50_4+p90_50_5)/5
g p50_20_wealth=(p50_20_1+p50_20_2+p50_20_3+p50_20_4+p50_20_5)/5
g share_wealth_ab90=(share_wealth_ab90_1+share_wealth_ab90_2+share_wealth_ab90_3+share_wealth_ab90_4+share_wealth_ab90_5)/5
g share_wealth_ab99=(share_wealth_ab99_1+share_wealth_ab99_2+share_wealth_ab99_3+share_wealth_ab99_4+share_wealth_ab99_5)/5
order ra0300_b p99_50_wealth p90_50_wealth p50_20_wealth share_wealth_ab90 share_wealth_ab99
di ("Ratio of Percentiles of Wealth over the Life Cycle")
list ra0300_b p99_50_wealth p90_50_wealth p50_20_wealth  share_wealth_ab90 share_wealth_ab99

*
use lc_perc_earnings_1.dta, clear
merge 1:1 ra0300_b using lc_perc_earnings_2.dta, nogen
merge 1:1 ra0300_b using lc_perc_earnings_3.dta, nogen
merge 1:1 ra0300_b using lc_perc_earnings_4.dta, nogen
merge 1:1 ra0300_b using lc_perc_earnings_5.dta, nogen

g p99_50_earnings=(p99_50_1+p99_50_2+p99_50_3+p99_50_4+p99_50_5)/5
g p90_50_earnings=(p90_50_1+p90_50_2+p90_50_3+p90_50_4+p90_50_5)/5
g p50_10_earnings=(p50_10_1+p50_10_2+p50_10_3+p50_10_4+p50_10_5)/5
order ra0300_b p99_50_earnings p90_50_earnings p50_10_earnings
di ("Ratio of Percentiles of Earnings over the Life Cycle")
list ra0300_b p99_50_earnings p90_50_earnings p50_10_earnings


*earn ineq CS
use cs_ineq_earn_1.dta, clear
joinby common using cs_ineq_earn_2.dta
joinby common using cs_ineq_earn_3.dta
joinby common using cs_ineq_earn_4.dta
joinby common using cs_ineq_earn_5.dta

g cs_ineq_earn=(log_earn_1+log_earn_2+log_earn_3+log_earn_4+log_earn_5)/5
*order ra0300_b lc_wealthInc
di ("Log Earnings Inequality")
list cs_ineq_earn

