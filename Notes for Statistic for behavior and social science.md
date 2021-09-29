# Statistic for Behavior and Social Science

## Week 2

* Measure of Central Tendency
  * Mode
  * Median: Use to describe the data when you have huge outliers
  * Mean
* Skewness: left=negative; right=positive; The direction = the direction of the tail

Stata will treat discrete variable as continuous when doing calculation



## Week 3

### Generate and manipulate varibles

Generate: command use when you want to generate a new variable, can be shorten as 'gen'

> eg: 
> gen wt_lbs_plus_50 = 50 + wt_lbs
>
> gen wt_lbs_mult_2 = 2*wt_lbs
>
> //Transform wt_lbs by ADDING 50lbs to each person's weight

When you manipulate the original variable, the standardized deviation will reflect the same change.

![image-20210922174052890](https://wechat-1255725648.cos.ap-shanghai.myqcloud.com/image-20210922174052890.png)

![image-20210922174119034](https://wechat-1255725648.cos.ap-shanghai.myqcloud.com/image-20210922174119034.png)

![image-20210922174137353](https://wechat-1255725648.cos.ap-shanghai.myqcloud.com/image-20210922174137353.png)

### Code Varibles

> gen likerev = 6-like
>
> capture label define likertrev 1 "sd" 2 "d" 3 "n" 4 "a" 5 "sa"
>
> label values likerev likertrev

The capture label is used in the senario when you are trying to manipulate some variables that already exists.

### Standardized Score

> return list

The command "return" to users what state is currently stored in its memory

An easy example to generate **standardized deviation**:

> summarize wt_lbs
>
> return list
>
> gen zwt_lbs = (wt_lbs - r(mean))/r(sd)

Delete variables using **"drop" command**

Simpler way to generate **standardized deviation**:

> egen zwt_lbs1 = std(wt_lbs) // another way to generate z-scores

In STATA, **!= means not equal; a space means missing value**, e.g.

> tabulate zwt_lbs if abs(zwt_lbs) > 3 & zwt_lbs != .
>
> list id zwt_lbs if abs(zwt_lbs) > 3 & zwt_lbs != .

which means list values which are higher than 3 standard deviation and is not a missing value.



## Week 4

log transformation: transform asymmetrical distribution to a symmetrical one coUsing: gen y=ln(x)

### Regression

**Person Correlation: **
$$
r=\frac{\sum z_{x}z_{y}}{N-1}
$$
**Standardized the data:**
$$
Z_{x}=\frac{x-\bar{x}}{SD_{x}}
$$
**Positive Correlation:** x and y have a unidimensional relationship

**Comment Return List**: Use to display the post-estimation statistics that were usually hidden in STATA

