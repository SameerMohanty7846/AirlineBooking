<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Payment</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-size: cover;
            background-repeat: no-repeat;
        }
        .payment-container {
            width: 100%;
            max-width: 800px; /* Adjusted max-width for horizontal layout */
            background-color: #002147; /* Dark Blue background */
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            padding: 20px;
            box-sizing: border-box;
            color: #ffffff; /* White text */
            position: relative;
            z-index: 2; /* Ensure container is above background pattern */
        }
        .payment-container h2 {
            text-align: center;
            color: #FFD700; /* Gold text */
            margin-bottom: 20px;
            font-size: 24px;
        }
        .payment-container form {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .payment-container .form-group {
            flex: 0 0 48%; /* Two columns with space in between */
            margin-bottom: 15px;
        }
        .payment-container label {
            font-weight: bold;
            color: #FFD700; /* Gold text */
            margin-bottom: 5px;
            display: block;
        }
        .payment-container input[type="text"],
        .payment-container input[type="number"],
        .payment-container input[type="month"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            box-sizing: border-box;
            font-size: 16px;
            z-index: 3; /* Ensure inputs are above background pattern */
        }
        .payment-container input[type="text"]:focus,
        .payment-container input[type="number"]:focus,
        .payment-container input[type="month"]:focus {
            outline: none;
            border: 2px solid #FFD700; /* Gold border on focus */
        }
        .payment-container .card-icons {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }
        .payment-container .card-icons img {
            width: 50px;
            height: auto;
            z-index: 3; /* Ensure icons are above background pattern */
        }
        .payment-container button {
            width: 100%;
            padding: 12px;
            background-color: #FFD700; /* Gold background */
            color: #002147; /* Dark Blue text */
            border: none;
            border-radius: 5px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s ease;
            z-index: 3; /* Ensure button is above background pattern */
        }
        .payment-container button:hover {
            background-color: #ffbf00; /* Slightly darker gold on hover */
        }
        .payment-container .secure-note {
            text-align: center;
            margin-top: 15px;
            font-size: 12px;
            color: #ffffff;
        }
        .background-pattern {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('https://www.transparenttextures.com/patterns/arabesque.png');
            opacity: 0.2;
            z-index: 1; /* Ensure background pattern is behind content */
        }
    </style>
</head>
<body background="bg.jpg">
<%  String source=(String)request.getAttribute("source");
    String destination=(String)request.getAttribute("destination");
    String category=(String)request.getAttribute("category");
    String price=(String)request.getAttribute("price");
    String time=(String)request.getAttribute("time");
    String flightno=(String)request.getAttribute("flightno");
    String date=(String)request.getAttribute("date");
    String numberseat =(String)request.getAttribute("numberseat");
    String totalBill=(String)request.getAttribute("totalBill");
    String name=(String)request.getAttribute("name");
    String phone=(String)request.getAttribute("phone");
    
    
    
   

    %>
    <div class="payment-container">
        <div class="background-pattern"></div>
        <h2>Payment for Your Ticket</h2>
        <div class="card-icons">
            <img src="OIP (2).jpg" alt="Visa">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png" alt="MasterCard">
            <img src="OIP (4).jpg" alt="American Express">
        </div>
        <form action="FinalTicketServlet">
            <div class="form-group">
                <label for="card-number">Card Number</label>
                <input type="text" id="card-number" name="card-number" placeholder="1234 5678 9012 3456" autofocus required>
            </div>
            <div class="form-group">
                <label for="card-holder">Card Holder</label>
                <input type="text" id="card-holder" name="card-holder" placeholder="John Doe" required>
            </div>
            <div class="form-group">
                <label for="expiry-date">Expiry Date</label>
                <input type="month" id="expiry-date" name="expiry-date" required>
            </div>
            <div class="form-group">
                <label for="cvv">CVV</label>
                <input type="number" id="cvv" name="cvv" placeholder="123" required>
            </div>
            <div>
                                                <input type="hidden" name="source" value="<%=source %>" >
                                                <input type="hidden" name="destination" value="<%=destination %>" >
                                                <input type="hidden" name="category" value="<%=category %>" >
                                                <input type="hidden" name="price" value="<%=price %>" >
                                                <input type="hidden" name="time" value="<%=time %>" >
                                                <input type="hidden" name="flightno" value="<%=flightno %>" >
                                                <input type="hidden" name="date" value="<%=date %>" >
                                                <input type="hidden" name="totalBill" value="<%=totalBill %>" >
                                                <input type="hidden" name="name" value="<%=name %>" >
                                                <input type="hidden" name="phone" value="<%=phone %>" >
                                                <input type="hidden" name="numberseat" value="<%=numberseat %>" >
                        
                       
            
            
            
            </div>
            <button type="submit">Pay Now</button>
        </form>
        <div class="secure-note">
            <p>Payment secured by SSL</p>
        </div>
    </div>
</body>
</html>
