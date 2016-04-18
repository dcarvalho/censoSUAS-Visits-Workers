library(shiny)
library(car)

#Load the data file
data<-read.csv2(file="data/CensoSUAS_2015_CRAS_dadosgerais_divulgacao_subset.csv",fileEncoding = "ISO-8859-1")
data<-data[,c( "UF", "Município", "Porte_pop2010", "nu_trabalhadores", "q14_1")]

# Define server logic required to subset the data and plot a scatterplot of Number of Families Assisted ~ Workers
shinyServer(
  function(input, output) {
    output$uf <- renderPrint({input$uf})
    output$porte <- renderPrint({input$porte})    
    
    
    
  output$scatterPlot <- renderPlot({
    
    #subset the data, based on user input
    dataSubset <-data
    if (length(input$porte)!=0){
      dataSubset <- subset(dataSubset, dataSubset$Porte_pop2010 %in% input$porte)
    }
    if (input$uf != 'BR') {
      dataSubset <- subset(dataSubset, dataSubset$UF == input$uf)
    }
    
    #print a scatterplot 
    scatterplot(q14_1 ~ nu_trabalhadores | Porte_pop2010, data=dataSubset,
                               xlab="Number of workers", ylab="Number of visits",
                               main="Families assisted vs Workers",
                               labels=row.names(dataSubset)) 
    #print two red lines on the means
    abline(h = mean(dataSubset$q14_1, na.rm=TRUE), lwd=2, lty = "solid", col = "red")
    abline(v = mean(dataSubset$nu_trabalhadores, na.rm=TRUE), lwd=2, lty = "solid", col = "red")
    
  })
})
