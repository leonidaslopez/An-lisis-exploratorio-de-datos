datatraining <- read.csv(url("https://www.dropbox.com/s/r0fxlta0tyqkwax/datatraining.txt?dl=1"))
datatraining$date <- as.POSIXct(datatraining$date,tz="UTC")
# Exploratory Figure
library(ggplot2)
library(grid)
library(gridExtra)
library(scales)

pushViewport(viewport(layout = grid.layout(6, 1)))

grafica1 <- ggplot(datatraining,aes(date))+geom_line(color="Red",aes(y=Temperature))+ylab("Temperature")+xlab("Time")+
  scale_x_datetime(breaks=date_breaks("60 min"),labels=date_format("%H:%M"),limits=as.POSIXct(c("2015-02-05 8:00","2015-02-06 9:00"),tz="GMT"))+
  theme(axis.text.x=element_text(angle=90,hjust=1))        

grafica2 <- ggplot(datatraining,aes(date))+geom_line(color="Blue",aes(y=Humidity))+ylab("Humidity")+xlab("Time")+
  scale_x_datetime(breaks=date_breaks("60 min"),labels=date_format("%H:%M"),
                   limits=as.POSIXct(c("2015-02-05 8:00","2015-02-06 9:00"),tz="GMT"))+
  theme(axis.text.x=element_text(angle=90,hjust=1))        

grafica3 <- ggplot(datatraining,aes(date))+geom_line(color="deepskyblue1",aes(y=HumidityRatio))+ylab("HumidityRatio")+xlab("Time")+
  scale_x_datetime(breaks=date_breaks("60 min"),labels=date_format("%H:%M"),
                   limits=as.POSIXct(c("2015-02-05 8:00","2015-02-06 9:00"),tz="GMT"))+
  theme(axis.text.x=element_text(angle=90,hjust=1))        

grafica4 <- ggplot(datatraining,aes(date))+geom_line(color="Green",aes(y=CO2))+ylab("CO2 (ppm)")+xlab("Time")+
  scale_x_datetime(breaks=date_breaks("60 min"),labels=date_format("%H:%M"),
                   limits=as.POSIXct(c("2015-02-05 8:00","2015-02-06 9:00"),tz="GMT"))+
  theme(axis.text.x=element_text(angle=90,hjust=1))        

grafica5 <- ggplot(datatraining,aes(date))+geom_line(color="gold4",aes(y=Light))+ylab("Light (Lux)")+xlab("Time")+
  scale_x_datetime(breaks=date_breaks("60 min"),labels=date_format("%H:%M"),
                   limits=as.POSIXct(c("2015-02-05 8:00","2015-02-06 9:00"),tz="GMT"))+
  theme(axis.text.x=element_text(angle=90,hjust=1))        

grafica6 <- ggplot(datatraining,aes(date))+geom_line(color="Black",aes(y=as.numeric(Occupancy)))+ylab("Occupancy")+xlab("Time")+
  scale_x_datetime(breaks=date_breaks("60 min"),labels=date_format("%H:%M"),
                   limits=as.POSIXct(c("2015-02-05 8:00","2015-02-06 9:00"),tz="GMT"))+
  theme(axis.text.x=element_text(angle=90,hjust=1))  

print(grafica1, vp = viewport(layout.pos.row = 1, layout.pos.col = 1))
print(grafica2, vp = viewport(layout.pos.row = 2, layout.pos.col = 1))
print(grafica3, vp = viewport(layout.pos.row = 3, layout.pos.col = 1))
print(grafica4, vp = viewport(layout.pos.row = 4, layout.pos.col = 1))
print(grafica5, vp = viewport(layout.pos.row = 5, layout.pos.col = 1))
print(grafica6, vp = viewport(layout.pos.row = 6, layout.pos.col = 1))
