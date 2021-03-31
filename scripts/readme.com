2 Python Notebooks:

1 - Spondylo_Classification_EDA.ipynb
    * Cleans and statistically explores data
    * Prepares variables for use in Machine Learning Models including:
       X - Features Variable
       Y - Target Variable
       Data - Full Data Set
      
      Preparation includes encoding target as binomial with 0 = Normal, 1 = Abnormal
    * Results, storing variables locally, each containing 309 records of 6 Quantitative Features and Binomial Target

2 - Spondylo_Classification_Models.ipynb
    * Prepares data for modeling with feature reduction PCA method
    * Tests 6 Classification Models, each with 2 upsampling methods
    * Results are displayed for each model with a summary and recommendation at the end
