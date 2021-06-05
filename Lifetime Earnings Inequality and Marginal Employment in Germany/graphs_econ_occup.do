***ECON Sector

**CS:

*Unconditional

cls
set more off

use "\Preliminars",clear
cd ""

*keep if female==0

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

label dir

label list w93_gen_gr_en

gen agriculture=0 if econ_act>0 & econ_act<14
replace agriculture=1 if econ_act>0 & econ_act<2

gen manufacture=0 if econ_act>0 & econ_act<14
replace manufacture=1 if econ_act>1 & econ_act<6

gen hotel_restaurants=0 if econ_act>0 & econ_act<14
replace hotel_restaurants=1 if econ_act==6

gen construction=0 if econ_act>0 & econ_act<14
replace construction=1 if econ_act==7

gen wholesale=0 if econ_act>0 & econ_act<14
replace wholesale=1 if econ_act==8

gen transport=0 if econ_act>0 & econ_act<14
replace transport=1 if econ_act==9

gen financial=0 if econ_act>0 & econ_act<14
replace financial=1 if econ_act==10

gen utilities=0 if econ_act>0 & econ_act<14
replace utilities=1 if econ_act==11

gen education_health=0 if econ_act>0 & econ_act<14
replace education_health=1 if econ_act==12

gen public_defense=0 if econ_act>0 & econ_act<14
replace public_defense=1 if econ_act==13

bysort year: egen mean_agriculture=mean(agriculture) if econ_act>0 & econ_act<14
bysort year: egen mean_manufacture=mean(manufacture) if econ_act>0 & econ_act<14
bysort year: egen mean_hotel_restaurant=mean(hotel_restaurant) if econ_act>0 & econ_act<14
bysort year: egen mean_construction=mean(construction) if econ_act>0 & econ_act<14
bysort year: egen mean_wholesale=mean(wholesale) if econ_act>0 & econ_act<14
bysort year: egen mean_transport=mean(transport) if econ_act>0 & econ_act<14
bysort year: egen mean_financial=mean(financial) if econ_act>0 & econ_act<14
bysort year: egen mean_utilities=mean(utilities) if econ_act>0 & econ_act<14
bysort year: egen mean_education_health=mean(education_health) if econ_act>0 & econ_act<14
bysort year: egen mean_public_defense=mean(public_defense) if econ_act>0 & econ_act<14

label variable mean_agriculture "Agriculture"
label variable mean_manufacture "Manufacture"
label variable mean_hotel_restaurant "Hotel & Restaurant"
label variable mean_construction "Construction"
label variable mean_wholesale "Wholesale"
label variable mean_transport "Transport"
label variable mean_financial "Financial"
label variable mean_utilities "Utilities"
label variable mean_education_health "Education & Health"
label variable mean_public_defense "Public Adm. & Defense"

**asyvars
graph bar (mean) mean_agriculture mean_manufacture mean_hotel_restaurant mean_construction mean_wholesale mean_transport mean_financial mean_utilities mean_education_health mean_public_defense, over(year, label(tstyle(major_nolabel) labsize(large) angle(45)))  bar(1, color(black)) bar(2, color(brown)) bar(3, color(orange)) bar(4, color(green)) bar(5, color(red)) bar(6, color(yellow)) bar(7, color(blue)) bar(8, color(gray)) bar(9, color(magenta)) bar(10, color(cyan)) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(5)) graphregion(color(white)) stack   exclude0 yla(0(0.2)1, labsize(large)) legend( label(1 "Agriculture") label(2 "Manufacture") label(3 "Hotel & Restaurant") label(4 "Construction") label(5 "Wholesale") label(6 "Transport") label(7 "Financial") label(8 "Utilities") label(9 "Education & Health") label(10 "Public Adm. & Defense") ) b1title(1975-2014)
graph export mean_econ_act_unc.png, replace

*Unconditional

cls
set more off

use "\Preliminars",clear
cd ""

keep if female==0

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

label dir

label list w93_gen_gr_en

gen agriculture=0 if econ_act>0 & econ_act<14
replace agriculture=1 if econ_act>0 & econ_act<2

gen manufacture=0 if econ_act>0 & econ_act<14
replace manufacture=1 if econ_act>1 & econ_act<6

gen hotel_restaurants=0 if econ_act>0 & econ_act<14
replace hotel_restaurants=1 if econ_act==6

gen construction=0 if econ_act>0 & econ_act<14
replace construction=1 if econ_act==7

gen wholesale=0 if econ_act>0 & econ_act<14
replace wholesale=1 if econ_act==8

gen transport=0 if econ_act>0 & econ_act<14
replace transport=1 if econ_act==9

gen financial=0 if econ_act>0 & econ_act<14
replace financial=1 if econ_act==10

gen utilities=0 if econ_act>0 & econ_act<14
replace utilities=1 if econ_act==11

gen education_health=0 if econ_act>0 & econ_act<14
replace education_health=1 if econ_act==12

gen public_defense=0 if econ_act>0 & econ_act<14
replace public_defense=1 if econ_act==13

bysort year: egen mean_agriculture=mean(agriculture) if econ_act>0 & econ_act<14
bysort year: egen mean_manufacture=mean(manufacture) if econ_act>0 & econ_act<14
bysort year: egen mean_hotel_restaurant=mean(hotel_restaurant) if econ_act>0 & econ_act<14
bysort year: egen mean_construction=mean(construction) if econ_act>0 & econ_act<14
bysort year: egen mean_wholesale=mean(wholesale) if econ_act>0 & econ_act<14
bysort year: egen mean_transport=mean(transport) if econ_act>0 & econ_act<14
bysort year: egen mean_financial=mean(financial) if econ_act>0 & econ_act<14
bysort year: egen mean_utilities=mean(utilities) if econ_act>0 & econ_act<14
bysort year: egen mean_education_health=mean(education_health) if econ_act>0 & econ_act<14
bysort year: egen mean_public_defense=mean(public_defense) if econ_act>0 & econ_act<14

