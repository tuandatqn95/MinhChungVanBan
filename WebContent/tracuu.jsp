<%@page import="model.TieuChi"%>
<%@page import="model.TieuChuan"%>
<%@page import="dao.TieuChiDAO"%>
<%@page import="dao.TieuChuanDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">Tra cứu minh chứng</h3>
	</div>
	<div class="panel-body">
		<form action="" method="post" class="form-horizontal">
			<div class="form-group">
				<label class="control-label  col-md-3">Từ khóa: </label>
				<div class="col-md-7">
					<input type="email" name="email" placeholder="Từ khóa"
						class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label  col-md-3">Tìm theo: </label>
				<div class="col-md-7">
					<select class="form-control">
						<option>Tiêu chuẩn</option>
						<option>Hoạt động</option>
						<option>Nơi ban hành</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-offset-3 col-md-3">
					<button type="submit" class="btn btn-primary ">Tìm kiếm</button>
				</div>
			</div>
		</form>
	</div>
</div>
<%
	TieuChuanDAO tieuChuanDAO = new TieuChuanDAO();
	TieuChiDAO tieuChiDAO = new TieuChiDAO();
%>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">Bộ tiêu chuẩn</h3>
	</div>
	<div class="panel-body">
		<div class="list-group list-group-root well">
			<%
				for (TieuChuan tieuChuan : tieuChuanDAO.getListTieuChuan()) {
			%>

			<a href="#<%=tieuChuan.getMaTieuChuan()%>" class="list-group-item"
				data-toggle="collapse"> <i
				class="glyphicon glyphicon-chevron-right"></i><%=tieuChuan.getTenTieuChuan()%>
			</a>
			<div class="list-group collapse" id="<%=tieuChuan.getMaTieuChuan()%>">
				<%
					for (TieuChi tieuChi : tieuChiDAO.getListTieuChiByTieuChuan(tieuChuan.getID())) {
				%>
				<a href="#" class="list-group-item"><%=tieuChi.getTenTieuChi()%></a>
				<%
					}
				%>
			</div>
			<%
				}
			%>
		</div>
	</div>
</div>


<%@ include file="sidebar.jsp"%>
<%@ include file="footer.jsp"%>

