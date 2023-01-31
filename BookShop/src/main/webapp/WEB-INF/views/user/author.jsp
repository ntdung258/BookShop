<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Author</title>

<!--************************************
				Main Start
		*************************************-->
<main id="tg-main" class="tg-main tg-haslayout">
	<!--************************************
					Authors Start
			*************************************-->
	<div class="tg-authorsgrid">
		<div class="container">
			<div class="row">
				<div class="tg-authors">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="tg-sectionhead">
							<h2>Author</h2>
						</div>
					</div>
					<c:forEach items="${listAuthors }" var="listAuthors">
						<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
							<div class="tg-author">
								<figure>
									<a
										href="<c:url value="/product/view-product-by-author/${listAuthors.id}" />"><img
										src="<c:url value="/resource/images/author/${listAuthors.authorImage }" />"
										alt="image description"></a>
								</figure>
								<div class="tg-authorcontent">
									<h2>
										<a href="javascript:void(0);">${listAuthors.authorName}</a>
									</h2>
									<ul class="tg-socialicons">
										<li class="tg-facebook"><a href="javascript:void(0);"><i
												class="fa fa-facebook"></i></a></li>
										<li class="tg-twitter"><a href="javascript:void(0);"><i
												class="fa fa-twitter"></i></a></li>
										<li class="tg-linkedin"><a href="javascript:void(0);"><i
												class="fa fa-linkedin"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!--************************************
					Authors End
			*************************************-->

	<section class="tg-sectionspace tg-haslayout">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="tg-sectionhead">
					<h2>Top Book</h2>
					<a class="tg-btn" href="<c:url value="/product/view-product" />">View All</a>
				</div>
			</div>

			<div id="tg-pickedbyauthorslider"
				class="tg-pickedbyauthor tg-pickedbyauthorslider owl-carousel">
				<c:forEach items="${top3ProductSell }" var="top3ProductSell">
					<div class="item">
						<div class="tg-postbook">
							<a href="<c:url value="/product/view-productdetail/${top3ProductSell.id }" />">
								<figure class="tg-featureimg">
									<div class="tg-bookimg">
										<div class="tg-frontcover">
											<img
												src="<c:url value="/resource/images/books/${top3ProductSell.bookImage }" />"
												alt="image description">
										</div>
									</div>
									<div class="tg-hovercontent">
										<strong class="tg-bookpage">Book Pages:
											${top3ProductSell.pages }</strong> <strong class="tg-bookcategory">Category:
											${top3ProductSell.category.categoryName }</strong> <strong
											class="tg-bookprice">Price: <fmt:formatNumber
												currencySymbol="" value="${top3ProductSell.price }"></fmt:formatNumber>
											(VND)
										</strong>
									</div>
								</figure>
							</a>
							<div class="tg-postbookcontent">
								<div class="tg-booktitle">
									<h3>
										<a href="">${top3ProductSell.bookName }</a>
									</h3>
								</div>
								<span class="tg-bookwriter">Author:
									${top3ProductSell.author.authorName }</span>
								<c:if test="${top3ProductSell.quantity!=0}">
									<!-- Chưa đăng nhập thì  sẽ gọi tới controller login -->
									<c:if test="${empty userLogin }">
										<a class="tg-btn tg-btnstyletwo"
											href="<c:url value="/account/view-login" />"> <i
											class="fa fa-shopping-basket"></i> <em>Add To Cart</em>
										</a>
									</c:if>

									<!-- Đăng nhập rồi thì sẽ dùng ajax để thêm sản phẩm -->
									<c:if test="${not empty userLogin }">
										<button class="tg-btn tg-btnstyletwo AddToCart js-addcart"
											data-id="${top3ProductSell.id}"
											data-name="${top3ProductSell.bookName}">
											<i class="fa fa-shopping-basket"></i> <em>Add To Cart</em>
										</button>
									</c:if>
								</c:if>
								<c:if test="${top3ProductSell.quantity==0}">
									<div class="tg-themetagbox out-of-stock"
										style="padding-left: 90px;">
										<span class="tg-themetag">Out of stock</span>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>
</main>
<!--************************************
				Main End
		*************************************-->