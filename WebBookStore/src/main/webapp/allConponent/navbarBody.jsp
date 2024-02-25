<%@ page import="model.Book"%>
<%@ page import="model.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<nav class="navbar navbar-expand-lg navbar-dark mt-3 mb-5 shadow p-2"
	style="background-color: #6D92D0">
	<!-- Container wrapper -->
	<div class="container-fluid">
		<!-- Navbar brand -->
		<a href="<%=path%>/home-servlet" class="navbar-brand">Categories:</a>

		<!-- Toggle button -->
		<button class="navbar-toggler" type="button"
			data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent2"
			aria-controls="navbarSupportedContent2" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Collapsible wrapper -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent2">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<!-- Link -->
				<c:forEach items="${listCate}" var="o">
					<li class="nav-item"><a class="nav-link text-white "
						href="<%=path %>/home-controller?action=cate-servlet&cateID=${o.cateID }">${o.cateName }</a></li>
				</c:forEach>
			</ul>

			<!-- Search -->
			<form action="<%=path%>/home-controller" method="post"
				class="w-auto py-1" style="max-width: 16rem">
				<input type="hidden" name="action" value="search-servlet">
				<div class="input-group">
					<div class="form-outline" data-mdb-input-init>
						<input value="txtS" name="search" id="search-input" type="search"
							id="form1" style="border: 1px solid;" class="form-control" /> <label
							class="form-label" for="form1" style="color: white;">Search</label>
					</div>
					<button id="search-button" type="submit" style="color: grey">
						<i class="fas fa-search"></i>
					</button>
				</div>

			</form>
		</div>
	</div>
	<!-- Container wrapper -->
</nav>