package com.nt.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class BookTicketServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String source=req.getParameter("source");
		String dest=req.getParameter("destination");
		String price=req.getParameter("price");
		String time=req.getParameter("time");
		String flightno=req.getParameter("flightno");
		String category=req.getParameter("seattype");
		String date=req.getParameter("date");
		System.out.print(source);
		System.out.print(dest);
		System.out.print(category);
		System.out.print(price);
		System.out.print(time);
		System.out.print(flightno);
		System.out.print(date);
		
		req.setAttribute("source",source);
		req.setAttribute("dest",dest);
		req.setAttribute("price",price);
		req.setAttribute("time",time);
		req.setAttribute("flightno",flightno);
		req.setAttribute("seattype",category);
		req.setAttribute("date",date);


		
		RequestDispatcher rd=req.getRequestDispatcher("booking.jsp");
		rd.forward(req, res);


		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
