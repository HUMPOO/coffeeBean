import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteCoffeeBeanServlet")
public class DeleteCoffeeBeanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/CoffeeShopDB"; 
    private static final String USER = "root"; // Replace with your MySQL username
    private static final String PASS = "sem_123456789"; // Replace with your MySQL password

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");

        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            
            deleteCoffeeBeanFromDatabase(name);

            
            out.println("<html>");
            out.println("<head><title>Operation Successful</title></head>");
            out.println("<body style='font-family: Arial, sans-serif; background-color: #f7f7f7; color: #333;'>");
            out.println("<div style='max-width: 600px; margin: 50px auto; background: #fff; padding: 30px; border-radius: 10px; box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);'>");
            out.println("<h1 style='color: #4CAF50; text-align: center;'>Coffee Bean Deleted Successfully</h1>");
            out.println("<a href='index.html' style='display: block; margin-top: 20px; text-align: center; color: #4CAF50;'>Delete Another Coffee Bean</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h1 style='color: red; text-align: center;'>Deletion Failed</h1>");
        } finally {
            out.close();
        }
    }

    private void deleteCoffeeBeanFromDatabase(String name) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(DB_URL, USER, PASS);

           
            String sql = "DELETE FROM CoffeeBeans WHERE name = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);

            
            pstmt.executeUpdate();

        } catch (SQLException | ClassNotFoundException se) {
            se.printStackTrace();
            throw new SQLException("Error deleting the coffee bean information from the database.", se);
        } finally {
            
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
