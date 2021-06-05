cls
clear
set more off
*
*set memory 16g

***Unconditional
*
use "\Preliminars.dta", clear
keep if persnr<100000
*ssc install fastgini

drop if year<1999
drop if year==.
*
qui drop if age<24
qui drop if age>55

*
gen month_diff_epi=month_endepi-month_begepi+1 
*
expand month_diff_epi 
*
sort persnr year begepi
*I need to re-number their months
bysort persnr year counter_spell begepi: replace month_begepi=month_begepi-1+_n 
*
bysort persnr year counter_spell begepi: replace month_endepi=month_begepi 
*
*bottom
sort persnr year begepi month_begepi
bysort persnr year: gen counter_source=_n 
*
bysort persnr year: gen bottom=1 if month_begepi>1 & month_begepi!=.  & counter_source==1
bysort persnr year: gen bottom_diff=month_begepi-1+1 if bottom==1  & counter_source==1
expand bottom_diff if counter_source==1 & bottom==1, generate(extra_one)
gsort persnr year begepi month_begepi bottom -extra_one
bysort persnr year begepi month_begepi bottom: replace month_begepi=_n if bottom==1
bysort persnr year begepi month_begepi: replace month_endepi=month_begepi if bottom==1
*top
sort persnr year begepi month_begepi
drop counter_source
bysort persnr year: gen counter_source=_n
bysort persnr year: gen tot=_N
bysort persnr year: gen top=1 if counter_source==tot & month_endepi<12 & month_endepi!=.
bysort persnr year: gen top_diff=12-month_endepi+1 if top==1  & counter_source==tot
expand top_diff if counter_source==tot & top==1, generate(extra_two)
gsort persnr year begepi month_begepi top -extra_one extra_two
bysort persnr year begepi month_begepi top: replace month_begepi=month_begepi-1+_n if top==1
bysort persnr year begepi month_begepi: replace month_endepi=month_begepi if top==1
*in between
sort persnr year begepi month_begepi 
drop counter_source
bysort persnr year: gen counter_source=_n
bysort persnr year: gen diff_counter_source=1 if counter_source>1 & counter_source!=. & month_begepi>month_endepi[_n-1]+1
bysort persnr year: gen num_diff_counter_source=month_begepi-month_endepi[_n-1] if diff_counter_source==1 & counter_source>1 & counter_source!=.
expand num_diff_counter_source if diff_counter_source==1, generate(extra_three)
gsort persnr year begepi month_begepi diff_counter_source -extra_one extra_two -extra_three
bysort persnr year begepi month_begepi diff_counter_source: replace month_begepi=month_begepi-num_diff_counter+_n if diff_counter_source==1
bysort persnr year begepi month_begepi: replace month_endepi=month_begepi if diff_counter_source==1

sort persnr year month_begepi begepi counter_spell
bysort persnr year month_begepi: gen counter_month=_n

sort persnr year month_begepi begepi counter_month

gen duplic=extra_one+extra_two+extra_three
replace source=5 if duplic==1

sort persnr year month_begepi begepi counter_month

gen conc=0
bysort persnr year month_begepi source begepi: replace conc=1 if source==1 & source[_n-1]==1 & begepi<endepi[_n-1]

bysort persnr year month_begepi: egen sum_conc=sum(conc)

sort persnr year month_begepi counter_month

*** seems to work

*let's define main forms of employment by month

replace form=. if source!=1

gen year_begepix=year(begepi)
gen year_endepix=year(endepi)
gen month_begepix=month(begepi)
gen month_endepix=month(endepi)
gen day_begepix=day(begepi)
gen day_endepix=day(endepi)

gen days_full=.
gen days_part=.
gen days_mini=.
gen days_unemp=.

replace days_full=32-day_begepix if form==1 & month_endepix>month_endepi & month_endepi>=month_begepix
replace days_full=30 if form==1 & month_endepix>month_endepi & month_endepi>month_begepix
replace days_full=day_endepix-day_begepix if form==1 & month_endepix==month_endepi & month_begepix==month_endepix
replace days_full=day_endepix if form==1 & month_endepix==month_endepi & month_begepix<month_endepix

