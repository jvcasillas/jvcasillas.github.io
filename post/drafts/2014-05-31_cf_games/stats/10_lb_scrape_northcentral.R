
# North Central

library(XML) 

# men overall  north central

# scrape data

url_men_overall_northcentral <- "http://games.crossfit.com/scores/leaderboard.php?stage=5&sort=0&division=1&region=10&numberperpage=60&page=0&competition=0&frontpage=0&expanded=0&full=1&year=14&showtoggles=0&hidedropdowns=0&showathleteac=1&athletename="
data_men_overall_northcentral <- readHTMLTable(readLines(url_men_overall_northcentral), which=1, header=FALSE)


names(data_men_overall_northcentral) <- gsub("\\n", "", names(data_men_overall_northcentral)) 
names(data_men_overall_northcentral) <- gsub(" +", "", names(data_men_overall_northcentral)) 

data_men_overall_northcentral[] <- lapply(data_men_overall_northcentral, function(x) gsub("\\n", "", x))

# clean data

# rename column
names(data_men_overall_northcentral)[names(data_men_overall_northcentral)=="V1"] <- "points"
names(data_men_overall_northcentral)[names(data_men_overall_northcentral)=="V2"] <- "Athlete"

# Remove 1st row
data_men_overall_northcentral <- data_men_overall_northcentral[-1,]

# new 'overall' column based on chars of 'points'
data_men_overall_northcentral$overall <- substr(data_men_overall_northcentral$points, start=1, stop=3)
# remove unwanted characters from 'overall'		
data_men_overall_northcentral$overall <- gsub("\\(", "", paste(data_men_overall_northcentral$overall))
data_men_overall_northcentral$overall <- gsub("\\)", "", paste(data_men_overall_northcentral$overall))
data_men_overall_northcentral$overall <- gsub(":digit::blank:", "", paste(data_men_overall_northcentral$overall))

# new 'points2' column based on chars of old 'points' column
data_men_overall_northcentral$points2 <- substr(data_men_overall_northcentral$points, start=4, stop=8)
# remove unwanted characters from 'points2'		
data_men_overall_northcentral$points2 <- gsub("\\(", "", paste(data_men_overall_northcentral$points2))
data_men_overall_northcentral$points2 <- gsub("\\)", "", paste(data_men_overall_northcentral$points2))

# Remove old 'points' column
data_men_overall_northcentral <- data_men_overall_northcentral[,-c(1)]


# new column 'V3rank' based on chars of old 'V3' column
data_men_overall_northcentral$V3rank <- substr(data_men_overall_northcentral$V3, start=1, stop=3)
data_men_overall_northcentral$V3rank <- gsub("\\(", "", paste(data_men_overall_northcentral$V3rank))
data_men_overall_northcentral$V3rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_northcentral$V3rank))

# new column 'V3score' based on chars of old 'V3' column
data_men_overall_northcentral$V3score <- substr(data_men_overall_northcentral$V3, start=3, stop=8)
data_men_overall_northcentral$V3score <- substr(data_men_overall_northcentral$V3score, start=2, stop=8)
data_men_overall_northcentral$V3score <- gsub("\\(", "", paste(data_men_overall_northcentral$V3score))
data_men_overall_northcentral$V3score <- gsub("\\)", "", paste(data_men_overall_northcentral$V3score))
data_men_overall_northcentral$V3score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_northcentral$V3score))

# new column 'V4rank' based on chars of old 'V4' column
data_men_overall_northcentral$V4rank <- substr(data_men_overall_northcentral$V4, start=1, stop=3)
data_men_overall_northcentral$V4rank <- gsub("\\(", "", paste(data_men_overall_northcentral$V4rank))
data_men_overall_northcentral$V4rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_northcentral$V4rank))

# new column 'V4score' based on chars of old 'V4' column
data_men_overall_northcentral$V4score <- substr(data_men_overall_northcentral$V4, start=3, stop=8)
data_men_overall_northcentral$V4score <- substr(data_men_overall_northcentral$V4score, start=2, stop=8)
data_men_overall_northcentral$V4score <- gsub("\\(", "", paste(data_men_overall_northcentral$V4score))
data_men_overall_northcentral$V4score <- gsub("\\)", "", paste(data_men_overall_northcentral$V4score))
data_men_overall_northcentral$V4score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_northcentral$V4score))

