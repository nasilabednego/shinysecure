# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
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

    shiny::uiOutput('login'),
    theme = bslib::bs_theme(bootswatch = 'li'),
    shiny::uiOutput('UIO'))


}

encrypt<-function(credentials, input, output,UI,session){
  credentials
  shiny::observeEvent(input$loginok,{
    shiny::req(input$username==credentials%>%select(username)%>%filter(username==input$username))
    shiny::req(input$password==credentials%>%select(password)%>%filter(password==input$password))

    shinyjs::delay(2000,
          output$UIO<-
            shiny::renderUI({
              shiny::div(style=paste0('font-size:',input$inpuT,'%'),
                  UI)}))


  })
  shiny::observeEvent(input$loginok,{
    shiny::req(input$username==credentials%>%select(username)%>%filter(username==input$username))
    shiny::req(input$password==credentials%>%select(password)%>%filter(password==input$password))
    shinyjs::toggle('login')})




  shiny::observeEvent(input$setng,{
    shiny::showModal(shiny::modalDialog('settings',
                          shiny::sliderInput("inpuT",
                                      "Adjust font:",
                                      min = 50,
                                      max = 100,
                                      value = 100)),

    )})




  output$user<-shiny::renderUI({
    input$username
  })

  output$login<-shiny::renderUI({isolate({ shiny::absolutePanel(draggable = T,
                                                  shiny::wellPanel(
                                                    shiny::div(style=paste0('font-size:',input$inpuT,'%'),
                                                        shiny::fluidPage(dashboadthemes::theme_onenote,
                                                                  
                                                                                   shiny::fluidPage(
                                                                                      'From NCDS&AS'


                                                                                      #TimeOutput()
                                                                                    

                                                                  ),
                                                                 shiny::actionBttn('setng','settings',icon = icon('cog'),style = 'str',color = 'p'),
                                                                  shiny::textInput('username',placeholder='enter username',''),

                                                                  passwordInput('password',placeholder='enter password',''),

                                                                  actionBttn("loginok",'login',style = 'fi',color = 's'))
                                                    )))
  })

  })
}
