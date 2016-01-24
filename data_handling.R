source("functions.R")

downloader()
text <- loader(n=1) 
text <- pre(text,ic=TRUE,ws=TRUE)
text <- pos(text)
save(text,file="RData/text.RData")

text1 <- condition(text,n=1) 
text1 <- tgram(text1)
text1$ngrams <- as.character(text1$ngrams)
save(text1,file="RData/text1.RData")

text2 <- condition(text,n=2) 
text2 <- ngram(text2,n=2)
text2 <- tgram(text2)
text2$ngrams <- as.character(text2$ngrams)
save(text2,file="RData/text2.RData")

text3 <- condition(text,n=3) 
text3 <- ngram(text3,n=3)
text3 <- tgram(text3)
text3$ngrams <- as.character(text3$ngrams)
save(text3,file="RData/text3.RData")
rm(text)

m1 <- reducer(text1,n=12,m=1)
save(m1,file="RData/m1.RData")

m2 <- trim(text2,n=2)
m2 <- reducer(m2,n=6,m=2)
save(m2,file="RData/m2.RData")

m3 <- trim(text3,n=3)
m3 <- reducer(m3,n=3,m=3)
save(m3,file="RData/m3.RData")