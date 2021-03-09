# 02-two-outputs.R
# ~ 01:00:00

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
              label = "Choose how many values per sample:", 
              value = 25, min = 1, max = 1000),
  textInput(inputId = "title", 
            label = "Write a title",
            value = "Histogram"),
  navlistPanel(              
    tabPanel(title = "Normal data",
             plotOutput("norm")
    ),
    tabPanel(title = "Uniform data",
             plotOutput("unif")
    ),
    tabPanel(title = "Chi Squared data",
             plotOutput("chisq")
    )
  )
)

server <- function(input, output) {
  output$norm <- renderPlot({
    hist(rnorm(input$num), breaks = 30, col = "grey", border = "white",
         main = input$title)
  })
  output$unif <- renderPlot({
    hist(runif(input$num), breaks = 30, col = "grey", border = "white",
         main = input$title)
  })
  output$chisq <- renderPlot({
    hist(rchisq(input$num, 2), breaks = 30, col = "grey", border = "white",
         main = input$title)
  })
}

shinyApp(ui = ui, server = server)