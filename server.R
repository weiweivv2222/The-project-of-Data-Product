library(shiny)
library(ggplot2)
library(corrplot)
library(reshape2)
library(clusterSim)
# Load data
data(mtcars)
data <- mtcars

# Define server logic required to plot correlation
shinyServer(function(input, output) {
        
        #  1) PRINT A REACTIVE TITLE
        
        
        text <- reactive({
                paste('Correlation between',  input$choice1, '&', input$choice2,'&', input$choice3, '&', input$choice4)
        })      
        text1 <- reactive({
                paste('Boxplot between normalized data: ',  input$choice1, '&', input$choice2,'&', input$choice3, '&', input$choice4)
        })     
        
        text2 <- reactive({
                paste('Summary table of original data: ',  input$choice1, '&', input$choice2,'&', input$choice3, '&', input$choice4)
        })    
        # Return as text the selected variables
        output$caption <- renderText({
                text()
        })
        
        output$bxcaption <- renderText({
                text1()
        })
     
        output$summarycaption <- renderText({
                text2()
        })
     
        # 2) RETURN THE REQUESTED DATASET
        input1  <- reactive({
                switch(input$choice1, 
                       "Displacement (cu.in.)" = data$disp,
                       "Miles/(US) gallon" = data$mpg,
                       "Number of cylinders"  = data$cyl,
                       "Gross horsepower"  = data$hp,
                       "Weight (lb/1000)" =data$wt )
        })
        
        input2  <- reactive({
                switch(input$choice2, 
                       "Displacement (cu.in.)" = data$disp,
                       "Miles/(US) gallon" = data$mpg,
                       "Number of cylinders"  = data$cyl,
                       "Gross horsepower"  = data$hp,
                       "Weight (lb/1000)" =data$wt )
        })
        
        input3  <- reactive({
                switch(input$choice3, 
                       "Displacement (cu.in.)" = data$disp,
                       "Miles/(US) gallon" = data$mpg,
                       "Number of cylinders"  = data$cyl,
                       "Gross horsepower"  = data$hp,
                       "Weight (lb/1000)" =data$wt )
        })
        
        input4  <- reactive({
                switch(input$choice3, 
                       "Displacement (cu.in.)" = data$disp,
                       "Miles/(US) gallon" = data$mpg,
                       "Number of cylinders"  = data$cyl,
                       "Gross horsepower"  = data$hp,
                       "Weight (lb/1000)" =data$wt )
        })
        
        
        
        # Generate a plot of the requested variables
        output$plot <- renderPlot({
                matrix <- data.frame(input1(), input2(), input3(), input4())
                corr_matrix <- cor(matrix)
                corrplot.mixed(corr_matrix, order="AOE", upper="circle",                
                               tl.pos="lt",tl.col="black", tl.cex=1, tl.srt=0,                          
                               diag = "u" )
        })
        
        output$boxplot <- renderPlot({
                dat <- data.frame(input1(), input2(), input3(), input4())
                dat <-data.Normalization(dat,type="n1",normalization="column")
                dat <- melt(dat)
                ggplot(dat, aes(x=variable, y=value,fill=variable))+geom_boxplot()
        })
        
        
        
        # Generate a summary of the dataset
        output$summary <- renderPrint({
                dataset <- data.frame(input1(), input2(), input3(), input4())
                summary(dataset)
        })
        
        
        
        
})     
