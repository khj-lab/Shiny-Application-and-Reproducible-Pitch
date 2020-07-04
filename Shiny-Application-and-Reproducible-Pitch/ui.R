library(shiny)

shinyUI(fluidPage(

    # Application title
    titlePanel("EuStockMarkets Data"),

    sidebarLayout(
        sidebarPanel(
            helpText("This application is to see daily closing prices of major european stock indices from 1991 to 1998. Choose indices you want to see."),
            checkboxGroupInput("indices", 
                        label = h3("Select Indices"), 
                        choices = list("DAX" = 1,
                                       "SMI" = 2,
                                       "CAC" = 3,
                                       "FTSE" = 4),
                        selected = 1)
        ),

        mainPanel(
            plotOutput("distPlot")
        )
    )
))
