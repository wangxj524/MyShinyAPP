library(shiny)
source("helpers.R")

# Define a server for the Shiny app
shinyServer(function(input, output) {
    
    data1 <- reactive({
        datas = eval(parse(text=input$dfs))
    })
    data2 <- reactive({
        datas = eval(parse(text=input$mats))
    })
    output$df <- DT::renderDataTable(DT::datatable({
        data1()
    }))
    output$ma <- DT::renderDataTable(DT::datatable({
        data2()
    }))
})

