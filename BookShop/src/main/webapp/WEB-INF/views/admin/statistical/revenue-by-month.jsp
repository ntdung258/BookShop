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
							href="<c:url value ="/admin/home/view-chart-revenue-by-day" />">REVENUE
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
		<div
			class="templatemo-flex-row flex-content-row templatemo-overflow-hidden mt">
			<div class="col-1 templatemo-overflow-hidden">
				<div
					class="templatemo-content-widget white-bg templatemo-overflow-hidden">
					<div class="templatemo-flex-row flex-content-row">
						<div class="col-lg-9 col-md-9">
							<div class="text-center">
								<h2 class="badge">Statistical chart of revenue by Month</h2>
							</div>
							<div class="panel-body">
								<canvas id="myCateChart"></canvas>
							</div>
						</div>
						<div class="col-lg-3 col-md-3">
							<div class="panel-body">
								<form action="/BookShop/admin/home/view-chart-revenue-by-month-and-date"
									onsubmit="return formChartCategoryValidate()">
									<div class="col-lg-12 col-md-12 form-group">
									<fmt:formatDate value="${startDate }"
								pattern="yyyy-MM-dd" var="sDate" />
										<label>Date Start</label> <input type="date"
											class="form-control" name="startDate" id="startDate" value="${sDate }" /> <span
											class="err" id="errStartDate"></span>
									</div>
									<div class="col-lg-12 col-md-12 form-group">
									<fmt:formatDate value="${endDate }"
								pattern="yyyy-MM-dd" var="eDate" />
										<label>Date End</label> <input type="date"
											class="form-control" name="endDate" id="endDate" value="${eDate }" /> <span
											class="err" id="errEndDate"></span>
									</div>
									<div class="col-lg-12 col-md-12 form-group">
										<button type="submit" class="btn btn-success">Submit</button>
									</div>

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="templatemo-flex-row flex-content-row">
			<div class="col-2 text-center">
				<div class="templatemo-content-widget bg-warning">
					<div class="media">
						<div
							class="panel panel-default templatemo-content-widget white-bg no-padding">
							<div class="panel-heading templatemo-position-relative">
								<h2 class="">Sales statistics by Month</h2>
							</div>
							<div class="table-responsive">
								<table class="table table-striped table-bordered">
									<thead>
										<tr class="bg-success">
											<td><strong>Month</strong></td>
											<td><strong>Revenue by Month</strong></td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listOb }" var="ob">
											<tr>
												<td scope="row">${ob[0]}-${ob[1]}</td>
												<td scope="row"><fmt:formatNumber currencySymbol=""
														value="${ob[2] }" /></td>
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
		<c:if test="${noData != null }">
			<h3 class="alert alert-danger text-center">${noData }</h3>
		</c:if>
	</div>
</div>


<script type="text/javascript">
	let cateName = [], cateQuantity = [];

	<c:forEach items="${listOb }" var="ob">
	cateName.push('${ob[0]}-${ob[1]}')
	cateQuantity.push('${ob[2] }')
	</c:forEach>

	window.onload = function() {
		cateChart("myCateChart", cateName, cateQuantity);
	}
</script>


