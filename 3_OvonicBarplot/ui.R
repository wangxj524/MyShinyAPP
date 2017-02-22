library(shiny)
source("helpers.r")

shinyUI(fluidPage(
    titlePanel('Ovonic Barplot'),
    fluidRow(
        column(3,
               #数据选择区
               div(style="color:blue;font-size:18px", "1. Data Panel"),
               selectInput("mydata", label = "Data: ",
                           choices = ls(globalenv())),
               helpText("Data seleted must be a list with two dataframes.")
        ),
        column(3,
               #图例设置区
               div(style="color:blue;font-size:18px", "2. Legend Panel"),
               textInput("Legend", "Legend.title:", value = " "),
               radioButtons("legsite", "Legend position:",
                            choices = list("right", "top", "bottom", "left", "none"),
                            selected = "right", inline = TRUE)
        ),
        column(3,
               #颜色选择区
               div(style="color:blue;font-size:18px", "3. Color Panel"),
               textInput("color1", "Color 1:", value = "#FF0000"),
               textInput("color2", "Color 2:", value = "blue")
        ),
        column(3,
               #
               div(style="color:blue;font-size:18px", "4. Flip Panel"),
               checkboxInput("flip", "Flip x and y axis.", value = TRUE),
               checkboxInput("split", "Plot split line.", value = TRUE)
        )
    ),
    
    fluidRow(
        column(5,
               #标题设置区
               div(style="color:blue;font-size:18px", "5. Title Panel"),
               textInput("Main", "Title:", value = " "),
               textInput("Xlab", "Xlab:", width = '70%', value = " "),
               textInput("Ylab", "Ylab:", width = '70%', value = " ")
        ),
        column(4,
               #limit
               div(style="color:blue;font-size:18px", "6. Limit Panel"),
               textInput("limitmax", 'Upper limit'),
               textInput("limitmin", 'Lower limit'),
               helpText("These two limit values must be set at the same time!")
        ),
        column(3,
               #download
               div(style="color:blue;font-size:18px", "7. Download Panel"),
               numericInput("width", "Width:(inch)", 8, min = 5, max = 30,
                            width = '70%'),
               numericInput("height", "Height:(inch)", 6, min = 4, max = 30,
                            width = '70%'),
               radioButtons('format', 'Document format', c('pdf', 'png', 'jpg'),
                            inline = TRUE),
               downloadButton("download", label = "Download")
        )
    ),
    fluidRow(
        column(1),
        column(10,
               plotOutput("ovonicBarplot")
        ),
        column(1)
    )
))

