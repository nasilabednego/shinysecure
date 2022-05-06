
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

encryptUI<-function(){

  shiny::fluidPage(

    shinyjs::useShinyjs(),

    shiny::uiOutput('logintosecure'),
    theme = bslib::bs_theme(bootswatch = 'li'),
    shiny::uiOutput('UIlogsecuredpage'))


}

user<-function(){
shiny::uiOutput('userthatloggedin')
}

encrypt<-function(credentials, input, output,UI,session){
  credentials
  shiny::observeEvent(input$loginok,{
      if(input$username %in%  credentials$username == T){
        datcred<-credentials%>%dplyr::filter(username==input$username)%>%select(password)
        if(input$password %in% datcred$password == T){
          req(input$password==credentials%>%filter(username==input$username)%>%
                dplyr::filter(password==input$password)%>%select(password))

    shinyjs::delay(2000,
          output$UIlogsecuredpage<-
            shiny::renderUI({
              shiny::div(style=paste0('font-size:',input$inpuT,'%'),
                  UI)}))
          }
        }


  })
  output$userthatloggedin<-shiny::renderUI({
    input$username
  })
  shiny::observeEvent(input$loginok,{
    output$UIlogfailed<-
            shiny::renderUI({
      if(input$username %in%  credentials$username == T){
        datcred<-credentials%>%filter(username==input$username)%>%select(password)
        if(input$password %in% datcred$password == T){
          req(input$password==credentials%>%filter(username==input$username)%>%
                filter(password==input$password)%>%select(password))}else{
          
        fluidPage(shiny::HTML(span( style="color:red",'Incorrect username or password. Try again with the correct credentials or click on forgot username or password.')))}
}else{fluidPage(shiny::HTML(span( style="color:red",'Incorrect username or password. Try again with the correct credentials or click on forgot username or password.')))}

 
         
        })
               

  })
  
  shiny::observeEvent(input$loginok,{
 if(input$username %in%  credentials$username == T){
        datcred<-credentials%>%filter(username==input$username)%>%select(password)
        if(input$password %in% datcred$password == T){
          req(input$password==credentials%>%filter(username==input$username)%>%
                filter(password==input$password)%>%select(password))
    shinyjs::toggle('logintosecure')}}
        })




  shiny::observeEvent(input$setng,{
    shiny::showModal(shiny::modalDialog('settings',
                          shiny::sliderInput("inpuT",
                                      "Adjust font:",
                                      min = 50,
                                      max = 100,
                                      value = 100))

    )})


  output$logintosecure<-shiny::renderUI({isolate({ shiny::absolutePanel(draggable = T,
                                                  shiny::wellPanel(
                                                    shiny::div(style=paste0('font-size:',input$inpuT,'%'),
                                                        shiny::fluidPage(dashboardthemes::theme_onenote,
                                                                  
                                                                                   shiny::fluidPage(
                                                                                      shiny::HTML(paste0(span(style='color:orange','From P&'),
                                                                                     span(style='color:fuchsia','WS'))))


                                                                                      #TimeOutput()
                                                                                    

                                                                  ),
                                                                 shinyWidgets::actionBttn('setng','settings',icon = icon('cog'),style = 'str',color = 'p'),
                                                                  shiny::textInput('username',placeholder='enter username',''),

                                                                  shiny::passwordInput('password',placeholder='enter password',''),

                                                                  shinyWidgets::actionBttn("loginok",'login',style = 'fi',color = 's'),
                                                                        uiOutput('UIlogfailed'))
                                                    )))
  })

  })
}
