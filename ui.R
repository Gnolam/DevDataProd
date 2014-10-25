
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(navbarPage("Altman Z-score",

   # Application title
   tabPanel("Credit Grade Assessment",

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
      width = 3)
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
    )),
    tabPanel("Methodology",
             h3("How to use"),
             helpText('Please enter your financials in order to receive grade assessment'),
             h3("Where the logic for background calculation is coming from"),
             helpText('Methodology is taken from the ',a("Wikipedia article on Altman Z-score",href="http://en.wikipedia.org/wiki/Altman_Z-score")),
             h3("How to see different credit grades"),
             helpText('In order to get into Gray zone please set "Total Liabilities" x10 vs default value'),
             helpText('Red zone can be achied by putting "Total Asset" into 0')
    ),

    tabPanel("About",
             h3('Course Project'),
             helpText('This application was developed as the part of ',a("Developing Data Products course",href="https://class.coursera.org/devdataprod-006")),
             h3('Github repository'),
             helpText('The source code for this application can be found at ',a("my Guthub repository",href="https://github.com/Gnolam/DevDataProd"))
    )
))
