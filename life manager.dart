import 'dart:io';
import 'dart:math';
List<String> tasks = [];
List<String> expenseNames = [];
List<double> expenseAmounts = [];
List<double> monthlyIncome = [];
List<String> habits = [];
List<bool> habitStatus = [];
List<String> motivationMessages = [
  "Great job! Keep going!",
  "Consistency is the key to success.",
  "You're becoming stronger every day.",
  "Small habits create big changes.",
  "Discipline beats motivation."
                                    ];




void main() {
    bool life = true;
    
    while(life) {
        print("""
        ========= LIFE MANAGER ==========
        
        1. TASK MANAGER
        2. EXPENSE TRACKER
        3. HABIT TRACKER
        4. CALCULATOR
        5. EXIT """);
        stdout.write("\nplease make a choice => ");
         String? input = stdin.readLineSync();
         switch(input) {
             case '1':
             print("\nYou have chosen to open the task manager");
             taskManager();
             break;
             
             case '2':
             print("\nYou have chosen to open the expense tracker");
             expenseTracker();
             break;
             
             case '3':
             print("\nYou have chosen to open the habit tracker");
             habitTracker();
             break;
             
             
             case '4':
             print("\nYou have chosen to open the calculator");
             calculator();
             break;
             
             case '5':
             print("\nYou have chosen to exit the application");
             print("Goodbye!");
             life = false;
             break;
             default:
             print("\nInvalid choice. Please select a valid option.");
             break;
         }
    }
    
    
} 
    
void taskManager() { 
    bool task = true;
    
    while (task) { 
        print("""
        ===== TASK MANAGER ==== 
        
        1. Add task
        2. View tasks
        3. Remove task
        4. Exit  """);
        
        print("selcet the task you want to perform");
        String? input = stdin.readLineSync();
        switch(input) { 
            case '1':
            print("Please tell the task you want to add");
            stdout.write("\nEnter task: ");
            String? newTask = stdin.readLineSync();
            tasks.add(newTask!);
            print("Task added succefully");
            break;
            
            case '2':
            if (tasks.isEmpty) {
                print("the list empty please add tasks first");
            }
            else{
             print("here are the list of your current tasks");
            for (int i = 0; i < tasks.length; i++) {
             print("${i + 1}. ${tasks[i]}");
             }      
            } 
            break;
            
            case '3':
            print("please state which task you want to remove");
            stdout.write("=>");
            if (tasks.isEmpty) {
                print("No tasks to remove.");
             }
            else{
             print("here are the list of your current tasks");
            for (int i = 0; i < tasks.length; i++) {
             print("${i + 1}. ${tasks[i]}");
             }      
            
                 stdout.write("Enter task number to remove: (press 0 to go back ");
                 String? removeInput = stdin.readLineSync();
                 int number = int.parse(removeInput!) ;
                 
                 if(number == 0) {
                     break;
                 }
                 
                 int index = number - 1 ;
                 
                 if (index >= 0 && index < tasks.length){
                     tasks.removeAt(index);
                 print("Task removed.");
                 } else{
                 print("Invalid task number.");
                 }
            }

            break;
            
            case '4':
            print("you are exiting the task manager");
            print("Goodbye!");
            task = false;
            break;
            default:
             print("\nInvalid choice. Please select a valid option.");
             break;
           }
     }   
}


