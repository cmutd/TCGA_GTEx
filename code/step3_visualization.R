library(ggplot2)
library(ggpubr)
library(RColorBrewer)



rm(list = ls())
options(stringsAsFactors = FALSE) 

exp <- read.table("expression.txt",header=T,sep='\t')

ylabname <- paste("TP53", "expression")
colnames(exp) <- c("Tissue", "Group", "Gene")

p1 <- ggboxplot(exp, x = "Tissue", y = "Gene", fill = 'Group',
                ylab = ylabname,
                color = "Group", 
                palette = "jco",
                ggtheme = theme_minimal())


comp<- compare_means(Gene ~ Group, group.by = "Tissue", data = exp,
                         method = "wilcox.test", 
                         p.adjust.method = "holm")

### pdf version
ggsave("figure/pancancer_TP53Plot.pdf", width = 14, height = 5)

### png version
#png("figure/pancancer_TP53Plot.png", width = 465, height = 225, units='mm', res = 300)

p2 <- p1 + 
  stat_pvalue_manual(comp, x = "Tissue", y.position = 15,
                     label = "p.signif", position = position_dodge(0.8))
p2
#dev.off()



