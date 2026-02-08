package com.mycompany.app;
import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        // Code Smell: Use of System.out instead of a logger
        System.out.println("Welcome to CloudWithVarJosh Demo!");

        // Vulnerability: Hardcoded secret
        String password = "admin123";

        // Bug: Incorrect string comparison using '=='
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter username: ");
        String user = sc.nextLine();
        if (user == "admin") {
            System.out.println("Access granted to admin user.");
        } else {
            System.out.println("Access denied.");
        }

        // Code Smell: Resource (Scanner) not closed properly
        // sc.close(); // intentionally commented out
    }
}