label variable mean_agriculture "Agriculture"
label variable mean_manufacture "Manufacture"
label variable mean_hotel_restaurant "Hotel & Restaurant"
label variable mean_construction "Construction"
label variable mean_wholesale "Wholesale"
label variable mean_transport "Transport"
label variable mean_financial "Financial"
label variable mean_utilities "Utilities"
label variable mean_education_health "Education & Health"
label variable mean_public_defense "Public Adm. & Defense"

**asyvars
graph bar (mean) mean_agriculture mean_manufacture mean_hotel_restaurant mean_construction mean_wholesale mean_transport mean_financial mean_utilities mean_education_health mean_public_defense, over(year, label(tstyle(major_nolabel) labsize(large) angle(45)))  bar(1, color(black)) bar(2, color(brown)) bar(3, color(orange)) bar(4, color(green)) bar(5, color(red)) bar(6, color(yellow)) bar(7, color(blue)) bar(8, color(gray)) bar(9, color(magenta)) bar(10, color(cyan)) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(5)) graphregion(color(white)) stack   exclude0 yla(0(0.2)1, labsize(large)) legend( label(1 "Agriculture") label(2 "Manufacture") label(3 "Hotel & Restaurant") label(4 "Construction") label(5 "Wholesale") label(6 "Transport") label(7 "Financial") label(8 "Utilities") label(9 "Education & Health") label(10 "Public Adm. & Defense") ) b1title(1975-2014)
graph export mean_econ_act_male.png, replace

*Unconditional

cls
set more off

use "\Preliminars",clear
cd ""

keep if female==1

*keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1

sort persnr year begepi endepi

label dir

label list w93_gen_gr_en

gen agriculture=0 if econ_act>0 & econ_act<14
replace agriculture=1 if econ_act>0 & econ_act<2

gen manufacture=0 if econ_act>0 & econ_act<14
replace manufacture=1 if econ_act>1 & econ_act<6

gen hotel_restaurants=0 if econ_act>0 & econ_act<14
replace hotel_restaurants=1 if econ_act==6

gen construction=0 if econ_act>0 & econ_act<14
replace construction=1 if econ_act==7

gen wholesale=0 if econ_act>0 & econ_act<14
replace wholesale=1 if econ_act==8

gen transport=0 if econ_act>0 & econ_act<14
replace transport=1 if econ_act==9

gen financial=0 if econ_act>0 & econ_act<14
replace financial=1 if econ_act==10

gen utilities=0 if econ_act>0 & econ_act<14
replace utilities=1 if econ_act==11

gen education_health=0 if econ_act>0 & econ_act<14
replace education_health=1 if econ_act==12

gen public_defense=0 if econ_act>0 & econ_act<14
replace public_defense=1 if econ_act==13

bysort year: egen mean_agriculture=mean(agriculture) if econ_act>0 & econ_act<14
bysort year: egen mean_manufacture=mean(manufacture) if econ_act>0 & econ_act<14
bysort year: egen mean_hotel_restaurant=mean(hotel_restaurant) if econ_act>0 & econ_act<14
bysort year: egen mean_construction=mean(construction) if econ_act>0 & econ_act<14
bysort year: egen mean_wholesale=mean(wholesale) if econ_act>0 & econ_act<14
bysort year: egen mean_transport=mean(transport) if econ_act>0 & econ_act<14
bysort year: egen mean_financial=mean(financial) if econ_act>0 & econ_act<14
bysort year: egen mean_utilities=mean(utilities) if econ_act>0 & econ_act<14
bysort year: egen mean_education_health=mean(education_health) if econ_act>0 & econ_act<14
bysort year: egen mean_public_defense=mean(public_defense) if econ_act>0 & econ_act<14

label variable mean_agriculture "Agriculture"
label variable mean_manufacture "Manufacture"
label variable mean_hotel_restaurant "Hotel & Restaurant"
label variable mean_construction "Construction"
label variable mean_wholesale "Wholesale"
label variable mean_transport "Transport"
label variable mean_financial "Financial"
label variable mean_utilities "Utilities"
label variable mean_education_health "Education & Health"
label variable mean_public_defense "Public Adm. & Defense"

**asyvars
graph bar (mean) mean_agriculture mean_manufacture mean_hotel_restaurant mean_construction mean_wholesale mean_transport mean_financial mean_utilities mean_education_health mean_public_defense, over(year, label(tstyle(major_nolabel) labsize(large) angle(45)))  bar(1, color(black)) bar(2, color(brown)) bar(3, color(orange)) bar(4, color(green)) bar(5, color(red)) bar(6, color(yellow)) bar(7, color(blue)) bar(8, color(gray)) bar(9, color(magenta)) bar(10, color(cyan)) ytitle({bf:Share}, size(large) height(10)) legend(position(6) rows(5)) graphregion(color(white)) stack   exclude0 yla(0(0.2)1, labsize(large)) legend( label(1 "Agriculture") label(2 "Manufacture") label(3 "Hotel & Restaurant") label(4 "Construction") label(5 "Wholesale") label(6 "Transport") label(7 "Financial") label(8 "Utilities") label(9 "Education & Health") label(10 "Public Adm. & Defense") ) b1title(1975-2014)
graph export mean_econ_act_female.png, replace


**CS, Full TIME:

*Unconditional

