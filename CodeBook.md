#Code Book
_ _ _
###Description
This document describes the code inside 'run_analysis.R'
The script perfroms the task in the same order the steps are described in the project's description.
* Load the data sets into <b>R</b> using the `read.table()`. Different data sets of same type are merged using the `rbind()` function.
* Features are loaded from `features.txt` and a <i>logical vector</i> is created from it by using the `grepl()` command. 

    This command takes two arguments, first one is a <b>Regular Expression</b> to find the pattern `mean()` or `std()` among the features, second is the data to apply search on and returns a logical vector.
    
    The logical vector thus produced is used to subset <i>data_x</i>.
* Activity labels are loaded and then assigned to the <i>data_y</i>.
* <i>data_subject</i> is labelled and full data set is produced by `cbind()`. <i>cbind</i> takes the arguments <i>data_x</i>, <i>data_y</i>, <i>data_subject</i>
* At each step unnecessary data fields are deleted from the workspace.
* Load the <i>plyr</i> library by command `library(plyr)`
* Use the <i>ddply</i> to split the dataset by <i>Subject</i> and <i>Activity</i>, apply the `fucntion(x)` on them and return the averaged data frame with 180 rows(30 Subjects * 6 Actvities).
* Lastly, write the averaged data frame to `data_average.txt` using the `write.table()` function.

_ _ _
###Variables
The 68 columns contains all the variable extracted :
1. Subject
2. Activity
3. tBodyAcc-mean()-X
4. tBodyAcc-mean()-Y
5. tBodyAcc-mean()-Z
6. tBodyAcc-std()-X
7. tBodyAcc-std()-Y
8. tBodyAcc-std()-Z
9. tGravityAcc-mean()-X
10. tGravityAcc-mean()-Y
11. tGravityAcc-mean()-Z
12. tGravityAcc-std()-X
13. tGravityAcc-std()-Y
14. tGravityAcc-std()-Z
15. tBodyAccJerk-mean()-X
16. tBodyAccJerk-mean()-Y
17. tBodyAccJerk-mean()-Z
18. tBodyAccJerk-std()-X
19. tBodyAccJerk-std()-Y
20. tBodyAccJerk-std()-Z
21. tBodyGyro-mean()-X
22. tBodyGyro-mean()-Y
23. tBodyGyro-mean()-Z
24. tBodyGyro-std()-X
25. tBodyGyro-std()-Y
26. tBodyGyro-std()-Z
27. tBodyGyroJerk-mean()-X
28. tBodyGyroJerk-mean()-Y
29. tBodyGyroJerk-mean()-Z
30. tBodyGyroJerk-std()-X
31. tBodyGyroJerk-std()-Y
32. tBodyGyroJerk-std()-Z
33. tBodyAccMag-mean()
34. tBodyAccMag-std()
35. tGravityAccMag-mean()
36. tGravityAccMag-std()
37. tBodyAccJerkMag-mean()
38. tBodyAccJerkMag-std()
39. tBodyGyroMag-mean()
40. tBodyGyroMag-std()
41. tBodyGyroJerkMag-mean()
42. tBodyGyroJerkMag-std()
43. fBodyAcc-mean()-X
44. fBodyAcc-mean()-Y
45. fBodyAcc-mean()-Z
46. fBodyAcc-std()-X
47. fBodyAcc-std()-Y
48. fBodyAcc-std()-Z
49. fBodyAccJerk-mean()-X
50. fBodyAccJerk-mean()-Y
51. fBodyAccJerk-mean()-Z
52. fBodyAccJerk-std()-X
53. fBodyAccJerk-std()-Y
54. fBodyAccJerk-std()-Z
55. fBodyGyro-mean()-X
56. fBodyGyro-mean()-Y
57. fBodyGyro-mean()-Z
58. fBodyGyro-std()-X
59. fBodyGyro-std()-Y
60. fBodyGyro-std()-Z
61. fBodyAccMag-mean()
62. fBodyAccMag-std()
63. fBodyBodyAccJerkMag-mean()
64. fBodyBodyAccJerkMag-std()
65. fBodyBodyGyroMag-mean()
66. fBodyBodyGyroMag-std()
67. fBodyBodyGyroJerkMag-mean()
68. fBodyBodyGyroJerkMag-std()
* <b>Subect</b>
    *   Takes values : 1-30
    *   IDs the subject.
* <b>Activity</b>
    *   Takes 6 values.
    *   Describes the activity performed vis 
        *   <i>STANDING
        *   LAYING
        *   SITTING
        *   WALKING
        *   WALKING_DOWNSTAIRS
        *   WALKING_UPSTAIRS</i>
*   <b>Accelerometer and Gyroscope Readings</b>
    *   These readings are recorded in three axis : <i>X, Y, Z</i>.
    *   There are two type of readings
        *   <b>mean
        *   std</b>

_ _ _
