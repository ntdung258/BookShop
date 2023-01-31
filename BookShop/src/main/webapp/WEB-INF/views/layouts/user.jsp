<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="no-js" lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><decorator:title default="Book-Library" /></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="stylesheet"
	href="<c:url value="/resource/css/bootstrap.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resource/css/normalize.css" />">
<link rel="stylesheet"
	href="<c:url value="/resource/css/font-awesome.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resource/css/icomoon.css" />">
<link rel="stylesheet"
	href="<c:url value="/resource/css/jquery-ui.css" />">
<link rel="stylesheet"
	href="<c:url value="/resource/css/owl.carousel.css" />">
<link rel="stylesheet"
	href="<c:url value="/resource/css/transitions.css" />">
<link rel="stylesheet" href="<c:url value="/resource/css/main.css" />">
<link rel="stylesheet" href="<c:url value="/resource/css/color.css" />">
<link rel="stylesheet"
	href="<c:url value="/resource/css/responsive.css" />">
<script
	src="<c:url value="/resource/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js" />"></script>
<script
	src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js" />"></script>
<script
	src="<c:url value="https://unpkg.com/sweetalert/dist/sweetalert.min.js" />"></script>
</head>
<body class="tg-home tg-homeone">

	<div id="tg-wrapper" class="tg-wrapper tg-haslayout">
		<%@include file="/WEB-INF/views/layouts/user/header.jsp"%>

		<decorator:body></decorator:body>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						Do you want delete "<span id="nameProduct"></span>" ?
					</div>
					<div class="modal-footer">
						<a id="delete-product-in-cart" data-id=""
							onclick="deleteProduct(this)" type="button"
							class="btn btn-secondary js-addcart">Yes</a>
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							onclick="location.reload()">No</button>
					</div>
				</div>
			</div>
		</div>

		<%@include file="/WEB-INF/views/layouts/user/footer.jsp"%>
	</div>
	<script src="<c:url value="/resource/js/vendor/jquery-library.js" />"></script>
	<script src="<c:url value="/resource/js/vendor/bootstrap.min.js" />"></script>
	<script
		src="<c:url value="https://maps.google.com/maps/api/js?key=AIzaSyCR-KEWAVCn52mSdeVeTqZjtqbmVJyfSus&amp;language=en" />"></script>
	<script src="<c:url value="/resource/js/owl.carousel.min.js" />"></script>
	<script src="<c:url value="/resource/js/jquery.vide.min.js" />"></script>
	<script src="<c:url value="/resource/js/jquery-ui.js" />"></script>
	<script src="<c:url value="/resource/js/parallax.js" />"></script>
	<script src="<c:url value="/resource/js/appear.js" />"></script>
	<script src="<c:url value="/resource/js/gmap3.js" />"></script>
	<script src="<c:url value="/resource/js/main.js" />"></script>
	<script src="<c:url value="/resource/js/validator.js" />"></script>
	<script type="text/javascript">
		//Hiển thị thông báo khi thêm sản phẩm
		$('.js-addcart').each(function() {
			var nameProduct = $(this).data("name");
			$(this).on('click', function() {
				swal(nameProduct, "is added to cart !", "success");
			});
		});

		//Thêm sản phẩm vào giỏ hàng
		$('.AddToCart').click(
				function() {
					var id = $(this).data("id");
					$.ajax({
						type : "GET",
						url : "/BookShop/cart/add-to-cart/" + id,
						success : function(data) {
							$("#totalQuantity").load(
									location.href + " #totalQuantity");
						}
					});
				});

		//+- số lượng sản phẩm trong giỏ hàng
		$('.btn-num-product-down').on('click', function() {
			var numProduct = Number($(this).next().val());
			if (numProduct > 0)
				$(this).next().val(numProduct - 1);
		});

		$('.btn-num-product-up').on('click', function() {
			var numProduct = Number($(this).prev().val());
			$(this).prev().val(numProduct + 1);
		});

		//Thay đổi bằng cách nhập
		$('.quantity-input').change(
				function() {
					var product_id = $(this).data("id");
					var bookName = $(this).data("name");
					$('#nameProduct').text(bookName);
					var d = document.getElementById("delete-product-in-cart");
					d.setAttribute('data-id', product_id);
					var quantity = $("#quantity-" + product_id).val();
					if (quantity <= 0) {
						$("#exampleModal").modal("show");
					} else {
						$.ajax({
							type : "GET",
							url : "/BookShop/cart/update-quantity/"
									+ product_id + "/" + quantity,
							success : function() {
								location.reload();
							}
						});
					}

				})

		/* 
		Thay đổi số lượng sản phẩm nếu số lượng ==0 thì xóa sản phẩm khoiar giỏ hàng
		 */
		$('.quantity-change')
				.click(
						function() {
							var product_id = $(this).data("id");
							var bookName = $(this).data("name");
							$('#nameProduct').text(bookName);
							var d = document
									.getElementById("delete-product-in-cart");
							d.setAttribute('data-id', product_id);
							var quantity = $("#quantity-" + product_id).val();
							if ($(this).hasClass('btn-num-product-down')) {
								if (quantity == 0) {
									$("#exampleModal").modal("show");
								} else {
									$.ajax({
										type : "GET",
										url : "/BookShop/cart/update-quantity/"
												+ product_id + "/" + quantity,

									});
									//giá tiền * số lượng
									var price = $('#price' + product_id).attr(
											"data-id");
									var totalPrice = parseFloat(price)
											* parseInt(quantity);
									document.getElementById('totalPrice'
											+ product_id).value = totalPrice;
									totalPrice = totalPrice.toLocaleString(
											'it-IT', {
												style : 'currency',
												currency : 'VND'
											});
									$('.totalPrice' + product_id).text(
											totalPrice);

									findTotal();
								}

							} else if ($(this).hasClass('btn-num-product-up')) {
								$.ajax({
									type : "GET",
									url : "/BookShop/cart/update-quantity/"
											+ product_id + "/" + quantity,

								});
								//giá tiền * số lượng
								var price = $('#price' + product_id).attr(
										"data-id");
								var totalPrice = parseFloat(price)
										* parseInt(quantity);
								document.getElementById('totalPrice'
										+ product_id).value = totalPrice;
								totalPrice = totalPrice.toLocaleString('it-IT',
										{
											style : 'currency',
											currency : 'VND'
										});
								$('.totalPrice' + product_id).text(totalPrice);
								findTotal();
							}
						});

		//Cộng tổng số lượng và tiền của giỏ hàng
		function findTotal() {
			//số lượng
			var arr = document.getElementsByName('qty');
			var sum = 0;
			for (var i = 0; i < arr.length; i++) {
				if (parseInt(arr[i].value))
					sum += parseInt(arr[i].value);
			}
			$('#totalQuantity').text(sum);

			//tồng tiền
			var arr2 = document.getElementsByName('totalPrice');
			var sum2 = 0;
			for (var j = 0; j < arr2.length; j++) {
				if (parseFloat(arr2[j].value))
					sum2 += parseFloat(arr2[j].value);
			}
			sum2 = sum2.toLocaleString('it-IT', {
				style : 'currency',
				currency : 'VND'
			});
			$('#total').text(sum2);
		}
		//set số lượng = số lương tồn kho
		function setQuantity(e) {
			var product_id = e.getAttribute("data-id");
			$
					.ajax({
						type : "GET",
						url : "/BookShop/checkout/update-iventoty/"
								+ product_id,
						success : function() {
							$("#refresh" + product_id).load(
									location.href + " #refresh" + product_id);
							$("#total").load(location.href + " #total");
							$("#totalPrice").load(
									location.href + " #totalPrice");
							$("#totalQuantity").load(
									location.href + " #totalQuantity");
							$("#btn-order").load(location.href + " #btn-order");
							$("#summary").load(location.href + " #summary");

						}
					});
		};
		//Delete item in cart
		function deleteProduct(p) {
			var product_id = p.getAttribute("data-id");
			$.ajax({
				type : "GET",
				url : "/BookShop/cart/delete-product/" + product_id,
				success : function(data) {
					location.reload();
				}
			});

		}

		//Kiểm tra sản phẩm còn tồn tại hay không?
		function checkProduct() {
			var arr = document.getElementsByName('bookId');
			var a = new Array();
			for (var i = 0; i < arr.length; i++) {
				if (arr[i].value)
					a[i] = arr[i].value;
			}

			var arr2 = document.getElementsByName('productDelete');
			var b = new Array();
			for (var i = 0; i < arr2.length; i++) {
				if (arr2[i].value)
					b[i] = arr2[i].value;
			}

			var count = 0;
			for (var i = 0; i < arr.length; i++) {
				if (a[i] != b[i]) {
					$('#deleteProduct' + a[i]).text("Product does not exist");
				} else {
					count = count + 1;
				}
			}
			if (count == arr.length) {
				return true;
			}
			return false;
		}
		
		
		
		//confirm change staus bill
		$('.btn-change-status').click(function() {
			/* var url = $(this).data("href");
			var a = document.getElementById('href-change-status');
			a.href = url; */
			$("#modal-notification-change-status").modal("show");
		}); 
	</script>
	
	
</body>
</html>