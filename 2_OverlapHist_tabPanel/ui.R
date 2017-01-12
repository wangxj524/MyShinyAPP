library(shiny)
source("helpers.r")

shinyUI(fluidPage(
    title = 'Overlab Histogram',
    sidebarLayout(
        sidebarPanel(
            conditionalPanel(
                'input.plotss == "Data Panel"',
                #数据选择区
                selectInput("vector1", label = "Vector 1:",
                            choices = ls(globalenv())),
                selectInput("vector2", label = "Vector 2:",
                            choices = ls(globalenv()))
            ),
            conditionalPanel(
                'input.plotss == "Title & Legend"',
                #标题设置区
                textInput("Main", "main"),
                textInput("Xlab", "xlab", width = '60%'),
                textInput("Ylab", "ylab", width = '60%')
            ),
            conditionalPanel(
                'input.plotss == "Color Panel"',
                #颜色选择区
                sliderInput("alpha", "Alpha", min = 0, max = 1, value = 0.5, 
                            step = 0.05),
                textInput("color1", "Color 1:", value = "#FF0000"),
                textInput("color2", "Color 2:", value = "blue")
            ),
            #box and bty
            conditionalPanel(
                'input.plotss == "Box Panel"',
                checkboxInput("box", "Plot Box", value = FALSE),
                radioButtons("bty", "Border",
                             choices = list("O"="o", "L"="l", "7"="7", "C"="c",
                                            "U"="u", "]"="]"),
                             selected = "o", inline = TRUE),
                helpText('This parameter is valid when checked "Plot Box"')
            )
            #执行区
            # submitButton("PLOT", icon = icon("glyphicon glyphicon-chevron-right",
            #                                  lib = "glyphicon"))
        ),
        mainPanel(
            tabsetPanel(
                id = 'plotss',
                tabPanel('Data Panel', plotOutput("overlabHist")),
                tabPanel('Title & Legend', plotOutput("overlabHist")),
                tabPanel('Color Panel', plotOutput("overlabHist")),
                tabPanel('Box Panel', plotOutput("overlabHist"))
            )
        )
    )
))

