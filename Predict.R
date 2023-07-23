library(shiny)
library(dplyr)
library(tm)
library(NLP)
library(shinycssloaders)

setwd("C:/Users/rkrishnaramanujam/Documents/final")

gram2<- readRDS("gramTwo.RData")
gram3<- readRDS("gramTri.RData")
gram4<- readRDS("gramFour.RData")




predictWord <- function(sentence, ngram=2){
    inputSentence<-stripWhitespace(removeNumbers(tolower(sentence),preserve_intra_word_dashes = TRUE))
    sentenceWords<- strsplit(inputSentence," ")[[1]]
    qwords<-length(sentenceWords)
    ngram2='?'
    ngram3='?'
    ngram4='?'
    ngram5='?'
    if(qwords > 0 & ngram == 2) { 
        lastWords <- tail(sentenceWords, 1)
        ngram2<-as.character(head((gram2[gram2$w1==lastWords,])$w2,1))
        return(ngram2)
    }  
    
    if(qwords > 1 & ngram == 3) { 
        lastWords <- tail(sentenceWords, 1)
        lastWords_2 <- tail(sentenceWords, 2)
        ngram3<-as.character(head((gram3[gram3$w1==lastWords_2 
                                         & gram3$w2==lastWords,])$w3,1))
        return(ngram3)
    }  
    
    if(qwords > 2 & ngram == 4) { 
        lastWords <- tail(sentenceWords, 1)
        lastWords_2 <- tail(sentenceWords, 2)
        lastWords_3 <- tail(sentenceWords, 3)
        ngram4<-as.character(head((gram4[gram4$w1==lastWords_3 & gram4$w2==lastWords_2
                                         & gram4$w3==lastWords,])$w4,1))
        return(ngram4)
    }  
    
    if(qwords > 3 & ngram == 5) { 
        lastWords <- tail(sentenceWords, 1)
        lastWords_2 <- tail(sentenceWords, 2)
        lastWords_3 <- tail(sentenceWords, 3)
        lastWords_4 <- tail(sentenceWords, 4)
        ngram5<-as.character(head((gram5[gram5$w1==lastWords_4 & gram5$w2==lastWords_3
                                         & gram5$w3==lastWords_2 & gram5$w4==lastWords,])$w5,1))
        return(ngram5)
    }  
    
}