replace days_part=32-day_begepix if form==2 & month_endepix>month_endepi & month_endepi>=month_begepix
replace days_part=30 if form==2 & month_endepix>month_endepi & month_endepi>month_begepix
replace days_part=day_endepix-day_begepix if form==2 & month_endepix==month_endepi & month_begepix==month_endepix
replace days_part=day_endepix if form==2 & month_endepix==month_endepi & month_begepix<month_endepix

replace days_mini=32-day_begepix if form==3 & month_endepix>month_endepi & month_endepi>=month_begepix
replace days_mini=30 if form==3 & month_endepix>month_endepi & month_endepi>month_begepix
replace days_mini=day_endepix-day_begepix if form==3 & month_endepix==month_endepi & month_begepix==month_endepix
replace days_mini=day_endepix if form==3 & month_endepix==month_endepi & month_begepix<month_endepix

replace days_unemp=30 if inrange(source,2,5) & bottom==1 & extra_one==1
replace days_unemp=30 if inrange(source,2,5) & top==1 & extra_two==1
replace days_unemp=30 if inrange(source,2,5) & diff_counter_source==1
replace days_unemp=30 if inrange(source,2,5) & year_endepix>year_begepix
replace days_unemp=32-day_begepix if inrange(source,2,5) & month_endepix>month_endepi & month_endepi>=month_begepix
replace days_unemp=day_endepix-day_begepix+1 if inrange(source,2,5) & month_endepix==month_endepi & month_begepix==month_endepix
replace days_unemp=day_endepix if inrange(source,2,5) & month_endepix==month_endepi & month_begepix<month_endepix
replace days_unemp=32-day_begepix if inrange(source,2,5) & year_endepix>year & month_begepix==month_begepi
replace days_unemp=day_endepix if inrange(source,2,5) & year_endepix==year & month_endepix==month_endepi & year_begepix<year
replace days_unemp=30 if source==5
replace days_unemp=30 if inrange(source,2,5) & year_endepix==year & year_begepix==year & month_begepix<month_begepi & month_begepi<month_endepix 

bysort persnr year month_begepi: egen max_days_full=max(days_full)
bysort persnr year month_begepi: egen max_days_part=max(days_part)
bysort persnr year month_begepi: egen max_days_mini=max(days_mini)
bysort persnr year month_begepi: egen max_days_unemp=max(days_unemp)

bysort persnr year month_begepi: gen ind_month=_n
bysort persnr year month_begepi: egen sum_ind=sum(ind_month)
bysort persnr year month_begepi: replace counter_diff_estab_id=0 if counter_diff_estab_id==.n
bysort persnr year month_begepi: egen max_days_estab=max(counter_diff_estab_id)
bysort persnr year month_begepi: replace counter_diff_estab_id=max_days_estab
drop ind_month sum_ind

replace max_days_full=0 if max_days_full==.
replace max_days_part=0 if max_days_part==.
replace max_days_mini=0 if max_days_mini==.
replace max_days_unemp=0 if max_days_unemp==.

egen max_days_month=rowmax(max_days_full max_days_part max_days_mini)

gen full_part=1 if max_days_full!=. & max_days_full>0 & max_days_part!=. & max_days_part>0
gen full_mini=1 if max_days_full!=. & max_days_full>0 & max_days_mini!=. & max_days_mini>0
gen mini_part=1 if max_days_mini!=. & max_days_mini>0 & max_days_part!=. & max_days_part>0

gen full_month=1 if max_days_full>2*(max_days_part+max_days_mini)
gen part_month=1 if max_days_part>2*(max_days_full+max_days_mini)
gen mini_month=1 if max_days_mini>2*(max_days_part+max_days_full)
gen unemp_month=1 if max_days_unemp>max_days_month & max_days_month<=15
replace full_month=. if max_days_unemp>max_days_month & max_days_month<=15
replace part_month=. if max_days_unemp>max_days_month & max_days_month<=15
replace mini_month=. if max_days_unemp>max_days_month & max_days_month<=15

bysort persnr year month_begepi: replace counter_diff_estab_id=0 if unemp_month==1

