Prostate Cancer is the most common cancer among men after skin cancer, however it may often be treated successfully (www.cancer.org). It is accepted that Age, ethnicity, geography, family history, diet, obesity, smoking, and other environmental factors all affect the risk of developing Prostate Cancer. In the Prostate Cancer data set (n = 15000), we develop a "blind machine learning" approach to predict whether or not (0/1) an individual will survive 7 years beyond initial diagnosis. 

The results of this analysis could easily be incorporated into a practitioner tool designed to accurately assist in directing costly provider resources and expertise. 



The Approach: 

Upon initial inspection we discover that many of the usual variables of interest contain “missing at random” or “missing not and random” values. To help in correcting these insufficiencies, we [impute](https://www.jstatsoft.org/article/view/v045i03) where the values themselves are missing in less than 20% of the records available. 

All categorical variables are encoded (one-hot) into the training data to ensure that we preserve all possible non-linear relationships within the complex predictor space. “Symptom” missing values occurred at fewer than 5%, so, to speed analysis, we simply set missing values to 0, and apply a multilabelbinarizer to maintain all non-linear relationships that may exist. 

Analysis suggests (survival at 1 year relative importance at 6% amongst 65 covariates) that survival at 1 year is an important indicator of survival at 7 years post diagnosis, and as this variable is missing in a overwhelming majority of the scoring cases. This suggests a clear need to train a model to impute the survival status at 1 year post diagnosis. 

Model choice (in prediction and imputation) is Random Forest (classification) as the Random Forest, while intrinsically biased, is able to learn even the most complicated data response manifold topology while still providing robust results in a highly co-linear predictor space. 

10-fold cross validation agrees with an [out of bag](./plots/OOB_error_rate.pdf) accuracy at 63%. This suggests that with further research and medical expertise, one could turn this approach into a powerful tool to direct doctor-patient efforts at a time where tensions, emotions, and concern are very high. 

