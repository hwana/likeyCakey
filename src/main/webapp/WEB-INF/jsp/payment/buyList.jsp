<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="buyList" value="${requestScope.buyList}" />
<c:set var="member" value="${sessionScope.member}" />
<c:set var="coBuyList" value="${requestScope.coBuyList}" />

<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>buyList</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="img/icon/favicon.ico">
<!-- Place favicon.ico in the root directory -->


<!-- all css here -->
<link rel="stylesheet" href="/resources/css/eunsong.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/elegant-font.css">
<link rel="stylesheet"
	href="/resources/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="/resources/css/meanmenu.min.css">
<link rel="stylesheet" href="/resources/css/animate.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/animate-heading.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/shortcode/shortcodes.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/responsive.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/resources/js/vendor/modernizr-2.8.3.min.js"></script>
<!-- 추가해야하는 js 벤더 -->
<script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>
<!-- 추가해야하는 js 벤더 끝-->
</head>

<style>


</style>
<body class="other-page">




	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Header Area Start -->
	<header></header>
	
		<c:if test="${fn:contains(pageContext.request.requestURL,'buyList')}">
			<%@ include file="../default/header.jsp"%>
			 <section class="page-content-wrapper pt-100 pb-40">
		
				<div class="checkout-area">
					<div class="container">
						<div class="row">
							<form action="#">
		</c:if>
	<!-- Header Area End -->
	<!-- Page Content Wraper Area Start -->

						<div class="checkbox-form">
