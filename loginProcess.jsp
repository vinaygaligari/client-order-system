<%@ page import ="java.sql.*" %>
<%
try
{
	String UserName=request.getParameter("userName").trim();
	String Password=request.getParameter("password").trim(); 

	
	//out.println(UserName); 
	//out.println(Password); 
	
    Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customermanagement","root", "");
	Statement st=con.createStatement(); 
	ResultSet rs;
	rs=st.executeQuery("Select UserName,Password from registration where UserName='"+UserName+"' and Password='"+Password+"'"); 
	if(rs.next())
	{
			response.sendRedirect("home.jsp"); 
	}
	else
	{
			response.sendRedirect("login.jsp"); 
	}
}
catch(Exception e)
{
	out.println("Something went wrong !! Please try again: "+e);       
}

%>