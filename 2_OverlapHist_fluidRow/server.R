library(shiny)
source("helpers.r")

# Define a server for the Shiny app
shinyServer(function(input, output) {
    data1 <- reactive({
        eval(parse(text=input$vector1))
    })
    data2 <- reactive({
        eval(parse(text=input$vector2))
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
    
    col1 <- reactive({
        if (substr(input$color1, 1, 1)=="#"){
            col <- hex2rgb.color(input$color1, alpha = input$alpha)
        }else{
            tem <- col2rgb(input$color1)/255
            col <- rgb(tem[1], tem[2], tem[3], alpha = input$alpha)
        }
        return(col)
    })
    col2 <- reactive({
        if (substr(input$color2, 1, 1)=="#"){
            col <- hex2rgb.color(input$color2, alpha = input$alpha)
        }else{
            tem <- col2rgb(input$color2)/255
            col <- rgb(tem[1], tem[2], tem[3], alpha = input$alpha)
        }
        return(col)
    })
    
    leg1name <- reactive({
        if (input$leg1 == ""){
            tem <- NULL
        }else{
            tem <- input$leg1
        }
        return(tem)
    })
    leg2name <- reactive({
        if (input$leg2 == ""){
            tem <- NULL
        }else{
            tem <- input$leg2
        }
        return(tem)
    })
    
    bstep <- reactive({
        if (input$breakstep == ""){
            tem <- NULL
        }else{
            tem <- as.numeric(input$breakstep)
        }
        return(tem)
    })
    
    limxu <- reactive({
        if (input$xlimu == ""){
            tem <- NULL
        }else{
            tem <- as.numeric(input$xlimu)
        }
        return(tem)
    })
    
    limxl <- reactive({
        if (input$xliml == ""){
            tem <- NULL
        }else{
            tem <- as.numeric(input$xliml)
        }
        return(tem)
    })
    
    limyu <- reactive({
        if (input$ylimu == ""){
            tem <- NULL
        }else{
            tem <- as.numeric(input$ylimu)
        }
        return(tem)
    })
    
    output$overlabHist <- renderPlot({
        OverlapHist(a = data1(), b = data2(), bty = input$bty, dist = bstep(),
                    xlab = xlabvalue(), ylab = ylabvalue(), main = input$Main,
                    color.list = c(col1(), col2()), plotbox = input$box,
                    legsite = input$legsite, leg1 = leg1name(), leg2 = leg2name(),
                    xlimu = limxu(), xliml = limxl(), ylimu = limyu())
    })
    output$text <- renderText({
        paste(input$bty)
    })
})

