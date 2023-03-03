
#################################################### R E Q U I R E M E N T S #########################

############################################# I M P O R T - D A T A S E T  (nodes and edges csv files )     ----------------->   ###

nodes <- read.csv("nodes.csv", header=TRUE, stringsAsFactors=FALSE)
edges <- read.csv("edges.csv", header=TRUE, stringsAsFactors=FALSE)

# LIBRAIRIES:

packages <- c(
  ("visNetwork"),
  ("shiny")

)
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}   
library(visNetwork)
library(shiny)
library(shinydashboard)

##############################################################################
require(shiny)
require(visNetwork)
##############################################################################
server <- function(input, output) {
  output$network <- renderVisNetwork({
    
    
    
    visNetwork(nodes, edges, main = "SARS-CoV-2 human host protein prptein interaction network collected from literature", width = "100%")%>%
      visOptions(selectedBy = "group")%>%
      visInteraction(navigationButtons = TRUE)%>%
      visGroups(groupname = "main virus", shape="circle",color="red",size=10) %>%
      visGroups(groupname = "viral protein", shape ="circle", size=10,color="yellow") %>%
      visGroups(groupname = "human protein", shape ="circle", size=10, color = "lightblue") %>%
      visLegend(addNodes = list(
        list(label="COVID-19 virus",shape="circle",color="red",size=10),
        list(label="Viral Protein",shape ="circle",size=10,color="yellow"),
        list(label="Host Protein",shape="circle",color="lightblue",size=10)
      ),
       useGroups = FALSE)
  })
}

ui <- dashboardPage(
  skin = "green",
  dashboardHeader(title = "SARS_CoV-2 Host Interaction"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Search", tabName = "search", icon = icon("search"),
               menuSubItem("By viral protein", tabName = "subitem1"),
               menuSubItem("By human protein", tabName = "subitem2"),
               startExpanded = TRUE),
      menuItem("Statistics", tabName = "statistics", icon = icon("chart-line")),
      menuItem("Useful links", tabName = "useful", icon = icon("exclamation-circle")),
      menuItem("Contact", tabName = "contact", icon = icon("id-card"))

    )
  ),
  dashboardBody(
      tabItems(
      # First tab content
        tabItem(tabName = "home",
          fluidRow(style='margin: 0px;',
             box(width='100%',title = "Home", status = "success", solidHeader = FALSE,
               p(style="text-align: justify",h4("Using a combination of keywords including 'SARS-CoV-2 human proteins interactome' on the Pubmed database, we obtained 126 results. We then proceeded with a first manual curation of abstracts to select articles that provided a list of SARS-CoV-2 human protein-protein interactions."),h4("The selected articles were then retrieved and a second manual curation on the whole content of papers was performed by team members to retrieve all viral-host protein interactions. In total, 2989 interactions involving 33 SARS-CoV-2 proteins and 1483 human proteins were retrieved."),h4("Based on the collected data, an R script using R shiny, visNetwork and shiny dashboard packages was built to retrieve data from generated csv files and display it on the web interface over the Web"),h4("An in-house perl script was developed to make protein interactions in appropriate format. All data and scripts are available on github."))
             )
          )
       )
     ),

    visNetworkOutput("network")
  )
)

shinyApp(ui = ui, server = server)
