# Week 1 Practice Code

# Type your name here:
#Khalid Hussein Ahmed 

# Complete these coding tasks, then submit your R file for another student to compare against the example output.

# Problem 1 

# Create a data frame that includes two columns, one named "Animals" and the other named "Foods". The first column should be this vector (note the intentional repeated values): Dog, Cat, Fish, Fish, Lizard
Animal <- c("Dog", "Cat", "Fish", "Fish", "Lizard")
View(Animal)

#The second column should be this vector: Bread, Orange, Chocolate, Carrots, Milk
Food <- c("Bread", "Orange", "Chocolate", "Carrots", "Milk")

#### Write your code below:

Data_F <- data.frame(Animal,Food)
View(Data_F)
# Problem 2

# Using the data frame created in Problem 2, use the table() command to create a frequency table for the column called "Animals".

table(Data_F$Food)

#### Write your code below:


# Problem 3

# Use read.csv() to import the survey data included in this assignment. Using that data, make a histogram of the column called "pid7".

caseid <- read.csv("./cces_sample_coursera.csv")
hist(caseid$pid7)
#### Write your code below:

caseid <- read_csv("caseid.csv")
hist(caseid$pid7)
