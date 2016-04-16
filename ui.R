library(shiny)

# Define UI for application that plots random distributions 
shinyUI(
  pageWithSidebar(
  
    # Application title
    headerPanel("Censo SUAS 2015 - CRAS"),
  
    # Sidebar with a slider input for number of observations
    sidebarPanel(
      h1("Filter"),
      selectInput("uf", "Brazilian State:",
                  c('BR',
                    'AC',                                                                                                                                                                                           
                    'AL',                                                                                                                                                                                           
                    'AM',                                                                                                                                                                                           
                    'AP',                                                                                                                                                                                           
                    'BA',                                                                                                                                                                                           
                    'CE',                                                                                                                                                                                           
                    'DF',                                                                                                                                                                                           
                    'ES',                                                                                                                                                                                           
                    'GO',                                                                                                                                                                                           
                    'MA',                                                                                                                                                                                           
                    'MG',                                                                                                                                                                                           
                    'MS',                                                                                                                                                                                           
                    'MT',                                                                                                                                                                                           
                    'RO',                                                                                                                                                                                           
                    'PA',                                                                                                                                                                                           
                    'PB',                                                                                                                                                                                           
                    'PE',                                                                                                                                                                                           
                    'PI',                                                                                                                                                                                           
                    'PR',                                                                                                                                                                                           
                    'RJ',                                                                                                                                                                                           
                    'RN',                                                                                                                                                                                           
                    'RO',                                                                                                                                                                                           
                    'RR',                                                                                                                                                                                           
                    'RS',                                                                                                                                                                                           
                    'SC',                                                                                                                                                                                           
                    'SE',                                                                                                                                                                                           
                    'SP',                                                                                                                                                                                           
                    'TO')),
      
      checkboxGroupInput("porte", "City Size:",
                         c("Small I" = "Pequeno I",
                           "Small II" = "Pequeno II",
                           "Medium" = "Médio",
                           "Large" = "Grande",
                           "Metropolis" = "Metrópole")
                         )
    ),
    
  
    # Show a plot of the generated distribution
    mainPanel(
      #plotOutput("distPlot")
      h4("You entered for state:"),
      verbatimTextOutput("uf"),
      h4("You entered for city size:"),
      verbatimTextOutput("porte"),
      plotOutput("scatterPlot")
    )
  )
)
