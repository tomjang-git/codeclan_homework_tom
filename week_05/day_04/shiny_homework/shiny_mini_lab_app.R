
library(shiny)
library(dplyr)
library(ggplot2)
library(CodeClanData)

olympics_overall_medals <- CodeClanData::olympics_overall_medals

ui <- fluidPage(
    titlePanel("Five Country Medal Comparison"),
    
    sidebarLayout(
        sidebarPanel(
            radioButtons("season",
                         "Summer or Winter Olympics?",
                         choices = c("Summer", "Winter")
            ),
            
            radioButtons("medal",
                         "Compare Which Medals?",
                         choices = c("Gold", "Silver", "Bronze")
            )
        ),
        
        mainPanel(
            plotOutput("medal_plot")
        )
    )
)

server <- function(input, output) {
    
    
    output$medal_plot <- renderPlot({
        olympics_overall_medals %>%
            filter(team %in% c("United States",
                               "Soviet Union",
                               "Germany",
                               "Italy",
                               "Great Britain")) %>%
            filter(medal == input$medal) %>%
            filter(season == input$season) %>%
            ggplot() +
            aes(x = team, y = count, fill = medal) +
            geom_col() +
            scale_fill_manual(values = case_when(
              medal == "Gold" ~ "#fcba03",
              medal == "Silver" ~ "#C0C0C0",
              medal == "Bronze" ~ "#cd7f32"
            ))
        
    })
}

shinyApp(ui = ui, server = server)

