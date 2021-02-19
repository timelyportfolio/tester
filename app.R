library(shiny)
library(tester)

ui <- fluidPage(
  titlePanel("reactR Input Example"),
  withchildrenInput("textInput"),
  textOutput("textOutput")
)

server <- function(input, output, session) {
  output$textOutput <- renderText({
    sprintf("You entered: %s", input$textInput)
  })
}

shinyApp(ui, server)