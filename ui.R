library(shiny)

shinyUI(fluidPage(
    titlePanel("US violence per state"),
    sidebarLayout(
        sidebarPanel(
            ui <- fluidPage(
                radioButtons("plot_type", "Plot information:",
                             c("Murders vs assults" = "tot",
                               "Compensated for percentage urban people" = "pc")
                             )
            )
        ),
        mainPanel(
                h3("main panel"),
                plotOutput("plot")
        )
    )
))