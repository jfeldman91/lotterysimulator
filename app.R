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
           ". ",
           "If you play once per week, you can expect to win every ",
           format((1/x)/365.25, big.mark = ","),
           " years.",
           sep = "")
   })
}

shinyApp(ui = ui, server = server)
