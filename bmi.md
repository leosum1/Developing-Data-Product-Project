Calculate your Body Mass Index (BMI)
========================================================
author: leosum
date: October 6, 2016 
autosize: true
font-family: 'Trebuchet MS'
transition: rotate

What does the Application?
========================================================

The BMI is an attempt to quantify the amount of tissue mass (muscle, fat, and bone) in an individual, and then categorize that person as underweight, normal weight or overweight based on that value. 

Commonly accepted BMI ranges are: 
+ underweight: under 18.5 
+ normal weight: between 18.5 and 25
+ overweight: over 25

The Application takes two values as a manual user input:
+ The Weight (lb)
+ The Height (in)

Automatically displays the user BMI and Category

The UI Code
========================================================

ui.R
<small>

```r
shinyUI(
 pageWithSidebar( headerPanel("Calculate your Body Mass Index (BMI)"),
   sidebarPanel(
    numericInput('weight', 'Insert your weight in Pounds', 160, step = 1),
    numericInput('height', 'Insert your height in Inches', 70, step = 0.1), submitButton('Submit')
    ), 
  mainPanel(
    p('The BMI provides a simple numeric measure of a person\'s thickness or thinness, allowing health professionals to discuss weight problems more objectively with their patients.\n'),
    h4('Your Values:'), p('weight:'), verbatimTextOutput("inputweightvalue"),
    p('height:'), verbatimTextOutput("inputheightvalue"), h4('Your BMI:'), verbatimTextOutput("bmi"),
    p('It means that you are:'),strong(verbatimTextOutput("diagnostic")) ) 
  )
)    
```
</small>

The Server Code
========================================================

server.R
<small>

```r
library(shiny) 
BMI <- function(weight,height) {weight/(height^2)*703}
diagnosticf <- function(weight,height){
  BMI_value <- (weight/(height^2))*703
  ifelse(BMI_value<18.5,"Underweight",ifelse(BMI_value<25,"Healthy Weight",ifelse(BMI_value<30,"Overweight")))
}
shinyServer(
    function(input, output) {    
        output$inputweightvalue <- renderPrint({input$weight})
        output$inputheightvalue <- renderPrint({input$height})
        output$bmi <- renderPrint({BMI(input$weight,input$height)})
        output$diagnostic <- renderPrint({diagnosticf(input$weight,input$height)})
        } 
)
```
</small>

The Magic
========================================================

Calculating the BMI is as simple as dividing the weight by the squared height and multipliying the result by 703:


```r
BMI <- function(weight,height) {weight/(height^2)*703}
```

<br>

<h3> Conclusion </h3>

A very simple App available for everyone at 

https://leosum.shinyapps.io/Developing-Data-Product-Project/


