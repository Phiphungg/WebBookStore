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

							<!-- <div
								class="d-flex justify-content-between align-items-center mb-4">
								<p>
									<span class="h2">Manage Users & Orders</span>
								</p>


								<div>
									<a href="#addEmployeeModal1" class="btn btn-success"
										data-toggle="modal"><i class="fa fa-plus"></i> <span>Button</span></a>
								</div>
							</div> -->


							<div
								class="d-flex justify-content-between align-items-center mb-4">
								<p>
									<span class="h2">Manage Product</span>
								</p>


								<div>
									<a href="#addEmployeeModal" class="btn btn-success"
										data-toggle="modal"><i class="fa fa-plus"></i> <span>Add
											New Product</span></a>
								</div>
							</div>



							<c:forEach items="${listBook }" var="o">
								<div class="card rounded-3 mb-4">
									<div class="card-body p-4">
										<div
											class="row d-flex justify-content-between align-items-center">
											<div class="col-md-2 col-lg-2 col-xl-2">

												<img src="${o.image }" class="img-fluid rounded-3"
													alt="Cotton T-shirt">

											</div>

											<div class="col-md-3 col-lg-3 col-xl-3">
												<p class="lead fw-normal mb-2">${o.bookName }</p>
												<p>
													<c:if test="${o.cateID=='1' }">
														<span class="text-muted">Category: </span>Novel</c:if>

													<c:if test="${o.cateID=='2' }">
														<span class="text-muted">Category: </span>Comic
													</c:if>

													<c:if test="${o.cateID=='3' }">
														<span class="text-muted">Category: </span>Science Fiction
													</c:if>

													<c:if test="${o.cateID=='4' }">
														<span class="text-muted">Category: </span>Thriller
													</c:if>

													<br />

													<c:if test="${o.sttID=='1' }">
														<span class="text-muted">Status: </span>BestSeller</c:if>

													<c:if test="${o.sttID=='2' }">
														<span class="text-muted">Status: </span>New</c:if>
												</p>
											</div>
											<div class="col-md-3 col-lg-3 col-xl-2 d-flex">
												<p class="text-muted">Status:&ensp;</p>${o.author }
												<!-- <button class="btn btn-link px-2"
													onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
													<i class="fas fa-minus"></i>
												</button>

												<input id="form1" min="0" name="quantity" value="2"
													type="number" class="form-control form-control-sm" />

												<button class="btn btn-link px-2"
													onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
													<i class="fas fa-plus"></i> -->
												</button>


											</div>
											<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
												<h5 class="mb-0">${o.price }$</h5>
											</div>

											<!-- Edit & Delete -->
											<div class="col-md-1 col-lg-1 col-xl-1 text-end">
												<a
													href="<%=path %>/admin-controller?action=load-product&bookId=${o.bookID }"
													class="text-danger"><i
													class="fa-solid fa-pen-to-square fa-lg"></i></a> <a
													href="<%=path %>/admin-controller?action=delete-ad-servlet&bookId=${o.bookID }"
													class="text-danger"><i class="fas fa-trash fa-lg"></i></a>
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

	<div id="addEmployeeModal" class="modal fade">
		<section class="vh-100 gradient-custom ">

			<div class="container py-5 h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12 col-md-8 col-lg-6 col-xl-5">
						<div class="card bg-dark text-white"
							style="border-radius: 1rem; width: 660px;">
							<div class="card-body p-5 text-center">

								<form action="<%=path%>/admin-controller" method="post">
									<input type="hidden" name="action"
										value="add-book-servlet-admin">
									<div class=" mt-md-4 pb-5">
										<h2 class="fw-bold mb-2 text-uppercase">ADD BOOK</h2>

										<%-- <div>
										<p>
											<span class="text-danger ">${msgAddError }</span> <span
												class="text-success ">${msgAddOk }</span>
										</p>

										<p>
											<span id="msgTrue" class=green></span> <span id="msgFalse"
												class=red></span>
										</p>
									</div> --%>

										<div class=" form-white mb-4">
											<input type="text" id="typeEmailX"
												class="form-control form-control-lg" placeholder="Book Name"
												name="bookname" required="required" />
										</div>

										<div class=" form-white mb-4">
											<input type="text" id="typeEmailX"
												class="form-control form-control-lg"
												placeholder="Author Name" name="author" required="required" />
										</div>


										<div class=" form-white mb-4">
											<input type="text" id="typeEmailX"
												class="form-control form-control-lg" placeholder="Price"
												name="price" required="required" />
										</div>

										<div class=" form-white mb-4">
											<input type="text" id="typeEmailX"
												class="form-control form-control-lg" placeholder="Quantity"
												name="quantity" required="required" />
										</div>

										<div class=" form-white mb-4">
											<input type="text" id="typeEmailX"
												class="form-control form-control-lg" placeholder="Title"
												name="title" required="required" />
										</div>

										<div class=" form-white mb-4">
											<input type="text" id="typeEmailX"
												class="form-control form-control-lg"
												placeholder="Description" name="description"
												required="required" />
										</div>

										<div class=" form-group form-white mb-4">
											<select name="category" class="form-select form-control-lg"
												required="required">
												<option disabled="disabled" selected="selected">Book
													Category</option>
												<c:forEach items="${listCate }" var="o">
													<option value="${o.cateID }">${o.cateName }</option>
												</c:forEach>
											</select>
										</div>

										<div class="form-group form-white mb-4">
											<select id="status" name="status"
												class="form-select form-control-lg" required="required">
												<option disabled="disabled" selected="selected">Book
													Status</option>
												<c:forEach items="${listStt }" var="s">
													<option value="${s.sttID }">${s.sttName }</option>
												</c:forEach>
											</select>
										</div>

										<div class=" form-white">
											<input type="text" id="typeEmailX"
												class="form-control form-control-lg" placeholder="Image"
												name="image" required="required" />
											<!-- <input id="typeEmailX" type="file"
											class="form-control-file form-control-lg"
											placeholder="Upload Image" name="img" /> -->
										</div>
									</div>

									<div class="d-flex justify-content-center mx-4  mb-lg-4 ">
										<span class="mb-0" style="margin-right: 20px"> <input
											class="btn btn-outline-light btn-lg px-5 " type="submit"
											value="Add Now" name="submit" id="submit" />
										</span> <span class="mb-0"><a
											href="<%=path%>/admin-controller?action=manage-servlet">
												<input class="btn btn-outline-light btn-lg px-5 "
												type="button" value="Cancel" name="button" id="button" />
										</a> </span>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
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
									href="<%=path%>/admin-controller?action=manage-servlet"> <input
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