# new column 'V5rank' based on chars of old 'V5' column
data_men_overall_northcentral$V5rank <- substr(data_men_overall_northcentral$V5, start=1, stop=3)
data_men_overall_northcentral$V5rank <- gsub("\\(", "", paste(data_men_overall_northcentral$V5rank))
data_men_overall_northcentral$V5rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_northcentral$V5rank))

# new column 'V5score' based on chars of old 'V5' column
data_men_overall_northcentral$V5score <- substr(data_men_overall_northcentral$V5, start=3, stop=8)
data_men_overall_northcentral$V5score <- substr(data_men_overall_northcentral$V5score, start=2, stop=8)
data_men_overall_northcentral$V5score <- gsub("\\(", "", paste(data_men_overall_northcentral$V5score))
data_men_overall_northcentral$V5score <- gsub("\\)", "", paste(data_men_overall_northcentral$V5score))
data_men_overall_northcentral$V5score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_northcentral$V5score))

# new column 'V6rank' based on chars of old 'V6' column
data_men_overall_northcentral$V6rank <- substr(data_men_overall_northcentral$V6, start=1, stop=3)
data_men_overall_northcentral$V6rank <- gsub("\\(", "", paste(data_men_overall_northcentral$V6rank))
data_men_overall_northcentral$V6rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_northcentral$V6rank))

# new column 'V6score' based on chars of old 'V6' column
data_men_overall_northcentral$V6score <- substr(data_men_overall_northcentral$V6, start=3, stop=8)
data_men_overall_northcentral$V6score <- substr(data_men_overall_northcentral$V6score, start=2, stop=8)
data_men_overall_northcentral$V6score <- gsub("\\(", "", paste(data_men_overall_northcentral$V6score))
data_men_overall_northcentral$V6score <- gsub("\\)", "", paste(data_men_overall_northcentral$V6score))
data_men_overall_northcentral$V6score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_northcentral$V6score))

# new column 'V7rank' based on chars of old 'V7' column
data_men_overall_northcentral$V7rank <- substr(data_men_overall_northcentral$V7, start=1, stop=3)
data_men_overall_northcentral$V7rank <- gsub("\\(", "", paste(data_men_overall_northcentral$V7rank))
data_men_overall_northcentral$V7rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_northcentral$V7rank))

# new column 'V7score' based on chars of old 'V7' column
data_men_overall_northcentral$V7score <- substr(data_men_overall_northcentral$V7, start=3, stop=10)
data_men_overall_northcentral$V7score <- substr(data_men_overall_northcentral$V7score, start=2, stop=8)
data_men_overall_northcentral$V7score <- gsub("\\(", "", paste(data_men_overall_northcentral$V7score))
data_men_overall_northcentral$V7score <- gsub("\\)", "", paste(data_men_overall_northcentral$V7score))
data_men_overall_northcentral$V7score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_northcentral$V7score))

# Remove columns
data_men_overall_northcentral <- data_men_overall_northcentral[,-c(2:6)]

# New names
names(data_men_overall_northcentral)[names(data_men_overall_northcentral)=="overall"] <- "overall_rank"
names(data_men_overall_northcentral)[names(data_men_overall_northcentral)=="points2"] <- "overall_score"

names(data_men_overall_northcentral)[names(data_men_overall_northcentral)=="V3score"] <- "14_1_score"
names(data_men_overall_northcentral)[names(data_men_overall_northcentral)=="V4score"] <- "14_2_score"
names(data_men_overall_northcentral)[names(data_men_overall_northcentral)=="V5score"] <- "14_3_score"
names(data_men_overall_northcentral)[names(data_men_overall_northcentral)=="V6score"] <- "14_4_score"
names(data_men_overall_northcentral)[names(data_men_overall_northcentral)=="V7score"] <- "14_5_score"

