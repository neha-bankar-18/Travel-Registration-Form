<%@ page language="java" %>
<%
    // Invalidate the current session
    session.invalidate();

    // Redirect to the registration page
    response.sendRedirect("index.jsp"); // Assuming `index.jsp` is your registration page
%>
