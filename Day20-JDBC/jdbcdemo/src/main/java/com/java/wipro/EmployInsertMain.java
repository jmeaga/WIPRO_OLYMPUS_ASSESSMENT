package com.java.wipro;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class EmployInsertMain {
	public static void main(String[] args) {
		int empno;
		String name,gender,dept,desig;
		double basic;
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter Employ No  ");
		empno = sc.nextInt();
		System.out.println("Enter Employ Name  ");
		name = sc.next();
		System.out.println("Enter Gender (MALE/FEMALE)  ");
		gender = sc.next();
		System.out.println("Enter Department  ");
		dept = sc.next();
		System.out.println("Enter Designation  ");
		desig = sc.next();
		System.out.println("Enter Basic ");
		basic = sc.nextDouble();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wipro1","root","chocomea@123");
			String cmd = "Insert into Employ(empno,name,gender,dept,desig,basic) values(?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(cmd);
			pst.setInt(1, empno);
			pst.setString(2, name);
			pst.setString(3, gender);
			pst.setString(4, dept);
			pst.setString(5, desig);
			pst.setDouble(6, basic);
			pst.executeUpdate();
			System.out.println("Record Inserted...");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
