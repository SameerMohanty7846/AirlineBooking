<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Ticket</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
   
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e3f2fd; /* Light blue background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .ticket-container {
            max-width: 700px;
            width: 100%;
            padding: 1.5em;
            background-color: #ffffff; /* White background */
            border: 1px solid #0288d1; /* Blue border */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            position: relative;
            margin: 1em;
            font-size: 1em;
        }
        
        .ticket-content {
            border-bottom: 1px solid #0288d1;
        }
        .ticket-content .section {
            margin-bottom: 1em;
            padding: 0.5em;
            border-bottom: 1px dashed #0288d1;
        }
        .ticket-content .section:last-of-type {
            border-bottom: none;
        }
        .ticket-content .section label {
            font-weight: bold;
            color: #0288d1; /* Blue label text */
        }
        .ticket-content .section .value {
            font-size: 1.2em;
            color: #333;
        }
        .ticket-footer {
            text-align: center;
            margin-top: 1em;
            font-size: 1.2em;
            font-weight: bold;
            color: #d32f2f; /* Red total bill text */
        }
        .btn-custom {
            background-color: #0288d1;
            color: #ffffff;
            border: none;
            padding: 0.8em 1.5em;
            font-size: 1.1em;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: block;
            width: 100%;
            text-align: center;
            margin-top: 1em;
        }
        .btn-custom:hover {
            background-color: #0277bd;
        }
        .total-bill {
            margin-top: 1em;
            margin-bottom: 1em;
        }
        .form-group {
            margin-bottom: 0.5em;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .form-group label {
            flex: 1;
            color: #0288d1;
            font-weight: bold;
        }
        .form-group input {
            flex: 2;
            padding: 0.3em;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="ticket-container">
    <%String source=(String)request.getAttribute("source");
    String destination=(String)request.getAttribute("destination");
    String category=(String)request.getAttribute("category");
    String price=(String)request.getAttribute("price");
    String time=(String)request.getAttribute("time");
    String flightno=(String)request.getAttribute("flightno");
    String date=(String)request.getAttribute("date");
    String numberseat =(String)request.getAttribute("numberseat");
    String totalBill=(String)request.getAttribute("totalBill");
    %>
        <div class="ticket-content">
            <div class="section">
                <label for="source">Source:</label> &nbsp;<span style="color:rgb(255, 0, 0);font-size: 22px;font-weight: bold;"><%=source %></span>
            </div>
            <div class="section">
                <label for="destination">Destination:</label> &nbsp;<span style="color:rgb(255, 0, 0);font-size: 22px;font-weight: bold;"><%=destination %></span>
            </div>
            <div class="section">
                <label for="category">Category:</label> &nbsp;<span style="color:rgb(255, 0, 0);"><%=category %></span>
            </div>
            <div class="section">
                <label for="price">Price per Seat (INR):</label> &nbsp;<span style="color:rgb(255, 0, 0);"><%=price%></span>
            </div>
            <div class="section">
                <label for="time">Time:</label> &nbsp;<span style="color:rgb(255, 0, 0)"><%=time %></span>
            </div>
            <div class="section">
                <label for="flightno">Flight Number:</label> &nbsp;<span style="color:rgb(255, 0, 0)"><%=flightno %></span>
            </div>
            <div class="section">
                <label for="number">Number of Seats:</label> &nbsp;<span style="color:rgb(255, 0, 0)"><%=numberseat %></span>
            </div>
        </div>
        <div class="ticket-footer">
            <div>
                <form action="PaymentServlet">
                    <input type="hidden" name="source" value="<%= source %>">
                    <input type="hidden" name="destination" value="<%=destination %>">
                    <input type="hidden" name="category" value="<%=category %>">
                    <input type="hidden" name="flightno" value="<%=flightno %>">
                    <input type="hidden" name="date" value="<%=date %>">
                    <input type="hidden" name="time" value="<%=time %>">
                    <input type="hidden" name="totalBill" value="<%=totalBill %>">
                    <input type="hidden" name="numberseat" value="<%=numberseat %>">
                    <input type="hidden" name="price" value="<%=price %>">
                    
                    
                    
                    
                    <div class="form-group">
                        <label for="phone">Phone Number:</label>
                        <input type="text" name="phone" required>
                    </div>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" name="name" required>
                    </div>
                    <div class="total-bill">
                        <span>Total Bill:  </span>&#8377;<span><%= totalBill %></span>
                    </div>
                    <button type="submit" class="btn-custom">Generate Ticket</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
