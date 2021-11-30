** .do file for APSTA-GE 2001 assignment 8
** credited by Yewei Sun
** Also available from https://github.com/sunyewei/Assignment-and-notes-APSTA-GE-2001

ttest Before == After //11.42
ttest score, by(group) //11.43

graph box achmat08, over (hsprog) //13.1(b)
by hsprog, sort: sum achmat08
summskew achmat08, by (hsprog) //13.1(c)
robvar achmat08, by (hsprog) //13.1(d)
oneway achmat08 hsprog, tabulate //13.1(f)

by urban, sort: sum slfcnc08
graph box slfcnc08, over (urban) //13.1(c)
robvar slfcnc08, over(urban) //13.1(d)
oneway slfcnc08 urban, tabulate //13.1(e)