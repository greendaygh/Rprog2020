library(readxl)
mydata <- read_excel("Exp_data.xls", sheet=1, skip = 0, col_names=T)
mydesign <- read_excel("Exp_design.xlsx", sheet=1, skip = 0, col_names=F)


designdata

mydf <- data.frame(well=mydata$Well, 
                   od=mydata$`595nm_kk (A)`, 
                   gfp=mydata$`EGFP_sulim (Counts)`)
head(mydf)
