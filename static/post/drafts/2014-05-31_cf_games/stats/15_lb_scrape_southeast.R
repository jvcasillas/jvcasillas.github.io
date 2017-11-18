
# South East

library(XML) 

# men overall  south east

# scrape data

url_men_overall_southeast <- "http://games.crossfit.com/scores/leaderboard.php?stage=5&sort=0&division=1&region=15&numberperpage=60&page=0&competition=0&frontpage=0&expanded=0&full=1&year=14&showtoggles=0&hidedropdowns=0&showathleteac=1&athletename="
data_men_overall_southeast <- readHTMLTable(readLines(url_men_overall_southeast), which=1, header=FALSE)


names(data_men_overall_southeast) <- gsub("\\n", "", names(data_men_overall_southeast)) 
names(data_men_overall_southeast) <- gsub(" +", "", names(data_men_overall_southeast)) 

data_men_overall_southeast[] <- lapply(data_men_overall_southeast, function(x) gsub("\\n", "", x))

# clean data

# rename column
names(data_men_overall_southeast)[names(data_men_overall_southeast)=="V1"] <- "points"
names(data_men_overall_southeast)[names(data_men_overall_southeast)=="V2"] <- "Athlete"

# Remove 1st row
data_men_overall_southeast <- data_men_overall_southeast[-1,]

# new 'overall' column based on chars of 'points'
data_men_overall_southeast$overall <- substr(data_men_overall_southeast$points, start=1, stop=3)
# remove unwanted characters from 'overall'		
data_men_overall_southeast$overall <- gsub("\\(", "", paste(data_men_overall_southeast$overall))
data_men_overall_southeast$overall <- gsub("\\)", "", paste(data_men_overall_southeast$overall))
data_men_overall_southeast$overall <- gsub(":digit::blank:", "", paste(data_men_overall_southeast$overall))

# new 'points2' column based on chars of old 'points' column
data_men_overall_southeast$points2 <- substr(data_men_overall_southeast$points, start=4, stop=8)
# remove unwanted characters from 'points2'		
data_men_overall_southeast$points2 <- gsub("\\(", "", paste(data_men_overall_southeast$points2))
data_men_overall_southeast$points2 <- gsub("\\)", "", paste(data_men_overall_southeast$points2))

# Remove old 'points' column
data_men_overall_southeast <- data_men_overall_southeast[,-c(1)]


# new column 'V3rank' based on chars of old 'V3' column
data_men_overall_southeast$V3rank <- substr(data_men_overall_southeast$V3, start=1, stop=3)
data_men_overall_southeast$V3rank <- gsub("\\(", "", paste(data_men_overall_southeast$V3rank))
data_men_overall_southeast$V3rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_southeast$V3rank))

# new column 'V3score' based on chars of old 'V3' column
data_men_overall_southeast$V3score <- substr(data_men_overall_southeast$V3, start=3, stop=8)
data_men_overall_southeast$V3score <- substr(data_men_overall_southeast$V3score, start=2, stop=8)
data_men_overall_southeast$V3score <- gsub("\\(", "", paste(data_men_overall_southeast$V3score))
data_men_overall_southeast$V3score <- gsub("\\)", "", paste(data_men_overall_southeast$V3score))
data_men_overall_southeast$V3score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_southeast$V3score))

# new column 'V4rank' based on chars of old 'V4' column
data_men_overall_southeast$V4rank <- substr(data_men_overall_southeast$V4, start=1, stop=3)
data_men_overall_southeast$V4rank <- gsub("\\(", "", paste(data_men_overall_southeast$V4rank))
data_men_overall_southeast$V4rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_southeast$V4rank))

