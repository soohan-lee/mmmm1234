<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

 	 <link rel="stylesheet" href="/resources/demos/style.css">

 	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

 	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<style>
		body > div.container{
				border: 3px solid #D6CDB7;
				margin-top: 10px
		}
	</style>

	
	<script type="text/javascript">

		function fncAddProduct(){
			//Form 유효성 검증
			var name=$("input[name=prodName]").val();
			var pd=$("input[name=prodDetail]").val();
			var md=$("input[name=manuDate]").val().replace(/\//gi, "");
			var price=$("input[name=price]").val();
	
			if(name == null || name.length<1){
				alert("상품명을 입력하세요");
		
				$("input[name=prodName]").focus();
		
				return;
			}
	
			if(price==null || price.length<1){
		
				alert("가격을 입력하세요");
		
				$("input[name=price]").focus();
		
				return;
			}
	
			$("form").attr("method","POST").attr("action","/product/addProduct").attr("enctype","multipart/form-data").submit();
		}

		$(function(){
			
			$("button.btn.btn-primary").on('click',function(){
				
				alert("등록하시겠습니까?????");
				
				fncAddProduct();
			});
			
		});
		
		$(function(){
			
			$("a[href='#']").on('click',function(){
				
				alert("취소하시겠습니까????");
				
				$("form")[0].reset();
			});
		});
		$(function(){
			$("#manuDate").datepicker({
				showButtonPanel:true,
				dateFormat:'yymmdd'
			});
		});

</script>

</head>

<body>
<!--  
<form name="detailForm" method="post">
-->
	<div class="navbar  navbar-default">
		<div class="container">
			<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop </a>
		</div>
	</div>
	
	<div class=container>
	
		<h1 class="bg-primary text-center">상품등록</h1>
		<form class="form-horizontal">
		
			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
					<div class="col-sm-4">
					<input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상세정보입력">
					</div>
			</div>
			
			<div class="form-group">
				<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상세정보</label>
					<div class="col-sm-4">
					<input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품이름입력">
					</div>
			</div>
			
			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="상품제조일자" readonly>
					
				</div>
			</div>
			
			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price" placeholder="가격">
				
		    </div>
		  </div>
				
			<div class="form-group">
				<label for="fileName"class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="file" name="file" placeholder="상품이미지">
				</div>
			</div>
	
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4 text-center">
					<button type="button" class="btn btn-primary">등록</button>
						<a class="btn btn-primary btn" href="#" role="button">취소</a>
				</div>
			</div>
		</form>
	</div>
	</body>
	</html>
	