cls
set more off

use "\Preliminars",clear
cd ""

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1
keep if form==1

sort persnr year begepi endepi

label dir

label list w93_gen_gr_en

gen agriculture=0 if econ_act>0 & econ_act<14
replace agriculture=1 if econ_act>0 & econ_act<2

gen manufacture=0 if econ_act>0 & econ_act<14
replace manufacture=1 if econ_act>1 & econ_act<6

gen hotel_restaurants=0 if econ_act>0 & econ_act<14
replace hotel_restaurants=1 if econ_act==6

gen construction=0 if econ_act>0 & econ_act<14
replace construction=1 if econ_act==7

gen wholesale=0 if econ_act>0 & econ_act<14
replace wholesale=1 if econ_act==8

gen transport=0 if econ_act>0 & econ_act<14
replace transport=1 if econ_act==9

gen financial=0 if econ_act>0 & econ_act<14
replace financial=1 if econ_act==10

gen utilities=0 if econ_act>0 & econ_act<14
replace utilities=1 if econ_act==11

gen education_health=0 if econ_act>0 & econ_act<14
replace education_health=1 if econ_act==12

gen public_defense=0 if econ_act>0 & econ_act<14
replace public_defense=1 if econ_act==13

bysort year: egen mean_agriculture=mean(agriculture) if econ_act>0 & econ_act<14
bysort year: egen mean_manufacture=mean(manufacture) if econ_act>0 & econ_act<14
bysort year: egen mean_hotel_restaurant=mean(hotel_restaurant) if econ_act>0 & econ_act<14
bysort year: egen mean_construction=mean(construction) if econ_act>0 & econ_act<14
bysort year: egen mean_wholesale=mean(wholesale) if econ_act>0 & econ_act<14
bysort year: egen mean_transport=mean(transport) if econ_act>0 & econ_act<14
bysort year: egen mean_financial=mean(financial) if econ_act>0 & econ_act<14
bysort year: egen mean_utilities=mean(utilities) if econ_act>0 & econ_act<14
bysort year: egen mean_education_health=mean(education_health) if econ_act>0 & econ_act<14
bysort year: egen mean_public_defense=mean(public_defense) if econ_act>0 & econ_act<14

label variable mean_agriculture "Agriculture"
label variable mean_manufacture "Manufacture"
label variable mean_hotel_restaurant "Hotel & Restaurant"
label variable mean_construction "Construction"
label variable mean_wholesale "Wholesale"
label variable mean_transport "Transport"
label variable mean_financial "Financial"
label variable mean_utilities "Utilities"
label variable mean_education_health "Education & Health"
label variable mean_public_defense "Public Adm. & Defense"

**asyvars
graph bar (mean) mean_agriculture mean_manufacture mean_hotel_restaurant mean_construction mean_wholesale mean_transport mean_financial mean_utilities mean_education_health mean_public_defense, over(year, label(tstyle(major_nolabel) labsize(large) angle(45)))  bar(1, color(black)) bar(2, color(brown)) bar(3, color(orange)) bar(4, color(green)) bar(5, color(red)) bar(6, color(yellow)) bar(7, color(blue)) bar(8, color(gray)) bar(9, color(magenta)) bar(10, color(cyan)) ytitle({bf:Share}, size(large) height(10)) legend(off) graphregion(color(white)) stack   exclude0 yla(0(0.2)1, labsize(large)) legend( label(1 "Agriculture") label(2 "Manufacture") label(3 "Hotel & Restaurant") label(4 "Construction") label(5 "Wholesale") label(6 "Transport") label(7 "Financial") label(8 "Utilities") label(9 "Education & Health") label(10 "Public Adm. & Defense") ) b1title(1999-2014)
graph export mean_econ_act_unc_full.png, replace

*Male

cls
set more off

use "\Preliminars",clear
cd ""

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1
keep if form==1

sort persnr year begepi endepi

label dir

label list w93_gen_gr_en

gen agriculture=0 if econ_act>0 & econ_act<14
replace agriculture=1 if econ_act>0 & econ_act<2

gen manufacture=0 if econ_act>0 & econ_act<14
replace manufacture=1 if econ_act>1 & econ_act<6

gen hotel_restaurants=0 if econ_act>0 & econ_act<14
replace hotel_restaurants=1 if econ_act==6

gen construction=0 if econ_act>0 & econ_act<14
replace construction=1 if econ_act==7

gen wholesale=0 if econ_act>0 & econ_act<14
replace wholesale=1 if econ_act==8

gen transport=0 if econ_act>0 & econ_act<14
replace transport=1 if econ_act==9

gen financial=0 if econ_act>0 & econ_act<14
replace financial=1 if econ_act==10

gen utilities=0 if econ_act>0 & econ_act<14
replace utilities=1 if econ_act==11

gen education_health=0 if econ_act>0 & econ_act<14
replace education_health=1 if econ_act==12

gen public_defense=0 if econ_act>0 & econ_act<14
replace public_defense=1 if econ_act==13

bysort year: egen mean_agriculture=mean(agriculture) if econ_act>0 & econ_act<14
bysort year: egen mean_manufacture=mean(manufacture) if econ_act>0 & econ_act<14
bysort year: egen mean_hotel_restaurant=mean(hotel_restaurant) if econ_act>0 & econ_act<14
bysort year: egen mean_construction=mean(construction) if econ_act>0 & econ_act<14
bysort year: egen mean_wholesale=mean(wholesale) if econ_act>0 & econ_act<14
bysort year: egen mean_transport=mean(transport) if econ_act>0 & econ_act<14
bysort year: egen mean_financial=mean(financial) if econ_act>0 & econ_act<14
bysort year: egen mean_utilities=mean(utilities) if econ_act>0 & econ_act<14
bysort year: egen mean_education_health=mean(education_health) if econ_act>0 & econ_act<14
bysort year: egen mean_public_defense=mean(public_defense) if econ_act>0 & econ_act<14

