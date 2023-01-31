<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Left column -->
<div class="templatemo-flex-row">
	<div class="templatemo-sidebar">
		<%@include file="/WEB-INF/views/layouts/admin/header.jsp"%>
		<%@include file="/WEB-INF/views/layouts/admin/imageProfile.jsp"%>
		<%@include file="/WEB-INF/views/layouts/admin/nav-left.jsp"%>
	</div>
	<div class="templatemo-content col-1 light-gray-bg">
		<div class="text-center">
			<h2 class="product-titte">List products</h2>
		</div>
		<div class="templatemo-content-container">
			<div class="templatemo-content-widget no-padding">
				<div class="panel panel-default table-responsive">
					<div class="addbook">
						<a class="btn btn-primary" href="<c:url value="/admin/product/view-add-product" />"><span><i
								class="fas fa-plus"></i></span>&nbsp; Add book new</a>

					</div>
					<div class="search-custom">
						<!-- Search box -->
						<form action="/BookShop/admin/product/search-product/">
							<div>
								<input type="text" placeholder="" name="bookName" value="${ bookName}">
								<button>
									<span>Search</span>
								</button>
							</div>

						</form>
					</div>
					<div class="export-file">
						<a class="btn btn-warning" href="<c:url value="/admin/product/report-product" />"><i class="fas fa-file-export"></i>&nbsp; Export file</a>
					</div>
					<table
						class="table table-bordered templatemo-user-table table-striped text-center">
						<thead>
							<tr>
								<td><a href="" class="white-text templatemo-sort-by">No</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Id</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Image</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Name</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Price</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Quantity</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Author</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Category</a></td>
								<td>Detail</td>
								<td>Delete</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${products }" var="products" varStatus="stt">
								<tr>
									<td class="small-text width-10"><i>${stt.index+1 }</i></td>
									<th class="text-center">${products.id }</th>
									<td><img class="img-table"
										src="<c:url value="/resource/images/books/${products.bookImage }" />"></td>
									<td>${products.bookName }</td>
									<td><fmt:formatNumber currencySymbol=""
											value="${products.price }" /></td>
									<td>${products.quantity }</td>
									<td>${products.author.authorName }</td>
									<td>${products.category.categoryName }</td>
									<td><a type="button" onclick="ShowModalDetail(this)"
										data-id="${products.id}" data-name="${products.bookName}"
										data-quantity="${products.quantity}"
										data-category="${products.category.categoryName}"
										data-author="${products.author.authorName}"
										data-price="${products.price}" data-pages="${products.pages}"
										data-language="${products.language}"
										data-publicationDate="${products.publicationDate}"
										data-publisher="${products.publisher}"
										data-bookImage="${products.bookImage}"
										data-createDate="${products.createDate}"
										class="btn btn-success" data-toggle="modal"
										data-target="#myModal"><i class="fas fa-info-circle"></i></a></td>
									<td><a type="button" class="btn btn-danger"
										data-id="${products.id}" data-name="${products.bookName }"
										onclick="showConfirmModelDialog(this)"><i
											class="fas fa-trash-alt"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="text-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<!-- <li class="page-item previous"><a class="page-link" href="#">Previous</a></li> -->
					<c:forEach begin="1" end="${Math.ceil(count/8)}" var="i">
						<li class="page-item"><a class="page-link page-product"
							id="page-number" data-id="${i }"
							href="<c:url value="/admin/product/view-product" />?page=${i}">${i }</a>
						</li>
					</c:forEach>
					<!-- <li class="page-item next"><a class="page-link" href="#">Next</a></li> -->
				</ul>
			</nav>
		</div>
	</div>
</div>

<!-- Modal Confirm Delete -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<div class="modal-body text-center">
				Do you want delete "<span id="nameProduct"></span>" ?
			</div>
			<div class="modal-footer">
				<a id="deleteProduct" href=""
					class="btn btn-danger">Yes</a>
				<button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
			</div>
		</div>
	</div>
</div>


<!-- Modal Detail Product -->
<div class="modal fade" id="modal-detail-product" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header-custom">
				<h5 class="modal-title" id="exampleModalLabel">PRODUCT DETAIL</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th scope="col">ID</th>
							<th scope="row" class="ct-product-detail"><span id="bookId"></span></th>
						</tr>
						<tr>
							<th scope="col">Book Name</th>
							<th scope="row" class="ct-product-detail"><span
								id="bookName"></span></th>
						</tr>
						<tr>
							<th scope="col">Author</th>
							<th scope="row" class="ct-product-detail"><span id="author"></span></th>
						</tr>
						<tr>
							<th scope="col">Category</th>
							<th scope="row" class="ct-product-detail"><span
								id="category"></span></th>
						</tr>
						<tr>
							<th scope="col">Quantity</th>
							<th scope="row" class="ct-product-detail"><span
								id="quantity"></span></th>
						</tr>
						<tr>
							<th scope="col">Price</th>
							<th scope="row" class="ct-product-detail"><span id="price"></span></th>
						</tr>
						<tr>
							<th scope="col">Pages</th>
							<th scope="row" class="ct-product-detail"><span id="pages"></span></th>
						</tr>
						<tr>
							<th scope="col">Language</th>
							<th scope="row" class="ct-product-detail"><span
								id="language"></span></th>
						</tr>
						<tr>
							<th scope="col">Publication Date</th>
							<th scope="row" class="ct-product-detail"><span
								id="publicationDate"></span></th>
						</tr>
						<tr>
							<th scope="col">Publisher</th>
							<th scope="row" class="ct-product-detail"><span
								id="publisher"></span></th>
						</tr>
						<tr>
							<th scope="col">Book Image</th>
							<th scope="row" class="ct-product-detail"><img
								class="img-table" id="bookImage" src=""></th>
						</tr>
						<tr>
							<th scope="col">Create Date</th>
							<th scope="row" class="ct-product-detail"><span
								id="createDate"></span></th>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="modal-footer-custom">
				<a id="updateProduct" href="" type="button" class="btn btn-primary"><i
					class="fas fa-edit"></i></a>
				<button type="button" class="btn btn-success" data-dismiss="modal">
					<i class="fas fa-window-close"></i>
				</button>
			</div>
		</div>
	</div>
</div>

<script>
	//active pagenation
	window.onload = function() {
		var url = window.location.href;
		var tablinks = document.getElementsByClassName("page-product");
		hrefs = [];
		for (i = 0; i < tablinks.length; i++) {
			hrefs.push(tablinks[i].href);
		}
		if (url == "http://localhost:8080/BookShop/admin/product/view-product") {
			tablinks[0].classList.add("a-active");
		}
		for (i = 0; i < tablinks.length; i++) {
			if (hrefs[i] == url) {
				tablinks[i].classList.add("a-active");
			}
		}
	}
</script>


<c:if test="${updateProductSuccess != null }">
	<script>
		window.onload = function() {
			swal('Success', 'Update success', 'success')
		}
	</script>
</c:if>

<c:if test="${addProductSuccess != null }">
	<script>
		window.onload = function() {
			swal('Success', 'add new success', 'success')
		}
	</script>
</c:if>

<c:if test="${deleteSuccess != null }">
	<script>
		window.onload = function() {
			swal('Success', 'Delete success', 'success')
		}
	</script>
</c:if>