# new column 'V4score' based on chars of old 'V4' column
data_men_overall_southeast$V4score <- substr(data_men_overall_southeast$V4, start=3, stop=8)
data_men_overall_southeast$V4score <- substr(data_men_overall_southeast$V4score, start=2, stop=8)
data_men_overall_southeast$V4score <- gsub("\\(", "", paste(data_men_overall_southeast$V4score))
data_men_overall_southeast$V4score <- gsub("\\)", "", paste(data_men_overall_southeast$V4score))
data_men_overall_southeast$V4score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_southeast$V4score))

# new column 'V5rank' based on chars of old 'V5' column
data_men_overall_southeast$V5rank <- substr(data_men_overall_southeast$V5, start=1, stop=3)
data_men_overall_southeast$V5rank <- gsub("\\(", "", paste(data_men_overall_southeast$V5rank))
data_men_overall_southeast$V5rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_southeast$V5rank))

# new column 'V5score' based on chars of old 'V5' column
data_men_overall_southeast$V5score <- substr(data_men_overall_southeast$V5, start=3, stop=8)
data_men_overall_southeast$V5score <- substr(data_men_overall_southeast$V5score, start=2, stop=8)
data_men_overall_southeast$V5score <- gsub("\\(", "", paste(data_men_overall_southeast$V5score))
data_men_overall_southeast$V5score <- gsub("\\)", "", paste(data_men_overall_southeast$V5score))
data_men_overall_southeast$V5score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_southeast$V5score))

# new column 'V6rank' based on chars of old 'V6' column
data_men_overall_southeast$V6rank <- substr(data_men_overall_southeast$V6, start=1, stop=3)
data_men_overall_southeast$V6rank <- gsub("\\(", "", paste(data_men_overall_southeast$V6rank))
data_men_overall_southeast$V6rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_southeast$V6rank))

# new column 'V6score' based on chars of old 'V6' column
data_men_overall_southeast$V6score <- substr(data_men_overall_southeast$V6, start=3, stop=8)
data_men_overall_southeast$V6score <- substr(data_men_overall_southeast$V6score, start=2, stop=8)
data_men_overall_southeast$V6score <- gsub("\\(", "", paste(data_men_overall_southeast$V6score))
data_men_overall_southeast$V6score <- gsub("\\)", "", paste(data_men_overall_southeast$V6score))
data_men_overall_southeast$V6score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_southeast$V6score))

# new column 'V7rank' based on chars of old 'V7' column
data_men_overall_southeast$V7rank <- substr(data_men_overall_southeast$V7, start=1, stop=3)
data_men_overall_southeast$V7rank <- gsub("\\(", "", paste(data_men_overall_southeast$V7rank))
data_men_overall_southeast$V7rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_southeast$V7rank))

# new column 'V7score' based on chars of old 'V7' column
data_men_overall_southeast$V7score <- substr(data_men_overall_southeast$V7, start=3, stop=10)
data_men_overall_southeast$V7score <- substr(data_men_overall_southeast$V7score, start=2, stop=8)
data_men_overall_southeast$V7score <- gsub("\\(", "", paste(data_men_overall_southeast$V7score))
data_men_overall_southeast$V7score <- gsub("\\)", "", paste(data_men_overall_southeast$V7score))
data_men_overall_southeast$V7score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall_southeast$V7score))

# Remove columns
data_men_overall_southeast <- data_men_overall_southeast[,-c(2:6)]

# New names
names(data_men_overall_southeast)[names(data_men_overall_southeast)=="overall"] <- "overall_rank"
names(data_men_overall_southeast)[names(data_men_overall_southeast)=="points2"] <- "overall_score"

names(data_men_overall_southeast)[names(data_men_overall_southeast)=="V3score"] <- "14_1_score"
names(data_men_overall_southeast)[names(data_men_overall_southeast)=="V4score"] <- "14_2_score"
names(data_men_overall_southeast)[names(data_men_overall_southeast)=="V5score"] <- "14_3_score"
names(data_men_overall_southeast)[names(data_men_overall_southeast)=="V6score"] <- "14_4_score"
names(data_men_overall_southeast)[names(data_men_overall_southeast)=="V7score"] <- "14_5_score"

