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
	background: #6a11cb;
	/* Chrome 10-25, Safari 5.1-6 */
	background: -webkit-linear-gradient(to right, rgba(106, 17, 203, 1),
		rgba(37, 117, 252, 1));
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	background: linear-gradient(to right, rgba(106, 17, 203, 1),
		rgba(37, 117, 252, 1))
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
<body>
	<%@include file="allConponent/js.jsp"%>
	<div class="mt-5 pt-2">
		<!-- Navbar -->
		<%@include file="allConponent/navbar.jsp"%>
		<!-- Navbar -->
	</div>

	<%
	String userName = request.getAttribute("userName") + "";
	userName = (userName.equals("null")) ? "" : userName;

	String birthday = request.getAttribute("birthday") + "";
	birthday = (birthday.equals("null")) ? "" : birthday;

	String email = request.getAttribute("email") + "";
	email = (email.equals("null")) ? "" : email;

	String gender = request.getAttribute("gender") + "";
	gender = (gender.equals("null")) ? "" : gender;

	String news = request.getAttribute("news") + "";
	news = (news.equals("null")) ? "" : news;
	%>

	<section class="vh-200 gradient-custom ">

		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<!-- <div class="col-16 col-md-8 col-lg-6 col-xl-5"> -->
				<div class="card bg-dark text-white"
					style="border-radius: 1rem; width: 660px;">
					<div class="card-body p-5 text-center">

						<form action="register-servlet" method="post">
							<div class=" mt-md-4 pb-5">
								<h2 class="fw-bold mb-2 text-uppercase">SIGN UP</h2>

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
									<i class="fas fa-user fa-lg me-3 fa-fw"></i>
									<div class=" flex-fill mb-0">
										<input placeholder="Username" name="username"
											required="required" type="text" id="form3Example1c"
											class="form-control" value="<%=userName%>" />
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
										<input placeholder="Password" name="password" type="password"
											id="password" class="form-control" required="required"
											onkeyup="checkPassword()" />
									</div>
								</div>

								<div class="d-flex flex-row align-items-center mb-4">
									<i class="fas fa-key fa-lg me-3 fa-fw"></i>
									<div class=" flex-fill mb-0">
										<!-- <label class="form-label" for="form3Example4cd">Repeat
												your password<span class="red">*&nbsp;</span><span
												id="msgFalse" class="red"></span>
											</label>  -->
										<input placeholder="Repeat your password" name="passwordrt"
											type="password" id="passwordrt" class="form-control"
											required="required" onkeyup="checkPassword()" />
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

								<div class="d-flex flex-row align-items-center mb-4">
									<i class="fa fa-star fa-lg me-3 fa-fw"></i>
									<div class=" flex-fill mb-0">
										<select class="form-control" id="page" name="page"
											required="required">
											<option>Choose to manage your personal page</option>
											<c:forEach items="${listPage }" var="p">
												<option value="${p.pageID }">${p.pageName }</option>
											</c:forEach>
										</select>
									</div>
								</div>

								<%-- <div class="form-check d-flex">
										<input name="sell" class="form-check-input me-2"
											type="checkbox" value="<%=sell%>" id="form2Example3c" /> <label
											class="form-check-label" for="form2Example3">I want
											to be authorized to become a <a href="#!">Seller</a>
										</label>
									</div>

									<div class="form-check d-flex ">F
										<input name="admin" class="form-check-input me-2"
											type="checkbox" value="<%=admin%>" id="form2Example3c" /> <label
											class="form-check-label" for="form2Example3">I want
											to be authorized to become a <a href="#!">Admin</a>
										</label>
									</div> --%>

								<div class="form-check d-flex">
									<input name="news" class="form-check-input me-2"
										type="checkbox" value="<%=news%>" id="form2Example3c" /> <label
										class="form-check-label" for="form2Example3">I agree
										to receive your <a href="#!">News</a>
									</label>
								</div>

								<div class="form-check d-flex mb-3">
									<input name="license" class="form-check-input me-2"
										type="checkbox" value="" id="license" required="required"
										onchange="acceptLicense()" /> <label class="form-check-label"
										for="license"> I agree all statements in <a href="#!">Terms
											of service</a><span id="msg" class="red">*</span>
									</label>
								</div>

								<div class="d-flex justify-content-center mx-4  mb-lg-4">
									<input class="btn btn-outline-light btn-lg px-5 " type="submit"
										value="Register" name="submit" id="submit"
										style="visibility: hidden;" />

								</div>
							</div>

							<div>
								<p class="mb-0">
									Do you have an account? <a href="login.jsp"
										class="text-danger-50 fw-bold">Login</a>
								</p>
								<p class="mb-0">
									Back to home? <a href="home-servlet"
										class="text-danger-50 fw-bold">Home</a>
								</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- </div> -->
	</section>

	<!-- footer -->
	<%@include file="allConponent/footer.jsp"%>
	<!-- footer -->

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
</body>
</html>