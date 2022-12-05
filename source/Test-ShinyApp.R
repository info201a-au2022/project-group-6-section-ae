library(shiny)
library(plotly)


# Sourced file containing the functions for creating the charts
source("bar_graph.R")
source("pie_chart.R")
source("line_graph.R")
source("state_table.R")
source("summary_info.R")

# Shiny app with sidebar layout
ui <- fluidPage(
  tabsetPanel(
    tabPanel("School Type", plotlyOutput("barChart")),
    tabPanel("Area Type", plotOutput("pieChart")),
    tabPanel("Fatalities", plotlyOutput("lineChart")),
    tabPanel("States",tableOutput("stateTable")),
    tabPanel("Summmary",verbatimTextOutput("summaryList")),
  )
)

plotly_barGraph <- ggplotly(bar_graph)

plotly_lineGraph <- ggplotly(fatalitiygraph)

# Server function to generate the plots
server <- function(input, output) {
  output$barChart <- renderPlotly({
    plotly_barGraph
  })
  output$pieChart <- renderPlot({
    pie_chart()
  })
  output$lineChart <- renderPlotly({
    plotly_lineGraph
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
