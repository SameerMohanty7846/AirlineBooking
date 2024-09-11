package com.nt.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import com.nt.bean.SearchBean;
import com.nt.service.SearchService;

public class SearchServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		String source = req.getParameter("source");
		String destination = req.getParameter("dest");
		String date=req.getParameter("DATE");
		
		
		SearchBean sb = new SearchBean();
		sb.setSource(source);
		sb.setDest(destination);
		sb.setCategory(null);
		sb.setDprice(0);
		sb.setPrice(0);
		sb.setTime(null);
		sb.setFlightNo(null);

		sb.setSeatType(null);
		SearchService ss = new SearchService();
		ArrayList<SearchBean> sd = ss.search(sb);
		for(SearchBean x:sd) {
			System.out.print(x.getSource()+" ");
			System.out.print(x.getDest()+" ");
			System.out.print(x.getCategory()+" ");
			System.out.print(x.getSeatType()+" ");
			System.out.print(x.getPrice()+" ");
			System.out.print(x.getDprice()+" ");
			System.out.print(x.getTime()+" ");
			System.out.println(x.getFlightNo());

			System.out.println(date);


			
		}
		req.setAttribute("a1", sd);
		req.setAttribute("a2", date);
		RequestDispatcher rd = req.getRequestDispatcher("display-searchdata.jsp");
		rd.forward(req, res);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
