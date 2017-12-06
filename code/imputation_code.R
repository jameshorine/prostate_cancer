#imputer for prostate data

#install.packages("mice")
#packages ----
require(mice)

# working directory ----
setwd("/Users/jameshorine/repos/private_code/enova_challenge/code")

#file paths ----
training_file_path = "/Users/jameshorine/repos/private_code/enova_challenge/data/training_data.csv"
testing_file_path = "/Users/jameshorine/repos/private_code/enova_challenge/data/name_score.csv"

#data load in ---- 
training_data = read.csv(training_file_path, header = TRUE)
testing_data = read.csv(testing_file_path, header = TRUE)

#variables to impute ----

vars_to_impute = c('gleason_score', 'age', 'race', 'height', 'weight', 'family_history',
                 'first_degree_history', 'previous_cancer', 'smoker', 'tumor_diagnosis',
                 'tumor_1_year', 'psa_diagnosis', 'psa_6_months',
                 'psa_1_year', 'tea')

#imputation ---- 
imputed_train_data = mice(data = training_data[vars_to_impute], seed = 1987)
imputed_test_data = mice(data = testing_data[vars_to_impute], seed = 1987)


#concatenation ---- 
completed_training_data = complete(imputed_train_data, 5)
completed_testing_data = complete(imputed_test_data, 5)

#plotts ---- 
training_plot_name = "../plots/imp_density_training.pdf"
testing_plot_name = "../plots/imp_density_testing.pdf"

pdf(file = training_plot_name,width = 8, height = 7)
densityplot(imputed_train_data, main = "Density of imputed variables in Training Data")
dev.off()

pdf(file = testing_plot_name, width = 8, height = 7)
densityplot(imputed_test_data, main = "Density of imputed variables in Testing Data")
dev.off()

#data write out ---- 
imputed_training_filename = "../data/imputed_training.csv"
imputed_testing_filename = "../data/imputed_testing.csv"
write.csv(x = completed_training_data,file = imputed_training_filename ,row.names = FALSE)
write.csv(x = completed_testing_data,file = imputed_testing_filename , row.names = FALSE )


