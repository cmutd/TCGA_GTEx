library(stringr)
library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(data.table)
library(tibble)

rm(list = ls())
options(stringsAsFactors = FALSE) 
source("GeomSplitViolin.R")

target <- "TP53"

idmap <- read.delim("gencode.v23.annotation.gene.probemap",as.is=T)
tcga_exp <- fread("tcga_RSEM_gene_tpm.gz",data.table = F)
gtex_exp <- fread("gtex_RSEM_gene_tpm.gz",data.table=F)
tcga_gtex <- read.table("tcga_gtex_sample.txt",sep='\t',header = T)

id <- idmap$id[which(idmap$gene==target)]
tcga_data <- t(tcga_exp[tcga_exp$sample==id,colnames(tcga_exp)%in%c("sample",tcga_gtex$sample)])
tcga_data <- data.frame(tcga_data[-1,])
tcga_data <- rownames_to_column(tcga_data,"sample")
names(tcga_data)[2] <- "tpm"

gtex_data <- t(gtex_exp[gtex_exp$sample==id,colnames(gtex_exp)%in%c("sample",tcga_gtex$sample)])
gtex_data <- data.frame(gtex_data[-1,])
gtex_data <- rownames_to_column(gtex_data,"sample")
names(gtex_data)[2] <- "tpm"

tmp  <- rbind(tcga_data,gtex_data)
exp <- merge(tmp,tcga_gtex,by="sample",all.x=T)
exp <- exp[,c("tissue","sample_type","tpm")]
exp <- arrange(exp,tissue)
write.table(exp,"expression.txt",row.names = F,quote=F,sep='\t')
