<%@page import="model.Order"%>
<%@page import="dao.OrderDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Book"%>
<%@ page import="model.Category"%>
<%@ page import="model.Status"%>
<%@page import="dao.HomeDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order List</title>
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
								List User</span>!
							</h5>
						</div>


						<div class="card-body p-4">
							<c:forEach items="${listOrder }" var="o">
								<br>
								<div
									class="d-flex justify-content-between align-items-center mb-4">
									<p class="lead fw-normal mb-0" style="color: #a8729a;">Receipt</p>
									<p class="small text-muted mb-0">
										<u><a
											href="<%=path %>/user-controller?action=order-detail$orderID=${o.orderID}"
											style="color: red">Order Detail</a></u>
									</p>
								</div>

								<div class="card shadow-0 border mb-4">
									<div class="card-body">
										<div class="row">
											<div
												class="col-md-2 text-center d-flex justify-content-center align-items-center">
												<p class="text-muted mb-0">User: ${o.userName }</p>
											</div>
											<div
												class="col-md-2 text-center d-flex justify-content-center align-items-center">
												<p class="text-muted mb-0">OrderID: ${o.orderID }</p>
											</div>


											<div
												class="col-md-2 text-center d-flex justify-content-center align-items-center">
												<p class="text-muted mb-0 small">Qty: ${o.totalQuantity }</p>
											</div>
											<div
												class="col-md-2 text-center d-flex justify-content-center align-items-center">
												<p class="text-muted mb-0 small">Total: ${o.total } $</p>
											</div>
											<div
												class="col-md-2 text-center d-flex justify-content-center align-items-center">
												<p class="text-muted mb-0 small">Date: ${o.date }</p>
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
								<hr
									style="height: 2px; border-width: 0; color: gray; background-color: gray" />
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
	</section>

	<!-- Add Modal HTML -->

	<%
	UserDAO userDAO = new UserDAO();
	List<User> list = userDAO.getAllUser();

	HomeDAO homeDAO = new HomeDAO();
	List<Book> listB = homeDAO.getAllBook();

	OrderDAO orderDAO = new OrderDAO();
	List<Order> listO = orderDAO.getAllOrder();
	%>

	<div id="addEmployeeModal1" class="modal fade">
		<section class="vh-300 gradient-custom ">

			<div class="container py-5 h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12 col-md-8 col-lg-6 col-xl-5">
						<div class="card bg-dark text-white"
							style="border-radius: 1rem; width: 800px; margin-left: -122px; margin-top: 180px;">
							<div class="card-body p-5 text-center">

								<form action="<%=path%>/admin-controller" method="post">
									<input type="hidden" name="action"
										value="add-book-servlet-admin">
									<div class="row ">
										<div class="col-md-4">
											<a href="<%=path%>/admin-controller?action=list-user">
												<div class="card">
													<div class="card-body text-center">
														<div class="container">
															<img style="max-width: 160px" alt=""
																src="https://www.iconpacks.net/icons/1/free-user-group-icon-296-thumb.png">
														</div>
														<h3>Users</h3>

														<h3><%=list.size()%></h3>

													</div>
												</div>
											</a>
										</div>

										<div class="col-md-4">
											<a href="<%=path%>/admin-controller?action=manage-servlet">
												<div class="card">
													<div class="card-body text-center">
														<div class="container">
															<img style="max-width: 160px" alt=""
																src="https://cdn-icons-png.flaticon.com/512/1170/1170577.png">
														</div>
														<h3>Products</h3>
														<h3><%=listB.size()%></h3>
													</div>
												</div>
											</a>
										</div>

										<div class="col-md-4">
											<a href="<%=path%>/admin-controller?action=list-order">
												<div class="card">
													<div class="card-body text-center">
														<div class="container">
															<img style="max-width: 160px" alt=""
																src="https://images.vexels.com/media/users/3/201153/isolated/lists/7e488bcbe003a5e666f6c79a2559b61d-shopping-delivery-color-icon.png">
														</div>
														<h3>Orders</h3>
														<h3><%=listO.size()%></h3>
													</div>
												</div>
											</a>
										</div>
									</div>
								</form>
							</div>

							<div class="d-flex justify-content-center mx-4  mb-lg-4 ">
								<!-- <span class="mb-0" style="margin-right: 20px"> <input
									class="btn btn-outline-light btn-lg px-5 " type="submit"
									value="Add Now" name="submit" id="submit" /> -->
								</span> <span class="mb-0"><a
									href="<%=path%>/admin-controller?action=list-order"> <input
										class="btn btn-outline-light btn-lg px-5 " type="button"
										value="Cancel" name="button" id="button" />
								</a> </span>
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- footer -->
	<%@include file="../allConponent/footer.jsp"%>
	<!-- footer -->
</body>
</html>