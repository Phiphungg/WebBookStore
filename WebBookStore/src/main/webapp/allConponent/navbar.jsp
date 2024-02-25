
<!-- Navbar -->
<%@page import="model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
<!--
HTML !--> <button class ="button-13 " role ="button ">Button 13 </button>
	/* CSS */ .button-13 {
	background-color: #fff;
	border: 1px solid #d5d9d9;
	border-radius: 8px;
	box-shadow: rgba(213, 217, 217, .5) 0 2px 5px 0;
	box-sizing: border-box;
	color: #0f1111;
	cursor: pointer;
	display: inline-block;
	font-family: "Amazon Ember", sans-serif;
	font-size: 13px;
	line-height: 29px;
	padding: 0 10px 0 11px;
	position: relative;
	text-align: center;
	text-decoration: none;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
	vertical-align: middle;
	width: 100px;
}

.button-13:hover {
	background-color: #f7fafa;
}

.button-13:focus {
	border-color: #008296;
	box-shadow: rgba(213, 217, 217, .5) 0 2px 5px 0;
	outline: 0;
}
</style>


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
			<a class="navbar-brand mt-2 mt-sm-0" href="<%=path%>/home-servlet ">
				<img
				src="https://mdbcdn.b-cdn.net/img/logo/mdb-transaprent-noshadows.webp"
				height="20" alt="MDB Logo" loading="lazy" />
			</a>
			<!-- Left links -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item active"><a class="nav-link "
					href="<%=path%>/home-servlet">Home</a></li>
				<li class="nav-item"><a class="nav-link"
					href="https://mdbootstrap.com/docs/standard/">About MDB</a></li>
				<li class="nav-item"><a class="nav-link"
					href="https://mdbootstrap.com/docs/standard/">Contact Us</a></li>


			</ul>
			<!-- Left links -->
		</div>
		<!-- Collapsible wrapper -->

		<!-- Right elements -->
		<div class="d-flex align-items-center">
			<!-- Icon -->

			<!-- <a class="nav-link me-3" href="#"> <i class="fab fas-facebook-f"></i>
			</a> <a class="nav-link me-3" href="#"> <i class="fab fa-twitter"></i></a> -->

			<c:if test="${ sessionScope.user.userName == 'admin' }">

				<div>
					<a href="#addEmployeeModal1" class="btn button-13 "
						data-toggle="modal"> <i class="fa-solid fa-circle-info fa-lg"></i><span>
							&nbsp; Detail</span></a>
				</div>
				<!-- 
				 <a class="btn " href="#addEmployeeModal1" role="button"><i
					class="fa-brands fa-black-tie"></i>&nbsp;&nbsp;Admin</a> 

				 <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="manage-servlet"><i
							class="fa fa-pen-to-square"></i>&nbsp;&nbsp;Edit books</a>
						<a
							class="dropdown-item" href="#"><i class="fa fa-pen-to-square"></i>&nbsp;&nbsp;Manage
							User</a> <a class="dropdown-item" href="#"><i
							class="fa fa-pen-to-square"></i>&nbsp;&nbsp;All Orders</a>
					</div>  -->

			</c:if>


			<c:if test="${ sessionScope.user != null }">

				<div class="dropdown show">
					<a class="btn dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><i class="fa fa-user"></i>&nbsp;&nbsp;Hello
						${sessionScope.user.userName } </a>

					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<c:if
							test="${sessionScope.user != null && sessionScope.user.userName != 'admin' }">

							<a class="dropdown-item"
								href="<%=path%>/user-controller?action=order-list"><i
								class="fa-regular fa-star"></i>&nbsp;&nbsp;My Orders</a>
							<!-- <a
							class="dropdown-item" href="#">All Orders</a> -->


						</c:if>

						<a class="dropdown-item"
							href="<%=path%>/homePage/changeInformation.jsp"><i
							class="fa fa-user-pen"></i>&nbsp;&nbsp;Edit Profile</a><a
							class="dropdown-item"
							href="<%=path%>/homePage/changePassword.jsp"><i
							class="fa-regular fa-pen-to-square"></i>&nbsp;&nbsp;Change
							Password</a><a class="dropdown-item"
							href="<%=path%>/home-controller?action=logout-servlet"><i
							class="fa fa-sign-in me-2"></i>LogOut</a>
					</div>
				</div>
			</c:if>


			<c:if test="${ sessionScope.user == null}">
				<a href="<%=path%>/homePage/login.jsp"
					class="border rounded px-2 nav-link" target="_blank"> <i
					class="fa fa-sign-in me-2"></i>Login
				</a>

				&ensp; &ensp;

				<a class="nav-link me-3" href="<%=path%>/otherPage/addToCart.jsp">
					<i class="fas fa-shopping-cart"></i> <span
					class="badge rounded-pill badge-notification bg-danger">${size }</span>
				</a>
			</c:if>

			<c:if
				test="${ sessionScope.user != null && sessionScope.user.userName != 'admin' }">
				&ensp; &ensp;

				<a class="nav-link me-3" href="<%=path%>/otherPage/addToCart.jsp">
					<i class="fas fa-shopping-cart"></i> <span
					class="badge rounded-pill badge-notification bg-danger">${size }</span>
				</a>
			</c:if>

		</div>
		<!-- Right elements -->

	</div>
	<!-- Container wrapper -->
</nav>
<!-- Navbar -->
