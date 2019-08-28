# Tidy Tuesday - 8.27.2019 - Simpsons

## Notes 
# to make a new folder directly in terminal : "  mkdir 8_27_19  "
# make a folder for data, another for analyses, another for figures
# commit is like saving instantaneously commit often; push occasionally 
# can revert to go back to most recently commited version

# rule of thumb - when working with collaborators make sure to pull once per day and be careful about pushing to avoid conflicting copies


# Lab ####
library(tidyverse)
library(cowplot)
library(magick)
library(ggpubr)
library(jpeg)

# Read data ####
simpsons <- readr::read_delim("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-08-27/simpsons-guests.csv", delim = "|", quote = "")


# ideas for figures ####
# (1) - a visual for the relationship between number of characters per episode and season: the writers are scroungin!
# (2) - number of times the Simpsons bags on Ringo (or Bono/U2), show a figure with some interesting musical twist


# Tidy for question (1)

# Test
test<-lm(n ~ season, q1)
summary(test)


q1 <- simpsons %>% group_by(season) %>% tally()

q1$season<-as.numeric(q1$season)



# background image
url <- "https://static-media.fxx.com/img/FX_Networks_-_FXX/193/318/Simpsons_16_20_P3_640x360_287937091531.jpg"
download.file(url, destfile = "rabbduck.jpg")
img <- readJPEG("rabbduck.jpg")

# plot 

fig<- ggplot(q1, aes(x = season, y = n)) +
  background_image(img) + 
  #theme(panel.background = element_rect(colour = grey, alpha = 0.1)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) + 
  annotate("text", x = 20, y = 25, label = "italic(R) ^ 2 == 0.25",parse = TRUE) +
  annotate("text", x = 20, y = 22, label = "P == 0.005",parse = TRUE) +
  labs(x ="Season", y = "no. of guest starts per season") 




