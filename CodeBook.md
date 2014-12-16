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
1. Subject<br />2. Activity<br />3. tBodyAcc-mean()-X<br />4. tBodyAcc-mean()-Y<br />5. tBodyAcc-mean()-Z<br />6. tBodyAcc-std()-X<br />7. tBodyAcc-std()-Y<br />8. tBodyAcc-std()-Z<br />9. tGravityAcc-mean()-X<br />10. tGravityAcc-mean()-Y<br />11. tGravityAcc-mean()-Z<br />12. tGravityAcc-std()-X<br />13. tGravityAcc-std()-Y<br />14. tGravityAcc-std()-Z<br />15. tBodyAccJerk-mean()-X<br />16. tBodyAccJerk-mean()-Y<br />17. tBodyAccJerk-mean()-Z<br />18. tBodyAccJerk-std()-X<br />19. tBodyAccJerk-std()-Y<br />20. tBodyAccJerk-std()-Z<br />21. tBodyGyro-mean()-X<br />22. tBodyGyro-mean()-Y<br />23. tBodyGyro-mean()-Z<br />24. tBodyGyro-std()-X<br />25. tBodyGyro-std()-Y<br />26. tBodyGyro-std()-Z<br />27. tBodyGyroJerk-mean()-X<br />28. tBodyGyroJerk-mean()-Y<br />29. tBodyGyroJerk-mean()-Z<br />30. tBodyGyroJerk-std()-X<br />31. tBodyGyroJerk-std()-Y<br />32. tBodyGyroJerk-std()-Z<br />33. tBodyAccMag-mean()<br />34. tBodyAccMag-std()<br />35. tGravityAccMag-mean()<br />36. tGravityAccMag-std()<br />37. tBodyAccJerkMag-mean()<br />38. tBodyAccJerkMag-std()<br />39. tBodyGyroMag-mean()<br />40. tBodyGyroMag-std()<br />41. tBodyGyroJerkMag-mean()<br />42. tBodyGyroJerkMag-std()<br />43. fBodyAcc-mean()-X<br />44. fBodyAcc-mean()-Y<br />45. fBodyAcc-mean()-Z<br />46. fBodyAcc-std()-X<br />47. fBodyAcc-std()-Y<br />48. fBodyAcc-std()-Z<br />49. fBodyAccJerk-mean()-X<br />50. fBodyAccJerk-mean()-Y<br />51. fBodyAccJerk-mean()-Z<br />52. fBodyAccJerk-std()-X<br />53. fBodyAccJerk-std()-Y<br />54. fBodyAccJerk-std()-Z<br />55. fBodyGyro-mean()-X<br />56. fBodyGyro-mean()-Y<br />57. fBodyGyro-mean()-Z<br />58. fBodyGyro-std()-X<br />59. fBodyGyro-std()-Y<br />60. fBodyGyro-std()-Z<br />61. fBodyAccMag-mean()<br />62. fBodyAccMag-std()<br />63. fBodyBodyAccJerkMag-mean()<br />64. fBodyBodyAccJerkMag-std()<br />65. fBodyBodyGyroMag-mean()<br />66. fBodyBodyGyroMag-std()<br />67. fBodyBodyGyroJerkMag-mean()<br />68. fBodyBodyGyroJerkMag-std()<br />
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
