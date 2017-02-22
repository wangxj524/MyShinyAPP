library(ggplot2)

ovonic.data <- function(){
    Year <- factor(c("2003-2009","2003-2009","2003-2009","2003-2009","2003-2009","2009-2012",
                     "2009-2012","2009-2012","2009-2012","2009-2012"))
    Q <- c(.05,.25,.5,.75,.95)
    Score <- c(6,6,4,3,1,23,20,19,24,32)
    df <- data.frame(Score, Q, Year)
    df <- transform(df, Score=ifelse(as.character(Year) %in% c("2003-2009"), -Score, Score))
    df.split <- split(df, df$Score < 0)
    df.split
}

ovonic.barplot <- function(listdf, width=0.5, flipxy=TRUE, splitline=TRUE,
                           limits=NULL, colors = c("#00BFC4", "#F8766D"),
                           legend.pos=c("right", "top", "bottom", "left", "none")[1],
                           xlab="", ylab="", legend="", title="")
{
    ## listdf: a list includes two dataframes which have same headers.
    tem <- listdf
    colnames(tem[[1]]) <- c("value", "group", "split")
    colnames(tem[[2]]) <- c("value", "group", "split")
    if (is.null(limits)){
        limits <- c(min(c(tem[[1]]$value, tem[[2]]$value)),
                    max(c(tem[[1]]$value, tem[[2]]$value)))
    }
    plot.figure <- 
        ggplot() + 
        geom_bar(data=tem[[1]], aes(x=as.factor(group), y=value, fill=split), 
                 stat="identity", width = width) +
        geom_bar(data=tem[[2]], aes(x=as.factor(group), y=value, fill=split), 
                 stat="identity", width = width)+
        scale_y_continuous(labels=abs,limits=limits)+
        scale_fill_manual(values = colors)+
        labs(x=xlab, y=ylab, title=title, fill=legend)+
        theme(legend.position = legend.pos)
    if (flipxy) plot.figure <- plot.figure+coord_flip()
    if (splitline) plot.figure <- plot.figure + geom_hline(yintercept = 0)
    plot(plot.figure)
}

hex2rgb.color <- function(chars, alpha){
    v1 <- strtoi(substr(chars, 2, 3), base = 16)/255
    v2 <- strtoi(substr(chars, 4, 5), base = 16)/255
    v3 <- strtoi(substr(chars, 6, 7), base = 16)/255
    return(rgb(v1, v2, v3, alpha = alpha))
}

