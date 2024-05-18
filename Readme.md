# Introduction
📊 This project involves analyzing a database of airline quality ratings. The database consists of two tables: `passenger_info` and `flight_experience`. The goal is to perform various SQL queries to gain insights into passenger satisfaction and flight experiences.

🔍 SQL queries? Check them out here: [SQL project folder](/sql_project/)

# Background
The `passenger_info` table contains demographic information about passengers, while the `flight_experience` table contains ratings for different aspects of the flight experience. The ratings are on a scale of 1 to 5, and the satisfaction column indicates whether the passenger was satisfied or dissatisfied/neutral.

### The insights I wanted to get through my SQL queries were:
1. the number of passengers by class
2. the highest Average Satisfaction Rating by class
3. the satisfaction/dissatisfaction count for each type of flight travel
4. Number of passengers by each age group
5. Number of Passengers Who Rated Cleanliness as 5/5
6. the average departure delay associated with each type of travel
7. calculating the percentage of flights where passengers are satisfied with cleanliness, rated as 5
8. calculating the median, lower quartile, and upper quartile satisfaction ratings for passengers 
grouped by age group and gender
9. identifying the flights with the longest distance for each class
10. retrieving flights that experienced both departure and arrival delays
11. identifying flights with departure delays greater than the average delay for their respective class.
12. the percentage of flights that had a departure delay and resulted in satisfied passengers.
13. the percentage of satisfied passengers for each class
14. the satisfaction rate for passengers who experienced departure delays vs. those who didn't

# Tools I Used
- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
The analysis involved writing advanced SQL queries to get the insights above. The results provided insights into flight delays, passenger satisfaction, and the quality of various services provided during the flight etc...

# What I Learned
Through this project, I learned how to:

- 🧩 Write advanced SQL queries involving window functions, common table expressions (CTEs), and conditional aggregation.
- 💡 Analyze and interpret data to answer specific business questions.
- 📊 Calculate statistical measures like medians and quartiles using SQL.

# Conclusions and Insights
The analysis provided several insights:

A significant percentage of satisfied passengers rated cleanliness with a perfect score.
Identifying flights with both departure and arrival delays helps in understanding the consistency of delays.
The flight with the longest distance varies across different classes, showing a range in service offerings.
Grouping satisfaction by age and gender reveals demographic trends in passenger satisfaction.

# Closing Thoughts

This project demonstrates the power of SQL in extracting valuable insights from complex datasets. By analyzing airline quality ratings, we can better understand passenger satisfaction and areas needing improvement. Future work could include more detailed statistical analysis and predictive modeling to further enhance our understanding.