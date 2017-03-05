library(shiny)
library(shinydashboard)
source("helpers.r")

dashboardPage(skin = "green",
              dashboardHeader(title = "Ovonic Barplot"),
              dashboardSidebar(
                  selectInput("mydata", label = "选择数据: ",
                              choices = ls(globalenv())),
                  textInput("Main", "标题:", value = " "),
                  textInput("Xlab", "x轴名称:", value = " "),
                  textInput("Ylab", "y轴名称:", value = " "),
                  textInput("Legend", "图例名称:", value = " "),
                  textInput("color1", "Color 1:", value = "#FF0000"),
                  textInput("color2", "Color 2:", value = "blue")
              ),
              dashboardBody(
                  fluidRow(
                      box(plotOutput("ovonicBarplot"), width = 12)
                  ),
                  fluidRow(
                      column(width = 4,
                             box(width = NULL, title = "图例位置", 
                                 solidHeader = TRUE, status = "success",
                                 radioButtons("legsite", "",
                                              choices = list("right", "top", "bottom", "left", "none"),
                                              selected = "right", inline = TRUE)),
                             box(width = NULL, title = "其他设置", 
                                 solidHeader = TRUE, status = "success",
                                 checkboxInput("flip", "Flip x and y axis.", value = TRUE),
                                 checkboxInput("split", "Plot split line.", value = TRUE))),
                      column(width = 4, 
                             box(width = NULL, title = "下载图片",
                                 solidHeader = TRUE, status = "success",
                             numericInput("width", "Width:(inch)", 8, min = 5, max = 30,
                                          width = '70%'),
                             numericInput("height", "Height:(inch)", 6, min = 4, max = 30,
                                          width = '70%'),
                             radioButtons('format', 'Document format', c('pdf', 'png', 'jpg'),
                                          inline = TRUE),
                             downloadButton("download", label = "Download"))),
                      column(width = 4,
                             box(width = NULL, title = "坐标上下限设置", 
                                 solidHeader = TRUE, status = "success",
                                 textInput("limitmax", 'Upper limit'),
                                 textInput("limitmin", 'Lower limit'),
                                 helpText("These two limit values must be set at the same time!")))
                  )
              )
)






