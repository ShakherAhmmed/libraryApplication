<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     


<%@page import="java.sql.*, java.util.*" %>

<%
String username = request.getParameter("user_name");
String firstName = request.getParameter("first_name");
String lastName = request.getParameter("last_name");
String password = request.getParameter("password");
String confrmPassword = request.getParameter("confirm_password");

try{
 	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String Url = "jdbc:sqlserver://REVIZE_OBI\\SQLEXPRESS01;encrypt=false;databaseName=libraryApplication;user=obi;password=Hello";
	Connection conn = DriverManager.getConnection(Url);
	Statement st=conn.createStatement();
	
	if(password.equals(confrmPassword)){
		
		int i = st.executeUpdate("insert into librarian(userName,firstName,lastName,password)values('"+username+"','"+firstName+"','"+lastName+"','"+password+"')");
		out.println("form is submitted");
		 
		 response.sendRedirect("../login pages/librarian_login.jsp");
		 
		
	}else{
		out.println("Password Doesn\'t Match");
	}
    
	
}catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%>


