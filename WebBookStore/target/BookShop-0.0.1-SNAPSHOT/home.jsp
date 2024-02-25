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
<title>Home</title>
<%@include file="allConponent/bootstrap.jsp"%>
<%@include file="allConponent/allCss.jsp"%>
<%@include file="allConponent/style.jsp"%>

<!-- <style type="text/css">
.navbar-nav>li>a:hover {
	box-shadow: 0 0 10px 0 white inset, 0 0 20px 2px white;
	transition: 0.2s;
}
</style> -->
</head>

<body>
	<%@include file="allConponent/js.jsp"%>

	<!-- Navbar -->
	<%@include file="allConponent/navbar.jsp"%>
	<!-- Navbar -->

	<!-- carousel -->
	<%@include file="allConponent/carousel.jsp"%>

	<!--Main layout-->
	<main>
		<div class="container">
			<!-- Navbar -->
			<%@include file="allConponent/navbarBody.jsp"%>
			<!-- Navbar -->

			<!-- Products -->

			<section>
				<div class="col-sm-12 text-center">
					<div class="row">
						<c:forEach items="${listBook}" var="o">
							<div class="col-lg-3 col-md-6 mb-4"
								style="align-content: center;">
								<div class="card " style="width: 300px; height: 550px">
									<div
										class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
										data-mdb-ripple-color="light" style="margin: 20px 20px 0 20px;">
										<img src="${o.image}" class="w-100" /> <a
											href="detail-servlet?bookID=${o.bookID}">
											<div class="mask">
												<div
													class="d-flex justify-content-start align-items-end h-100">
														<h5>
															<span class="badge bg-dark ms-2">${o.sttName}</span>
														</h5>
												</div>
											</div>
											<div class="hover-overlay">
												<div class="mask"
													style="background-color: rgba(251, 251, 251, 0.15)"></div>
											</div>
										</a>
									</div>
									<div class="card-body" style="padding: 20px">
										<a href="detail-servlet?bookID=${o.bookID}" class="text-reset">
											<h6 class="card-title mb-2">${o.bookName}</h6>
										</a> <a href="" class="text-reset ">
											<p>${o.cateName }</p>
										</a>
										<div class="row">
											<div class="col">
												<p class="btn btn-danger btn-block">
													<i class="fa-solid fa-dollar-sign fa-lg"></i> ${o.price}$
												</p>
											</div>
											<div class="col">
												<a href="#" class="btn btn-success btn-block"
													style="padding: 10px 8px 8px;"><i
													class="fa-solid fa-cart-plus fa-lg"></i> Add to cart</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>



			<!-- Pagination -->
			<nav aria-label="Page navigation example"
				class="d-flex justify-content-center mt-3">
				<ul class="pagination">
					<li class="page-item disabled"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
			<!-- Pagination -->
		</div>
	</main>
	<!--Main layout-->

	<!-- footer -->
	<%@include file="allConponent/footer.jsp"%>
	<!-- footer -->
</body>
</html>