# Bellabeat Capstone Project Analysis
# Author: Akshit
# Date: 25/06/2025

# 📦 Load Libraries
library(tidyverse)
library(lubridate)
library(readr)

# 📂 Load Cleaned Data
activity <- read_csv("cleaned_data/cleaned_daily_activity.csv")
sleep <- read_csv("cleaned_data/cleaned_sleep_day.csv")

# 🧬 Merge datasets
activity_sleep <- inner_join(activity, sleep, by = c("id", "date"))

# 🧮 Summary Stats
summary(activity_sleep)

# 📊 Visualization 1: Steps vs Calories
ggplot(activity_sleep, aes(x = total_steps, y = calories)) +
  geom_point(color = "steelblue") +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Steps vs. Calories Burned", x = "Total Steps", y = "Calories Burned")
ggsave("visualizations/steps_vs_calories.png")

# 📊 Visualization 2: Active Minutes vs Calories
ggplot(activity_sleep, aes(x = very_active_minutes, y = calories)) +
  geom_point(color = "darkgreen") +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Active Minutes vs. Calories", x = "Very Active Minutes", y = "Calories")
ggsave("visualizations/active_minutes_vs_calories.png")

# 📊 Visualization 3: Weekday Activity Distribution
activity_sleep$weekday <- wday(activity_sleep$date, label = TRUE)
ggplot(activity_sleep, aes(x = weekday, y = total_steps)) +
  geom_boxplot(fill = "orchid") +
  labs(title = "Steps by Weekday", x = "Day of the Week", y = "Total Steps")
ggsave("visualizations/weekday_activity_distribution.png")
