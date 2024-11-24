package pawcage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;

@WebServlet("/getImage")
public class ImageServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/pawfect";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String petId = request.getParameter("id"); // Get the pet ID from the query string
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String query = "SELECT picture, imageType FROM pets WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, petId);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                byte[] imgData = rs.getBytes("picture"); // Retrieve image data as a byte array
                String imageType = rs.getString("imageType"); // Retrieve image MIME type (e.g., "image/png")

                response.setContentType(imageType); // Dynamically set the content type
                OutputStream out = response.getOutputStream();
                out.write(imgData); // Write image data to the response
                out.close();
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found for pet ID: " + petId);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading image");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
