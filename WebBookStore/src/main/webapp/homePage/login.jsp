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
<title>Login</title>

<%@include file="../allConponent/allCss.jsp"%>
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
									<input type="hidden" name="action" value="login-servlet">
									<h2 class="fw-bold mb-2 text-uppercase">Login</h2>
									<p class="text-white-50 mb-5">Please enter your login and
										password!</p>
									<span class="text-danger alert">${msgError }</span>

									<div class=" form-white mb-4">
										<input type="text" id="typeEmailX"
											class="form-control form-control-lg" placeholder="Username"
											name="username" />
									</div>

									<div class=" form-white mb-4">
										<input type="password" id="typePasswordX"
											class="form-control form-control-lg" placeholder="Password"
											name="password" />
									</div>


									<p class="small mb-5 pb-lg-2">
										<a class="text-white-50" href="#!">Forgot password?</a>
									</p>



									<button class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>

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
	<!-- footer -->
	<%@include file="../allConponent/footer.jsp"%>
	<!-- footer -->
</body>
</html>