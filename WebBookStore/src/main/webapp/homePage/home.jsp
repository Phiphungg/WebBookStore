<%@page import="model.User"%>
<%@page import="dao.OrderDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.HomeDAO"%>
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
<title>Home</title>
<%
String path1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
<%@include file="/allConponent/bootstrap.jsp"%>
<%@include file="../allConponent/allCss.jsp"%>
<%@include file="../allConponent/style.jsp"%>

<!-- <style type="text/css">
.navbar-nav>li>a:hover {
	box-shadow: 0 0 10px 0 white inset, 0 0 20px 2px white;
	transition: 0.2s;
}
</style> -->
</head>
<script type="text/javascript">
	function add(bookID) {
		document.f.action = "http://localhost:8080/BookShop/user-controller?action=add-cart-servlet&bookID="
				+ bookID;
		document.f.submit();
	}
</script>

<style type="text/css">
.navbar-nav>li>a:hover {
	box-shadow: 0 0 10px 0 white inset, 0 0 20px 2px white;
	transition: 0.2s;
}
</style>

<body>
	<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	%>

	<c:set var="size" value="${sessionScope.size }" />
	<%@include file="../allConponent/js.jsp"%>
	<%-- <jsp:include page="<%=path%>/allConponent/js.jsp"></jsp:include> --%>
	<!-- Navbar -->
	<%@include file="../allConponent/navbar.jsp"%>
	<%-- <jsp:include page="<%=path%>/allConponent/navbar.jsp"></jsp:include> --%>
	<!-- Navbar -->

	<!-- carousel -->
	<%@include file="../allConponent/carousel.jsp"%>
	<%-- <jsp:include page="<%=path%>/allConponent/carousel.jsp"></jsp:include> --%>

	<!--Main layout-->
	<main>
		<div class="container">

			<!-- Navbar -->
			<%-- <jsp:include page="<%=path%>/allConponent/navbarBody.jsp"></jsp:include> --%>
			<%@include file="../allConponent/navbarBody.jsp"%>
			<!-- Navbar -->

			<!-- Products -->
			<form name="f" action="" method="post">
				<input type="hidden" name="num" value="1">
				<section>
					<div class="col-sm-12 text-center">
						<div class="row">
							<c:forEach items="${listBook}" var="o">
								<div class="col-lg-3 col-md-6 mb-4"
									style="align-content: center;">
									<div class="card " style="width: 300px; height: 550px">

										<div
											class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
											data-mdb-ripple-color="light"
											style="margin: 20px 20px 0 20px;">

											<img src="${o.image}" class="w-100" /> <a
												href="<%=path %>/home-controller?action=detail-servlet&bookID=${o.bookID}"></a>

											<div class="mask">
												<c:if test="${o.sttID=='2' }">
													<div
														class="d-flex justify-content-start align-items-end h-100">
														<h5>
															<span class="badge bg-dark ms-2">New</span>
														</h5>
													</div>
												</c:if>

												<c:if test="${o.sttID=='1' }">
													<div
														class="d-flex justify-content-start align-items-end h-100">
														<h5>
															<span class="badge bg-dark ms-2">BestSeller</span>
														</h5>
													</div>
												</c:if>
											</div>


											<div class="hover-overlay">
												<div class="mask"
													style="background-color: rgba(251, 251, 251, 0.15)"></div>
											</div>
										</div>

										<div class="card-body" style="padding: 20px">

											<a
												href="<%=path %>/home-controller?action=detail-servlet&bookID=${o.bookID}"
												class="text-reset">
												<h6 class="card-title mb-2">${o.bookName}</h6>
											</a> <a href="" class="text-reset "> <c:if
													test="${o.cateID=='1' }">
													<p>Novel</p>
												</c:if> <c:if test="${o.cateID=='2' }">
													<p>Comic</p>
												</c:if> <c:if test="${o.cateID=='3' }">
													<p>Science Fiction</p>
												</c:if> <c:if test="${o.cateID=='4' }">
													<p>Thriller</p>
												</c:if>

											</a>


											<div class="row">
												<div class="col">

													<p class="btn btn-danger btn-block">
														<i class="fa-solid fa-dollar-sign fa-lg"></i> ${o.price}
													</p>

												</div>
												<div class="col">
													<%-- <a href="" class="btn btn-success btn-block"
													style="padding: 10px 8px 8px;"><input type="submit" onclick="buy('${o.bookID}')"><i
													class="fa-solid fa-cart-plus fa-lg"></i> Add to cart</a> --%>

													<input class="btn btn-success btn-block" type="submit"
														onclick="add('${o.bookID}')" value="Add to cart">
													<!-- <i
													class="fa-solid fa-cart-plus fa-lg"></i>  -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</section>
			</form>




			<!-- Pagination -->
			<!-- <nav aria-label="Page navigation example"
				class="d-flex justify-content-center mt-3">
				<ul class="pagination">
					<li class="page-item disabled"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav> -->
			<!-- Pagination -->
		</div>
	</main>
	<!--Main layout-->

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
								</span> <span class="mb-0"><a href="<%=path%>/home-servlet">
										<input class="btn btn-outline-light btn-lg px-5 "
										type="button" value="Cancel" name="button" id="button" />
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
	<%-- <jsp:include page="<%=path%>/allConponent/footer.jsp"></jsp:include> --%>
	<!-- footer -->
</body>
</html>