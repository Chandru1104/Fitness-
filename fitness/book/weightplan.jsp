<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String age = request.getParameter("age");
    String fitnessLevel = request.getParameter("fitness_level");
    String dietTimings = request.getParameter("diet_timings");
    String foodPreference = request.getParameter("food_preference");

    // Database connection
    String url = "jdbc:mysql://localhost:3306/your_database";
    String dbUser = "root";
    String dbPass = "password";

    Connection conn = null;
    PreparedStatement pst = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        String query = "INSERT INTO user_plans (email, age, fitness_level, diet_timings, food_preference) VALUES (?, ?, ?, ?, ?)";
        pst = conn.prepareStatement(query);
        pst.setString(1, email);
        pst.setString(2, age);
        pst.setString(3, fitnessLevel);
        pst.setString(4, dietTimings);
        pst.setString(5, foodPreference);

        int result = pst.executeUpdate();
        if (result > 0) {
            out.println("Plan Submitted Successfully!");
        } else {
            out.println("Error submitting plan. Please try again.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