gen conc_month=1 if full_month==. & part_month==. & mini_month==. & unemp_month==. & max_days_full+max_days_part+max_days_mini!=. & max_days_full+max_days_part+max_days_mini>0 

gen null_state=1 if full_month==. & part_month==. & mini_month==. & unemp_month==. & conc_month==.

tab month_begepi
tab month_endepi
tab max_days_full
tab max_days_part
tab max_days_mini
tab max_days_unemp
tab null_state

order persnr begepi endepi month_begepi month_endepi year days_full days_part days_mini days_unemp counter_month counter_diff_estab_id conc sum_conc source counter_spell female

*worker flows should be conditional on having a worker flow, I believe:

drop counter_month
bysort persnr year month_begepi: gen counter_month=_n
keep if counter_month==1

sort persnr year month_begepi

bysort persnr: gen counter_flow=_n

bysort persnr: gen flow=1 if full_month!=full_month[_n-1] & counter_flow>1
bysort persnr: replace flow=1 if part_month!=part_month[_n-1] & counter_flow>1
bysort persnr: replace flow=1 if mini_month!=mini_month[_n-1] & counter_flow>1
bysort persnr: replace flow=1 if unemp_month!=unemp_month[_n-1] & counter_flow>1
bysort persnr: replace flow=1 if conc_month!=conc_month[_n-1] & counter_flow>1

bysort persnr: replace flow=1 if full_month==full_month[_n-1] & counter_flow>1 & counter_diff_estab_id!=counter_diff_estab_id[_n-1] & source==1
bysort persnr: replace flow=1 if part_month==part_month[_n-1] & counter_flow>1 & counter_diff_estab_id!=counter_diff_estab_id[_n-1] & source==1
bysort persnr: replace flow=1 if mini_month==mini_month[_n-1] & counter_flow>1 & counter_diff_estab_id!=counter_diff_estab_id[_n-1] & source==1
*bysort persnr: replace flow=1 if unemp_month==unemp_month[_n-1] & counter_flow>1 & counter_diff_estab_id!=counter_diff_estab_id[_n-1] & source==1
bysort persnr: replace flow=1 if conc_month==conc_month[_n-1] & counter_flow>1 & counter_diff_estab_id!=counter_diff_estab_id[_n-1] & source==1

bysort persnr: replace flow=1 if full_month==full_month[_n-1] & counter_flow>1 & counter_diff_estab_id==counter_diff_estab_id[_n-1] & source==1 & sum_conc!=sum_conc[_n-1]
bysort persnr: replace flow=1 if part_month==part_month[_n-1] & counter_flow>1 & counter_diff_estab_id==counter_diff_estab_id[_n-1] & source==1 & sum_conc!=sum_conc[_n-1]
bysort persnr: replace flow=1 if mini_month==mini_month[_n-1] & counter_flow>1 & counter_diff_estab_id==counter_diff_estab_id[_n-1] & source==1 & sum_conc!=sum_conc[_n-1]
*bysort persnr: replace flow=1 if unemp_month==unemp_month[_n-1] & counter_flow>1 & counter_diff_estab_id==counter_diff_estab_id[_n-1] & source==1 & sum_conc!=sum_conc[_n-1]
bysort persnr: replace flow=1 if conc_month==conc_month[_n-1] & counter_flow>1 & counter_diff_estab_id==counter_diff_estab_id[_n-1] & source==1 & sum_conc!=sum_conc[_n-1]


bysort persnr: replace flow=. if unemp_month==1 & unemp_month[_n-1]==1

*now to compute the transitions

*gen error=1 if full_month+part_month+mini_month+unemp_month+conc_month>1 & full_month+part_month+mini_month+unemp_month+conc_month!=.

***generate flows

sort persnr year month_begepi

bysort persnr: gen FTF=1 if full_month[_n-1]==1 & full_month==1 & flow==1
bysort persnr: gen FTP=1 if full_month[_n-1]==1 & part_month==1 & flow==1
bysort persnr: gen FTM=1 if full_month[_n-1]==1 & mini_month==1 & flow==1
bysort persnr: gen FTU=1 if full_month[_n-1]==1 & unemp_month==1 & flow==1
bysort persnr: gen FTC=1 if full_month[_n-1]==1 & conc_month==1 & flow==1

