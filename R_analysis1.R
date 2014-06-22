setwd("~/Documents/R/tidydata/")
library("reshape2")
library("plyr")
X_train <- read.table("~/Documents/R/tidydata/X_train.txt", quote="\"") #7352 561
X_test <- read.table("~/Documents/R/tidydata/X_test.txt", quote="\"") #2947 561
subject_test <- read.table("~/Documents/R/tidydata/subject_test.txt", quote="\"") #2947 1
features <- read.table("~/Documents/R/tidydata/features.txt", quote="\"") #561 2
y_test <- read.table("~/Documents/R/tidydata/y_test.txt", quote="\"") #2947 1
y_train <- read.table("~/Documents/R/tidydata/y_train.txt", quote="\"") #7352 1
subject_train <- read.table("~/Documents/R/tidydata/subject_train.txt", quote="\"") #7352 1

Xnew<-cbind(subject_test,y_test,X_test)
Ynew<-cbind(subject_train,y_train,X_train)




m1<-grepl('mean()\\(\\)|std()\\(\\)',features[,"V2"]   #find mean and std in features
          
          id1<-1:561                #find true position
          m6<-data.frame()
          for (i in id1){
                  if (m1[i]=="TRUE"){
                          print(i)
                          m6<-rbind(m6, i)
                          
                  }
          }


id<-1:561        #find false positions,  m3 variable
m3<-data.frame()
for (i in id){
        if (m1[i]=="FALSE"){
                print(i)
                m3<-rbind(m3, i)
                               
                          }
        }
m5<-m3+2 #calculate Xnew, Ynew observation false col positions,  m5 variable
m7<-m6+2 #calculate Xnew, Ynew observation true col positions,  m7 variable
xvalues<-Xnew
yvalues<-Ynew

xvalues<-xvalues[ -m5[1:495, ]]
yvalues<-yvalues[ -m5[1:495, ]]
newdata<-rbind(xvalues, yvalues)
newdata1<-newdata



#--------------------------------------------------------------------
#replace activity labels
z<-1:10299
for (y in z){
        if (newdata1[y,2]==1){
                newdata[y,2]="WALKING"
        } else  if (newdata1[y,2]==2){
                        newdata[y,2]="WALKING_UPSTAIRS"     
        }else  if (newdata1[y,2]==3){
                newdata[y,2]="WALKING_DOWNSTAIRS"
        }else  if (newdata1[y,2]==4){
                newdata[y,2]="SITTING"
        }else  if (newdata1[y,2]==5){
                newdata[y,2]="STANDING"
        }else  if (newdata1[y,2]==6){
                newdata[y,2]="LAYING"
        }
}
write.csv(newdata, "newdata.csv")
#-------------------------------------------------------------------
newdata3<-newdata
id2<-1:66
for (d in id2){
        v<-m7[d,1]
        newname<-toString(features[v,2])
        rename(newdata3[d+2], newname)
        
}

#--------------------------------------------------------------------
        
write.csv(newdata3, "newdataSubmit.csv")  #write dataset3 on new file newdataSubnit


