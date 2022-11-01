# School Shootings as of 2022

## Code-Name: ss1990-current

### Autumn 2022

###### INFO-201: Technical Foundations of Informatics

###### The Information School

###### University of Washington


### Authors:

Simranjit Singh - singh718@uw.edu

Ashwin Subramanian - ashsubr@uw.edu

Rishita Gattam Reddy - rreddy3@uw.edu

## Abstract:

Our main goal in this project is to study the demographics of school shootings because, they are becoming more **relevant** and **common** in todays society. Although there are many articles, news stories, and protests that have brought attention to this issue our society still _can't decide on solutions_. With this data analysis (children dying is data now...) we hope to show how a critical look of the statistics can ***provide sensible and efficient approaches to this problem.***

### Keywords:

  - Teenager safety
  - Emotional wellbeing
  - Gun violence
  - U.S. Schooling



## Introduction

School shootings are something we hear a lot about in the news and experience. Every single day, around 12 children die from gun violence in america, and another 32 are shot and injured. There have been ~1000 school shootings in the US since 2012’s Sandy Hook tragedy and around 150 incidents in 2022. We have chosen to research the school shootings that have taken place since 1990 and answer some questions that hold relevance in today’s society. We work with a dataset we found on Kaggle (https://www.kaggle.com/code/sahebategally/analysis-of-school-shootings-in-the-u-s) that gives us a csv file. Wrangling the data to find answers to problems that have real world implications is our main goal from this project.


### Problem Domain

Our topic is about school shootings across the US which have happened since 1990. As we know, school shootings have increased over the last few years becoming a huge negative impact on students, families, and school staff. Our project is primarily about school shootings and all their impacts.

#### Direct and Indirect Stakeholders :chart:

The biggest stakeholders in school shootings would be students, teachers and staff. This could have a huge impact on them both mentally and physically and will continue to impact them negatively for the rest of their lives. Along with victims themselves, their families are also direct stakeholders in the situation. An indirect stakeholder could be real estate in the area. Knowing a school shooting has happened in the area could significantly drop housing prices which would have a long-term effect on the community itself. Looking at the bigger picture though, all people are indirect stakeholders because everyone feels frightened after school shootings and hopes for the safety of their own loved ones.

#### Human Values :dollar:

When a new school shooting happens, and is put out in the news, everyone has the same question, why did the shooter decide to shoot up a school? This has to do with basic human values. Since 1990, there have been over 320,000 school shootings, which means over 320,000 people who thought it was ok to shoot up a school. Out of those 320,000, the majority of them did not realize their mistakes even after being caught, but all the involved students and families did. When we think about human values, we know that shooting anyone is wrong, so why is it happening so often?

#### Benefits and Harm :thumbsup: :thumbsdown:

If interventions were taken to prevent future school shootings, many of the direct stakeholders would benefit from it. The direct stakeholders include students, their families, school staff, and many other individuals. Knowing that something was being done to prevent even more school shootings would keep these people at rest. Along with these stakeholders, parents who are worried about their own kids being involved in a school shooting will also benefit knowing that they are being prevented.

A potential harm that could be done due to interventions taking place could involve the economy and different communities. When people find out that interventions are taking place due to school shootings in the area, house prices will increase, but at the same time, fewer people will be able to move into the area. More safety in an area would also make other areas even more dangerous/targeted.

> References cited at the end

### Research Questions :question:

- What areas are more prone to school shootings?

 - The dataset records what area (Urban, suburban or rural) the school shooting took place in. Knowing the answers and some statistics to this question could have implications on the distribution of the economy in a state or place.


- What type of institutions experience more incidents of school shootings?

 - Knowing the answers to this would narrow down other areas like what age groups of students are more likely to turn into school shooters, and what age groups of students are more prone to be targets and what are the reasons for that.


- What are the most common reasons for these incidents to occur?
  - We can analyze the descriptions and wrangle the data to find out why these shootings are occurring. For example, if the description contains the words “bullying” or “racial slurs” they will get counted in a category and give us an overall picture.

## Dataset

The dataset we've chosen in this project is in direct correlation of our problem and our research questions. In the data files we have the information available for, the types of schools, the states, the description or reasons for the shootings and also counts of victims (fatalities and injuries). We also have access to the source of where these data points were found from, so we can track down the specifics if need be.

| Data File Names | Number of Observations | Number of Variables |
| :-------------  | :------------- | :------------- |
| README.md       | N/A            | N/A            |
| cps_01_formatted.CSV | 69        | 18             |
| pah_wikp_combo.CSV   | 755       | 10             |

### Main Link for the Data Files:

https://www.kaggle.com/datasets/ecodan/school-shootings-us-1990present

#### READM.md Link:

https://www.kaggle.com/datasets/ecodan/school-shootings-us-1990present?select=README.md

####  cps_01_formatted.CSV Link:

https://www.kaggle.com/datasets/ecodan/school-shootings-us-1990present?select=cps_01_formatted.csv

####  pah_wikp_combo.CSV Link:

https://www.kaggle.com/datasets/ecodan/school-shootings-us-1990present?select=pah_wikp_combo.csv


### Who

Who collected the data? When? For what purpose?

 - Dan Cripe collected this data a few years ago, when he decided to understand better about school shootings but could not find one place for all the data.

### Data Collections

How was the data collection effort funded? Who is likely to benefit from the data or make money?

 - Dan did not get funded for this project. He used Wikipedia and another study by data scientists at Northwestern University.

### Data Validation

How was the data validated and held secure?

- Is it credible and trustworthy?- Yes, the data is from a credible source because what Dan did was simply compile the data from both Wiki and the Pah/Amaral/Hagan research.

### Source

How did you obtain the data? Do you credit the source of the data?

- Searching on kaggle for “School shootings” helped us find this dataset. The link has been included in the introduction and above in this section.


### Implications

#1:

The study of this dataset could give us a picture about the reasons, and other factors that come into play for the increase in the number of school shootings, in recent years. Finding solutions to these problems would be the next step to take.

#2:

Policy makers and authorities at institutions could take some steps to try curbing these rates of school shootings by just ensuring that students feel safe and happy.


### Limitations

#1:

Although we have access to the descriptions on the school shootings, we can't just assume that the analysis is completely accurate as to why they happen. Racial factors and cultural differences may be present but, the psychological makeup as well as the upbringing of people can greatly affect them. In these data sets we don't have this very important and valuable information so we can't assume that all cases are "this way" or every school shooter is because of "this".

#2:

Another limitation is with the data itself. We have multiple types of information for all the various variables but we don't have data regarding how the shooters sourced their guns or what kinds of guns. If we had this data as well, we could make conclusions on what types of guns (ARs, handguns, shotguns, etc.) are easier to obtain. If we knew the source as well, we could use it to determine factors on lack of parental supervision, neglect of firearm safety, and even where to focus in terms of access/sourcing.

#### References:  

- Refer above for URL links to the data files

- History of School Shootings in the United States | K12 Academics. www.k12academics.com/school-shootings/history-school-shootings-united-states. Accessed 31 Oct. 2022.

- “United States School Shootings and Firearm Incidents, 1990-present.” Ballotpedia, ballotpedia.org/United_States_school_shootings_and_firearm_incidents,_1990-present. Accessed 31 Oct. 2022.

- “School Shootings This Year: How Many and Where.” Education Week, 31 Oct. 2022, www.edweek.org/leadership/school-shootings-this-year-how-many-and-where/2022/01.
