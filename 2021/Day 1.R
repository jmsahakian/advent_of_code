#12/02/2021 Day 1
library(tidyverse)
sweep_report <- read.table("2021/input.txt")
sweep_report <- sweep_report %>% 
  rename(sweep = V1) %>% 
  mutate(previous_sweep = lag(sweep)) %>% 
  mutate(difference = sweep - previous_sweep) %>% 
  count(difference > 0)

lag(V1, 1)
#for each observation, look at the previous observations and compare
