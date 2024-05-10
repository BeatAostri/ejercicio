library(readxl)
library(lubridate)
library(dplyr)
dir("Datos")
df<-read_xlsx("Datos/online_retail_II.xlsx")

df$InvoiceDate<-ymd_hms(df$InvoiceDate)
class(df$InvoiceDate)

n_distinct(df$Invoice)

precio_pedido<-df %>% group_by(Invoice, Description) %>% 
  summarize(media=mean(Price*Quantity))
