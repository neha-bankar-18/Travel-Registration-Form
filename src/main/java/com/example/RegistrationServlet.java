package com.example;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String adults = request.getParameter("adults");
        String children = request.getParameter("children");
        String travelClass = request.getParameter("class");
        String departure = request.getParameter("departure");
        String journeyType = request.getParameter("journeyType");

        String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
        String USER = "SYSTEM";
        String PASSWORD_DB = "NEHA";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection(DB_URL, USER, PASSWORD_DB);

            String insertSQL = "INSERT INTO users_bookings (NAME, EMAIL, PASSWORD, FROM_DEST, TO_DEST, ADULTS, CHILDREN, CLASS, DEPARTURE, JOURNEY_TYPE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)";
            PreparedStatement pstmt = con.prepareStatement(insertSQL);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, from);
            pstmt.setString(5, to);
            pstmt.setString(6, adults);
            pstmt.setString(7, children);
            pstmt.setString(8, travelClass);
            pstmt.setString(9, departure);
            pstmt.setString(10, journeyType);
            pstmt.executeUpdate();

            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
