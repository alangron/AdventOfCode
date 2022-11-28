library(tidyverse)
x <- read.csv("GitHub/AdventOfCode/2021/data/day12_example1.csv",header = FALSE) %>%
  separate(V1, c('V1','V2'))

start <- x %>% filter(V1 == 'start') %>%
  rename(join = V2,start=V1)

paths <- x %>% rename(join=V1)

start <- merge(start,paths,by="join", all.x = TRUE) %>%
  rename(step1 = join,join=V2)

start <- merge(start,paths,by="join", all.x = TRUE) %>%
  rename(step2 = join,join=V2)

start <- merge(start,paths,by="join", all.x = TRUE) %>%
  rename(step3 = join,join=V2)



