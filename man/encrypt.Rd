\name{encrypt}
\alias{encrypt}
\title{encrypts app}
\usage{
encrypt(credentials=credentials, input, output,UI,session)
}
\description{
encrypts page when run in server
}
\examples{
library(shiny)
library(shinysecure)
credentials<-data.frame(username=c('Nsl','Ksl'),password=c(545,454))
ui<-encryptUI()
server<-function(input,output,session){
encrypt(credentials = credentials,input = input,session = session, output = output,
          UI= fluidPage('Hello!')
}
shinyApp(ui,server)
}
