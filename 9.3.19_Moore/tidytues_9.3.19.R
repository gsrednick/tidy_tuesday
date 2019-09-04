# Tidy Tuesday September 3 2019 -- Moore law 

# packages
library(tidyverse)
library(ggplot2)

# data import
cpu <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-09-03/cpu.csv")

gpu <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-09-03/gpu.csv")

ram <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-09-03/ram.csv")

# exploratory plots

# Goal: bit progression by company relative to the size of the processor; who has made biggest leaps 

ggplot(cpu, aes(x = date_of_introduction, y = factor(designer, levels = rev(levels(factor(designer)))),size=log(transistor_count))) + 
  geom_point(aes(col=log(process))) +
  scale_colour_gradient(low = "blue", high = "red") +
  xlab("Date of introduction") +
  ylab("Designer") +
  labs(colour = "Log (Processer size)", size = "Log (Transistor count)")

  