names(data_men_overall_northcentral)[names(data_men_overall_northcentral)=="V3rank"] <- "14_1_rank"
names(data_men_overall_northcentral)[names(data_men_overall_northcentral)=="V4rank"] <- "14_2_rank"
names(data_men_overall_northcentral)[names(data_men_overall_northcentral)=="V5rank"] <- "14_3_rank"
names(data_men_overall_northcentral)[names(data_men_overall_northcentral)=="V6rank"] <- "14_4_rank"
names(data_men_overall_northcentral)[names(data_men_overall_northcentral)=="V7rank"] <- "14_5_rank"

str(data_men_overall_northcentral)
data_men_overall_northcentral$Athlete <- as.factor(data_men_overall_northcentral$Athlete)
data_men_overall_northcentral$'overall_rank' <- as.numeric(data_men_overall_northcentral$'overall_rank')
data_men_overall_northcentral$'overall_score' <- as.numeric(data_men_overall_northcentral$'overall_score')
data_men_overall_northcentral$'14_1_rank' <- as.numeric(data_men_overall_northcentral$'14_1_rank')
data_men_overall_northcentral$'14_1_score' <- as.numeric(data_men_overall_northcentral$'14_1_score')
data_men_overall_northcentral$'14_2_rank' <- as.numeric(data_men_overall_northcentral$'14_2_rank')
data_men_overall_northcentral$'14_2_score' <- as.numeric(data_men_overall_northcentral$'14_2_score')
data_men_overall_northcentral$'14_3_rank' <- as.numeric(data_men_overall_northcentral$'14_3_rank')
data_men_overall_northcentral$'14_3_score' <- as.numeric(data_men_overall_northcentral$'14_3_score')
data_men_overall_northcentral$'14_4_rank' <- as.numeric(data_men_overall_northcentral$'14_4_rank')
data_men_overall_northcentral$'14_4_score' <- as.numeric(data_men_overall_northcentral$'14_4_score')
data_men_overall_northcentral$'14_5_rank' <- as.numeric(data_men_overall_northcentral$'14_5_rank')



# women overall north central

# scrape data

url_women_overall_northcentral <- "http://games.crossfit.com/scores/leaderboard.php?stage=5&sort=0&division=2&region=10&numberperpage=60&page=0&competition=0&frontpage=0&expanded=0&full=1&year=14&showtoggles=0&hidedropdowns=0&showathleteac=1&athletename="
data_women_overall_northcentral <- readHTMLTable(readLines(url_women_overall_northcentral), which=1, header=FALSE)


names(data_women_overall_northcentral) <- gsub("\\n", "", names(data_women_overall_northcentral)) 
names(data_women_overall_northcentral) <- gsub(" +", "", names(data_women_overall_northcentral)) 

data_women_overall_northcentral[] <- lapply(data_women_overall_northcentral, function(x) gsub("\\n", "", x))

# clean data

# rename column
names(data_women_overall_northcentral)[names(data_women_overall_northcentral)=="V1"] <- "points"
names(data_women_overall_northcentral)[names(data_women_overall_northcentral)=="V2"] <- "Athlete"

# Remove 1st row
data_women_overall_northcentral <- data_women_overall_northcentral[-1,]

# new 'overall' column based on chars of 'points'
data_women_overall_northcentral$overall <- substr(data_women_overall_northcentral$points, start=1, stop=3)
# remove unwanted characters from 'overall'		
data_women_overall_northcentral$overall <- gsub("\\(", "", paste(data_women_overall_northcentral$overall))
data_women_overall_northcentral$overall <- gsub("\\)", "", paste(data_women_overall_northcentral$overall))
data_women_overall_northcentral$overall <- gsub(":digit::blank:", "", paste(data_women_overall_northcentral$overall))

# new 'points2' column based on chars of old 'points' column
data_women_overall_northcentral$points2 <- substr(data_women_overall_northcentral$points, start=4, stop=8)
# remove unwanted characters from 'points2'		
data_women_overall_northcentral$points2 <- gsub("\\(", "", paste(data_women_overall_northcentral$points2))
data_women_overall_northcentral$points2 <- gsub("\\)", "", paste(data_women_overall_northcentral$points2))

