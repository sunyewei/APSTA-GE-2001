** .do file for APSTA-GE 2001 assignment 3
** credited by Yewei Sun
** Also available from https://github.com/sunyewei/Assignment-and-notes-APSTA-GE-2001

use "E:\NYU Master\Semester 1\APSTA-GE 2001 Statistic for Behavior and Social Science\Data sets\Framingham.dta" 
tabulate AGE1 //4.20(a)(b)
summarize AGE1, detail //4.20(c)(d)
by SEX, sort: tab AGE1 //4.20(f)
gen BIRTHYR = 1956 - AGE1 //4.20(g)
summarize BIRTHYR, detail //4.20(h)(i)

use "E:\NYU Master\Semester 1\APSTA-GE 2001 Statistic for Behavior and Social Science\Data sets\NELS.dta" 
gen apoffyn = 0
replace apoffyn=1 if apoffer !=0 & apoffer !=.
replace apoffyn=. if apoffer==. 

codebook apoffyn
capture label define yesno 1"yes"0"no"
label value apoffyn yesno//4.26(a)

codebook apoffyn //4.26(b)

summarize apoffyn, detail //4.26(c)

gen BMIDIFF = BMI3-BMI1
gen CIGPDIFF=CIGPDAY3 - CIGPDAY1 //4.28(a)
codebook ANYCHD4
by ANYCHD4, sort: summarize BMIDIFF //4.28(b)
by ANYCHD4, sort: summarize CIGPDIFF //4.28(c)