# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)
library(ggplot2)
library(plotly)
data("diamonds")

# Define a server for the Shiny app
shinyServer(
        function(input, output) {
        
                # set parameters to be used in Plotly chart
        font <- list(family = "Courier New, monospace", size = 18, 
                     color = "#7f7f7f")
        x <- list(title = "Euro", titlefont = font)
        y <- list(title = "Carats",titlefont = font)
                
        # Fill in the spot we created for a plot
        plot1 <- reactive({
                dmds <- diamonds
                dmds <- dmds[dmds$color == input$color,] # filter color
                dmds <- dmds[dmds$price <= input$price[2] & dmds$price >= input$price[1],]
                
                # Render a barplot
                plot_ly(dmds, x=dmds$price, 
                        y=dmds$carat,
                        color = as.factor(dmds$clarity)) %>%
                        layout(xaxis = x, yaxis = y)
                })
        output$priceCarat <- renderPlotly({
                return(plot1())
                })
        }
)