package com.nt.test;

import com.nt.service.GetSeatService;

public class Demo {

	public static void main(String[] args) {
		GetSeatService gs=new GetSeatService();
		String a[]=gs.getSeat(5, "PREMIUMECONOMY");
		System.out.println(a.toString());
		for(String s:a) {
			System.out.println(s);
		}
		 StringBuilder sb = new StringBuilder();
	        for (String s : a) {
	            sb.append(s).append(" ");
	        }

	        // Convert StringBuilder to String and trim the trailing space
	        String result = sb.toString().trim();

	        // Output the result
	        System.out.println("Concatenated String: " + result);


	}

}
