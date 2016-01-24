#Include needed libraries
library(shiny)
library(markdown)

#Load data to memory
load("RData/m1.RData")
load("RData/m2.RData")
load("RData/m3.RData")

load("RData/shak1.RData")
load("RData/shak2.RData")
load("RData/shak3.RData")

#Pre process user input
pre <- function(x,ic,ws){
        if(ic) x <- iconv(x,"latin1","ASCII")
        if(!ic) x <- iconv(x,"latin1","UTF-8")
        x <- gsub("(?!')[[:punct:]]+|[[:digit:]]+","",x,perl=TRUE)
        x <- gsub("^'+| '+|'+ |'+$","",x,perl=TRUE)
        x <- tolower(x)
        x <- gsub(" +"," ",x,perl=TRUE)
        if(ws) x <- gsub("^ +| +$","",x,perl=TRUE)
        x 
}

#Take input and Ngram tables, search for words and return the highest
#ngram found words
predictor <- function(text,m1,m2,m3,n){
        len <- length(text)
        triR <- m3[intersect(grep(paste0("^",text[len-1],"$"),m3[,1],perl=TRUE),
                             grep(paste0("^",text[len],"$"),m3[,2],perl=TRUE))[1:n],3]
        flag <- sum(is.na(triR))
        if(flag>0) {
                biR <- m2[grep(paste0("^",text[len],"$"),m2[,1],perl=TRUE)[1:(flag+1)],2]
                triR <- unique(c(triR[!is.na(triR)],biR[!is.na(biR)]))[1:n]
        }
        flag <- sum(is.na(triR))
        if(flag>0) {
                uniR <- m1[1:flag+1]
                triR <- unique(c(triR[!is.na(triR)],uniR[!is.na(uniR)]))[1:n]
        }
        triR[!is.na(triR)]
}

#Take input and Ngram tables, search for words and return the highest
#ngram and shortest distance found words
corrector <- function(text,m1,m2,m3,n){
        len <- length(text)
        triR <- m3[intersect(grep(paste0("^",text[len-2],"$"),m3[,1],perl=TRUE),
                             grep(paste0("^",text[len-1],"$"),m3[,2],perl=TRUE)),3]
        triR <- agrep(text[len],triR,max=0,fixed=TRUE,value=TRUE)[1:n]
        flag <- sum(is.na(triR))
        if(flag>0){
                biR <- m2[grep(paste0("^",text[len-1],"$"),m2[,1],perl=TRUE),2]
                biR <- agrep(text[len],biR,max=0,fixed=TRUE,value=TRUE)[1:(flag+1)]
                triR <- unique(c(triR[!is.na(triR)],biR[!is.na(biR)]))[1:n]
        }
        if(flag>0){
                uniR <- agrep(text[len],m1,max=0,fixed=TRUE,value=TRUE)[1:(flag+1)]
                triR <- unique(c(triR[!is.na(triR)],uniR[!is.na(uniR)]))[1:n]
                if(length(triR[!is.na(triR)])==0) triR <- m1[1:n]
                
        }
        triR[!is.na(triR)]
}

#Prepare data for corrector or predictor, select to which send the data
streamer <- function(text,m1,m2,m3,n){
        text <- pre(text,ic=FALSE,ws=FALSE)
        chars <- nchar(text)
        last <- substr(text,start=chars,stop=chars)
        text <- strsplit(paste0("<>"," ",text)," ")[[1]] 
        if(last==" ") return(predictor(text,m1,m2,m3,n))
        if(chars!=0) return(corrector(text,m1,m2,m3,n))
        predictor("<>",m1,m2,m3,n)
}

#Take input parameters and text, randomly generate a secuence of words
#based on this information and the ngram tables
babbler<- function(text,size,n,m1,m2,m3){
        repeat{
                text <- pre(text,ic=FALSE,ws=FALSE)
                chars <- nchar(text)
                last <- substr(text,start=chars,stop=chars)
                text <- strsplit(paste0("<>"," ",text)," ")[[1]] 
                if(last==" "){
                        temp <- predictor(text,m1,m2,m3,n)
                        text <- c(text,temp[sample(1:length(temp),1)])
                        break  
                }
                if(chars!=0){
                        temp <- corrector(text,m1,m2,m3,n)
                        text[length(text)] <- temp[sample(1:length(temp),1)]
                        break
                }
                temp <- predictor(text,m1,m2,m3,n)
                text <- c(text,temp[sample(1:length(temp),1)])
                break
        }
        for(i in 1:(size-1)){
                temp <- predictor(text[length(text)],m1,m2,m3,n)
                text <- c(text,temp[sample(1:length(temp),1)])
        } 
        paste(text[-1],collapse=' ')
}