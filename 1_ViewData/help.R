ls.type <- function(lsenv = globalenv(), datatype = "data.frame"){
    data.list <- c()
    for (var in ls(lsenv)){
        if (eval(parse(text = paste("class(", var, ')', sep=''))) == datatype){
            data.list <- c(data.list, var)
        }
    }
    return(data.list)
}

