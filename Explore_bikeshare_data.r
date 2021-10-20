setwd("D:/Courses/DS/udacity-git-course/pdsnd_github")
ny = read.csv('new-york-city.csv')
wa = read.csv('washington.csv')
ch = read.csv('chicago.csv')

head(ny)

head(wa)

head(ch)

# Histogram on User Types

library(ggplot2)
User_type = function(dataset= NULL){
  qplot(x= dataset$Trip.Duration, 
        data= subset(dataset, !is.na(User.Type)), 
        xlim = c(0,5500), color = I('black'), fill= I('#099DD9')) + 
    facet_wrap(~dataset$User.Type)
}
User_type(wa)

#The answer is a histogram made by a function that takes the dataframe as an input and returns a graph count of users by gender

# The average Birth Year

#library(dplyr)
birth = function(dataset= NULL){
    hist(head(dataset$Birth.Year, 250), xlab= "Birth year", ylab= "Count", main= "Average Birth Year")
}   

birth(ny)

#This histogram is used to show the average birth year of the users but it works with 2 cities only (chicago and new york).

# Histogram of the average of trip durations by gender

library(ggplot2)
User_type = function(dataset= NULL){
  qplot(x= dataset$Trip.Duration, 
        data= subset(dataset, !is.na(Gender)), 
        xlim = c(0,5500), color = I('black'), fill= I('#099DD9')) + 
    facet_wrap(~dataset$Gender)
}
User_type(ny)

#The histogram is used to show the average trip duration based on the gender of users 

system('python -m nbconvert Explore_bikeshare_data.ipynb')
by(wa$Trip.Duration, wa$User.Type, summary)
