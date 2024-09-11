package com.nt.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.nt.DAO.DatabaseConnection;
import com.nt.bean.SearchBean;

public class SearchService {
	private static final String SEARCHQUERY=" select * from flightdata where source=? AND destination=?";
	public ArrayList<SearchBean> search(SearchBean sb) {
		ArrayList<SearchBean> al=new ArrayList<SearchBean>();

		try {
			DatabaseConnection dc=new DatabaseConnection();
			Connection con=dc.getDatabaseConnection();
			PreparedStatement ps=con.prepareStatement(SEARCHQUERY);
			ps.setString(1, sb.getSource());
			ps.setString(2, sb.getDest());
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				SearchBean sb2=new SearchBean();
				sb2.setSource(rs.getString("source").toUpperCase());
				sb2.setDest(rs.getString("destination").toUpperCase());
				sb2.setCategory(rs.getString("catagory").toUpperCase());
				sb2.setSeatType(rs.getString("seat").toUpperCase());
				sb2.setPrice(rs.getInt("price"));
				sb2.setDprice(rs.getInt("dprice"));
				sb2.setTime(rs.getString("time").toUpperCase());
				sb2.setFlightNo(rs.getString("flightno").toUpperCase());

				al.add(sb2);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return al;
	     
	}

}
