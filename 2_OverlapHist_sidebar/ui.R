library(shiny)
source("helpers.r")

shinyUI(fluidPage(
    title = 'Overlab Histogram',
    sidebarLayout(
        sidebarPanel(
            #数据选择区
            div(style="color:blue;font-size:18px", "1. Data Panel"),
            selectInput("vector1", label = "Vector 1:",
                        choices = ls(globalenv())),
            selectInput("vector2", label = "Vector 2:",
                        choices = ls(globalenv())),
            
            #图例设置区
            div(style="color:blue;font-size:18px", "2. Legend Panel"),
            textInput("leg1", "Legend 1"),
            textInput("leg2", "Legend 2"),
            radioButtons("legsite", "Legend Site:",
                         choices = list("topright", "topleft"),
                         selected = "topright", inline = TRUE),
            
            #标题设置区
            div(style="color:blue;font-size:18px", "3. Title Panel"),
            textInput("Main", "main"),
            textInput("Xlab", "xlab", width = '60%'),
            textInput("Ylab", "ylab", width = '60%'),
            
            #颜色选择区
            div(style="color:blue;font-size:18px", "4. Color Panel"),
            sliderInput("alpha", "Alpha", min = 0, max = 1, value = 0.5, 
                        step = 0.05),
            textInput("color1", "Color 1:", value = "#FF0000"),
            textInput("color2", "Color 2:", value = "blue"),
            
            #box and bty
            div(style="color:blue;font-size:18px", "5. Box Panel"),
            checkboxInput("box", "Plot Box", value = FALSE),
            radioButtons("bty", "Border",
                         choices = list("O"="o", "L"="l", "7"="7", "C"="c",
                                        "U"="u", "]"="]"),
                         selected = "o", inline = TRUE),
            helpText('This parameter is valid when checked "Plot Box"'),
            
            #breaks step
            div(style="color:blue;font-size:18px", "6. Breaks Panel"),
            textInput("breakstep", 'Breaks Step'),
            helpText("Please input a number."),
            
            #limit
            div(style="color:blue;font-size:18px", "7. Limit Panel"),
            textInput("xlimu", 'X upper limit +'),
            textInput("xliml", 'X lower limit -'),
            textInput("ylimu", 'Y upper limit +'),
            
            #download
            numericInput("width", "Width:(inch)", 8, min = 5, max = 30,
                         width = '70%'),
            numericInput("height", "Height:(inch)", 6, min = 4, max = 30,
                         width = '70%'),
            radioButtons('format', 'Document format', c('pdf', 'png', 'jpg'),
                         inline = TRUE),
            downloadButton("download", label = "Download")
            #执行区
            # submitButton("PLOT", icon = icon("glyphicon glyphicon-chevron-right",
            #                                  lib = "glyphicon"))
        ),
        mainPanel(
            # textOutput("text"),
            plotOutput("overlabHist")
        )
    )
))

