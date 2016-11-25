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

#establish a connection to file to read lines
con <- file("en_US.twitter.txt", "r")
readLines(con, 1) ## Read the first line of text 
readLines(con, 1) ## Read the next line of text 
readLines(con, 5) ## Read in the next 5 lines of text 
close(con) ## It's important to close the connection when you are done

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

#Questions to consider

##What do the data look like?
##Where do the data come from?
##Can you think of any other data sources that might help you in this project?
##What are the common steps in natural language processing?
##What are some common issues in the analysis of text data?
##What is the relationship between NLP and the concepts you have learned in the Specialization?