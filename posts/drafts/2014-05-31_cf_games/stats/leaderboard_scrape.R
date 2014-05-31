

library(XML) 

# men

urlmen <- "http://games.crossfit.com/scores/leaderboard.php?stage=5&sort=0&division=1&region=0&numberperpage=60&page=0&competition=0&frontpage=0&expanded=0&full=1&year=14&showtoggles=0&hidedropdowns=0&showathleteac=1&athletename="
data_men <- readHTMLTable(readLines(urlmen), which=1, header=FALSE)


names(data_men) <- gsub("\\n", "", names(data_men)) 
names(data_men) <- gsub(" +", "", names(data_men)) 

data_men[] <- lapply(data_men, function(x) gsub("\\n", "", x)) 

# rename column
names(data_men)[names(data_men)=="V1"] <- "points"
names(data_men)[names(data_men)=="V2"] <- "Athlete"

# Remove 1st row
data_men <- data_men[-1,]

# new 'overall' column based on chars of 'points'
data_men$overall <- substr(data_men$points, start=1, stop=3)
# remove unwanted characters from 'overall'		
data_men$overall <- gsub("\\(", "", paste(data_men$overall))
data_men$overall <- gsub("\\)", "", paste(data_men$overall))
data_men$overall <- gsub(":digit::blank:", "", paste(data_men$overall))

# new 'points2' column based on chars of old 'points' column
data_men$points2 <- substr(data_men$points, start=4, stop=8)
# remove unwanted characters from 'points2'		
data_men$points2 <- gsub("\\(", "", paste(data_men$points2))
data_men$points2 <- gsub("\\)", "", paste(data_men$points2))

# Remove old 'points' column
data_men <- data_men[,-c(1)]


# new column 'V3rank' based on chars of old 'V3' column
data_men$V3rank <- substr(data_men$V3, start=1, stop=3)
data_men$V3rank <- gsub("\\(", "", paste(data_men$V3rank))
data_men$V3rank <- gsub("^\\s+|\\s+$", "", paste(data_men$V3rank))

# new column 'V3score' based on chars of old 'V3' column
data_men$V3score <- substr(data_men$V3, start=3, stop=8)
data_men$V3score <- substr(data_men$V3score, start=2, stop=8)
data_men$V3score <- gsub("\\(", "", paste(data_men$V3score))
data_men$V3score <- gsub("\\)", "", paste(data_men$V3score))
data_men$V3score <- gsub("^\\s+|\\s+$", "", paste(data_men$V3score))

# new column 'V4rank' based on chars of old 'V4' column
data_men$V4rank <- substr(data_men$V4, start=1, stop=3)
data_men$V4rank <- gsub("\\(", "", paste(data_men$V4rank))
data_men$V4rank <- gsub("^\\s+|\\s+$", "", paste(data_men$V4rank))

# new column 'V4score' based on chars of old 'V4' column
data_men$V4score <- substr(data_men$V4, start=3, stop=8)
data_men$V4score <- substr(data_men$V4score, start=2, stop=8)
data_men$V4score <- gsub("\\(", "", paste(data_men$V4score))
data_men$V4score <- gsub("\\)", "", paste(data_men$V4score))
data_men$V4score <- gsub("^\\s+|\\s+$", "", paste(data_men$V4score))

# new column 'V5rank' based on chars of old 'V5' column
data_men$V5rank <- substr(data_men$V5, start=1, stop=3)
data_men$V5rank <- gsub("\\(", "", paste(data_men$V5rank))
data_men$V5rank <- gsub("^\\s+|\\s+$", "", paste(data_men$V5rank))

# new column 'V5score' based on chars of old 'V5' column
data_men$V5score <- substr(data_men$V5, start=3, stop=8)
data_men$V5score <- substr(data_men$V5score, start=2, stop=8)
data_men$V5score <- gsub("\\(", "", paste(data_men$V5score))
data_men$V5score <- gsub("\\)", "", paste(data_men$V5score))
data_men$V5score <- gsub("^\\s+|\\s+$", "", paste(data_men$V5score))

# new column 'V6rank' based on chars of old 'V6' column
data_men$V6rank <- substr(data_men$V6, start=1, stop=3)
data_men$V6rank <- gsub("\\(", "", paste(data_men$V6rank))
data_men$V6rank <- gsub("^\\s+|\\s+$", "", paste(data_men$V6rank))

# new column 'V6score' based on chars of old 'V6' column
data_men$V6score <- substr(data_men$V6, start=3, stop=8)
data_men$V6score <- substr(data_men$V6score, start=2, stop=8)
data_men$V6score <- gsub("\\(", "", paste(data_men$V6score))
data_men$V6score <- gsub("\\)", "", paste(data_men$V6score))
data_men$V6score <- gsub("^\\s+|\\s+$", "", paste(data_men$V6score))

# new column 'V7rank' based on chars of old 'V7' column
data_men$V7rank <- substr(data_men$V7, start=1, stop=3)
data_men$V7rank <- gsub("\\(", "", paste(data_men$V7rank))
data_men$V7rank <- gsub("^\\s+|\\s+$", "", paste(data_men$V7rank))

# new column 'V7score' based on chars of old 'V7' column
data_men$V7score <- substr(data_men$V7, start=3, stop=10)
data_men$V7score <- substr(data_men$V7score, start=2, stop=8)
data_men$V7score <- gsub("\\(", "", paste(data_men$V7score))
data_men$V7score <- gsub("\\)", "", paste(data_men$V7score))
data_men$V7score <- gsub("^\\s+|\\s+$", "", paste(data_men$V7score))

# Remove columns
data_men <- data_men[,-c(2:6)]

names(data_men)[names(data_men)=="overall"] <- "Overall rank"
names(data_men)[names(data_men)=="points2"] <- "Overall score"

names(data_men)[names(data_men)=="V3score"] <- "14.1 score"
names(data_men)[names(data_men)=="V4score"] <- "14.2 score"
names(data_men)[names(data_men)=="V5score"] <- "14.3 score"
names(data_men)[names(data_men)=="V6score"] <- "14.4 score"
names(data_men)[names(data_men)=="V7score"] <- "14.5 score"

names(data_men)[names(data_men)=="V3rank"] <- "14.1 rank"
names(data_men)[names(data_men)=="V4rank"] <- "14.2 rank"
names(data_men)[names(data_men)=="V5rank"] <- "14.3 rank"
names(data_men)[names(data_men)=="V6rank"] <- "14.4 rank"
names(data_men)[names(data_men)=="V7rank"] <- "14.5 rank"








# women

urlwomen <- "http://games.crossfit.com/scores/leaderboard.php?stage=5&sort=0&division=2&region=0&numberperpage=60&page=0&competition=0&frontpage=0&expanded=0&full=1&year=14&showtoggles=0&hidedropdowns=0&showathleteac=1&athletename="
data_women <- readHTMLTable(readLines(urlwomen), which=1, header=FALSE)


names(data_women) <- gsub("\\n", "", names(data_women)) 
names(data_women) <- gsub(" +", "", names(data_women)) 

data_women[] <- lapply(data_women, function(x) gsub("\\n", "", x)) 

str(data_women) 
head(data_women)
