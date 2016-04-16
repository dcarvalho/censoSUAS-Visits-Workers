library(shiny)
library(car)

data<-read.csv2(file="data/CensoSUAS_2015_CRAS_dadosgerais_divulgacao_subset.csv",fileEncoding = "ISO-8859-1")
data<-data[,c( "UF", "Município", "Porte_pop2010", "nu_trabalhadores", "q14_1")]

# Define server logic required to subset the data and plot a scatterplot of Visits ~ Workers
shinyServer(
  function(input, output) {
    output$uf <- renderPrint({input$uf})
    output$porte <- renderPrint({input$porte})    
    
    
    # Expression that generates a plot of the distribution. The expression
    # is wrapped in a call to renderPlot to indicate that:
    #
    #  1) It is "reactive" and therefore should be automatically 
    #     re-executed when inputs change
    #  2) Its output type is a plot 
    #
  output$scatterPlot <- renderPlot({
    dataSubset <-data
    if (length(input$porte)!=0){
      dataSubset <- subset(dataSubset, dataSubset$Porte_pop2010 %in% input$porte)
    }
    if (input$uf != 'BR') {
      dataSubset <- subset(dataSubset, dataSubset$UF == input$uf)
    }
    
    
    scatterplot(q14_1 ~ nu_trabalhadores | Porte_pop2010, data=dataSubset,
                               xlab="Number of workers", ylab="Number of visits",
                               main="Visits vs Workers",
                               labels=row.names(dataSubset)) 
    
    # generate an rnorm distribution and plot it
    #dist <- rnorm(input$obs)
    #hist(dist)
    
  })
})
