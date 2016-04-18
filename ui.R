library(shiny)

# Define UI for application that plots random distributions 
shinyUI(
  pageWithSidebar(
  
    # Application title
    headerPanel("Censo SUAS 2015 - CRAS"),
  
    # Sidebar with a slider input for number of observations
    sidebarPanel(
      h5("This application shows a graph that has on y-axis the number of families that were assisted by a CRAS (Social Assistance Reference Center) and on x-axis the number of workers of that CRAS."),
      h5("There is two kinds of filters that you can use. On the first filter you select the state you want to see on the plot and the second filter you can choose the size of the cities which the CRAS are located."),
      h5("The graph shows two red lines on the means of y-axis and x-axis. And each size of city has a line that show the linear regression of points plotted."),
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
