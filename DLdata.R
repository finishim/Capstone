#Tasks to accomplish - Week 1

## 1. Obtaining the data - Can you download the data and load/manipulate it in R?
## 2. Familiarizing yourself with NLP and text mining - Learn about the basics of natural language processing and 
## how it relates to the data science process you have learned in the Data Science Specialization.

library(stringi)
library(rJava)
library(NLP)
library(openNLP)
library(RWeka)
library(magrittr)
#(source on libraries to use: https://rpubs.com/lmullen/nlp-chapter)

url_train <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"

if(!file.exists('en_US.blogs.txt')){
    #check if .zip file exists
    if(!file.exists('.\\data\\Coursera-SwiftKey.zip')){
        download.file(url=url_train,".\\data\\Coursera-SwiftKey.zip")
    }
    
    #check if file is already unzipped
    if(!file.exists('.\\data\\final\\en_US')){
        unzip('.\\data\\Coursera-SwiftKey.zip',exdir='.\\data')
    }
    
    #copy the files into the working directory
    #source: http://stackoverflow.com/questions/2384517/using-r-to-copy-files
    flist <- list.files(".\\data\\final\\en_US", "^en_US.+[.]txt$", full.names = TRUE)
    file.copy(flist, ".\\")
}

#quiz question 2

twitter <- readLines(con <- file("./en_US.twitter.txt", "r"))
close(con)
length(twitter)
#answer: 2360148

#quiz question 3

fileName="en_US.blogs.txt"
con=file(fileName,open="r")
lineBlogs=readLines(con) 
close(con)

fileName="en_US.news.txt"
con=file(fileName,open="r")
lineNews=readLines(con) 
close(con)

fileName="en_US.twitter.txt"
con=file(fileName,open="r")
lineTwitter=readLines(con)
close(con)

#require(stringi)
lenBlogs<-stri_length(lineBlogs)
max(longBlogs)
lenNews<-stri_length(lineNews)
max(longNews)
lenTwitter<-stri_length(lineTwitter)
max(longTwitter)

#quiz question 4

#Word "love"
loveTwitter<-grep("love",lineTwitter)
length(loveTwitter)
#Word "hate"
hateTwitter<-grep("hate",lineTwitter)
length(hateTwitter)
#Divide love by hate
90956/22138

#quiz question 5

biostatsTwitter<-grep("biostats",lineTwitter)
lineTwitter[biostatsTwitter]


#quiz question 6

sentenceTwitter<-grep("A computer once beat me at chess, but it was no match for me at kickboxing",lineTwitter)
length(sentenceTwitter)
#3

##What do the data look like?

head(lineTwitter)
head(lineNews)
head(lineBlogs)

#Tasks to accomplish - Week 2

## 1. Exploratory analysis - perform a thorough exploratory analysis of the data, understanding the distribution
## of words and relationship between the words in the corpora.
## 2. Understand frequencies of words and word pairs - build figures and tables to understand variation in the 
## frequencies of words and word pairs in the data.

#Random Sampling of the Large Files
index <- sample(1:length(lineBlogs),50000)
subLineBlogs <- lineBlogs[index]
#source for random sampling: http://www.dummies.com/programming/r/how-to-take-samples-from-data-in-r/

#Convert into String
sSubLineBlogs <- as.String(subLineBlogs)

#Annotate the Sampled Text
word_ann <- Maxent_Word_Token_Annotator()
sent_ann <- Maxent_Sent_Token_Annotator()
blog_annotations <- annotate(sSubLineBlogs, list(sent_ann, word_ann))
blog_doc <- AnnotatedPlainTextDocument(bio, bio_annotations)

#First few words
words(blog_doc) %>% head(10)