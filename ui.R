library('shiny')
shinyUI(
        pageWithSidebar(
                headerPanel("Calculate your Body Mass Index (BMI)"),
                sidebarPanel(
                        numericInput('weight', 'Insert your weight in Pounds', 160, step = 1) ,
                        numericInput('height', 'Insert your height in Inches', 70, step = 0.1),
                        submitButton('Submit')
                ), 

                mainPanel(
                    
                        p('The BMI provides a simple numeric measure of a person\'s thickness or thinness, allowing health professionals to discuss weight problems 
                        more objectively with their patients.\n'),

                        h4('Your Values:'), 

                        p('weight:'), verbatimTextOutput("inputweightvalue"),

                        p('height:'), verbatimTextOutput("inputheightvalue"),

                        h4('Your BMI:'),

                        verbatimTextOutput("bmi"),

                        p('It means that you are:'),strong(verbatimTextOutput("diagnostic"))
                )
        )   
)