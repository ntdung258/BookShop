<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Left column -->
<div class="templatemo-flex-row">
	<div class="templatemo-sidebar">
		<%@include file="/WEB-INF/views/layouts/admin/header.jsp"%>
		<%@include file="/WEB-INF/views/layouts/admin/imageProfile.jsp"%>
		<%@include file="/WEB-INF/views/layouts/admin/nav-left.jsp"%>
	</div>
	<div class="templatemo-content col-1 light-gray-bg">
		<div class="text-center">
			<h2 class="product-titte">List categories</h2>
		</div>
		<c:if test="${categoryAE != null }">
			<div class="text-center pt mt">
				<h3 class="alert alert-danger">${categoryAE }</h3>
			</div>
		</c:if>
		<div class="templatemo-content-container">
			<c:if test="${addCategoryFail != null }">
				<div class="alert alert-success text-center container">
					<span>${addCategoryFail }</span>
				</div>
			</c:if>
			<c:if test="${updateCategoryFail != null }">
				<div class="alert alert-success text-center container">
					<span>${updateCategoryFail}</span>
				</div>
			</c:if>
			<div class="templatemo-content-widget no-padding">
				<div class="panel panel-default table-responsive">
					<div class="addbook">
						<button class="btn btn-primary"
							onClick="showModalAddNewCategory()">
							<span><i class="fas fa-plus"></i></span>&nbsp; Add new category
						</button>

					</div>
					<div class="search-custom">
						<!-- Search box -->
						<form action="/BookShop/admin/category/search-category/">
							<div>
								<input type="text" placeholder="" name="key" value="${key}">
								<button>
									<span>Search</span>
								</button>
							</div>
						</form>
					</div>
					<div class="export-file">
						<a class="btn btn-warning" href="<c:url value="/admin/category/report-category" />"><i class="fas fa-file-export"></i>&nbsp; Export file</a>
					</div>
					<table
						class="table table-bordered templatemo-user-table text-center">
						<thead>
							<tr>
								<td><a href="" class="white-text templatemo-sort-by">No</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Id</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Category</a></td>
								<td>Edit</td>
								<td>Delete</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listCategorys }" var="category" varStatus="stt">
								<tr>
									<td class="small-text width-10"><i>${stt.index+1 }</i></td>
									<th class="text-center">${category.id }</th>
									<td>${category.categoryName }</td>
									<td><button type="submit" data-id="${category.id }"
											data-name="${category.categoryName }"
											onclick="showModalEditCategory(this)" class="btn btn-warning">
											<i class="fas fa-edit"></i>
										</button></td>
									<td><a data-id="${category.id}"
										onclick="showConfirmModalDeleteCategory(this)" type="button" class="btn btn-danger"><i
											class="fas fa-trash-alt"></i></a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal Add Category -->
<div class="modal fade" id="modal-add-new-category" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header-custom">
				<h5 class="modal-title" id="exampleModalLabel">ADD NEW CATEGORY</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<form action="/BookShop/admin/category/add-category" method="post"
				onsubmit="return formAddCategoryValidate()">
				<div class="modal-body">
					<div class="col-lg-12 col-md-12 form-group">
						<label>Category Name &nbsp;</label> <span id="errCategoryName"
							class="err"></span>
						<input type="text" class="form-control" name="categoryName"
							id="categoryName" />
					</div>
				</div>
				<div class="modal-footer-custom">
					<button type="submit" class="btn btn-success">
						<i class="fas fa-plus"></i>
					</button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">
						<i class="fas fa-window-close"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- Modal Edit Category -->
<div class="modal fade" id="modal-edit-category" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header-custom">
				<h5 class="modal-title" id="exampleModalLabel">EDIT CATEGORY</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<form action="/BookShop/admin/category/edit-category" method="post"
				onsubmit="return formEditCategoryValidate()">
				<div class="modal-body">
					<div class="col-lg-12 col-md-12 form-group">
						<label>Category Name &nbsp;</label> <span id="errEditCategoryName"
							class="err"></span> <input type="hidden" class="form-control"
							id="categoryId" name="categoryId" /> <input type="text"
							class="form-control" id="editCategoryName"
							name="editCategoryName" />
					</div>
				</div>
				<div class="modal-footer-custom">
					<button type="submit" class="btn btn-success">
						<i class="fas fa-edit"></i>
					</button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">
						<i class="fas fa-window-close"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>


<script>
	function showModalAddNewCategory() {
		$("#modal-add-new-category").modal("show");
	}

	function showModalEditCategory(category) {
		document.getElementById('categoryId').value = category
				.getAttribute("data-id");
		document.getElementById('editCategoryName').value = category
				.getAttribute("data-name");
		$("#modal-edit-category").modal("show");
	}
</script>


<c:if test="${updateCategorySuccess != null }">
	<script>
		window.onload = function() {
			swal('Success', 'Update category success', 'success')
		}
	</script>
</c:if>

<c:if test="${addCategorySuccess != null }">
	<script>
		window.onload = function() {
			swal('Success', 'Add new category success', 'success')
		}
	</script>
</c:if>

<c:if test="${deleteSucess != null }">
	<script>
		window.onload = function() {
			swal('Success', 'Delete category success', 'success')
		}
	</script>
</c:if>




<!-- Modal Confirm Delete Category -->
<div class="modal fade" id="modalConfirmDeleteCategory" tabindex="-1" role="dialog"
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
				<strong>Do you want to delete?</strong> All books by the category will also be deleted !
			</div>
			
			<div class="modal-footer">
				<a id="deleteCategory"
					 class="btn btn-danger">Yes</a>
				<button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
					
			</div>
		</div>
	</div>
</div>

<script>
	//Show modal confirm delete Author
	function showConfirmModalDeleteCategory(cate) {
		var id = cate.getAttribute("data-id");
		document.getElementById("deleteCategory").href="/BookShop/admin/category/delete-category/"+id; 
		$("#modalConfirmDeleteCategory").modal("show");
	}
</script>


