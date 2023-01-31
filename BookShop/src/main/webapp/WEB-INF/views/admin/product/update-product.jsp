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
	<!-- Main content -->

	<div class="templatemo-content col-1 light-gray-bg">
		<div class="text-center">
			<h2 class="product-titte">Edit product</h2>
		</div>
		<div class="templatemo-content-container">
			<div class="templatemo-content-widget white-bg">
				<span class="mtext-105 cl2 txt-center p-b-30" style="color: red">${error}</span>
				<form:form action="/BookShop/admin/product/update-product"
					class="templatemo-login-form" method="post"
					modelAttribute="product" enctype="multipart/form-data"
					onsubmit="return formAddProductValidate()">
					<form:input type="hidden" path="id" value="${product.id }" id="id" />
					<div class="row form-group">
						<div class="col-lg-6 col-md-6 form-group">
							<label>Book Name &nbsp; </label><span id="errBookName"
								class="err"></span>
							<form:input type="text" class="form-control" path="bookName"
								value="${product.bookName }" id="bookName" />
						</div>
						<div class="col-lg-6 col-md-6 form-group">
							<label>Publisher &nbsp; </label><span id="errPublisher"
								class="err"></span>
							<form:input type="text" class="form-control" path="publisher"
								value="${product.publisher }" id="publisher" />
						</div>
						<div class="col-lg-6 col-md-6 form-group">
							<label>Price &nbsp; </label><span id="errPrice" class="err"></span>
							<fmt:formatNumber type="number" pattern="0"
								value="${product.price}" var="price" />
							<form:input type="number" class="form-control" path="price"
								value="${price }" id="price" />
						</div>
						<div class="col-lg-6 col-md-6 form-group">
							<label>Quantity &nbsp; </label><span id="errQuantity" class="err"></span>
							<form:input type="number" class="form-control" path="quantity"
								value="${product.quantity }" id="quantity" />
						</div>

						<div class="col-lg-6 col-md-6 form-group">
							<label>Pages &nbsp; </label><span id="errPages" class="err"></span>
							<form:input type="number" class="form-control" path="pages"
								value="${product.pages }" id="pages" />
						</div>
						<div class="col-lg-6 col-md-6 form-group">
							<label>Publication Date &nbsp; </label><span
								id="errPublicationDate" class="err"></span>
							<fmt:formatDate value="${product.publicationDate }"
								pattern="yyyy-MM-dd" var="publicationDate" />
							<form:input type="date" class="form-control"
								path="publicationDate" id="publicationDate"
								value="${publicationDate }" />
						</div>
						<div class="col-lg-6 col-md-6 form-group">
							<label>Language &nbsp; </label><span id="errLanguage" class="err"></span>
							<form:input type="text" class="form-control" path="language"
								value="${product.language }" id="language" />
						</div>


						<div class="col-lg-6 col-md-6 form-group">
							<label class="control-label templatemo-block">Author</label>
							<form:select class="form-control" path="author">
								<c:forEach items="${authors }" var="authors">
									<c:choose>
										<c:when test="${product.author.id == authors.id}">
											<form:option value="${authors.id}" selected="true">${authors.authorName }</form:option>
										</c:when>
										<c:otherwise>
											<form:option value="${authors.id}">${authors.authorName }</form:option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</form:select>
						</div>
						<c:if test="${not empty product.bookImage !=null }">
							<div class="col-lg-6 col-md-6 form-group">
								<label>Image</label> <input type="file" name="imageSource"
									id="photo" accept="image/png, image/jpeg"> <span id="errSize" class="err"></span>
								<div class="holder" id="holder">
									<img
										src="<c:url value="/resource/images/books/${ product.bookImage}" />">
								</div>
							</div>
						</c:if>

						<div class="col-lg-6 col-md-6 form-group">
							<label class="control-label templatemo-block">Category</label>
							<form:select class="form-control" path="category">
								<c:forEach items="${categories }" var="categories">
									<c:choose>
										<c:when
											test="${product.category.categoryName == categories.categoryName }">
											<form:option value="${categories.id }" selected="true">${categories.categoryName }</form:option>
										</c:when>
										<c:otherwise>
											<form:option value="${categories.id }">${categories.categoryName }</form:option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</form:select>
						</div>
					</div>

					<div class="form-group text-right">
						<button type="submit" class="templatemo-blue-button"
							onclick="Update()">Update</button>
						<button type="reset" class="templatemo-white-button">Reset</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>