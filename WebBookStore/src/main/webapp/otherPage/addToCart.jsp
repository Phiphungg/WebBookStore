<%@page import="database.JDBCUtil"%>
<%@page import="java.util.List"%>
<%@page import="dao.HomeDAO"%>
<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Book"%>
<%@ page import="model.Category"%>
<%@ page import="model.Status"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>

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

.my-4 {
	margin-top: 4rem !important;
	margin-bottom: 1.5rem !important;
}
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

	<section class="h-100 gradient-custom">
		<div class="container py-5">

			<div class="row d-flex justify-content-center my-4">
				<div class="col-md-8">
					<div class="card mb-4">
						<div class="card-header py-3">
							<h5 class="mb-0">Shopping cart - You have ${size } items in
								your cart</h5>
						</div>
						<div class="card-body" style="padding-top: 0px;">
							&nbsp;
							<!-- Single item -->
							<c:set var="c" value="${sessionScope.cart }" />
							<c:set var="s" value="0" />

							<c:if test="${size == 0 || size == null}">
								<div>
									<img style="margin-left: 200px;"
										src="https://cdn-icons-png.flaticon.com/512/11329/11329060.png"
										width="400">
								</div>

								<h5 class="text-center" style="color: purple;">Your cart is
									currently empty !!</h5>
							</c:if>

							<c:if test="${size != 0}">
								<c:forEach items="${c.items }" var="i">
									<c:set var="s" value="${s+1 }" />
									<div
										class="row mb-4 d-flex justify-content-between align-items-center">
										<div class="col-md-2 col-lg-2 col-xl-2">
											<img src="${i.book.image }" class="img-fluid rounded-3">
										</div>
										<div class="col-md-3 col-lg-3 col-xl-3">
											<h6 class="text-muted">${i.book.bookName }</h6>
											<h6 class="text-black mb-0">${i.book.author }</h6>
										</div>
										<div class="col-md-3 col-lg-3 col-xl-2 d-flex">
											<button class="btn btn-link px-2">
												<a
													href="<%=path %>/user-controller?action=process&num=-1&bookID=${i.book.bookID }">
													<i class="fas fa-minus"></i>
												</a>
											</button>

											<input id="form1" readonly="readonly" value="${i.quantity }"
												type="text" class="form-control form-control-sm" />

											<button class="btn btn-link px-2">
												<a
													href="<%=path %>/user-controller?action=process&num=1&bookID=${i.book.bookID }">
													<i class="fas fa-plus"></i>
												</a>
											</button>
										</div>
										<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
											<h6 class="mb-0">
												<fmt:formatNumber pattern="##.#"
													value="${(i.quantity*i.price)/1.2 }" />
												$
											</h6>
										</div>
										<div class="col-md-1 col-lg-1 col-xl-1 text-end">
											<form action="<%=path%>/user-controller" method="post">
												<input type="hidden" name="action" value="process">
												<input type="hidden" name="bookID" value="${i.book.bookID }" />
												<input type="submit" value="X" />
											</form>
										</div>
									</div>
									<hr />
								</c:forEach>
							</c:if>

							<!-- Single item -->

							<div class="pt-5">
								<h6 class="mb-0">
									<a href="<%=path%>/home-servlet" class="text-body"><i
										class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a>
								</h6>
							</div>

						</div>
					</div>

					<div class="card shadow-2-strong mb-5 mb-lg-0"
						style="border-radius: 16px;">
						<div class="card-body p-4">

							<div class="row">
								<div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0"
									style="width: 36%; margin-left: 40px;">
									<form>
										<div class="d-flex flex-row pb-3">
											<div class="d-flex align-items-center pe-2">
												<input class="form-check-input" type="radio"
													name="radioNoLabel" id="radioNoLabel1v" value=""
													aria-label="..." checked />
											</div>
											<div class="rounded border w-100 p-3">
												<p class="d-flex align-items-center mb-0">
													<img class="me-2" width="25px"
														src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
														alt="Mastercard" />Credit Card
												</p>
											</div>
										</div>
										<div class="d-flex flex-row pb-3">
											<div class="d-flex align-items-center pe-2">
												<input class="form-check-input" type="radio"
													name="radioNoLabel" id="radioNoLabel2v" value=""
													aria-label="..." />
											</div>
											<div class="rounded border w-100 p-3">
												<p class="d-flex align-items-center mb-0">
													<img class="me-2" width="25px"
														src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
														alt="Visa" />Debit Card
												</p>
											</div>
										</div>
										<div class="d-flex flex-row">
											<div class="d-flex align-items-center pe-2">
												<input class="form-check-input" type="radio"
													name="radioNoLabel" id="radioNoLabel3v" value=""
													aria-label="..." />
											</div>
											<div class="rounded border w-100 p-3">
												<p class="d-flex align-items-center mb-0">
													<img class="me-2" width="25px"
														src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
														alt="American Express" />American Express
												</p>
											</div>
										</div>
									</form>
								</div>
								<div class="col-md-6 col-lg-4 col-xl-6">
									<div class="row">
										<div class="col-12 col-xl-6">
											<div class=" mb-4 mb-xl-5">
												<label class="form-label" for="typeText">Name on
													card</label> <input type="text" id="typeName"
													class="form-control form-control-lg" size="17"
													placeholder="John Smith" />
											</div>

											<div class=" mb-4 mb-xl-5">
												<label class="form-label" for="typeExp">Expiration</label> <input
													type="text" id="typeExp"
													class="form-control form-control-lg" placeholder="MM/YY"
													size="7" id="exp" minlength="7" maxlength="7" />
											</div>
										</div>
										<div class="col-12 col-xl-6">
											<div class=" mb-4 mb-xl-5">
												<label class="form-label" for="typeText">Card Number</label>
												<input type="text" id="typeText"
													class="form-control form-control-lg" size="17"
													placeholder="1111 2222 3333 4444" minlength="19"
													maxlength="19" />
											</div>

											<div class=" mb-4 mb-xl-5">
												<label class="form-label" for="typeText">Cvv</label> <input
													type="password" id="typeText"
													class="form-control form-control-lg"
													placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3"
													maxlength="3" />
											</div>
										</div>
									</div>
								</div>

							</div>

						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card mb-4">
						<div class="card-header py-3">
							<h5 class="mb-0">Summary</h5>
						</div>
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li
									class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
									Products <span>${(c.total)/1.2 } $</span>
								</li>
								<li
									class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
									Shipping <span>Free</span>
								</li>
								<li
									class="list-group-item d-flex justify-content-between align-items-center px-0">
									VAT <span>12%</span>
								</li>

								<li
									class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
									<div>
										<strong>Total amount</strong> <strong>
											<p class="mb-0">(including VAT)</p>
										</strong>
									</div> <span><strong>${c.total } $</strong></span>
								</li>
							</ul>

							<form action="<%=path%>/user-controller" method="post">
								<input type="hidden" name="action" value="checkout"> <input
									class="btn btn-primary btn-lg btn-block" type="submit"
									value="Go to checkout" />
							</form>
						</div>
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