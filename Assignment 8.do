** .do file for APSTA-GE 2001 assignment 8
** credited by Yewei Sun
** Also available from https://github.com/sunyewei/Assignment-and-notes-APSTA-GE-2001

gen BMIDIFF = BMI3-BMI1
browse //11.16(a)
graph box BMIDIFF, over(SEX) //11.16(b)
summarize BMIDIFF, detail //11.16(c)
robvar BMIDIFF, by (SEX) //11.16(d)
ttest BMIDIFF, by (SEX) //11.16(e)

by BPMEDS3, sort: summarize SYSBP3, detail
gen SYSBPskew = SYSBP3 if BPMEDS3 != .
summskew SYSBPskew //11.17(a)

gen SYSBP3lg = log10(SYSBP3)
summskew SYSBP3 , by(BPMEDS3)
summskew SYSBP3lg, by(BPMEDS3) //11.17(b)

robvar (SYSBP3lg), by (BPMEDS3)
ttest (SYSBP3lg), by (BPMEDS3) //11.17(c)

ttest achsci08 == achsci12
summarize achsci08