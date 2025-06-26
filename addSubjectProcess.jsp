<%@ page import ="java.sql.*" %>

<%
   try
   {
       String Subject = request.getParameter("subject");   
       String SubjectType = request.getParameter("subjectType");
	   String SubjectID = request.getParameter("subjectId");
	
		//out.println(University);
	   	   
	
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
			   
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st = con.createStatement();
		st.executeUpdate("Insert into Subject (Subject, SubjectType, SubjectID) values ('"+Subject+"', '"+SubjectType+"','"+SubjectID+"')");
		ResultSet rs = st.executeQuery("select * from Subject");
	
		if (rs.next()) 
		{	
			//out.println("added successfully");
			response.sendRedirect("addSubjectSuccess.jsp");
		} 
		else 
		{
			out.println("adding failed");
		}
		
		
	}
catch(Exception e){       
      out.println("Something went wrong !! Please try again: "+e);       
  }   
%>