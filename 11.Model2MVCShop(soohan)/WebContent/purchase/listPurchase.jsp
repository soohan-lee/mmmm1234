 <%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage);
		$("form").attr("method","POST").attr("action","/purchase/listPurchase").submit();
	}
	$(function(){
		$(".ct_list_pop td:nth-child(1)").on("click",function(){
			var tranNo = $(this).children().val();
			alert(tranNo)
			$.ajax(
					{
						url:"/purchase/json/getPurchase/"+tranNo,
						method:"GET",
						dataType:"json",
						headers:{
							"Accept":"application/json",
							"Context-Type":"application/json"
						},
						success:function(JSONData,status) {
							var displayValue = "<h3>"
														+"��  ǰ  ��  ȣ:"+JSONData.purchaseProd.prodNo+"<br/>"
														+"������ ���̵�:"+JSONData.buyer.userId+"<br/>"
														+"��  ��  ��  ��:"+JSONData.pamentOption+"<br/>"
														+"������ ��  ��:"+JSONData.receiverName+"<br/>"
														+"������ ��  ȣ:"+JSONData.receiverPhone+"<br/>"
														+"������ ��  ��:"+JSONData.divyAddr+"<br/>"
														+"���ſ�û����:"+JSONData.divyRequest+"<br/>"
														+"���  �����:"+JSONData.divyDate+"<br/>"
														+"��    ��    ��:"+JSONData.orderDate+"<br/>"
														+"</h3>";
							$("h3").remove();
							$("#"+tranNo+"").html(displayValue);
						}
					
					});
		});
	});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<!-- <form name="detailForm" action="/purchase/listPurchase" method="post"> -->
<form name="detailForm">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${resultPage.totalCount } �Ǽ�, ����${resultPage.currentPage }������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }"/>
		<tr class="ct_list_pop">
			<td align="center">
<%-- 				<a href="/purchase/getPurchase?tranNo=${purchase.tranNo }">${ i }</a> --%>
					${ i }<input type="hidden" name="tranNo" value="${purchase.tranNo}"/>
			</td>
		<td></td>
		<td align="left">
			<a href="/user/getUser?userId=${purchase.buyer.userId }">${purchase.buyer.userId }</a>
		</td>
		<td></td>
		<td align="left">${purchase.receiverName }</td>
		<td></td>
		<td align="left">${purchase.receiverPhone }</td>
		<td></td>
		<td align="left">
			<c:choose>
				<c:when test="${purchase.tranCode.charAt(0) == '3'.charAt(0) }">��ۿϷ�<td></c:when>
				<c:when test="${purchase.tranCode.charAt(0) == '2'.charAt(0) }">>�����<td></c:when>
				<c:otherwise>���ſϷ�<td></c:otherwise>
			</c:choose> 
		</td>
		<td></td>
		<td align="left">
			<c:choose>
				<c:when test="${purchase.tranCode.charAt(0)=='3'.charAt(0) }"/>
				<c:when test="${purchase.tranCode.charAt(0)=='2'.charAt(0) }">
				<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo }&tranCode=3">���ǵ���</a>
				</c:when>
			</c:choose>
		</td>
		</tr>
		<tr>
		<td id="${purchase.tranNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
		</c:forEach>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
			<jsp:include page="../common/pageNavigator.jsp"/>
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>