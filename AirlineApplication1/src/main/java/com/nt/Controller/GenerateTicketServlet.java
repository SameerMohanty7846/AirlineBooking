package com.nt.Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class GenerateTicketServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	String source=req.getParameter("source");
	String destination=req.getParameter("destination");
	String category=req.getParameter("category");
	String price=req.getParameter("price");
	String time=req.getParameter("time");
	String flightno=req.getParameter("flightno");
	String date=req.getParameter("date");
	String numberseat =req.getParameter("number-seat");
	int p=Integer.parseInt(price);
	int nS=Integer.parseInt(numberseat);
	int bill=p*nS;
	String totalBill=String.valueOf(bill);
	
	req.setAttribute("source", source);
	req.setAttribute("destination", destination);
	req.setAttribute("category", category);
	req.setAttribute("price", price);
	req.setAttribute("time", time);
	req.setAttribute("flightno", flightno);
	req.setAttribute("date", date);
	req.setAttribute("numberseat", numberseat);
	req.setAttribute("totalBill", totalBill);
	
	
	System.out.println(totalBill);
	RequestDispatcher rd=req.getRequestDispatcher("generate-ticket.jsp");
	rd.forward(req, res);

	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
