# GettingAndCleaningData

Coursera - Getting and Cleaning Data Course

## Course Project

### The script file run_analysis.R

Obs.:To run the script the package dplyr must be installed, the library will be loaded by the script.

The run_analysis.R will do all 5 steaps asked for the project, but not at the same order.
If there is not a file named Dataset.zip in your working directory, it will try to download the file. As you should have already downloaded the file to do the project, it would be nice to provide the file so as not to waste time downloading it again. Its not necessary to unpack it.

### Operation with the files:
The X_train.txt is loaded to the train object.

The variables names provided in the features.txt are added to the train object.

All variables containing "mean()" and "std()" are keep, the others are removed.

The y_train.txt is binded to the train object as the Activity variable.

The subject_train.txt is binded to the train object as the Subject variable.

An extra column named Origin is included, so as TRAINNING and TEST observations can be identified in the output file (1=TRAINING, 2=TEST).

The Activity variable is updated with the descriptive values provided in the activity_labels.txt.

The same is done with the test files (X_test, y_test.txt, subject_test.txt, activity_labels.txt ), and the two resulting objects (train and test) are binded in a new one named tidy_dataset, so it is calculated the mean of each variable by activity and subject and stored in a file named by_act_sub.txt, in your working directory. The resulting duplicated rows is eliminated.

### Variable Names
The variable names are the same defined in the features_info.txt and features.txt, except by the column number appended at the beginning to distinguish duplicated variables names in the original data set.

1	"1 tBodyAcc-mean()-X"            
2	"2 tBodyAcc-mean()-Y"            
3	"3 tBodyAcc-mean()-Z"            
4	"41 tGravityAcc-mean()-X"        
5	"42 tGravityAcc-mean()-Y"        
6	"43 tGravityAcc-mean()-Z"        
7	"81 tBodyAccJerk-mean()-X"       
8	"82 tBodyAccJerk-mean()-Y"       
9	"83 tBodyAccJerk-mean()-Z"       
10	"121 tBodyGyro-mean()-X"         
11	"122 tBodyGyro-mean()-Y"         
12	"123 tBodyGyro-mean()-Z"         
13	"161 tBodyGyroJerk-mean()-X"     
14	"162 tBodyGyroJerk-mean()-Y"     
15	"163 tBodyGyroJerk-mean()-Z"     
16	"201 tBodyAccMag-mean()"         
17	"214 tGravityAccMag-mean()"      
18	"227 tBodyAccJerkMag-mean()"     
19	"240 tBodyGyroMag-mean()"        
20	"253 tBodyGyroJerkMag-mean()"    
21	"266 fBodyAcc-mean()-X"          
22	"267 fBodyAcc-mean()-Y"          
23	"268 fBodyAcc-mean()-Z"          
24	"345 fBodyAccJerk-mean()-X"      
25	"346 fBodyAccJerk-mean()-Y"      
26	"347 fBodyAccJerk-mean()-Z"      
27	"424 fBodyGyro-mean()-X"         
28	"425 fBodyGyro-mean()-Y"         
29	"426 fBodyGyro-mean()-Z"         
30	"503 fBodyAccMag-mean()"         
31	"516 fBodyBodyAccJerkMag-mean()" 
32	"529 fBodyBodyGyroMag-mean()"    
33	"542 fBodyBodyGyroJerkMag-mean()"
34	"4 tBodyAcc-std()-X"             
35	"5 tBodyAcc-std()-Y"             
36	"6 tBodyAcc-std()-Z"             
37	"44 tGravityAcc-std()-X"         
38	"45 tGravityAcc-std()-Y"         
39	"46 tGravityAcc-std()-Z"         
40	"84 tBodyAccJerk-std()-X"        
41	"85 tBodyAccJerk-std()-Y"        
42	"86 tBodyAccJerk-std()-Z"        
43	"124 tBodyGyro-std()-X"          
44	"125 tBodyGyro-std()-Y"          
45	"126 tBodyGyro-std()-Z"          
46	"164 tBodyGyroJerk-std()-X"      
47	"165 tBodyGyroJerk-std()-Y"      
48	"166 tBodyGyroJerk-std()-Z"      
49	"202 tBodyAccMag-std()"          
50	"215 tGravityAccMag-std()"       
51	"228 tBodyAccJerkMag-std()"      
52	"241 tBodyGyroMag-std()"         
53	"254 tBodyGyroJerkMag-std()"     
54	"269 fBodyAcc-std()-X"           
55	"270 fBodyAcc-std()-Y"           
56	"271 fBodyAcc-std()-Z"           
57	"348 fBodyAccJerk-std()-X"       
58	"349 fBodyAccJerk-std()-Y"       
59	"350 fBodyAccJerk-std()-Z"       
60	"427 fBodyGyro-std()-X"          
61	"428 fBodyGyro-std()-Y"          
62	"429 fBodyGyro-std()-Z"          
63	"504 fBodyAccMag-std()"          
64	"517 fBodyBodyAccJerkMag-std()"  
65	"530 fBodyBodyGyroMag-std()"     
66	"543 fBodyBodyGyroJerkMag-std()" 
67	"Activity"                       
68	"Subject"                        
69	"Origin"                         
