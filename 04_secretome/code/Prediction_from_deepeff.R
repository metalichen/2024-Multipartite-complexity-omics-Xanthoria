getwd()

library(deepredeff)
library(Biostrings)

setwd("~/Desktop/Research_and_Vincent_folders/R_analysis/Rtrain/Vincent/comoryzae/")

chunk1<-readAAStringSet("Xanthoria_parietina_GTX0501.proteins.fasta")[1:5000]
deepredeef_prediction1 <-  predict_effector(input = chunk1, taxon = "fungi") # make sure it ends with .fasta 
write.table(deepredeef_prediction1, file = "deepredeef_prediction_1.csv", sep = ",")


chunk2<-readAAStringSet("Xanthoria_parietina_GTX0501.proteins.fasta")[5001:11138]
deepredeef_prediction2 <-  predict_effector(input = chunk2, taxon = "fungi") # make sure it ends with .fasta 
write.table(deepredeef_prediction2, file = "deepredeef_prediction_2.csv", sep = ",")


plot(deepredeef_prediction1)
plot(deepredeef_prediction2)

