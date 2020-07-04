library(shiny)

shinyUI(fluidPage(

    # Application title
    titlePanel("EuStockMarkets Data"),

    sidebarLayout(
        sidebarPanel(
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
