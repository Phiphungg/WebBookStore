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
<title>Information</title>
<%@include file="../allConponent/bootstrap.jsp"%>
<%@include file="../allConponent/allCss.jsp"%>
<%@include file="../allConponent/style.jsp"%>
<style type="text/css">
.navbar-nav>li>a:hover {
	box-shadow: 0 0 10px 0 white inset, 0 0 20px 2px white;
	transition: 0.2s;
}

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

/* .col-xl-5 {
	flex: 0 0 auto;
	width: 0;
}

.col-lg-6 {
	flex: 0 0 auto;
	width: 50%;
} */
</style>

</head>
<script>
	function checkPassword() {
		password = document.getElementById("password").value;
		passwordRt = document.getElementById("passwordrt").value;
		if (password != passwordRt) {
			document.getElementById("msgTrue").innerHTML = "";
			document.getElementById("msgFalse").innerHTML = "Your password do not match";
			return false;
		} else {
			document.getElementById("msgTrue").innerHTML = "Password is corrected";
			document.getElementById("msgFalse").innerHTML = "";
			return true;

		}
	}
	function acceptLicense() {
		license = document.getElementById("license");
		if (license.checked == true) {
			document.getElementById("submit").style.visibility = "visible";
		} else {
			document.getElementById("submit").style.visibility = "hidden";
		}
	}
</script>
<body>
	<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	%>
	<%@include file="../allConponent/js.jsp"%>
	<div class="mt-5 pt-2">
		<!-- Navbar -->
		<%@include file="../allConponent/navbar.jsp"%>
		<!-- Navbar -->
	</div>

	<%
	Object object = session.getAttribute("user");
	User user = null;

	if (object != null) {
		user = (User) object;
	}

	if (user == null) {
	%>
	<%-- <%@include file="../homePage/login.jsp"%> --%>
	<jsp:include page="../homePage/login.jsp" />
	<%
	} else {
	%>

	<section class="vh-200 gradient-custom ">
		<%
		String userName = user.getUserName();
		String birthday = user.getBirthday().toString();
		String email = user.getEmail();
		String gender = user.getGender();
		boolean news = user.isReceiveNews();
		%>
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<!-- <div class="col-16 col-md-8 col-lg-6 col-xl-5"> -->
				<div class="card bg-dark text-white"
					style="border-radius: 1rem; width: 660px;">
					<div class="card-body p-5 text-center">

						<form action="<%=path%>/home-controller" method="post">
							<input type="hidden" name="action" value="change-info">
							<div class=" mt-md-4">
								<h2 class="fw-bold pb-2 mb-2 text-uppercase">personal
									information</h2>

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



								<div class="d-flex flex-row align-items-center mb-4">
									<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
									<div class=" flex-fill mb-0">
										<input readonly="readonly" placeholder="Username"
											name="username" type="text" id="form3Example3c"
											class="form-control" required="required"
											value="<%=userName%>" />
									</div>
								</div>

								<div class="d-flex flex-row align-items-center mb-4">
									<i class="fa fa-cake-candles fa-lg me-3 fa-fw"></i>
									<div class=" flex-fill mb-0">
										<input placeholder="Birthday" type="date" class="form-control"
											id="birthday" name="birthday" required="required"
											value="<%=birthday%>" />
									</div>
								</div>

								<div class="d-flex flex-row align-items-center mb-4">
									<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
									<div class=" flex-fill mb-0">
										<input placeholder="Email" name="email" type="email"
											id="form3Example3c" class="form-control" required="required"
											value="<%=email%>" />
									</div>
								</div>

								<div class="d-flex flex-row align-items-center mb-4">
									<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
									<div class=" flex-fill mb-0">
										<!-- <label class="form-label" for="form3Example4c">Password<span
												class=red>*&nbsp;</span><span id="msgTrue" class=green></span></label> -->
										<input readonly="readonly" placeholder="Password"
											name="password" type="password" id="password"
											class="form-control" required="required"
											onkeyup="checkPassword()" />
									</div>
								</div>


								<div class="d-flex flex-row align-items-center mb-4">
									<i class="fa fa-venus-mars fa-lg me-3 fa-fw"></i>
									<div class=" flex-fill mb-0">
										<select class="form-control" id="gender" name="gender"
											required="required">
											<option>Gender</option>
											<option value="Male"
												<%=(gender.equals("Male")) ? "selected='selected'" : ""%>>Male</option>
											<option value="Female"
												<%=(gender.equals("Female")) ? "selected='selected'" : ""%>>Female</option>
											<option value="Other"
												<%=(gender.equals("Other")) ? "selected='selected'" : ""%>>Other</option>
										</select>
									</div>
								</div>


							</div>

							<div class="form-check d-flex">
								<input name="news" class="form-check-input me-2" type="checkbox"
									value="<%=news%>" id="form2Example3c" /> <label
									class="form-check-label" for="form2Example3">I agree to
									receive your <a href="#!">News</a>
								</label>
							</div>

							<div class="form-check d-flex mb-3">
								<input name="license" class="form-check-input me-2"
									type="checkbox" value="" id="license" required="required"
									onchange="acceptLicense()" /> <label class="form-check-label"
									for="license" <%=news ? "checked" : ""%>> I agree all
									statements in <a href="#!">Terms of service</a><span id="msg"
									class="red">*</span>
								</label>
							</div>

							<div class="d-flex justify-content-center mx-4  mb-lg-4">
								<input class="btn btn-outline-light btn-lg px-5 " type="submit"
									value="Change" name="submit" id="submit"
									style="visibility: hidden;" />

							</div>

							<div>
								<p class="mb-0">
									Do you have an account? <a href="<%=path%>/homePage/login.jsp"
										class="text-danger-50 fw-bold">Login</a>
								</p>
								<p class="mb-0">
									Back to home? <a href="<%=path%>/home-servlet"
										class="text-danger-50 fw-bold">Home</a>
								</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		%>
		<!-- </div> -->
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
										href="<%=path%>/homePage/changeInformation.jsp"> <input
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