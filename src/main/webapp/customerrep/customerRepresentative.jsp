<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}
    </style>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<ul>
    <li><a class="active" href="customerRepresentative.jsp">Reservations</a></li>
    <li><a href="crmodify.jsp">Modify</a></li>
    <li><a href="crlist.jsp">List</a></li>
    <li><a href="crfaq.jsp">FAQ</a></li>
</ul>

<label>Unanswered FAQ</label>
<table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>Unanswered Questions</th>
        <th>Departure Date</th>
      </tr>
    </thead>
    <tbody id="faqlist">
    		<%
				//parse out the results
				while (faqlist.next()) { %>
					<tr>

    </tbody>
  </table>

<form method="POST" action= "../Account/accountLogOut.jsp">
    <input type="submit" id="logOutBTN" name="Logout" value="Log Out"/>
</form>
 </html>