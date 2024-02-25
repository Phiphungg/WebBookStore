<%@page import="model.Order"%>
<%@page import="dao.OrderDAO"%>
<%@page import="dao.HomeDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<%@ page import="model.Book"%>
<%@ page import="model.Category"%>
<%@ page import="model.Status"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>

<%@include file="../allConponent/bootstrap.jsp"%>
<%@include file="../allConponent/allCss.jsp"%>
<%@include file="../allConponent/style.jsp"%>

<style type="text/css">
.red {
	color: red;
}

.green {
	color: green;
}

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

	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-dark text-white" style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">

							<div class="mb-md-5 mt-md-4 pb-5">

								<form action="<%=path%>/home-controller" method="post">
									<input type="hidden" name="action" value="change-password">
									<h2 class="fw-bold mb-5 text-uppercase">Change Password</h2>
									<!-- <p class="text-white-50 mb-5">Please enter your login and
										password!</p> -->

									<div>
										<p>
											<span class="text-danger ">${msgError }</span> <span
												class="text-success ">${msgOk }</span>
										</p>

										<p>
											<span id="msgTrue" class=green></span> <span id="msgFalse"
												class=red></span>
										</p>
									</div>

									<div class=" form-white mb-4">
										<input type="text" id="typeEmailX"
											class="form-control form-control-lg"
											placeholder="Current Password" name="currentpw" />
									</div>

									<div class=" form-white mb-4">
										<input type="password" id="typePasswordX"
											class="form-control form-control-lg"
											placeholder="New Password" name="newpw" />
									</div>

									<div class=" form-white mb-4">
										<input type="password" id="typePasswordX"
											class="form-control form-control-lg"
											placeholder="Confirm New Password" name="confirmpw" />
									</div>


									<button class="btn btn-outline-light btn-lg px-5" type="submit">Change</button>

									<div
										class="d-flex justify-content-center text-center mt-4 pt-1">
										<a href="#!" class="text-white"><i
											class="fab fa-facebook-f fa-lg"></i></a> <a href="#!"
											class="text-white"><i
											class="fab fa-twitter fa-lg mx-4 px-2"></i></a> <a href="#!"
											class="text-white"><i class="fab fa-google fa-lg"></i></a>
									</div>

								</form>
							</div>

							<div>
								<p class="mb-0">
									Do you remember your password already? <a
										class="text-danger-50 fw-bold"
										href="<%=path%>/homePage/login.jsp">Login</a>
								</p>


								<p class="mb-0">
									Don't have an account? <a
										href="<%=path%>/homePage/register.jsp"
										class="text-danger-50 fw-bold">Sign Up</a>
								</p>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<c:if test="${ sessionScope.user.userName == 'admin' }">
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
										href="<%=path%>/homePage/changePassword.jsp"> <input
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
	</c:if>
	<!-- footer -->
	<%@include file="../allConponent/footer.jsp"%>
	<!-- footer -->
</body>
</html>