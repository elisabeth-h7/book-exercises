# Exercise 4: practicing with dplyr

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")
#library("nycflights13")
#install.packages("dplyr")
#library("dplyr")

# The data frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)
nrow(flights)
ncol(flights)
??flights
View(flights)

# Use `dplyr` to give the data frame a new column that is the amount of time
# gained or lost while flying (that is: how much of the delay arriving occured
# during flight, as opposed to before departing).
time_gained_lost <- mutate(flights, gain_loss = dep_delay - arr_delay)

# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)
descending_order <- arrange(time_gained_lost, -gain_loss)

# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables to "reset" the data frame
descending_order_pipe <- flights %>% 
  mutate(gain_loss = dep_delay - arr_delay) %>% 
  arrange(-gain_loss) 
  
# Make a histogram of the amount of time gained using the `hist()` function
histogram <- descending_order[descending_order$gain_loss >= 0 ,]
str_histogram <- str(histogram)
hist(str_histogram)

# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
gain_or_lose <- mean(time_gained_lost, na.rm = TRUE) > 0

# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain_in_air" column you just created


# On average, did flights to SeaTac gain or loose time?


# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!

