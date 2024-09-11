package com.nt.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class PaymentServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		    String source=req.getParameter("source");
		    String destination=req.getParameter("destination");
		    String category=req.getParameter("category");
		    String price=req.getParameter("price");
		    String time=req.getParameter("time");
		    String flightno=req.getParameter("flightno");
		    String date=req.getParameter("date");
		    String numberseat =req.getParameter("numberseat");;
		    String totalBill=req.getParameter("totalBill");
		    String phone=req.getParameter("phone");
		    String name=req.getParameter("name");
		    
		    req.setAttribute("source", source);
			req.setAttribute("destination", destination);
			req.setAttribute("category", category);
			req.setAttribute("price", price);
			req.setAttribute("time", time);
			req.setAttribute("flightno", flightno);
			req.setAttribute("date", date);
			req.setAttribute("numberseat", numberseat);
			req.setAttribute("totalBill", totalBill);
			req.setAttribute("phone", phone);
			req.setAttribute("name", name);
			
			System.out.println(numberseat);
			
			RequestDispatcher rd=req.getRequestDispatcher("payment.jsp");
			rd.forward(req, res);


		    
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
