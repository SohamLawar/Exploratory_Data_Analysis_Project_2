if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
y5 <-  subset(NEI,fips == "24510" & type == "ON-ROAD" , remove.na  = T)
#sum of emission per year
s5 <- aggregate(Emissions ~ year,y5,sum)

attach(s5)

#plot
g <- ggplot(s5, aes(factor(year), Emissions))

g <- g + geom_bar(stat = "identity") + 
  xlab("year") + ylab(expression('total PM'[2.5]*" emission")) + 
  ggtitle('Total Emissions from Motor Vehicles Changed from 1999 to 2008 in Baltimore City, MD')


print(g)


# Save file
dev.copy(png, file = "plot5.png")
dev.off()