void expenseTracker() { 
    if (monthlyIncome.isEmpty) {
     stdout.write("please add your monthly income =>");
     String? incomeInput = stdin.readLineSync();
     double income = double.parse(incomeInput!);
     monthlyIncome.add(income);
     print("Monthly Income Succefully added");
    }
    bool money = true;
    
    while (money) {
        
        print(""" 
        ===== EXPENSE TRACKER =====
        
        1. Add Expenses
        2. View All Expenses
        3. Remove a Expense
        4. Calculate all the expenses
        5. Calculate Savings at the end of the month
        6. Exit   """);
        
         stdout.write("selcet the task you want to perform");
         String? input = stdin.readLineSync();
         switch(input) {
            
            case '1':
            print("Please Add Your Expense");
            stdout.write("Name of Your Expense =>");
            String? expense = stdin.readLineSync();
            expenseNames.add(expense!);
            
            stdout.write("amount of expense =>");
            String? ruppesInput = stdin.readLineSync();
            double amount = double.parse(ruppesInput!);
            expenseAmounts.add(amount);
            print("expense added succesfully");
            break;
            
            case '2':
            if (expenseNames.isEmpty ){
                print("The List is Empty. Please Add Expenses First!!");
            }
            else {
                print("Here The list For All Your Expenses");
                for (int i = 0; i < expenseNames.length; i++) {
                     print("${i + 1}. ${expenseNames[i]} - ₹${expenseAmounts[i]}");
              }
            
            }
            break;
            
            case '3':
            if (expenseNames.isEmpty) {
            print("No expenses to remove.");
             } 
            else {
                print("Here are your expenses:");
                for (int i = 0; i < expenseNames.length; i++) {
                print("${i + 1}. ${expenseNames[i]} - ₹${expenseAmounts[i]}");
             }

             stdout.write("Enter expense number to remove: (press 0 to go back ");
             String? removeInput = stdin.readLineSync();
             int number = int.parse(removeInput!) ;
             
             if(number == 0) {
                 break;
             }
             
             int index = number - 1 ;

            if (index >= 0 && index < expenseNames.length) {
                expenseNames.removeAt(index);
                expenseAmounts.removeAt(index);
                print("Expense removed successfully.");
                }
                else {
                      print("Invalid expense number.");
                }
            }
            break;
            
            case '4':
            print("Here is the total expense=>");
            if (expenseAmounts.isEmpty) {
                print("No expense added to be calculated please add expenses first!");
            }
            else{
                double total = 0;
                for (final amount in expenseAmounts) {
                    total += amount;
                }
                print("Total expenses: ₹$total");
            }
            break;
            
            
            case '5':
            print("Your Savinges for this Month=>");
            if (monthlyIncome.isEmpty) {
               stdout.write("please add your monthly income => ");
               String? incomeInput = stdin.readLineSync();
               double income = double.parse(incomeInput!);
               monthlyIncome.add(income);
               print("Monthly Income Succefully added");
            }
            else {
                double income = monthlyIncome[0];
                
                double total = 0;
                for (final amount in expenseAmounts) {
                    total += amount;
                }
                
                double savings = income - total;
                
                print("Your savings: ₹$savings");
            }
            break;
            
            case '6':
            print("you are exiting the expense tracker");
            print("Goodbye!");
            money = false;
            break;
            default:
             print("\nInvalid choice. Please select a valid option.");
             break;

            
        }  
    }
    
} 


void habitTracker() {
    bool run = true;
    
    while(run) {
        print("""
        ===== HABIT TRACKER =====
        1. Add habit
        2. View Habits
        3. Mark Habits As Done
        4. Remove a habit
        5. Exit  """);
        
        stdout.write("Please Select a task you wanna perform => ");
        
        String? input = stdin.readLineSync();
         switch(input) {
             
             case '1':
             print("Please Add a Habit");
             print("Every action you take is a vote for the type of person you wish to become.");
             stdout.write("Name of the habit you wish to add =>");
             String? dailyhabits = stdin.readLineSync();
             habits.add(dailyhabits!);
             
             habitStatus.add(false);
             
             print("Your daily habit has been added. Wish you Well");
             
             break;
             
             case '2':
             if (habits.isEmpty){
                 print("You Have No Current Habits,Please Add a Habit to proceed");
             }
             else {
                 print("Here is the list of your current Habits");
                 for (int i = 0;  i < habits.length; i++) {
                      String status;
                      
                      if (habitStatus[i] == true) {
                          status = "Done";
                      }
                      else{
                          status = "Not Done";
                      }
                      
                      print("${i + 1}. ${habits[i]} - $status");
                 }
             }
             break;
             
             case '3':
             print("please mark the habit which you have completed");
             if (habits.isEmpty) {
                 print("you have no current habits,please add a habit to proceed");
             }
             else {
                 print("Here is the list of your current Habits");
                 for (int i = 0; i < habits.length; i++) {
                     String status;
                     
                     if (habitStatus[i] == true) {
                         status = "Done";
                     }
                     else{
                         status = "Not Done";
                     }
                     
                     print("${i + 1}. ${habits[i]} - $status");
                 }
                 
                     stdout.write("Which habit have you completed today ??? (press 0 to go back) ");
                     String? input = stdin.readLineSync();
                     int number = int.parse(input!) ;
                     
                     if (number == 0) {
                         break;
                     }
                     
                     int index = number - 1 ;
                     
                     if (index >= 0 && index < habits.length){
                         habitStatus[index] = true; 
                         
                         print("Habit mark as done! Great work keep it up!!!");
                         
                         Random random = Random();
                         int randomIndex = random.nextInt(motivationMessages.length);
                         print(motivationMessages[randomIndex]);


                     }
                    else {
                            print("You have chosen the wrong index number. Please choose the correct index number of the habit you want to complete");
                         }
                 }
             break;
             
             case '4':
             if (habits.isEmpty) {
                 print("You have no current habits. please add habits first to continue!!!");
             }
             else{
                 print("Here is the list of all your habits");
                 for (int i = 0; i < habits.length; i ++) {
                     print("${i + 1}. ${habits[i]} - ${habitStatus[i]}");
                 }
                     stdout.write("please select the habit you want to remove (press 0 to go back)");
                     String? input = stdin.readLineSync();
                     int number = int.parse(input!)  ;
                     
                     if(number == 0) {
                         break;
                     }
                     
                     int index = number - 1 ;
                     
                     if (index >= 0 && index < habits.length) {
                         habits.removeAt(index);
                         habitStatus.removeAt(index);
                         print("Habit succefully removed.");
                     }
                     else {
                         print("Invalid index number. Please choose the correct index number of the habit you want to remove!!!");
                     }
                     
                     
             }
             break;
             
             case '5':
             print("you are exiting the habit tracker");
             print("Goodbye!");
             run = false;
             break;
             default:
             print("\nInvalid choice. Please select a valid option.");
             break;
         }
    }
    
} 


