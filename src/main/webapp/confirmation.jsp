<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    // Get user email from session
    String userEmail = (String) session.getAttribute("user");

    if (userEmail == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    String USER = "SYSTEM";
    String PASSWORD_DB = "NEHA";
    String bookingDetails = "";
    boolean emailExists = false; // To track if the email exists in the database

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection(DB_URL, USER, PASSWORD_DB);
        
        // Check if the email exists in the database
        String emailQuery = "SELECT COUNT(*) AS count FROM users_bookings WHERE email = ?";
        PreparedStatement emailStmt = con.prepareStatement(emailQuery);
        emailStmt.setString(1, userEmail);
        ResultSet emailRs = emailStmt.executeQuery();

        if (emailRs.next() && emailRs.getInt("count") > 0) {
            emailExists = true;
        }

        if (emailExists) {
            // Retrieve booking details if the email exists
            String query = "SELECT * FROM users_bookings WHERE email = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, userEmail);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                bookingDetails = "<tr><td>" + rs.getString("from_dest") + "</td><td>" 
                    + rs.getString("to_dest") + "</td><td>" 
                    + rs.getInt("adults") + "</td><td>" 
                    + rs.getInt("children") + "</td><td>" 
                    + rs.getString("class") + "</td><td>" 
                    + rs.getDate("departure") + "</td><td>" 
                    + rs.getString("journey_type") + "</td></tr>";
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
</head>
<body>
    <h2>Booking Confirmation</h2>
    <%
        if (!emailExists) {
    %>
        <p style="color: red;">Your email is not registered. Please <a href="registration.jsp">register here</a>.</p>
    <%
        } else if (bookingDetails.isEmpty()) {
    %>
        <p style="color: red;">No booking details found for your account.</p>
    <%
        } else {
    %>
        <table border="1">
            <thead>
                <tr>
                    <th>From</th>
                    <th>To</th>
                    <th>Adults</th>
                    <th>Children</th>
                    <th>Class</th>
                    <th>Departure Date</th>
                    <th>Journey Type</th>
                </tr>
            </thead>
            <tbody>
                <%= bookingDetails %>
            </tbody>
        </table>
    <%
        }
    %>

    <a href="logout.jsp">Logout</a>
</body>
</html>
