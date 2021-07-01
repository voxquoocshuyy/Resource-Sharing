/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tblCategory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBUtils;

/**
 *
 * @author Quoc Huy
 */
public class CategoryDAO {

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

    public List<CategoryDTO> getAll() throws NamingException, SQLException {
        List<CategoryDTO> list = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT categoryID, categoryName FROM tblCategory";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                if (list == null) {
                    list = new ArrayList<>();
                }
                String id = rs.getString(1);
                String name = rs.getString(2);
                list.add(new CategoryDTO(id, name));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public CategoryDTO getById(Connection conn, String id) throws NamingException, SQLException {
        String sql = "SELECT categoryName FROM tblCategory WHERE categoryID = ?";
        stm = conn.prepareStatement(sql);
        stm.setString(1, id);
        rs = stm.executeQuery();
        if (rs.next()) {
            String name = rs.getString(1);
            return new CategoryDTO(id, name);
        }

        return null;
    }
}
