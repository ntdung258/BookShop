<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Product-by-author</title>
<!--************************************
				Main Start
		*************************************-->
<main id="tg-main" class="tg-main tg-haslayout">
	<!--************************************
					News Grid Start
			*************************************-->
	<div class="tg-sectionspace tg-haslayout">
		<div class="container">
			<div class="row">
				<div id="tg-twocolumns" class="tg-twocolumns">
					<div class="col-xs-12 col-sm-8 col-md-8 col-lg-9 pull-right">
						<div id="tg-content" class="tg-content">
							<div class="tg-products">
								<div class="tg-sectionhead">
									<div class="tg-aboutauthor">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<div class="tg-authorbox">
												<figure class="tg-authorimg">
													<img
														src="<c:url value="/resource/images/author/${author.authorImage }" />"
														alt="image description">
												</figure>

												<div class="tg-authorinfo">
													<div class="tg-authorhead">
														<div class="tg-leftarea">
															<div class="tg-authorname">
																<h2>${author.authorName }</h2>
															</div>
														</div>
														<div class="tg-rightarea">
															<ul class="tg-socialicons">
																<li class="tg-facebook"><a
																	href="javascript:void(0);"><i
																		class="fa fa-facebook"></i></a></li>
																<li class="tg-twitter"><a
																	href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
																<li class="tg-linkedin"><a
																	href="javascript:void(0);"><i
																		class="fa fa-linkedin"></i></a></li>
																<li class="tg-googleplus"><a
																	href="javascript:void(0);"><i
																		class="fa fa-google-plus"></i></a></li>
																<li class="tg-rss"><a href="javascript:void(0);"><i
																		class="fa fa-rss"></i></a></li>
															</ul>
														</div>
													</div>
													<div class="tg-description">
														<p>Laborum sed ut perspiciatis unde omnis iste natus
															sit voluptatem accusantium doloremque laudantium totam
															rem aperiam eaque ipsa quae ab illo inventore veritatis
															etation.</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tg-productgrid">

									<c:forEach items="${productsByAuthor }" var="products">
										<div class="col-xs-6 col-sm-6 col-md-4 col-lg-3">
											<div class="tg-postbook">
												<a
													href="<c:url value="/product/view-productdetail/${products.id }" />">
													<figure class="tg-featureimg">
														<div class="tg-bookimg">
															<div class="tg-frontcover">
																<img
																	src="<c:url value="/resource/images/books/${products.bookImage }" />"
																	alt="image description">
															</div>
															<div class="tg-backcover">
																<img
																	src="<c:url value="/resource/images/books/${products.bookImage }" />"
																	alt="image description">
															</div>
														</div>
													</figure>
												</a>
												<div class="tg-postbookcontent">
													<ul class="tg-bookscategories">
														<li><a href="javascript:void(0);">${products.category.categoryName }</a></li>
													</ul>
													<div class="tg-booktitle">
														<h3>
															<a href="javascript:void(0);">${products.bookName }</a>
														</h3>
													</div>
													<span class="tg-bookwriter">By: <a
														href="javascript:void(0);">${products.author.authorName }</a></span>
													<span class="tg-bookprice"> <ins>
															<fmt:formatNumber currencySymbol=""
																value="${products.price }"></fmt:formatNumber>
															(VND)
														</ins>

													</span>
													<c:if test="${products.quantity!=0}">
														<!-- Chưa đăng nhập thì  sẽ gọi tới controller login -->
														<c:if test="${empty userLogin }">
															<a class="tg-btn tg-btnstyletwo"
																href="<c:url value="/account/view-login" />"> <i
																class="fa fa-shopping-basket"></i> <em>Add To Cart</em>
															</a>
														</c:if>

														<!-- Đăng nhập rồi thì sẽ dùng ajax để thêm sản phẩm -->
														<c:if test="${not empty userLogin }">
															<button
																class="tg-btn tg-btnstyletwo AddToCart js-addcart"
																data-id="${products.id}"
																data-name="${products.bookName}">
																<i class="fa fa-shopping-basket"></i> <em>Add To
																	Cart</em>
															</button>
														</c:if>
													</c:if>
													<c:if test="${products.quantity==0}">
														<div class="tg-themetagbox out-of-stock">
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
					</div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 pull-left">
						<aside id="tg-sidebar" class="tg-sidebar">
							<div class="tg-widget tg-catagories">
								<div class="tg-widgettitle">
									<h3>Categories</h3>
								</div>
								<div class="tg-widgetcontent">
									<ul>
										<c:forEach items="${listCategory }" var="categorys">
											<li class="current-menu-item"><a
												href="<c:url value="/category/view-category/${categorys.id }" />">${categorys.categoryName }</a></li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="tg-widget tg-widgettrending">
								<div class="tg-widgettitle">
									<h3>Trending Products</h3>
								</div>
								<div class="tg-widgetcontent">
									<ul>
										<c:forEach items="${top3ProductSell }" var="top3ProductSell">
											<li>
												<article class="tg-post">
													<figure>
														<a href="<c:url value="/product/view-productdetail/${top3ProductSell.id }" />"><img
															src="<c:url value="/resource/images/books/${top3ProductSell.bookImage }" />"
															alt="image description"></a>
													</figure>
													<div class="tg-postcontent">
														<div class="tg-posttitle">
															<h3>
																<a href="<c:url value="/product/view-productdetail/${top3ProductSell.id }" />">${top3ProductSell.bookName }</a>
															</h3>
														</div>
														<span class="tg-bookwriter">Author: <a
															href="<c:url value="/product/view-productdetail/${top3ProductSell.id }" />">${top3ProductSell.author.authorName }</a></span>
													</div>
												</article>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="tg-widget tg-widgetinstagram">
								<div class="tg-widgettitle">
									<h3>Instagram</h3>
								</div>
								<div class="tg-widgetcontent">
									<ul>
										<li>
											<figure>
												<img
													src="<c:url value="/resource/images/instagram/img-01.jpg" />"
													alt="image description">
												<figcaption>
													<a href="javascript:void(0);"><i class="icon-heart"></i><em>50,134</em></a>
												</figcaption>
											</figure>
										</li>
										<li>
											<figure>
												<img
													src="<c:url value="/resource/images/instagram/img-02.jpg" />"
													alt="image description">
												<figcaption>
													<a href="javascript:void(0);"><i class="icon-heart"></i><em>50,134</em></a>
												</figcaption>
											</figure>
										</li>
										<li>
											<figure>
												<img
													src="<c:url value="/resource/images/instagram/img-03.jpg" />"
													alt="image description">
												<figcaption>
													<a href="javascript:void(0);"><i class="icon-heart"></i><em>50,134</em></a>
												</figcaption>
											</figure>
										</li>
										<li>
											<figure>
												<img
													src="<c:url value="/resource/images/instagram/img-04.jpg" />"
													alt="image description">
												<figcaption>
													<a href="javascript:void(0);"><i class="icon-heart"></i><em>50,134</em></a>
												</figcaption>
											</figure>
										</li>
										<li>
											<figure>
												<img
													src="<c:url value="/resource/images/instagram/img-05.jpg" />"
													alt="image description">
												<figcaption>
													<a href="javascript:void(0);"><i class="icon-heart"></i><em>50,134</em></a>
												</figcaption>
											</figure>
										</li>
										<li>
											<figure>
												<img
													src="<c:url value="/resource/images/instagram/img-06.jpg" />"
													alt="image description">
												<figcaption>
													<a href="javascript:void(0);"><i class="icon-heart"></i><em>50,134</em></a>
												</figcaption>
											</figure>
										</li>
										<li>
											<figure>
												<img
													src="<c:url value="/resource/images/instagram/img-07.jpg" />"
													alt="image description">
												<figcaption>
													<a href="javascript:void(0);"><i class="icon-heart"></i><em>50,134</em></a>
												</figcaption>
											</figure>
										</li>
										<li>
											<figure>
												<img
													src="<c:url value="/resource/images/instagram/img-08.jpg" />"
													alt="image description">
												<figcaption>
													<a href="javascript:void(0);"><i class="icon-heart"></i><em>50,134</em></a>
												</figcaption>
											</figure>
										</li>
										<li>
											<figure>
												<img
													src="<c:url value="/resource/images/instagram/img-09.jpg" />"
													alt="image description">
												<figcaption>
													<a href="javascript:void(0);"><i class="icon-heart"></i><em>50,134</em></a>
												</figcaption>
											</figure>
										</li>
									</ul>
								</div>
							</div>

						</aside>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--************************************
					News Grid End
			*************************************-->
</main>
<!--************************************
				Main End
		*************************************-->