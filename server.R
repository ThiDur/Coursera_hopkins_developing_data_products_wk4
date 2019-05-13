library(shiny)
shinyServer(function(input, output){
    data(USArrests)
    df <- data.frame(USArrests)
    df <- cbind(df, states=row.names(df))
    df$states <- as.character(df$states)
    tbl_arrests <-as_tibble(df)

    elections <- read.csv2("2012_elections.csv")
    elections$win <- ifelse(as.numeric(as.character(elections$num_Obama)) > as.numeric(as.character(elections$num_Romney)), "blue", "red")
    elections$State <- as.character(elections$State)
    tbl_elections <- as_tibble(elections)
    
    tbl_total <- left_join(tbl_arrests, tbl_elections, by=c("states" = "State"))
    
    output$plot <- renderPlot({
        if (input$plot_type == 'pc'){
            tbl_total$murders_per_capita <- df$Murder * df$UrbanPop
            tbl_total$assualts_per_capita <- df$Assault * df$UrbanPop
            plot(
                murders_per_capita ~ assualts_per_capita,
                data=tbl_total,
                xlab="Assault arrests per 100.000 people * percentage urban population",
                ylab="Murder arrests per 100.000 people * percentage urban population",
                main="Assaults per 100.000 people versus murders per 100.000 people\n
                Per US state, coloured by 2012 election results (Obama or Romny win)",
                col=win
            )
            text(
                tbl_total$assualts_per_capita, tbl_total$murders_per_capita,
                labels=tbl_total$State_short, cex= 0.7, pos=2
            )
            legend("topleft", legend=c("Obama win in 2012", "Romny win in 2012"),
                   col=c("blue", "red"), lty=1:2, cex=0.8)
        }
        else {
            plot(Murder ~ Assault,
                 data=tbl_total,
                 xlab="Assault arrests per 100.000 people",
                 ylab="Murder arrests per 100.000 people",
                 main="Assaults per 100.000 people versus murders per 100.000 people\n
                 Per US state, coloured by 2012 election results (Obama or Romny win)",
                 col=win
                 )
            text(
                tbl_total$Murder, tbl_total$Assault,
                labels=tbl_total$State_short, cex= 0.7, pos=2
            )
            legend("topleft", legend=c("Obama win in 2012", "Romny win in 2012"),
                   col=c("blue", "red"), lty=1:2, cex=0.8)
        }
    })
})