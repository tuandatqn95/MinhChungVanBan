package controller;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MinhChungDAO;

@WebServlet("/admin/MinhChungServlet")
public class MinhChungServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MinhChungDAO minhChungDAO = new MinhChungDAO();

	public MinhChungServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		ArrayList<String> errors = new ArrayList<String>();
		String url = "themminhchung.jsp";
		if (request.getParameter("Func") != null) {

			String maMinhChung = request.getParameter("MaMinhChung");
			String tenMinhChung = request.getParameter("TenMinhChung");
			String moTa = request.getParameter("MoTa");
			String soHieu = request.getParameter("SoHieu");
			String idTieuChi = request.getParameter("IDTieuChi");
			String idNoiBanHanh = request.getParameter("IDNoiBanHanh");
			String ngayBanHanh = request.getParameter("NgayBanHanh");
			if (maMinhChung == "" || tenMinhChung == "" || soHieu == "" || idTieuChi == "" || idNoiBanHanh == ""
					|| ngayBanHanh == "") {
				errors.add("Vui lòng điền tất cả các trường bắt buộc!");
			} else {
				try {
					switch (request.getParameter("Func")) {
					case "add":
						url = "themminhchung.jsp";

						minhChungDAO.ThemMinhChung(Integer.parseInt(idTieuChi), maMinhChung, tenMinhChung, moTa, soHieu,
								ngayBanHanh, Integer.parseInt(idNoiBanHanh));
						break;
					case "edit":
						int idMinhChung = Integer.parseInt(request.getParameter("IDMinhChung"));
						minhChungDAO.SuaMinhChung(idMinhChung, Integer.parseInt(idTieuChi), maMinhChung, tenMinhChung,
								moTa, soHieu, ngayBanHanh, Integer.parseInt(idNoiBanHanh));
						break;
					}
				} catch (NumberFormatException | SQLException e) {
					errors.add("Đã có lỗi xảy ra!");
					e.printStackTrace();
				}
			}
		}

		if (errors.size() == 0) {
			response.sendRedirect("minhchung.jsp");
		} else {
			request.setAttribute("errors", errors);
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

}
