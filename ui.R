
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Credit Grade Assessment"),

  # Sidebar with a slider input for number of bins
  sidebarPanel(
    h3("Please enter your financials:"),
    numericInput("tot_assets","Total Assets", value=32000,min=0,max=NA,step=1000),
    numericInput("tot_liabilities","Total Liabilities", value=45000,min=0,max=NA,step=1000),
    numericInput("wk_capital","Working Capital", value=7300,min=0,max=NA,step=1000),
    numericInput("EBIT","EBIT", value=-5000,min=NA,max=NA,step=1000),
    numericInput("ret_earnings","Retained Earnings",value=22000,min=0,max=NA,step=1000),
    numericInput("mval_equity","Market Value of Equity", value=80000,min=0,max=NA,step=1000),
    numericInput("sales","Sales", value=29500,min=0,max=NA,step=1000),
    width = 2)
    ,

  # Show a plot of the generated distribution
  mainPanel(
    h3("Resulting score is:")
    , textOutput("z_score")
    #,    p(HTML('<style type="text/css">.span8 .well { background-color: #00FFFF; }</style>'))
    , h3("Resulting grade span:")
    , textOutput("z_score_text")
    , h3("Sign:")
    , imageOutput("z_Grade")
  )

))