<c:if test="${fn:contains(pageContext.request.requestURL,'buyList')}">
					<!-- 결제 방법 창 -->
					<div class="row">
								<h2 style=" width:20%; display: inline-block; font-weight:500;">구매 내역</h2>
								<h3></h3>
							
								
					</div>
					<!-- 결제 방법 창 -->
			<br><br>
							<!-- 구매 내역 시작 -->
			</c:if>
							<div class="row">
							<c:if test="${fn:contains(pageContext.request.requestURL,'buyList')}">
								<h3>구매 내역 정보</h3>
								</c:if>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<form action="#">
									
											
											
											
											
											<!-- 구매 내역 2 시작 -->
										<div class="table-content table-responsive">
										
											<table>
												<thead>
													<tr>
														<th class="product-thumbnail eceff8" colspan="5">구매 내역</th>
														
														<th class="product-subtotal eceff8">유효기한/배송상태</th>
														<th class="product-remove eceff8">관리</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="o" items="${buyList}" varStatus="status">
													<tr>
														<td ><a href="#"><img
																src="/resources/img/product/3.jpg" alt=""></a></td>
														<td class="product-name">
															<p style="font-weight: bold;">${o.mbBizName}</p>
															<span>${o.pbName}(구매수량 ${o.poCnt}개)</span>
															<br>
															상품 문구 : ${o.poText}
															<!-- 상품 문구 변경 버튼 시작 -->
														<c:if test="${o.s_num <4 }">
														<c:set var="pNum" scope="request" value="${o.poNum}"/>
														<div class="pink_button">
															<input type="button" value="상품문구 변경" 
															onclick='window.open("/poTextUpdatetView.ca?poNum=${o.poNum}","상품 문구 변경","width=500,height=300,location=no,status=no,scrollbars=yes")'
															style="height:20px; width:120px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														</c:if>
														<!-- 상품 문구 변경 버튼 끝 -->
															</td>
														
														<td >
														<p style="font-weight: bold;">주문 날짜</p>
															<span>
															<fmt:formatDate value="${o.poDate}" pattern="yyyy-MM-dd HH:mm" />
															</span>
														</td>
														<td style=" width:10%">
															<p style="font-weight: bold;">총 금액</p>
															<span>${o.poPrice+o.poBizDelivery}원</span>
														
														</td>
														<td>
														<p style="font-weight: bold;">예약 날짜</p>
															<span>
															<fmt:formatDate value="${o.poBookDate}" pattern="yyyy-MM-dd HH:mm" />
															
														</span>
													
														</td>
														<td class="product-price" ><span>
														${o.s_status}</span>
														<!-- 배송추적 버튼 시작 -->
														<c:if test="${o.s_num eq 5 }">
														<div class="pink_button">
															<input type="button" value="배송 추적" 
															onclick='window.open("/delivery.ca?poNum=${o.poNum}","배송","width=600,height=650,location=no,status=no,scrollbars=yes")'
															style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														</c:if>
														<!-- 배송 추적 버튼 끝 -->
														</td>
														<td class="product-subtotal">
														
														<!-- 구매취소 버튼 시작 -->
														<c:if test="${o.s_num < 4}">
														<div class="pink_button">
															<input class="hidden" id="poNum" value="${o.poNum}">
															<input type="button" value="구매취소" 
															id = "orderDelete"
															style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														</c:if>
														<!-- 구매취소 버튼 끝 -->
														<!-- 후기 작성 버튼 시작 -->
														<c:if test="${o.s_num == 11 || o.s_num ==6}">
														<div class="pink_button">
															<input class="hidden" id="poNum" value="${o.poNum}">
															<input type="button" value="후기 작성" 
															id = "orderDelete"
															style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														</c:if>
														<!-- 후기작성 버튼 끝 -->
														</td>
													</tr>
													<tr style="border-bottom:solid grey 2px;">
														<td class="product-thumbnail">
														
														<p style="font-weight: bold;">주문번호</p>
															<span>${o.poNum}2034532</span>
														
														
														<td colspan="6">배송지 정보 : ${o.recName}, (${o.recPost})${o.recBasicAddr} ${o.recDetailAddr}<br>
														배송 메모 : ${o.recMemo}
														<br>
														<!-- 배송지 수정 버튼 시작 -->
														<c:if test="${o.s_num < 5 && o.bizDeliveryYN eq 'Y'}">
														<div class="pink_button">
															<input type="button" value="배송지 수정" 
															onclick='window.open("/recPostUpdateView.ca?poNum=${o.poNum}","배송지 수정","width=600,height=650,location=no,status=no,scrollbars=yes")'
															style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														</c:if>
														<!-- 배송지 수정 버튼 끝 -->
												
												</div>
												
														</td>
													</tr>
													</c:forEach>
													
													<c:forEach var="co" items="${coBuyList}" varStatus="status">
													<tr>
														<td ><a href="#"><img
																src="/resources/img/product/3.jpg" alt=""></a></td>
														<td class="product-name">
															<p style="font-weight: bold;">${co.mbBizName}</p>
															<span>${co.pbName}(구매수량 ${co.poCnt}개)</span>
															<br>
															상품 문구 : ${co.poText}
															<!-- 상품 문구 변경 버튼 시작 -->
														<c:if test="${co.s_num <4 }">
														<c:set var="pNum" scope="request" value="${co.poNum}"/>
														<div class="pink_button">
															<input type="button" value="상품문구 변경" 
															onclick='window.open("/poTextUpdatetView.ca?poNum=${co.poNum}","상품 문구 변경","width=500,height=300,location=no,status=no,scrollbars=yes")'
															style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														</c:if>
														<!-- 상품 문구 변경 버튼 끝 -->
															</td>
														
														<td >
														<p style="font-weight: bold;">주문 날짜</p>
															<span>
															<fmt:formatDate value="${co.poDate}" pattern="yyyy-MM-dd HH:mm" />
															</span>
														</td>
														<td style=" width:10%">
															<p style="font-weight: bold;">총 금액</p>
															<span>${co.poPrice+co.poBizDelivery}원</span>
														
														</td>
														<td>
														<p style="font-weight: bold;">예약 날짜</p>
															<span>
															<fmt:formatDate value="${co.poBookDate}" pattern="yyyy-MM-dd HH:mm" />
															</span>
													
														</td>
														<td class="product-price" ><span>
														${co.s_status}</span>
														<!-- 배송추적 버튼 시작 -->
														<c:if test="${co.s_num eq 5 }">
														<div class="pink_button">
															<input type="button" value="배송 추적" 
															onclick='window.open("/delivery.ca?poNum=${co.poNum}","배송","width=600,height=650,location=no,status=no,scrollbars=yes")'
															style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														</c:if>
														<!-- 배송 추적 버튼 끝 -->
														</td>
														<td class="product-subtotal">
														
														<!-- 구매취소 버튼 시작 -->
														<c:if test="${co.s_num < 4}">
														<div class="pink_button">
															<input class="hidden" id="poNum" value="${co.poNum}">
															<input type="button" value="구매취소" 
															id = "orderDelete"
															style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														</c:if>
														<!-- 구매취소 버튼 끝 -->
														<!-- 후기 작성 버튼 시작 -->
														<c:if test="${co.s_num == 11 || co.s_num ==6}">
														<div class="pink_button">
															<input class="hidden" id="poNum" value="${co.poNum}">
															<input type="button" value="후기 작성" 
															id = "orderDelete"
															style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														</c:if>
														<!-- 후기작성 버튼 끝 -->
														</td>
													</tr>
													<tr style="border-bottom:solid grey 2px;">
														<td class="product-thumbnail">
														
														<p style="font-weight: bold;">주문번호</p>
															<span>${co.poNum}2034532</span>
														
														
														<td colspan="6">배송지 정보 : ${co.recName}, (${co.recPost})${co.recBasicAddr} ${co.recDetailAddr}<br>
														배송 메모 : ${co.recMemo}
														<br>
														<!-- 배송지 수정 버튼 시작 -->
														<c:if test="${co.s_num < 5 && co.bizDeliveryYN eq 'Y'}">
														<div class="pink_button">
															<input type="button" value="배송지 수정" 
															onclick='window.open("/recPostUpdateView.ca?poNum=${co.poNum}","배송지 수정","width=600,height=650,location=no,status=no,scrollbars=yes")'
															style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														</c:if>
														<!-- 배송지 수정 버튼 끝 -->
												
												</div>
												
														</td>
													</tr>
													</c:forEach>
													
													
													
												</tbody>
											</table>
										</div>
											<!-- 구매 내역 2 끝 -->
									
									</form>
								</div>
							</div>
							<!-- 장바구니 끝 -->
							<br> <br> <br>
							

							<br> <br> <br>
						

						</div>