names(data_men_overall_southeast)[names(data_men_overall_southeast)=="V3rank"] <- "14_1_rank"
names(data_men_overall_southeast)[names(data_men_overall_southeast)=="V4rank"] <- "14_2_rank"
names(data_men_overall_southeast)[names(data_men_overall_southeast)=="V5rank"] <- "14_3_rank"
names(data_men_overall_southeast)[names(data_men_overall_southeast)=="V6rank"] <- "14_4_rank"
names(data_men_overall_southeast)[names(data_men_overall_southeast)=="V7rank"] <- "14_5_rank"

str(data_men_overall_southeast)
data_men_overall_southeast$Athlete <- as.factor(data_men_overall_southeast$Athlete)
data_men_overall_southeast$'overall_rank' <- as.numeric(data_men_overall_southeast$'overall_rank')
data_men_overall_southeast$'overall_score' <- as.numeric(data_men_overall_southeast$'overall_score')
data_men_overall_southeast$'14_1_rank' <- as.numeric(data_men_overall_southeast$'14_1_rank')
data_men_overall_southeast$'14_1_score' <- as.numeric(data_men_overall_southeast$'14_1_score')
data_men_overall_southeast$'14_2_rank' <- as.numeric(data_men_overall_southeast$'14_2_rank')
data_men_overall_southeast$'14_2_score' <- as.numeric(data_men_overall_southeast$'14_2_score')
data_men_overall_southeast$'14_3_rank' <- as.numeric(data_men_overall_southeast$'14_3_rank')
data_men_overall_southeast$'14_3_score' <- as.numeric(data_men_overall_southeast$'14_3_score')
data_men_overall_southeast$'14_4_rank' <- as.numeric(data_men_overall_southeast$'14_4_rank')
data_men_overall_southeast$'14_4_score' <- as.numeric(data_men_overall_southeast$'14_4_score')
data_men_overall_southeast$'14_5_rank' <- as.numeric(data_men_overall_southeast$'14_5_rank')



# women overall south east

# scrape data

url_women_overall_southeast <- "http://games.crossfit.com/scores/leaderboard.php?stage=5&sort=0&division=2&region=15&numberperpage=60&page=0&competition=0&frontpage=0&expanded=0&full=1&year=14&showtoggles=0&hidedropdowns=0&showathleteac=1&athletename="
data_women_overall_southeast <- readHTMLTable(readLines(url_women_overall_southeast), which=1, header=FALSE)


names(data_women_overall_southeast) <- gsub("\\n", "", names(data_women_overall_southeast)) 
names(data_women_overall_southeast) <- gsub(" +", "", names(data_women_overall_southeast)) 

data_women_overall_southeast[] <- lapply(data_women_overall_southeast, function(x) gsub("\\n", "", x))

# clean data

# rename column
names(data_women_overall_southeast)[names(data_women_overall_southeast)=="V1"] <- "points"
names(data_women_overall_southeast)[names(data_women_overall_southeast)=="V2"] <- "Athlete"

# Remove 1st row
data_women_overall_southeast <- data_women_overall_southeast[-1,]

# new 'overall' column based on chars of 'points'
data_women_overall_southeast$overall <- substr(data_women_overall_southeast$points, start=1, stop=3)
# remove unwanted characters from 'overall'		
data_women_overall_southeast$overall <- gsub("\\(", "", paste(data_women_overall_southeast$overall))
data_women_overall_southeast$overall <- gsub("\\)", "", paste(data_women_overall_southeast$overall))
data_women_overall_southeast$overall <- gsub(":digit::blank:", "", paste(data_women_overall_southeast$overall))