label variable mean_agriculture "Agriculture"
label variable mean_manufacture "Manufacture"
label variable mean_hotel_restaurant "Hotel & Restaurant"
label variable mean_construction "Construction"
label variable mean_wholesale "Wholesale"
label variable mean_transport "Transport"
label variable mean_financial "Financial"
label variable mean_utilities "Utilities"
label variable mean_education_health "Education & Health"
label variable mean_public_defense "Public Adm. & Defense"

**asyvars
graph bar (mean) mean_agriculture mean_manufacture mean_hotel_restaurant mean_construction mean_wholesale mean_transport mean_financial mean_utilities mean_education_health mean_public_defense, over(year, label(tstyle(major_nolabel) labsize(large) angle(45)))  bar(1, color(black)) bar(2, color(brown)) bar(3, color(orange)) bar(4, color(green)) bar(5, color(red)) bar(6, color(yellow)) bar(7, color(blue)) bar(8, color(gray)) bar(9, color(magenta)) bar(10, color(cyan)) ytitle({bf:Share}, size(large) height(10)) legend(off) graphregion(color(white)) stack   exclude0 yla(0(0.2)1, labsize(large)) legend( label(1 "Agriculture") label(2 "Manufacture") label(3 "Hotel & Restaurant") label(4 "Construction") label(5 "Wholesale") label(6 "Transport") label(7 "Financial") label(8 "Utilities") label(9 "Education & Health") label(10 "Public Adm. & Defense") ) b1title(1999-2014)
graph export mean_econ_act_male_full.png, replace

*Female

cls
set more off

use "\Preliminars",clear
cd ""

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1
keep if form==1

sort persnr year begepi endepi

label dir

label list w93_gen_gr_en

gen agriculture=0 if econ_act>0 & econ_act<14
replace agriculture=1 if econ_act>0 & econ_act<2

gen manufacture=0 if econ_act>0 & econ_act<14
replace manufacture=1 if econ_act>1 & econ_act<6

gen hotel_restaurants=0 if econ_act>0 & econ_act<14
replace hotel_restaurants=1 if econ_act==6

gen construction=0 if econ_act>0 & econ_act<14
replace construction=1 if econ_act==7

gen wholesale=0 if econ_act>0 & econ_act<14
replace wholesale=1 if econ_act==8

gen transport=0 if econ_act>0 & econ_act<14
replace transport=1 if econ_act==9

gen financial=0 if econ_act>0 & econ_act<14
replace financial=1 if econ_act==10

gen utilities=0 if econ_act>0 & econ_act<14
replace utilities=1 if econ_act==11

gen education_health=0 if econ_act>0 & econ_act<14
replace education_health=1 if econ_act==12

gen public_defense=0 if econ_act>0 & econ_act<14
replace public_defense=1 if econ_act==13

bysort year: egen mean_agriculture=mean(agriculture) if econ_act>0 & econ_act<14
bysort year: egen mean_manufacture=mean(manufacture) if econ_act>0 & econ_act<14
bysort year: egen mean_hotel_restaurant=mean(hotel_restaurant) if econ_act>0 & econ_act<14
bysort year: egen mean_construction=mean(construction) if econ_act>0 & econ_act<14
bysort year: egen mean_wholesale=mean(wholesale) if econ_act>0 & econ_act<14
bysort year: egen mean_transport=mean(transport) if econ_act>0 & econ_act<14
bysort year: egen mean_financial=mean(financial) if econ_act>0 & econ_act<14
bysort year: egen mean_utilities=mean(utilities) if econ_act>0 & econ_act<14
bysort year: egen mean_education_health=mean(education_health) if econ_act>0 & econ_act<14
bysort year: egen mean_public_defense=mean(public_defense) if econ_act>0 & econ_act<14

label variable mean_agriculture "Agriculture"
label variable mean_manufacture "Manufacture"
label variable mean_hotel_restaurant "Hotel & Restaurant"
label variable mean_construction "Construction"
label variable mean_wholesale "Wholesale"
label variable mean_transport "Transport"
label variable mean_financial "Financial"
label variable mean_utilities "Utilities"
label variable mean_education_health "Education & Health"
label variable mean_public_defense "Public Adm. & Defense"

**asyvars
graph bar (mean) mean_agriculture mean_manufacture mean_hotel_restaurant mean_construction mean_wholesale mean_transport mean_financial mean_utilities mean_education_health mean_public_defense, over(year, label(tstyle(major_nolabel) labsize(large) angle(45)))  bar(1, color(black)) bar(2, color(brown)) bar(3, color(orange)) bar(4, color(green)) bar(5, color(red)) bar(6, color(yellow)) bar(7, color(blue)) bar(8, color(gray)) bar(9, color(magenta)) bar(10, color(cyan)) ytitle({bf:Share}, size(large) height(10)) legend(off) graphregion(color(white)) stack   exclude0 yla(0(0.2)1, labsize(large)) legend( label(1 "Agriculture") label(2 "Manufacture") label(3 "Hotel & Restaurant") label(4 "Construction") label(5 "Wholesale") label(6 "Transport") label(7 "Financial") label(8 "Utilities") label(9 "Education & Health") label(10 "Public Adm. & Defense") ) b1title(1975-2014)
graph export mean_econ_act_female_full.png, replace



**CS, PART TIME:

*Unconditional

cls
set more off

