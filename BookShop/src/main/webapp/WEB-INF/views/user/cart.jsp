<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Shopping-cart</title>
<div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner"
	data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll"
	data-image-src="<c:url value="/resource/images/parallax/bgparallax-07.jpg" />">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="tg-innerbannercontent">
					<h1>Shopping-Cart</h1>
					<ol class="tg-breadcrumb">
						<li><a href="<c:url value="/home" />">home</a></li>
						<li class="tg-active">Shopping-Cart</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>



<main class="page">
	<section class="shopping-cart dark" id="shopping-cart">
		<div class="container">
			<div class="content">
				<div class="row" id="cart">
					<div class="col-md-12 col-lg-8">
						<div class="items">
							<c:forEach items="${cartItem }" var="items">
								<input value="${items.bookId }" id="bookId${list }"
									name="bookId" type="hidden">
								<div class="product">
									<div class="row" id="refresh${items.bookId }">
										<div class="col-md-3">
											<div class="tg-postbook">
												<figure class="tg-featureimg">
													<div class="tg-bookimg">
														<div class="tg-frontcover">
															<img
																src="<c:url value="/resource/images/books/${items.bookImage }" />"
																alt="image description">
														</div>
														<div class="tg-backcover">
															<img
																src="<c:url value="/resource/images/books/${items.bookImage }" />"
																alt="image description">
														</div>
													</div>
												</figure>
											</div>
										</div>
										<div class="col-md-8">
											<div class="info">
												<div class="row">
													<div class="col-md-3 product-name">
														<div class="product-name">
															<a href="#">${items.bookName }</a>
															<div class="product-info">
																<div>
																	Price: <span class="value" data-id="${items.price }"
																		id="price${items.bookId }"><fmt:formatNumber
																			currencySymbol="" value="${items.price }" /></span>
																</div>
															</div>
														</div>
													</div>
													<div class="col-md-4 quantity">
														<label for="quantity">Quantity:</label>
														<button style="padding: 5px;"
															class="btn-num-product-down quantity-change"
															data-id="${items.bookId }" data-name="${items.bookName }">-</button>
														<input id="quantity-${items.bookId }" type="number"
															onclick="findTotal()" value="${items.quantity }"
															class="form-control quantity-input" name="qty"
															data-id="${items.bookId }" data-name="${items.bookName }">
														<button style="padding: 5px;"
															class="btn-num-product-up quantity-change"
															data-id="${items.bookId }" data-name="${items.bookName }">+</button>
													</div>
													<div class="col-md-5 price">
														<input type="hidden" name="totalPrice"
															id="totalPrice${items.bookId }"
															value="${items.price * items.quantity }" /> <span
															class="totalPrice${items.bookId }"> <fmt:formatNumber
																currencySymbol=""
																value="${items.price * items.quantity }" />
														</span>
													</div>
												</div>
												<div>
													<a
														href="<c:url value="/cart/delete-product/${items.bookId }" />"
														onclick="deleteProduct(this)"><span class="err"
														id="deleteProduct${items.bookId }"
														data-id="${items.bookId }"></span></a>
												</div>
											</div>
										</div>
									</div>
								</div>

							</c:forEach>
						</div>
					</div>
					<div class="col-md-12 col-lg-4">
						<c:if test="${totalQuantity > 0 }">
							<div class="summary mgtop">
								<h3>Summary</h3>
								<div class="summary-item">
									<span class="text">Subtotal :</span><span class="price"
										id="total"><fmt:formatNumber currencySymbol=""
											value="${total }" />&nbsp; (VND)</span>

								</div>
								<div class="mgtop">
									<!-- Giỏ hàng đã có sản phẩm thì hiện nút checout -->
									<c:if test="${!(totalQuantity ==null || totalQuantity ==0)}">
										<a href="<c:url value="/checkout/view-checkout" />"
											type="submit" class="btn btn-primary btn-lg btn-block"
											id="btn-checkout" onclick="return checkProduct()">Checkout</a>
									</c:if>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>
<c:forEach items="${list }" var="list">
	<input value="${list }" id="productDelete${list }" name="productDelete"
		type="hidden">
</c:forEach>

<!-- Giỏ hàng không có sản phẩm thì hiện nút tiếp tục mua hàng -->
<div class="mgtop">
	<h3 class="text-center bg-warning">${noDataCart }</h3>
	<div class="text-center pb">
		<c:if test="${totalQuantity ==null || totalQuantity ==0}">
			<a href="<c:url value="/home" />" class="btn btn-success mgtop">Continue
				Shopping</a>
		</c:if>
	</div>
</div>

<!-- Modal Success + Chuyển trang -->
<div class="modal fade" id="ModalOrderSuccess" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Notification</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<div class="modal-body text-center">
				<strong>Order successfully</strong>
			</div>
			<div class="modal-footer">
				<a href="/BookShop/home" type="button" class="btn btn-success">Continue
					Shopping</a> <a href="/BookShop/account/view-order-history"
					type="button" class="btn btn-success">View Order History</a>

			</div>
		</div>
	</div>
</div>
<script>
	window.onload = function() {
		checkProduct();
	}
</script>


<c:if test="${orderSuccess != null }">
	<script>
		window.onload = function() {
			$("#ModalOrderSuccess").modal("show");
		}
	</script>
</c:if>
