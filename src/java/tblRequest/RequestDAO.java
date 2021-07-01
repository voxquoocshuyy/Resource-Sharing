/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tblRequest;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import tblResource.ResourceDAO;
import utils.DBUtils;

/**
 *
 * @author Quoc Huy
 */
public class RequestDAO {

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

    public boolean addRequest(RequestDTO dto) throws NamingException, SQLException {
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT quantity FROM tblResource WHERE resourceID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, dto.getResourceID());
            rs = stm.executeQuery();
            if (rs.next()) {
                int quantity = rs.getInt("quantity");
                if (quantity == 0) {
                    return false;
                }
            }
            String sql1 = "INSERT INTO tblRequest(userID,resourceID) VALUES(?,?)";
            stm = conn.prepareStatement(sql1);
            stm.setString(1, dto.getUserID());
            stm.setString(2, dto.getResourceID());
            return stm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
    }

    public ArrayList<RequestDTO> getAllRequest(int page) throws NamingException, SQLException {
        ArrayList<RequestDTO> list = null;
        ResourceDAO reDAO = new ResourceDAO();
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT requestID,dateBook,statusreqName,userID,resourceID FROM tblRequest "
                    + "ORDER BY dateBook DESC OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY";
            stm = conn.prepareStatement(sql);
            stm.setInt(1, page);
            rs = stm.executeQuery();
            while (rs.next()) {
                if (list == null) {
                    list = new ArrayList<>();
                }
                int requestID = rs.getInt(1);
                Date dateBook = rs.getDate(2);
                String statusreqName = rs.getString(3);
                String userID = rs.getString(4);
                String resourceID = rs.getString(5);
                String resourceName = reDAO.getById(conn, resourceID).getName();
                RequestDTO dto = new RequestDTO(requestID, dateBook, statusreqName, userID, resourceID);
                dto.setResourceName(resourceName);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public int getTotal() {
        ArrayList<RequestDTO> list = null;
        int total = 0;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT requestID FROM tblRequest";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                if (list == null) {
                    list = new ArrayList<>();
                }
                int requestID = rs.getInt("requestID");
                RequestDTO dto = new RequestDTO(requestID);
                list.add(dto);
                total = list.size();
            }
        } catch (Exception e) {
        }
        return total;
    }

    public ArrayList<RequestDTO> searchRequest(String content, int page) throws NamingException, SQLException {
        ArrayList<RequestDTO> list = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT B.requestID, B.dateBook, A.name, B.userID, B.statusreqName\n"
                    + "FROM tblResource A JOIN tblRequest B ON A.resourceID = B.resourceID\n"
                    + "WHERE A.name LIKE ?\n"
                    + "ORDER BY B.dateBook DESC\n"
                    + "OFFSET ? ROWS \n"
                    + "FETCH NEXT 20 ROWS ONLY";
            stm = conn.prepareStatement(sql);
            stm.setString(1, "%" + content + "%");
            stm.setInt(2, page * 20);
            rs = stm.executeQuery();
            while (rs.next()) {
                if (list == null) {
                    list = new ArrayList<>();
                }
                int requestID = rs.getInt("requestID");
                Date dateBook = rs.getDate("dateBook");
                String statusreqName = rs.getString("statusreqName");
                String userID = rs.getString("userID");
                String resourceName = rs.getString("name");
                RequestDTO dto = new RequestDTO(dateBook, statusreqName, userID, resourceName);
                dto.setRequestID(requestID);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public int adminGetTotal(String content) throws NamingException, SQLException {
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) as total\n"
                    + "FROM tblResource A JOIN tblRequest B ON A.resourceID = B.resourceID\n"
                    + "WHERE A.name LIKE ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, "%" + content + "%");
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

    public int userGetTotal(String content, String userID) throws NamingException, SQLException {
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT count(*) as total\n"
                    + "FROM tblResource A JOIN tblRequest B ON A.resourceID = B.resourceID\n"
                    + "WHERE A.name LIKE ? AND B.userID = ?\n"; 
            stm = conn.prepareStatement(sql);
            stm.setString(1, "%" + content + "%");
            stm.setString(2, userID);
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

    public ArrayList<RequestDTO> UserSearch(String content, String userID, int page) throws NamingException, SQLException {
        ArrayList<RequestDTO> list = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT B.requestID, B.dateBook, A.name, B.userID, B.statusreqName\n"
                    + "FROM tblResource A JOIN tblRequest B ON A.resourceID = B.resourceID\n"
                    + "WHERE A.name LIKE ? AND B.userID = ?\n"
                    + "ORDER BY B.dateBook DESC\n"
                    + "OFFSET ? ROWS \n"
                    + "FETCH NEXT 20 ROWS ONLY";
            stm = conn.prepareStatement(sql);
            stm.setString(1, "%" + content + "%");
            stm.setString(2, userID);
            stm.setInt(3, page * 20);
            rs = stm.executeQuery();
            while (rs.next()) {
                if (list == null) {
                    list = new ArrayList<>();
                }
                int requestID = rs.getInt("requestID");
                Date dateBook = rs.getDate("dateBook");
                String statusreqName = rs.getString("statusreqName");
                String resourceName = rs.getString("name");
                RequestDTO dto = new RequestDTO(dateBook, statusreqName, userID, resourceName);
                dto.setRequestID(requestID);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public ArrayList<RequestDTO> userSearchRequest(String userID, int page) throws NamingException, SQLException {
        ArrayList<RequestDTO> list = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT B.requestID, B.dateBook, A.name, B.userID, B.statusreqName\n"
                    + "FROM tblResource A JOIN tblRequest B ON A.resourceID = B.resourceID\n"
                    + "WHERE B.userID = ?\n"
                    + "ORDER BY B.dateBook DESC\n"
                    + "OFFSET ? ROWS \n"
                    + "FETCH NEXT 20 ROWS ONLY";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            stm.setInt(2, page * 20);
            rs = stm.executeQuery();
            while (rs.next()) {
                if (list == null) {
                    list = new ArrayList<>();
                }
                int requestID = rs.getInt("requestID");
                Date dateBook = rs.getDate("dateBook");
                String statusreqName = rs.getString("statusreqName");
                String resourceName = rs.getString("name");
                RequestDTO dto = new RequestDTO(dateBook, statusreqName, userID, resourceName);
                dto.setRequestID(requestID);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public boolean DeleteStatus(String requestID) throws NamingException, SQLException {
        try {
            conn = DBUtils.getConnection();
            String sql = "UPDATE tblRequest SET statusreqName='Delete' WHERE requestID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, requestID);
            return stm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
    }

    public boolean AcceptStatus(String requestID, String resourceID) throws NamingException, SQLException {
        ResourceDAO dao = new ResourceDAO();
        try {
            conn = DBUtils.getConnection();
            String sql = "UPDATE tblRequest SET statusreqName='Accept' WHERE requestID = ?";

            stm = conn.prepareStatement(sql);
            stm.setString(1, requestID);
            stm.executeUpdate();
            return dao.updateQuantity(conn, resourceID);
        } finally {
            closeConnection();
        }
    }

    public boolean UserDeleteRequest(int requestID, String status) throws NamingException, SQLException {
        try {
            conn = DBUtils.getConnection();
            String sql = "DELETE FROM tblRequest WHERE requestID = ? AND statusreqName='New'";
            stm = conn.prepareStatement(sql);
            stm.setInt(1, requestID);
            return stm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
    }

}
