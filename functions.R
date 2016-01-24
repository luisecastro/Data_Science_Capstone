downloader <- function(){
        url <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
        file <- "Coursera-SwiftKey.zip"
        if(!file.exists(file)){download.file(url=url,destfile=file);unzip(file)}
}
loader <- function(n){
        con <- file("final/en_US/en_US.news.txt",open="rb")
        news <- readLines(con, encoding="ASCII",skipNul=TRUE)
        close(con)
        
        con <- file("final/en_US/en_US.blogs.txt",open="rb")
        blogs <- readLines(con, encoding="ASCII",skipNul=TRUE)
        close(con)
        
        con <- file("final/en_US/en_US.twitter.txt",open="rb")
        twitter <- readLines(con, encoding="ASCII",skipNul=TRUE) 
        close(con)
        
        c(sample(news,length(news)*n),sample(blogs,length(blogs)*n),
          sample(twitter,length(twitter)*n))
}
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
pos <- function(x){
        x <- x[!is.na(x)]
        x <- x[nchar(x)>0]
        x[x!=" "]
        
}
condition <- function(x,n){
        if(n==2) x <- paste("<>",x)
        if(n==3) x <- paste("<<>> <>",x)
        unlist(strsplit(x," "))
}
ngram <- function(x,n){
        len <- length(x)
        if(n==2) return(paste(x[1:(len-1)],x[2:len]))
        if(n==3) return(paste(x[1:(len-2)],x[2:(len-1)],x[3:len]))
}
tgram <- function(x){
        x <- sort(table(x),decreasing=TRUE,method="quick")
        data.frame(ngrams=names(x),count=as.numeric(x))
}
trim <- function(x,n){
        if(n==2){
                x <- x[-grep(" <>",x[,1],perl=TRUE),]
                x <- x[-grep("^rt | rt$",x[,1],perl=TRUE),] 
        }
        if(n==3){
                x <- x[-grep("<<>> <>",x[,1],perl=TRUE),]
                x <- x[-grep(" <<>>$",x[,1],perl=TRUE),]
                x <- x[-grep("^rt | rt | rt$",x[,1],perl=TRUE),]
        }
        x
}
tester <- function(x,n){ 
        num <- round(sum(x[,2]>n)/nrow(x),2)
        mass <- round(sum(x[x[,2]>n,2])/sum(x[,2]),2)
        c(paste(num,"num","/",mass,"mass"))
}
reducer <- function(x,n,m) {
        x <- as.character(x[x[,2]>n,1])
        if(m==1) return(matrix(x,ncol=m,byrow=TRUE))
        if(m==2 | m==3) return(matrix(unlist(strsplit(x," ")),ncol=m,byrow=TRUE))
}