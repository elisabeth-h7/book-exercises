# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
#install.packages("dplyr")
#library("dplyr")

# Install (if needed) and load the "fueleconomy" package
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
#library("fueleconomy")

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)
filtered <- filter(vehicles, make == "Acura", year == 2015)
max_hwy_mpg <- filter(filtered, hwy ==  max(hwy))
temporary_variables_model <- select(max_hwy_mpg, "model")

# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)
best_2015_acura <- select(
  filter(
    filter(
      vehicles,
      make == "Acura",
      year == 2015
    ),
    hwy == max(hwy)
  ),
  model
)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)
best_2015_acura_pipe <- vehicles %>% 
  filter(year == 2015, make == "Acura") %>%
  filter(hwy == max(hwy)) %>% 
  select(model)


