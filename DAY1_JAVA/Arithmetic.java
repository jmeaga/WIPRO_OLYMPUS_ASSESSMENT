//Write a program that takes two numbers as input from the user and performs arithmetic operations on them using the arithmetic operators (sum, difference, product, quotient, remainder) in Java.

import java.util.Scanner;

public class ArithmeticOperations {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        // TODO: Write your code here
       int num1=scanner.nextInt();
       int num2=scanner.nextInt();
       int Sum=num1+num2;
       int Difference=num1-num2;
       int Product=num1*num2;
       int Quotient=num1/num2;
       int Remainder=num1%num2;
       System.out.println("Sum: "+Sum);
       System.out.println("Difference: "+Difference);
       System.out.println("Product: "+Product);
       System.out.println("Quotient: "+Quotient);
       System.out.print("Remainder: "+Remainder);
        //scanner.close();
    }
}