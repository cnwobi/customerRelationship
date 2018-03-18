package com.buck.jdbc;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.*;
import java.io.IOException;
@WebServlet("/TestDbServlet")
public class TestJdbc extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //setup conncection variables
        String user = "hbstudent";
        String pass = "hbstudent";

        String jdbcurl = "jdbc:mysql://localhost:3306/web_customer_tracker?useSSl=false";
        String driver = "com.mysql.jdbc.Driver";
        try {
            PrintWriter out= response.getWriter();
            out.println("Conneting to database: " + jdbcurl);
            Class.forName(driver);
            Connection myCon= DriverManager.getConnection(jdbcurl,user,pass);
            out.println("Success!");
            myCon.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }

    }
}