# Remove old 'points' column
data_women_overall_northcentral <- data_women_overall_northcentral[,-c(1)]


# new column 'V3rank' based on chars of old 'V3' column
data_women_overall_northcentral$V3rank <- substr(data_women_overall_northcentral$V3, start=1, stop=3)
data_women_overall_northcentral$V3rank <- gsub("\\(", "", paste(data_women_overall_northcentral$V3rank))
data_women_overall_northcentral$V3rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_northcentral$V3rank))

# new column 'V3score' based on chars of old 'V3' column
data_women_overall_northcentral$V3score <- substr(data_women_overall_northcentral$V3, start=3, stop=8)
data_women_overall_northcentral$V3score <- substr(data_women_overall_northcentral$V3score, start=2, stop=8)
data_women_overall_northcentral$V3score <- gsub("\\(", "", paste(data_women_overall_northcentral$V3score))
data_women_overall_northcentral$V3score <- gsub("\\)", "", paste(data_women_overall_northcentral$V3score))
data_women_overall_northcentral$V3score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_northcentral$V3score))

# new column 'V4rank' based on chars of old 'V4' column
data_women_overall_northcentral$V4rank <- substr(data_women_overall_northcentral$V4, start=1, stop=3)
data_women_overall_northcentral$V4rank <- gsub("\\(", "", paste(data_women_overall_northcentral$V4rank))
data_women_overall_northcentral$V4rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_northcentral$V4rank))

# new column 'V4score' based on chars of old 'V4' column
data_women_overall_northcentral$V4score <- substr(data_women_overall_northcentral$V4, start=3, stop=8)
data_women_overall_northcentral$V4score <- substr(data_women_overall_northcentral$V4score, start=2, stop=8)
data_women_overall_northcentral$V4score <- gsub("\\(", "", paste(data_women_overall_northcentral$V4score))
data_women_overall_northcentral$V4score <- gsub("\\)", "", paste(data_women_overall_northcentral$V4score))
data_women_overall_northcentral$V4score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_northcentral$V4score))

# new column 'V5rank' based on chars of old 'V5' column
data_women_overall_northcentral$V5rank <- substr(data_women_overall_northcentral$V5, start=1, stop=3)
data_women_overall_northcentral$V5rank <- gsub("\\(", "", paste(data_women_overall_northcentral$V5rank))
data_women_overall_northcentral$V5rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_northcentral$V5rank))

# new column 'V5score' based on chars of old 'V5' column
data_women_overall_northcentral$V5score <- substr(data_women_overall_northcentral$V5, start=3, stop=8)
data_women_overall_northcentral$V5score <- substr(data_women_overall_northcentral$V5score, start=2, stop=8)
data_women_overall_northcentral$V5score <- gsub("\\(", "", paste(data_women_overall_northcentral$V5score))
data_women_overall_northcentral$V5score <- gsub("\\)", "", paste(data_women_overall_northcentral$V5score))
data_women_overall_northcentral$V5score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_northcentral$V5score))

# new column 'V6rank' based on chars of old 'V6' column
data_women_overall_northcentral$V6rank <- substr(data_women_overall_northcentral$V6, start=1, stop=3)
data_women_overall_northcentral$V6rank <- gsub("\\(", "", paste(data_women_overall_northcentral$V6rank))
data_women_overall_northcentral$V6rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_northcentral$V6rank))

# new column 'V6score' based on chars of old 'V6' column
data_women_overall_northcentral$V6score <- substr(data_women_overall_northcentral$V6, start=3, stop=8)
data_women_overall_northcentral$V6score <- substr(data_women_overall_northcentral$V6score, start=2, stop=8)
data_women_overall_northcentral$V6score <- gsub("\\(", "", paste(data_women_overall_northcentral$V6score))
data_women_overall_northcentral$V6score <- gsub("\\)", "", paste(data_women_overall_northcentral$V6score))
data_women_overall_northcentral$V6score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_northcentral$V6score))

