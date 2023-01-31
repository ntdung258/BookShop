<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Visual Admin Dashboard - Home</title>
<meta name="description" content="">
<meta name="author" content="templatemo">

<link href="<c:url value="/resource/admin/css/font-awesome.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resource/admin/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resource/admin/css/templatemo-style.css" />"
	rel="stylesheet">
<link
	href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />"
	rel="stylesheet">

</head>
<body>


	<decorator:body></decorator:body>


	<!-- JS -->
	<script src="<c:url value="/resource/admin/js/jquery-1.11.2.min.js" />"></script>
	<!-- jQuery -->
	<script
		src="<c:url value="/resource/admin/js/jquery-migrate-1.2.1.min.js" />"></script>
	<!-- Google Chart -->

	<script type="text/javascript"
		src="<c:url value="/resource/admin/js/templatemo-script.js" />"></script>
	<!-- Templatemo Script -->
	<script src="<c:url value="/resource/admin/js/validator.js" />"></script>
	<script
		src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js" />"></script>
	<script
		src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" />"></script>
	<script
		src="<c:url value="https://unpkg.com/sweetalert/dist/sweetalert.min.js" />"></script>
	<script type="text/javascript"
		src="<c:url value="https://cdn.jsdelivr.net/npm/chart.js" />"></script>
	<script>	

	/* Display image before upload */
		$(document).ready(()=>{
		      $('#photo').change(function(){
		        const file = this.files[0];
		        console.log(file);
		        if (file){
		          let reader = new FileReader();
		          reader.onload = function(event){
		           	var srcData = event.target.result;
		           	var newImage = document.createElement('img');
		           	newImage.src = srcData;
		           	document.getElementById('holder').innerHTML = newImage.outerHTML;
		          }
		          reader.readAsDataURL(file);
		        }
		      });
		    });
	
		
	
		/* Display image before upload edit */
		$(document).ready(()=>{
		      $('#photoEditAuthor').change(function(){
		        const file = this.files[0];
		        console.log(file);
		        if (file){
		          let reader = new FileReader();
		          reader.onload = function(event){
		           	var srcData = event.target.result;
		           	var newImage = document.createElement('img');
		           	newImage.src = srcData;
		           	document.getElementById('holderEditAuthor').innerHTML = newImage.outerHTML;
		          }
		          reader.readAsDataURL(file);
		        }
		      });
		    });
	
		
		
		
		//Show modal confirm
		function showConfirmModelDialog(product){
			var bookName = product.getAttribute("data-name");
			var id = product.getAttribute("data-id");
			var d = document.getElementById("deleteProduct");
			$('#nameProduct').text(bookName);
			d.href="/BookShop/admin/product/delete-product/"+id;
			$("#exampleModal").modal("show");
		}
		
		
	//Show modal detail Product
	function ShowModalDetail(product){
		$('#bookId').text(product.getAttribute("data-id"));
		$('#bookName').text(product.getAttribute("data-name"));
		$('#author').text(product.getAttribute("data-author"));
		$('#category').text(product.getAttribute("data-category"));
		$('#quantity').text(product.getAttribute("data-quantity"));
		var price = parseFloat(product.getAttribute("data-price"));
		
		price = price.toLocaleString(
				'it-IT', {
					style : 'currency',
					currency : 'VND'
				});
		$('#price').text(price);
		
		$('#pages').text(product.getAttribute("data-pages"));
		$('#language').text(product.getAttribute("data-language"));
		

		var publicationDate = new Date(product.getAttribute("data-publicationDate"));
		var yyyy = publicationDate.getFullYear();
		var mm = publicationDate.getMonth()+1;
		var dd = publicationDate.getDate();
		if (dd < 10) dd = '0' + dd;
		if (mm < 10) mm = '0' + mm;
		var formatPublicationDate = dd + '-' + mm + '-' + yyyy;
		$('#publicationDate').text(formatPublicationDate);
		
		$('#publisher').text(product.getAttribute("data-publisher"));
		
		var bookImage = product.getAttribute("data-bookImage");
		document.images['bookImage'].src = "/BookShop/resource/images/books/"+bookImage;
		
		
		var createDate = new Date(product.getAttribute("data-createDate"));
		var yyyy = createDate.getFullYear();
		var mm = createDate.getMonth()+1;
		var dd = createDate.getDate();
		if (dd < 10) dd = '0' + dd;
		if (mm < 10) mm = '0' + mm;
		var formatCreateDate = dd + '-' + mm + '-' + yyyy;
		$('#createDate').text(formatCreateDate);

		
		document.getElementById("updateProduct").href = "/BookShop/admin/product/view-update-product/"+product.getAttribute("data-id");
		$("#modal-detail-product").modal("show");
	}
	
	</script>


	<script>
		//Show Biểu đồ chart doanh thu của từng danh mục
		function cateChart(id, cateName=[],cateQuantity=[]){
			  	const labels = 5;
			  	const data = {
			  	  labels: cateName,
			  	  datasets: [{
			  		label: 'Revenue By Category',
			  	    data: cateQuantity,
			  	    backgroundColor: [
			  	    	'#337ab7'
			  	    ],
			  	    borderColor: [
			  	    	'rgba(0, 209, 192, 0.7)'
			  	    ],
			  	    borderWidth: 1
			  	  }]
			  	};
			  	
			  	const config = {
			  		  type: 'bar',
			  		  data: data,
			  		  options: {
			  			plugins: {
			  			    legend: {
			  			      display: false
			  			    }
			  			  },
			  		    scales: {
			  		      y: {
			  		        beginAtZero: true
			  		      }
			  		    }
			  		  },
			  		};
			  	let ctx = document.getElementById(id).getContext("2d");
			  	new Chart(ctx, config);
		}
		
		//Validate size input= file
		var uploadField = document.getElementById("photo");
		uploadField.onchange = function() {
			var extension = this.files[0].type;
		    if(this.files[0].size > 5242880){
		    	var errSize = document.getElementById("errSize");
		    	document.getElementById("errSize").innerHTML = "File is too big ";
		    }else if(extension != "image/png" && extension != "image/jpeg"){
		    	document.getElementById("errSize").innerHTML = "File is in the wrong format";
		    }
		    else{
		    	document.getElementById("errSize").innerHTML = "";
		    }; 
		};
		
		
		//Validate size input= file
		var uploadField = document.getElementById("photoEditAuthor");
		uploadField.onchange = function() {
			var extension = this.files[0].type;
		    if(this.files[0].size > 5242880){
		    	var errSize = document.getElementById("errSizeAuthor");
		    	document.getElementById("errSizeAuthor").innerHTML = "File is too big ";
		    }else if(extension != "image/png" && extension != "image/jpeg"){
		    	document.getElementById("errSizeAuthor").innerHTML = "File is in the wrong format";
		    }
		    else{
		    	document.getElementById("errSizeAuthor").innerHTML = "";
		    }; 
		};
		
	  	
	</script>

	<script>
	
	//confirm change staus bill
	$('.btn-change-status').click(function() {
		var url = $(this).data("href");
		var a = document.getElementById('href-change-status');
		a.href = url;
		$("#modal-notification-change-status").modal("show");
	});
	
	//Cancel order
	$('.btn-cancel-order').click(function() {
		$("#modal-cancel-order").modal("show");
	});
	
	
	
	//Show Biểu đồ chart thống kê số lượng sản phẩm theo danh mục
	function chartQuantityByCate(id, cateName=[],cateQuantity=[]){
		const data = {
				  labels: cateName,
				  datasets: [{
				    label: 'My First Dataset',
				    data: cateQuantity,
				    backgroundColor: [
				      '#FF00FF',
				      '#00FF00',
				      '#0000FF',
				      '#FFFF00',
				      '#00FFFF'
				    ],
				    hoverOffset: 4
				  }]
				};
		
		const config = {
				  type: 'doughnut',
				  data: data,
				};
		
		let ctx = document.getElementById(id).getContext("2d");
	  	new Chart(ctx, config);
	}
	
	
	//Show Biểu đồ chart thống kê số lượng sản phẩm theo tác giả
	function chartQuantityByAuthor(id, authorName=[],authorQuantity=[]){
		const data = {
				  labels: authorName,
				  datasets: [{
				    label: 'My First Dataset',
				    data: authorQuantity,
				    backgroundColor: [
				      '#FF00FF',
				      '#00FF00',
				      '#0000FF',
				      '#FFFF00',
				      '#00FFFF',
				      '#C0C0C0',
				      '#CCFFFF',
				      '#FFCCFF'
				    ],
				    hoverOffset: 4
				  }]
				};
		
		const config = {
				  type: 'doughnut',
				  data: data,
				};
		
		let ctx = document.getElementById(id).getContext("2d");
	  	new Chart(ctx, config);
	}

</script>
</body>
</html>