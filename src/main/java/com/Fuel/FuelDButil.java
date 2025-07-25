package com.Fuel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FuelDButil {
    
    public static boolean insertCustomer(String fullname, String email, String contact, String address, 
                                       String fuelType, String volume, String price) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicleservice", "root", "29014");
            
            String sql = "INSERT INTO payment VALUES (0, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            
            pstmt.setString(1, fullname);
            pstmt.setString(2, email);
            pstmt.setString(3, contact);
            pstmt.setString(4, address);
            pstmt.setString(5, fuelType);
            pstmt.setString(6, volume);
            pstmt.setString(7, price);
            
            int rs = pstmt.executeUpdate();
            isSuccess = rs > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }
    
    public static List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicleservice", "root", "29014");
            
            String sql = "SELECT * FROM payment ORDER BY id DESC";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String contact = rs.getString("contact");
                String address = rs.getString("address");
                String fuelType = rs.getString("fuelType");
                String volume = rs.getString("volume");
                String price = rs.getString("price");
                
                Payment payment = new Payment(id, fullname, email, contact, address, fuelType, volume, price);
                payments.add(payment);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return payments;
    }
    
    public static Payment getPaymentById(int paymentId) {
        Payment payment = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicleservice", "root", "29014");
            
            String sql = "SELECT * FROM payment WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, paymentId);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String contact = rs.getString("contact");
                String address = rs.getString("address");
                String fuelType = rs.getString("fuelType");
                String volume = rs.getString("volume");
                String price = rs.getString("price");
                
                payment = new Payment(id, fullname, email, contact, address, fuelType, volume, price);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return payment;
    }
    
    public static boolean updatePayment(int id, String fullname, String email, String contact, String address, 
                                      String fuelType, String volume, String price) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicleservice", "root", "29014");
            
            String sql = "UPDATE payment SET fullname=?, email=?, contact=?, address=?, fuelType=?, volume=?, price=? WHERE id=?";
            pstmt = con.prepareStatement(sql);
            
            pstmt.setString(1, fullname);
            pstmt.setString(2, email);
            pstmt.setString(3, contact);
            pstmt.setString(4, address);
            pstmt.setString(5, fuelType);
            pstmt.setString(6, volume);
            pstmt.setString(7, price);
            pstmt.setInt(8, id);
            
            int rs = pstmt.executeUpdate();
            isSuccess = rs > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }
    
    public static boolean deletePayment(int id) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicleservice", "root", "29014");
            
            String sql = "DELETE FROM payment WHERE id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            
            int rs = pstmt.executeUpdate();
            isSuccess = rs > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }
}