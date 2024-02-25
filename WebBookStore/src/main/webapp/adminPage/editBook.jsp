<%@page import="java.sql.Connection"%>
<%@page import="database.JDBCUtil"%>
<%@page import="java.util.List"%>
<%@page import="dao.HomeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Book"%>
<%@ page import="model.Category"%>
<%@ page import="model.Status"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add books</title>
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

	<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	%>
	<%-- <%
	String bookId = request.getParameter("bookId");

	HomeDAO homeDAO = new HomeDAO();
	Book book = homeDAO.getBookByID(bookId);
	%> --%>
	<%@include file="../allConponent/js.jsp"%>

	<!-- Navbar -->
	<%@include file="../allConponent/navbar.jsp"%>
	<!-- Navbar -->

	<section class="vh-100 gradient-custom ">

		<div class="container py-5 h-200">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-dark text-white"
						style="border-radius: 1rem; width: 660px; margin-top: 34px;">
						<div class="card-body p-4 text-center">


							<form action="<%=path%>/admin-controller" method="post">
								<input type="hidden" name="action" value="edit-book-servlet">
								<div class=" mt-md-4 pb-5">
									<h2 class="fw-bold mb-2 text-uppercase">EDIT BOOK</h2>

									<%-- <div>
										<p>
											<span class="text-danger ">${ }</span> <span
												class="text-success ">${ }</span>
										</p>

										<p>
											<span id="msgTrue" class=green></span> <span id="msgFalse"
												class=red></span>
										</p>
									</div> --%>
									<div class=" form-white mb-4">
										<input type="hidden" id="typeEmailX"
											class="form-control form-control-lg" placeholder="bookID"
											name="bookID" required="required" readonly="readonly"
											value="${detail.bookID }" />
									</div>

									<div class=" form-white mb-4">
										<input type="text" id="typeEmailX"
											class="form-control form-control-lg" placeholder="bookname"
											name="bookname" required="required"
											value="${detail.bookName }" />
									</div>

									<div class=" form-white mb-4">
										<input type="text" id="typeEmailX"
											class="form-control form-control-lg" placeholder="quantity"
											name="quantity" required="required"
											value="${detail.quantity }" />
									</div>

									<div class=" form-white mb-4">
										<input type="text" id="typeEmailX"
											class="form-control form-control-lg" placeholder="author"
											name="author" required="required" value="${detail.author }" />
									</div>

									<div class=" form-white mb-4">
										<input type="text" id="typeEmailX"
											class="form-control form-control-lg" placeholder="price"
											name="price" required="required" value="${detail.price }" />
									</div>

									<div class=" form-white mb-4">
										<input type="text" id="typeEmailX"
											class="form-control form-control-lg" placeholder="title"
											name="title" required="required" value="${detail.title }" />
									</div>

									<div class=" form-white mb-4">
										<input type="text" id="typeEmailX"
											class="form-control form-control-lg"
											placeholder="Description" name="description"
											required="required" value="${detail.description }" />
									</div>

									<div class=" form-group form-white mb-4">
										<select name="category" class="form-select form-control-lg"
											required="required">
											<option disabled="disabled">Book Category</option>
											<c:forEach items="${listCate }" var="o">
												<option value="${o.cateID }">${o.cateName }</option>
											</c:forEach>
										</select>
									</div>

									<div class="form-group form-white mb-4">
										<select id="status" name="status"
											class="form-select form-control-lg" required="required">
											<option disabled="disabled">Book Status</option>
											<c:forEach items="${listStt }" var="s">
												<option value="${s.sttID }">${s.sttName }</option>
											</c:forEach>
										</select>
									</div>

									<div class=" form-white">
										<input type="text" id="typeEmailX"
											class="form-control form-control-lg" placeholder="image"
											name="image" required="required" value="${detail.image }" />
										<!-- <input id="typeEmailX" type="file"
											class="form-control-file form-control-lg"
											placeholder="Upload Image" name="img" /> -->
									</div>
								</div>

								<div class="d-flex justify-content-center mx-4  mb-lg-4">
									<span class="mb-0" style="margin-right: 20px"> <input
										class="btn btn-outline-light btn-lg px-5 " type="submit"
										value="Edit Now" name="submit" id="submit" />
									</span> <span class="mb-0"> <span class="mb-0"><a
											href="<%=path%>/admin-controller?action=manage-servlet">
												<input class="btn btn-outline-light btn-lg px-5 "
												type="button" value="Cancel" name="button" id="button" />
										</a> </span>
									</span>
								</div>
							</form>
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