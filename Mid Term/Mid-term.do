** .do file for APSTA-GE 2001 Mid-term
** credited by Yewei Sun
** Also available from https://github.com/sunyewei/Assignment-and-notes-APSTA-GE-2001

use "E:\NYU Master\Semester 1\APSTA-GE 2001 Statistic for Behavior and Social Science\Days Skipped Lunch.dta" 
stem days_skipped //1(a)
summarize days_skipped, detail //1(b)(c)(e)(f)
tab days_skipped //1(d)
graph box days_skipped //1(g)(h)
summarize days_skipped, detail //1(i)
gen days_skipped_double = 2 * days_skipped
summarize days_skipped_double, detail //1(j)(i)

summarize days_skipped_double, detail //2(b)(c)
histogram prop_dieted if male == 0, width(1) frequency title(Histogram of the data for Distribution A) //2(h)

twoway (scatter days_skipped male)(lfit days_skipped male), ytitle(days of skipped) xtitle(sex) //4