library("tidyverse")
library("dplyr")
setwd("../../../../")
setwd("./Desktop/code/cle-budget/SmallEnterpriseFund/")

#Import data by reading each excel page as a csv and saving it to a dataframe
data_cemeteries = read_csv('SmallEnterpriseFunds_Cemeteries_pg428-30.csv')
data_golf = read_csv('SmallEnterpriseFunds_GolfCourse_pg432-33.csv')
data_parking = read_csv('SmallEnterpriseFunds_PrkingLotsGnrlOp_pg434-36.csv')
data_auditorium = read_csv('SmallEnterpriseFunds_PublicAuditorium_pg440-42.csv')
data_wside = read_csv('SmallEnterpriseFunds_WSideMktGeneralOp_444-45.csv')
#Are we missing an east side market?

#Get the 2017 Values for the Salary section
sal_2017_cemeteries <- data_cemeteries[2:6,1:2]
#sal_2017_golf <-data_golf[,1:2] None
sal_2017_parking <-data_parking[2:8,1:2]
sal_2017_auditorium <-data_auditorium[2:10,1:2]
sal_2017_wside <-data_wside[2:7,1:2]

sal_2017 <- Reduce(function(r_x,r_y) merge(x=r_x, y=r_y, by=1, all=TRUE),
                   list(sal_2017_auditorium, 
                        sal_2017_cemeteries,
                        sal_2017_parking,
                        sal_2017_wside))

names(sal_2017)[1] <- '2017 Salaries'
names(sal_2017)[2] <- 'Auditorium'
names(sal_2017)[3] <- 'Cemetaries'
names(sal_2017)[4] <- 'Parking'
names(sal_2017)[5] <- 'West Side Market'


#Get the 2017 Values for the Benefits section
ben_2017_cemeteries <- data_cemeteries[9:20,1:2]
ben_2017_golf <-data_golf[2,1:2] 
ben_2017_parking <-data_parking[11:21,1:2]
ben_2017_auditorium <-data_auditorium[13:25,1:2]
ben_2017_wside <-data_wside[10:20,1:2]

ben_2017 <- Reduce(function(r_x,r_y) merge(x=r_x, y=r_y, by=1, all=TRUE),
                   list(ben_2017_auditorium, 
                        ben_2017_cemeteries,
                        ben_2017_parking,
                        ben_2017_wside, 
                        ben_2017_golf))

names(ben_2017)[1] <- '2017 Benefits'
names(ben_2017)[2] <- 'Auditorium'
names(ben_2017)[3] <- 'Cemetaries'
names(ben_2017)[4] <- 'Parking'
names(ben_2017)[5] <- 'West Side Market'
names(ben_2017)[6] <- 'Golf'

#Still have 
# - training section
# - utilities
# - contractual services
# - materials & supplies
# - maintenance
# - claims
# - interdepart service changes
# - revenue
