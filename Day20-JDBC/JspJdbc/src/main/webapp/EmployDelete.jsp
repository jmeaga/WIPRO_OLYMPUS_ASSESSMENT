<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <center>
    <form method="post" action="EmployDelete.jsp">
        Enter Employ Number:<br><br/> 
        <input type="text" name="empno" required><br><br/>
        <input type="submit" value="Delete">
       </centre>
    </form>
  

    <%
        // Only run the delete logic if form is submitted
        String empnoStr = request.getParameter("empno");

        if (empnoStr != null) {
            int empno = Integer.parseInt(empnoStr);
            Connection conn = null;
            PreparedStatement pst = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wipro1", "root", "chocomea@123");

                String sql = "DELETE FROM Employ WHERE empno = ?";
                pst = conn.prepareStatement(sql);
                pst.setInt(1, empno);

                int count = pst.executeUpdate();

                if (count > 0) {
                    out.println("<p style='color:green;'>Employ Record Deleted Successfully.</p>");
                } else {
                    out.println("<p style='color:red;'>No Employ Found with Empno: " + empno + "</p>");
                }

            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (pst != null) pst.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
  </center>
</body>
</html>