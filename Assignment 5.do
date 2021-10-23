** .do file for APSTA-GE 2001 assignment 5
** credited by Yewei Sun
** Also available from https://github.com/sunyewei/Assignment-and-notes-APSTA-GE-2001

use "E:\NYU Master\Semester 1\APSTA-GE 2001 Statistic for Behavior and Social Science\Data sets\NELS.dta"
tabulate edexpect //7.1

tabulate gender edexpect //7.2

di 1-normal(1.36) //8.14(a)
di 1-normal(-2.08) //8.14(b)
di normal(1.36) //8.14(c)
di normal(-2.08) //8.14(d)
di 1-(1-normal(1.36))-normal(-2.08) //8.14(e)
di 1-normal(0.40)-(1-normal(1.36)) //8.14(f)
di 1-normal(-1.36)-(1-normal(-0.40)) //8.14(g)
di normal(-0.40)+1-normal(0.40) //8.14(h)

summarize achmat08, detail
return list
display normal((72-r(mean))/r(sd)) 
tabulate achmat08 //8.28

di 100/50^0.5 //9.4(c)
di 100/9^0.5 //9.4(e)