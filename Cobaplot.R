# library
library(ggplot2)
library(viridis)
library(hrbrthemes)
library(here)
library(vroom)
library(dplyr)
library(plotly)
library(packcircles)
library(reshape2)
library(conflicted)

library(ggraph)
library(igraph)

# create a dataset
main_data <- vroom(here::here("Proyek-DS", "Jumlah_Penyebab_Kematian_Jawa_Barat.csv"))

appp <- c("KABUPATEN SUBANG","KABUPATEN SUKABUMI")
data <- main_data %>% filter(nama_kota_kabupaten %in% appp)


data <- main_data[c(3,4,5,6)]
grafik <- data %>% filter(input$dasar %in% input$utama) %>%
  filter(varble %in% input$var)

# Small multiple
ggplot(main_data, aes(fill=penyebab, y=kematian, x=jumlah)) + 
  geom_bar(position="stack", stat="identity") 


main_data %>%
  filter(kematian %in% "KOTA BOGOR") %>%
  # filter(nama_kota_kabupaten %in% "KEMATIAN BALITA") %>%
  ggplot(aes(fill=penyebab, y=kematian, x=jumlah)) +
  geom_bar(position="stack", stat="identity") +
  scale_fill_viridis(discrete = T) +
  ggtitle("Studying 4 species..") +
  theme_ipsum() +
  xlab("")

apa <- main_data %>% filter(nama_kota_kabupaten %in% NULL)
apa
