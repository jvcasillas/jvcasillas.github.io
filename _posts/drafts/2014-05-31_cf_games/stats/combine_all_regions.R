
source('stats/01_lb_scrape_africa.R')
source('stats/02_lb_scrape_asia.R')
source('stats/03_lb_scrape_australia.R')
source('stats/04_lb_scrape_canadaeast.R')
source('stats/05_lb_scrape_canadawest.R')
source('stats/06_lb_scrape_centraleast.R')
source('stats/07_lb_scrape_europe.R')
source('stats/08_lb_scrape_latinamerica.R')
source('stats/09_lb_scrape_midatlantic.R')
source('stats/10_lb_scrape_northcentral.R')
source('stats/11_lb_scrape_northeast.R')
source('stats/12_lb_scrape_northerncalifornia.R')
source('stats/13_lb_scrape_northwest.R')
source('stats/14_lb_scrape_southcentral.R')
source('stats/15_lb_scrape_southeast.R')
source('stats/16_lb_scrape_southerncalifornia.R')
source('stats/17_lb_scrape_southwest.R')

# Men
data_men_overall_africa["region"] <- "africa"
data_men_overall_asia["region"] <- "asia"
data_men_overall_australia["region"] <- "australia"
data_men_overall_canadaeast["region"] <- "canadaeast"
data_men_overall_canadawest["region"] <- "canadawest"
data_men_overall_centraleast["region"] <- "centraleast"
data_men_overall_europe["region"] <- "europe"
data_men_overall_latinamerica["region"] <- "latinamerica"
data_men_overall_midatlantic["region"] <- "midatlantic"
data_men_overall_northcentral["region"] <- "northcentral"
data_men_overall_northeast["region"] <- "northeast"
data_men_overall_northerncalifornia["region"] <- "northerncalifornia"
data_men_overall_northwest["region"] <- "northwest"
data_men_overall_southcentral["region"] <- "southcentral"
data_men_overall_southeast["region"] <- "southeast"
data_men_overall_southerncalifornia["region"] <- "southerncalifornia"
data_men_overall_southwest["region"] <- "southwest"

data_men_overall_africa["gender"] <- "m"
data_men_overall_asia["gender"] <- "m"
data_men_overall_australia["gender"] <- "m"
data_men_overall_canadaeast["gender"] <- "m"
data_men_overall_canadawest["gender"] <- "m"
data_men_overall_centraleast["gender"] <- "m"
data_men_overall_europe["gender"] <- "m"
data_men_overall_latinamerica["gender"] <- "m"
data_men_overall_midatlantic["gender"] <- "m"
data_men_overall_northcentral["gender"] <- "m"
data_men_overall_northeast["gender"] <- "m"
data_men_overall_northerncalifornia["gender"] <- "m"
data_men_overall_northwest["gender"] <- "m"
data_men_overall_southcentral["gender"] <- "m"
data_men_overall_southeast["gender"] <- "m"
data_men_overall_southerncalifornia["gender"] <- "m"
data_men_overall_southwest["gender"] <- "m"


# Women
data_women_overall_africa["region"] <- "africa"
data_women_overall_asia["region"] <- "asia"
data_women_overall_australia["region"] <- "australia"
data_women_overall_canadaeast["region"] <- "canadaeast"
data_women_overall_canadawest["region"] <- "canadawest"
data_women_overall_centraleast["region"] <- "centraleast"
data_women_overall_europe["region"] <- "europe"
data_women_overall_latinamerica["region"] <- "latinamerica"
data_women_overall_midatlantic["region"] <- "midatlantic"
data_women_overall_northcentral["region"] <- "northcentral"
data_women_overall_northeast["region"] <- "northeast"
data_women_overall_northerncalifornia["region"] <- "northerncalifornia"
data_women_overall_northwest["region"] <- "northwest"
data_women_overall_southcentral["region"] <- "southcentral"
data_women_overall_southeast["region"] <- "southeast"
data_women_overall_southerncalifornia["region"] <- "southerncalifornia"
data_women_overall_southwest["region"] <- "southwest"

data_women_overall_africa["gender"] <- "f"
data_women_overall_asia["gender"] <- "f"
data_women_overall_australia["gender"] <- "f"
data_women_overall_canadaeast["gender"] <- "f"
data_women_overall_canadawest["gender"] <- "f"
data_women_overall_centraleast["gender"] <- "f"
data_women_overall_europe["gender"] <- "f"
data_women_overall_latinamerica["gender"] <- "f"
data_women_overall_midatlantic["gender"] <- "f"
data_women_overall_northcentral["gender"] <- "f"
data_women_overall_northeast["gender"] <- "f"
data_women_overall_northerncalifornia["gender"] <- "f"
data_women_overall_northwest["gender"] <- "f"
data_women_overall_southcentral["gender"] <- "f"
data_women_overall_southeast["gender"] <- "f"
data_women_overall_southerncalifornia["gender"] <- "f"
data_women_overall_southwest["gender"] <- "f"

