/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dell
 */
public class Users {
    String userID, userName, email, password, dob, gender, address, verifyCode, status, userRole;

    public Users() {
    }

    public Users(String userID, String userName, String email, String password, String dob, String gender, String address, String verifyCode, String status, String userRole) {
        this.userID = userID;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.verifyCode = verifyCode;
        this.status = status;
        this.userRole = userRole;
    }

    public Users(String userName, String email, String password, String dob, String gender, String address, String verifyCode, String status, String userRole) {
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.verifyCode = verifyCode;
        this.status = status;
        this.userRole = userRole;
    }
      

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    @Override
    public String toString() {
        return "Users{" + "userID=" + userID + ", userName=" + userName + ", email=" + email + ", password=" + password + ", dob=" + dob + ", gender=" + gender + ", address=" + address + ", verifyCode=" + verifyCode + ", status=" + status + ", userRole=" + userRole + '}';
    }
    
    
    
}
