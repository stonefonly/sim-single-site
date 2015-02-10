# server.R

library(shiny)
library(googleVis)

shinyServer(function(input, output) {

  getdata <- function (pt,kd,lx){
    lp=seq(0,lx,length.out = 100)
    lt=lp*pt
    fr=((kd+pt+lt)-((kd+pt+lt)^2-4*pt*lt)^0.5)/(2*pt)
    data.frame(lp,fr)
  }
  
  d1 <- reactive({
    getdata(input$p1,input$k1,input$lx)
  })
  
  d2 <- reactive({
    getdata(input$p2,input$k2,input$lx)
  })
  
  da <- reactive({
    temp = merge(d1(),d2(),by='lp')
    names(temp)=c('L/P Ratio','Bound-1','Bound-2')
    temp
  })

  output$plot <- renderGvis({
    pars=list(
      height=500,
      legend='top',
      hAxis="{title:'L/P Ratio'}",
      vAxis="{title:'Fraction Bound'}",
      colors="['red','blue']"
    )
    gvisLineChart(da(),options=pars)
  })
  
  output$table <- renderGvis({
    pars=list(
      'L/P Ratio'='#.###',
      'Bound-1'='#.###',
      'Bound-2'='#.###'
      )
    gvisTable(da(),formats = pars)
  })
  
})