bysort persnr: gen PTF=1 if part_month[_n-1]==1 & full_month==1 & flow==1
bysort persnr: gen PTP=1 if part_month[_n-1]==1 & part_month==1 & flow==1
bysort persnr: gen PTM=1 if part_month[_n-1]==1 & mini_month==1 & flow==1
bysort persnr: gen PTU=1 if part_month[_n-1]==1 & unemp_month==1 & flow==1
bysort persnr: gen PTC=1 if part_month[_n-1]==1 & conc_month==1 & flow==1

bysort persnr: gen MTF=1 if mini_month[_n-1]==1 & full_month==1 & flow==1
bysort persnr: gen MTP=1 if mini_month[_n-1]==1 & part_month==1 & flow==1
bysort persnr: gen MTM=1 if mini_month[_n-1]==1 & mini_month==1 & flow==1
bysort persnr: gen MTU=1 if mini_month[_n-1]==1 & unemp_month==1 & flow==1
bysort persnr: gen MTC=1 if mini_month[_n-1]==1 & conc_month==1 & flow==1

bysort persnr: gen UTF=1 if unemp_month[_n-1]==1 & full_month==1 & flow==1
bysort persnr: gen UTP=1 if unemp_month[_n-1]==1 & part_month==1 & flow==1
bysort persnr: gen UTM=1 if unemp_month[_n-1]==1 & mini_month==1 & flow==1
bysort persnr: gen UTC=1 if unemp_month[_n-1]==1 & conc_month==1 & flow==1

bysort persnr: gen CTF=1 if conc_month[_n-1]==1 & full_month==1 & flow==1
bysort persnr: gen CTP=1 if conc_month[_n-1]==1 & part_month==1 & flow==1
bysort persnr: gen CTM=1 if conc_month[_n-1]==1 & mini_month==1 & flow==1
bysort persnr: gen CTU=1 if conc_month[_n-1]==1 & unemp_month==1 & flow==1
bysort persnr: gen CTC=1 if conc_month[_n-1]==1 & conc_month==1 & flow==1

bysort persnr: replace FTF=0 if full_month[_n-1]==1 & full_month!=1 & flow==1
bysort persnr: replace FTP=0 if full_month[_n-1]==1 & part_month!=1 & flow==1
bysort persnr: replace FTM=0 if full_month[_n-1]==1 & mini_month!=1 & flow==1
bysort persnr: replace FTU=0 if full_month[_n-1]==1 & unemp_month!=1 & flow==1
bysort persnr: replace FTC=0 if full_month[_n-1]==1 & conc_month!=1 & flow==1

bysort persnr: replace PTF=0 if part_month[_n-1]==1 & full_month!=1 & flow==1
bysort persnr: replace PTP=0 if part_month[_n-1]==1 & part_month!=1 & flow==1
bysort persnr: replace PTM=0 if part_month[_n-1]==1 & mini_month!=1 & flow==1
bysort persnr: replace PTU=0 if part_month[_n-1]==1 & unemp_month!=1 & flow==1
bysort persnr: replace PTC=0 if part_month[_n-1]==1 & conc_month!=1 & flow==1

bysort persnr: replace MTF=0 if mini_month[_n-1]==1 & full_month!=1 & flow==1
bysort persnr: replace MTP=0 if mini_month[_n-1]==1 & part_month!=1 & flow==1
bysort persnr: replace MTM=0 if mini_month[_n-1]==1 & mini_month!=1 & flow==1
bysort persnr: replace MTU=0 if mini_month[_n-1]==1 & unemp_month!=1 & flow==1
bysort persnr: replace MTC=0 if mini_month[_n-1]==1 & conc_month!=1 & flow==1

bysort persnr: replace UTF=0 if unemp_month[_n-1]==1 & full_month!=1 & flow==1
bysort persnr: replace UTP=0 if unemp_month[_n-1]==1 & part_month!=1 & flow==1
bysort persnr: replace UTM=0 if unemp_month[_n-1]==1 & mini_month!=1 & flow==1
bysort persnr: replace UTC=0 if unemp_month[_n-1]==1 & conc_month!=1 & flow==1

