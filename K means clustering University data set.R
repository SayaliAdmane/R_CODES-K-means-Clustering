Universities<-read.csv("E:/R files/Universities.csv")

# Elbow method
install.packages('factoextra')
library(factoextra)
## wss= within sum of space.. average dist between distance points to find out homogenity
fviz_nbclust(Universities[,-1], kmeans, method = "wss") +
  labs(subtitle = "Elbow method")

###Cluster algorithm building
km <- kmeans(Universities[,-1],4) ### 4 is the optimal cluster because of decreased slope
km$centers
km$cluster
clust<-data.frame("University"=Universities[,1],"cluster"=km$cluster)

##Animation
install.packages("animation")
library(animation)
windows() ### open a new window
km <- kmeans.ani(Universities[,-1], 3)
