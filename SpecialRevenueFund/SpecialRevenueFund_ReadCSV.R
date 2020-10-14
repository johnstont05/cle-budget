library("tidyverse")
library("dplyr")

#salaries
#Contractual Services
#Revenue
#interfund subsidies
#capital outlay
#debt services


#Import data by reading each excel page as a csv and saving it to a dataframe
setwd("./Desktop/cle-budget/SpecialRevenueFund/")
getwd()
df_stadium = read_csv('SpecialRevenueFunds_ClevelandStadium_pg374.csv')
df_income_tax = read_csv('SpecialRevenueFunds_RestrictedIncomeTax_pg366.csv')
df_schools = read_csv('SpecialRevenueFunds_SchoolsRec&Cultural_pg373.csv')
df_construction = read_csv('SpecialRevenueFunds_StConstruMntn&Repair_pg368-70.csv')


#Get the 2017 Values for the Contractual services section
#This part of the code is what gets specific rows and columns
# [1:10,1:2]  -> 1:10 means get first 10 rows 
# [1:10,1:2]  -> 1:2 means get first 2 columns
contr_services_2017_stadium <- df_01_council[1:10,1:2]


#Merge all the offices into one dataframe
# This code is confusing code, so I'll explain it part by part
# Reduce(function(r_x,r_y) : Reduce recursively applies the function we give it. Here we are giving the merge function and saying that function takes 2 vars, x & y
# merge(x=r_x, y=r_y : Merge is a function that combines two datasets. Here we are telling it merge whatever r_x & r_y the reduce function is currently looping through
# These are parameters for the merge function that define how we want the merge function to work
# by= 1 : means merge on the first column of every dataframe
# all=true : means do an outerjoin (ie- keep all rows)
# suffix =   #suffix=c(names(r_x)[1], names(r_y)[1])) : renames the columns of the outputed table. maybe not needed
# list(...) : this is the 2nd param of the reduce function. This is the loop of dataframes we want to merge
f_salary_2017 <- Reduce(function(r_x,r_y) merge(x=r_x, y=r_y, by=1, all=TRUE),  
                        list(GF_council_salary_2017, GF_mayor_salary_2017, GF_capitalprojects_salary_2017))

#Rename first column
names(f_salary_2017)[1] <- '2017 - Salary'
names(f_salary_2017)[2] <- 'Council and Clerk of Council'
names(f_salary_2017)[3] <- 'Office of Mayor'
names(f_salary_2017)[4] <- 'Office of Capital Projects'


### REPEAT ABOVE CODE FOR BENEFITS SECTION ##
#Get the 2017 Values for the Budget section
#This part of the code is what gets specific rows and columns
# [12:23,1:2]  -> 11:23 means get rows 11 to 23 
# [1:10,1:2]  -> 1:2 means get first 2 columns
GF_council_benefits_2017 <- df_01_council[12:23,1:2]
GF_mayor_benefits_2017 <- df_02_mayor[12:23,1:2]
GF_capitalprojects_benefits_2017 <- df_03_capitalprojects[12:23,1:2]


#Merge all the offices into one dataframe
f_benefits_2017 <- Reduce(function(r_x,r_y) merge(x=r_x, y=r_y, by=1, all=TRUE), 
                          list(GF_council_benefits_2017, GF_mayor_benefits_2017, GF_capitalprojects_benefits_2017))

#Rename columns
names(f_benefits_2017)[1] <- '2017 - Benefits'
names(f_benefits_2017)[2] <- 'Council and Clerk of Council'
names(f_benefits_2017)[3] <- 'Office of Mayor'
names(f_benefits_2017)[4] <- 'Office of Capital Projects'