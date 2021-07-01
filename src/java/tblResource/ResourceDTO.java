/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tblResource;

import java.sql.Date;

/**
 *
 * @author Quoc Huy
 */
public class ResourceDTO {
    String resourceID;
    String categoryID;
    String name;
    int quantity;
    String categoryName;
    String dateBook;
    public ResourceDTO() {
    }

    public ResourceDTO(String resourceID, String categoryID, String name, int quantity, String categoryName, String dateBook) {
        this.resourceID = resourceID;
        this.categoryID = categoryID;
        this.name = name;
        this.quantity = quantity;
        this.categoryName = categoryName;
        this.dateBook = dateBook;
    }

    public String getDateBook() {
        return dateBook;
    }

    public ResourceDTO(String resourceID) {
        this.resourceID = resourceID;
    }
    
    public void setDateBook(String dateBook) {
        this.dateBook = dateBook;
    }
    
    public ResourceDTO(String resourceID, String categoryID, String categoryName, String name, int quantity) {
        this.resourceID = resourceID;
        this.categoryID = categoryID;
        this.name = name;
        this.quantity = quantity;
        this.categoryName = categoryName;
    }

    public String getRoomID() {
        return resourceID;
    }

    public String getResourceID() {
        return resourceID;
    }

    public void setResourceID(String resourceID) {
        this.resourceID = resourceID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setRoomID(String roomID) {
        this.resourceID = resourceID;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
