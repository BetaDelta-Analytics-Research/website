library(tidyverse)
library(readxl)
library(ggrepel)
library(geomtextpath)


df <- read_xlsx("Growth of 10 Dollars Table.xlsx")

colorp <- c("#252525", "#969696", "#a50f15")

ggplot(df, aes(date, value)) + 
  geom_textline(label = "$10  a day invested monthly @ 9% annual growth.", 
                linewidth = 1, color = colorp[1], vjust = -0.5, family = "serif", size = 5) +
  geom_point(data = rbind(head(df,1),tail(df,1)), aes(date, value), size = 4, color = colorp[3], family = "serif") +
  geom_text_repel(data = rbind(head(df,1),tail(df,1)), aes(label = scales::dollar(round(value,0))), 
            size = 4, color = colorp[1], direction="both", point.padding = 15, nudge_y=15, family = "serif") +
  labs(title = "What habit can you change to save $10 a day?",
       subtitle = "Financial Coaching can help you change your life.",
       caption = "\n Data visaulization by BetaDelta Analytics & Research") + 
  xlab(" \n 40 years starting New Year's 2023.  You can do it.") +
  ylab("") +
  theme_classic() +
  theme(plot.title=element_text(size=20),
        plot.caption=element_text(size=8, color=colorp[2]),
        axis.title.x=element_text(size=14, hjust = 0),
        axis.title.y=element_blank(), #element_text(size=14),
        axis.text.y=element_blank(),  #remove y axis labels
        axis.ticks.y=element_blank(),
        axis.line.y = element_blank(),
        text=element_text(family = "serif") #remove y axis ticks
        )