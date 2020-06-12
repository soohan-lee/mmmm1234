<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page import="java.util.*" %> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> --%>

<!DOCTYPE html>
<html>

<head>
	<title>상품 목록조회</title>
	<meta name ="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<style>
		  body {
            padding-top : 50px;
        }
    </style>
	
	<script type="text/javascript">

		function fncGetUserList(currentPage){
			
			$("#currentPage").val(currentPage) ;
			$("form").attr("method","POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
			
		}
// 		function fncListPage(currentPage){
// 			$("#searchCondition").val("${search.searchCondition}");
// 			$("#searchKeyword").val("${search.searchKeyword}");
// 			fncGetUserList(currentPage);
// 		}
		
		$(function(){
			
 			$( "button.btn.btn-default" ).on("click", function(){
 				fncGetUserList(1);
 			});
			$( "td:nth-child(2)" ).on("click",function(){
				//if($(this).children(".tranCode").val()=='0'){
				if(${param.menu=='manage'}){
					self.location="/product/updateProductView.do?prodNo="+$(this).children().val()+"&menu=${param.menu}";
				}else if(${param.menu=='search'}){
					self.location="/product/getProduct?prodNo="+$(this).children().val()+"&menu=${param.menu}";
				}
				//}
			});
			
			$( "td:nth-child(6)>i" ).on("click",function(){
				var prodNo = $(this).next().val();
				$.ajax(
						{
							url:"/product/json/getProduct/"+prodNo ,
							method:"GET" , 
							dataType:"json" , 
							headers:{
								"Accept":"application/json" ,
								"Context-Type":"application/json"
							},
							success:function(JSONData,status) {
								var displayValue = "<h6>"
															+"상 품 번 호:"+JSONData.prodNo+"<br/>"
															+"상   품   명:"+JSONData.prodName+"<br/>"
															+"상 세 정 보:"+JSONData.prodDetail+"<br/>"
															+"가        격:"+JSONData.price+"<br/>"
															+"제 조 일 자:"+JSONData.manuDate+"<br/>"
															+"파 일 사 진: <img src=../images/uploadFiles/"+JSONData.fileName+"/><br/>"
															+"</h6>";
								$("h6").remove();
								$("#"+prodNo+"").html(displayValue);
							}
						});
			});
		
			
			$( ".ct_list_pop td:nth-child(3)" ).css("color","red");
			$("h7").css("color","red");
			
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});

	</script>
	
</head>

<!-- 	<body bgcolor="#ffffff" text="#000000"> -->
<body>
	<jsp:include page="/layout/toolbar.jsp"/>
<!-- 	<div style="width:98%; margin-left:10px;"> -->
<div class="container">
	
	<div class="page-header text-info">
		<c:if test="${!empty param.menu}">
			<c:choose>
				<c:when test="${param.menu=='manage'}">
					<h3>상품관리</h3>
				</c:when>
				<c:when test="${param.menu=='search'}">
					<h3>상품목록</h3>
				</c:when>
			</c:choose>
		</c:if>
	</div>
	
	<div class="row">
		
		<div class="col-md-6 text-left">
			<p class = "text-primary">
				전체 ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage } 페이지
			</p>
		</div>
		
		<div class="col-md-6 text-right">
			<form class="form-inline" name="detailForm">
				<div class="form-group">
					<select class="form-control" name="searchCondition">
						<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option> 
 						<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option> 
 						<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option> 
 					</select>
 				</div>
 				
 				<div class="form-group">
 					<label class="sr-only" for="searchKeyword">검색어</label>
 					<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어"
 								 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
 				</div>
 				
 				<button type="button" class="btn btn-default">검색</button>
 				
 				<input type="hidden" id="currentPage" name="currentPage" value=""/>
 				
 			</form>
 		</div>
 	</div>

<table class="table table-hover table-striped">
	
	<thead>
	<tr>
		<th align="center">No</th>
		<th align="left">상품명</th>
		<th align="left">가격</th>
		<th align="left">등록일</th>
		<th align="left">현재상태</th>	
		<th align="left">간략정보</th>
	</tr>
	</thead>
	
	<tbody>
		
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }"/>
		<tr>
		<td align="center">${ i }</td>
			<c:if test="${param.menu == 'manage'}">
				<td align="left">
					${product.prodName}
					<input type="hidden" name="prodNo" value="${product.prodNo}"/>
					<input type="hidden" class="tranCode" value="${product.proTranCode}"/>
				</td>
			</c:if>
			<c:if test="${param.menu=='search'}">
				<td align="left">	
					${product.prodName}
					<input type="hidden" class="prodNo" value="${product.prodNo}"/>
					<input type="hidden" class="tranCode" value="${product.proTranCode}"/>
				</td>
			</c:if>
		<td align="left">${product.price }</td>
		<td align="left">${product.regDate }</td>
		<td align="left">
		<c:if test="${param.menu == 'manage' }">
			<c:choose>
				<c:when test="${product.proTranCode.charAt(0) == '1'.charAt(0) }">
					구매완료<a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=2">배송하기</a>>
				</c:when>
				<c:when test="${product.proTranCode.charAt(0) == '2'.charAt(0) }">배송중</c:when>
				<c:when test="${product.proTranCode.charAt(0) == '3'.charAt(0) }">배송완료</c:when>
				<c:otherwise>
					판매중
				</c:otherwise>
			</c:choose>
		</c:if>
		<c:if test="${param.menu == 'search' }">
			<c:choose>
				<c:when test="${product.proTranCode == '0'}">
					판매중
				</c:when>
				<c:otherwise>
					재고없음
				</c:otherwise>
			</c:choose>
		</c:if>
		</td>
		<td align="left">
			<i class="glyphicon glyphicon-ok" id="${product.prodNo}"></i>
			<input type="hidden" value="${product.prodNo}">
		</td>
	</tr>
	</c:forEach>
	
	</tbody>
</table>

</div>			
	
	<jsp:include page="../common/pageNavigator_new.jsp"/>

</body>
</html>
