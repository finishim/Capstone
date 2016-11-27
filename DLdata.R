#Tasks to accomplish

## 1. Obtaining the data - Can you download the data and load/manipulate it in R?
## 2. Familiarizing yourself with NLP and text mining - Learn about the basics of natural language processing and 
## how it relates to the data science process you have learned in the Data Science Specialization.

library(stringi)
library(rJava)
library(NLP)
library(openNLP)
library(RWeka)
library(tm)

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

#Read all the lines of the 3 files
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
#Get the length of the longest line in each file
lenBlogs<-stri_length(lineBlogs)
max(lenBlogs)
lenNews<-stri_length(lineNews)
max(lenNews)
lenTwitter<-stri_length(lineTwitter)
max(lenTwitter)

#Summarize the File Sizes
lines <- c(length(lineBlogs),length(lineNews),length(lineTwitter))
wordBlogs <- sum(stri_count_words(lineBlogs))
wordNews <- sum(stri_count_words(lineNews))
wordTwitter <- sum(stri_count_words(lineTwitter))
words <- c(wordBlogs,wordNews,wordTwitter)
table <- as.data.frame(rbind(lines,words))
colnames(table) <- c("Blogs","News","Twitter")
table

##What do the data look like?

head(lineTwitter)
head(lineNews)
head(lineBlogs)

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
#Reading the text
#Making the data easier to process: remove punctuation, all lowercase, try to correct misspellings
#Try to model relationships between words

##What are some common issues in the analysis of text data?
#misspellings, punctuation, words from different languages.

##What is the relationship between NLP and the concepts you have learned in the Specialization?
#getting data
#cleaning data
#using a prediction model

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
##Can you think of a way to increase the coverage -- identifying words that may not be in the corpora or using a smaller 
##number of words in the dictionary to cover the same number of phrases?

#Random Sampling of the Large Files
set.seed(123)
index <- sample(1:length(lineBlogs),length(lineBlogs)/100)
subLineBlogs <- lineBlogs[index]
set.seed(123)
index <- sample(1:length(lineNews),length(lineNews)/10)
subLineNews <- lineNews[index]
set.seed(123)
index <- sample(1:length(lineTwitter),length(lineTwitter)/100)
subLineTwitter <- lineTwitter[index]
#source for random sampling: http://www.dummies.com/programming/r/how-to-take-samples-from-data-in-r/

#Clean up the Data
#To Lower Case
cleanBlogs <- tolower(subLineBlogs)
cleanNews <- tolower(subLineNews)
cleanTwitter <- tolower(subLineTwitter)
#Remove Punctuation
cleanBlogs <- removePunctuation(cleanBlogs)
cleanNews <- removePunctuation(cleanNews)
cleanTwitter <- removePunctuation(cleanTwitter)
#Remove Numbers
cleanBlogs <- removeNumbers(cleanBlogs)
cleanNews <- removeNumbers(cleanNews)
cleanTwitter <- removeNumbers(cleanTwitter)
#Replace Accented Characters
cleanBlogs <- iconv(cleanBlogs, to = "ASCII//TRANSLIT")
cleanNews <- iconv(cleanNews, to = "ASCII//TRANSLIT")
cleanTwitter <- iconv(cleanTwitter, to = "ASCII//TRANSLIT")
#source: http://stackoverflow.com/questions/18660424/how-to-remove-special-characters-spaces-and-trim-in-one-string-a-character-vari
#Remove Whitespace
cleanBlogs <- stripWhitespace(cleanBlogs)
cleanNews <- stripWhitespace(cleanNews)
cleanTwitter <- stripWhitespace(cleanTwitter)

#Create the Corpus 
corpusB <- Corpus(VectorSource(cleanBlogs))
corpusN <- Corpus(VectorSource(cleanNews))
corpusT <- Corpus(VectorSource(cleanTwitter))

