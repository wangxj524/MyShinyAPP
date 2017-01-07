library(shiny)

shinyUI(fluidPage(
    title = 'Examples of DataTables',
    sidebarLayout(
        sidebarPanel(
            radioButtons("whic", "Which to display", 
                         choices = list("data.frame" = 1, "matrix" = 2),
                         selected = 1),
            selectInput("dfs", label = "data.frame:",
                        choices = ls.type(lsenv = globalenv(),
                                          datatype = "data.frame")),
            
            selectInput("mats", "matrix:", 
                        choices = ls.type(lsenv = globalenv(),
                                          datatype = "matrix"))
            
        ),
        mainPanel(
            DT::dataTableOutput("table")
        )
    )
))

