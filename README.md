# Credit_Card_Fraud_Detection

Anonymized credit card transactions labeled as fraudulent or genuine

The datasets contain transactions made by credit cards in September 2013 by European cardholders. This dataset presents transactions that occurred in two days, where we have 492 frauds out of 284,807 transactions. The dataset is highly unbalanced, the positive class (frauds) account for 0.172% of all transactions.
Andrea Dal Pozzolo, Olivier Caelen, Reid A. Johnson and Gianluca Bontempi. Calibrating Probability with Undersampling for Unbalanced Classification. In Symposium on Computational Intelligence and Data Mining (CIDM), IEEE, 2015


- 1.check overall dataset and convert 'class' as factor variables
- 2.Taking care of missing data
- 3.Excluding 'Time' variable from dataset for further analysis
- 4.Checking imbalance in the dataset
- 5.Create possibly balanced samples by random over-sampling minority 
- 6.Feature Scaling for 'amount' | Rescale numeric vector to have specified minimum and maximum.
- 7.Splitting the dataset into the Training set and Test set
- 8.Fitting random forest classifier model
- 9.Predicting the Test set results
- 10.Making the Confusion Matrix
- 11.calculating predictive precision using ROC  $auc

![cre](https://user-images.githubusercontent.com/5808185/32983438-8d6e5d0e-ccba-11e7-8085-5ad0a3b538e6.PNG)
