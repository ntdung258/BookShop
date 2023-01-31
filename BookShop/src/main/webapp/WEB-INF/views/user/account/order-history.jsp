<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Order-history</title>
<div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner"
	data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll"
	data-image-src="<c:url value="/resource/images/parallax/bgparallax-07.jpg" />">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="tg-innerbannercontent">
					<h1>Order-history</h1>
					<ol class="tg-breadcrumb">
						<li><a href="<c:url value="/home" />">home</a></li>
						<li class="tg-active">Order-history</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>

<main id="tg-main" class="tg-main tg-haslayout">
	<div class="tg-sectionspace tg-haslayout">
		<div class="container">
			<div class="row">
				<div class="col-md-9 form-account-edit float-right">
					<div class="templatemo-content-container">
						<div class="templatemo-content-widget no-padding">
							<div class="panel panel-default table-responsive">
								<table
									class="table table-bordered templatemo-user-table table-striped">
									<thead class="bgtable">
										<td class="white-text templatemo-sort-by">NO</td>
										<td class="white-text templatemo-sort-by">CREATE DATE</td>
										<td class="white-text templatemo-sort-by">RECIPIENT NAME</td>
										<td class="white-text templatemo-sort-by">TOTAL</td>
										<td class="white-text templatemo-sort-by">STATUS</td>
										<td class="white-text templatemo-sort-by">DETAIL</td>
									</thead>
									<tbody>
										<c:forEach items="${listBillByUser}" var="listBillByUser" varStatus="stt">
											<tr>
												<td>${stt.index+1}</td>
												<td><fmt:formatDate pattern="dd-MM-yyyy-HH:mm:ss"
														value="${listBillByUser.createDate }" /></td>
												<td>${listBillByUser.recipientName }</td>
												<td><fmt:formatNumber currencySymbol=""
														value="${listBillByUser.totalPrice }" /></td>


												<c:if test="${listBillByUser.status=='Wait confirmation'}">
													<td><div class="btn-warning btn-delivery text-center">
															<i class="fa fa-spinner" aria-hidden="true"></i>&nbsp;
															${listBillByUser.status}
														</div></td>
													<td><a
														href="/BookShop/account/view-order-detail-history/${listBillByUser.id }"
														type="button" class="btn btn-warning"><i
															class="fa fa-info-circle"></i></a></td>
												</c:if>

												<c:if test="${listBillByUser.status=='Delivering'}">
													<td><div class="btn-info btn-delivery text-center">
															<i class="fa fa-truck" aria-hidden="true"></i>&nbsp;
															${listBillByUser.status}
														</div></td>
													<td><a
														href="/BookShop/account/view-order-detail-history/${listBillByUser.id }"
														type="button" class="btn btn-info"><i
															class="fa fa-info-circle"></i></a></td>
												</c:if>

												<c:if test="${listBillByUser.status=='Order completed'}">
													<td><div class="btn-success btn-delivery text-center">
															<i class="fa fa-check" aria-hidden="true"></i>&nbsp;
															${listBillByUser.status}
														</div></td>
													<td><a
														href="/BookShop/account/view-order-detail-history/${listBillByUser.id }"
														type="button" class="btn btn-success"><i
															class="fa fa-info-circle"></i></a></td>
												</c:if>

												<c:if test="${listBillByUser.status=='Order canceled'}">
													<td><div class="btn-danger btn-delivery text-center">
															<i class="fa fa-times"></i>&nbsp;
															${listBillByUser.status}
														</div></td>
													<td><a
														href="/BookShop/account/view-order-detail-history/${listBillByUser.id }"
														type="button" class="btn btn-danger"><i
															class="fa fa-info-circle"></i></a></td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<c:if test="${noDataBill !=null }">
								<h3 class="alert alert-warning text-center">${noDataBill }</h3>
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-md-2 border-ac float-left">
					<aside id="tg-sidebar" class="tg-sidebar">
						<div class="tg-widget tg-catagories pb">
							<c:if
								test="${userLogin.gender == 'nam' && userLogin.userImage == null }">
								<div
									class="templatemo-content-widget white-bg col-1 text-center">
									<img class="avatar-circle"
										src="<c:url value="/resource/images/avatar-default-male.jpg" />">
								</div>
							</c:if>

							<c:if
								test="${userLogin.gender == 'nu' && userLogin.userImage == null }">
								<div
									class="templatemo-content-widget white-bg col-1 text-center">
									<img class="avatar-circle"
										src="<c:url value="/resource/images/avatar-default-female.jpg" />">
								</div>
							</c:if>

							<c:if test="${userLogin.userImage != null }">
								<div
									class="templatemo-content-widget white-bg col-1 text-center">
									<img class="avatar-circle"
										src="<c:url value="/resource/images/users/${userLogin.userImage}" />">
								</div>
							</c:if>

							<div class="tg-widgetcontent ptb">
								<ul>
									<li class="${activePage=='view-account' }-active"><a
										class="templatemo-sort-by"
										href="<c:url value="/account/view-account" />">Account
											information</a></li>
									<li class="${activePage=='view-order-history' }-active"><a
										class="templatemo-sort-by "
										href="<c:url value="/account/view-order-history" />">Order
											history</a></li>
									<li class="${activePage=='view-change-password' }-active"><a
										class="templatemo-sort-by "
										href="<c:url value="/account/view-change-password" />">Change
											password</a></li>
									<li><a class="templatemo-sort-by"
										href="<c:url value="/j_spring_security_logout" />">Logout</a></li>
								</ul>
							</div>
						</div>
					</aside>
				</div>
			</div>
		</div>
	</div>
</main>








