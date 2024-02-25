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
<%@include file="allConponent/bootstrap.jsp"%>
<%@include file="allConponent/allCss.jsp"%>
<%@include file="allConponent/style.jsp"%>
</head>
<body>
	<%@include file="allConponent/js.jsp"%>

	<!-- Navbar -->
	<%@include file="allConponent/navbar.jsp"%>
	<!-- Navbar -->

	<div class="container py-5 h-100">
		<form action="" method="post">
			<section class="h-100" style="background-color: #eee;">
				<div class="container h-100 py-5">
					<div
						class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-10">

							<div
								class="d-flex justify-content-between align-items-center mb-4">
								<h3 class="fw-normal mb-0 text-black">Shopping Cart</h3>
								<div>
									<p class="mb-0">
										<span class="text-muted">Sort by:</span> <a href="#!"
											class="text-body">price <i class="fas fa-angle-down mt-1"></i></a>
									</p>
								</div>
							</div>

							<c:forEach items="${listBook }" var="o">
								<div class="card rounded-3 mb-4">
									<div class="card-body p-4">
										<div
											class="row d-flex justify-content-between align-items-center">
											<div class="col-md-2 col-lg-2 col-xl-2">
												<img src="${o.image }" class="img-fluid rounded-3"
													alt="Cotton T-shirt">
											</div>

											<div class="col-md-3 col-lg-3 col-xl-3">
												<p class="lead fw-normal mb-2">${o.bookName }</p>
												<p>
													<span class="text-muted">Category: </span>${o.cateName } <span
														class="text-muted">Status: </span>${o.sttName }
												</p>
											</div>
											<div class="col-md-3 col-lg-3 col-xl-2 d-flex">
												<button class="btn btn-link px-2"
													onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
													<i class="fas fa-minus"></i>
												</button>

												<input id="form1" min="0" name="quantity" value="2"
													type="number" class="form-control form-control-sm" />

												<button class="btn btn-link px-2"
													onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
													<i class="fas fa-plus"></i>
												</button>
											</div>
											<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
												<h5 class="mb-0">${o.price }</h5>
											</div>
											<div class="col-md-1 col-lg-1 col-xl-1 text-end">
												<a href="#!" class="text-danger"><i
													class="fa-solid fa-pen-to-square fa-lg"></i></a> <a href="delete-ad-servlet?bookId=${o.bookID }"
													class="text-danger"><i class="fas fa-trash fa-lg"></i></a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>


							<div class="card mb-4">
								<div class="card-body p-4 d-flex flex-row">
									<div class="form-outline flex-fill">
										<input type="text" id="form1"
											class="form-control form-control-lg" /> <label
											class="form-label" for="form1">Discound code</label>
									</div>
									<button type="button"
										class="btn btn-outline-warning btn-lg ms-3">Apply</button>
								</div>
							</div>

							<div class="card">
								<div class="card-body">
									<button type="button" class="btn btn-warning btn-block btn-lg">Proceed
										to Pay</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			Shopping car
		</form>
	</div>

	<!-- footer -->
	<%@include file="allConponent/footer.jsp"%>
	<!-- footer -->
</body>
</html>