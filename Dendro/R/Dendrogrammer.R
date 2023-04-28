#' Dendrogrammer function
#'
#' @param dataframe A dataframe containing the columns "doc_id" and "text"
#' @param x A numeric value between 0 and 1 to write in your own sparsity threshold
#' @returns A dendrogram plot
#' @examples
#' Dendrogrammer(airbnbdf, 0.97)
#'
Dendrogrammer <- function(dataframe, x){
  #check packages
  cat("checking for required libraries")
  require("tm")
  #converts the text data to a corpus and then cleans it with the cleancorpus function
  corpus <- DataframeSource(dataframe)
  corpus <- VCorpus(corpus)
  corpus <- cleancorpus(corpus)
  #creates the TDM to be used for the dendrogram
  tdm <- TermDocumentMatrix(corpus)
  #Converts the data to hclust to be used as a dendrogram
  tdm <- removeSparseTerms(tdm, sparse = x)
  matrix <- as.matrix(tdm)
  dist <- dist(matrix)
  hc <- hclust(dist)
  dendrogram <- as.dendrogram(hc)
  plot(dendrogram)
}