# new column 'V7rank' based on chars of old 'V7' column
data_women_overall_northcentral$V7rank <- substr(data_women_overall_northcentral$V7, start=1, stop=3)
data_women_overall_northcentral$V7rank <- gsub("\\(", "", paste(data_women_overall_northcentral$V7rank))
data_women_overall_northcentral$V7rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_northcentral$V7rank))

# new column 'V7score' based on chars of old 'V7' column
data_women_overall_northcentral$V7score <- substr(data_women_overall_northcentral$V7, start=3, stop=10)
data_women_overall_northcentral$V7score <- substr(data_women_overall_northcentral$V7score, start=2, stop=8)
data_women_overall_northcentral$V7score <- gsub("\\(", "", paste(data_women_overall_northcentral$V7score))
data_women_overall_northcentral$V7score <- gsub("\\)", "", paste(data_women_overall_northcentral$V7score))
data_women_overall_northcentral$V7score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_northcentral$V7score))

# Remove columns
data_women_overall_northcentral <- data_women_overall_northcentral[,-c(2:6)]

# New names
names(data_women_overall_northcentral)[names(data_women_overall_northcentral)=="overall"] <- "overall_rank"
names(data_women_overall_northcentral)[names(data_women_overall_northcentral)=="points2"] <- "overall_score"

names(data_women_overall_northcentral)[names(data_women_overall_northcentral)=="V3score"] <- "14_1_score"
names(data_women_overall_northcentral)[names(data_women_overall_northcentral)=="V4score"] <- "14_2_score"
names(data_women_overall_northcentral)[names(data_women_overall_northcentral)=="V5score"] <- "14_3_score"
names(data_women_overall_northcentral)[names(data_women_overall_northcentral)=="V6score"] <- "14_4_score"
names(data_women_overall_northcentral)[names(data_women_overall_northcentral)=="V7score"] <- "14_5_score"

names(data_women_overall_northcentral)[names(data_women_overall_northcentral)=="V3rank"] <- "14_1_rank"
names(data_women_overall_northcentral)[names(data_women_overall_northcentral)=="V4rank"] <- "14_2_rank"
names(data_women_overall_northcentral)[names(data_women_overall_northcentral)=="V5rank"] <- "14_3_rank"
names(data_women_overall_northcentral)[names(data_women_overall_northcentral)=="V6rank"] <- "14_4_rank"
names(data_women_overall_northcentral)[names(data_women_overall_northcentral)=="V7rank"] <- "14_5_rank"

str(data_women_overall_northcentral)
data_women_overall_northcentral$Athlete <- as.factor(data_women_overall_northcentral$Athlete)
data_women_overall_northcentral$'overall_rank' <- as.numeric(data_women_overall_northcentral$'overall_rank')
data_women_overall_northcentral$'overall_score' <- as.numeric(data_women_overall_northcentral$'overall_score')
data_women_overall_northcentral$'14_1_rank' <- as.numeric(data_women_overall_northcentral$'14_1_rank')
data_women_overall_northcentral$'14_1_score' <- as.numeric(data_women_overall_northcentral$'14_1_score')
data_women_overall_northcentral$'14_2_rank' <- as.numeric(data_women_overall_northcentral$'14_2_rank')
data_women_overall_northcentral$'14_2_score' <- as.numeric(data_women_overall_northcentral$'14_2_score')
data_women_overall_northcentral$'14_3_rank' <- as.numeric(data_women_overall_northcentral$'14_3_rank')
data_women_overall_northcentral$'14_3_score' <- as.numeric(data_women_overall_northcentral$'14_3_score')
data_women_overall_northcentral$'14_4_rank' <- as.numeric(data_women_overall_northcentral$'14_4_rank')
data_women_overall_northcentral$'14_4_score' <- as.numeric(data_women_overall_northcentral$'14_4_score')
data_women_overall_northcentral$'14_5_rank' <- as.numeric(data_women_overall_northcentral$'14_5_rank')

