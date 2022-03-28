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

  fluidPage(

    useShinyjs(),

    uiOutput('login'),
    theme = bs_theme(bootswatch = 'li'),
    uiOutput('UIO'))


}

encrypt<-function(credentials, input, output,UI,session){
  credentials
  observeEvent(input$loginok,{
    req(input$username==credentials%>%select(username)%>%filter(username==input$username))
    req(input$password==credentials%>%select(password)%>%filter(password==input$password))

    delay(2000,
          output$UIO<-
            renderUI({
              div(style=paste0('font-size:',input$inpuT,'%'),
                  UI)}))


  })
  observeEvent(input$loginok,{
    req(input$username==credentials%>%select(username)%>%filter(username==input$username))
    req(input$password==credentials%>%select(password)%>%filter(password==input$password))
    toggle('login')})




  observeEvent(input$setng,{
    showModal(modalDialog('settings',
                          sliderInput("inpuT",
                                      "Adjust font:",
                                      min = 50,
                                      max = 100,
                                      value = 100)),

    )})




  output$user<-renderUI({
    input$username
  })

  output$login<-renderUI({isolate({ absolutePanel(draggable = T,
                                                  wellPanel(
                                                    div(style=paste0('font-size:',input$inpuT,'%'),
                                                        fluidPage(theme_onenote,
                                                                  dashboardFooter(fixed = F,'right' =
                                                                                    fluidPage(
                                                                                      'From NCDS&AS'


                                                                                      #TimeOutput()
                                                                                    )

                                                                  ),
                                                                  actionBttn('setng','settings',icon = icon('cog'),style = 'str',color = 'p'),
                                                                  textInput('username',placeholder='enter username',''),

                                                                  passwordInput('password',placeholder='enter password',''),

                                                                  actionBttn("loginok",'login',style = 'fi',color = 's'))
                                                    )))
  })

  })
}
