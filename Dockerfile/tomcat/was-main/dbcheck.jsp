<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>DB Connection Test</title>
</head>
<body>
<%
    String dbURL = "jdbc:mariadb://799de786-58dd-4052-a9f5-fccdfd3af372.external.kr1.mariadb.rds.nhncloudservice.com:3306/proja";
    String dbUser = "root";
    String dbPassword = "proja";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Check if the user is the owner of the board
        String checkSql = "SELECT * FROM list";
        pstmt = conn.prepareStatement(checkSql);
        rs = pstmt.executeQuery();

        // If database connection is successful, print a message
        if (rs != null) {
            out.println("<p>Database connection was successful.</p>");
        } else {
            out.println("<p>Database connection was fail.</p>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Database connection was fail.</p>");
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
</body>
</html>
