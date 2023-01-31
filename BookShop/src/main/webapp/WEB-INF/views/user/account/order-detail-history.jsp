<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Order-detail</title>
<div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner"
	data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll"
	data-image-src="<c:url value="/resource/images/parallax/bgparallax-07.jpg" />">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="tg-innerbannercontent">
					<h1>Order-detail</h1>
					<ol class="tg-breadcrumb">
						<li><a href="<c:url value="/account/view-order-history" />">Order-history</a></li>
						<li class="tg-active">Detail</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>
<main id="tg-main" class="tg-main tg-haslayout">
	<div class="tg-sectionspace tg-haslayout">
		<div class="container">


			<div class="templatemo-content col-1 light-gray-bg">
				<div class="row">
					<div class="col-md-6">
						<div class="templatemo-content-container">
							<div class="templatemo-content-widget no-padding">
								<div class="panel panel-default table-responsive">
									<table
										class="table table-bordered templatemo-user-table table-striped">
										<tbody>
											<tr>
												<td class="white-text templatemo-sort-by bgtable">TOTAL
													PRICE</td>
												<td class="text-center"><fmt:formatNumber
														currencySymbol="" value="${bill.totalPrice }" /></td>
											</tr>
											<tr>
												<td class="white-text templatemo-sort-by bgtable">CREATE
													DATE</td>
												<td class="text-center"><fmt:formatDate
														pattern="dd-MM-yyyy-HH:mm:ss" value="${bill.createDate }" /></td>
											</tr>
											<tr>
												<td class="white-text templatemo-sort-by bgtable">RECIPIENT
													NAME</td>
												<td class="text-center">${bill.recipientName }</td>
											</tr>
											<tr>
												<td class="white-text templatemo-sort-by bgtable">DELIVERY
													ADDRESS</td>
												<td class="text-center">${bill.deliveryAddress }</td>
											</tr>
											<tr>
												<td class="white-text templatemo-sort-by bgtable">PHONE</td>
												<td class="text-center">${bill.phone }</td>
											</tr>
											<tr>
												<td class="white-text templatemo-sort-by bgtable">NOTE</td>
												<td class="text-center">${bill.note }</td>
											</tr>
											<tr>
												<td class="white-text templatemo-sort-by bgtable">PAYMENT
													METHOD</td>
												<td class="text-center">${bill.paymentMethod }</td>
											</tr>
											<tr>
												<td class="white-text templatemo-sort-by bgtable">STATUS</td>
												<c:if test="${bill.status=='Wait confirmation'}">
													<td class="text-center"><i class="fa fa-spinner"
														aria-hidden="true"></i>&nbsp; ${bill.status}</td>
												</c:if>
												<c:if test="${bill.status=='Delivering'}">
													<td class="text-center"><i class="fa fa-truck"
														aria-hidden="true"></i>&nbsp; ${bill.status}</td>
												</c:if>
												<c:if test="${bill.status=='Order completed'}">
													<td class="text-center"><i class="fa fa-check"
														aria-hidden="true"></i>&nbsp; ${bill.status}</td>
												</c:if>
												<c:if test="${bill.status=='Order canceled'}">
													<td class="text-center"><i class="fa fa-times"></i>&nbsp;
														${bill.status}</td>
												</c:if>
											</tr>
											<c:if test="${bill.status=='Order canceled'}">
												<tr>
													<td class="white-text templatemo-sort-by bgtable">REASON
														CANCEL</td>
													<td class="text-center">${bill.reasonCancel }</td>
												</tr>
												<tr>
													<td class="white-text templatemo-sort-by bgtable">CANCEL DATE</td>
													<td class="text-center"><fmt:formatDate
														pattern="dd-MM-yyyy-HH:mm:ss" value="${bill.cancelDate }" /></td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
							<c:if test="${bill.status=='Wait confirmation'}">
								<div class="float-right">
									<button data-href="/BookShop/account/cancel-bill/${bill.id}"
										type="button" class="btn btn-danger btn-change-status">CANCEL
										ORDER</button>
								</div>
							</c:if>
						</div>
					</div>
					<div class="col-md-6">
						<div class="templatemo-content-container">
							<div class="templatemo-content-widget no-padding">
								<div class="panel panel-default table-responsive">
									<table
										class="table table-bordered templatemo-user-table table-striped">
										<thead class="bgtable">
											<tr>
												<td class="white-text templatemo-sort-by"></td>
												<td class="white-text templatemo-sort-by">BOOK NAME</td>
												<td class="white-text templatemo-sort-by">PRICE</td>
												<td class="white-text templatemo-sort-by">QUANTITY</td>
												<td class="white-text templatemo-sort-by">TOTAL PRICE</td>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${billDetail }" var="billDetail">
												<tr>
													<td>
														<div>
															<img class="img-table"
																src="<c:url value="/resource/images/books/${billDetail.bookImage }" />">
														</div>
													</td>
													<td>${billDetail.bookName }</td>
													<td><fmt:formatNumber currencySymbol=""
															value="${billDetail.price }"></fmt:formatNumber> (VND)</td>
													<td>${billDetail.quantity }</td>
													<td><fmt:formatNumber currencySymbol=""
															value="${billDetail.price *billDetail.quantity}"></fmt:formatNumber>
														(VND)</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>


<!-- Modal confirm cancel order -->
<div class="modal fade" id="modal-notification-change-status"
	tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Cancel order</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<form action="/BookShop/account/cancel-bill" method="post">
				<div class="modal-body text-center">
					<strong>Want to cancel your order?</strong>
					<h6>
						<i>Let us know why you want to cancel your order</i>
					</h6>
					<input type="hidden" name="id" value="${bill.id }">
					<div class="cancel-order">
						<textarea name="reasonCancel" class="form-control form-control-lg"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button id="href-change-status" class="btn btn-success"> OK
					</button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">
						CANCEL</button>
				</div>
			</form>
		</div>
	</div>
</div>

