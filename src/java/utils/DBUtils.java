/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author Quoc Huy
 */
public class DBUtils {
    public static Connection getConnection() throws NamingException, SQLException{
        Context context =  new InitialContext();
        Context resource = (Context) context.lookup("java:comp/env");
        DataSource db = (DataSource) resource.lookup("DB");
        return db.getConnection();
    }
    
}
