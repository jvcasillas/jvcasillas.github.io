

library(XML) 

# men overall

url_men_overall <- "http://games.crossfit.com/scores/leaderboard.php?stage=5&sort=0&division=1&region=0&numberperpage=60&page=0&competition=0&frontpage=0&expanded=0&full=1&year=14&showtoggles=0&hidedropdowns=0&showathleteac=1&athletename="
data_men_overall <- readHTMLTable(readLines(url_men_overall), which=1, header=FALSE)


names(data_men_overall) <- gsub("\\n", "", names(data_men_overall)) 
names(data_men_overall) <- gsub(" +", "", names(data_men_overall)) 

data_men_overall[] <- lapply(data_men_overall, function(x) gsub("\\n", "", x)) 

# rename column
names(data_men_overall)[names(data_men_overall)=="V1"] <- "points"
names(data_men_overall)[names(data_men_overall)=="V2"] <- "Athlete"

# Remove 1st row
data_men_overall <- data_men_overall[-1,]

# new 'overall' column based on chars of 'points'
data_men_overall$overall <- substr(data_men_overall$points, start=1, stop=3)
# remove unwanted characters from 'overall'		
data_men_overall$overall <- gsub("\\(", "", paste(data_men_overall$overall))
data_men_overall$overall <- gsub("\\)", "", paste(data_men_overall$overall))
data_men_overall$overall <- gsub(":digit::blank:", "", paste(data_men_overall$overall))

# new 'points2' column based on chars of old 'points' column
data_men_overall$points2 <- substr(data_men_overall$points, start=4, stop=8)
# remove unwanted characters from 'points2'		
data_men_overall$points2 <- gsub("\\(", "", paste(data_men_overall$points2))
data_men_overall$points2 <- gsub("\\)", "", paste(data_men_overall$points2))

# Remove old 'points' column
data_men_overall <- data_men_overall[,-c(1)]


# new column 'V3rank' based on chars of old 'V3' column
data_men_overall$V3rank <- substr(data_men_overall$V3, start=1, stop=3)
data_men_overall$V3rank <- gsub("\\(", "", paste(data_men_overall$V3rank))
data_men_overall$V3rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall$V3rank))

# new column 'V3score' based on chars of old 'V3' column
data_men_overall$V3score <- substr(data_men_overall$V3, start=3, stop=8)
data_men_overall$V3score <- substr(data_men_overall$V3score, start=2, stop=8)
data_men_overall$V3score <- gsub("\\(", "", paste(data_men_overall$V3score))
data_men_overall$V3score <- gsub("\\)", "", paste(data_men_overall$V3score))
data_men_overall$V3score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall$V3score))

# new column 'V4rank' based on chars of old 'V4' column
data_men_overall$V4rank <- substr(data_men_overall$V4, start=1, stop=3)
data_men_overall$V4rank <- gsub("\\(", "", paste(data_men_overall$V4rank))
data_men_overall$V4rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall$V4rank))

# new column 'V4score' based on chars of old 'V4' column
data_men_overall$V4score <- substr(data_men_overall$V4, start=3, stop=8)
data_men_overall$V4score <- substr(data_men_overall$V4score, start=2, stop=8)
data_men_overall$V4score <- gsub("\\(", "", paste(data_men_overall$V4score))
data_men_overall$V4score <- gsub("\\)", "", paste(data_men_overall$V4score))
data_men_overall$V4score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall$V4score))

# new column 'V5rank' based on chars of old 'V5' column
data_men_overall$V5rank <- substr(data_men_overall$V5, start=1, stop=3)
data_men_overall$V5rank <- gsub("\\(", "", paste(data_men_overall$V5rank))
data_men_overall$V5rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall$V5rank))

# new column 'V5score' based on chars of old 'V5' column
data_men_overall$V5score <- substr(data_men_overall$V5, start=3, stop=8)
data_men_overall$V5score <- substr(data_men_overall$V5score, start=2, stop=8)
data_men_overall$V5score <- gsub("\\(", "", paste(data_men_overall$V5score))
data_men_overall$V5score <- gsub("\\)", "", paste(data_men_overall$V5score))
data_men_overall$V5score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall$V5score))

