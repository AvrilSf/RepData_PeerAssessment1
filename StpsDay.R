# histogram of daily steps
dailysteps <- by_day %>% summarise(total = sum(steps), mean = mean(steps),
                                   median = median(steps))
hist(dailysteps$total)
dev.copy(png, file = "hist_dailysteps_total.png")
dev.off()

# mean of daily steps
stepsmean <- dailysteps$mean
print(stepsmean)

# median of daily steps
stepsmedian <- dailysteps$median
print(stepsmedian)
