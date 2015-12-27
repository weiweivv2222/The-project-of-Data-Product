library(shiny)
library(datasets)
library(shiny)

# Define which layout sould be used 
shinyUI(pageWithSidebar(
        
        # ELEMENT 1: contains the main title,
        headerPanel("Exploratory Data Analysis of the dataset mtcar"),
     
        # ELEMENT 2: Sidebar element which can contains mutli sliders and some cusotmed HTML 
        sidebarPanel(
              
                #help text        
                
                helpText("The function of this application is used to present the basic visualizations, such as
                         correlation, boxplot, and summary tables of selected variables"),
                
                helpText("The correlation matrix based on the original data, whereas the boxplot is applied on the normalized data."),
                
                helpText("According to the summary table, it shows the mean of all variables and other propotions"),
                
                helpText("Therefore, we can compute the plots and a table of selected variables of the mtcars dataset."),
                # Slider: choose first variable
                selectInput("choice1", "First variable:",
                            choices = c("Miles/(US) gallon",  
                                        "Number of cylinders", 
                                        "Displacement (cu.in.)",
                                        "Gross horsepower",
                                        "Weight (lb/1000)"
                            )),
                
                
                
                # Slider: choose second variable
                selectInput("choice2", "Second variable:",
                            choices = c("Miles/(US) gallon",  
                                        "Number of cylinders", 
                                        "Displacement (cu.in.)",
                                        "Gross horsepower",
                                        "Weight (lb/1000)"
                            )),
                
                
                # Slider: choose third variable
                selectInput("choice3", "Third variable:",
                            choices = c("Miles/(US) gallon",  
                                        "Number of cylinders", 
                                        "Displacement (cu.in.)",
                                        "Gross horsepower",
                                        "Weight (lb/1000)"
                            )),
        
                # Slider: choose forth variable
                selectInput("choice4", "Forth variable:",
                    choices = c("Miles/(US) gallon",  
                                "Number of cylinders", 
                                "Displacement (cu.in.)",
                                "Gross horsepower",
                                "Weight (lb/1000)"
                           ))
        ),
        
        
        # ELEMENT 3: Main content element
        mainPanel(
                h3('Visualization of mtcars:'),
                h6(textOutput("caption"), style = "color:blue"),
                plotOutput("plot", width = "600", height="300px"),
                h6(textOutput("bxcaption"), style = "color:blue"),
                plotOutput("boxplot", width = "600", height="300px"),
                h6(textOutput("summarycaption"), style = "color:blue"),
                verbatimTextOutput("summary" )
        )
        
        
        ))