# new column 'V6rank' based on chars of old 'V6' column
data_men_overall$V6rank <- substr(data_men_overall$V6, start=1, stop=3)
data_men_overall$V6rank <- gsub("\\(", "", paste(data_men_overall$V6rank))
data_men_overall$V6rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall$V6rank))

# new column 'V6score' based on chars of old 'V6' column
data_men_overall$V6score <- substr(data_men_overall$V6, start=3, stop=8)
data_men_overall$V6score <- substr(data_men_overall$V6score, start=2, stop=8)
data_men_overall$V6score <- gsub("\\(", "", paste(data_men_overall$V6score))
data_men_overall$V6score <- gsub("\\)", "", paste(data_men_overall$V6score))
data_men_overall$V6score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall$V6score))

# new column 'V7rank' based on chars of old 'V7' column
data_men_overall$V7rank <- substr(data_men_overall$V7, start=1, stop=3)
data_men_overall$V7rank <- gsub("\\(", "", paste(data_men_overall$V7rank))
data_men_overall$V7rank <- gsub("^\\s+|\\s+$", "", paste(data_men_overall$V7rank))

# new column 'V7score' based on chars of old 'V7' column
data_men_overall$V7score <- substr(data_men_overall$V7, start=3, stop=10)
data_men_overall$V7score <- substr(data_men_overall$V7score, start=2, stop=8)
data_men_overall$V7score <- gsub("\\(", "", paste(data_men_overall$V7score))
data_men_overall$V7score <- gsub("\\)", "", paste(data_men_overall$V7score))
data_men_overall$V7score <- gsub("^\\s+|\\s+$", "", paste(data_men_overall$V7score))

# Remove columns
data_men_overall <- data_men_overall[,-c(2:6)]

# New names
names(data_men_overall)[names(data_men_overall)=="overall"] <- "Overall rank"
names(data_men_overall)[names(data_men_overall)=="points2"] <- "Overall score"

names(data_men_overall)[names(data_men_overall)=="V3score"] <- "14.1 score"
names(data_men_overall)[names(data_men_overall)=="V4score"] <- "14.2 score"
names(data_men_overall)[names(data_men_overall)=="V5score"] <- "14.3 score"
names(data_men_overall)[names(data_men_overall)=="V6score"] <- "14.4 score"
names(data_men_overall)[names(data_men_overall)=="V7score"] <- "14.5 score"

names(data_men_overall)[names(data_men_overall)=="V3rank"] <- "14.1 rank"
names(data_men_overall)[names(data_men_overall)=="V4rank"] <- "14.2 rank"
names(data_men_overall)[names(data_men_overall)=="V5rank"] <- "14.3 rank"
names(data_men_overall)[names(data_men_overall)=="V6rank"] <- "14.4 rank"
names(data_men_overall)[names(data_men_overall)=="V7rank"] <- "14.5 rank"

str(data_men_overall)
data_men_overall$Athlete <- as.factor(data_men_overall$Athlete)
data_men_overall$'Overall rank' <- as.numeric(data_men_overall$'Overall rank')
data_men_overall$'Overall score' <- as.numeric(data_men_overall$'Overall score')
data_men_overall$'14.1 rank' <- as.numeric(data_men_overall$'14.1 rank')
data_men_overall$'14.1 score' <- as.numeric(data_men_overall$'14.1 score')
data_men_overall$'14.2 rank' <- as.numeric(data_men_overall$'14.2 rank')
data_men_overall$'14.2 score' <- as.numeric(data_men_overall$'14.2 score')
data_men_overall$'14.3 rank' <- as.numeric(data_men_overall$'14.3 rank')
data_men_overall$'14.3 score' <- as.numeric(data_men_overall$'14.3 score')
data_men_overall$'14.4 rank' <- as.numeric(data_men_overall$'14.4 rank')
data_men_overall$'14.4 score' <- as.numeric(data_men_overall$'14.4 score')
data_men_overall$'14.5 rank' <- as.numeric(data_men_overall$'14.5 rank')




