// Days of the week
let day = 3
switch day {
case 1:
  print("Monday")
case 2:
  print("Tuesday")
case 3:
  print("Wednesday")
case 4:
  print("Thursday")
case 5:
  print("Friday")
case 6:
  print("Saturday")
case 7:
  print("Sunday")
default :
  print("Invalid day")
}


// traffic light
let light = "red"
switch light {
case "red":
  print("stop")
case "yellow" :
  print("wait")
case "green":
  print("drive")
default:
  print("not applicable")
  
}

// question 3- Grade
let grade = "A"

switch grade {
case "A":
  print("Excellent")
case "B":
  print("Very Good")
case "C":
  print("Good")
case "D":
  print("Needs Improvement")
case "F":
  print("Fail")
default:
  print("Invalid grade")
}

// Question 4
let d_ay = "Saturday"

switch d_ay {
case "Saturday" , "Sunday":
  print("Weekend")
case "Monday","Tuesday", "Wednesday" , "Thursday" , "Friday":
  print("weekday")
default:
  print("Invalid day")
}

// Question 5- Month of the season

let mo_nth = 12
switch mo_nth {
case 12 , 1 ,2:
  print("Winter")
case 3,4,5:
  print("Spring")
case 6,7,8:
  print("Summwr")
case 9,10,11:
  print("Autumn")
default:
  print("Invalid month")

}

// Question 6
let operation = "+"

switch operation {
case "+":
  print("Addition")
case "-":
  print("Substraction")
case "/":
  print("Division")
default:
  print("Invalid operation")
}

// Question 7 - Marks and Grade
let marks = 85
switch marks {
case 90...100:
  print("Grade A")
  
}


