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
			<h2 class="product-titte">Bill detail</h2>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="templatemo-content-container">
					<div class="templatemo-content-widget no-padding">
						<div class="panel panel-default table-responsive">
							<table
								class="table table-bordered templatemo-user-table table-striped">
								<thead>
									<tr>
										<td><a href="" class="white-text templatemo-sort-by">ID</a></td>
										<td class="text-center">${bill.id }</td>
									</tr>
									<tr>
										<td><a href="" class="white-text templatemo-sort-by">TOTAL
												PRICE</a></td>
										<td class="text-center"><fmt:formatNumber
												currencySymbol="" value="${bill.totalPrice }" /></td>
									</tr>
									<tr>
										<td><a href="" class="white-text templatemo-sort-by">CREATE_DATE</a></td>
										<td class="text-center"><fmt:formatDate
												pattern="dd-MM-yyyy-HH:mm:ss" value="${bill.createDate }" /></td>
									</tr>
									<tr>
										<td><a href="" class="white-text templatemo-sort-by">RECIPIENT_NAME</a></td>
										<td class="text-center">${bill.recipientName }</td>
									</tr>
									<tr>
										<td><a href="" class="white-text templatemo-sort-by">DELIVERY_ADDRESS</a></td>
										<td class="text-center">${bill.deliveryAddress }</td>
									</tr>
									<tr>
										<td><a href="" class="white-text templatemo-sort-by">PHONE</a></td>
										<td class="text-center">${bill.phone }</td>
									</tr>
									<tr>
										<td><a href="" class="white-text templatemo-sort-by">NOTE</a></td>
										<td class="text-center">${bill.note }</td>
									</tr>
									<tr>
										<td><a href="" class="white-text templatemo-sort-by">PAYMENT_METHOD</a></td>
										<td class="text-center">${bill.paymentMethod }</td>
									</tr>
									<tr>
										<td><a href="" class="white-text templatemo-sort-by">STATUS</a></td>
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
											<td class="text-center"><i class="fas fa-times-circle"></i>&nbsp;
												${bill.status}</td>
										</c:if>
										<c:if test="${bill.status=='Order canceled'}">
											<tr>
												<td class="white-text templatemo-sort-by bgtable">REASON
													CANCEL</td>
												<td class="text-center">${bill.reasonCancel }</td>

											</tr>
											<tr>
												<td class="white-text templatemo-sort-by bgtable">CANCEL
													DATE</td>
												<td class="text-center"><fmt:formatDate
														pattern="dd-MM-yyyy-HH:mm:ss" value="${bill.cancelDate }" /></td>
											</tr>
										</c:if>
									</tr>
								</thead>
							</table>
						</div>
					</div>

					<c:if test="${bill.status == 'Wait confirmation'}">
						<div class="text-center">
							<button data-href="/BookShop/admin/bill/cancel-bill/${bill.id}"
								type="button" class="btn btn-danger btn-cancel-order">CANCEL
								ORDER</button>
							<button
								data-href="/BookShop/admin/bill/update-status-bill/${bill.id}"
								class="btn btn-info btn-change-status">GO TO DELIVERY</button>
						</div>
					</c:if>

					<c:if test="${bill.status == 'Delivering'}">
						<div class="text-center">
							<button data-href="/BookShop/admin/bill/cancel-bill/${bill.id}"
								class="btn btn-danger btn-cancel-order">RETURN
								WAREHOURSE</button>
							<button
								data-href="/BookShop/admin/bill/update-status-bill/${bill.id}"
								type="button" class="btn btn-success btn-change-status">ORDER
								COMPLETED</button>
						</div>
					</c:if>

				</div>
			</div>
			<div class="col-md-6">
				<div class="templatemo-content-container">
					<div class="export-file">
						<a class="btn btn-primary"
							href="<c:url value="/admin/bill/report-bill/${bill.id }" />"><i
							class="fas fa-file-export"></i>&nbsp; Export file</a>
					</div>
					<div class="templatemo-content-widget no-padding">
						<div class="panel panel-default table-responsive">
							<table
								class="table table-bordered templatemo-user-table table-striped">
								<thead>
									<tr>
										<td><a href="" class="white-text templatemo-sort-by"></a></td>
										<td><a href="" class="white-text templatemo-sort-by">BOOK
												NAME</a></td>
										<td><a href="" class="white-text templatemo-sort-by">PRICE</a></td>
										<td><a href="" class="white-text templatemo-sort-by">QUANTITY</a></td>
										<td><a href="" class="white-text templatemo-sort-by">TOTAL
												PRICE</a></td>
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


<!-- Modal confirm change status -->
<div class="modal fade" id="modal-notification-change-status"
	tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
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
				<h3>
					<strong>Are you sure you want to change your order status?</strong>
				</h3>
			</div>
			<div class="modal-footer">
				<a id="href-change-status" href="" class="btn btn-success"> OK </a>
				<button type="button" class="btn btn-warning" data-dismiss="modal">
					CANCEL</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal confirm cancel order -->
<div class="modal fade" id="modal-cancel-order" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Cancel order</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<form action="/BookShop/admin/bill/cancel-bill" method="post">
				<div class="modal-body text-center">
					<h3>
						<strong>Want to cancel your order?</strong>
					</h3>
					<h6>
						<i>Enter a reason for canceling the order</i>
					</h6>
					<input type="hidden" name="id" value="${bill.id }">
					<div class="cancel-order">
						<textarea rows="6" name="reasonCancel"
							class="form-control form-control-lg"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-success">OK</button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">
						CANCEL</button>
				</div>
			</form>
		</div>
	</div>
</div>




