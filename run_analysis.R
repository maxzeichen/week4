{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf470
{\fonttbl\f0\fmodern\fcharset0 Courier;\f1\fmodern\fcharset0 Courier-Bold;}
{\colortbl;\red255\green255\blue255;\red242\green242\blue242;\red38\green38\blue38;\red85\green98\blue116;
\red210\green0\blue53;\red133\green0\blue2;\red133\green0\blue96;\red17\green137\blue135;\red217\green11\blue0;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl400\partightenfactor0

\f0\fs24 \cf0 \cb2 \expnd0\expndtw0\kerning0
filesPath\cf3  \cf4 <-\cf3  \cf5 "C:/Users/maxzeichen/Documents/Coursera/week4/project/UCI HAR Dataset"
\fs26 \cf3 \

\fs24 \cf0 setwd\cf4 (\cf0 filesPath\cf4 )
\fs26 \cf3 \
\pard\pardeftab720\sl400\partightenfactor0

\f1\b\fs24 \cf6 if
\f0\b0 \cf4 (!\cf0 file.exists\cf4 (\cf5 "./data"\cf4 ))\{\cf0 dir.create\cf4 (\cf5 "./data"\cf4 )\}
\fs26 \cf3 \
\pard\pardeftab720\sl400\partightenfactor0

\fs24 \cf0 fileUrl\cf3  \cf4 <-\cf3  \cf5 "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
\fs26 \cf3 \

\fs24 \cf0 download.file\cf4 (\cf0 fileUrl\cf3 ,\cf0 destfile\cf4 =\cf5 "./data/Dataset.zip"\cf3 ,\cf0 method\cf4 =\cf5 "curl"\cf4 )
\fs26 \cf3 \

\fs24 \cf0 unzip\cf4 (\cf0 zipfile\cf4 =\cf5 "./data/Dataset.zip"\cf3 ,\cf0 exdir\cf4 =\cf5 "./data"\cf4 )
\fs26 \cf3 \
\pard\pardeftab720\sl400\partightenfactor0

\f1\b\fs24 \cf6 library
\f0\b0 \cf4 (\cf0 dplyr\cf4 )\cf3 \

\f1\b \cf6 library
\f0\b0 \cf4 (\cf0 data.table\cf4 )\cf3 \

\f1\b \cf6 library
\f0\b0 \cf4 (\cf0 tidyr\cf4 )
\fs26 \cf3 \
\pard\pardeftab720\sl400\partightenfactor0

\fs24 \cf5 \cb2 filesPath <- "~/Documents/Coursera/week4/project/UCI HAR Dataset"
\fs26 \cf3 \cb2 \
\pard\pardeftab720\sl400\partightenfactor0

\fs24 \cf0 dataSubjectTrain\cf3  \cf4 <-\cf3  \cf0 tbl_df\cf4 (\cf0 read.table\cf4 (\cf0 file.path\cf4 (\cf0 filesPath\cf3 , \cf5 "train"\cf3 , \cf5 "subject_train.txt"\cf4 )))\
\cf0 dataSubjectTest\cf3   \cf4 <-\cf3  \cf0 tbl_df\cf4 (\cf0 read.table\cf4 (\cf0 file.path\cf4 (\cf0 filesPath\cf3 , \cf5 "test"\cf3  , \cf5 "subject_test.txt"\cf3  \cf4 )))
\fs26 \cf3 \

\fs24 \cf0 dataActivityTrain\cf3  \cf4 <-\cf3  \cf0 tbl_df\cf4 (\cf0 read.table\cf4 (\cf0 file.path\cf4 (\cf0 filesPath\cf3 , \cf5 "train"\cf3 , \cf5 "Y_train.txt"\cf4 )))
\fs26 \cf3 \

\fs24 \cf0 dataActivityTest\cf3   \cf4 <-\cf3  \cf0 tbl_df\cf4 (\cf0 read.table\cf4 (\cf0 file.path\cf4 (\cf0 filesPath\cf3 , \cf5 "test"\cf3  , \cf5 "Y_test.txt"\cf3  \cf4 )))\
\cf0 dataTrain\cf3  \cf4 <-\cf3  \cf0 tbl_df\cf4 (\cf0 read.table\cf4 (\cf0 file.path\cf4 (\cf0 filesPath\cf3 , \cf5 "train"\cf3 , \cf5 "X_train.txt"\cf3  \cf4 )))\
\cf0 dataTest\cf3   \cf4 <-\cf3  \cf0 tbl_df\cf4 (\cf0 read.table\cf4 (\cf0 file.path\cf4 (\cf0 filesPath\cf3 , \cf5 "test"\cf3  , \cf5 "X_test.txt"\cf3  \cf4 )))\
\cf0 alldataSubject\cf3  \cf4 <-\cf3  \cf0 rbind\cf4 (\cf0 dataSubjectTrain\cf3 , \cf0 dataSubjectTest\cf4 )
\fs26 \cf3 \

\fs24 \cf0 setnames\cf4 (\cf0 alldataSubject\cf3 , \cf5 "V1"\cf3 , \cf5 "subject"\cf4 )
\fs26 \cf3 \

\fs24 \cf0 alldataActivity\cf4 <-\cf3  \cf0 rbind\cf4 (\cf0 dataActivityTrain\cf3 , \cf0 dataActivityTest\cf4 )
\fs26 \cf3 \

\fs24 \cf0 setnames\cf4 (\cf0 alldataActivity\cf3 , \cf5 "V1"\cf3 , \cf5 "activityNum"\cf4 )
\fs26 \cf3 \

\fs24 \cf0 dataTable\cf3  \cf4 <-\cf3  \cf0 rbind\cf4 (\cf0 dataTrain\cf3 , \cf0 dataTest\cf4 )
\fs26 \cf3 \

\fs24 \cf0 dataFeatures\cf3  \cf4 <-\cf3  \cf0 tbl_df\cf4 (\cf0 read.table\cf4 (\cf0 file.path\cf4 (\cf0 filesPath\cf3 , \cf5 "features.txt"\cf4 )))
\fs26 \cf3 \

\fs24 \cf0 setnames\cf4 (\cf0 dataFeatures\cf3 , \cf0 names\cf4 (\cf0 dataFeatures\cf4 )\cf3 , \cf0 c\cf4 (\cf5 "featureNum"\cf3 , \cf5 "featureName"\cf4 ))
\fs26 \cf3 \

\fs24 \cf0 colnames\cf4 (\cf0 dataTable\cf4 )\cf3  \cf4 <-\cf3  \cf0 dataFeatures\cf4 $\cf0 featureName
\fs26 \cf3 \

\fs24 \cf0 activityLabels\cf4 <-\cf3  \cf0 tbl_df\cf4 (\cf0 read.table\cf4 (\cf0 file.path\cf4 (\cf0 filesPath\cf3 , \cf5 "activity_labels.txt"\cf4 )))
\fs26 \cf3 \

\fs24 \cf0 setnames\cf4 (\cf0 activityLabels\cf3 , \cf0 names\cf4 (\cf0 activityLabels\cf4 )\cf3 , \cf0 c\cf4 (\cf5 "activityNum"\cf3 ,\cf5 "activityName"\cf4 ))
\fs26 \cf3 \

\fs24 \cf0 alldataSubjAct\cf4 <-\cf3  \cf0 cbind\cf4 (\cf0 alldataSubject\cf3 , \cf0 alldataActivity\cf4 )
\fs26 \cf3 \

\fs24 \cf0 dataTable\cf3  \cf4 <-\cf3  \cf0 cbind\cf4 (\cf0 alldataSubjAct\cf3 , \cf0 dataTable\cf4 )
\fs26 \cf3 \

\fs24 \cf0 dataFeaturesMeanStd\cf3  \cf4 <-\cf3  \cf0 grep\cf4 (\cf5 "mean\\\\(\\\\)|std\\\\(\\\\)"\cf3 ,\cf0 dataFeatures\cf4 $\cf0 featureName\cf3 ,\cf0 value\cf4 =\cf7 TRUE\cf4 )
\fs26 \cf3 \

\fs24 \cf0 dataFeaturesMeanStd\cf3  \cf4 <-\cf3  \cf0 union\cf4 (\cf0 c\cf4 (\cf5 "subject"\cf3 ,\cf5 "activityNum"\cf4 )\cf3 , \cf0 dataFeaturesMeanStd\cf4 )
\fs26 \cf3 \

\fs24 \cf0 dataTable\cf4 <-\cf3  \cf0 subset\cf4 (\cf0 dataTable\cf3 ,\cf0 select\cf4 =\cf0 dataFeaturesMeanStd\cf4 )\cf3  
\fs26 \

\fs24 \cf0 dataTable\cf3  \cf4 <-\cf3  \cf0 merge\cf4 (\cf0 activityLabels\cf3 , \cf0 dataTable\cf3  , \cf0 by\cf4 =\cf5 "activityNum"\cf3 , \cf0 all.x\cf4 =\cf7 TRUE\cf4 )
\fs26 \cf3 \

\fs24 \cf0 dataTable\cf4 $\cf0 activityName\cf3  \cf4 <-\cf3  \cf0 as.character\cf4 (\cf0 dataTable\cf4 $\cf0 activityName\cf4 )
\fs26 \cf3 \

\fs24 \cf0 dataTable\cf4 $\cf0 activityName\cf3  \cf4 <-\cf3  \cf0 as.character\cf4 (\cf0 dataTable\cf4 $\cf0 activityName\cf4 )
\fs26 \cf3 \

\fs24 \cf0 dataAggr\cf4 <-\cf3  \cf0 aggregate\cf4 (\cf3 . \cf4 ~\cf3  \cf0 subject\cf3  \cf4 -\cf3  \cf0 activityName\cf3 , \cf0 data\cf3  \cf4 =\cf3  \cf0 dataTable\cf3 , \cf0 mean\cf4 )\cf3  
\fs26 \

\fs24 \cf0 dataTable\cf4 <-\cf3  \cf0 tbl_df\cf4 (\cf0 arrange\cf4 (\cf0 dataAggr\cf3 ,\cf0 subject\cf3 ,\cf0 activityName\cf4 ))
\fs26 \cf3 \

\fs24 \cf0 head\cf4 (\cf0 str\cf4 (\cf0 dataTable\cf4 )\cf3 ,\cf8 2\cf4 )
\fs26 \cf3 \

\fs24 \cf0 names\cf4 (\cf0 dataTable\cf4 )<-\cf0 gsub\cf4 (\cf5 "std()"\cf3 , \cf5 "SD"\cf3 , \cf0 names\cf4 (\cf0 dataTable\cf4 ))\cf3 \
\cf0 names\cf4 (\cf0 dataTable\cf4 )<-\cf0 gsub\cf4 (\cf5 "mean()"\cf3 , \cf5 "MEAN"\cf3 , \cf0 names\cf4 (\cf0 dataTable\cf4 ))\cf3 \
\cf0 names(dataTable)<-gsub(\cf9 "^t"\cf0 , \cf9 "Time"\cf0 , names(dataTable))\cf3 \
\cf0 names(dataTable)<-gsub(\cf9 "^f"\cf0 , \cf9 "Frequency"\cf0 , names(dataTable))\cf3 \
\cf0 names\cf4 (\cf0 dataTable\cf4 )<-\cf0 gsub\cf4 (\cf5 "Acc"\cf3 , \cf5 "Accelerometer"\cf3 , \cf0 names\cf4 (\cf0 dataTable\cf4 ))\cf3 \
\cf0 names\cf4 (\cf0 dataTable\cf4 )<-\cf0 gsub\cf4 (\cf5 "Gyro"\cf3 , \cf5 "Gyroscope"\cf3 , \cf0 names\cf4 (\cf0 dataTable\cf4 ))\cf3 \
\cf0 names\cf4 (\cf0 dataTable\cf4 )<-\cf0 gsub\cf4 (\cf5 "Mag"\cf3 , \cf5 "Magnitude"\cf3 , \cf0 names\cf4 (\cf0 dataTable\cf4 ))\cf3 \
\pard\pardeftab720\sl400\partightenfactor0
\cf0 \cb2 names\cf4 (\cf0 dataTable\cf4 )<-\cf0 gsub\cf4 (\cf5 "BodyBody"\cf3 \cb2 , \cf5 \cb2 "Body"\cf3 \cb2 , \cf0 \cb2 names\cf4 (\cf0 dataTable\cf4 ))
\fs26 \cf3 \cb2 \
\pard\pardeftab720\sl400\partightenfactor0

\fs24 \cf0 head\cf4 (\cf0 str\cf4 (\cf0 dataTable\cf4 )\cf3 ,\cf8 6\cf4 )
\fs26 \cf3 \
write.table(dataTable, file="TidyData.txt", row.name=FALSE)\
\
\
}