
<%@page import="dao.OrderDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.HomeDAO"%>
<%@page import="org.hibernate.mapping.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Book"%>
<%@ page import="model.Category"%>
<%@ page import="model.Status"%>
<%@ page import="model.Order"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit book</title>
<%@include file="../allConponent/bootstrap.jsp"%>
<%@include file="../allConponent/allCss.jsp"%>
<%@include file="../allConponent/style.jsp"%>
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

	<div class="container py-5 h-100">
		<form action="<%=path%>/admin-controller" method="post">
			<input type="hidden" name="action" value="edit-book-servlet">
			<section class="h-100" style="background-color: #eee;">
				<div class="container h-100 py-5">
					<div
						class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-10">

							<div
								class="d-flex justify-content-between align-items-center mb-4">
								<p>
									<span class="h2">List User</span>
								</p>


								<!-- <div>
									<a href="#addEmployeeModal1" class="btn btn-success"
										data-toggle="modal"><i class="fa fa-plus"></i> <span>Button</span></a>
								</div> -->
							</div>


							<c:forEach items="${listUser }" var="o">
								<div class="card rounded-3 mb-4">
									<div class="card-body p-4">
										<div
											class="row d-flex justify-content-between align-items-center">
											<div class="col-md-2 col-lg-2 col-xl-2">

												<img
													src="data:image/png;base64,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"
													alt="Cotton T-shirt">

											</div>

											<div class="col-md-3 col-lg-3 col-xl-3">
												<p class="lead fw-normal mb-2">${o.userName }</p>
												<p>
													<span class="text-muted">Birthday: </span>${o.birthday }
												</p>
												<p>
													<span class="text-muted">Gender: </span>${o.gender }
												</p>
											</div>


											<div class="col-md-3 col-lg-3 col-xl-2 d-flex">
												<p>
													<span class="text-muted">Email: </span>${o.email }
												</p>


											</div>
											<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
												<h5 class="mb-0">${o.receiveNews }</h5>
											</div>


										</div>
									</div>
								</div>
							</c:forEach>


							<div class="card mb-4">
								<!-- <div class="card-body p-4 d-flex flex-row">
									<div class="form-outline flex-fill">
										<input type="text" id="form1"
											class="form-control form-control-lg" /> <label
											class="form-label" for="form1">Discound code</label>
									</div>
									<button type="button"
										class="btn btn-outline-warning btn-lg ms-3">Apply</button>
								</div> -->
							</div>

							<!-- <div class="card">
								<div class="card-body">
									<button type="button" class="btn btn-warning btn-block btn-lg">Proceed
										to Pay</button>
								</div>
							</div> -->
						</div>
					</div>
				</div>
			</section>
		</form>
	</div>

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
									href="<%=path%>/admin-controller?action=list-user"> <input
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