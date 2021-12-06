<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<!--  jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
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
    <li><a href="mainpage.jsp">Home</a></li>
    <li><a class="active" href="flightSearch.jsp">Book Flights</a></li>
    <li><a href="faq.jsp">FAQ</a></li>
    <li><a href="profile.jsp">Profile</a></li>
</ul>

		<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp

			//Run the query against the database.
			ResultSet flights = db.getAllAvailableFlights(stmt);
		%>
		
<form action="buyTicketFromSearch.jsp">
	
<label class="checkbox-inline"><input type="radio" name="flighttype" checked>One Way</label>
<label class="checkbox-inline"><input type="radio" name="flighttype" value="rt">Round Trip</label>
<label class="checkbox-inline"><input type="radio" name="flighttype">One Way Flexible</label>
<label class="checkbox-inline"><input type="radio" name="flighttype" value="rtf">Round Trip Flexible</label>

<div class="form-group row" style="position:relative; left: 20px;">
    <div class="form-group">
        <label class="control-label" for="depaturetime">Departing Date</label>
        <input class="form-control" id="depaturetime" name="depaturetime" placeholder="MMDDYYYY" type="text"/>
    </div>
    <div class="form-group">
   	 	<label class="control-label" for="departingairport">Departing Airport</label>
        <input class="form-control" id="departingairport" name="departingairport" placeholder="Departing Airport" type="text"/>
    </div>
 
    <div class="form-group">
      <label class="control-label" for="destinationairport">Arriving Airport</label>
      <input class="form-control" id="destinationairport" name="destinationairport" placeholder="Arriving Airport" type="text"/>
    </div>
        <div class="form-group">
        <label class="control-label" for="arrivaltime">Arriving Date</label>
        <input class="form-control" id="arrivaltime" name="arrivaltime" placeholder="MMDDYYYY" type="text"/>
    </div>
    <div class="form-group" id="radiobuttonresult">
      </div>
  <button id="submitbutton" class="btn btn-primary " name="submit" type="submit">Submit</button>
</div>
</form>




<script>
$(document).ready(function() {
    $('input[type=radio][name="flighttype"]').on('change', function() {
        if(this.value == "rt" || this.value == "rtf"){
        	if(document.getElementById("returndate")){
        		
        	} else {
          	  var newLabel = "<label class='control-label' for='date' id='returndatelabel'>Return Date</label>";
        	  var newInput = "<input class='form-control' id='returndate' name='returndate' placeholder='MM/DD/YYY' type='text'/>";

        	  $('#radiobuttonresult').append(newLabel);
        	  $('#radiobuttonresult').append(newInput);
        	}
        } else {
        	$('#returndatelabel').remove()
        	$('#returndate').remove()
        }
    });
});
</script>

<label>All Flights</label>
<table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>Flight Number</th>
        <th>Departure Date</th>
        <th>Departing Airport</th>
        <th>Arriving Airport</th>
        <th>Return Date</th>
        <th>Cost</th>
      </tr>
    </thead>
    <tbody id="flightList">
    		<%
				//parse out the results
				while (flights.next()) { %>
					<tr>    
						<td><%= flights.getString("flightid") %></td>
						<td><%= flights.getString("dow") + " " + flights.getString("departuretime") %></td>
						<td><%= flights.getString("departureairport") %></td>
						<td><%= flights.getString("destinationairport") %></td>
						<td><%= flights.getString("dow") + " " + flights.getString("arrivaltime") %></td>
						<td><%= flights.getString("econfare") %></td>
					</tr>
				<% }
				//close the connection.
				db.closeConnection(con); } 
				catch (Exception e) {
					out.print(e);
				}
			%>			
    </tbody>
  </table>
  
<form method="POST" action= "accountLogOut.jsp">
    <input type="submit" id="logOutBTN" name="Logout" value="Log Out"/>
</form>
</body>
</html>