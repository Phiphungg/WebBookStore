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
<title>Order Detail</title>
<%@include file="../allConponent/bootstrap.jsp"%>
<%@include file="../allConponent/allCss.jsp"%>
<%@include file="../allConponent/style.jsp"%>

<style type="text/css">
.gradient-custom {
	/* fallback for old browsers */
	background: #cd9cf2;
	/* Chrome 10-25, Safari 5.1-6 */
	background: -webkit-linear-gradient(to top left, rgba(205, 156, 242, 1),
		rgba(246, 243, 255, 1));
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	background: linear-gradient(to top left, rgba(205, 156, 242, 1),
		rgba(246, 243, 255, 1))
}
</style>
</head>



<body>
	<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	%>
	<c:set var="size" value="${sessionScope.size }" />
	<%@include file="../allConponent/js.jsp"%>

	<!-- Navbar -->
	<%@include file="../allConponent/navbar.jsp"%>
	<!-- Navbar -->

	<section class="h-100 gradient-custom">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-10 col-xl-8" style="margin-top: 40px;">
					<div class="card" style="border-radius: 10px;">
						<div class="card-header px-3 py-4">
							<h5 class="text-muted mb-0">
								<c:if test="${ sessionScope.user == null }">
								Thanks for your Order, <span style="color: #a8729a;">${user.userName}</span>!
								</c:if>

								<c:if test="${ sessionScope.user != null }">
								Hi, Admin !</span>!
								</c:if>
							</h5>
						</div>

						<div class="card-body p-4">
							<c:forEach items="${listOrder }" var="l">
								<div
									class="d-flex justify-content-between align-items-center mb-4">
									<p class="lead fw-normal mb-0" style="color: #a8729a;">Receipt</p>
									<p class="small text-muted mb-0">OrderID : ${l.orderID }</p>

								</div>
							</c:forEach>


							<c:forEach items="${listOrderDetail }" var="o">
								<div class="card shadow-0 border mb-4">
									<div class="card-body">
										<div class="row">
											<div class="col-md-2">
												<img
													src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/Products/13.webp"
													class="img-fluid" alt="Phone">
											</div>
											<div
												class="col-md-2 text-center d-flex justify-content-center align-items-center">
												<p class="text-muted mb-0">${o.bookName }</p>
											</div>
											<div
												class="col-md-2 text-center d-flex justify-content-center align-items-center">
												<p class="text-muted mb-0 small">${o.author }</p>
											</div>

											<div
												class="col-md-2 text-center d-flex justify-content-center align-items-center">
												<p class="text-muted mb-0 small">Qty: ${o.quantity }</p>
											</div>
											<div
												class="col-md-2 text-center d-flex justify-content-center align-items-center">
												<p class="text-muted mb-0 small">${o.price }$</p>
											</div>
										</div>
										<hr class="mb-4"
											style="background-color: #e0e0e0; opacity: 1;">
										<div class="row d-flex align-items-center">
											<div class="col-md-2">
												<p class="text-muted mb-0 small">Track Order</p>
											</div>
											<div class="col-md-10">
												<div class="progress"
													style="height: 6px; border-radius: 16px;">
													<div class="progress-bar" role="progressbar"
														style="width: 65%; border-radius: 16px; background-color: #a8729a;"
														aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
												<div class="d-flex justify-content-around mb-1">
													<p class="text-muted mt-1 mb-0 small ms-xl-5">Out for
														delivary</p>
													<p class="text-muted mt-1 mb-0 small ms-xl-5">Delivered</p>
												</div>
											</div>
										</div>
									</div>
								</div>


								<div class="d-flex justify-content-between pt-2">
									<p class="fw-bold mb-0">Order Details</p>
								</div>

								<div class="d-flex justify-content-between pt-2">
									<p class="text-muted mb-0">Invoice Number: 788152</p>

								</div>


								<div class="d-flex justify-content-between mb-5">
									<p class="text-muted mb-0">Delivery Charges: Free</p>
								</div>
							</c:forEach>
						</div>
						<c:forEach items="${listOrder}" var="p">
							<div class="card-footer border-0 px-4 py-5"
								style="background-color: #a8729a; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
								<h5
									class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">
									Total paid: <span class="h2 mb-0 ms-2">${p.total } $</span>
								</h5>
							</div>
						</c:forEach>
					</div>

				</div>
			</div>
		</div>
	</section>


	<!-- footer -->
	<%@include file="../allConponent/footer.jsp"%>
	<!-- footer -->
</body>
</html>