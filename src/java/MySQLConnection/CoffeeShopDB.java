

package MySQLConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




public class CoffeeShopDB {

    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/CoffeeShopDB"; 
    private static final String USER = "root"; 
    private static final String PASS = "sem_123456789"; 

    public static void main(String[] args) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");

            
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            
            System.out.println("Creating statement...");
            String sql = "SELECT id, name, type, bean_type, roasting, price, menu_appropriateness FROM CoffeeBeans";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            
            while (rs.next()) {
                
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String type = rs.getString("type");
                String beanType = rs.getString("bean_type");
                String roasting = rs.getString("roasting");
                double price = rs.getDouble("price");
                String menuAppropriateness = rs.getString("menu_appropriateness");

               
                System.out.print("ID: " + id);
                System.out.print(", Name: " + name);
                System.out.print(", Type: " + type);
                System.out.print(", Bean Type: " + beanType);
                if (beanType.equals("roasted")) {
                    System.out.print(", Roasting: " + roasting);
                }
                System.out.print(", Price: " + price);
                System.out.println(", Menu Appropriateness: " + menuAppropriateness);
            }

        } catch (SQLException se) {
           
            se.printStackTrace();
        } catch (Exception e) {
           
            e.printStackTrace();
        } finally {
   
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }

        System.out.println("baybye!");
    }
}
