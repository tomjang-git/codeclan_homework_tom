

library(tidyverse)


1.1.1 read_in

meteorite_landings <-
  read_csv("meteorite_landings.csv")



meteorite_landings



1.1.2 change_name_in_variables_to_follow_standards


meteorite_landings <-
  meteorite_landings %>% 
  rename(mass_in_grams = `mass (g)`)



meteorite_landings <-
  meteorite_landings %>% 
  rename(fall_status = fall)




1.1.3 split_GeoLocation



meteorite_landings <-
  meteorite_landings %>% 
  separate(GeoLocation, sep = ",", into = c("latitude", "longitude"))


tidying_it


library(stringr)




meteorite_landings <-
  meteorite_landings %>% 
  mutate(latitude = str_replace_all(latitude, "\\(", ""))



meteorite_landings <-
  meteorite_landings %>% 
  mutate(longitude = str_replace_all(longitude, "\\)", ""))


changing_latitude_and_longitude_to_numeric 


meteorite_landings <-
  meteorite_landings %>% 
  transform(longitude = as.numeric(longitude))


meteorite_landings <-
  meteorite_landings %>% 
  transform(latitude = as.numeric(latitude))






1.1.4 replace_any_missing_values_with_zeros



meteorite_landings <-
  meteorite_landings %>% 
  mutate(longitude = coalesce(longitude, 0, na.rm = TRUE))


meteorite_landings <-
  meteorite_landings %>% 
  mutate(latitude = coalesce(latitude, 0, na.rm = TRUE))


1.1.5 remove_meteorites_less_than_1000g_in_weight_from_the_data


meteorite_landings_filtered <-
  meteorite_landings %>% 
  filter(mass_in_grams > 1000)


1.1.6 order_data_by_year_of_discovery


meteorite_landings_filtered_ordered <-
  meteorite_landings_filtered %>% 
  arrange(desc(year))





library(assertr)


1. the_data_has_the_variable_names_we_expect

???
  
  2. latitude_and_longitude_are_valid_values

not sure if i did this right?
  
  ```{r}
meteorite_landings_filtered_ordered %>% 
  verify(latitude >= -90 & latitude <= 90) %>% 
  verify(longitude >= -180 & longitude <= 180)
```



write_csv(meteorite_landings_filtered_ordered, 'meteorite_landings_clean.csv')














































































