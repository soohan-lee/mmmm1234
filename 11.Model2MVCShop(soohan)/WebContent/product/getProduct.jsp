<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   	<link href="/css/animate.min.css" rel="stylesheet">
  	 <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
  	 <script src="/javascript/bootstrap-dropdownhover.min.js"></script>

	<style>
		body{
			padding-top:50px;
		}
	</style>
	
	<script type="text/javascript">
		
		$(function(){
			
			$(function(){
				$("button").on("click",function(){
					self.location="/purchase/addPurchase?prodNo=${product.prodNo }&userId=${user.userId}"
				});
			});
			$("a[href='#']").on("click",function(){
				self.location="/product/listProduct?menu=search"
			});
		
		});
	</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp"/>
	
	<div class="container">
	
		<div class="page-header">
			<h3 class="text-info">상품상세조회</h3>
		</div>
	
	<div class= "row">
		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
		<div class="col-xs-8 col-md-4">${product.prodNo}</div>
	</div>

	<hr/>
	
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
		<div class="col-xs-8 col-md-4">${product.prodName}</div>
	</div>
	
	<hr/>
		<div class="row">
		<div class="col-xs-4 col-md-2"><strong>상품이미지</strong></div>
		<div class="col-xs-8 col-md-4"><img src="../images/uploadFiles/${product.fileName}"/></div>
	</div>
	
	<hr/>
	
	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>상세정보</strong></div>
		<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  	<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
		<div class="col-xs-8 col-md-4">${product.manuDate}</div>
	</div>	

	<hr/>

	<div class="row">
		<div class="col-xs-4 col-md-2"><strong>등록일자</strong></div>
		<div class="col-xs-8 col-md-4">${product.regDate}</div>
	</div>
	
	<hr/>

	<div class="form-group">
		<div class="col-md-12 text-center">
			<button type="button" class="btn btn-primary">상품구매</button>
			<a class="btn btn-primary btn" href="#" role="button">상품리스트</a>
		</div>
				
	</div>
</div>
</body>
</html>