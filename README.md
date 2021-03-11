# TheCodingWizards
# TheCodingWizards
![Project Demo](coding_wizards_police.gif)
# Project write up images can be accessed at: https://docs.google.com/document/d/1v3TdWzDUhudVnU4Tlbshv5W9w8xCwpI76zzwTYh8o6c/edit?usp=sharing
Matlab Project Writeup

Introduction

Since 2015, The Washington Post has kept a database recording every fatal shooting in the United States by a police officer in the line of duty. It can be accessed on GitHub at https://github.com/washingtonpost/data-police-shootings. We wanted to use this dataset to explore and understand police shootings quantitatively in MatLab. Amidst national conversations about police violence, we found this research project particularly engaging and relevant. 

Time Spent
Overall, we all spent at least 25 hours (per group member) working on this project. A lot of it was spent figuring out where to start, watching tutorials, and attending office hours. There was also plenty of time spent doing independent research on how to use Excel data in general, as Matlab was unable to conduct functions through a table, giving us the opportunity to learn about text processing through converting our code from a table to a cell, array, etc. In addition, a great deal of time was spent researching how to use the App Designer, as it is a very recent addition to Matlab and not many people are familiar with it. Outside of our scheduled GatherTown meetings, we also scheduled meetings with Professor Serre and some of the TAs, and we worked independently on the sections we had assigned each other when we first proposed the project. 

Research Methodology

Using our knowledge of Matlab, we downloaded these data and performed various forms of analysis to visualize the information, run statistical tests, and create an interface to also educate others about fatal shootings in the United States. None of us had any previous coding experience and we were surprised by how much we were able to implement in just a couple of months of taking CLPS 0950. Specifically, we utilized the following skills in our project:
Downloading data from a public source and uploading it to MatLab
Understanding the format of data and variables from GitHub
Learning how to perform statistical analysis and determining which ones to conduct
Creating easy-to-read informational graphs and visualizations
Performing data analyses and explanations of social phenomena 
Running statistical tests for significance
Creating a GUI

Implementation and Results

To begin our analysis, we downloaded the data set in a csv format from The Washington Post and uploaded it to MatLab. Then, we extracted the following variables:

Variable
Description
date
the date of the fatal shooting in YYYY-MM-DD format
armed
indicates that the victim was armed with some sort of implement that a police officer believed could inflict harm
undetermined: it is not known whether or not the victim had a weapon
unknown: the victim was armed, but it is not known what the object was
unarmed: the victim was not armed
In our analysis, we removed the ‘undetermined’ responses
age
the age of the victim
gender
the gender of the victim. The Post identifies victims by the gender they identify with if reports indicate that it differs from their biological sex.
M: Male
F: Female
None: unknown
race
 
W: White, non-Hispanic
B: Black, non-Hispanic
A: Asian
N: Native American
H: Hispanic
O: Other
None: unknown
city
the municipality where the fatal shooting took place. Note that in some cases this field may contain a county name if a more specific municipality is unavailable or unknown.
state
two-letter postal code abbreviation
mental_illness
indicates whether news reports have indicated the victim had a history of mental health issues, expressed suicidal intentions or was experiencing mental distress at the time of the shooting.
threat_level
indicates whether there was the most direct and immediate threat to life (including incidents where officers or others were shot at, threatened with a gun, attacked with other weapons or physical force, etc.) The attack category is meant to flag the highest level of threat. The other and undetermined categories represent all remaining cases. ‘other’ includes many incidents where officers or others faced significant threats.
flee
flee: News reports have indicated the victim was moving away from officers
Foot
Car
Not fleeing
body_cam
based on news reports, indicates whether an officer was wearing a body camera and it may have recorded some portion of the incident


From there, we chose certain variables (to be mentioned later) to investigate statistical analyses and to learn how to visualize categorical variables. To begin our analysis, we wanted to understand the overall characteristics that lead to these fatalities and police shootings. 

Visualizations

We created several data visualizations with the variables:

Based upon media coverage of police shootings and the Black Lives Matter movement, we recognized the importance of analyzing victims’ race in our dataset. As such, we created two figures: a pie chart that shows the population of the United States segmented by race and a bar graph that shows the disproportionate killing of Black Americans based upon these population percentages. Our source to determine the racial demographics of our country was: https://www.census.gov/quickfacts/fact/table/US/IPE120219. The pie chart illustrates how Whites make up the majority of the United States population and serves as additional reference when looking at the bar chart. 

