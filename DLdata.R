#Tasks to accomplish

## 1. Obtaining the data - Can you download the data and load/manipulate it in R?
## 2. Familiarizing yourself with NLP and text mining - Learn about the basics of natural language processing and 
## how it relates to the data science process you have learned in the Data Science Specialization.

library(stringi)

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

#Questions to consider Week 1

##What do the data look like?

head(lineTwitter)
head(lineNews)
head(lineBlogs)

##Where do the data come from?
##Can you think of any other data sources that might help you in this project?
##What are the common steps in natural language processing?
##What are some common issues in the analysis of text data?
##What is the relationship between NLP and the concepts you have learned in the Specialization?

#Tasks to accomplish

## 1. Exploratory analysis - perform a thorough exploratory analysis of the data, understanding the distribution
## of words and relationship between the words in the corpora.
## 2. Understand frequencies of words and word pairs - build figures and tables to understand variation in the 
## frequencies of words and word pairs in the data.

#Questions to consider Week 2

##Some words are more frequent than others - what are the distributions of word frequencies?
##What are the frequencies of 2-grams and 3-grams in the dataset?
##How many unique words do you need in a frequency sorted dictionary to cover 50% of all word instances in the language? 90%?
##How do you evaluate how many of the words come from foreign languages?
##Can you think of a way to increase the coverage -- identifying words that may not be in the corpora or using a smaller number of words in the dictionary to cover the same number of phrases?