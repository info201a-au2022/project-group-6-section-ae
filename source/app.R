library(shiny)
library(plotly)


# Sourced file containing the functions for creating the charts
source("bar_graph.R")
source("pie_chart.R")
source("line_graph.R")
source("state_table.R")
source("summary_info.R")
#library("rsconnect")

# Introduction Page
introPage <- tabPanel(
  "Introduction",
  img(src = "www/ss1 1.46.46 AM.jpg", align = "center", alt = "School Shootings information image"),
  p("\nSchool shootings are one of the biggest and saddest social and cultural issues plaguing the US today. Everyday, approximately 12 children die due to gun violence and another 32 are shot and injured. Through our project we aimed to answer some questions like what area types saw more school shootings and what type of educational institutions is more prone to be a victim of a school shooting. Our dataset had a record of every school shooting that tragedized this country from 1990 till 2022. Using our DPLYR skills, we were able to come up with some answers!"),
)

# Summary takeaways page
summaryPage <- tabPanel(
  "Summary Takeaways",
  tableOutput("stateTable"),
  p("This summary file holds five important data points that relate to our data set about school shootings in the United States between 1990 and 2022. Total shootings, area type with the most shootings, type of school with the most shootings, state with the highest number of shootings and the highest fatalities in one shooting were all measured in this summary. As seen there were a total of 754 school shootings between 1990 and 2022. There were also the highest number of shootings in urban locations compared to rural and suburban areas. High schools had the highest number of shootings as well. The state with the most shootings was California and the highest number of fatalities in one shooting between 1990 and 2022 was 33.")
)

barPage <- tabPanel(
  "School Type",
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("schoolType", "School Type:", 
                  choices=shooting_count_table$School,),
                  #multiple = TRUE),
      hr(),
      helpText("Choose your area type")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotlyOutput("barChart") ,
      p("This bar graph displays the number of shootings based on the types of school. It categorizes school into 4 categories which are college, high school, middle school, and elementary school. High schools have the most shootings at 438 shootings since 1990, colleges had 152 shootings, middle schools have had 94 shootings, and elementary schools have had 57 shootings.")
    )
  )
)

piePage <- tabPanel(
  "Area Type",
  sidebarPanel(
    selectInput("graphType", "Select type of graph:",
                choices = c("Bar graph", "Pie chart"),
                selected = "Pie chart")
  ),
  mainPanel(
    plotlyOutput("pieChart"),
    p("This pie chart shows the number of shootings in different area types across the United States. As seen by the chart, urban areas had the most shootings, followed by suburban areas, followed by rural areas. The number of shootings between 1990 and today in urban areas was 256, 102 in suburban areas, and 23 in rural areas.")
  )
)

linePage <- tabPanel(
  "Fatalities",
  sidebarPanel(
    sliderInput("slider2", label = h3("Select year interval:"), min = 1990, 
                max = 2022, value = c(1990, 2022))
  ),
  mainPanel(
    plotlyOutput("lineChart"),
    p("This line graph shows shootings in the United States since 1990 based on the date. As seen, there were 0 shootings in 1990, but after that they kept increasing for most part. Between 1995 and 2005, the number of school shootings were relatively low and between 2006 and 2014 they were high. The data shows two high spikes in school shootings in 2007 and 2012 and also shows that shootings are slowly increasing today.")
  )
)

# Shiny app with sidebar layout
ui <- fluidPage(
  "School Shootings",
  tags$head(
    # Note the wrapping of the string in HTML()
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=Yusei+Magic&display=swap');
      body {
        background-color: black;
        color: white;
      }
      p {
        font-family: 'Courier New', monospace;
      }
      h1 {
        font-family: 'Times New Roman', serif;
      }
      h2 {
        font-family: 'Times New Roman', serif;
      }
      h3 {
        font-family: 'Times New Roman', serif;
      }
      h4 {
        font-family: 'Times New Roman', serif;
      }
      .shiny-input-container {
        color: #474747;
      }"))
  ),
  tabsetPanel(
    introPage,
    barPage,
    piePage,
    linePage,
    tabPanel("Summary Takeaways",verbatimTextOutput("summaryList"), p("This summary file holds five important data points that relate to our data set about school shootings in the United States between 1990 and 2022. Total shootings, area type with the most shootings, type of school with the most shootings, state with the highest number of shootings and the highest fatalities in one shooting were all measured in this summary. As seen there were a total of 754 school shootings between 1990 and 2022. There were also the highest number of shootings in urban locations compared to rural and suburban areas. High schools had the highest number of shootings as well. The state with the most shootings was California and the highest number of fatalities in one shooting between 1990 and 2022 was 33.")),
    tabPanel("Final Report", includeMarkdown("p01-proposal.md"))
  )
)

plotly_pieChart <- plot_ly(type = 'pie', labels = c("Urban","Suburban","Rural"), values = vec_areatype,
                           textinfo = 'label+percent',
                           insidetextorientation = 'radial',
                           title = "Shootings Based On Area")

# Server function to generate the plots
server <- function(input, output) {
  output$barChart <- renderPlotly({
    ggplotly(ggplot(shooting_count_table %>%
                      filter(School == input$schoolType), 
                    aes(x=School, y=Number_of_Shootings)) + 
               geom_bar(stat = "identity", color="black", fill = "red") +
               labs(x = "School", y = "Number of Shootings", title = "Shootings Based on School Type"))
  })
  output$pieChart <- renderPlotly({
    if(input$graphType == "Pie chart"){
      plotly_pieChart
    } else {
    labels = c("Urban","Suburban","Rural")
    bar_df <- data.frame(labels, vec_areatype)
      ggplotly(ggplot(bar_df, 
                      aes(x=labels, y=vec_areatype)) + 
                 geom_bar(stat = "identity", color="black", fill = "red") +
                 labs(x = "Area Type", y = "Number of Shootings", title = "Shootings Based on Area Type"))
    }
    })
  
  output$lineChart <- renderPlotly({
    ggplot(line_df <- deathtable %>%
             filter(xValue >= input$slider2[1]) %>%
             filter(xValue <= input$slider2[2]),
           aes(x=xValue, y=yValue))+
      geom_line(color="#FF0000", size=1, alpha=0.9, linetype=2, group = 1) +
      theme_ipsum() +
      ggtitle("Fatalities due to School Shootings") + xlab("Year") + ylab("Ammount of Fatalities")+
      scale_x_discrete(breaks = line_df$xValue[seq(1, length(deathtable$xValue), by=5)])
  })
  output$stateTable <- renderTable({
    state_table
  })
  output$summaryList <- renderPrint({
    summary_info
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
