<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%
String error=request.getParameter("error");
if(error==null || error=="null"){
 error=""; 
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>Welcome to Student Grading Portal</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta http-equiv="Content-Type"
 content="text/html; charset=iso-8859-1">
  <link href="css/style.css" rel="stylesheet" type="text/css">
<title>Successfully Login</title>
</head>

<body>
<div class="main">
<div class="page-out">
<div class="page">
<div class="header">
<div class="header-top">
<h1>Grading Portal</h1>
<ul>
  <li><a href="index.html"><span>Home</span></a></li>
  
  <li><a href="#"><span>About</span></a></li>

  <li><a href="#"><span>Contact</span></a></li>
</ul>
</div>
<div class="header-img"><img src="images/header.jpg" alt="" height="225"
 width="899"><br><br><br><br><br><br><br><br><br><br></div>
</div>
<%=error %>
<%
	Connection con=null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GradingPortal","root","xpd54");
	ResultSet rs = null;
	PreparedStatement ps = null;
	try
	{
		
		String LoginId = session.getAttribute("AdminLoginId").toString();
		String UpdateQuery="update StudentCourseDetails , CourseDetails set StudentCourseDetails.Credit = CourseDetails.Credit where StudentCourseDetails.CourseId = CourseDetails.CourseId";
		String ToCheckLogin = "select LoginId from AdminLogin";
		ps = con.prepareStatement(ToCheckLogin);
		rs = ps.executeQuery();
		if(rs.next())
		{
			if(rs.getString(1).equals(LoginId))
			{
					out.print("<h3>Welcome to you  :"+session.getAttribute("AdminLoginId")+"</h3><br>");
					%>
					<a href="Logout.jsp">Logout</a><br><br>
					<a href="UpdateDatabases.jsp">Update The Database with Course List</a><br><br>
					<a href="CourseWiseStudentList.jsp">View Course Wise Student List</a><br><br>
					<a href="StudentWiseCourseDetails.jsp">View Student Wise Course Details</a><br><br>
					<a href="StudentWiseAcademicRecord.jsp">View Student Wise Academic Record</a><br><br>
					<a href="CourseWiseAcadRecordOfStudent.jsp"> Course Wise Academic Record </a><br><br>
					<a href="ViewCourseDetails.jsp">View a Course Detail</a><br>
					<form name="CourseDetail" onSubmit="return validate();" action="ViewCourseDetails.jsp" target="blank" >
					Put CourseId : <input type="text" name="CourseId" >
					<input type="submit" value="Details" >
					</form>
					
					<% 
					
					
				
				
				
			}
			
		}
	}
	catch(Exception e)
	{
		out.println("<b>you are not login");
		out.println("<br><a href="+"AdminLogin.jsp"+">Click Here to Login</a>");
	}
	

	
	
try
    {
         if(ps!=null)
         {
        	 ps.close();
         }
         if(rs!=null)
         {
        	 rs.close();
         }
         
         if(con!=null)
         {
        	 con.close();
         }
    }
catch(Exception e)
	{
		e.printStackTrace();
	}
	
	

%>


<br><br><br><br><br><br><br>
<div class="footer">
<div class="footer-left">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><strong>Contact info</strong></p>
<p>&nbsp;</p>
<p>Rajat Vyas,
Nishant Bansal
<br>
Ravi Prakash,
Itar Mehak<br>
LNMIIT, JAIPUR</p>
</div>
<div class="footer-right">
<ul>
  <li><a href="index.html">Home</a>/</li>

  <li><a href="#">About</a>/</li>

  <li><a href="#">Contact</a></li>
</ul>
<!--DO NOT Remove The Footer Links-->
<p>&copy; Copyright 2013. Designed by Y10@SWE-13
<a href="http://www.htmltemplates.net"></a>
<a href="http://www.onlinecasino.im"></a></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>