bysort persnr: replace CTF=0 if conc_month[_n-1]==1 & full_month!=1 & flow==1
bysort persnr: replace CTP=0 if conc_month[_n-1]==1 & part_month!=1 & flow==1
bysort persnr: replace CTM=0 if conc_month[_n-1]==1 & mini_month!=1 & flow==1
bysort persnr: replace CTU=0 if conc_month[_n-1]==1 & unemp_month!=1 & flow==1
bysort persnr: replace CTC=0 if conc_month[_n-1]==1 & conc_month!=1 & flow==1

***generate stocks:
sort persnr year month_begepi
gen FT=0
gen PT=0
gen MJ=0
gen Unemp=0
gen CJ=0

bysort persnr: replace FT=1 if full_month[_n-1]==1
bysort persnr: replace PT=1 if part_month[_n-1]==1
bysort persnr: replace MJ=1 if mini_month[_n-1]==1
bysort persnr: replace Unemp=1 if unemp_month[_n-1]==1
bysort persnr: replace CJ=1 if conc_month[_n-1]==1

bysort year month_begepi: egen stock_FT=total(FT)
bysort year month_begepi: egen stock_PT=total(PT)
bysort year month_begepi: egen stock_MJ=total(MJ)
bysort year month_begepi: egen stock_Unemp=total(Unemp)
bysort year month_begepi: egen stock_CJ=total(CJ)

bysort year month_begepi: gen stock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ+stock_Unemp+stock_CJ)
bysort year month_begepi: gen stock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ+stock_Unemp+stock_CJ)
bysort year month_begepi: gen stock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ+stock_Unemp+stock_CJ)
bysort year month_begepi: gen stock_Unemp_share=stock_Unemp/(stock_FT+stock_PT+stock_MJ+stock_Unemp+stock_CJ)
bysort year month_begepi: gen stock_CJ_share=stock_CJ/(stock_FT+stock_PT+stock_MJ+stock_Unemp+stock_CJ)

bysort year month_begepi: gen tstock_FT_share=stock_FT/(stock_FT+stock_PT+stock_MJ)
bysort year month_begepi: gen tstock_PT_share=stock_PT/(stock_FT+stock_PT+stock_MJ)
bysort year month_begepi: gen tstock_MJ_share=stock_MJ/(stock_FT+stock_PT+stock_MJ)

***this is the aggregation part:

sort year month_begepi

bysort year: egen ave_tstock_FT_share=mean(tstock_FT_share)
bysort year: egen ave_tstock_PT_share=mean(tstock_PT_share)
bysort year: egen ave_tstock_MJ_share=mean(tstock_MJ_share)

bysort year month_begepi: egen tot_FTF=total(FTF)
bysort year month_begepi: egen tot_FTP=total(FTP)
bysort year month_begepi: egen tot_FTM=total(FTM)
bysort year month_begepi: egen tot_FTU=total(FTU)
bysort year month_begepi: egen tot_FTC=total(FTC)

bysort year month_begepi: egen tot_PTF=total(PTF)
bysort year month_begepi: egen tot_PTP=total(PTP)
bysort year month_begepi: egen tot_PTM=total(PTM)
bysort year month_begepi: egen tot_PTU=total(PTU)
bysort year month_begepi: egen tot_PTC=total(PTC)

bysort year month_begepi: egen tot_MTF=total(MTF)
bysort year month_begepi: egen tot_MTP=total(MTP)
bysort year month_begepi: egen tot_MTM=total(MTM)
bysort year month_begepi: egen tot_MTU=total(MTU)
bysort year month_begepi: egen tot_MTC=total(MTC)

bysort year month_begepi: egen tot_UTF=total(UTF)
bysort year month_begepi: egen tot_UTP=total(UTP)
bysort year month_begepi: egen tot_UTM=total(UTM)
bysort year month_begepi: egen tot_UTC=total(UTC)

bysort year month_begepi: egen tot_CTF=total(CTF)
bysort year month_begepi: egen tot_CTP=total(CTP)
bysort year month_begepi: egen tot_CTM=total(CTM)
bysort year month_begepi: egen tot_CTU=total(CTU)
bysort year month_begepi: egen tot_CTC=total(CTC)

