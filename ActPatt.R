# average steps by 5 min interval
intervalsteps <- by_day %>% 
        mutate(interval = as.factor(interval)) %>%
        group_by(interval) %>% mutate(date, interval, 
                                      mean = mean(steps, na.rm = T)) %>%
        filter(date == "2012-10-01")

# plot
plot(intervalsteps$interval, intervalsteps$mean, type = "l", xlab = "Interval", 
     ylab = paste("Average Steps per Interval"))
lines(intervalsteps$interval, intervalsteps$mean, type = "l", xlab = "Interval", 
      ylab = paste("Average Steps per Interval"))

#save plot
dev.copy(png, file = "AvgStpIntvl.png")
dev.off()

#  5-minute interval, on average across all the days in the dataset, contains 
#  the maximum number of steps
max_step_int <- intervalsteps[which.max(intervalsteps$mean), 3]
print(max_step_int)