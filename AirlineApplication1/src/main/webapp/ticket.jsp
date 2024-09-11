<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Premium Boarding Pass</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .boarding-pass-container {
            width: 100%;
            max-width: 900px; /* Increased max-width */
            margin: 0 auto;
            padding: 0;
        }
        .boarding-pass {
            width: 100%;
            background-color: #002147;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            padding: 30px; /* Increased padding */
            box-sizing: border-box;
            color: #ffffff;
            position: relative;
        }
        .background-pattern {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('https://www.transparenttextures.com/patterns/arabesque.png');
            opacity: 0.2;
            z-index: 1;
        }
        .boarding-pass .content {
            z-index: 2;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .boarding-pass .section {
            flex: 1;
            min-width: 250px; /* Increased min-width */
            box-sizing: border-box;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px; /* Increased padding */
            border-radius: 10px;
            margin: 10px;
        }
        .boarding-pass .title {
            color: #FFD700;
            font-weight: bold;
            margin-bottom: 10px;
            font-size: 24px; /* Increased font-size */
            text-transform: uppercase;
            border-bottom: 2px solid #FFD700;
            padding-bottom: 5px;
        }
        .boarding-pass .info {
            margin-bottom: 10px;
            font-size: 18px; /* Increased font-size */
            color: #ffffff;
        }
        .boarding-pass .info span {
            display: block;
            font-weight: bold;
            font-size: 22px; /* Increased font-size */
            color: #FFD700;
        }
        .boarding-pass .highlight {
            color: #FFD700;
            font-size: 22px; /* Increased font-size */
        }
        .boarding-pass .logo {
            margin-bottom: 10px;
        }
        .boarding-pass .logo img {
            width: 120px; /* Increased width */
        }
        .boarding-pass .qr-code img {
            width: 80px; /* Increased width */
            height: 80px; /* Increased height */
            margin-top: 10px;
        }
        .boarding-pass .barcode {
            height: 50px; /* Increased height */
            background: linear-gradient(to right, #ffffff 50%, transparent 50%);
            background-size: 10px 40px;
            margin-top: 15px;
            margin-left: 0;
        }
        .boarding-pass .date-class {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 5px;
            white-space: nowrap; /* Prevents wrapping to next line */
        }
        .boarding-pass .date-class .info.date-info {
            margin-right: 20px; /* Add space between Date and Class */
        }
        .boarding-pass .seat-numbers {
            margin-top: 10px;
            font-size: 20px; /* Increased font-size */
            color: #FFD700;
            text-align: left;
            position: relative;
            display: flex;
            gap: 10px;
            padding-left: 0;
            margin-left: -10px;
        }
        .boarding-pass .seat-numbers span {
            display: inline-block;
        }
        #download-btn {
            background-color: #FFD700;
            color: #002147;
            padding: 10px 20px;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 10;
        }
    </style>
</head>
<body>
<%
    String source = (String)request.getAttribute("source");
    String destination = (String)request.getAttribute("destination");
    String category = (String)request.getAttribute("category");
    String flightno = (String)request.getAttribute("flightno");
    String date = (String)request.getAttribute("date");
    String time = (String)request.getAttribute("time");
    String seatNumbers[]=(String[])request.getAttribute("seatnumbers");
    StringBuilder sb = new StringBuilder();
    for (String s : seatNumbers) {
        sb.append(s).append(" ");
    }

    // Convert StringBuilder to String and trim the trailing space
    String seat = sb.toString().trim();
    String gate="G12";

%>
    <div class="boarding-pass-container">
        <div class="boarding-pass" id="boarding-pass">
            <div class="background-pattern"></div>
            <div class="content">
                <div class="section">
                    <div class="logo">
                        <img src="OIP.jpg" alt="Airline Logo">
                    </div>
                    <div class="info">From: <span><%= source%></span></div>
                    <div class="info">Gate: <span><%=gate %></span></div>
                    <div class="date-class">
                        <div class="info date-info">Date: <span><%=date %></span></div> <!-- Added class date-info -->
                        <div class="info">Class: <span><%=category %></span></div>
                    </div>
                </div>
                <div class="section">
                    <div class="title">Boarding Pass</div>
                    <div class="info">Flight No: <span class="highlight"><%=flightno %></span></div>
                    <div class="qr-code">
                        <img src="OIP (1).jpg" alt="QR Code">
                    </div>
                    <div class="seat-numbers">
                        <span>Seat:</span><span><%=seat %></span>
                    </div>
                </div>
                <div class="section">
                    <div class="info">To: <span><%=destination %></span></div>
                    <div class="info">Time: <span><%=time %></span></div>
                    <div class="barcode"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- Download Button -->
    <button id="download-btn">Download as PDF</button>

    <!-- Include html2pdf.js from CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>

    <script>
        document.getElementById('download-btn').addEventListener('click', function () {
            // Create the PDF from the boarding pass
            const element = document.getElementById('boarding-pass');
            const opt = {
                margin: [10, 10, 10, 10], // Add margins to prevent content cutoff
                filename: 'boarding-pass.pdf',
                image: { type: 'jpeg', quality: 1.0 },
                html2canvas: { scale: 2, logging: true, dpi: 300, letterRendering: true },
                jsPDF: { unit: 'pt', format: 'a4', orientation: 'portrait' }
            };
            html2pdf().set(opt).from(element).toPdf().get('pdf').then(function(pdf) {
                // Save the PDF and then redirect
                pdf.save('boarding-pass.pdf');
                // Redirect after download
                setTimeout(function() {
                    window.location.href = 'thank-you.html';
                }, 500); // Delay to ensure the PDF download starts
            });
        });
    </script>
</body>
</html>
