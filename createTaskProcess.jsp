<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
try {
    // Get form values
    String subject = request.getParameter("subject").trim();
    String university = request.getParameter("university").trim();
    String cost = request.getParameter("cost").trim();
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String customerId = request.getParameter("customerId").trim();

    // Load JDBC driver
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Connect to database
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement", "root", "");

    // Generate new TaskID
    String newTaskID = "TSK1000"; // default
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT TaskID FROM task ORDER BY TaskID DESC LIMIT 1");

    if (rs.next()) {
        String lastID = rs.getString("TaskID");  // e.g. TSK1001
        String prefix = lastID.substring(0, 3);  // TSK
        int number = Integer.parseInt(lastID.substring(3)) + 1;
        newTaskID = prefix + number;            // e.g. TSK1002
    }

    // Insert task
    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO task (University, Cost, StartDate, EndDate, TaskID, CustomerID, Subject) VALUES (?, ?, ?, ?, ?, ?, ?)");
    ps.setString(1, university);
    ps.setString(2, cost);
    ps.setString(3, startDate);
    ps.setString(4, endDate);
    ps.setString(5, newTaskID);
    ps.setString(6, customerId);
    ps.setString(7, subject);

    int taskInserted = ps.executeUpdate();

    if (taskInserted > 0) {
        // Set session attributes
        session.setAttribute("University", university);
        session.setAttribute("Cost", cost);
        session.setAttribute("StartDate", startDate);
        session.setAttribute("EndDate", endDate);
        session.setAttribute("TaskID", newTaskID);
        session.setAttribute("CustomerID", customerId);
        session.setAttribute("Subject", subject);

        // Insert into payment table
        PreparedStatement ps2 = con.prepareStatement(
            "INSERT INTO payment (CustomerID, PaymentAmount, TransactionID, PaymentDate, Cost, TaskID, Status, TaskEndDate) " +
            "VALUES (?, ?, ?, CURDATE(), ?, ?, ?, ?)");
        ps2.setString(1, customerId);
        ps2.setString(2, "0");
        ps2.setString(3, "TRA" + newTaskID);
        ps2.setString(4, cost);
        ps2.setString(5, newTaskID);
        ps2.setString(6, "open");
        ps2.setString(7, endDate);

        int paymentInserted = ps2.executeUpdate();

        if (paymentInserted > 0) {
            response.sendRedirect("createTaskSuccess.jsp");
        } else {
            out.println("Error: Failed to insert payment record.");
        }
    } else {
        out.println("Error: Failed to insert task.");
    }

    con.close();
} catch (Exception e) {
    out.println("<h3 style='color:red;'>Something went wrong: " + e.getMessage() + "</h3>");
}
%>
</body>
</html>
