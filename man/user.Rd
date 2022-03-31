\name{user}
\alias{user}
\title{Show the user logged in}
\usage{
  # Run in UI
user()
}
\description{
Shows the currently logged in user
}
\examples{
library(shiny)
library(shinysecure)
credentials<-data.frame(username=c('Nsl','Ksl'),password=c(545,454))
ui<-encryptUI()
server<-function(input,output,session){
encrypt(credentials = credentials,input = input,session = session, output = output,
          UI= fluidPage('Hello!',user())
        )
}
shinyApp(ui,server)
}