<c:if test="${fn:contains(pageContext.request.requestURL,'buyList')}">
					 </form>
				</div>
			</div>
		</div>
	</section>
		<%@ include file="../default/footer.jsp"%>
</c:if>


	<!-- all js here -->
	<script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/isotope.pkgd.min.js"></script>
	<script src="/resources/js/jquery.nivo.slider.js"></script>
	<script src="/resources/js/price-slider.js"></script>
	<script src="/resources/js/jquery.simpleLens.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/animated-heading.js"></script>
	<script src="/resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="/resources/js/jquery.countdown.js"></script>
	<script src="/resources/js/jquery.meanmenu.js"></script>
	<script src="/resources/js/plugins.js"></script>
	<script src="/resources/js/main.js"></script>
		
		<script type="text/javascript">
		$(function() {
			//1.구매 취소//
			$("#orderDelete").click(function() {
								$.ajax({
									url : "poDelete.ca",
									type : "post",
									data : {
										poNum : $(this).closest("tr").find("#poNum").val()
									},
									success : function(value) {//
										if (value == "ok") {
											alert("구매 취소에 성공했습니다.");
											location.reload();
										} else {
											alert("구매 취소에 실패했습니다.");
										}
									},
									error : function(value) {
										alert("잘못 입력하셨습니다." + value);
									}
								});//AJAX
								return false;

							}); //click
			//1.구매 취소 끝//
		});
	</script>
</body>
</html>

