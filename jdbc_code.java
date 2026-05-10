// This program inserts student record into MySQL database.

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class jdbc_code {
    public static void main(String[] args) {

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/testdb";
        String user = "testuse@localhost";
        String password = "password";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {

            // SQL query using PreparedStatement
            String insertSQL = "INSERT INTO students (first_name, last_name, age, email) VALUES (?, ?, ?, ?)";

            try (PreparedStatement pstmt = conn.prepareStatement(insertSQL)) {

                // Taking input from user
                Scanner scanner = new Scanner(System.in);

                System.out.print("Enter first name: ");
                String firstName = scanner.nextLine();

                System.out.print("Enter last name: ");
                String lastName = scanner.nextLine();

                System.out.print("Enter age: ");
                int age = scanner.nextInt();
                scanner.nextLine();

                System.out.print("Enter email: ");
                String email = scanner.nextLine();

                // Setting values
                pstmt.setString(1, firstName);
                pstmt.setString(2, lastName);
                pstmt.setInt(3, age);
                pstmt.setString(4, email);

                // Execute query
                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("Student record added successfully!");
                } else {
                    System.out.println("Failed to add student record.");
                }

            } catch (SQLException e) {
                System.out.println("Error executing SQL query.");
                e.printStackTrace();
            }

        } catch (SQLException e) {
            System.out.println("Error connecting to database.");
            e.printStackTrace();
        }
    }
}
