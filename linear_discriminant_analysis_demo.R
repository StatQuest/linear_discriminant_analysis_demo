## if you don't have the "MASS" package, install it with:
## install.package("MASS")
require(MASS) 

## if you don't have the ggplot2 package, install it with:
## install.package("ggplot2")
require(ggplot2) 

## Load a sample data set
data("iris")
my.data <- iris
 
## look at the first 6 rows
head(my.data)
 
## create the lda model
model <- lda(formula = Species ~ ., data = my.data)
 
## get the x,y coordinates for the LDA plot
data.lda.values <- predict(model)
 
## create a dataframe that has all the info we need to draw a graph
plot.data <- data.frame(X=data.lda.values$x[,1], Y=data.lda.values$x[,2], Species=my.data$Species)
 
head(plot.data)
 
## draw a graph using ggplot2
p <- ggplot(data=plot.data, aes(x=X, y=Y)) +
    geom_point(aes(color=Species)) +
    theme_bw()
p
## you can save the graph with the following command:
## ggsave(file="my_graph.pdf")
