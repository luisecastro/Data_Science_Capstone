shinyServer(function(input, output, session){
    
    output$value <- renderPrint({if(input$choice) streamer(input$text,shak1,shak2,shak3,input$num) else streamer(input$text,m1,m2,m3,input$num)})
        
    output$current <- renderPrint({input$text})
    
    output$phrase <- renderPrint({input$seed})
    
    output$babble <- renderPrint({
        input$go
        isolate(if(input$choice) babbler(input$seed,input$size,input$rand,shak1,shak2,shak3) else babbler(input$seed,input$size,input$rand,m1,m2,m3))})
    })



    
