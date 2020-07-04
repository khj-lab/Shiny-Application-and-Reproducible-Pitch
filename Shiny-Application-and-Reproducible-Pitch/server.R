library(shiny)
library(ggplot2)
library(dplyr)
library(rsconnect)
library(stringr)

data(EuStockMarkets)
data.eu <- as.data.frame(EuStockMarkets)
t <- time(EuStockMarkets)
data.eu <- data.frame(t, data.eu)


shinyServer(function(input, output, session) {

    output$distPlot <- renderPlot({
      
        # generate linear graphs based on input$indices from ui.R
        g <- ggplot(data.eu, aes(x=t))
        for (s in input$indices) {
          if (s == "1"){
            g <- g + geom_line(aes(y=DAX, col='DAX'), colour="red")
          }
          if (s == "2"){
            g <- g + geom_line(aes(y=SMI, col='SMI'), colour="blue")
          }
          if (s == "3"){
            g <- g + geom_line(aes(y=CAC, col='CAC'), colour= "green")
          }
          if (s == "4"){
            g <- g + geom_line(aes(y=FTSE, col='FTSE'), colour = "orange")
          }
        }
          
        g <- g + labs(x="Time Series", y="Stock")
        
        g
    })

})
