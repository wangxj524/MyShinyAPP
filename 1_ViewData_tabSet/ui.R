library(shiny)
source("helpers.R")

shinyUI(fluidPage(
    title = 'Examples of DataTables',
    sidebarLayout(
        sidebarPanel(
            conditionalPanel(
                'input.dataset == "data.frame"',
                selectInput("dfs", label = "data.frame:",
                            choices = ls.type(lsenv = globalenv(),
                                              datatype = "data.frame")),
                helpText("Please select a ",strong("data.frame"), "which you want to view")
            ),
            conditionalPanel(
                'input.dataset == "matrix"',
                selectInput("mats", "matrix:", 
                            choices = ls.type(lsenv = globalenv(),
                                              datatype = "matrix")),
                helpText("Please select a ",strong("matrix"), "which you want to view")
            )
        ),
        mainPanel(
            tabsetPanel(id = "dataset",
                        tabPanel('data.frame', DT::dataTableOutput("df")),
                        tabPanel('matrix', DT::dataTableOutput("ma"))
            )
            
        )
    )
))

