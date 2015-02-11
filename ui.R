# ui.R

shinyUI(fluidPage(
  titlePanel("Titration-curve simulation for single-site binding systems"),
  helpText("This App is for simulating the titration curve for a simple single-site binding system, assuming 1:1 binding of a receptor P to a gradually-added ligand L forming a PL complex. So you need to specify the initial concentration of total P, the final total-L-over-total-P ratio (L/P ratio), and an assumed dissociation constant Kd. The App will generate a curve for the fraction of bound P [i.e. P/(P+PL)] as a function of L/P ratio. You can simulate two systems at the same time for comparison. For basic concepts, please refer to the following documents:"),
  a(href='http://stonefonly.github.com/sim-single-site-slidify',
         'http://stonefonly.github.com/sim-single-site-slidify'),br(),
  a(href='http://en.wikipedia.org/wiki/Dissociation_constant',
         'http://en.wikipedia.org/wiki/Dissociation_constant'),br(),
  helpText("Please note that all parameters have to be positive values, otherwise meaningless output will be generated."),
  hr(),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Input simulation parameters for the first single-site system (Red curve)"),
      numericInput("p1",label=h4("Total P (uM)"), value=100,min=0),
      numericInput("k1",label=h4("Kd (uM)"), value=1,min=0),
      hr(),
      helpText("Input simulation parameters for the second single-site system (Blue curve)"),
      numericInput("p2",label=h4("Total P (uM)"), value=100,min=0),
      numericInput("k2",label=h4("Kd (uM)"), value=10,min=0),
      hr(),
      helpText("Input final L/P ratio for both systems"),
      numericInput("lx",label=h4("Final L/P ratio"), value=2,min=0)
    ),
    
    mainPanel(
      htmlOutput("plot"),
      htmlOutput("table")      
    )
    
  )
))
