<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

	<meta charset="EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">

function fncAddPurchase() {
	$("form").attr("method","POST").attr("action","/purchase/addPurchase").submit();
}

$(function(){
	
	$("button.btn.btn-primary").on('click',function(){
		
		alert("구매하시겠습니까?????");
		
		fncAddPurchase();
	});
	
});

$(function(){
	
	$("a[href='#']").on('click',function(){
		
		alert("취소하시겠습니까????");
		
		$("form")[0].reset();
	});
});

$(function(){
	$("#dlvyDate").datepicker({
		dateFormat:'yy-mm-dd'
	});
});

</script>
</head>

<body>

<!-- <form name="addPurchase" method="post" action="/purchase/addPurchase"> -->
 <div class="navbar  navbar-default">
 	<div class="container">
 		<jsp:include page="/layout/toolbar.jsp"/>
 	</div>
 </div>
 
 <div class="container">
 	<h1 class="bg-primary text-center">구매정보</h1>
 	
 	<form class="form-horizontal">
 	
 		<div class="form-group">
 			<input type="hidden" name="purchaseProd.prodNo"  value ="${purchase.purchaseProd.prodNo}">
 			<label class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
 			<div class="col-sm-4">
 			<input type="text" class="form-control" value="${purchase.purchaseProd.prodNo}" readonly>
			</div>
		</div>
		
		<div class="form-group">
			<label for="purchaseProdprodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" value="${purchase.purchaseProd.prodName}" readonly>
			</div>
		</div>
		
		<div class="form-group">
			<label for="purchaeProd.prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" value="${purchase.purchaseProd.prodDetail}" readonly>
			</div>
		</div>
		
		<div class="form-group">
			<label for="purchaseProd.manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" value="${purchase.purchaseProd.manuDate}" readonly>
			</div>
		</div>
		
		<div class="form-group">
			<label for="purchaseProd.price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" value="${purchase.purchaseProd.price}" readonly>
			</div>
		</div>
		
		<div class="form-group">
			<label for="purchaseProd.regDate" class="col-sm-offset-1 col-sm-3 control-label">등록일</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" value="${purchase.purchaseProd.regDate}" readonly>
			</div>
		</div>
		
		<div class="form-group">
			<input type="hidden" name="buyer.userId" value="${purchase.buyer.userId}">
			<label for="buyer.userId" class="col-sm-offset-1 col-sm-3 control-label">구매자ID</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" value="${purchase.buyer.userId}" readonly>
			</div>
		</div>
		
		
		<div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		     <div class="col-sm-3">
		      <select class="form-control" name="paymentOption" id="paymentOption">
				  	<option value="0" >현금구매</option>
					<option value="1" >신용구매</option>
				</select>
		    </div>
		  </div>
		  
		<div class="form-group">
			<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="receiverName" name="receiverName" placeholder="구매자 이름">
			</div>
		</div>
		
	<div class="form-group"> 
 			<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label> 
 			<div class="col-sm-4"> 
 				<input 	type="text" class="form-control" name="receiverPhone" maxLength="20" value="${purchase.receiverPhone }" /> 
 			</div> 
 		</div> 
 		
 		
	<div class="form-group">
		<label for="divyAddr" class="col-sm-offset-1 control-label">구매자 주소</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="divyAddr" name="divyAddr" placeholder="구매자 주소"/>
		</div>
	</div>
	
	<div class="form-group">
		<label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망 일자</label>
		<div class="col-sm-2">
		<input type="text" class="form-control" id="dlvyDate" name="dlvyDate" readonly/>
		</div>
	</div>
	
	

<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4 text-center">
					<button type="button" class="btn btn-primary">구매</button>
						<a class="btn btn-primary btn" href="#" role="button">취소</a>
				</div>
			</div>
		</form>
	</div>
	</body>
	</html>
	