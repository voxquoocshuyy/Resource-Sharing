/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tblResource;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import tblCategory.CategoryDAO;
import utils.DBUtils;

/**
 *
 * @author Quoc Huy
 */
public class ResourceDAO {

    Connection conn = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public int userGetTotal(String name, String categoryName, String dateBook) throws NamingException, SQLException {
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT count(*) as total\n"
                    + "FROM tblResource JOIN tblCategory ON tblResource.categoryID = tblCategory.categoryID\n"
                    + "WHERE name LIKE ? AND quantity > 0 \n";
            if (categoryName != null) {
                sql += "AND tblCategory.categoryName LIKE '%" + categoryName + "%'\n";
            }
            if (dateBook != null) {
                sql += " AND dateBook = '" + dateBook + "'\n";
            }

            stm = conn.prepareStatement(sql);
            stm.setString(1, "%" + name + "%");
            rs = stm.executeQuery();
            if (rs.next()) {
                int total = rs.getInt("total");
                return total;
            }
        } finally {
            closeConnection();
        }
        return -1;
    }

    public List<ResourceDTO> viewResouce(String name, String categoryName, String dateBook, int page) throws NamingException, SQLException {
        List<ResourceDTO> list = null;
        CategoryDAO cateDAO = new CategoryDAO();
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT resourceID, tblCategory.categoryID, name, quantity, dateBook\n"
                    + "FROM tblResource JOIN tblCategory ON tblResource.categoryID = tblCategory.categoryID\n"
                    + "WHERE name LIKE ? AND quantity > 0 \n";
            if (categoryName != null) {
                sql += "AND tblCategory.categoryName LIKE '%" + categoryName + "%'\n";
            }
            if (dateBook != null) {
                sql += " AND dateBook = '" + dateBook + "'\n";
            }
            sql += "ORDER BY resourceID\n"
                    + "OFFSET ? ROWS \n"
                    + "FETCH NEXT 20 ROWS ONLY";
            stm = conn.prepareStatement(sql);
            stm.setString(1, "%" + name + "%");
            stm.setInt(2, page * 20);
            rs = stm.executeQuery();
            while (rs.next()) {
                if (list == null) {
                    list = new ArrayList<>();
                }
                String resourceID = rs.getString(1);
                String categoryID = rs.getString(2);
                String categoryName1 = cateDAO.getById(conn, categoryID).getCategoryName();
                String name1 = rs.getString(3);
                int quantity = rs.getInt(4);
                String dateBook1 = rs.getString("dateBook");
                list.add(new ResourceDTO(resourceID, categoryID, name1, quantity, categoryName1, dateBook1));
            }
        } finally {
            closeConnection();
        }

        return list;
    }

    public int getTotal() {
        ArrayList<ResourceDTO> list = null;
        int total = 0;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT resourceID FROM tblResource";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                if (list == null) {
                    list = new ArrayList<>();
                }
                String resourceID = rs.getString("resourceID");
                ResourceDTO dto = new ResourceDTO(resourceID);
                list.add(dto);
                total = list.size();
            }
        } catch (Exception e) {
        }
        return total;
    }

    public ResourceDTO getById(Connection conn, String id) throws NamingException, SQLException {
        String sql = "SELECT name FROM tblResource WHERE resourceID = ?";
        stm = conn.prepareStatement(sql);
        stm.setString(1, id);
        rs = stm.executeQuery();
        if (rs.next()) {
            String name = rs.getString(1);
            ResourceDTO dto = new ResourceDTO();
            dto.setName(name);
            return dto;
        }
        return null;
    }

    public boolean updateQuantity(Connection conn, String resourceID) throws SQLException {
        try {
            String sql = "update tblResource set quantity = quantity - 1 WHERE resourceID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, resourceID);
            return stm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
    }
}
