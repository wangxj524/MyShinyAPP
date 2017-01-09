## MyShinyApp

1. `1_ViewData` 以比较友好的方式显示global环境中数据（data.frame和matrix类型数据）。以下两种方式功能相同，只是界面类似。**1_ViewData_tabSet** 利用了shiny的tabSetPanel函数组织界面。   
**用法:**  
`shiny::runGitHub("MyShinyApp", "wangxj524", subdir = "1_ViewData_ordinary/")`
`shiny::runGitHub("MyShinyApp", "wangxj524", subdir = "1_ViewData_tabSet/")`
2.  
