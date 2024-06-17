/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

/**
 *
 * @author dell
 */
public class Utility {
    Constant constant = new Constant();
    
    //ham random
    private Random generator = new Random();

    //method random
    public int randomNumber(int min, int max) {
        return generator.nextInt((max - min) + 1) + min;
    }

    public String createCaptcha() {
        StringBuilder string = new StringBuilder();
        //gioi han 6 ky tu
        for (int i = 0; i < 6; i++) {
            int number = randomNumber(0, constant.ALPHA_NUMERIC.length() - 1);
            char ch = constant.ALPHA_NUMERIC.charAt(number);
            string.append(ch);
        }
        //chuyen string builder sang string
        return string.toString();
    }
    
    public String convertDateToString(Date date){
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        return dt.format(date);
    }
    
    
}

