
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
    shiny::req(input$username==credentials%>%select(username)%>%filter(username==input$username))
    shiny::req(input$password==credentials%>%select(password)%>%filter(password==input$password))

    shinyjs::delay(2000,
          output$UIlogsecuredpage<-
            shiny::renderUI({
              shiny::div(style=paste0('font-size:',input$inpuT,'%'),
                  UI)}))


  })
  
  shiny::observeEvent(input$loginok,{

    shinyjs::delay(1000,
          output$UIlogfailed<-
            shiny::renderUI({
              shiny::req(input$username!=credentials%>%select(username)%>%filter(username==input$username))
    shiny::req(input$password!=credentials%>%select(password)%>%filter(password==input$password))
              fluidPage(hr(),"<span style=\"color:red\">Incorrect username or password. Try again with the correct credentials or click on forgot username or password.</span>"
              )}))


  })
  
  shiny::observeEvent(input$loginok,{
    shiny::req(input$username==credentials%>%select(username)%>%filter(username==input$username))
    shiny::req(input$password==credentials%>%select(password)%>%filter(password==input$password))
    shinyjs::toggle('logintosecure')})




  shiny::observeEvent(input$setng,{
    shiny::showModal(shiny::modalDialog('settings',
                          shiny::sliderInput("inpuT",
                                      "Adjust font:",
                                      min = 50,
                                      max = 100,
                                      value = 100)),

    )})




  output$userthatloggedin<-shiny::renderUI({
    input$username
  })

  output$logintosecure<-shiny::renderUI({isolate({ shiny::absolutePanel(draggable = T,
                                                  shiny::wellPanel(
                                                    shiny::div(style=paste0('font-size:',input$inpuT,'%'),
                                                        shiny::fluidPage(dashboardthemes::theme_onenote,
                                                                  
                                                                                   shiny::fluidPage(
                                                                                      'From NCDS&AS'


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
