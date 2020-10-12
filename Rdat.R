# read data
fileURL <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
download.file(fileURL, 
              destfile = "./repdata%2Fdata%2Factivity.zip", method = "curl")
unzip("./repdata%2Fdata%2Factivity.zip")
Factivity <- read.csv("./activity.csv", header = T, sep = ",")

# load needed packages
library(dplyr)
library(lubridate)

#process data
by_day <- Factivity %>% mutate(date = as.Date(date, "%Y-%m-%d")) %>%
group_by(date)
by_day$interval <- gsub("00$", ":00:00", by_day$interval)
by_day$interval <- gsub("05$", ":05:00", by_day$interval)
by_day$interval <- gsub("10$", ":10:00", by_day$interval)
by_day$interval <- gsub("^0", "00:00:00", by_day$interval)
by_day$interval <- gsub("15$", ":15:00", by_day$interval)
by_day$interval <- gsub("20$", ":20:00", by_day$interval)
by_day$interval <- gsub("25$", ":25:00", by_day$interval)
by_day$interval <- gsub("30$", ":30:00", by_day$interval)
by_day$interval <- gsub("35$", ":35:00", by_day$interval)
by_day$interval <- gsub("40$", ":40:00", by_day$interval)
by_day$interval <- gsub("45$", ":45:00", by_day$interval)
by_day$interval <- gsub("50$", ":50:00", by_day$interval)
by_day$interval <- gsub("55$", ":55:00", by_day$interval)
by_day$interval <- gsub("5$", "00:05:00", by_day$interval)
by_day$interval <- gsub("^:", "00:", by_day$interval)
by_day$interval <- gsub("^1:", "01:", by_day$interval)
by_day$interval <- gsub("^2:", "02:", by_day$interval)
by_day$interval <- gsub("^3:", "03:", by_day$interval)
by_day$interval <- gsub("^4:", "04:", by_day$interval)
by_day$interval <- gsub("^5:", "05:", by_day$interval)
by_day$interval <- gsub("^6:", "06:", by_day$interval)
by_day$interval <- gsub("^7:", "07:", by_day$interval)
by_day$interval <- gsub("^8:", "08:", by_day$interval)
by_day$interval <- gsub("^9:", "09:", by_day$interval)
