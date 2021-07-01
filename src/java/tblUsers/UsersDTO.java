/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tblUsers;

import java.sql.Date;

/**
 *
 * @author Quoc Huy
 */
public class UsersDTO {
    String userID;
    String password;
    String name;
    int roleID;
    String phone;
    String address;
    Date createDate;
    String status;
    String email;
    String code;
    

    public UsersDTO() {
    }

    public UsersDTO(String userID, String password, String name, int roleID, String phone, String address, Date createDate) {
        this.userID = userID;
        this.password = password;
        this.name = name;
        this.roleID = roleID;
        this.phone = phone;
        this.address = address;
        this.createDate = createDate;
        
    }

    public UsersDTO(String userID, String email, String code) {
        this.userID = userID;
        this.email = email;
        this.code = code;
    }

    public UsersDTO(String email) {
        this.email = email;
    }
    
    public UsersDTO(String userID, String password, String name, int roleID, String phone, String address, Date createDate, String status, String email, String code) {
        this.userID = userID;
        this.password = password;
        this.name = name;
        this.roleID = roleID;
        this.phone = phone;
        this.address = address;
        this.createDate = createDate;
        this.status = status;
        this.email = email;
        this.code = code;
    }

    public UsersDTO(String userID, String password, String name, int roleID, String phone, String address, Date createDate, String status, String email) {
        this.userID = userID;
        this.password = password;
        this.name = name;
        this.roleID = roleID;
        this.phone = phone;
        this.address = address;
        this.createDate = createDate;
        this.status = status;
        this.email = email;
    }
    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    
    
}
