
<!-- Navbar -->
<%@page import="model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white">
	<!-- Container wrapper -->
	<div class="container">
		<!-- Toggle button -->
		<button class="navbar-toggler" type="button"
			data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent1"
			aria-controls="navbarSupportedContent1" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Collapsible wrapper -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent1">
			<!-- Navbar brand -->
			<a class="navbar-brand mt-2 mt-sm-0"
				href="http://localhost:8080/BookShop/home-servlet "> <img
				src="https://mdbcdn.b-cdn.net/img/logo/mdb-transaprent-noshadows.webp"
				height="20" alt="MDB Logo" loading="lazy" />
			</a>
			<!-- Left links -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item active"><a class="nav-link "
					href="http://localhost:8080/BookShop/home-servlet">Home</a></li>
				<li class="nav-item"><a class="nav-link"
					href="https://mdbootstrap.com/docs/standard/">About MDB</a></li>


				<%-- <c:when test="${ sessionScope.user.isAdmin=='true'}">
					<li class="nav-item"><a class="nav-link" href="">Manager
							Account</a></li>
				</c:when>

				<c:when test="${ sessionScope.user.isSell=='true'}">
					<li class="nav-item"><a class="nav-link" href="">Manager
							Product</a></li>
				</c:when> --%>

			</ul>
			<!-- Left links -->
		</div>
		<!-- Collapsible wrapper -->

		<!-- Right elements -->
		<div class="d-flex align-items-center">
			<!-- Icon -->

			<!-- <a class="nav-link me-3" href="#"> <i class="fab fa-facebook-f"></i>
			</a> <a class="nav-link me-3" href="#"> <i class="fab fa-twitter"></i></a> -->

			<c:if test="${ sessionScope.user.pageID == 1}">
				<div class="dropdown show">
					<a class="btn dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><i class="fa fa-user"></i>&nbsp;&nbsp;Manage
						System</a>

					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="edit-book-servlet"><i
							class="fa fa-pen-to-square"></i>&nbsp;&nbsp;Edit books</a> <a
							class="dropdown-item" href="addSelect"><i
							class="fa fa-circle-plus"></i>&nbsp;&nbsp;Add books</a> <a
							class="dropdown-item" href="#"><i class="fa fa-pen-to-square"></i>&nbsp;&nbsp;All
							books</a> <a class="dropdown-item" href="#">All Orders</a>
					</div>
				</div>


			</c:if>

			<c:if test="${ sessionScope.user.pageID == 2}">
				<div class="dropdown show">
					<a class="btn dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><i class="fa fa-user"></i>&nbsp;&nbsp;Manage
						Products</a>

					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href=""><i
							class="fa fa-pen-to-square"></i>&nbsp;&nbsp;Edit books</a> <a
							class="dropdown-item" href="#">All Orders</a>
					</div>
				</div>
			</c:if>


			<c:if test="${ sessionScope.user != null}">
				<!-- <a href="logout-servlet" class="border rounded px-2 nav-link"
					target="_blank"> <i class="fa fa-sign-in me-2"></i>LogOut
				</a> -->
				<div class="dropdown show">
					<a class="btn dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><i class="fa fa-user"></i>&nbsp;&nbsp;Hello
						${sessionScope.user.userName } </a>

					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="#"><i class="fa fa-user-pen"></i></i>&nbsp;&nbsp;Edit
							Profile</a> <a class="dropdown-item" href="logout-servlet"><i
							class="fa fa-sign-in me-2"></i>LogOut</a>
					</div>
				</div>
				&ensp; &ensp;
				<a class="nav-link me-3" href="#"> <i
					class="fas fa-shopping-cart"></i> <span
					class="badge rounded-pill badge-notification bg-danger">1</span>
				</a>
			</c:if>

			<c:if test="${ sessionScope.user == null}">
				<a href="login.jsp" class="border rounded px-2 nav-link"
					target="_blank"> <i class="fa fa-sign-in me-2"></i>Login
				</a>
			</c:if>

		</div>
		<!-- Right elements -->

	</div>
	<!-- Container wrapper -->
</nav>
<!-- Navbar -->