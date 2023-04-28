#' Cleancorpus function
#'
#' This function is a part of the dendrogrammer function, but can be used on its own.
#' This function will take a corpus and clean it to be used for other forms of text mining
#' by removing capitalization, punctuation, whitespace, numbers, and stopwords
#'
#' @param corpus A set of unstructured texts in a dataframe
#' @returns A cleaned corpus dataframe
#' @examples
#' corpus <- DataframeSource(airbnbdf)
#' corpus <- VCorpus(corpus)
#' corpus <- cleancorpus(corpus)
cleancorpus <- function(corpus){
  cat("checking for required package")
  require("tm")
  corpus <- tm_map(corpus, content_transformer(tolower))
  corpus <- tm_map(corpus, removePunctuation)
  corpus <- tm_map(corpus, stripWhitespace)
  corpus <- tm_map(corpus, removeNumbers)
  corpus <- tm_map(corpus, removeWords, c(stopwords("en")))
  return(corpus)
}
