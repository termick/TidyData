1. setup the working directory and load the libraries reshape2 and plyr
2. Reading the datasets
3.Merge and create two new datasets (Xnew for teast files and  Ynew for train files)
4.Using grep command to find col names which std() and mean() included on features.txt file.
5.Using two variables m6 to store the columns positions std() and mean() included which in features files and m3 the columns positions without std() and mean().
6.Add the number 2 to m3,m6 because I have already merged the files.The new variables are m5 for false ids and m7 for true ids
7.Using the the m7 to eliminate the columns which std() and mean() not included. The new dataset are xvalues and yvalues.
8. Using rbind to merge the two datasets into one (newdata).
9.Define newdata=newdata1
10.Replace the activities ids with activities labels on new data dataset
11.Define newdta3=newdata
12.Rename the newdata3 columns based on features names using the m7 variable.
13.Wrire the newdata3 on file (newdataSubmit.csv)
