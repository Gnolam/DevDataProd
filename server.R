
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyServer(function(input, output) {

  Calc_Z_Score <- reactive({
    as.numeric(input$tot_assets)
    TA <- as.numeric(input$tot_assets)
    TL <- as.numeric(input$tot_liabilities)
    Z<-0

    if (TA>0)
    {
      T1 <- as.numeric(input$wk_capital)  / TA
      T2 <- as.numeric(input$ret_earnings)  / TA
      T3 <- as.numeric(input$EBIT) / TA
      T4 <- as.numeric(input$mval_equity) / TL
      T5 <- as.numeric(input$sales)/ TA

      Z <- 1.2*T1 +1.4*T2 + 3.3*T3 + 0.6*T4 + 0.99*T5
    }
    else
      Z<-0

  })

  output$z_score <- renderText({
    sprintf("Z = %2.2f", Calc_Z_Score())
  })

  output$z_score_text <- renderText({
    Z <- Calc_Z_Score()

    if (Z > 2.6){
      ret<-"Safety Zone"}
    else if (Z>1.1){
      ret<-"Gray Zone"}
    else{
      ret<-"Red (Bankrupt) Zone  "}
    ret

    sprintf("Rating = %s", ret)
  })


  output$z_Grade <- renderImage({
    Z <- Calc_Z_Score()

#    fName <-"Safety_Zone.jpg")

    if (Z > 2.6){
      fName <-"Safety_Zone"}
    else if (Z>1.1){
      fName <-"Gray_Zone"}
    else{
      fName <-"Red_Zone"}

    ret<-list(src = paste0("./Image/",fName,".jpg"))

 }, deleteFile = FALSE)

})
