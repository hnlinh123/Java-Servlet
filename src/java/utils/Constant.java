/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

/**
 *
 * @author dell
 */
public class Constant {
    
    
    //format regex
    String format_email = "/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$/";
    String format_phoneNumber = "/(84|0[3|5|7|8|9])+([0-9]{8})\b/g";
    String format_string = "[a-zA-Z0-9 ]+";
    String format_date = "\\d{1,2}[/]\\d{1,2}[/]\\d{1,4}";
    String format_link = "https://" + "[a-zA-Z0-9/,.-+?]+";
    String format_number = "[0-9+]";

    //tong ki tu de random
    String alpha = "abcdefghijklmnopqrstuvwxyz"; // a-z
    String alphaUpperCase = alpha.toUpperCase(); // A-Z
    String digits = "0123456789"; // 0-9
    String ALPHA_NUMERIC = alpha + alphaUpperCase + digits;


}
