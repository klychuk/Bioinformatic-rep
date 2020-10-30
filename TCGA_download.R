library(SummarizedExperiment)≈
library(TCGAbiolinks)

query0 <- GDCquery(project = "TCGA-PAAD",
                  data.category = "DNA methylation", 
                  platform = "Illumina Human Methylation 450",
		 sample.type = "Solid Tissue Normal", 
                  legacy = TRUE)

GDCdownload(query0, method = "api")
maf0 <- GDCprepare(query0, summarizedExperiment = FALSE)
write.csv(maf0, "outputs/PAAD_meth_normal.csv")


query1 <- GDCquery(project = "TCGA-PAAD",
                  data.category = "DNA methylation",
                  platform = "Illumina Human Methylation 450",
                 sample.type = "Primary Tumor",
                  legacy = TRUE)

GDCdownload(query1, method = "api")
maf2 <- GDCprepare(query1, summarizedExperiment = FALSE)
write.csv(maf2, "outputs/PAAD_meth_tumor.csv")

query3 <- GDCquery(project = "TCGA-PAAD",
                  data.category = "Transcriptome Profiling",
data.type = "Gene Expression Quantification", workflow.type = "HTSeq - Counts")

GDCdownload(query3, method = "api", directory = "maf")
maf3 <- GDCprepare(query3, directory = "maf", summarizedExperiment = FALSE)
clinicalP <- GDCquery_clinic("TCGA-PAAD","clinical")

write.csv(maf3, "outputs/PAAD_GE.csv")
write.csv(clinicalP, "outputs/PAAD_clinic.csv")


