# CARGAR DATOS
#datatraining <- read.table("datatraining.txt",header=TRUE,sep=",")
datatraining <- read.csv(url("https://www.dropbox.com/s/r0fxlta0tyqkwax/datatraining.txt?dl=1"))

# Formatear la clase de fecha para todo el archivo
datatraining$date <- as.POSIXct(datatraining$date,tz="UTC") 

library(lubridate)
# funcion para tratar los datos de  date/time 
second_day <- function(x) {
  
  s <- hour(x)*3600+minute(x)*60+second(x)
}
weekend_weekday <- function(x) {
  val <- weekdays(x)
  if (val == "Saturday" | val == "Sunday") {
    val2 = "Weekend"
  }
  else {
    val2= "Weekday"
  }
  return(val2)
}

# Agrega la columna NSM
datos <- datatraining
datos$NSM <- second_day(datatraining$date)
# le agrega la fila week 1 o 0 dependiendo de si es o no fin de semana
week<-as.numeric(strftime(datos$date,format ="%d" ))!=7 & as.numeric(strftime(datos$date,format ="%d" ))!=8
week[week==TRUE]<-1
datos[9]<-week

datos$Occupancy <- as.numeric(datatraining$Occupancy)
colnames(datos)<-c("date","Temperature","Humidity","Light","CO2","HumidityRadio","Occupancy","NSM","WeekStatus")
datos<-datos[,c(1,2,3,4,5,6,8,9,7)]

library(ggplot2)
library(grid)
library(gridExtra)
library(scales)

# Pairs plot

cols2 <- character(nrow(datos))
cols2[] <- "black"
cols2[datos$Occupancy %in% c("0")] <- "green"
cols2[datos$Occupancy %in% c("1")] <- "blue"

pairs(datos[2:8], col=cols2, cex=1.1, cex.labels=1.5)