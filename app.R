library(shiny)
library(tester)

ui <- fluidPage(
  titlePanel("reactR Input Example"),
  withchildrenInput(
    inputId = "myid",
    default = "",
    attribs = list(),
    children = list(
      unclass(tags$span("I am a child")), # will not handle style but should handle non-object props/attribs
      list( # if we need style we can avoid tags$ and supply list(name=, attribs=, children=)
        name = "span",
        attribs=list(style=list(color="hotpink")),
        children=list("I am another child")
      )
    )
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)
