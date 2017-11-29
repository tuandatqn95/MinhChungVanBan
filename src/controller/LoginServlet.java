package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TaiKhoanDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private TaiKhoanDAO taiKhoanDAO = new TaiKhoanDAO();

	public LoginServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		ArrayList<String> errors = new ArrayList<String>();
		try {
			if (email == "" || password == "" || !taiKhoanDAO.login(email, password)) {
				errors.add("Sai tài khoản hoặc mật khẩu!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			errors.add("Đã có lỗi xảy ra!");
		}
		if (errors.size() == 0) {
			Cookie loginCookie = new Cookie("loginUser", email);
			loginCookie.setMaxAge(60 * 60);
			response.addCookie(loginCookie);
			response.sendRedirect("index.jsp");
		} else {
			request.setAttribute("errors", errors);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	public static void main(String agrs[]) {
		System.out.println();
	}
}