use "\Preliminars",clear
cd ""

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1
keep if form==2

sort persnr year begepi endepi

label dir

label list w93_gen_gr_en

gen agriculture=0 if econ_act>0 & econ_act<14
replace agriculture=1 if econ_act>0 & econ_act<2

gen manufacture=0 if econ_act>0 & econ_act<14
replace manufacture=1 if econ_act>1 & econ_act<6

gen hotel_restaurants=0 if econ_act>0 & econ_act<14
replace hotel_restaurants=1 if econ_act==6

gen construction=0 if econ_act>0 & econ_act<14
replace construction=1 if econ_act==7

gen wholesale=0 if econ_act>0 & econ_act<14
replace wholesale=1 if econ_act==8

gen transport=0 if econ_act>0 & econ_act<14
replace transport=1 if econ_act==9

gen financial=0 if econ_act>0 & econ_act<14
replace financial=1 if econ_act==10

gen utilities=0 if econ_act>0 & econ_act<14
replace utilities=1 if econ_act==11

gen education_health=0 if econ_act>0 & econ_act<14
replace education_health=1 if econ_act==12

gen public_defense=0 if econ_act>0 & econ_act<14
replace public_defense=1 if econ_act==13

bysort year: egen mean_agriculture=mean(agriculture) if econ_act>0 & econ_act<14
bysort year: egen mean_manufacture=mean(manufacture) if econ_act>0 & econ_act<14
bysort year: egen mean_hotel_restaurant=mean(hotel_restaurant) if econ_act>0 & econ_act<14
bysort year: egen mean_construction=mean(construction) if econ_act>0 & econ_act<14
bysort year: egen mean_wholesale=mean(wholesale) if econ_act>0 & econ_act<14
bysort year: egen mean_transport=mean(transport) if econ_act>0 & econ_act<14
bysort year: egen mean_financial=mean(financial) if econ_act>0 & econ_act<14
bysort year: egen mean_utilities=mean(utilities) if econ_act>0 & econ_act<14
bysort year: egen mean_education_health=mean(education_health) if econ_act>0 & econ_act<14
bysort year: egen mean_public_defense=mean(public_defense) if econ_act>0 & econ_act<14

label variable mean_agriculture "Agriculture"
label variable mean_manufacture "Manufacture"
label variable mean_hotel_restaurant "Hotel & Restaurant"
label variable mean_construction "Construction"
label variable mean_wholesale "Wholesale"
label variable mean_transport "Transport"
label variable mean_financial "Financial"
label variable mean_utilities "Utilities"
label variable mean_education_health "Education & Health"
label variable mean_public_defense "Public Adm. & Defense"

**asyvars
graph bar (mean) mean_agriculture mean_manufacture mean_hotel_restaurant mean_construction mean_wholesale mean_transport mean_financial mean_utilities mean_education_health mean_public_defense, over(year, label(tstyle(major_nolabel) labsize(large) angle(45)))  bar(1, color(black)) bar(2, color(brown)) bar(3, color(orange)) bar(4, color(green)) bar(5, color(red)) bar(6, color(yellow)) bar(7, color(blue)) bar(8, color(gray)) bar(9, color(magenta)) bar(10, color(cyan)) ytitle({bf:Share}, size(large) height(10)) legend(off) graphregion(color(white)) stack   exclude0 yla(0(0.2)1, labsize(large)) legend( label(1 "Agriculture") label(2 "Manufacture") label(3 "Hotel & Restaurant") label(4 "Construction") label(5 "Wholesale") label(6 "Transport") label(7 "Financial") label(8 "Utilities") label(9 "Education & Health") label(10 "Public Adm. & Defense") ) b1title(1999-2014)
graph export mean_econ_act_unc_part.png, replace

*Male

cls
set more off

use "\Preliminars",clear
cd ""

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1
keep if form==2

sort persnr year begepi endepi

label dir

label list w93_gen_gr_en

gen agriculture=0 if econ_act>0 & econ_act<14
replace agriculture=1 if econ_act>0 & econ_act<2

gen manufacture=0 if econ_act>0 & econ_act<14
replace manufacture=1 if econ_act>1 & econ_act<6

gen hotel_restaurants=0 if econ_act>0 & econ_act<14
replace hotel_restaurants=1 if econ_act==6

gen construction=0 if econ_act>0 & econ_act<14
replace construction=1 if econ_act==7

gen wholesale=0 if econ_act>0 & econ_act<14
replace wholesale=1 if econ_act==8

gen transport=0 if econ_act>0 & econ_act<14
replace transport=1 if econ_act==9

gen financial=0 if econ_act>0 & econ_act<14
replace financial=1 if econ_act==10

gen utilities=0 if econ_act>0 & econ_act<14
replace utilities=1 if econ_act==11

gen education_health=0 if econ_act>0 & econ_act<14
replace education_health=1 if econ_act==12

gen public_defense=0 if econ_act>0 & econ_act<14
replace public_defense=1 if econ_act==13

bysort year: egen mean_agriculture=mean(agriculture) if econ_act>0 & econ_act<14
bysort year: egen mean_manufacture=mean(manufacture) if econ_act>0 & econ_act<14
bysort year: egen mean_hotel_restaurant=mean(hotel_restaurant) if econ_act>0 & econ_act<14
bysort year: egen mean_construction=mean(construction) if econ_act>0 & econ_act<14
bysort year: egen mean_wholesale=mean(wholesale) if econ_act>0 & econ_act<14
bysort year: egen mean_transport=mean(transport) if econ_act>0 & econ_act<14
bysort year: egen mean_financial=mean(financial) if econ_act>0 & econ_act<14
bysort year: egen mean_utilities=mean(utilities) if econ_act>0 & econ_act<14
bysort year: egen mean_education_health=mean(education_health) if econ_act>0 & econ_act<14
bysort year: egen mean_public_defense=mean(public_defense) if econ_act>0 & econ_act<14

