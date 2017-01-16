library(shiny)
source("helpers.r")

shinyUI(fluidPage(
    titlePanel('Overlab Histogram'),
    fluidRow(
        column(3,
               #数据选择区
               div(style="color:blue;font-size:18px", "1. Data Panel"),
               selectInput("vector1", label = "Vector 1:",
                           choices = ls(globalenv())),
               selectInput("vector2", label = "Vector 2:",
                           choices = ls(globalenv()))
        ),
        column(3,
               #box and bty
               div(style="color:blue;font-size:18px", "2. Box Panel"),
               checkboxInput("box", "Plot Box", value = FALSE),
               radioButtons("bty", "Border",
                            choices = list("O"="o", "L"="l", "7"="7", "C"="c",
                                           "U"="u", "]"="]"),
                            selected = "o", inline = TRUE),
               helpText('This parameter is valid when checked "Plot Box"')
        ),
        column(3,
               div(style="color:blue;font-size:18px", "3. Breaks Panel"),
               textInput("breakstep", 'Breaks Step'),
               helpText("Please input a number.")
        ),
        column(3,
               div(style="color:blue;font-size:18px", "4. Legend Panel"),
               textInput("leg1", "Legend 1:"),
               textInput("leg2", "Legend 2:"),
               radioButtons("legsite", "Legend Site:",
                            choices = list("topright", "topleft"),
                            selected = "topright", inline = TRUE)
        )
    ),
    
    fluidRow(
        column(3,
               #标题设置区
               div(style="color:blue;font-size:18px", "5. Title Panel"),
               textInput("Main", "Title"),
               textInput("Xlab", "Xlab name", width = '60%'),
               textInput("Ylab", "Ylab name", width = '60%')
        ),
        column(3,
               #颜色选择区
               div(style="color:blue;font-size:18px", "6. Color Panel"),
               sliderInput("alpha", "Alpha", min = 0, max = 1, value = 0.5, 
                           step = 0.05),
               textInput("color1", "Color 1:", value = "#FF0000", width = '60%'),
               textInput("color2", "Color 2:", value = "blue", width = '60%')
        ),
        column(3,
               div(style="color:blue;font-size:18px", "7. Limit Panel"),
               textInput("xlimu", 'X upper limit +'),
               textInput("xliml", 'X lower limit -'),
               textInput("ylimu", 'Y upper limit +')
        ),
        column(3,
               div(style="color:blue;font-size:18px", "8. Download Panel"))
    ),
    fluidRow(
        column(2),
        column(8,
               plotOutput("overlabHist")
        ),
        column(2)
    )
    #执行区
    # submitButton("PLOT", icon = icon("glyphicon glyphicon-chevron-right",
    #                                  lib = "glyphicon"))
))

