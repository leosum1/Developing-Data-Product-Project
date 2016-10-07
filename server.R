library(shiny) 

BMI <- function(weight,height) {weight/(height^2)*703}

diagnosticf <- function(weight,height){

        BMI_value <- (weight/(height^2))*703

        ifelse(BMI_value<18.5,"Underweight",ifelse(BMI_value<25,"Healthy Weight",ifelse(BMI_value<60,"Overweight")))

}

shinyServer(
        function(input, output) {    
                output$inputweightvalue <- renderPrint({input$weight})
                output$inputheightvalue <- renderPrint({input$height})
                output$bmi <- renderPrint({BMI(input$weight,input$height)})
                output$diagnostic <- renderPrint({diagnosticf(input$weight,input$height)})
        } 
)