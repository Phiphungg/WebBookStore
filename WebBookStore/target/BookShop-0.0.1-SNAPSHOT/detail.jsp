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
<title>Details</title>
<%@include file="allConponent/allCss.jsp"%>

<%@include file="allConponent/style.jsp"%>

<style type="text/css">
.navbar-nav>li>a:hover {
	box-shadow: 0 0 10px 0 white inset, 0 0 20px 2px white;
	transition: 0.2s;
}
</style>
</head>
<body>
	<%@include file="allConponent/js.jsp"%>

	<!-- carousel -->
	<%@include file="allConponent/carousel.jsp"%>
	<!-- Navbar -->

	<%@include file="allConponent/navbar.jsp"%>
	<!-- Navbar -->

	<!--Main layout-->
	<div class="container">
		<!-- Navbar -->
		<%@include file="allConponent/navbarBody.jsp"%>
		<!-- Navbar -->
		<!--Grid row-->
		<div class="row">
			<!--Grid column-->
			<div class="col-md-6 mb-4">
				<img src="${detail.image }" class="img-fluid" alt="" />
			</div>
			<!--Grid column-->

			<!--Grid column-->
			<div class="col-md-6 mb-4">
				<!--Content-->
				<div class="p-4">
					<p class="bookName" style="font-size: 26px;">
						<span>${detail.bookName }</span>
					</p>
					<div class="mb-3">
						<c:if test=""></c:if>
						<a href=""> <span class="badge bg-dark me-1">${detail.cateName }</span>

						</a> <a href=""> <span class="badge bg-danger me-1">${detail.sttName }</span>
						</a>

					</div>
					<p class="lead" style="color: red">
						<!-- <span class="me-1"> <del>$200</del></span> -->
						<span>${detail.price }$</span>
					</p>

					<strong><p style="font-size: 20px;">Description</p></strong>

					<p>${detail.description }</p>

					<form class="d-flex justify-content-left">
						<!-- Default input -->
						<div class="form-outline me-1"
							style="width: 100px; border: 1px solid">
							<input type="number" value="1" class="form-control" />
						</div>
						<button class="btn btn-danger ms-1" type="submit">
							Add to cart <i class="fas fa-shopping-cart ms-1"></i>
						</button>
					</form>
				</div>
				<!--Content-->
			</div>
			<!--Grid column-->
		</div>
		<!--Grid row-->

		<hr />

		<!--Grid row-->
		<div class="row d-flex justify-content-center">
			<!--Grid column-->
			<div class="col-md-6 text-center">
				<h4 class="my-4 h4">Additional information</h4>

				<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
					Natus suscipit modi sapiente illo soluta odit voluptates, quibusdam
					officia. Neque quibusdam quas a quis porro? Molestias illo neque
					eum in laborum.</p>
			</div>
			<!--Grid column-->
		</div>
		<!--Grid row-->

		<!--Grid row-->
		<div class="row">
			<!--Grid column-->
			<div class="col-lg-4 col-md-12 mb-4">
				<img
					src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/11.jpg"
					class="img-fluid" alt="" />
			</div>
			<!--Grid column-->

			<!--Grid column-->
			<div class="col-lg-4 col-md-6 mb-4">
				<img
					src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/12.jpg"
					class="img-fluid" alt="" />
			</div>
			<!--Grid column-->

			<!--Grid column-->
			<div class="col-lg-4 col-md-6 mb-4">
				<img
					src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/13.jpg"
					class="img-fluid" alt="" />
			</div>
			<!--Grid column-->
		</div>
		<!--Grid row-->
	</div>
	<!--Main layout-->

	<!-- footer -->
	<%@include file="allConponent/footer.jsp"%>
	<!-- footer -->

</body>
</html>