# new 'points2' column based on chars of old 'points' column
data_women_overall_southeast$points2 <- substr(data_women_overall_southeast$points, start=4, stop=8)
# remove unwanted characters from 'points2'		
data_women_overall_southeast$points2 <- gsub("\\(", "", paste(data_women_overall_southeast$points2))
data_women_overall_southeast$points2 <- gsub("\\)", "", paste(data_women_overall_southeast$points2))

# Remove old 'points' column
data_women_overall_southeast <- data_women_overall_southeast[,-c(1)]


# new column 'V3rank' based on chars of old 'V3' column
data_women_overall_southeast$V3rank <- substr(data_women_overall_southeast$V3, start=1, stop=3)
data_women_overall_southeast$V3rank <- gsub("\\(", "", paste(data_women_overall_southeast$V3rank))
data_women_overall_southeast$V3rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_southeast$V3rank))

# new column 'V3score' based on chars of old 'V3' column
data_women_overall_southeast$V3score <- substr(data_women_overall_southeast$V3, start=3, stop=8)
data_women_overall_southeast$V3score <- substr(data_women_overall_southeast$V3score, start=2, stop=8)
data_women_overall_southeast$V3score <- gsub("\\(", "", paste(data_women_overall_southeast$V3score))
data_women_overall_southeast$V3score <- gsub("\\)", "", paste(data_women_overall_southeast$V3score))
data_women_overall_southeast$V3score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_southeast$V3score))

# new column 'V4rank' based on chars of old 'V4' column
data_women_overall_southeast$V4rank <- substr(data_women_overall_southeast$V4, start=1, stop=3)
data_women_overall_southeast$V4rank <- gsub("\\(", "", paste(data_women_overall_southeast$V4rank))
data_women_overall_southeast$V4rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_southeast$V4rank))

# new column 'V4score' based on chars of old 'V4' column
data_women_overall_southeast$V4score <- substr(data_women_overall_southeast$V4, start=3, stop=8)
data_women_overall_southeast$V4score <- substr(data_women_overall_southeast$V4score, start=2, stop=8)
data_women_overall_southeast$V4score <- gsub("\\(", "", paste(data_women_overall_southeast$V4score))
data_women_overall_southeast$V4score <- gsub("\\)", "", paste(data_women_overall_southeast$V4score))
data_women_overall_southeast$V4score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_southeast$V4score))

# new column 'V5rank' based on chars of old 'V5' column
data_women_overall_southeast$V5rank <- substr(data_women_overall_southeast$V5, start=1, stop=3)
data_women_overall_southeast$V5rank <- gsub("\\(", "", paste(data_women_overall_southeast$V5rank))
data_women_overall_southeast$V5rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_southeast$V5rank))

# new column 'V5score' based on chars of old 'V5' column
data_women_overall_southeast$V5score <- substr(data_women_overall_southeast$V5, start=3, stop=8)
data_women_overall_southeast$V5score <- substr(data_women_overall_southeast$V5score, start=2, stop=8)
data_women_overall_southeast$V5score <- gsub("\\(", "", paste(data_women_overall_southeast$V5score))
data_women_overall_southeast$V5score <- gsub("\\)", "", paste(data_women_overall_southeast$V5score))
data_women_overall_southeast$V5score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_southeast$V5score))

# new column 'V6rank' based on chars of old 'V6' column
data_women_overall_southeast$V6rank <- substr(data_women_overall_southeast$V6, start=1, stop=3)
data_women_overall_southeast$V6rank <- gsub("\\(", "", paste(data_women_overall_southeast$V6rank))
data_women_overall_southeast$V6rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_southeast$V6rank))

# new column 'V6score' based on chars of old 'V6' column
data_women_overall_southeast$V6score <- substr(data_women_overall_southeast$V6, start=3, stop=8)
data_women_overall_southeast$V6score <- substr(data_women_overall_southeast$V6score, start=2, stop=8)
data_women_overall_southeast$V6score <- gsub("\\(", "", paste(data_women_overall_southeast$V6score))
data_women_overall_southeast$V6score <- gsub("\\)", "", paste(data_women_overall_southeast$V6score))
data_women_overall_southeast$V6score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_southeast$V6score))