label variable mean_agriculture "Agriculture"
label variable mean_manufacture "Manufacture"
label variable mean_hotel_restaurant "Hotel & Restaurant"
label variable mean_construction "Construction"
label variable mean_wholesale "Wholesale"
label variable mean_transport "Transport"
label variable mean_financial "Financial"
label variable mean_utilities "Utilities"
label variable mean_education_health "Education & Health"
label variable mean_public_defense "Public Adm. & Defense"

**asyvars
graph bar (mean) mean_agriculture mean_manufacture mean_hotel_restaurant mean_construction mean_wholesale mean_transport mean_financial mean_utilities mean_education_health mean_public_defense, over(year, label(tstyle(major_nolabel) labsize(large) angle(45)))  bar(1, color(black)) bar(2, color(brown)) bar(3, color(orange)) bar(4, color(green)) bar(5, color(red)) bar(6, color(yellow)) bar(7, color(blue)) bar(8, color(gray)) bar(9, color(magenta)) bar(10, color(cyan)) ytitle({bf:Share}, size(large) height(10)) legend(off) graphregion(color(white)) stack   exclude0 yla(0(0.2)1, labsize(large)) legend( label(1 "Agriculture") label(2 "Manufacture") label(3 "Hotel & Restaurant") label(4 "Construction") label(5 "Wholesale") label(6 "Transport") label(7 "Financial") label(8 "Utilities") label(9 "Education & Health") label(10 "Public Adm. & Defense") ) b1title(1999-2014)
graph export mean_econ_act_male_part.png, replace

*Female

cls
set more off

use "\Preliminars",clear
cd ""

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1
keep if form==2

sort persnr year begepi endepi

label dir

label list w93_gen_gr_en

gen agriculture=0 if econ_act>0 & econ_act<14
replace agriculture=1 if econ_act>0 & econ_act<2

gen manufacture=0 if econ_act>0 & econ_act<14
replace manufacture=1 if econ_act>1 & econ_act<6

gen hotel_restaurants=0 if econ_act>0 & econ_act<14
replace hotel_restaurants=1 if econ_act==6

gen construction=0 if econ_act>0 & econ_act<14
replace construction=1 if econ_act==7

gen wholesale=0 if econ_act>0 & econ_act<14
replace wholesale=1 if econ_act==8

gen transport=0 if econ_act>0 & econ_act<14
replace transport=1 if econ_act==9

gen financial=0 if econ_act>0 & econ_act<14
replace financial=1 if econ_act==10

gen utilities=0 if econ_act>0 & econ_act<14
replace utilities=1 if econ_act==11

gen education_health=0 if econ_act>0 & econ_act<14
replace education_health=1 if econ_act==12

gen public_defense=0 if econ_act>0 & econ_act<14
replace public_defense=1 if econ_act==13

bysort year: egen mean_agriculture=mean(agriculture) if econ_act>0 & econ_act<14
bysort year: egen mean_manufacture=mean(manufacture) if econ_act>0 & econ_act<14
bysort year: egen mean_hotel_restaurant=mean(hotel_restaurant) if econ_act>0 & econ_act<14
bysort year: egen mean_construction=mean(construction) if econ_act>0 & econ_act<14
bysort year: egen mean_wholesale=mean(wholesale) if econ_act>0 & econ_act<14
bysort year: egen mean_transport=mean(transport) if econ_act>0 & econ_act<14
bysort year: egen mean_financial=mean(financial) if econ_act>0 & econ_act<14
bysort year: egen mean_utilities=mean(utilities) if econ_act>0 & econ_act<14
bysort year: egen mean_education_health=mean(education_health) if econ_act>0 & econ_act<14
bysort year: egen mean_public_defense=mean(public_defense) if econ_act>0 & econ_act<14

label variable mean_agriculture "Agriculture"
label variable mean_manufacture "Manufacture"
label variable mean_hotel_restaurant "Hotel & Restaurant"
label variable mean_construction "Construction"
label variable mean_wholesale "Wholesale"
label variable mean_transport "Transport"
label variable mean_financial "Financial"
label variable mean_utilities "Utilities"
label variable mean_education_health "Education & Health"
label variable mean_public_defense "Public Adm. & Defense"

**asyvars
graph bar (mean) mean_agriculture mean_manufacture mean_hotel_restaurant mean_construction mean_wholesale mean_transport mean_financial mean_utilities mean_education_health mean_public_defense, over(year, label(tstyle(major_nolabel) labsize(large) angle(45)))  bar(1, color(black)) bar(2, color(brown)) bar(3, color(orange)) bar(4, color(green)) bar(5, color(red)) bar(6, color(yellow)) bar(7, color(blue)) bar(8, color(gray)) bar(9, color(magenta)) bar(10, color(cyan)) ytitle({bf:Share}, size(large) height(10)) legend(off) graphregion(color(white)) stack   exclude0 yla(0(0.2)1, labsize(large)) legend( label(1 "Agriculture") label(2 "Manufacture") label(3 "Hotel & Restaurant") label(4 "Construction") label(5 "Wholesale") label(6 "Transport") label(7 "Financial") label(8 "Utilities") label(9 "Education & Health") label(10 "Public Adm. & Defense") ) b1title(1975-2014)
graph export mean_econ_act_female_part.png, replace


**CS, Marg. Empl.:

*Unconditional

cls
set more off

use "\Preliminars",clear
cd ""

*keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1
keep if form==3

sort persnr year begepi endepi

label dir

label list w93_gen_gr_en

gen agriculture=0 if econ_act>0 & econ_act<14
replace agriculture=1 if econ_act>0 & econ_act<2

gen manufacture=0 if econ_act>0 & econ_act<14
replace manufacture=1 if econ_act>1 & econ_act<6

gen hotel_restaurants=0 if econ_act>0 & econ_act<14
replace hotel_restaurants=1 if econ_act==6

gen construction=0 if econ_act>0 & econ_act<14
replace construction=1 if econ_act==7

gen wholesale=0 if econ_act>0 & econ_act<14
replace wholesale=1 if econ_act==8

gen transport=0 if econ_act>0 & econ_act<14
replace transport=1 if econ_act==9

gen financial=0 if econ_act>0 & econ_act<14
replace financial=1 if econ_act==10

gen utilities=0 if econ_act>0 & econ_act<14
replace utilities=1 if econ_act==11

gen education_health=0 if econ_act>0 & econ_act<14
replace education_health=1 if econ_act==12

gen public_defense=0 if econ_act>0 & econ_act<14
replace public_defense=1 if econ_act==13

bysort year: egen mean_agriculture=mean(agriculture) if econ_act>0 & econ_act<14
bysort year: egen mean_manufacture=mean(manufacture) if econ_act>0 & econ_act<14
bysort year: egen mean_hotel_restaurant=mean(hotel_restaurant) if econ_act>0 & econ_act<14
bysort year: egen mean_construction=mean(construction) if econ_act>0 & econ_act<14
bysort year: egen mean_wholesale=mean(wholesale) if econ_act>0 & econ_act<14
bysort year: egen mean_transport=mean(transport) if econ_act>0 & econ_act<14
bysort year: egen mean_financial=mean(financial) if econ_act>0 & econ_act<14
bysort year: egen mean_utilities=mean(utilities) if econ_act>0 & econ_act<14
bysort year: egen mean_education_health=mean(education_health) if econ_act>0 & econ_act<14
bysort year: egen mean_public_defense=mean(public_defense) if econ_act>0 & econ_act<14

label variable mean_agriculture "Agriculture"
label variable mean_manufacture "Manufacture"
label variable mean_hotel_restaurant "Hotel & Restaurant"
label variable mean_construction "Construction"
label variable mean_wholesale "Wholesale"
label variable mean_transport "Transport"
label variable mean_financial "Financial"
label variable mean_utilities "Utilities"
label variable mean_education_health "Education & Health"
label variable mean_public_defense "Public Adm. & Defense"

**asyvars
graph bar (mean) mean_agriculture mean_manufacture mean_hotel_restaurant mean_construction mean_wholesale mean_transport mean_financial mean_utilities mean_education_health mean_public_defense, over(year, label(tstyle(major_nolabel) labsize(large) angle(45)))  bar(1, color(black)) bar(2, color(brown)) bar(3, color(orange)) bar(4, color(green)) bar(5, color(red)) bar(6, color(yellow)) bar(7, color(blue)) bar(8, color(gray)) bar(9, color(magenta)) bar(10, color(cyan)) ytitle({bf:Share}, size(large) height(10)) legend(off) graphregion(color(white)) stack   exclude0 yla(0(0.2)1, labsize(large)) legend( label(1 "Agriculture") label(2 "Manufacture") label(3 "Hotel & Restaurant") label(4 "Construction") label(5 "Wholesale") label(6 "Transport") label(7 "Financial") label(8 "Utilities") label(9 "Education & Health") label(10 "Public Adm. & Defense") ) b1title(1999-2014)
graph export mean_econ_act_unc_mini.png, replace

*Male

cls
set more off

use "\Preliminars",clear
cd ""

keep if female==0

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1
keep if form==3

sort persnr year begepi endepi

label dir

label list w93_gen_gr_en

gen agriculture=0 if econ_act>0 & econ_act<14
replace agriculture=1 if econ_act>0 & econ_act<2

gen manufacture=0 if econ_act>0 & econ_act<14
replace manufacture=1 if econ_act>1 & econ_act<6

gen hotel_restaurants=0 if econ_act>0 & econ_act<14
replace hotel_restaurants=1 if econ_act==6

gen construction=0 if econ_act>0 & econ_act<14
replace construction=1 if econ_act==7

gen wholesale=0 if econ_act>0 & econ_act<14
replace wholesale=1 if econ_act==8

gen transport=0 if econ_act>0 & econ_act<14
replace transport=1 if econ_act==9

gen financial=0 if econ_act>0 & econ_act<14
replace financial=1 if econ_act==10

gen utilities=0 if econ_act>0 & econ_act<14
replace utilities=1 if econ_act==11

gen education_health=0 if econ_act>0 & econ_act<14
replace education_health=1 if econ_act==12

gen public_defense=0 if econ_act>0 & econ_act<14
replace public_defense=1 if econ_act==13

bysort year: egen mean_agriculture=mean(agriculture) if econ_act>0 & econ_act<14
bysort year: egen mean_manufacture=mean(manufacture) if econ_act>0 & econ_act<14
bysort year: egen mean_hotel_restaurant=mean(hotel_restaurant) if econ_act>0 & econ_act<14
bysort year: egen mean_construction=mean(construction) if econ_act>0 & econ_act<14
bysort year: egen mean_wholesale=mean(wholesale) if econ_act>0 & econ_act<14
bysort year: egen mean_transport=mean(transport) if econ_act>0 & econ_act<14
bysort year: egen mean_financial=mean(financial) if econ_act>0 & econ_act<14
bysort year: egen mean_utilities=mean(utilities) if econ_act>0 & econ_act<14
bysort year: egen mean_education_health=mean(education_health) if econ_act>0 & econ_act<14
bysort year: egen mean_public_defense=mean(public_defense) if econ_act>0 & econ_act<14

