## this function calculates the mean of a pollutant across a 
## specified list of monitor ID numbers.

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
          ## create a character vector of the CSV files to combine
          files_full <- list.files(directory, full.names=T)
          ## create an empty list to read in the CSV files
          tmp <- vector(mode = "list", length = length(files_full))
          ## loop through the CSV files and read them into the list
          tmp <- lapply(files_full, read.csv)
          ## coerce the list elements containing the CSV data
          ## into a single data frame
          output <- do.call(rbind, tmp)
          ## subset the data based on arguments for pollutant and 
          ## monitor IDs. this step also excudes NA values.
          output_subset <- output[which(!is.na(output[,pollutant]) & output[,"ID"] %in% id),]
          ## calculate and print the mean. NA values were already
          ## excluded from the output_subset.
          mean(output_subset[,pollutant])
}