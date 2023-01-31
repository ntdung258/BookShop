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
			<h2 class="product-titte">List bills</h2>
		</div>
		<div class="templatemo-content-container">
			<c:if test="${updateStatusBillFail != null }">
				<div class="alert alert-success text-center container">
					<span>${updateStatusBillFail }</span>
				</div>
			</c:if>
			<div class="templatemo-content-widget no-padding">
				<div class="panel panel-default table-responsive">
					<div class="addbook">
						<a href="<c:url value="/admin/bill/view-bill-wait-confirm"/>"
							class="btn btn-warning"><i class="fa fa-spinner"></i>&ensp;
							Wait confirmation</a>
						&nbsp;	
						<a href="<c:url value="/admin/bill/view-bill-delivering"/>"
							class="btn btn-info"><i class="fa fa-truck"></i>&ensp;
							Delivering</a>
						&nbsp;	
						<a href="<c:url value="/admin/bill/view-bill-success"/>"
							class="btn btn-success"><i class="fa fa-check"></i>&ensp;
							  Order completed</a>
					</div>
					<div class="search-custom">
						<!-- Search box -->
						<form action="<c:url value="/admin/bill/search-bill" />">
							<div>
								<input type="text" placeholder="" name="key" value="${key }">
								<button>
									<span>Search</span>
								</button>
							</div>

						</form>
					</div>
					<table
						class="table table-bordered templatemo-user-table table-striped">
						<thead>
							<tr>
								<td><a href="" class="white-text templatemo-sort-by">No</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Id</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Total price</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Create
										date</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Recepient
										name</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Phone</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Status</a></td>
								<td><a href="" class="white-text templatemo-sort-by">Detail</a></td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bills }" var="bill" varStatus="stt">
								<tr>
									<td class="small-text width-10"><i>${stt.index+1 }</i></td>
									<td class="text-center">${bill.id }</td>
									<td><fmt:formatNumber currencySymbol=""
											value="${bill.totalPrice }" /></td>
									<td><fmt:formatDate pattern="dd-MM-yyyy-HH:mm:ss"
											value="${bill.createDate }" /></td>
									<td>${bill.recipientName }</td>
									<td>${bill.phone }</td>
									<c:if test="${bill.status=='Wait confirmation'}">
										<td><div class="btn-delivery btn-warning text-center">
												<i class="fa fa-spinner" aria-hidden="true"></i>&nbsp;
												${bill.status}
											</div></td>
										<td><a
											href="/BookShop/admin/bill/view-detail-bill/${bill.id }"
											class="btn btn-warning"><i class="fas fa-info-circle"></i></a></td>
									</c:if>
									<c:if test="${bill.status=='Delivering'}">
										<td><div class="btn-info btn-delivery text-center">
												<i class="fa fa-truck" aria-hidden="true"></i>&nbsp;
												${bill.status}
											</div></td>
										<td><a
											href="/BookShop/admin/bill/view-detail-bill/${bill.id }"
											type="button" class="btn btn-info"><i
												class="fa fa-info-circle"></i></a></td>
									</c:if>

									<c:if test="${bill.status=='Order completed'}">
										<td><div class="btn-success btn-delivery text-center">
												<i class="fa fa-check" aria-hidden="true"></i>&nbsp;
												${bill.status}
											</div></td>
										<td><a
											href="/BookShop/admin/bill/view-detail-bill/${bill.id }"
											type="button" class="btn btn-success"><i
												class="fa fa-info-circle"></i></a></td>
									</c:if>

									<c:if test="${bill.status=='Order canceled'}">
										<td><div class="btn-danger btn-delivery text-center">
												<i class="fas fa-times-circle"></i>&nbsp; ${bill.status}
											</div></td>
										<td><a
											href="/BookShop/admin/bill/view-detail-bill/${bill.id }"
											type="button" class="btn btn-danger"><i
												class="fa fa-info-circle"></i></a></td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="text-center">
				<c:if test="${noBillDataWait !=null }">
					<h2 class="alert alert-danger">${noBillDataWait }</h2>
				</c:if>
				<c:if test="${noBillDataDelivery !=null }">
					<h2 class="alert alert-danger">${noBillDataDelivery }</h2>
				</c:if>
			</div>
		</div>
	</div>
</div>

<c:if test="${updateStatusBillSuccess != null }">
	<script>
		window.onload = function() {
			swal('Success', 'Change status order success', 'success')
		}
	</script>
</c:if>


