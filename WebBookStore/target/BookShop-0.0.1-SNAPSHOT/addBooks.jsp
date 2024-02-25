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
<title>Admin: Add books</title>
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

.col-xl-5 {
	flex: 0 0 auto;
	width: 0;
}

.col-lg-6 {
	flex: 0 0 auto;
	width: 50%;
}
</style>
</head>
<body>
	<%@include file="allConponent/js.jsp"%>

	<!-- Navbar -->
	<%@include file="allConponent/navbar.jsp"%>
	<!-- Navbar -->

	<section class="vh-100 gradient-custom ">

		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-dark text-white"
						style="border-radius: 1rem; width: 660px;">
						<div class="card-body p-5 text-center">

							<form action="add-book-servlet-admin" method="post">
								<div class=" mt-md-4 pb-5">
									<h2 class="fw-bold mb-2 text-uppercase">SIGN UP</h2>

									<span class="text-danger alert">${msgError }</span> <span
										class="text-success alert ">${msgOk }</span> <span
										id="msgTrue" class=green></span> <span id="msgFalse" class=red></span>

									<div class=" form-white mb-4">
										<input type="text" id="typeEmailX"
											class="form-control form-control-lg" placeholder="Book Name"
											name="bookname" />
									</div>

									<div class=" form-white mb-4">
										<input type="text" id="typeEmailX"
											class="form-control form-control-lg"
											placeholder="Author Name" name="author" />
									</div>

									<div class=" form-white mb-4">
										<input type="text" id="typeEmailX"
											class="form-control form-control-lg" placeholder="Price"
											name="price" />
									</div>

									<div class=" form-white mb-4">
										<input type="text" id="typeEmailX"
											class="form-control form-control-lg" placeholder="Title"
											name="title" />
									</div>

									<div class=" form-white mb-4">
										<input type="text" id="typeEmailX"
											class="form-control form-control-lg"
											placeholder="Description" name="description" />
									</div>

									<div class=" form-group form-white mb-4">
										<select name="category" class="form-select form-control-lg">
											<option selected="selected">Book Category</option>
											<c:forEach items="${listCate }" var="o">
												<option value="${o.cateID }">${o.cateName }</option>
											</c:forEach>
										</select>
									</div>

									<div class=" form-white mb-4">
										<select id="status" name="status"
											class="form-control form-control-lg">
											<option selected="selected">Book Status</option>
											<c:forEach items="${listStt }" var="s">
												<option value="${s.sttID }">${s.sttName }</option>
											</c:forEach>
										</select>
									</div>
									
									<div class=" form-white mb-4">
										<select id="page" name="page"
											class="form-control form-control-lg">
											<option selected="selected">Page</option>
											<c:forEach items="${listPage }" var="p">
												<option value="${p.pageID }">${p.pageName }</option>
											</c:forEach>
										</select>
									</div>

									<div class=" form-white">
									<input type="text" id="typeEmailX"
											class="form-control form-control-lg"
											placeholder="Image" name="image" />
										<!-- <input id="typeEmailX" type="file"
											class="form-control-file form-control-lg"
											placeholder="Upload Image" name="img" /> -->
									</div>
								</div>

								<div class="d-flex justify-content-center mx-4  mb-lg-4">
									<p class="mb-0">

										<input class="btn btn-outline-light btn-lg px-5 "
											type="submit" value="Add Now" name="submit" id="submit" />
									</p>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- footer -->
	<%@include file="allConponent/footer.jsp"%>
	<!-- footer -->
</body>
</html>