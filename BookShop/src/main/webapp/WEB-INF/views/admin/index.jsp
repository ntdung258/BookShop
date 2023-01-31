<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="templatemo-flex-row">
	<div class="templatemo-sidebar">
		<%@include file="/WEB-INF/views/layouts/admin/header.jsp"%>
		<%@include file="/WEB-INF/views/layouts/admin/imageProfile.jsp"%>
		<%@include file="/WEB-INF/views/layouts/admin/nav-left.jsp"%>
	</div>
	<div class="templatemo-content-container col-1 light-gray-bg">
		<div class="templatemo-top-nav-container">
			<div class="row">
				<nav class="templatemo-top-nav col-lg-12 col-md-12">
					<ul class="text-uppercase">
						<li class="${activeSubPage=='category'}-active"><a
							href="<c:url value ="/admin/home/view-chart-category" />">CATEGORY</a></li>
						<li class="${activeSubPage=='author'}-active"><a
							href="<c:url value ="/admin/home/view-chart-author" />">AUTHOR</a></li>
						<li class="${activeSubPage=='revenue-by-day'}-active"><a
							href="<c:url value ="/admin/view-chart-revenue-by-day" />">REVENUE
								BY DAY</a></li>
						<li class="${activeSubPage=='revenue-by-month'}-active"><a
							href="<c:url value ="/admin/home/view-chart-revenue-by-month" />">REVENUE
								BY MONTH</a></li>
						<li class="${activeSubPage=='revenue-by-year'}-active"><a
							href="<c:url value ="/admin/home/view-chart-revenue-by-year" />">REVENUE
								BY YEAR</a></li>
					</ul>
				</nav>
			</div>
		</div>

		<div class="templatemo-flex-row flex-content-row">
			<div class="templatemo-content-widget bg-primary col-1 text-center">
				<span class="text-uppercase margin-bottom-10 white-text">Number
					of accounts</span>
				<div class="" style="padding-top: 10px;">
					<span><i>${countUser }</i></span>
				</div>
			</div>

			<div class="templatemo-content-widget bg-primary col-1 text-center">
				<span class="text-uppercase margin-bottom-10">Number of
					products</span>
				<div class="" style="padding-top: 10px;">
					<span><i>${countProduct }</i></span>
				</div>
			</div>

			<div class="templatemo-content-widget bg-primary col-1 text-center">
				<span class="text-uppercase margin-bottom-10">Number of
					author</span>
				<div class="" style="padding-top: 10px;">
					<span><i>${countAuthor }</i></span>
				</div>
			</div>

			<div class="templatemo-content-widget bg-primary col-1 text-center">
				<span class="text-uppercase margin-bottom-10">Number of
					categories</span>
				<div class="" style="padding-top: 10px;">
					<span><i>${countCategory }</i></span>
				</div>
			</div>
		</div>
		<div
			class="templatemo-flex-row flex-content-row templatemo-overflow-hidden mt">
			<div class="col-1 templatemo-overflow-hidden">
				<div
					class="templatemo-content-widget white-bg templatemo-overflow-hidden">
					<div class="templatemo-flex-row flex-content-row">
						<div class="col-lg-5 col-md-5">
							<div class="panel-body">
								<canvas id="chartQuantityByCate"></canvas>
							</div>
							<div class="text-center">
								<h2 class="badge">Statistical chart of the number of
									products by Category</h2>
							</div>
						</div>
						<div class="col-lg-7 col-md-7">
							<div
								class="templatemo-content-widget no-padding mt-index text-center">
								<div class="panel panel-default table-responsive">
									<table
										class="table table-bordered templatemo-user-table table-striped">
										<thead>
											<tr>
												<td><a href="" class="white-text templatemo-sort-by">CATEGORY
														ID</a></td>
												<td><a href="" class="white-text templatemo-sort-by">CATEGORY
														NAME</a></td>
												<td><a href="" class="white-text templatemo-sort-by">TOTAL
														QUANTITY</a></td>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listObCate }" var="ob">
												<tr class="">
													<td scope="row">${ob[1] }</td>
													<td scope="row">${ob[2] }</td>
													<td scope="row"><fmt:formatNumber currencySymbol=""
															value="${ob[0] }" /></td>
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


		<div
			class="templatemo-flex-row flex-content-row templatemo-overflow-hidden mt">
			<div class="col-1 templatemo-overflow-hidden">
				<div
					class="templatemo-content-widget white-bg templatemo-overflow-hidden">
					<div class="templatemo-flex-row flex-content-row">
						<div class="col-lg-5 col-md-5">
							<div class="panel-body">
								<canvas id="chartQuantityByAuthor"></canvas>
							</div>
							<div class="text-center">
								<h2 class="badge">Statistical chart of the number of
									products by Author</h2>
							</div>
						</div>
						<div class="col-lg-7 col-md-7">
							<div
								class="templatemo-content-widget no-padding mt-index text-center">
								<div class="panel panel-default table-responsive">
									<table
										class="table table-bordered templatemo-user-table table-striped">
										<thead>
											<tr>
												<td><a href="" class="white-text templatemo-sort-by">AUTHOR
														ID</a></td>
												<td><a href="" class="white-text templatemo-sort-by">AUTHOR
														NAME</a></td>
												<td><a href="" class="white-text templatemo-sort-by">TOTAL
														QUANTITY</a></td>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listObAuthor }" var="ob">
												<tr class="">
													<td scope="row">${ob[1] }</td>
													<td scope="row">${ob[2] }</td>
													<td scope="row"><fmt:formatNumber currencySymbol=""
															value="${ob[0] }" /></td>
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
</div>

<script type="text/javascript">
	let cateName = [], cateQuantity = [];

	<c:forEach items="${listObCate }" var="ob">
	cateName.push('${ob[2]}')
	cateQuantity.push('${ob[0]}')
	</c:forEach>

	let authorName = [], authorQuantity = [];
	<c:forEach items="${listObAuthor }" var="ob">
	authorName.push('${ob[2]}')
	authorQuantity.push('${ob[0]}')
	</c:forEach>
	window.onload = function() {
		chartQuantityByCate("chartQuantityByCate", cateName, cateQuantity);
		chartQuantityByAuthor("chartQuantityByAuthor", authorName,
				authorQuantity);
	}
</script>





