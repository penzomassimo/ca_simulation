
# Loading the libraries
base::library("FactoMineR")
base::library("factoextra")
base::library("gplots")
base::library("graphics")
base::library("ca")

# Simulation parameters
sample_size <- 1000
number_row_cat <- 5
number_column_cat <- 10

# Defining categories
row_categories <- c("row_1", "row_2", "row_3")
column_categories <- c("col_1", "col_2", "col_3", "col_4")

# Generating samples
row_sample <- base::sample(row_categories, size = sample_size , replace = TRUE)
column_sample <- base::sample(column_categories, size = sample_size , replace = TRUE)

# Creating data frame
data <- data.frame(row_sample, column_sample)
head(data)
# Converting factors to numeric values
data$row_sample <- as.numeric(data$row_sample)
data$column_sample <- as.numeric(data$column_sample)
head(data)

# Creating contigency table
cont_table <- base::table(data$row_sample, data$column_sample)
cont_table

# 2. Graph
gplots::balloonplot(t(cont_table),
            main ="CA Simulation - Balloon Plot",
            xlab ="Columns",
            ylab="Rows",
            dotcolor = "black",
            dotchar = 19,
            label = FALSE,
            label.lines = FALSE,
            cum.margins = FALSE,
            show.margins = TRUE)

graphics::mosaicplot(t(cont_table),
                     shade = TRUE,
                     las = 2,
                     main = "CA Simulation - Mosaic Plot")


res.ca <- FactoMineR::CA(data, ncp = 5, graph = TRUE)
res.ca
summary(res.ca, nb.dec = 2, ncp = 2)





