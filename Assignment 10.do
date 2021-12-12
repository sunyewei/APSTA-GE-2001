** .do file for APSTA-GE 2001 assignment 10
** credited by Yewei Sun
** Also available from https://github.com/sunyewei/Assignment-and-notes-APSTA-GE-2001

di Ftail(2,117,5) //13.9

summskew Score, by(Group)
robvar Score, by( Group )
oneway Score Group //13.10(a)
pwmean Score, over(Group) mcompare(tukey) effects //13.10(b)