# women

urlwomen <- "http://games.crossfit.com/scores/leaderboard.php?stage=5&sort=0&division=2&region=0&numberperpage=60&page=0&competition=0&frontpage=0&expanded=0&full=1&year=14&showtoggles=0&hidedropdowns=0&showathleteac=1&athletename="
data_women_overall <- readHTMLTable(readLines(urlwomen), which=1, header=FALSE)


names(data_women_overall) <- gsub("\\n", "", names(data_women_overall)) 
names(data_women_overall) <- gsub(" +", "", names(data_women_overall)) 

data_women_overall[] <- lapply(data_women_overall, function(x) gsub("\\n", "", x)) 

# rename column
names(data_women_overall)[names(data_women_overall)=="V1"] <- "points"
names(data_women_overall)[names(data_women_overall)=="V2"] <- "Athlete"

# Remove 1st row
data_women_overall <- data_women_overall[-1,]

# new 'overall' column based on chars of 'points'
data_women_overall$overall <- substr(data_women_overall$points, start=1, stop=3)
# remove unwanted characters from 'overall'		
data_women_overall$overall <- gsub("\\(", "", paste(data_women_overall$overall))
data_women_overall$overall <- gsub("\\)", "", paste(data_women_overall$overall))
data_women_overall$overall <- gsub(":digit::blank:", "", paste(data_women_overall$overall))

# new 'points2' column based on chars of old 'points' column
data_women_overall$points2 <- substr(data_women_overall$points, start=4, stop=8)
# remove unwanted characters from 'points2'		
data_women_overall$points2 <- gsub("\\(", "", paste(data_women_overall$points2))
data_women_overall$points2 <- gsub("\\)", "", paste(data_women_overall$points2))

# Remove old 'points' column
data_women_overall <- data_women_overall[,-c(1)]


# new column 'V3rank' based on chars of old 'V3' column
data_women_overall$V3rank <- substr(data_women_overall$V3, start=1, stop=3)
data_women_overall$V3rank <- gsub("\\(", "", paste(data_women_overall$V3rank))
data_women_overall$V3rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall$V3rank))

# new column 'V3score' based on chars of old 'V3' column
data_women_overall$V3score <- substr(data_women_overall$V3, start=3, stop=8)
data_women_overall$V3score <- substr(data_women_overall$V3score, start=2, stop=8)
data_women_overall$V3score <- gsub("\\(", "", paste(data_women_overall$V3score))
data_women_overall$V3score <- gsub("\\)", "", paste(data_women_overall$V3score))
data_women_overall$V3score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall$V3score))

# new column 'V4rank' based on chars of old 'V4' column
data_women_overall$V4rank <- substr(data_women_overall$V4, start=1, stop=3)
data_women_overall$V4rank <- gsub("\\(", "", paste(data_women_overall$V4rank))
data_women_overall$V4rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall$V4rank))

# new column 'V4score' based on chars of old 'V4' column
data_women_overall$V4score <- substr(data_women_overall$V4, start=3, stop=8)
data_women_overall$V4score <- substr(data_women_overall$V4score, start=2, stop=8)
data_women_overall$V4score <- gsub("\\(", "", paste(data_women_overall$V4score))
data_women_overall$V4score <- gsub("\\)", "", paste(data_women_overall$V4score))
data_women_overall$V4score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall$V4score))

# new column 'V5rank' based on chars of old 'V5' column
data_women_overall$V5rank <- substr(data_women_overall$V5, start=1, stop=3)
data_women_overall$V5rank <- gsub("\\(", "", paste(data_women_overall$V5rank))
data_women_overall$V5rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall$V5rank))

# new column 'V5score' based on chars of old 'V5' column
data_women_overall$V5score <- substr(data_women_overall$V5, start=3, stop=8)
data_women_overall$V5score <- substr(data_women_overall$V5score, start=2, stop=8)
data_women_overall$V5score <- gsub("\\(", "", paste(data_women_overall$V5score))
data_women_overall$V5score <- gsub("\\)", "", paste(data_women_overall$V5score))
data_women_overall$V5score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall$V5score))

