Data Science Capstone: Classification of Spondylolisthesis
========================================================
author: Michelle Ide
date:  March 2021

    
The Code
========================================================

<h2>
<a href="https://github.com/mishide/Springboard/blob/master/Capstone_1/scripts/Spondylo_Classification_EDA.ipynb" target="_blank">EDA</a>&nbsp;&nbsp;&nbsp;&nbsp; performs the cleaning and initial statistical analysis
<br><br>
<a href="https://github.com/mishide/Springboard/blob/master/Capstone_1/scripts/Spondlyo_Classification_Models.ipynb" target="_blank">Machine Learning Models</a>&nbsp; 1) build and tests the models 2) results & recommendations
</h3>

<div>
<img src="images/R_B_spine.png" ALIGN="left" width="300"
</div>


Project
========================================================

<small><b>This project creates a predictive machine to label lumbar x-ray results as "Abnormal" or "Normal for cases of Spondylolisthesis resulting in improved sensitivity.</b>  
</small> 


Why
========================================================


<cite>A study published in "The Spine" in 2017 found sensitivity results across 10 radiology sites to be 56% with the best sensitivity of 72% for one site.  This means, on average, all the x-rays labeled "Abnormal" were actually "Normal" 44% of the time - resembling the flip of a coin.</cite></font>
<br><br>

Determinination of Abnormal versus Normal results is particularly difficult with Spondylolisthesis in boundry cases.  Over 30% of results are near the boundry between Normal and Abnormal values which translates to inconsistencies in interpretation with human interpretations.  These x-rays contain quantitative measurements that require simultaneous comparisons to properly label, something machine learning has proven to be well suited.

This Machine Learning model provides a validation tool by drawing on correct results, performing a statistical method of simultaneous comparisons of angles, and flagging the most probably results.  The tool will save expenses, stress, and time for radiologists while improving patient outcomes.
 



Data
========================================================

<small>
The data for this project came from Kaggle's collection "Biomechanical Features in Orthopedic Patients.
  <br><br>
 -- 309 records after outlier removal.
  <br>
 -- The data is clean and contains no null values.
  <br>
 -- 1 Target binomial variable (Normal/Abnormal)
    <br>
 -- 6 quantitative variables
</small><small>
    
* Pelvic Tilt
* Pelvic Incidence
* Pelvic Radius
* Lumbar Lardosis Angle
* Sacral Slope
* Degree Spondylolisthesis.</small>
 <br>



Approach
========================================================
Six well-known classification models were tested using 70% of the data to train and 30% to test. A large range of potential hyper parameter settings were tested for each model, determining the best settings for this project. Each model was selected due to it's usefulness in classification problems and it's differences in algorithmic process compared to the remaining models.

A stratified train-test split was used due to the imbalanced data in combination with upsampling methods performed during crossvalidation.  Upsampling methods were selected for their performance and potential for addressing the complexity in 'boundry' cases that exist in this project.  SMOTE-TL was determined to perform best overall by research performed in 2018 by 'Santos, Soares, Abreu, Araujo"(ref2).  ADASYN was included due to it's approach to the minority class, adding weight to boundry minority data in an effort to amplify and clarify separation.


Modeling
========================================================
<small>
6 models were tuned and tested for accuracy.  
 <br>
    
* Logistic Regression:  low CPU cost, easy to tune, linear based is sensitive to feature corr & outliers
* Gradient Boost:  combines multiple trees to reduce overfitting, high CPU cost & tuning
* Support Vector Machine:  +imbalance & smaller datasets, difficult to tune - needs large boundaries
* Random Forest Classifier: less prone to overfitting, lower accuracy for highly corr features
* Kneighbors Classifier: evolves & flexible hyper parameters, sensitive to outliers & data imbalance
* Gaussian Naive Bayes: Not sensitive to outliers or imbalances, assumes feature independence
<br>
 </small> 


Results
========================================================
<small>Logistic Regression preformed with the highest accuracy of 91%, Support Vector Machine 88%. </small> 
<br><br>
Using the ADASYN upsampling method: Out of 100 samples, 10 will be false positive ( Abnormal ), and 0 will be false negative ( Normal )
<br><br>
Using SMOTE-TL: Out of 100 samples, 7 will be false positive ( Abnormal ) and 1 will be false negative ( Normal )


Recommendations
========================================================
<small>I recommend Logistic Regression using reduces error from +12.5+/-3.5% to ~8%.  My experience in healthcare research leads me to lean toward ADASYN to avoid false negatives which performed well with an approximate error rate of 10%, however, 10 out of 100 false positives could reduce confidence in results and lead to additional costs in follow-up testing. This decision betweenn the 2 sampling methods would require feedback from decision makers.  Addiitonal testing to compare LR and SVB is recommend.  Logistic regression's linear nature results in more sensitivity to extreme values and outliers, I suspect with more testing and training the SVM may perform better and more consistently overall due to a flexible boundry that can adjust to extremes without skewing other data points.




Future Development
========================================================
Test several stacking methods to search for improved accuracy - this would provide additional layers of testing results to verify.
Test and train LR and SVM on more data, 309 samples is not bad to start but much more would be needed to validate results condidently.
Create unique splits to data prior to train-test split to test sparse data processing for small radiology departments with fewer results to run.


References
========================================================
ref1:  The Spine Journal, Volume 17, Issue 4, April 2017, Pages 554-561
     Link: https://www.sciencedirect.com/science/article/pii/S1529943016310932
<br><br>ref2:  Cross-Validation for Imbalanced Datasets: Avoiding Overoptimistic and Overfitting Approaches, October 2018IEEE Computational Intelligence Magazine 13(4):59-76, DOI: 10.1109/MCI.2018.2866730<br>
    Link:  https://www.researchgate.net/publication/328315720_Cross-Validation_for_Imbalanced_Datasets_Avoiding_Overoptimistic_and_Overfitting_Approaches
