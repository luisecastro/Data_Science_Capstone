#Call needed functions in "functions.R"
source("functions.R")

#Download data if not already in disk
downloader()

#Load data completely (n=1), clean data
#and save processed data
text <- loader(n=1) 
text <- pre(text,ic=TRUE,ws=TRUE)
text <- pos(text)
save(text,file="RData/text.RData")

#Split data to create 1grams, create frequency table, save
text1 <- condition(text,n=1) 
text1 <- tgram(text1)
text1$ngrams <- as.character(text1$ngrams)
save(text1,file="RData/text1.RData")

#Tag start of sentences, create 2grams and frequency table, save
text2 <- condition(text,n=2) 
text2 <- ngram(text2,n=2)
text2 <- tgram(text2)
text2$ngrams <- as.character(text2$ngrams)
save(text2,file="RData/text2.RData")

#Tag start of sentences, create 3grams and frequency table, save
text3 <- condition(text,n=3) 
text3 <- ngram(text3,n=3)
text3 <- tgram(text3)
text3$ngrams <- as.character(text3$ngrams)
save(text3,file="RData/text3.RData")
rm(text)

#Strip data of ngrams whose frequency is less than 12
m1 <- reducer(text1,n=12,m=1)
save(m1,file="RData/m1.RData")

#Trim data of unwanted ngrams
#Strip data of ngrams which frequency is less than 6
m2 <- trim(text2,n=2)
m2 <- reducer(m2,n=6,m=2)
save(m2,file="RData/m2.RData")

#Trim data of unwanted ngrams
#Strip data of ngrams which frequency is less than 3
m3 <- trim(text3,n=3)
m3 <- reducer(m3,n=3,m=3)
save(m3,file="RData/m3.RData")