# new column 'V6rank' based on chars of old 'V6' column
data_women_overall$V6rank <- substr(data_women_overall$V6, start=1, stop=3)
data_women_overall$V6rank <- gsub("\\(", "", paste(data_women_overall$V6rank))
data_women_overall$V6rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall$V6rank))

# new column 'V6score' based on chars of old 'V6' column
data_women_overall$V6score <- substr(data_women_overall$V6, start=3, stop=8)
data_women_overall$V6score <- substr(data_women_overall$V6score, start=2, stop=8)
data_women_overall$V6score <- gsub("\\(", "", paste(data_women_overall$V6score))
data_women_overall$V6score <- gsub("\\)", "", paste(data_women_overall$V6score))
data_women_overall$V6score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall$V6score))

# new column 'V7rank' based on chars of old 'V7' column
data_women_overall$V7rank <- substr(data_women_overall$V7, start=1, stop=3)
data_women_overall$V7rank <- gsub("\\(", "", paste(data_women_overall$V7rank))
data_women_overall$V7rank <- gsub("^\\s+|\\s+$", "", paste(data_women_overall$V7rank))

# new column 'V7score' based on chars of old 'V7' column
data_women_overall$V7score <- substr(data_women_overall$V7, start=3, stop=10)
data_women_overall$V7score <- substr(data_women_overall$V7score, start=2, stop=8)
data_women_overall$V7score <- gsub("\\(", "", paste(data_women_overall$V7score))
data_women_overall$V7score <- gsub("\\)", "", paste(data_women_overall$V7score))
data_women_overall$V7score <- gsub("^\\s+|\\s+$", "", paste(data_women_overall$V7score))

# Remove columns
data_women_overall <- data_women_overall[,-c(2:6)]

# New names
names(data_women_overall)[names(data_women_overall)=="overall"] <- "Overall rank"
names(data_women_overall)[names(data_women_overall)=="points2"] <- "Overall score"

names(data_women_overall)[names(data_women_overall)=="V3score"] <- "14.1 score"
names(data_women_overall)[names(data_women_overall)=="V4score"] <- "14.2 score"
names(data_women_overall)[names(data_women_overall)=="V5score"] <- "14.3 score"
names(data_women_overall)[names(data_women_overall)=="V6score"] <- "14.4 score"
names(data_women_overall)[names(data_women_overall)=="V7score"] <- "14.5 score"

names(data_women_overall)[names(data_women_overall)=="V3rank"] <- "14.1 rank"
names(data_women_overall)[names(data_women_overall)=="V4rank"] <- "14.2 rank"
names(data_women_overall)[names(data_women_overall)=="V5rank"] <- "14.3 rank"
names(data_women_overall)[names(data_women_overall)=="V6rank"] <- "14.4 rank"
names(data_women_overall)[names(data_women_overall)=="V7rank"] <- "14.5 rank"

str(data_women_overall)
data_women_overall$Athlete <- as.factor(data_women_overall$Athlete)
data_women_overall$'Overall rank' <- as.numeric(data_women_overall$'Overall rank')
data_women_overall$'Overall score' <- as.numeric(data_women_overall$'Overall score')
data_women_overall$'14.1 rank' <- as.numeric(data_women_overall$'14.1 rank')
data_women_overall$'14.1 score' <- as.numeric(data_women_overall$'14.1 score')
data_women_overall$'14.2 rank' <- as.numeric(data_women_overall$'14.2 rank')
data_women_overall$'14.2 score' <- as.numeric(data_women_overall$'14.2 score')
data_women_overall$'14.3 rank' <- as.numeric(data_women_overall$'14.3 rank')
data_women_overall$'14.3 score' <- as.numeric(data_women_overall$'14.3 score')
data_women_overall$'14.4 rank' <- as.numeric(data_women_overall$'14.4 rank')
data_women_overall$'14.4 score' <- as.numeric(data_women_overall$'14.4 score')
data_women_overall$'14.5 rank' <- as.numeric(data_women_overall$'14.5 rank')






str(data_women_overall) 
head(data_women_overall)
