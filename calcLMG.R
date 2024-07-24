library(relaimpo)

df <- read.csv("results.csv") 

model <- lm(runtime ~ npath_short+nactions+avgpath_short+npath_simple+avgpath_simple+steps+config, data=df)

rel_importance = calc.relimp(model, type = "lmg", rela = TRUE)

plot(rel_importance)