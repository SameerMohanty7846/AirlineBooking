<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa; /* Light blue background */
            color: #333;
            margin: 0;
            padding: 0;
            overflow: hidden; /* Hide scrolling */
            background-repeat: no-repeat;
            background-size: cover;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            flex-wrap: wrap;
            gap: 1.5em; /* Space between form and summary */
            padding: 1em;
            box-sizing: border-box;
        }
        .form-container {
            background-color: #ffffff; /* White background */
            border: 2px solid #0056b3; /* Blue border */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 1em;
            box-sizing: border-box;
            flex: 1 1 100%; /* Full width */
            max-width: 600px; /* Max width for the form */
        }
        .form-header {
            text-align: center;
            margin-bottom: 1em;
        }
        .form-header h1 {
            color: #d32f2f; /* Red header text */
        }
        .form-group {
            margin-bottom: 1em;
            display: flex;
            flex-direction: column;
        }
        .form-label {
            margin-bottom: .5em;
            color: #0056b3; /* Blue label text */
            font-weight: bold;
        }
        .form-control {
            border: 1px solid #ccc;
            padding: .5em;
            font-size: 1em;
            border-radius: 5px;
        }
        .form-control[readonly] {
            background-color: #f0f0f0;
            color: #666;
            cursor: not-allowed;
        }
        .btn-custom {
            background-color: #0056b3;
            color: #ffffff;
            border: none;
            padding: 0.7em 1.5em;
            font-size: 1em;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: block;
            width: 100%;
            margin-top: 1em; /* Space between button and other elements */
        }
        .btn-custom:hover {
            background-color: #004494;
        }
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1em; /* Space between form fields */
        }
        .form-grid .form-group {
            margin-bottom: 0; /* Remove bottom margin for grid items */
        }
    </style>
</head>
<body background="bg.jpg">
<%
    String source = (String)request.getAttribute("source");
    String dest = (String)request.getAttribute("dest");
    String Pprice = (String)request.getAttribute("price");
    String price = Pprice;
    String time = (String)request.getAttribute("time");
    String flightno = (String)request.getAttribute("flightno");
    String category = (String)request.getAttribute("seattype");
    String date = (String)request.getAttribute("date");
%>
    <div class="container">
        <div class="form-container">
            <div class="form-header">
                <h1>Flight Booking Details</h1>
            </div>
            <form id="bookingForm" action="GenerateTicketServlet">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="source" class="form-label">Source:</label>
                        <input type="text" class="form-control" id="source" name="source" value="<%= source %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="destination" class="form-label">Destination:</label>
                        <input type="text" class="form-control" id="destination" name="destination" value="<%= dest %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="category" class="form-label">Category:</label>
                        <input type="text" class="form-control" id="category" name="category" value="<%= category %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="price" class="form-label">Price per Seat (INR):</label>
                        <input type="text" class="form-control"  value="₹<%= price %>" readonly>
                        <input type="hidden" name="price" value="<%= price %>"> 
                    </div>
                    <div class="form-group">
                        <label for="time" class="form-label">Time:</label>
                        <input type="text" class="form-control" id="time" name="time" value="<%= time %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="flightno" class="form-label">Flight Number:</label>
                        <input type="text" class="form-control" id="flightno" name="flightno" value="<%= flightno %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="date" class="form-label">Date:</label>
                        <input type="text" class="form-control" id="date" name="date" value="<%= date %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="number" class="form-label">Number of Seats:</label>
                        <input type="number" class="form-control" id="number" name="number-seat" min="1" max="9" value="1">
                    </div>
                </div>
                <!-- Hidden input to store total bill -->
                <input type="hidden" id="totalBillInput" name="totalBill">
                <button type="submit" class="btn-custom">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>
