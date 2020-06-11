<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	

   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   

   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	

	<style>
 		body {
            padding-top : 50px;
        }
     </style>
     
<script type="text/javascript">


$(function() {

	$( "button.btn.btn-primary" ).on("click" , function() {
		self.location ="/product/listProduct?menu=manage"
		}); 
	$("a[href='#' ]").on("click" , function() {
		self.location ="/product/addProductView.jsp"
		});
	});
</script>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

	<div class="page-header">
	     <h3 class=" text-info">상품등록</h3>
	</div>
	

    <div class="row">
	  	<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
		<div class="col-xs-8 col-md-4">${ product.prodName}</div>
	</div>
	
	
 <hr/>
 	
 	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div> 
 		<div class="col-xs-8 col-md-4">${product.prodDetail}</div> 
	</div> 
	
	
	
 <hr/>	
	
	<div class="row"> 
 		<div class="col-xs-4 col-md-2 "><strong>제조일자</strong></div> 
 		<div class="col-xs-8 col-md-4">${product.manuDate }</div> 
 	</div> 
 
 <hr/>
	
	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>가격</strong></div> 
		<div class="col-xs-8 col-md-4">${product.price }</div> 
 	</div> 


  <hr/>
	<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>상품이미지</strong></div>
		<div class="col-xs-8 col-md-4"><img src = "../images/uploadFiles/${product.fileName}"/></div>
    </div>
    

<br/>
	
<div class="row"> 
 		<div class="col-md-12 text-center"> 
 		 	  <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >확&nbsp;인</button> 
				  <a class="btn btn-primary btn" href="#" role="button">추가등록</a>
 		</div> 
	</div>
</div>

</body>
</html>