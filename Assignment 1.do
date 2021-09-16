** .do file for APSTA-GE 2001 assignment 1
** credited by Yewei Sun
** Also available from https://github.com/sunyewei/Assignment-and-notes-APSTA-GE-2001

use "E:\NYU Master\Semester 1\APSTA-GE 2001 Statistic for Behavior and Social Science\Data sets\NELS.dta" 

graph bar (mean)alcbinge, over(gender)blabel(total)ytitle(“percent who ever binged on alcohol”) //2.5(a)
** or we can simply use "sum alcbinge if gender == 0" to gain the result
graph bar (mean)gender, over(alcbinge)blabel(total)ytitle(“female percent who ever binged on alcohol”) //2.5(c)

stem achmat08 //2.12(a)

kdensity achmat08, ytitle("kdensity graph of 8th maths score")
graph box achmat08, ytitle("box graph of 8th maths score") //2.12(d)

graph box late12 //2.23(a)