bysort year month_begepi: egen ave_FTF=mean(FTF)
bysort year month_begepi: egen ave_FTP=mean(FTP)
bysort year month_begepi: egen ave_FTM=mean(FTM)
bysort year month_begepi: egen ave_FTU=mean(FTU)
bysort year month_begepi: egen ave_FTC=mean(FTC)

bysort year month_begepi: egen ave_PTF=mean(PTF)
bysort year month_begepi: egen ave_PTP=mean(PTP)
bysort year month_begepi: egen ave_PTM=mean(PTM)
bysort year month_begepi: egen ave_PTU=mean(PTU)
bysort year month_begepi: egen ave_PTC=mean(PTC)

bysort year month_begepi: egen ave_MTF=mean(MTF)
bysort year month_begepi: egen ave_MTP=mean(MTP)
bysort year month_begepi: egen ave_MTM=mean(MTM)
bysort year month_begepi: egen ave_MTU=mean(MTU)
bysort year month_begepi: egen ave_MTC=mean(MTC)

bysort year month_begepi: egen ave_UTF=mean(UTF)
bysort year month_begepi: egen ave_UTP=mean(UTP)
bysort year month_begepi: egen ave_UTM=mean(UTM)
bysort year month_begepi: egen ave_UTC=mean(UTC)

bysort year month_begepi: egen ave_CTF=mean(CTF)
bysort year month_begepi: egen ave_CTP=mean(CTP)
bysort year month_begepi: egen ave_CTM=mean(CTM)
bysort year month_begepi: egen ave_CTU=mean(CTU)
bysort year month_begepi: egen ave_CTC=mean(CTC)

***hazard rates:

bysort year month_begepi: gen hazard_rate_FTF=tot_FTF/stock_FT
bysort year month_begepi: gen hazard_rate_FTP=tot_FTP/stock_FT
bysort year month_begepi: gen hazard_rate_FTM=tot_FTM/stock_FT
bysort year month_begepi: gen hazard_rate_FTU=tot_FTU/stock_FT
bysort year month_begepi: gen hazard_rate_FTC=tot_FTC/stock_FT

bysort year month_begepi: gen hazard_rate_PTF=tot_PTF/stock_PT
bysort year month_begepi: gen hazard_rate_PTP=tot_PTP/stock_PT
bysort year month_begepi: gen hazard_rate_PTM=tot_PTM/stock_PT
bysort year month_begepi: gen hazard_rate_PTU=tot_PTU/stock_PT
bysort year month_begepi: gen hazard_rate_PTC=tot_PTC/stock_PT

bysort year month_begepi: gen hazard_rate_MTF=tot_MTF/stock_MJ
bysort year month_begepi: gen hazard_rate_MTP=tot_MTP/stock_MJ
bysort year month_begepi: gen hazard_rate_MTM=tot_MTM/stock_MJ
bysort year month_begepi: gen hazard_rate_MTU=tot_MTU/stock_MJ
bysort year month_begepi: gen hazard_rate_MTC=tot_MTC/stock_MJ

bysort year month_begepi: gen hazard_rate_UTF=tot_UTF/stock_Unemp
bysort year month_begepi: gen hazard_rate_UTP=tot_UTP/stock_Unemp
bysort year month_begepi: gen hazard_rate_UTM=tot_UTM/stock_Unemp
bysort year month_begepi: gen hazard_rate_UTC=tot_UTC/stock_Unemp

bysort year month_begepi: gen hazard_rate_CTF=tot_CTF/stock_CJ
bysort year month_begepi: gen hazard_rate_CTP=tot_CTP/stock_CJ
bysort year month_begepi: gen hazard_rate_CTM=tot_CTM/stock_CJ
bysort year month_begepi: gen hazard_rate_CTU=tot_CTU/stock_CJ
bysort year month_begepi: gen hazard_rate_CTC=tot_CTC/stock_CJ

***year averages

