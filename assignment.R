##install.packages("xlsx")
library("xlsx")
setwd("/Users/sheetalgolecha/Documents/DMG1/individual assignment")
getwd()

input<-read.xlsx("EastWestAirlinesCluster.xlsx", 2, header=TRUE, colClasses=NA)
mydata <- input[1:3999,2:12]
is.na.data.frame(mydata)

subset(mydata, is.na(mydata$Balance))
input[input$Balance=='NA']


normalized_data <- scale(mydata)
normalized_data
d <- dist(normalized_data, method = "euclidean")   #diagonal matrix
fit <- hclust(d, method="ward")
plot(fit)


rect.hclust(fit, k=2, border="red")
input[3,]
rect.hclust(fit, k=3, border="green")
input[18,]
rect.hclust(fit, k=4, border="blue")
input[c(2,10),]
d
plot(fit) # display dendrogram
rect.hclust(fit, k=4, border="red")



groups <- cutree(fit, k=2) # cut tree into 10 clusters
groups
membership<-as.matrix(groups)
membership

cluster1 <- subset(input,membership[,1]==1) # (tocheck who belongs t which cluster)



colnames(membership)[1] <- "Cluster ID"
flier_list_cluster <- cbind(input,membership)
flier_list_cluster
write.xlsx(flier_list_cluster,file="flier_list_cluster_ward_2.xlsx")







##sample
0.95*3999
sample=input[sample(nrow(input), 3800), ]
flier_list_cluster
write.xlsx(sample,file="sample.xlsx")



##install.packages("xlsx")
library("xlsx")
setwd("/Users/sheetalgolecha/Documents/DMG1/individual assignment")
getwd()

input<-read.xlsx("sample", 2, header=TRUE, colClasses=NA)
mydata <- input[1:3999,2:12]
is.na.data.frame(mydata)

subset(mydata, is.na(mydata$Balance))
input[input$Balance=='NA']


normalized_data <- scale(mydata)
normalized_data
d <- dist(normalized_data, method = "euclidean")   #diagonal matrix
fit <- hclust(d, method="ward")
plot(fit)


rect.hclust(fit, k=2, border="red")
input[3,]
rect.hclust(fit, k=3, border="green")
input[18,]
rect.hclust(fit, k=4, border="blue")
input[c(2,10),]
d
plot(fit) # display dendrogram
rect.hclust(fit, k=4, border="red")



groups <- cutree(fit, k=2) # cut tree into 10 clusters
groups
membership<-as.matrix(groups)
membership

cluster1 <- subset(input,membership[,1]==1) # (tocheck who belongs t which cluster)



colnames(membership)[1] <- "Cluster ID"
flier_list_cluster <- cbind(input,membership)
flier_list_cluster
write.xlsx(flier_list_cluster,file="flier_list_cluster_ward_2.xlsx")



