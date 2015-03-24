#list of files
#create output object (list) to hold the input files
#read in the files
#coerce list to data frame
#subset the data
#calculate

files_full <- list.files("specdata", full.names=T)

tmp <- vector(mode = "list", length = length(files_full))

tmp <- lapply(files_full, read.csv)

output <- do.call(rbind, tmp)

output_subset <- x[which(!is.na(x[,pollutant]) & x[,"ID"] == id),]

mean(output_subset)


test_function <- function(x,pollutant,id){
        y <- x[which(!is.na(x[,pollutant]) & x[,"ID"] == id),]
        mean(y[,pollutant])
}


pollutantmean <- function(directory, pollutant, id = 1:332) {
          
          files_full <- list.files(directory, full.names=T)
          
          tmp <- vector(mode = "list", length = length(files_full))
          
          tmp <- lapply(files_full, read.csv)
          
          output <- do.call(rbind, tmp)
          
          output_subset <- output[which(!is.na(output[,pollutant]) & output[,"ID"] %in% id),]
          
          mean(output_subset[,pollutant])
}