# write tables
write.table(data_men_overall_africa, "assets/data_men_overall_africa.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_africa, "assets/data_men_overall_africa.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_asia, "assets/data_men_overall_asia.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_australia, "assets/data_men_overall_australia.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_canadaeast, "assets/data_men_overall_canadaeast.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_canadawest, "assets/data_men_overall_canadawest.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_centraleast, "assets/data_men_overall_centraleast.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_europe, "assets/data_men_overall_europe.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_latinamerica, "assets/data_men_overall_latinamerica.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_midatlantic, "assets/data_men_overall_midatlantic.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_northcentral, "assets/data_men_overall_northcentral.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_northeast, "assets/data_men_overall_northeast.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_northerncalifornia, "assets/data_men_overall_northerncalifornia.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_northwest, "assets/data_men_overall_northwest.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_southcentral, "assets/data_men_overall_southcentral.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_southeast, "assets/data_men_overall_southeast.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_southerncalifornia, "assets/data_men_overall_southerncalifornia.csv", row.names=F, quote=F, sep=",")
write.table(data_men_overall_southwest, "assets/data_men_overall_southwest.csv", row.names=F, quote=F, sep=",")

write.table(data_women_overall_africa, "assets/data_women_overall_africa.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_africa, "assets/data_women_overall_africa.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_asia, "assets/data_women_overall_asia.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_australia, "assets/data_women_overall_australia.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_canadaeast, "assets/data_women_overall_canadaeast.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_canadawest, "assets/data_women_overall_canadawest.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_centraleast, "assets/data_women_overall_centraleast.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_europe, "assets/data_women_overall_europe.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_latinamerica, "assets/data_women_overall_latinamerica.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_midatlantic, "assets/data_women_overall_midatlantic.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_northcentral, "assets/data_women_overall_northcentral.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_northeast, "assets/data_women_overall_northeast.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_northerncalifornia, "assets/data_women_overall_northerncalifornia.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_northwest, "assets/data_women_overall_northwest.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_southcentral, "assets/data_women_overall_southcentral.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_southeast, "assets/data_women_overall_southeast.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_southerncalifornia, "assets/data_women_overall_southerncalifornia.csv", row.names=F, quote=F, sep=",")
write.table(data_women_overall_southwest, "assets/data_women_overall_southwest.csv", row.names=F, quote=F, sep=",")


# Combine files vertically into large data frame
temp <- list.files(path="assets/", full.names=TRUE)
myfiles <- lapply(temp, read.delim,sep = ",")
df <- do.call("rbind",myfiles)

# Convert wide table to long format
library(reshape2)
df.long = melt(df, 
			id = c("Athlete","overall_rank","overall_score", "gender", "region"), # keep these columns the same
            measure = c("X14_1_score","X14_2_score", "X14_3_score", "X14_4_score", "X14_5_score"), # Put these columns into a new column
            variable.name="wod_score") # Name of new column with the labels

summary(df.long)

df.long2 = melt(df, 
			id = c("Athlete","overall_rank","overall_score", "gender", "region"), # keep these columns the same
            measure = c("X14_1_rank","X14_2_rank", "X14_3_rank", "X14_4_rank", "X14_5_rank"), # Put these columns into a new column
            variable.name="wod_finish") # Name of new column with the labels

summary(df.long)

df_final <- cbind(df.long, df.long2)
# Remove columns
df_final <- df_final[,-c(8:13)]

# rename column
names(df_final)[names(df_final)=="Athlete"] <- "athlete"
names(df_final)[names(df_final)=="wod_score"] <- "wod"
names(df_final)[names(df_final)=="value"] <- "score"
names(df_final)[names(df_final)=="value.1"] <- "rank"

# remove unwanted characters from column		
df_final$wod <- gsub("X", "", paste(df_final$wod))
df_final$wod <- gsub("_score", "", paste(df_final$wod))

# sort (reorder) columns
df_final <- df_final[,c(1,4:8,3:2)]

# sort rows of dataframe
df_final <- df_final[with(df_final, order(gender, region, wod, score)), ]

df_final$region <- as.factor(df_final$region)
df_final$wod <- as.factor(df_final$wod)
df_final$score <- as.numeric(df_final$score)
df_final$overall_score <- as.numeric(df_final$overall_score)

write.table(df_final, "stats/open_results.csv", row.names=F, quote=F, sep=",")
