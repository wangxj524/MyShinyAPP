library(shiny)
source("helpers.r")

# Define a server for the Shiny app
shinyServer(function(input, output) {
    mydata <- reactive({
        eval(parse(text=input$mydata))
    })
    
    xlabvalue <- reactive({
        if (input$Xlab == ""){
            xlab <- NULL
        }else{
            xlab <- input$Xlab
        }
        return(xlab)
    })
    ylabvalue <- reactive({
        if (input$Ylab == ""){
            ylab <- NULL
        }else{
            ylab <- input$Ylab
        }
        return(ylab)
    })
    title <- reactive({
        if (input$Main == ""){
            tem <- NULL
        }else{
            tem <- input$Main
        }
        return(tem)
    })
    
    col1 <- reactive({
        if (input$color1 == ""){
            return('#00BFC4')
        }
        if (substr(input$color1, 1, 1)=="#"){
            col <- hex2rgb.color(input$color1, alpha = input$alpha)
        }else{
            tem <- col2rgb(input$color1)/255
            col <- rgb(tem[1], tem[2], tem[3], alpha = input$alpha)
        }
        return(col)
    })
    col2 <- reactive({
        if (input$color2 == ""){
            return('#F8766D')
        }
        if (substr(input$color2, 1, 1)=="#"){
            col <- hex2rgb.color(input$color2, alpha = input$alpha)
        }else{
            tem <- col2rgb(input$color2)/255
            col <- rgb(tem[1], tem[2], tem[3], alpha = input$alpha)
        }
        return(col)
    })
    
    legname <- reactive({
        if (input$Legend == ""){
            tem <- NULL
        }else{
            tem <- input$Legend
        }
        return(tem)
    })
    
    limmin <- reactive({
        if (input$limitmin == ""){
            tem <- NULL
        }else{
            tem <- as.numeric(input$limitmin)
        }
        return(tem)
    })
    
    limmax <- reactive({
        if (input$limitmax == ""){
            tem <- NULL
        }else{
            tem <- as.numeric(input$limitmax)
        }
        return(tem)
    })
    
    output$ovonicBarplot <- renderPlot({
        ovonic.barplot(listdf = mydata(), colors = c(col1(), col2()),
                       xlab = xlabvalue(), ylab = ylabvalue(), title = title(),
                       legend.pos = input$legsite, legend = legname(),
                       limits = c(limmin(), limmax()), flipxy=input$flip, 
                       splitline=input$split)
    })

    output$download <- downloadHandler(
        filename = function() {
            paste('myplot', sep = '.', switch(
                input$format, pdf = 'pdf', png = 'png', jpg = 'jpg'
            ))
        },
        content = function(file){
            if (input$format == "pdf"){
                pdf(file = file, width = input$width, height = input$height)
            }else if(input$format == "png"){
                png(filename = file, width = input$width, height = input$height,
                    units = "in", res = 600)
            }else if(input$format == "jpg"){
                jpeg(filename = file, width = input$width, height = input$height,
                    units = "in", res = 600)
            }
            ovonic.barplot(listdf = mydata(), colors = c(col1(), col2()),
                           xlab = xlabvalue(), ylab = ylabvalue(), title = title(),
                           legend.pos = input$legsite, legend = legname(),
                           limits = c(limmin(), limmax()), flipxy=input$flip, 
                           splitline=input$split)
            dev.off()
        }
    )
})

