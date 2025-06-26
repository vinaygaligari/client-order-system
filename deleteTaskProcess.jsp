<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    String taskID = request.getParameter("taskId");

    if (taskID == null || taskID.trim().isEmpty()) {
        out.println("<h3 style='color:red;'>TaskID is missing or empty.</h3>");
    } else {
        taskID = taskID.trim();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Use updated driver
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement", "root", "");

            // Delete task
            String deleteTaskQuery = "DELETE FROM task WHERE TaskID = ?";
            PreparedStatement deleteTaskStmt = con.prepareStatement(deleteTaskQuery);
            deleteTaskStmt.setString(1, taskID);
            int taskDeleted = deleteTaskStmt.executeUpdate();

            if (taskDeleted > 0) {
                // Delete payment
                String deletePaymentQuery = "DELETE FROM payment WHERE TaskID = ?";
                PreparedStatement deletePaymentStmt = con.prepareStatement(deletePaymentQuery);
                deletePaymentStmt.setString(1, taskID);
                int paymentDeleted = deletePaymentStmt.executeUpdate();

                if (paymentDeleted >= 0) { // allow 0 if no payment exists
                    response.sendRedirect("deleteTaskSuccess.jsp");
                } else {
                    out.println("<h3 style='color:red;'>Failed to delete associated payment.</h3>");
                }
            } else {
                out.println("<h3 style='color:red;'>No task found with TaskID: " + taskID + "</h3>");
            }

            con.close();
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Something went wrong: " + e.getMessage() + "</h3>");
        }
    }
%>
</body>
</html>
