package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Users;

/**
 *
 * @author dell
 */
public class UsersDAO extends DBContext {

    private ArrayList<Users> usersList;
    Connection con;
    String status;

    public UsersDAO() throws SQLException {
        con = new DBContext().getConnection();
    }

    public UsersDAO(String user, String pass) throws SQLException {
        con = new DBContext(user, pass).getConnection();
    }

    public ArrayList<Users> getUserList() {
        usersList = new ArrayList<>();
        String sql = "select * from Users";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String userID = String.valueOf(rs.getInt(1));
                String userName = String.valueOf(rs.getString(2));
                String email = String.valueOf(rs.getString(3));
                String password = String.valueOf(rs.getString(4));
                String dob = String.valueOf(rs.getString(5));
                String gender = String.valueOf(rs.getString(6));
                String address = String.valueOf(rs.getString(7));
                String verifyCode = String.valueOf(rs.getString(8));
                String status = String.valueOf(rs.getString(9));
                String userRole = String.valueOf(rs.getString(10));
                Users user = new Users(userID, userName, email, password, dob, gender, address, verifyCode, status, userRole);

                usersList.add(user);
            }
        } catch (Exception e) {
            status = "Error getUserList:" + e.getMessage();
            System.out.println(status);
        }
        return usersList;
    }

    public int insertUser(Users user) throws SQLException {
        String sql = "insert into [Users] (userName, email,"
                + "password, dob, gender, address, verifyCode, status, userRole)"
                + " values (?, ?, ?, ?, ?, ?, ?, ?, ?) ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getVerifyCode());
            ps.setString(7, user.getStatus());
            ps.setString(8, user.getUserRole());

            return ps.executeUpdate();
        } catch (SQLException e) {
            status = "Error at insert User" + e.getMessage();
            System.out.println(status);
        }
        return 0;
    }

    public int updateUser(Users user) throws SQLException {
        String sql = "update [Users] set "
                + "userName=?, email=?,"
                + "password=?, dob=?,"
                + "gender=?, address=?,"
                + "status=? "
                + "where userID=? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getDob());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getStatus());
            ps.setString(8, user.getUserID());

            return ps.executeUpdate();
        } catch (SQLException e) {
            status = "Error at updateUser:" + e.getMessage();
            System.out.println(status);
        }
        return 0;
    }

    public int checkUserLogin(String email, String password) {
        String sql = "select * from Users WHERE email=?";
        Users user = new Users();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String userID = String.valueOf(rs.getInt(1));
                String userName = String.valueOf(rs.getString(2));
                String email1 = String.valueOf(rs.getString(3));
                String password1 = String.valueOf(rs.getString(4));
                String dob = String.valueOf(rs.getString(5));
                String gender = String.valueOf(rs.getString(6));
                String address = String.valueOf(rs.getString(7));
                String verifyCode = String.valueOf(rs.getString(8));
                String status = String.valueOf(rs.getString(9));
                String userRole = String.valueOf(rs.getString(10));
                user = new Users(userID, userName, email1, password1, dob, gender, address, verifyCode, status, userRole);
            }
        } catch (SQLException e) {
            status = "Error at checkLogin: " + e.getMessage();
            System.out.println(status);
        }
        if (user != null) {
            try {
                if (user.getEmail().equals(email)) {
                    if (user.getPassword().equals(password)) {
                        if (user.getStatus().equals("2")) {
                            return 2; //not verify
                        }
                        if (user.getStatus().equals("1")) {
                            return 1; //=email, =passs
                        }
                        if (user.getStatus().equals("3")) {
                            return 3; //=deactive account
                        }
                        if (user.getStatus().equals("4")) {
                            return 4; //=email, !=pass
                        }
                    }
                }
                return 0; //!= email

            } catch (Exception e) {
                System.out.println("checkLogin in checkContition: " + e.getMessage());
            }
        }
        return -1;
    }

    public int checkUserForgetPassword(String email, String dob) {
        ArrayList<Users> userList = getUserList();
        for (Users user : userList) {
            if (user.getEmail().equals(email)) { // exist email
                if (user.getDob().equals(dob)) { // =dob
                    return 1;
                } else { // !=  dob
                    return 2;
                }
            }
        }
        return 0; //no exist email
    }

    public Users getUserByEmail(String email) {
        ArrayList<Users> userList = getUserList();
        for (Users user : userList) {
            if (user.getEmail().equals(email)) {
                return user;
            }
        }
        return null;
    }

}