bysort year: egen ave_stock_FT_share=mean(stock_FT_share)
bysort year: egen ave_stock_PT_share=mean(stock_PT_share)
bysort year: egen ave_stock_MJ_share=mean(stock_MJ_share)
bysort year: egen ave_stock_Unemp_share=mean(stock_Unemp_share)
bysort year: egen ave_stock_CJ_share=mean(stock_CJ_share)

bysort year: egen ave_hazard_rate_FTF=mean(hazard_rate_FTF)
bysort year: egen ave_hazard_rate_FTP=mean(hazard_rate_FTP)
bysort year: egen ave_hazard_rate_FTM=mean(hazard_rate_FTM)
bysort year: egen ave_hazard_rate_FTU=mean(hazard_rate_FTU)
bysort year: egen ave_hazard_rate_FTC=mean(hazard_rate_FTC)

bysort year: egen ave_hazard_rate_PTF=mean(hazard_rate_PTF)
bysort year: egen ave_hazard_rate_PTP=mean(hazard_rate_PTP)
bysort year: egen ave_hazard_rate_PTM=mean(hazard_rate_PTM)
bysort year: egen ave_hazard_rate_PTU=mean(hazard_rate_PTU)
bysort year: egen ave_hazard_rate_PTC=mean(hazard_rate_PTC)

bysort year: egen ave_hazard_rate_MTF=mean(hazard_rate_MTF)
bysort year: egen ave_hazard_rate_MTP=mean(hazard_rate_MTP)
bysort year: egen ave_hazard_rate_MTM=mean(hazard_rate_MTM)
bysort year: egen ave_hazard_rate_MTU=mean(hazard_rate_MTU)
bysort year: egen ave_hazard_rate_MTC=mean(hazard_rate_MTC)

bysort year: egen ave_hazard_rate_UTF=mean(hazard_rate_UTF)
bysort year: egen ave_hazard_rate_UTP=mean(hazard_rate_UTP)
bysort year: egen ave_hazard_rate_UTM=mean(hazard_rate_UTM)
bysort year: egen ave_hazard_rate_UTC=mean(hazard_rate_UTC)

bysort year: egen ave_hazard_rate_CTF=mean(hazard_rate_CTF)
bysort year: egen ave_hazard_rate_CTP=mean(hazard_rate_CTP)
bysort year: egen ave_hazard_rate_CTM=mean(hazard_rate_CTM)
bysort year: egen ave_hazard_rate_CTU=mean(hazard_rate_CTU)
bysort year: egen ave_hazard_rate_CTC=mean(hazard_rate_CTC)

bysort year: egen ave_year_FTF=mean(ave_FTF)
bysort year: egen ave_year_FTP=mean(ave_FTP)
bysort year: egen ave_year_FTM=mean(ave_FTM)
bysort year: egen ave_year_FTU=mean(ave_FTU)
bysort year: egen ave_year_FTC=mean(ave_FTC)

bysort year: egen ave_year_PTF=mean(ave_PTF)
bysort year: egen ave_year_PTP=mean(ave_PTP)
bysort year: egen ave_year_PTM=mean(ave_PTM)
bysort year: egen ave_year_PTU=mean(ave_PTU)
bysort year: egen ave_year_PTC=mean(ave_PTC)

bysort year: egen ave_year_MTF=mean(ave_MTF)
bysort year: egen ave_year_MTP=mean(ave_MTP)
bysort year: egen ave_year_MTM=mean(ave_MTM)
bysort year: egen ave_year_MTU=mean(ave_MTU)
bysort year: egen ave_year_MTC=mean(ave_MTC)

bysort year: egen ave_year_UTF=mean(ave_UTF)
bysort year: egen ave_year_UTP=mean(ave_UTP)
bysort year: egen ave_year_UTM=mean(ave_UTM)
bysort year: egen ave_year_UTC=mean(ave_UTC)

bysort year: egen ave_year_CTF=mean(ave_CTF)
bysort year: egen ave_year_CTP=mean(ave_CTP)
bysort year: egen ave_year_CTM=mean(ave_CTM)
bysort year: egen ave_year_CTU=mean(ave_CTU)
bysort year: egen ave_year_CTC=mean(ave_CTC)


*bysort year: gen count_year=_n
*keep if count_year==1


saveold "\Preliminars_monthly.dta", replace

