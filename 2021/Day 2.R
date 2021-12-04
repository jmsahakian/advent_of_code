#12/02/2021 Day 2
library(tidyverse)
library(dplyr)
#Part 1
dive <- read.table("2021/input2.txt", col.names = c("position_type", "value"))

dive <- dive %>% 
  group_by(position_type) %>% 
  mutate(row = row_number()) %>% 
  pivot_wider(names_from = "position_type", values_from = "value") %>% 
  mutate(sum_forward = sum(forward,na.rm = TRUE)) %>% 
  mutate(sum_down = sum(down, na.rm = TRUE)) %>% 
  mutate(sum_up = sum(up,na.rm = TRUE)) %>% 
  mutate(total_depth = sum_down - sum_up) %>% 
  mutate(total_product = sum_forward*total_depth) 

dive2 <- read.table("2021/input2.txt", col.names = c("position_type", "value"))
dive2 <- dive2 %>% 
  group_by(position_type) %>% 
  mutate(row = row_number()) %>% 
  pivot_wider(names_from = "position_type", values_from = "value")


  
#aim
#aim is the new depth
#aim = down - up + (aim*forward)
#feel like 
#d %>% 
#group_by(dir) %>% 
 # summarise(total_len = sum(len)) %>% 
  #pivot_wider(names_from = dir, values_from = total_len) %>% 
  #mutate(ans = (down - up)*forward)