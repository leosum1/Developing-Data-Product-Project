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


Secret Sauce: How do we get the BMI
========================================================

Calculating the BMI is as simple as dividing the weight by the squared height and multipliying the result by 703:


```r
bmi <- (weight/(height^2))*703
```

Example:


```r
weight = 160
height = 60
bmi <- (weight/(height^2))*703
bmi
```

```
[1] 31.24444
```


Category
========================================================

We can then class the result into one of the three category. Taking the input from the previous slide:


```r
ifelse(bmi < 18.5, "Underweight", ifelse(bmi < 25,"Healthy Weight", ifelse(bmi < 60,"Overweight")))
```

```
[1] "Overweight"
```



Conclusion
========================================================


A very simple App available for everyone to use at 

https://leosum.shinyapps.io/Developing-Data-Product-Project/


