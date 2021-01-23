#Bismarko Nobilas 123180145
library(xml2)
library(rvest)

url <- "https://www.imdb.com/search/title/?title_type=feature&groups=top_1000&count=250"
html <- read_html(url)

runtime_data_laman <- html_nodes(html,'.runtime')
runtime_data <- html_text(runtime_data_laman)
runtime_data <- gsub(" min","",runtime_data)
runtime_data <- as.numeric(runtime_data)

genre_data_html <- html_nodes(html,'.genre') 
genre_data <- html_text(genre_data_html)
genre_data <- gsub("\n","",genre_data)
genre_data <- gsub(" ","",genre_data)
genre_data <- gsub(",.*","",genre_data)
genre_data <- as.factor(genre_data)

rating_data_laman <- html_nodes(html,'.ratings-imdb-rating strong')
rating_data <- html_text(rating_data_laman)
rating_data <- as.numeric(rating_data)
year_data_laman <- html_nodes(html,'.lister-item-year')
year_data <- html_text(year_data_laman)
year_data <- gsub(")","",year_data)
year_data <- gsub("\\(","",year_data)
year_data <- as.numeric(year_data)

runtime <- runtime_data
genre <- genre_data
rating <- rating_data
year <- year_data

url <- "https://www.imdb.com/search/title/?title_type=feature&groups=top_1000&count=250&start=251&ref_=adv_nxt"
html2 <- read_html(url)

runtime_data_laman <- html_nodes(html2,'.runtime')
runtime_data <- html_text(runtime_data_laman)
runtime_data <- gsub(" min","",runtime_data)
runtime_data <- as.numeric(runtime_data)

genre_data_html <- html_nodes(html2,'.genre') 
genre_data <- html_text(genre_data_html)
genre_data <- gsub("\n","",genre_data)
genre_data <- gsub(" ","",genre_data)
genre_data <- gsub(",.*","",genre_data)
genre_data <- as.factor(genre_data)

rating_data_laman <- html_nodes(html2,'.ratings-imdb-rating strong')
rating_data <- html_text(rating_data_laman)
rating_data <- as.numeric(rating_data)

year_data_laman <- html_nodes(html2,'.lister-item-year')
year_data <- html_text(year_data_laman)
year_data <- gsub(")","",year_data)
year_data <- gsub("\\(","",year_data)
year_data <- as.numeric(year_data)

runtime <- c(runtime,runtime_data)
genre <- c(as.character(genre),as.character(genre_data))
rating <- c(rating,rating_data)
year <- c(year,year_data)

url <- "https://www.imdb.com/search/title/?title_type=feature&groups=top_1000&count=250&start=501&ref_=adv_nxt"
html3 <- read_html(url)

runtime_data_laman <- html_nodes(html3,'.runtime')
runtime_data <- html_text(runtime_data_laman)
runtime_data <- gsub(" min","",runtime_data)
runtime_data <- as.numeric(runtime_data)

genre_data_html <- html_nodes(html3,'.genre') 
genre_data <- html_text(genre_data_html)
genre_data <- gsub("\n","",genre_data)
genre_data <- gsub(" ","",genre_data)
genre_data <- gsub(",.*","",genre_data)
genre_data <- as.factor(genre_data)

rating_data_laman <- html_nodes(html3,'.ratings-imdb-rating strong')
rating_data <- html_text(rating_data_laman)
rating_data <- as.numeric(rating_data)

year_data_laman <- html_nodes(html3,'.lister-item-year')
year_data <- html_text(year_data_laman)
year_data <- gsub(")","",year_data)
year_data <- gsub("\\(","",year_data)
year_data <- as.numeric(year_data)

runtime <- c(runtime,runtime_data)
genre <- c(as.character(genre),as.character(genre_data))
rating <- c(rating,rating_data)
year <- c(year,year_data)


url <- "https://www.imdb.com/search/title/?title_type=feature&groups=top_1000&count=250&start=751&ref_=adv_nxt"
html4 <- read_html(url)

runtime_data_laman <- html_nodes(html4,'.runtime')
runtime_data <- html_text(runtime_data_laman)
runtime_data <- gsub(" min","",runtime_data)
runtime_data <- as.numeric(runtime_data)

genre_data_html <- html_nodes(html4,'.genre') 
genre_data <- html_text(genre_data_html)
genre_data <- gsub("\n","",genre_data)
genre_data <- gsub(" ","",genre_data)
genre_data <- gsub(",.*","",genre_data)
genre_data <- as.factor(genre_data)

rating_data_laman <- html_nodes(html4,'.ratings-imdb-rating strong')
rating_data <- html_text(rating_data_laman)
rating_data <- as.numeric(rating_data)

year_data_laman <- html_nodes(html4,'.lister-item-year')
year_data <- html_text(year_data_laman)
year_data <- gsub(")","",year_data)
year_data <- gsub("\\(","",year_data)
year_data <- as.numeric(year_data)

runtime <- c(runtime,runtime_data)
genre <- c(as.character(genre),as.character(genre_data))
rating <- c(rating,rating_data)
year <- c(year,year_data)

genre <- as.factor(genre)

kumpulan_data <-data.frame(Runtime = runtime, Genre = genre,
                           Rating = rating, Year = year)
str(kumpulan_data)

library('ggplot2')
qplot(data = kumpulan_data,Runtime,fill = Genre,bins = 30)

ggplot(kumpulan_data,aes(x=Runtime,y=year))+
  geom_point(aes(size=Rating,col=Genre))

write.csv(kumpulan_data, "DataTopFilm.csv",row.names = F)
getwd()
