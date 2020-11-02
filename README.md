# TCGA_GTEx

Date: 11/01/2020

---

## 1. Data source

* <a href="https://toil.xenahubs.net/download/tcga_RSEM_gene_tpm.gz"  _target="blank">tcga_RSEM_gene_tpm.gz </a>

* <a href="https://pancanatlas.xenahubs.net/download/TCGA_phenotype_denseDataOnlyDownload.tsv.gz"  _target="blank">TCGA_phenotype_denseDataOnlyDownload.tsv.gz</a>

* <a href="https://toil.xenahubs.net/download/gtex_RSEM_gene_tpm.gz"  _target="blank">gtex_RSEM_gene_tpm.gz </a>

* <a href="https://toil.xenahubs.net/download/GTEX_phenotype.gz"  _target="blank">GTEX_phenotpye.gz </a>

* <a href="https://toil.xenahubs.net/download/probeMap/gencode.v23.annotation.gene.probemap"  _target="blank">gencode.v23.annotation.gene.probemap</a>

  

## 2. Annotate Samples from TCGA and GTEx

<a href="https://github.com/cmutd/TCGA_GTEx/blob/main/code/step1_preprocess.R" _target="blank">code </a>



## 3. Extract gene of interest 

<a href="https://github.com/cmutd/TCGA_GTEx/blob/main/code/step2_extract_expression_of_interest_gene.R" _target="blank">code</a>

## 4. Visualize gene expression
<a href="https://github.com/cmutd/TCGA_GTEx/blob/main/code/step3_visualization.R" _target="blank">code</a>

### a. boxplot
![](https://github.com/cmutd/TCGA_GTEx/blob/master/figure/pancancer_TP53Plot.png)

### b. violinplot 
![](https://github.com/cmutd/TCGA_GTEx/blob/master/figure/TP53_expression_violin.png)
