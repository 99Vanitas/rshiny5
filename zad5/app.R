library(shiny)
library(shinythemes)


ui <- fluidPage(
  theme = shinytheme("superhero"),
  titlePanel("Zadanie 5"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("txtinput", "Wpisz tekst poniżej:"),
      numericInput("nmrinput", "Wybierz numer od 0 do 100:", value=0, min=0, max=100, step=1),
      
      selectInput("letterinput", 
                  label = "Wybierz literę od A do K:",
                  choices = LETTERS[1:11])
    ),
    
    mainPanel(
      h3("Poniżej wpisany tekst, numer i wybrana litera"),
      code(textOutput("txtoutput")),
      br(),
      strong(textOutput("nmroutput")),
      em(textOutput("letteroutput"))
    )
  ))

server <- function(input, output) {
  
  output$txtoutput <- renderText({ 
    paste("Wpisany tekst:", input$txtinput)
  })
  output$nmroutput <- renderText({ 
    paste("Wybrany numer:", input$nmrinput)
  })
  output$letteroutput <- renderText({ 
    paste("Wybrana litera:", input$letterinput )
  })

}

shinyApp(ui = ui, server = server)