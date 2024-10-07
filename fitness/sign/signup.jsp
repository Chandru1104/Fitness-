<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    int age = Integer.parseInt(request.getParameter("age"));
    String password = request.getParameter("password");
    String url = "jdbc:mysql://localhost:3306/fitness";
    String dbUser = "root";
    String dbPassword = "root";
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {

        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Connect to the database
        conn = DriverManager.getConnection(url, dbUser, dbPassword);
        
        // SQL query to insert user data into the database
        String sql = "INSERT INTO signup (username, email, age,password) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, email);
        pstmt.setInt(3, age);
        pstmt.setString(4, password);
        
        int rowsInserted = pstmt.executeUpdate();
        if (rowsInserted > 0) {
            response.sendRedirect("signin.html");
        } else {
            response.getWriter().println("Failed to sign up user.");
        }
    } catch (ClassNotFoundException | SQLException ex) {
        ex.printStackTrace();
        response.getWriter().println("Error: " + ex.getMessage());
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    %>
</body>
</html>