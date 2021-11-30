graph twoway (scatter weekly_wage educ if female == 0, ms(+)) ///
(lfit weekly_wage educ if female == 0) ///
(scatter weekly_wage educ if female == 1, ms(X)) ///
(lfit weekly_wage educ if female == 1), ///
legend(row(1) order(2 4) label(2 "male +") label(4 "female X")) ///
ytitle(Weekly Wage)