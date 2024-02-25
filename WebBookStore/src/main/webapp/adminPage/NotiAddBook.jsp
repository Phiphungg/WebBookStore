
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Book"%>
<%@ page import="model.Category"%>
<%@ page import="model.Status"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit book</title>
<%@include file="../allConponent/bootstrap.jsp"%>
<%@include file="../allConponent/allCss.jsp"%>
<%@include file="../allConponent/style.jsp"%>

<style type="text/css">
.py-5 {
	padding-top: 3rem !important;
	padding-bottom: 3rem !important;
	height: 714px;
}
</style>
</head>

<body>
	<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	%>
	<%@include file="../allConponent/js.jsp"%>

	<!-- Navbar -->
	<%@include file="../allConponent/navbar.jsp"%>
	<!-- Navbar -->

	<div class="container py-5 h-200">
		<form action="<%=path%>/admin-controller" method="post">
			<input type="hidden" name="action" value="manage-servlet">
			<section class="h-100" style="background-color: #eee;">
				<div class="container h-100 py-5">
					<div
						class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-10">

							<div
								class="d-flex justify-content-between align-items-center mb-4">
								<h3 class="fw-normal mb-0 text-black">Shopping Cart</h3>

								<div>
									<a href="<%=path%>/admin-controller?action=manage-servlet">
										<button class="btn btn-danger" data-toggle="modal">
											<i class="fa fa-rotate-left"></i> Back to Edit Page
										</button>
									</a>
								</div>
							</div>

							<!-- Notification  -->
							<div>
								<p>
									<span class="text-danger ">${msgAddError }</span> <span
										class="text-danger ">${msgAddOk }</span>
								</p>

								<p>
									<span id="msgFalse" class=red></span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</section>
		</form>
	</div>


	<!-- footer -->
	<%@include file="../allConponent/footer.jsp"%>
	<!-- footer -->
</body>
</html>