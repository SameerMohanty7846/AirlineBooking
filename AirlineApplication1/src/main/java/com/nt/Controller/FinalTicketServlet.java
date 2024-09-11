package com.nt.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.nt.service.GetSeatService;


public class FinalTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
  
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String source=req.getParameter("source");
		String destination=req.getParameter("destination");
		String category=req.getParameter("category");
		String flightno=req.getParameter("flightno");
		String date=req.getParameter("date");
		String time=req.getParameter("time");
		Integer num =Integer.parseInt(req.getParameter("numberseat"));
		System.out.println(num);
		GetSeatService gs=new GetSeatService();
		
		String a[]=gs.getSeat(num, category);
		
		req.setAttribute("source", source);
		req.setAttribute("destination", destination);
		req.setAttribute("category", category);
		req.setAttribute("time", time);
		req.setAttribute("flightno", flightno);
		req.setAttribute("date", date);
		req.setAttribute("seatnumbers", a);
		RequestDispatcher rd=req.getRequestDispatcher("ticket.jsp");
		rd.forward(req, res);



	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
