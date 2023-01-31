`<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Product-detail</title>
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
							<div class="tg-productdetail">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
										<div class="tg-postbook">
											<figure class="tg-featureimg">
												<img
													src="<c:url value="/resource/images/books/${product.bookImage }" />"
													alt="image description">
											</figure>
											<div class="tg-postbookcontent">
												<span class="tg-bookprice"> <ins>
														<fmt:formatNumber currencySymbol=""
															value="${product.price }"></fmt:formatNumber>
														(VND)
													</ins>
												</span>
												<ul class="tg-delevrystock">
													<li><i class="icon-rocket"></i><span>Free
															delivery worldwide</span></li>
													<li><i class="icon-checkmark-circle"></i><span>Dispatch
															from the USA in 2 working days </span></li>
													<li><i class="icon-store"></i><span>Quantity: <em>${product.quantity }</em></span></li>
												</ul>
												<c:if test="${product.quantity!=0}">
													<!-- Chưa đăng nhập thì  sẽ gọi tới controller login -->
													<c:if test="${empty userLogin }">
														<a class="tg-btn tg-active tg-btn-lg"
															href="<c:url value="/account/view-login" />"> <i
															class="fa fa-shopping-basket"></i> <em>Add To Cart</em>
														</a>
													</c:if>

													<!-- Đăng nhập rồi thì sẽ dùng ajax để thêm sản phẩm -->
													<c:if test="${not empty userLogin }">
														<button class="tg-btn tg-active tg-btn-lg AddToCart js-addcart"
															data-id="${product.id}" data-name="${product.bookName}">
															<i class="fa fa-shopping-basket"></i> <em>Add To
																Cart</em>
														</button>
													</c:if>
												</c:if>
												<c:if test="${product.quantity==0}">
													<div class="tg-themetagbox out-of-stock">
														<span class="tg-themetag">Out of stock</span>
													</div>
												</c:if>
											</div>
										</div>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
										<div class="tg-productcontent">
											<ul class="tg-bookscategories">
												<li><a href="javascript:void(0);">${product.category.categoryName }</a></li>
											</ul>
											<div class="tg-booktitle">
												<h3>${product.bookName }</h3>
											</div>
											<span class="tg-bookwriter">Author: <a
												href="javascript:void(0);">${product.author.authorName }</a></span>
											<div class="tg-share">
												<span>Share:</span>
												<ul class="tg-socialicons">
													<li class="tg-facebook"><a href="javascript:void(0);"><i
															class="fa fa-facebook"></i></a></li>
													<li class="tg-twitter"><a href="javascript:void(0);"><i
															class="fa fa-twitter"></i></a></li>
													<li class="tg-linkedin"><a href="javascript:void(0);"><i
															class="fa fa-linkedin"></i></a></li>
													<li class="tg-googleplus"><a
														href="javascript:void(0);"><i
															class="fa fa-google-plus"></i></a></li>
													<li class="tg-rss"><a href="javascript:void(0);"><i
															class="fa fa-rss"></i></a></li>
												</ul>
											</div>
											<div class="tg-description">
												<p>Description</p>
											</div>
											<div class="tg-sectionhead">
												<h2>Product Details</h2>
											</div>
											<ul class="tg-productinfo">
												<li><span>Pages:</span><span><b>${product.pages }</b>
												</span></li>
												<li><span>Language:</span><span><b>${product.language }</b>
												</span></li>
												<li><span>Publication Date:</span><span><b><fmt:formatDate pattern="dd-MM-yyyy"
												value="${product.publicationDate }" /></b>
												</span></li>
												<li><span>Publisher:</span><span><b>${product.publisher }</b>
												</span></li>

											</ul>
										</div>
									</div>
									<div class="tg-productdescription">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<div class="tg-sectionhead" style="margin-top:30px;">
												<h2>Product Description</h2>
											</div>
											<ul class="tg-themetabs" role="tablist">
												<li role="presentation" class="active"><a
													href="#description" data-toggle="tab">Description</a></li>
												<li role="presentation"><a href="#review"
													data-toggle="tab">Reviews</a></li>
											</ul>
											<div class="tg-tab-content tab-content">
												<div role="tabpanel" class="tg-tab-pane tab-pane active"
													id="description">
													<div class="tg-description">
														<p>Description</p>
														<figure class="tg-alignleft">
															<img
																src="<c:url value="/resource/images/placeholdervtwo.jpg" />"
																alt="image description">
															<iframe
																src="https://www.youtube.com/embed/aLwpuDpZm1k?rel=0&amp;controls=0&amp;showinfo=0"></iframe>
														</figure>
														<ul class="tg-liststyle">
															<li><span>Sed do eiusmod tempor incididunt ut
																	labore et dolore</span></li>
															<li><span>Magna aliqua enim ad minim veniam</span></li>
															<li><span>Quis nostrud exercitation ullamco
																	laboris nisi ut</span></li>
															<li><span>Aliquip ex ea commodo consequat
																	aute dolor reprehenderit</span></li>
															<li><span>Voluptate velit esse cillum dolore
																	eu fugiat nulla pariatur</span></li>
															<li><span>Magna aliqua enim ad minim veniam</span></li>
															<li><span>Quis nostrud exercitation ullamco
																	laboris nisi ut</span></li>
														</ul>
														<p>Description</p>
													</div>
												</div>
												<div role="tabpanel" class="tg-tab-pane tab-pane"
													id="review">
													<div class="tg-description">
														<p>Description</p>
														<figure class="tg-alignleft">
															<img
																src="<c:url value="/resource/images/placeholdervtwo.jpg" />"
																alt="image description">
															<iframe
																src="https://www.youtube.com/embed/aLwpuDpZm1k?rel=0&amp;controls=0&amp;showinfo=0"></iframe>
														</figure>
														<ul class="tg-liststyle">
															<li><span>Sed do eiusmod tempor incididunt ut
																	labore et dolore</span></li>
															<li><span>Magna aliqua enim ad minim veniam</span></li>
															<li><span>Quis nostrud exercitation ullamco
																	laboris nisi ut</span></li>
															<li><span>Aliquip ex ea commodo consequat
																	aute dolor reprehenderit</span></li>
															<li><span>Voluptate velit esse cillum dolore
																	eu fugiat nulla pariatur</span></li>
															<li><span>Magna aliqua enim ad minim veniam</span></li>
															<li><span>Quis nostrud exercitation ullamco
																	laboris nisi ut</span></li>
														</ul>
														<p>Description</p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="tg-aboutauthor">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<div class="tg-sectionhead">
												<h2>About Author</h2>
											</div>
											<div class="tg-authorbox">
												<figure class="tg-authorimg">
													<img
														src="<c:url value="/resource/images/author/${product.author.authorImage }" />"
														alt="image description">
												</figure>
												<div class="tg-authorinfo">
													<div class="tg-authorhead">
														<div class="tg-leftarea">
															<div class="tg-authorname">
																<h2>${product.author.authorName }</h2>
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
													<a class="tg-btn tg-active"
														href="<c:url value="/product/view-product-by-author/${product.author.id}" />">View
														All Books</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 pull-left">
						<aside id="tg-sidebar" class="tg-sidebar">
							<div class="tg-widget tg-widgetsearch">
								<form class="tg-formtheme tg-formsearch">
									<div class="form-group">
										<button type="submit">
											<i class="icon-magnifier"></i>
										</button>
										<input type="search" name="search" class="form-group"
											placeholder="Search by title, author, key...">
									</div>
								</form>
							</div>
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
													<div class="<c:url value="/product/view-productdetail/${top3ProductSell.id }" />">
														<div class="tg-posttitle">
															<h3>
																<a href="javascript:void(0);">${top3ProductSell.bookName }</a>
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