The bar graph is important because it shows the actual number of victims of each race and the number of victims we expected from the United States racial profile in the pie chart. We calculated the percentages of each race and multiplied it by our sample size. Particularly for Black Americans, there is a disproportionate number of fatalities, when compared to White and Asian Americans. We observe evidence of racial discrimination from this bar chart, directly affecting the Black community.
 






We also wanted to analyze the relationship between whether the victim was ‘fleeing’ and ‘not fleeing.’ We hypothesized that if someone were to flee, there would be a higher likelihood of the individual getting shot. As shown above, Black people can be disproportionately killed by police when compared to other races. (The ‘Other’ variable does not only include white people and all other people of color outside the Black community). The bar graph shows that more people were shot when not fleeing. Further analysis and incorporation of other datasets could give us more insight into this rationale but what we highlight is: the difference between fleeing and not fleeing is larger in ‘Other’ races than in Black people. This could indicate that no matter their status of ‘fleeing’ or ‘not fleeing,’ they could be viewed as a threat and shot regardless.























Another variable we visualized was race and threat level. Again, we compared ‘Other’ races with Black people in order to see the proportional differences. As we expected, more victims were categorized as ‘attacking’ than ‘other.’ There were 944 Black individuals who were ‘attacking’ and 460 who showed some other threat. There were ‘other’ races 2998 were categorized as ‘attacking’ while 1429 showed an ‘other’ threat. These similar ratios show how Black and other races displayed the same percentages, or ratios, of ‘attacks.’ The pie chart below the bar graph shows these ratios of victims who ‘attacked’ versus victims who didn’t, or performed less aggressive actions.




We also visualized the proportion of police officers who wore a body camera versus those who didn’t during these fatal encounters. Using the body_cam variable, we created a pie chart to display that in the majority of cases, police officers did not wear a body camera. For us, this raised the question of whether mandatory body cameras could discourage these killings and also, the accuracy of police reports with body cameras in use.



















Another variable of interest was signs of mental illness in victims. In the pie chart below, we show that the majority of fatalities showed some sign of mental illness. We hypothesized that the officers would shoot those who showed mental instability and the visualization seems to illustrate larger proportions of the mental ill who were killed.



















Finally, we decided to create a map of the locations of all of the police shootings in order to easily identify “hotspots.” Using the longitude and latitude data stored in the dataset, we generated an interactive map of the United States showing the locations of all of the recorded shootings. Dense clusters of red circles show areas where police shootings frequently occur. 



Statistical Analyses

We also employed statistical analyses to determine the significance of relationships between variables. Because our variables were mostly categorical, we used the chi-square test of independence. This method allowed us to determine if there was a significant relationship between two nominal variables. In statistics, there are null and alternative hypotheses, mutually exclusive statements, about a population. Hypothesis testing allowed us to use the data to determine whether to reject our null hypotheses.

Testing the relationship between race and fleeing:
Our null hypothesis was that race was independent of whether a victim had fled from the cops. Our alternate hypothesis was that race was not independent of whether a victim had fled from the cops. We conducted a chi square test and received a test statistic value of 21.6156. This translated into a p-value of less than 0.05. (In statistics, the p-value is the probability of finding the observed, or more extreme, results when the null hypothesis (H0) is true). Because our p-value was less than our pre-chosen significance level of 0.05, we rejected the null hypothesis and concluded that there was an association between the victim’s race and whether they fled from the cops.

Testing the relationship between mental illness and attack:
Our null hypothesis was whether the victim had shown signs of mental illness was independent of whether they attacked the officer. Our alternate hypothesis was whether the victim had shown signs of mental illness was not independent of whether they attacked the officer. We conducted a chi square test and received a test statistic value of 4.8115. This translated into a p-value of less than 0.05. (In statistics, the p-value is the probability of finding the observed, or more extreme, results when the null hypothesis (H0) is true). Because our p-value was less than our pre-chosen significance level of 0.05, we rejected the null hypothesis and concluded that there was an association between whether the victim had shown signs of mental illness and whether they attacked the officer.

Graphic User Interface

In the last part of our project, we implemented a graphic user interface for more accessibility. We wanted to share our visualizations with users without them having to open up the code and run all of the scripts individually, and we decided that the most user-friendly way to do this was to create a GUI using the MATLAB App Designer that displays a graph or chart with the click of a button. This GUI is accessible through the .m file labelled “app_police_brutality_GUI_exported.m” (you will need to run the script to access the GUI). We added a group of radio buttons to the interface which were labelled with a short description of the graph they would display. A demonstration of how to interact with the interface is shown in the Project Demo. 
