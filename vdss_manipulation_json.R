library(jsonlite)

json_files <- list.files(path = "~/", pattern = "*v1.json") # center names

head(json_files)

center_names <- lapply(X = json_files, FUN = read_json, simplifyVector = FALSE, simplifyDataFrame = TRUE)

json_files <- list.files(path = "~/", pattern = "*v2.json") # center addresses

print(json_files)

center_addresses <- lapply(X = json_files, FUN = read_json, simplifyVector = FALSE, simplifyDataFrame = TRUE)

json_files <- list.files(path = "~/", pattern = "*v3.json") # center phone numbers

print(json_files)

center_numbers <- lapply(X = json_files, FUN = read_json, simplifyVector = FALSE, simplifyDataFrame = TRUE)

labels <- substr(json_files, 1, regexpr(pattern = "_v\\d.json", json_files) - 1)

outfile <- data.frame(cbind(labels[1], center_names[[1]]$text, center_addresses[[1]]$text), stringsAsFactors = FALSE)

for (i in 2:8){
  outfile <- rbind(outfile, data.frame(cbind(labels[i], center_names[[i]]$text, center_addresses[[i]]$text), stringsAsFactors = FALSE))  
}

names(outfile) <- c("label", "center_names", "center_address")

url <- 'https://maps.googleapis.com/maps/api/geocode/json?address='

key <- writeLines(con = "~/api_key")

requests <- paste0(url, gsub(pattern = " ", replace = "+", x = gsub(pattern = "\\.", replace = "", x = outfile$center_address)), key)

writeLines(requests, con = "~/vdss_requests.txt", sep = "\n")