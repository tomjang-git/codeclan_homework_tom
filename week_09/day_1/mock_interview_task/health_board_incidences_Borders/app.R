#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(tidyverse)
library(here)
library(sp)
library(raster) 
library(leaflet)

health_board_incidences_Borders <- read_csv("/Users/user/codeclan_homework_tom/week_09/day_1/mock_interview_task/clean_data/health_board_incidences_Borders.csv")



ui <- fluidPage(
    
    theme = shinytheme("superhero"),
    
    titlePanel("Comparison of Cancer Rates in NHS Borders"),
    
    sidebarLayout(
        sidebarPanel(
            radioButtons("sex",
                         "Male, Female, or all?",
                         choices = c("All", "Male", "Female")
            ),
            
            selectInput("cancer_site", 
                        "Cancer Type",
                        choices = cancers
            )
        ),
        
        mainPanel(
            plotOutput("cancer_plot")
           )
        )
    )
    
    server <- function(input, output) {
        output$cancer_plot <- renderPlot({
            
            health_board_incidences_Borders %>% 
                filter(year >= 2000) %>% 
                filter(sex == input$sex) %>% 
                filter(cancer_site == input$cancer_site) %>% 
                ggplot() +
                aes(x = year, y = crude_rate) +
                geom_col(fill = "#800020") +
                theme(axis.text.x = element_text(angle = 45, vjust = 0.5)) +
                scale_x_continuous(breaks = 2000:2020) +
                geom_smooth(method = "lm")
        })
    }

    shinyApp(ui = ui, server = server)
    