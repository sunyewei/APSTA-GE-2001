** .do file for APSTA-GE 2001 assignment 2
** credited by Yewei Sun
** Also available from https://github.com/sunyewei/Assignment-and-notes-APSTA-GE-2001

use "E:\NYU Master\Semester 1\APSTA-GE 2001 Statistic for Behavior and Social Science\Data sets\NELS.dta" 

histogram ses, by(computer) //2.15(a)

histogram ses, by(computer) percent normal
by computer, sort:summarize ses, detail //2.15(b)

graph box slfcnc08 slfcnc10 slfcnc12 //2.24(a)
summarize slfcnc08 slfcnc10 slfcnc12, detail //2.24(d)

graph box tcherint, by(gender) 
by gender, sort:summarize tcherint, detail //3.13(a)
graph box achrdg08 achrdg10 achrdg12, by(gender)
by gender, sort:summarize achrdg08 achrdg10 achrdg12, detail //3.13(b)
graph box absent12 cuts12 late12, by(gender)
by gender, sort:summarize absent12 cuts12 late12, detail //3.13(c)