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
			<h2 class="product-titte">List authors</h2>
		</div>
		<c:if test="${authorAE != null }">
			<div class="text-center pt mt">
				<h3 class="alert alert-danger">${authorAE }</h3>
			</div>
		</c:if>
		<div class="templatemo-content-container">
			<c:if test="${addAuthorFail != null }">
				<div class="alert alert-success text-center container">
					<span>${addAuthorFail }</span>
				</div>
			</c:if>
			<c:if test="${updateAuthorFail != null }">
				<div class="alert alert-success text-center container">
					<span>${updateAuthorFail}</span>
				</div>
			</c:if>
			<div class="templatemo-content-widget no-padding">
				<div class="panel panel-default table-responsive">
					<div class="addbook">
						<button class="btn btn-primary" onClick="showModalAddNewAuthor()">
							<span><i class="fas fa-plus"></i></span>&nbsp; Add new author
						</button>

					</div>
					<div class="search-custom">
						<!-- Search box -->
						<form action="/BookShop/admin/author/search-author/">
							<div>
								<input type="text" placeholder="" name="key" value="${ key}">
								<button>
									<span>Search</span>
								</button>
							</div>

						</form>
					</div>
					<div class="export-file">
						<a class="btn btn-warning" href="<c:url value="/admin/author/report-author" />"><i class="fas fa-file-export"></i>&nbsp; Export file</a>
					</div>
					<table
						class="table table-bordered templatemo-user-table table-striped text-center">
						<thead>
							<tr>
								<td><a href="" class="white-text templatemo-sort-by">No</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Id</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Image</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Author</a></td>
								<td>Edit</td>
								<td>Delete</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listAuthors }" var="author" varStatus="stt">
								<tr>
									<td class="small-text width-10"><i>${stt.index+1 }</i></td>
									<th class="text-center">${author.id }</th>
									<td><img
										class="media-object img-circle templatemo-img-bordered img-table"
										src="<c:url value="/resource/images/author/${author.authorImage }" />">
									</td>
									<td>${author.authorName }</td>
									<td><button type="submit" data-id="${author.id}"
											data-name="${author.authorName}"
											data-image="${author.authorImage }"
											onclick="showModalEditAuthor(this)" class="btn btn-warning">
											<i class="fas fa-edit"></i>
										</button></td>
									<td><a data-id="${author.id}"
										onclick="showConfirmModalDeleteAuthor(this)" type="button"
										class="btn btn-danger"><i class="fas fa-trash-alt"></i></a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal Add Author -->
<div class="modal fade" id="modal-add-new-author" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">ADD NEW AUTHOR</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<form action="/BookShop/admin/author/add-author" method="post"
				enctype="multipart/form-data"
				onsubmit="return formAddAuthorValidate()">
				<div class="modal-body">
					<div class="col-lg-6 col-md-6 form-group">
						<label>Author Name &nbsp;</label> <span id="errAuthorName"
							class="err"></span>
						<input type="text" class="form-control" name="authorName"
							id="authorName" />
					</div>

					<div class="col-lg-6 col-md-6 form-group">
						<label>Image</label> <input type="file" name="imageSource"
							id="photo" required="true" accept="image/png, image/jpeg">
						<p class="text-warning">Maximum upload size is 5 MB.</p>
						<span id="errSize" class="err"></span>
						<div class="holder" id="holder"></div>
					</div>

				</div>
				<div class="modal-footer-custom">
					<button id="updateProduct" type="submit" class="btn btn-success">
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




<!-- Modal Edit Author -->
<div class="modal fade" id="modal-edit-author" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">EDIT AUTHOR</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<form action="/BookShop/admin/author/edit-author" method="post"
				enctype="multipart/form-data"
				onsubmit="return formEditAuthorValidate()">
				<div class="modal-body">
					<div class="col-lg-6 col-md-6 form-group">
						<input type="hidden" class="form-control" name="authorId" value=""
							id="editAuthorId" /> <label>Author Name &nbsp;</label> <span
							id="errEditAuthorName" class="err"></span> <input type="text"
							class="form-control" name="authorName" value=""
							id="editAuthorName" />
					</div>

					<div class="col-lg-6 col-md-6 form-group">
						<label>Image</label> <input type="file" name="imageSource"
							id="photoEditAuthor" accept="image/png, image/jpeg">
						<p class="text-warning">Maximum upload size is 5 MB.</p>
						<span id="errSizeAuthor" class="err"></span>
						<div class="holderEditAuthor" id="holderEditAuthor">
							<img class="img-table" id="editAuthorImage" src="">
						</div>
						<input type="hidden" value="" name="authorImage" id="authorImage">
					</div>
				</div>
				<div class="modal-footer-custom">
					<button id="updateProduct" type="submit" class="btn btn-success">
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
	function showModalAddNewAuthor() {
		$("#modal-add-new-author").modal("show");
	}

	function showModalEditAuthor(author) {
		document.getElementById('editAuthorId').value = author
				.getAttribute("data-id");
		document.getElementById('editAuthorName').value = author
				.getAttribute("data-name");

		var authorImage = author.getAttribute("data-image");
		document.getElementById('authorImage').value = authorImage;
		document.images['editAuthorImage'].src = "/BookShop/resource/images/author/"
				+ authorImage;

		$("#modal-edit-author").modal("show");
	}
</script>

<c:if test="${updateAuthorSuccess != null }">
	<script>
		window.onload = function() {
			swal('Success', 'Update author success', 'success')
		}
	</script>
</c:if>

<c:if test="${addAuthorSuccess != null }">
	<script>
		window.onload = function() {
			swal('Success', 'Add new author success', 'success')
		}
	</script>
</c:if>

<c:if test="${deleteSucess != null }">
	<script>
		window.onload = function() {
			swal('Success', 'Delete author success', 'success')
		}
	</script>
</c:if>







<!-- Modal Confirm Delete Author -->
<div class="modal fade" id="modalConfirmDeleteAuthor" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<div class="modal-body text-center"><strong>Do you want to delete?</strong> All
				books by the author will also be deleted !</div>

			<div class="modal-footer">
				<a id="deleteAuthor" class="btn btn-danger">Yes</a>
				<button type="button" class="btn btn-primary" data-dismiss="modal">No</button>

			</div>
		</div>
	</div>
</div>

<script>
	//Show modal confirm delete Author
	function showConfirmModalDeleteAuthor(author) {
		var id = author.getAttribute("data-id");
		document.getElementById("deleteAuthor").href = "/BookShop/admin/author/delete-author/"
				+ id;
		$("#modalConfirmDeleteAuthor").modal("show");
	}
</script>

