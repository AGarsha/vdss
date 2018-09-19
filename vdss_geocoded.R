library(jsonlite)
library(plyr)

json_files <- list.files(path = "~/vdss_geocoded", full.names = TRUE) # geocoded json files

print(json_files)

simplified <- lapply(X = json_files, FUN = read_json, simplifyVector = FALSE, simplifyDataFrame = TRUE)

outfile <- data.frame(cbind(simplified[[1]]$results$formatted_address
                            , simplified[[1]]$results$geometry$bounds$northeast$lat
                            , simplified[[1]]$results$geometry$bounds$northeast$lng
                            , simplified[[1]]$results$geometry$bounds$southwest$lat
                            , simplified[[1]]$results$geometry$bounds$southwest$lng)
                      , stringsAsFactors = FALSE)

for (i in 2:length(simplified)){
  outfile <- rbind.fill(outfile, data.frame(cbind(simplified[[i]]$results$formatted_address
                                             , simplified[[i]]$results$geometry$bounds$northeast$lat
                                             , simplified[[i]]$results$geometry$bounds$northeast$lng
                                             , simplified[[i]]$results$geometry$bounds$southwest$lat
                                             , simplified[[i]]$results$geometry$bounds$southwest$lng)
                                       , stringsAsFactors = FALSE))
}

complete <- complete.cases(outfile[, 1:5])

final <- outfile[complete == TRUE, 1:5]

names(final) <- c("address", "ne_lat", "ne_lng", "se_lat", "se_lng")

write.table(x = final, file = "~/vdss_final_geocoded.txt", sep = "\t", col.names = FALSE, row.names = FALSE)