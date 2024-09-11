<%@ page import="com.nt.bean.SearchBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Information</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4; /* Light grey background for the page */
        }
        .flight-info {
            border: 2px solid #007bff; /* Blue border */
            border-radius: 8px;
            padding: 20px;
            background-color: #ffffff; /* White background for the info box */
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Subtle shadow */
            margin-top: 20px;
        }
        .highlight {
            color: #ff5722; /* Highlight color for discounted price */
            font-size: 1.25em; /* Increase font size */
        }
        .original-price {
            text-decoration: line-through;
            color: #888; /* Color for crossed-out original price */
            font-size: 1.1em; /* Slightly larger font size */
        }
        .source-destination {
            font-size: 2.0em; /* Increase font size */
            font-weight: bold;
            color: #87ceeb; /* Sky blue color for text */
            background-color: #ffffff; /* White background for text */
            padding: 5px 10px; /* Padding for better readability */
            border-radius: 4px; /* Rounded corners */
        }
        .info-row {
            margin-bottom: 10px;
        }
        .info-label {
            font-weight: bold;
            font-size:25px;
        }
        .info-value {
            color: #05c1fb;
        }
        .row-flex {
            display: flex;
            align-items: center;
        }
        .price-wrapper {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: nowrap; /* Prevent wrapping */
        }
        .price-value {
            font-size: 1.2em; /* Slightly larger font size */
        }
        .btn-submit {
            background-color: #dc3545; /* Red background */
            color: #ffffff; /* White text color */
            border: none; /* Remove border */
            border-radius: 4px; /* Rounded corners */
            font-size: 1.1em; /* Slightly larger font size */
            padding: 10px 20px; /* Padding for button */
            text-transform: uppercase; /* Uppercase text */
            font-weight: bold; /* Bold text */
            cursor: pointer; /* Pointer cursor */
            margin-left:700px
        }
        .btn-submit:hover {
            background-color: #c82333; /* Darker red on hover */
        }
    </style>
</head>
<body>

<%ArrayList<SearchBean> sb =(ArrayList<SearchBean>)request.getAttribute("a1");%>
       <% String date=(String)request.getAttribute("a2"); %>
<%for(SearchBean data:sb){
%>	
	


    <div class="container">
        <div class="flight-info">
            <div class="row row-flex">
                <div class="col-md-4 info-row">
                    <span class="info-label">Source:</span>
                    <span class="info-value source-destination"> <%= data.getSource() %> </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                </div>
                <div class="col-md-4 info-row">
                    <span class="info-label">Destination:</span>
                    <span class="info-value source-destination"><%= data.getDest() %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                </div>
                <div class="col-md-4 info-row">
                    <span class="info-label">Category:</span>
                    <span class="info-value" style="font-size: 20px;"><%= data.getCategory() %></span>
                </div>
            </div>
            <div class="row row-flex">
                <div class="col-md-4 info-row">
                    <span class="info-label">Class:</span>
                    <span class="info-value" style="font-size: 20px;"><%= data.getSeatType() %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
                </div>
                <div class="col-md-4 info-row">
                    <span class="info-label">Price:</span>
                    <span class="price-value original-price" style="font-size: 25px;font-weight: bolder;">&#8377;<%= data.getPrice() %></span>
                    <span class="price-value highlight" style="font-size: 25px;font-weight: bolder;">&#8377; <%= data.getDprice() %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div class="col-md-4 info-row">
                    <span class="info-label">Time:</span>
                    <span class="info-value" style="font-size: 20px;"><%= data.getTime() %></span>
                </div>
            </div>
            <div class="row row-flex">
                <div class="col-md-12 info-row">
                    <span class="info-label">Flight No:</span>
                    <span class="info-value"style="font-size: 20px;font-weight:bold; color:gray;"><%= data.getFlightNo() %></span>
                </div>
            </div>
            <!-- Submit Button -->
            <div class="row">
                <div class="col-md-12 text-center">
                        <form action="BookTicketServlet">
                        <input type="hidden" name="source" value="<%= data.getSource() %>">
                        <input type="hidden" name="destination" value="<%= data.getDest() %>">
                        <input type="hidden" name="category" value="<%= data.getCategory() %>">
                        <input type="hidden" name="price" value="<%= data.getDprice() %>">
                        <input type="hidden" name="time" value="<%= data.getTime() %>">
                        <input type="hidden" name="flightno" value="<%= data.getFlightNo() %>">
                        <input type="hidden" name="seattype" value="<%= data.getSeatType() %>">
                        
                        <input type="hidden" name="date" value="<%= date %>">



                        <button type="submit" class="btn-submit">BUY NOW</button>
                    </form>                </div>
            </div>
        </div>
    </div>
    
<%} %>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
