<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.TaiKhoanDAO"%>
<%@page import="model.TaiKhoan"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<%
	if (userEmail == null) {
		ArrayList<String> errors = new ArrayList<String>();
		errors.add("Vui lòng đăng nhập để truy cập vào trang này!");
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("403.jsp").forward(request, response);
	}
%>

<div class="panel panel-primary">

	<div class="panel-heading">
		<h3 class="panel-title">Thông tin liên hệ</h3>
	</div>
	<div class="panel-body">

		<div class="col-md-3">

			<img
				src="<%=taiKhoan.getAnhDaiDien().equals("") ? "images/default-avatar.png" : "uploads/"+taiKhoan.getAnhDaiDien()%>"
				class="img-thumbnail">

			<div class="text-center"
				style="margin-top: 10px; margin-bottom: 10px;">
				<a href="#" class="btn btn-info">Thay đổi</a>
			</div>
		</div>
		<div class="col-md-9">
			<table class="table table-striped">

				<tbody>
					<%
						if (userEmail != null) {
					%>
					<tr>

						<td>Ho và tên:</td>
						<td><%=taiKhoan.getHoTen()%></td>
					</tr>
					<tr>

						<td>Giới tính:</td>
						<td><%=taiKhoan.isNu() ? "Nữ" : "Nam"%></td>
					</tr>
					<tr>
						<td>Ngày sinh:</td>
						<td><%=new SimpleDateFormat("dd-MM-yyyy").format(taiKhoan.getNgaySinh())%></td>
					</tr>
					<tr>
						<td>Nơi công tác:</td>
						<td><%=taiKhoan.getNoiCongTac()%></td>
					</tr>
					<tr>
						<td>Chức vụ:</td>
						<td><%=taiKhoan.getChucVu()%></td>
					</tr>
					<tr>
						<td>Số điện thoại:</td>
						<td><%=taiKhoan.getSoDienThoai()%></td>
					</tr>
					<tr>
						<td>E-mail:</td>
						<td><%=taiKhoan.getEmail()%></td>
					</tr>
					<%
						}
					%>

				</tbody>
			</table>
			<a class="btn btn-primary center-block">Cập nhật</a>
		</div>
	</div>
</div>



<%@ include file="sidebar.jsp"%>
<%@ include file="footer.jsp"%>