label variable mean_agriculture "Agriculture"
label variable mean_manufacture "Manufacture"
label variable mean_hotel_restaurant "Hotel & Restaurant"
label variable mean_construction "Construction"
label variable mean_wholesale "Wholesale"
label variable mean_transport "Transport"
label variable mean_financial "Financial"
label variable mean_utilities "Utilities"
label variable mean_education_health "Education & Health"
label variable mean_public_defense "Public Adm. & Defense"

**asyvars
graph bar (mean) mean_agriculture mean_manufacture mean_hotel_restaurant mean_construction mean_wholesale mean_transport mean_financial mean_utilities mean_education_health mean_public_defense, over(year, label(tstyle(major_nolabel) labsize(large) angle(45)))  bar(1, color(black)) bar(2, color(brown)) bar(3, color(orange)) bar(4, color(green)) bar(5, color(red)) bar(6, color(yellow)) bar(7, color(blue)) bar(8, color(gray)) bar(9, color(magenta)) bar(10, color(cyan)) ytitle({bf:Share}, size(large) height(10)) legend(off) graphregion(color(white)) stack   exclude0 yla(0(0.2)1, labsize(large)) legend( label(1 "Agriculture") label(2 "Manufacture") label(3 "Hotel & Restaurant") label(4 "Construction") label(5 "Wholesale") label(6 "Transport") label(7 "Financial") label(8 "Utilities") label(9 "Education & Health") label(10 "Public Adm. & Defense") ) b1title(1999-2014)
graph export mean_econ_act_male_mini.png, replace

*Female

cls
set more off

use "\Preliminars",clear
cd ""

keep if female==1

keep if year>=1999 & year!=.

qui drop if age<22
qui drop if age>56

drop if source!=1
keep if form==3

sort persnr year begepi endepi

label dir

label list w93_gen_gr_en

gen agriculture=0 if econ_act>0 & econ_act<14
replace agriculture=1 if econ_act>0 & econ_act<2

gen manufacture=0 if econ_act>0 & econ_act<14
replace manufacture=1 if econ_act>1 & econ_act<6

gen hotel_restaurants=0 if econ_act>0 & econ_act<14
replace hotel_restaurants=1 if econ_act==6

gen construction=0 if econ_act>0 & econ_act<14
replace construction=1 if econ_act==7

gen wholesale=0 if econ_act>0 & econ_act<14
replace wholesale=1 if econ_act==8

gen transport=0 if econ_act>0 & econ_act<14
replace transport=1 if econ_act==9

gen financial=0 if econ_act>0 & econ_act<14
replace financial=1 if econ_act==10

gen utilities=0 if econ_act>0 & econ_act<14
replace utilities=1 if econ_act==11

gen education_health=0 if econ_act>0 & econ_act<14
replace education_health=1 if econ_act==12

gen public_defense=0 if econ_act>0 & econ_act<14
replace public_defense=1 if econ_act==13

bysort year: egen mean_agriculture=mean(agriculture) if econ_act>0 & econ_act<14
bysort year: egen mean_manufacture=mean(manufacture) if econ_act>0 & econ_act<14
bysort year: egen mean_hotel_restaurant=mean(hotel_restaurant) if econ_act>0 & econ_act<14
bysort year: egen mean_construction=mean(construction) if econ_act>0 & econ_act<14
bysort year: egen mean_wholesale=mean(wholesale) if econ_act>0 & econ_act<14
bysort year: egen mean_transport=mean(transport) if econ_act>0 & econ_act<14
bysort year: egen mean_financial=mean(financial) if econ_act>0 & econ_act<14
bysort year: egen mean_utilities=mean(utilities) if econ_act>0 & econ_act<14
bysort year: egen mean_education_health=mean(education_health) if econ_act>0 & econ_act<14
bysort year: egen mean_public_defense=mean(public_defense) if econ_act>0 & econ_act<14

label variable mean_agriculture "Agriculture"
label variable mean_manufacture "Manufacture"
label variable mean_hotel_restaurant "Hotel & Restaurant"
label variable mean_construction "Construction"
label variable mean_wholesale "Wholesale"
label variable mean_transport "Transport"
label variable mean_financial "Financial"
label variable mean_utilities "Utilities"
label variable mean_education_health "Education & Health"
label variable mean_public_defense "Public Adm. & Defense"

**asyvars
graph bar (mean) mean_agriculture mean_manufacture mean_hotel_restaurant mean_construction mean_wholesale mean_transport mean_financial mean_utilities mean_education_health mean_public_defense, over(year, label(tstyle(major_nolabel) labsize(large) angle(45)))  bar(1, color(black)) bar(2, color(brown)) bar(3, color(orange)) bar(4, color(green)) bar(5, color(red)) bar(6, color(yellow)) bar(7, color(blue)) bar(8, color(gray)) bar(9, color(magenta)) bar(10, color(cyan)) ytitle({bf:Share}, size(large) height(10)) legend(off) graphregion(color(white)) stack   exclude0 yla(0(0.2)1, labsize(large)) legend( label(1 "Agriculture") label(2 "Manufacture") label(3 "Hotel & Restaurant") label(4 "Construction") label(5 "Wholesale") label(6 "Transport") label(7 "Financial") label(8 "Utilities") label(9 "Education & Health") label(10 "Public Adm. & Defense") ) b1title(1999-2014)
graph export mean_econ_act_female_mini.png, replace

