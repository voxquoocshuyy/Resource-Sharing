/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tblRequest;

import java.sql.Date;

/**
 *
 * @author Quoc Huy
 */
public class RequestDTO {

    private int requestID;
    private Date dateBook;
    private String statusreqName;
    private String userID;
    private String resourceID;
    private String resourceName;

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public RequestDTO() {
    }

    public RequestDTO(String userID, String resourceID) {
        this.userID = userID;
        this.resourceID = resourceID;
    }

    public RequestDTO(int requestID) {
        this.requestID = requestID;
    }
    
    public RequestDTO(Date dateBook, String statusreqName, String userID, String resourceName) {
        this.dateBook = dateBook;
        this.statusreqName = statusreqName;
        this.userID = userID;
        this.resourceName = resourceName;
    }

  

    public RequestDTO(int requestID, Date dateBook, String statusreqName, String userID, String resourceID) {
        this.requestID = requestID;
        this.dateBook = dateBook;
        this.statusreqName = statusreqName;
        this.userID = userID;
        this.resourceID = resourceID;
    }

    public int getRequestID() {
        return requestID;
    }

    public void setRequestID(int requestID) {
        this.requestID = requestID;
    }

    public Date getDateBook() {
        return dateBook;
    }

    public void setDateBook(Date dateBook) {
        this.dateBook = dateBook;
    }

    public String getStatusreqName() {
        return statusreqName;
    }

    public void setStatusreqName(String statusreqName) {
        this.statusreqName = statusreqName;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getResourceID() {
        return resourceID;
    }

    public void setResourceID(String resourceID) {
        this.resourceID = resourceID;
    }
    
}
