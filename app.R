library(shiny)

ui <- fluidPage(
  titlePanel("Lottery Simulator"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("n",
                  "Number of balls to choose",
                  min = 1,
                  max = 9,
                  value = 6),
      sliderInput("p",
                  "Number of balls to choose from",
                  min = 10,
                  max = 100,
                  value = 49)
    ),
    mainPanel(
      h4(textOutput("distPlot"))
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderText({
    x <- 1
    n <- input$n
    p <- input$p
    for(i in 1:n) {
      x <- x * n/p
      n <- n - 1
      p <- p-1
    }
    
    paste("Based on the selected criteria, the probability of winning the lottery is 1 in ",
          format(1/x, big.mark = ","),
          ". According to Forbes, you have more chance of ",
          
          if(1/x > 20000000) {
            paste("becoming a saint. ")
          } else if (1/x > 12100000) {
            paste("becoming an astronaut. ")
          } else if (1/x > 11500000) {
            paste("being attacked by a shark. ")
          } else if (1/x > 10000000) {
            paste("becoming President. ")
          } else if (1/x > 5693092) {
            paste("being killed by a tornado. ")
          } else if (1/x > 5000000) {
            paste("dying from scalding hot tap water. ")
          } else if (1/x > 3000000) {
            paste("dying from food poisoning. ")
          } else if (1/x > 2300000) {
            paste("being struck by lightning. ")
          } else if (1/x > 700000) {
            paste("being crushed by a meteor. ")
          } else if (1/x > 662000) {
            paste("winning an Olympic Gold medal. ")
          } else if (1/x > 616488) {
            paste("being killed by fireworks. ")
          } else if (1/x > 11500) {
            paste("winning an Oscar. ")
          } else if (1/x > 10000) {
            paste("being injured by a toilet. ")
          } else if (1/x > 4644) {
            paste("being injured while using a chainsaw. ")
          } else if (1/x > 220) {
            paste("writing a best-selling novel. ")
          } else if (1/x > 215) {
            paste("dating a millionaire. ")
          } else {
            paste("dying from heart disease. ")
          },
          
          "If you play once per week, you can expect to win approximately every ",
          format(round((1/x)/365.25, 0), big.mark = ","),
          " years.",
          sep = "")
    
  })
}

shinyApp(ui = ui, server = server)
