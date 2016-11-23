#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
require(markdown)
library(plotly)

# Use a fluid Bootstrap layout
shinyUI(    
        navbarPage("Diamonds characteristics navigation app", 
                   # multi-page user-interface that includes a navigation bar.
                   tabPanel("Parameters selection",
                            sidebarPanel(
                                   selectInput("color", 
                                               "Color:", 
                                                choices = c('D'='D', 'E'='E','F'='F', 'G'='G', 'H'='H', 'I'='I', 'J'='J')),
                                   helpText("Data from Diamonds dataset from ggplot library."),
                                   
                                   
                                   sliderInput("price", 
                                               "Price range:", 
                                               min=min(diamonds$price), 
                                               max=max(diamonds$price), 
                                               value=c(1000,5000))
                                        ), # end of sidebarPanel
                             # end of tabPanel
                             # Create a spot for the barplot
                            mainPanel(
                                    tabsetPanel(
                                            tabPanel(p(icon("line-chart"), "Charts"),
                                                plotlyOutput("priceCarat")  
                                                    ) #end of mainPanel
                                                )
                                     ) # end of mainPanel
                   ),
                   tabPanel("About",
                            mainPanel(
                                    includeMarkdown("about.md")
                            )
                   ) # end of "About" tab panel
        ) #end of navbar page   
       

) # end of shinyUI