void calculator() { 
    bool math = true;
    
    while(math) {
        print("""
        ====== CALCULATOR =====
        1. Addtion
        2. Subtraction
        3. Multiplication
        4. Division
        5. Exit  """);
        
         stdout.write("Please Select a task you wanna perform => ");
        
        String? input = stdin.readLineSync();
         switch(input){
             
             case '1':
             add();
             break;
             
             case '2':
             subtraction();
             break;
             
             case '3':
             multiply();
             break;
             
             case '4':
             division();
             break;
             
             case '5':
             print("You have decided to leave the calculator");
             print("Goodbye!");
             math = false;
             break;
             
             default:
             print("You have chosen a invalid option number.Please choose again!!!");
             break;
         }
    }
    
    
} 


void add() {
    print("Please tell the numbers you want to add");
             
             stdout.write(" First number => ");
             String? input1 = stdin.readLineSync();
             double number1 = double.parse(input1!);
             
             stdout.write(" Second number  => ");
             String? input2 = stdin.readLineSync();
             double number2 = double.parse(input2!);
             
             double sum = number1 + number2;
             
             print(" \nThe addition of two numbers ${number1} and  ${number2} is: ${sum}"); 
    
}

void subtraction() { 
                 print("Please tell the numbers you want to subtract");

             stdout.write(" First number => ");
             String? input1 = stdin.readLineSync();
             double number1 = double.parse(input1!);
             
             stdout.write(" Second number => ");
             String? input2 = stdin.readLineSync();
             double number2 = double.parse(input2!);
             
             double sub = number1 - number2 ;
             
             print(" \nThe subtraction between the two numbers ${number1} and ${number2} is: ${sub}");
    
}


void multiply() {
                 print("Please tell the numbers you want to multiply");

             stdout.write(" First number => ");
             String? input1 = stdin.readLineSync();
             double number1 = double.parse(input1!);
             
             stdout.write(" Second number => ");
             String? input2 = stdin.readLineSync();
             double number2 = double.parse(input2!);
             
             double mul = number1 * number2 ;
             
             print(" \nThe multiplication of two numbers ${number1} and ${number2} is: ${mul}");
    
}


void division() {
                 print("Please tell the nmbers you want to divide");

             stdout.write(" First number => ");
             String? input1 = stdin.readLineSync();
             double number1 = double.parse(input1!);
             
             stdout.write(" Second number => ");
             String? input2 = stdin.readLineSync();
             double number2 = double.parse(input2!);
             
             if (number2 == 0) {
                 print("Can't divide by Zero.");
             }
             else{
                  double div = number1 / number2 ;
             print(" \nThe divison between the two numbers ${number1} and ${number2} is: ${div}");
             }
    
}