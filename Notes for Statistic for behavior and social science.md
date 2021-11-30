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



## Week 7

$$
P(E) = \frac{N \ of \ Outcomes \ Satisfying \ E}{Total \ Number \ of \ Equally \ Likely \ Outcomes}
$$



### The Complement Rule of Probability

If two events E1 and E2 are complements of each other, 

**then P(E1 ) = 1 - P(E2 ) **

### The Additive Rules of Probability

1. When two events E1 and E2 of the same experiment are mutually exclusive or disjoint, 

   **P(E1 or E2 ) = P(E1 ) + P(E2 )**

2. Given two events E1 and E2 of the same experiment, 

   **P(E1 or E2)  = P(E1) + P(E2) – P(E1 and E2)**

### The Multiplicative Rule of Probability

Suppose E1 and E2 are independent events of the same experiment, (E1 and E2 are said to be independent events if they have no effect on each other; that is, the occurrence of E1 has no effect on the probability of E2.) 

**Then P(E1 and E2) = P(E1 )  * P(E2 )**

This result also holds for more than two events if they are mutually independent.

### Normal Distributation

![IMG_20211020_173243__01](https://raw.githubusercontent.com/sunyewei/picgo/master/img/202110201734297.jpg)

* The particular normal distribution with mean 0 and standard deviation 1 is called the standard normal distribution
* A normal distribution is symmetric about its mean
* A normal distribution is asymptotic. It extends indefinitely to the right and to the left of the mean, always getting closer and closer to the horizontal axis but never quite reaching it
* The total area under the normal distribution is 1

To find the area under the normal curve to the **left** of a z-score

> display normal(z)



## Week 9

**μ** is the mean of the population. 

### 95% Confidence Level

$$
(\bar{x}-1.96\frac{\sigma}{\sqrt{n}},\bar{x}+1.96\frac{\sigma}{\sqrt{n}})
$$

### A general equation for the CI for estimating µ is:

$$
(\bar{x}-z_{c}\frac{\sigma}{\sqrt{n}},\bar{x}+z_{c}\frac{\sigma}{\sqrt{n}})
$$

### Standard Error or the Standard Deviation of Sample:

$$
\sigma_{\bar{x}}=\frac{\sigma}{\sqrt{n}}
$$

### Hypothesis Testing

H0: believed to be true until shown to be implausible (or nullified), it is called the null hypothesis

H1: the alternative hypothesis is the statement we would switch to if, through our experiment or study, H0 were shown to be implausible and H1 plausible



## Week 10

When the SD of the population is **Known**: Z-test

When the SD of the population is **Unknown**: T-test



## Week 11

### Two-Sample T-test

H0: μf = μm ---> Δ=0

H1: μf != μm
$$
t = \frac{(\bar{x}_{m}-\bar{x}_{f})-(\bar{\mu}_{m}-\bar{\mu}_{f})}{\hat{\sigma}}
$$
**Independent Samples: **Compares two independent groups where the scores cannot be matched on a pairwise basis, as in Example 1 in the previous slide. Involves a scale and a dichotomous variable

**Paired Samples:** Compares two variables where the scores can be matched on a pairwise basis

### the Homogeneity Assumption using the Levene’s test (Represent as W0)

> e.g. robvar BMI1 if CURSMOKE1 == 1, by(SEX)

The null hypothesis is that the variances are equal

The alternative hypothesis is that the variances are not equal
If p (for Levene’s test) > .05 use the equal variances line (independent samples t-test)
If p (for Levene’s test) < .05, use the unequal variances line (adjusted independent samples ttest)

### The Non-Directional T-Test

> e.g. ttest BMI1 if CURSMOKE1 == 1, by(SEX)

### Effect Size for Independent Samples t-Test

#### ![image-20211110180552884](https://raw.githubusercontent.com/sunyewei/picgo/master/img/202111101805008.png)

In education, we do not always see huge effect size

> e.g. d=0.31, The average BMI at time 1 for males is .31 standard deviations higher than for females, which is a reasonably moderate effect, suggesting that the difference is both statistically and substantively significant.

### Paired Sample T-Test

Example 2: Is there a change in BMI from time 1 to time 3 for females who are current smokers at both times 1 and 3?

> ttest BMI1 == BMI3 if SEX == 2 & CURSMOKE1 == 1 & CURSMOKE3 == 1

## Week 12

### Anova

**Basic question:** Do the mean outcomes (of a continuous variable) differ across groups (of a categorical variable; e.g., gender groups; treatment groups)?

![IMG_0662](https://raw.githubusercontent.com/sunyewei/picgo/master/img/202111171735830.PNG)

H0: All of the group means are equal

H1: At least one of the pairs of means is not equal

![image-20211117185014113](https://raw.githubusercontent.com/sunyewei/picgo/master/img/202111171850389.png)

**To find a critical value**:

> display invFtail(1,27, .05)

