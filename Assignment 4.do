** .do file for APSTA-GE 2001 assignment 4
** credited by Yewei Sun
** Also available from https://github.com/sunyewei/Assignment-and-notes-APSTA-GE-2001

use "E:\NYU Master\Semester 1\APSTA-GE 2001 Statistic for Behavior and Social Science\Data sets\NELS.dta" 
twoway scatter achsci12 gender, mlabel(id), if region == 4, xlabel(0 1, valuelabel) //5.5(a)

use "E:\NYU Master\Semester 1\APSTA-GE 2001 Statistic for Behavior and Social Science\Data sets\Framingham.dta" 
correlate BMI1 TOTCHOL1 //5.5(b)

scatter BMI1 TOTCHOL1, mlabel(ID)
browse //5.5(c)

correlate BMI1 TOTCHOL1 if ID!=205 //5.5(d)

twoway (scatter ses computer) (lfit ses computer) //5.9(a)
correlate ses computer //5.9(b)

twoway (scatter ses achmat12) (lfit ses achmat12) //6.3(a)
regress achmat12 ses //6.3(b)

twoway (scatter BMI1 DIABP1) (lfit BMI1 DIABP1), ytitle(BMI & DIABP1)
twoway (scatter BMI1 HEARTRTE1) (lfit BMI1 HEARTRTE1), ytitle(BMI & HEARTRTE1) //6.6(a)

correlate BMI1 DIABP1
correlate BMI1 HEARTRTE1 //6.6(b)

regress DIABP1 BMI1
regress HEARTRTE1 BMI1 //6.6(c)