# new column 'V7rank' based on chars of old 'V7' column
data_women_overall_southeast$V7rank <- substr(data_women_overall_southeast$V7, start=1, stop=3)
data_women_overall_southeast$V7rank <- gsub("\\(", "", paste(data_women_overall_southeast$V7rank))
data_women_overall_southeast$V7rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_southeast$V7rank))

# new column 'V7score' based on chars of old 'V7' column
data_women_overall_southeast$V7score <- substr(data_women_overall_southeast$V7, start=3, stop=10)
data_women_overall_southeast$V7score <- substr(data_women_overall_southeast$V7score, start=2, stop=8)
data_women_overall_southeast$V7score <- gsub("\\(", "", paste(data_women_overall_southeast$V7score))
data_women_overall_southeast$V7score <- gsub("\\)", "", paste(data_women_overall_southeast$V7score))
data_women_overall_southeast$V7score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall_southeast$V7score))

# Remove columns
data_women_overall_southeast <- data_women_overall_southeast[,-c(2:6)]

# New names
names(data_women_overall_southeast)[names(data_women_overall_southeast)=="overall"] <- "overall_rank"
names(data_women_overall_southeast)[names(data_women_overall_southeast)=="points2"] <- "overall_score"

names(data_women_overall_southeast)[names(data_women_overall_southeast)=="V3score"] <- "14_1_score"
names(data_women_overall_southeast)[names(data_women_overall_southeast)=="V4score"] <- "14_2_score"
names(data_women_overall_southeast)[names(data_women_overall_southeast)=="V5score"] <- "14_3_score"
names(data_women_overall_southeast)[names(data_women_overall_southeast)=="V6score"] <- "14_4_score"
names(data_women_overall_southeast)[names(data_women_overall_southeast)=="V7score"] <- "14_5_score"

names(data_women_overall_southeast)[names(data_women_overall_southeast)=="V3rank"] <- "14_1_rank"
names(data_women_overall_southeast)[names(data_women_overall_southeast)=="V4rank"] <- "14_2_rank"
names(data_women_overall_southeast)[names(data_women_overall_southeast)=="V5rank"] <- "14_3_rank"
names(data_women_overall_southeast)[names(data_women_overall_southeast)=="V6rank"] <- "14_4_rank"
names(data_women_overall_southeast)[names(data_women_overall_southeast)=="V7rank"] <- "14_5_rank"

str(data_women_overall_southeast)
data_women_overall_southeast$Athlete <- as.factor(data_women_overall_southeast$Athlete)
data_women_overall_southeast$'overall_rank' <- as.numeric(data_women_overall_southeast$'overall_rank')
data_women_overall_southeast$'overall_score' <- as.numeric(data_women_overall_southeast$'overall_score')
data_women_overall_southeast$'14_1_rank' <- as.numeric(data_women_overall_southeast$'14_1_rank')
data_women_overall_southeast$'14_1_score' <- as.numeric(data_women_overall_southeast$'14_1_score')
data_women_overall_southeast$'14_2_rank' <- as.numeric(data_women_overall_southeast$'14_2_rank')
data_women_overall_southeast$'14_2_score' <- as.numeric(data_women_overall_southeast$'14_2_score')
data_women_overall_southeast$'14_3_rank' <- as.numeric(data_women_overall_southeast$'14_3_rank')
data_women_overall_southeast$'14_3_score' <- as.numeric(data_women_overall_southeast$'14_3_score')
data_women_overall_southeast$'14_4_rank' <- as.numeric(data_women_overall_southeast$'14_4_rank')
data_women_overall_southeast$'14_4_score' <- as.numeric(data_women_overall_southeast$'14_4_score')
data_women_overall_southeast$'14_5_rank' <- as.numeric(data_women_overall_southeast$'14_5_rank')

