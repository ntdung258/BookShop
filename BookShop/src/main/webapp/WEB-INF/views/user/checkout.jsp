<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<title>Checkout</title>
<!--************************************
				Inner Banner Start
		*************************************-->
<div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner"
	data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll"
	data-image-src="<c:url value="/resource/images/parallax/bgparallax-07.jpg" />">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="tg-innerbannercontent">
					<h1>Checkout</h1>
					<ol class="tg-breadcrumb">
						<li><a href="<c:url value="/home" />">home</a></li>
						<li class="tg-active">Checkout</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>
<!--************************************
				Inner Banner End
		*************************************-->






<form:form action="/BookShop/checkout/create-bill" method="post"
	modelAttribute="bill" onsubmit="return formCheckoutValidate()">
	<main class="page">
		<section class="shopping-cart dark" id="shopping-cart">
			<div class="container">
				<div class="content">
					<div class="row">
						<div class="col-md-12 col-lg-6">
							<div class="items">
								<c:forEach items="${cartItem }" var="items">
									<div class="product">
										<div class="row">
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
														<div class="col-md-12 product-name">
															<div class="product-name" id="refresh${items.bookId }">
																<a href="#">${items.bookName }</a>
																<div class="product-info">
																	<div>
																		Price: <span class="value"><fmt:formatNumber
																				currencySymbol="" value="${items.price }" /> </span>
																	</div>
																	<div>
																		Quantity: <span class="value">${items.quantity }</span>
																		<input type="hidden" value="${items.quantity }"
																			name="quantity"> <input type="hidden"
																			value="${items.bookId }" name="bookId">
																	</div>
																	<div>
																		Total: <span class="value"><fmt:formatNumber
																				currencySymbol=""
																				value="${items.quantity * items.price }" /> </span>
																	</div>
																	<div>
																		<a onclick="setQuantity(this)"
																			data-id="${items.bookId}"><span class="err"
																			id="errInventory${items.bookId}"></span></a>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>


						<div class="col-md-12 col-lg-6 summary mgtop">
							<h4 class="mb-5 text-center">
								<strong>Bill Information</strong>
							</h4>
							<div class="row">
								<div class="col-md-12 checkout-mb">
									<div class="row">
										<div class="col-md-3">
											<label for="kh_ten">Name</label>
										</div>

										<div class="col-md-9">
											<form:input path="recipientName" type="text"
												class="form-control" id="fullname"
												value="${userLogin.fullname }" />
											<span id="errFullName" class="err"></span>
										</div>
									</div>
								</div>
								<div class="col-md-12 checkout-mb">
									<div class="row">
										<div class="col-md-3">
											<label for="kh_ten">Phone</label>
										</div>

										<div class="col-md-9">
											<form:input path="phone" type="text" class="form-control"
												name="" id="phone" value="${userLogin.phone}" />
											<span id="errPhone" class="err"></span>
										</div>
									</div>
								</div>
								<div class="col-md-12 checkout-mb">
									<div class="row">
										<div class="col-md-3">
											<label for="kh_ten">Address</label>
										</div>

										<div class="col-md-9">
											<%-- <form:input path="deliveryAddress"
												value="${userLogin.address }" class="form-control" rows="4"
												id="address" /> --%>
											<textarea name="deliveryAddress" id="address" class="form-control form-control-lg">${userLogin.address }</textarea>
											<span id="errAddress" class="err"></span>
										</div>
									</div>
								</div>
								<div class="col-md-12 checkout-mb">
									<div class="row">
										<div class="col-md-3">
											<label for="kh_ten">Note</label> <span id="errNote"
												class="err"></span>
										</div>

										<div class="col-md-9">
											<form:input path="note" type="text" class="form-control"
												name="" id="" value="" />
										</div>
									</div>
								</div>
								<div class="col-md-12 checkout-mb">
									<div class="row">
										<div class="col-md-3">
											<label for="kh_ten">Payment Method</label>
										</div>

										<div class="col-md-9">
											<div class="d-block my-3">
												<label for="kh_ten">&nbsp; Payment on delivery</label>
											</div>
										</div>

									</div>
								</div>

								<div class="col-md-2 col-lg-2"></div>
								<div class="col-md-9 col-lg-9">
									<div class="summary">
										<div class="summary-item">
											<span class="text">Subtotal</span><span class="price"
												id="total"> <fmt:formatNumber currencySymbol=""
													value="${total }" /> &nbsp;(VND)
											</span>
										</div>
										<div class="summary-item">
											<span class="text">Discount</span><span class="price">0</span>
										</div>
										<div class="summary-item">
											<span class="text">Shipping</span><span class="price">30.000
												&nbsp; (VND)</span>
										</div>
										<div class="summary-item">
											<span class="text">Total</span><span class="price"
												id="totalPrice"><fmt:formatNumber currencySymbol=""
													value="${total + 30000}" /> &nbsp; (VND) </span> <input
												name="totalPrice" id="totalPrice" type="hidden"
												class="form-control" value="${total+30000 }" />
										</div>
									</div>

									<div id="btn-order">
										<!-- hiện nút quay lại home -->
										<c:if test="${totalQuantity ==null || totalQuantity ==0}">
											<a href="<c:url value="/home" />"
												class="btn btn-primary btn-lg btn-block">Continue
												Shopping</a>
										</c:if>

										<!--  hiện nút Order-->
										<c:if test="${!(totalQuantity ==null || totalQuantity ==0)}">
											<button type="submit"
												class="btn btn-primary btn-lg btn-block">Order</button>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
</form:form>

<c:forEach items="${list }" var="list">
	<input type="hidden" value="${list.quantity }"
		id="inventory-number${list.id }" name="inventory">
</c:forEach>
<script>
	window.onload = function() {
		formCheckoutValidate();
	}
</script>