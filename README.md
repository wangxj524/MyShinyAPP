## MyShinyApp

1. `1_ViewData` 以比较友好的方式显示global环境中数据（data.frame和matrix类型数据）。以下两种方式功能相同，只是界面类似。**1_ViewData_tabSet** 利用了shiny的tabSetPanel函数组织界面。   
**用法:**  
`shiny::runGitHub("MyShinyApp", "wangxj524", subdir = "1_ViewData_ordinary/")`
`shiny::runGitHub("MyShinyApp", "wangxj524", subdir = "1_ViewData_tabSet/")`
2. `2_OverlapHist`该app主要作用是画重合直方图。以*2_OverlapHist*为前缀的功能都是一样，只是排版布局略有差异。目前还不支持制定宽、高现在图片的功能，后续会逐渐完善。
**用法:**
`shiny::runGitHub("MyShinyApp", "wangxj524", subdir = "2_OverlapHist_fluidRow/")`           
`shiny::runGitHub("MyShinyApp", "wangxj524", subdir = "2_OverlapHist_sidebar/")`
3. 
