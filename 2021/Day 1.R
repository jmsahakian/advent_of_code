#12/02/2021 Day 1
library(tidyverse)
#Part 1
sweep_report <- read.table("2021/input.txt")
sweep_report <- sweep_report %>% 
  rename(sweep = V1) %>% 
  mutate(previous_sweep = lag(sweep)) %>% 
  mutate(difference = sweep - previous_sweep) %>% 
  count(difference > 0)
#Part 2
library(RcppRoll)
sweep_report_2 <- read.table("2021/input.txt", col.names = c("depth"))
sweep_report_2 <- sweep_report_2 %>% 
  mutate(total_3 = roll_sum(depth, 3, fill = NA, align = "left")) %>% 
  mutate(previous_total = lag(total_3)) %>% 
  mutate(difference = total_3 - previous_total) %>% 
  count(difference > 0)
 