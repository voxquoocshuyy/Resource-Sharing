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
public class UsersErrorDTO {
    String userIDError;
    String passwordError;
    String phoneError;
    String nameError;
    String emailError;
    String addressError;
    String confirmPassword;


    public UsersErrorDTO(String userIDError, String passwordError, String phoneError, String nameError, String addressError, Date createDateError, String emailError) {
        this.userIDError = userIDError;
        this.passwordError = passwordError;
        this.phoneError = phoneError;
        this.nameError = nameError;
        this.addressError = addressError;
        this.emailError = emailError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public UsersErrorDTO() {
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }


    
}
