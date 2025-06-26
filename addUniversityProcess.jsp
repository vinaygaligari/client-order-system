<%@ page import ="java.sql.*" %>

<%
   try
   {
       String University = request.getParameter("university");   
       String Course = request.getParameter("course");
	   String Country = request.getParameter("country");
	   String UniversityID = request.getParameter("universityId");   
	
		//out.println(University);
	   	   
	
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
			   
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
		Statement st = con.createStatement();
		st.executeUpdate("Insert into University (University, Course, Country, UniversityID) values ('"+University+"', '"+Course+"','"+Country+"', '"+UniversityID+"')");
		ResultSet rs = st.executeQuery("select * from University");
	
		if (rs.next()) 
		{	
			//out.println("added successfully");
			response.sendRedirect("addUniversitySuccess.jsp");
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