/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tblUsers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import utils.DBUtils;

/**
 *
 * @author Quoc Huy
 */
public class UsersDAO {
    Connection conn = null;
    PreparedStatement stm = null;
    ResultSet rs = null;
    
    private void closeConnection() throws SQLException{
        if(rs!=null){
            rs.close();
        }
        if(stm!=null){
            stm.close();
        }
        if(conn!=null){
           conn.close();
        }
    }
    
    public UsersDTO checkLogin(String userID, String password) throws SQLException, NamingException{
        UsersDTO user = null;
        try {
            conn = DBUtils.getConnection();
           String sql = "SELECT status, name, roleID FROM tblUsers WHERE userID = ? AND password = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if(rs.next()){
                String name = rs.getString("name");
                int roleID = rs.getInt("roleID");
                String status = rs.getString("status");
                user = new UsersDTO(userID, password, name, roleID, "", "",null, status, "");
            }
        }finally{
            closeConnection();
        }
        return user;
    }
    
    public UsersDTO checkLogin(String email) throws SQLException, NamingException{
        UsersDTO user = null;
        try {
            conn = DBUtils.getConnection();
           String sql = "SELECT userID, password, name, roleID FROM tblUsers WHERE email = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if(rs.next()){
                String userID = rs.getString("userID");
                String password = rs.getString("password");
                String name = rs.getString("name");
                int roleID = rs.getInt("roleID");
                user = new UsersDTO(userID, password, name, roleID, "", "", null);
            }
        }finally{
            closeConnection();
        }
        return user;
    }
    
    
    public UsersDTO checkLoginGG(String email ) throws NamingException, SQLException{
        UsersDTO user = new UsersDTO();
        try {
        conn = DBUtils.getConnection();
        String sql = "SELECT gmail,name FROM tblUsers WHERE userID = ?";
        stm  = conn.prepareStatement(sql);
        stm.setString(1, email);
        }finally{
            closeConnection();
        }
        return user;
    }
    
    public UsersDTO checkGmailCreate(String email) throws NamingException, SQLException{
        UsersDTO user = new UsersDTO(email);
        try {
        conn = DBUtils.getConnection();
        String sql = "SELECT gmail FROM tblUsers";
        stm  = conn.prepareStatement(sql);
        }finally{
            closeConnection();
        }
        return user;
    }
    
    public String checkCode(String userID ) throws NamingException, SQLException{
        String code = null;
        try {
        conn = DBUtils.getConnection();
        String sql = "SELECT code FROM tblUsers WHERE userID = ?";
        stm  = conn.prepareStatement(sql);
        stm.setString(1, userID);
        rs = stm.executeQuery();
        while(rs.next()){
            code = rs.getString(1);
        }
        }finally{
            closeConnection();
        }
        return code;
    }
    
    public boolean createUser(UsersDTO dto) throws NamingException, SQLException{
        try {
            conn = DBUtils.getConnection();
            String sql = "INSERT INTO tblUsers(userID, roleID, password, name, phone, address, email, code) VALUES(?,?,?,?,?,?,?,?)";
            stm = conn.prepareStatement(sql);
            stm.setString(1, dto.getUserID());
            stm.setInt(2, dto.getRoleID());
            stm.setString(3, dto.getPassword());
            stm.setString(4, dto.getName());
            stm.setString(5, dto.getPhone());
            stm.setString(6, dto.getAddress());
            stm.setString(7, dto.getEmail());
            stm.setString(8, dto.getCode());
            stm.executeUpdate();
        } 
        finally {
            closeConnection();
        }
        return false;
    }
    
    public boolean updateUser(String userID) throws NamingException, SQLException{
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            String sql = "UPDATE tblUsers SET status='Active'  WHERE userID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            check = stm.executeUpdate() > 0 ;
        }finally{
            closeConnection();
        }return check; 
    }
    
    
    
}
