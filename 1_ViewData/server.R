library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {
    
    output$table <- DT::renderDataTable(DT::datatable({
        if (input$whic == 2){
            # print(input$mats)
            datas = eval(parse(text=input$mats))
        }
        if (input$whic == 1){
            # print(input$dfs)
            datas = eval(parse(text=input$dfs))
        }
        datas
    }))
})

