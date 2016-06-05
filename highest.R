#Highest order calculation PKN
pkn.highest <- function(string, lowerorder, discount, dictlist){
      ## Function to collapse a split string
    collapse <- function(splitstring){
        paste(splitstring, collapse = " ")
    }
    
    #Count of strings of word i to word n (e.g., w1w2w3 when string = w1w2w3)
    n <- length(string)
    c.highest.wi.to.n <- dictlist[[n]][token ==  collapse(string),count]
    if(length(c.highest.wi.to.n) == 0){c.highest.wi.to.n = 0} #If zero, set to 0
    c.highest.wi.to.n.minus.1 <- dictlist[[n-1]][token ==  collapse(string[1:n-1]),count]
    if(length(c.highest.wi.to.n.minus.1) == 0){c.highest.wi.to.n.minus.1 = 0.1} #If zero, set to 0.1
    
    cont.highest.wi.to.n.minus.1.ANY <- continuationCount(string_start = 1, 
                                                  token_start = 1, 
                                                  ntokens = n-1, 
                                                  string = string, 
                                                  dict_number = n, 
                                                  dictlist = dictlist)
    nrow(dictlist[[n]][eval(parse(text = logical.dfchecker(string_start = 1, 
                                                           token_start = 1, 
                                                           ntokens = n-1, 
                                                           string = string, 
                                                           dict_number = n))),])

    if(length(cont.highest.wi.to.n.minus.1.ANY) == 0){cont.highest.wi.to.n.minus.1.ANY = 0} #If zero, set to 0
    result <- max((c.highest.wi.to.n - discount), 0)/c.highest.wi.to.n.minus.1 + discount*cont.highest.wi.to.n.minus.1.ANY*lowerorder/c.highest.wi.to.n.minus.1
    
    if(cont.highest.wi.to.n.minus.1.ANY == 0){ 
        return(FALSE)
    }else{
         return(result)
    }
}
