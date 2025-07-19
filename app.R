library(shiny)
library(inputtester)
library(phosphoricons)

ui <- fluidPage(
  titlePanel("reactR Input Example"),
  actionButton("updateBtn", label="update input with tag with dependencies"),
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

server <- function(input, output, session) {
  observeEvent(input$updateBtn,{
    if(input$updateBtn %% 2 == 1) {
      # update with phosphoricons to show dependency handling
      updateWithchildrenInput(
        session = session,
        inputId = "myid",
        value = "", # value does not matter for this example
        configuration = list(
          children = list(unclass(phosphoricons::ph_i("house"))) # for now children must be list of lists
        )
      )
    } else {
      # revert back to original
      updateWithchildrenInput(
        session = session,
        inputId = "myid",
        value = "", # value does not matter for this example
        configuration = list(
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
    }

  })
}

shinyApp(ui, server)
