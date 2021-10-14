# Statistic for Behavior and Social Science

## Week 1

1. Nominal Level: based on the simplest form of observation - whether two objects are similar or dissimilar
2. Ordinal Level: different numbers are assigned to persons or objects that possess different amounts of the underlying characteristic, and the higher the number assigned to a person or object, the less (or more) of the underlying characteristic that person or object is observed to possess
3. Interval Level:
4. Ratio Level: 

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

![](https://raw.githubusercontent.com/sunyewei/picgo/master/img/202109292127436.png)

![](https://raw.githubusercontent.com/sunyewei/picgo/master/img/202109292127437.png)

![](https://raw.githubusercontent.com/sunyewei/picgo/master/img/202109292127438.png)

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

### Regression in STATA

#### Person Correlation: 

$$
r=\frac{\sum z_{x}z_{y}}{N-1}
$$

**Calculate the correlation in STATA: **

> cur f(x) g(x)

#### Standardized the data:

$$
Z_{x}=\frac{x-\bar{x}}{SD_{x}}
$$

**Positive Correlation:** x and y have a unidimensional relationship

**Command "Return List": Use to display the post-estimation statistics that were usually hidden in STATA**

![屏幕截图 2021-09-29 203444](https://raw.githubusercontent.com/sunyewei/picgo/master/img/202109292116112.jpg)

#### Add a regression line to the scatter plot:

> twoway (scatter f(x) g(x) ) (lfit f(x) g(x))

The command **"lfit"** means add a regression line to the scatter plot

The regression line is given by: 
$$
\hat{y}=bX+a \\
b=r\frac{S_{y}}{S_{x}} \\
a=\bar{Y}-b\bar{X}
$$

#### Calculate the regression in STATA

> regress f(x) g(x)

#### Predict a Y value after the regression:

> predict h(x)

#### R-Squared shows how much percentage of the g(x) can be predicted by f(x)

#### The Beta value predits the association between the change of Standard Deviation within x and y 

E.g. the beta value for x~y = 0.6, the difference between one standard deviation of x result in 0.6 standard deviation of y they predit.

