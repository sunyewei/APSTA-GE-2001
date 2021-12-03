# Group activities for Class 14

## variable choose: hwkout12 achmat12



## Research question: Does time spend out of school matters for 12th grade maths achievement



> replace hwkout12re = 1 if hwkout12 <= 3 & hwkout12 != .
>
> replace hwkout12re = 2 if hwkout12 <= 5 & hwkout12 > 3 & hwkout12 != .
>
> replace hwkout12re = 3 if hwkout12 <= 8 & hwkout12 > 5 & hwkout12 != . // 1-6 "having fun" 7-12"mediocre" 13-20"hardworking"



> label define hwkout12re 1 "having fun" 2 "mediocre" 3 "hardworking"
>
> label values hwkout12re hwkout12re // recode variable



> oneway achmat12 hwkout12re, tabulate //ANOVA see Figure 1

![Figure 1](https://raw.githubusercontent.com/sunyewei/picgo/master/img/202112011849991.png)



> pwmean achmat12, over(hwkout12re) mcompare(bonferroni) effects //post-hoc test. See Figure 2

![Figure 2](https://raw.githubusercontent.com/sunyewei/picgo/master/img/202112011849504.png)

