<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>


<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">Thông tin liên hệ</h3>
	</div>
	<div class="panel-body">

		<div>
			<div class="col-xs-3">
				<img src="images/contact1.jpg" class="img-thumbnail">
			</div>
			<div class="col-xs-9">
				<h4>Nguyễn Văn A</h4>
				<p>
					Chức vụ<br /> Thông tin thêm
				</p>
			</div>

		</div>
		

	</div>
</div>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">Đóng góp ý kiến</h3>
	</div>
	<div class="panel-body">
		<form action="" method="post">

			<div class="form-group">
				<label class="control-label">Email: </label> <input type="email"
					name="email" placeholder="E-mail" class="form-control">
			</div>
			<div class="form-group">
				<label>Nội dung: </label>
				<textarea class="form-control" rows="7"></textarea>
			</div>
			<button type="submit" class="btn btn-primary pull-right">Gửi
				liên hệ</button>
		</form>
	</div>
</div>


<%@ include file="sidebar.jsp"%>
<%@ include file="footer.jsp"%>

