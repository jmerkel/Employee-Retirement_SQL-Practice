# jmerkel_Module_7
SQL

## Summary
In the upcoming year, there will be a large number of employees retiring. In order to prepare for this situation, the following script outlines some SQL analysis to determine who is retiring, the job titles of the retirees, the count of each job title, and who may be seen as a potential mentor.

### Include ERD
The ERD below shows the relevant tables in the SQL schema. More tables are included in the database, but in this
[ERD of relavent tables](Visuals/schemaChallenge.png)

### \# of Individuals retiring (33,118)
There are 33,118 people retiring this upcoming year.

### /# of individuals available for mentorship role --> 1549
There are currently 1549 people who are potential mentorship candidates. These people are current employees born in 1965.


### /# of Individuals being hired
The amount of people hired has been steadily decreasing, from 14,835 people in 1994 to 1514 in 1999. Using this trend, it would be appropriate to hire approx. 550 people for the upcoming year. However, a loss of senior experience of the magnitude seen, may require an extensive effort to replace the retiring talent. Further investigation and collaboration with each department is necessary to determine if the loss of talent is necessary to be replaced, or if increased productivity year over year determines if that level of personnel is necessary anymore.


## Code & Output
'''
--GENERAL INFO
The Emp_Info table contains information on retiring current employee information (Emp No, First Name, Last Name, Gender, Salary)
'''

### 1 - Number of titles Retiring
[Section1 Code & result](Visuals/Section1.png)

### 2a - Unique Titles
[Section2a Code & result](Visuals/Section2a.png)

### 2b - Title Count
[Section2b Code & result](Visuals/Section2b.png)

### 3 - Mentorship list
[Section3 Code & result](Visuals/Section3.png)


### Recommendation for further analysis
In order to better act on the data, there are a few items that would be good to analyze (excluding other factors). I would review the amount of employees retiring in the next 5 years, as well as the number of hires in the most recent 5 years. I would also analyze the titles in each department to determine the how each department is structured and if they are top-heavy or out of balance. Finally, I would review the salaries to determine when raises are occurring, how much salaries increase, and if those salaries are competitive to help explain why the amount hired is so much lower than the amount retiring.
