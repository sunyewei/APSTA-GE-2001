** .do file for APSTA-GE 2001 Final Project
** credited by Yewei Sun
** Also available from https://github.com/sunyewei/Assignment-and-notes-APSTA-GE-2001

summarize female, detail 
tabstat (female), stats (n, mean, min, max) 
tabstat weekly_wage educ,stat(sd mean p25 p50 p75 skew min max) //Q2

by female, sort: tabstat weekly_wage educ, stat(sd mean p25 p50 p75 skew min max) //Q3

graph box (weekly_wage educ), over (female) marker(1,mlabel( uniqid )) 
graph box (educ), over (female) marker(1,mlabel( uniqid ))
by female, sort: tabstat weekly_wage educ, stat(count min max p25 p50 p75) //Q4

pwcorr female educ weekly_wage, obs //Q5

graph twoway (scatter educ female) (lfit educ female), ytitle (Education) xtitle (Gender) title(Education vs. Gender) //Q7

graph twoway (scatter weekly_wage educ ) (lfit weekly_wage educ), ytitle (weekly wage) xtitle (Education) title(Wages vs. Education) //Q9

regress weekly_wage educ, beta //Q10

regress weekly_wage educ if female==1, beta //Q10 for female
regress weekly_wage educ if female==0, beta //Q10 for male

graph twoway (scatter weekly_wage educ if female == 0, ms(+)) ///
(lfit weekly_wage educ if female == 0) ///
(scatter weekly_wage educ if female == 1, ms(X)) ///
(lfit weekly_wage educ if female == 1), ///
legend(row(1) order(2 4) label(2 "male +") label(4 "female X")) ///
ytitle(Weekly Wage) //Q13

generate college_degree = 0
replace college_degree = 1 if educ >=16 & educ!= . //Q15

tabulate college_degree, freq //Q16

robvar weekly_wage, by(female), if college_degree == 1
ttest weekly_wage if college_degree == 1, by (female) //Q17

robvar weekly_wage, by(female), if college_degree == 0
ttest weekly_wage if college_degree == 0, by (female) //Q18
