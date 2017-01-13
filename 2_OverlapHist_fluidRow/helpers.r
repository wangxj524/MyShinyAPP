OverlapHist <- function(a, b, breaks = NULL, xlim = NULL, ylim = NULL,
                        alpha = 0.5, plotbox = TRUE, main = "", 
                        xlab = NULL, ylab = NULL,
                        bty = c("o", "l", "7", "c", "u", "]")[1],
                        color.list = c(rgb(1, 0, 0, alpha=alpha), 
                                       rgb(0, 1, 0, alpha=alpha)),
                        leg1 = NULL, leg2 = NULL,
                        legsite = c("topright", "topleft")[1],
                        dist = NULL
){
    if(!(is.null(breaks))){
        ahist=hist(a, breaks=breaks, plot=FALSE)
        bhist=hist(b, breaks=breaks, plot=FALSE)
    } else {
        ahist=hist(a, plot=FALSE)
        bhist=hist(b, plot=FALSE)
        
        if(is.null(dist)){
            dist = ahist$breaks[2]-ahist$breaks[1]
        }
        breaks = seq(min(ahist$breaks,bhist$breaks),
                     max(ahist$breaks,bhist$breaks)+dist,dist)
    }
    
    if(is.null(xlim)){
        xlim = c(floor(min(ahist$breaks,bhist$breaks)), 
                 ceiling(max(ahist$breaks,bhist$breaks)))
    }
    if(is.null(ylim)){
        ylim = c(0, ceiling(max(ahist$counts, bhist$counts)))
    }
    
    if (is.null(xlab)){
        xlab <- substitute(a)
    }
    if (is.null(ylab)){
        ylab <- "Frequency"
    }
    
    if (is.null(leg1)){
        leg1 <- substitute(a)
    }
    if (is.null(leg2)){
        leg2 <- substitute(b)
    }
    
    opar<-par(no.readonly = TRUE)
    par(bty = bty)
    hist(a, xlim = xlim, ylim = ylim, col = color.list[1], main = main,
         xlab = xlab, ylab = ylab, breaks = breaks)
    hist(b, add = TRUE, col = color.list[2], breaks = breaks)
    if (plotbox) box()
    par(opar)
    legend(legsite, legend = c(leg1, leg2), 
           fill = c(color.list[1], color.list[2]))
}

hex2rgb.color <- function(chars, alpha){
    v1 <- strtoi(substr(chars, 2, 3), base = 16)/255
    v2 <- strtoi(substr(chars, 4, 5), base = 16)/255
    v3 <- strtoi(substr(chars, 6, 7), base = 16)/255
    return(rgb(v1, v2, v3, alpha = alpha))
}
