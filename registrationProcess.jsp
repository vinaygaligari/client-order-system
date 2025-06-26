
<%@ page import ="java.sql.*" %>

<%
   try
   {
       String FullName = request.getParameter("fullName");   
       String EMPID = request.getParameter("empId");
	    String UserName = request.getParameter("userName");
		String Password = request.getParameter("password");   	
	
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
			   
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st = con.createStatement();
		st.executeUpdate("Insert into registration (FullName, EMPID, UserName, Password) values ('"+FullName+"', '"+EMPID+"','"+UserName+"', '"+Password+"')");
		ResultSet rs = st.executeQuery("select * from registration");
	
			if (rs.next()) 
			{	
				
				
				response.sendRedirect("login.jsp");	
			} 
			else 
			{
				response.sendRedirect("registration.jsp");
			}
		 
			
	}
catch(Exception e){       
      out.println("Something went wrong !! Please try again: "+e);       
  }   
%>