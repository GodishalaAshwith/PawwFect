package pawcage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("uemail");
		String uname = request.getParameter("uname");
		String number = request.getParameter("number");
		String pwd = request.getParameter("pwd");
		String cpwd = request.getParameter("cpwd");
		
		Connection con = null;
		RequestDispatcher dispatcher = null;
		PrintWriter out = response.getWriter();
		
		if (pwd!=null && cpwd!=null){
			if (!pwd.equals(cpwd)){
				out.println("<p>Passwords dont match!</p>");
				out.println("<a href='Register.jsp' >Go Back to Register</a>");
				return;
			}
			
		}
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pawfect","root","root");
			PreparedStatement pst = con.prepareStatement("insert into users (name,email,uname,number,pwd) values(?,?,?,?,?)");
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, uname);
			pst.setString(4, number);
			pst.setString(5, pwd);
			
			int rowCount = pst.executeUpdate();
			
			
			if (rowCount > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
				
			}
			dispatcher = request.getRequestDispatcher("Register.jsp");
			dispatcher.forward(request, response);
			
			
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "failed");
            dispatcher = request.getRequestDispatcher("Register.jsp");
            dispatcher.forward(request, response);
        }
    }
}


