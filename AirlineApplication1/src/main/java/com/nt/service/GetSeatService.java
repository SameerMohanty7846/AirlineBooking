package com.nt.service;

import java.util.Random;

public class GetSeatService {
	public String[] getSeat(int num,String catagory) {
		String a="c";
		String array[]=new String[num];	
		
		if(catagory.equals("PREMIUMECONOMY")) {
			a="P";
			
		}else if(catagory.equals("ECONOMY")) {
			a="E";
			
		}else if(catagory.equals("BUSINESS")) {
			a="B";
			
		}else {
			System.out.println("EXCEPTION");
		}
		
		int min = 1;
        int max = 50;
        Random random = new Random();
        int randomNumber = random.nextInt(max - min + 1) + min;
        
        for(int i=0;i<num;i++) {
        	String r=String.valueOf(randomNumber);
            
        	
        	String temp=a.concat(r);
        	array[i]=temp;
        	randomNumber++;
        }
        
        return array;

	}

}
