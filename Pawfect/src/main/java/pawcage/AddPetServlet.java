package pawcage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/AddPetServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB (threshold for storing file in memory)
        maxFileSize = 1024 * 1024 * 10,      // 10MB (max file size)
        maxRequestSize = 1024 * 1024 * 50    // 50MB (max request size)
)
public class AddPetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String animalType = request.getParameter("animalType");
        String ageStr = request.getParameter("age");
        int age = Integer.parseInt(ageStr);
        String breed = request.getParameter("breed");
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String gender = request.getParameter("gender");
        String medicStats = request.getParameter("medicalStatus");
        String priceStr = request.getParameter("price");
        double price = Double.parseDouble(priceStr);
        String email = request.getParameter("email");

        Part picturePart = request.getPart("picture");
        InputStream pictureStream = null;
        String imageType = null;

        if (picturePart != null) {
            pictureStream = picturePart.getInputStream();
            imageType = picturePart.getContentType(); // Get MIME type of the image (e.g., image/jpeg, image/png)
        }

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pawfect", "root", "root");

            // Insert SQL query with imageType column
            String sql = "INSERT INTO Pets (animalType, age, breed, name, location, gender, medicalStatus, price, email, picture, imageType) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, animalType);
            stmt.setInt(2, age);
            stmt.setString(3, breed);
            stmt.setString(4, name != null ? name : "");
            stmt.setString(5, location);
            stmt.setString(6, gender);
            stmt.setString(7, medicStats);
            stmt.setDouble(8, price);
            stmt.setString(9, email);

            // Set the image data and its MIME type
            if (pictureStream != null) {
                stmt.setBlob(10, pictureStream);
                stmt.setString(11, imageType);  // Store MIME type (e.g., image/jpeg)
            } else {
                stmt.setNull(10, java.sql.Types.BLOB);
                stmt.setNull(11, java.sql.Types.VARCHAR);  // Handle null for image type
            }

            // Execute the insert query
            int rowCount = stmt.executeUpdate();
			if (rowCount > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
				
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("AddPets.jsp");
			dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
