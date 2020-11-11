<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="payment" value="${requestScope.payment}" />
<c:set var="member" value="${sessionScope.member}" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>CheckoutSuccess</title>
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
</head>

<style>

</style>
<body class="other-page">




	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Header Area Start -->
	
	<%@ include file="../default/header.jsp"%>
	<!-- Header Area End -->
	<!-- Page Content Wraper Area Start -->
	<section class="page-content-wrapper pt-100 pb-40">

		<!-- checkout-area start -->
		<div class="checkout-area">
			<div class="container">
				<div class="row">
					<form action="#">

						<div class="checkbox-form">

					<!-- 주문 완료 창 시작 -->
					<div class="row">
								<h2 style=" width:20%; display: inline-block; font-weight:500;">주문 완료</h2>
								
								<div>
								<h5 class="text_right"  style="color:#9bcaba">&nbsp;03 주문 완료</h5>
								<h5 class="text_right">&nbsp;02 주문/결제 > </h5>
								<h5 class="text_right">01 카트 > </h5>
								<br><h3></h3>
								</div>
							
								
					</div>
					<!-- 주문 완료 창 끝-->
			<br><br>
							<h4 style="text-align:center; font-weight:500;">주문 결제가 정상적으로 접수되었습니다.</h4>
							<h5 style="text-align:center;">자세한 구매내역 확인 및 배송지 변경 등의 서비스는 마이페이지>구매내역에서 확인하실 수 있습니다.</h5>
							<br> <br> <br>
							
							
							
							<!-- 결제 완료 정보 창 시작 -->
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<form action="#">
										<div class="table-content table-responsive">
											<table>
												
												<tbody>
												
													<tr>
														<td class="product-thumbnail eceff8">주문번호</td>
														<td class="product-name eceff8">
															총 결제 금액
														</td>

													</tr>
													<tr>
														<td rowspan="3" class="product-thumbnail">${payment.imp_uid}</td>
														<td rowspan="2" class="product-thumbnail">${payment.pay_price}원</td>
													</tr>
													<tr></tr>
													<tr>
														<td class="product-thumbnail">결제 방법 : ${payment.pay_method}</td>
													</tr>
													
												</tbody>
											</table>
										</div>

									</form>
								</div>
							</div>
							<!-- 결제 완료 정보 끝-->
							
							<br>
							<!-- 무통장 결제 확인 창 시작-->
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<form action="#">
										<div class="table-content table-responsive">
											<table>
												
												<tbody>
												
		
													<tr>
														<td class="product-thumbnail eceff8">예금주</td>
														<td class="">${member.name}</td>
													</tr>
													<tr>
														<td class="product-thumbnail eceff8">입금금액</td>
														<td class="product-name">${payment.pay_price}원</td>

													</tr>
													<tr>
														<td class="product-thumbnail eceff8">결제 일시</td>
														<td class="product-name">
														<fmt:formatDate value="${payment.pay_date}" pattern="yyyy-MM-dd HH:mm" />
														</td>

													</tr>
													
												</tbody>
											</table>
										</div>

									</form>
								</div>
							</div>
							<!-- (결제 정보 끝) -->
				
	
							<br> <br> <br>
								<!-- 버튼 시작 -->
							<div class="row">
								<div class="col-md-4" style="width:20%; margin-left: 30%">
									<div class="country-button" style="">
										<label><span class="required"></span></label>

										<div class="pink_button">
											<input type="button" value="쇼핑 계속하기" onclick="location.href='home.ca'">
										</div>
									</div>
								</div>

								<div class="col-md-4" style="width:20%;">
									<div class="country-button" style="">
										<label><span class="required"></span></label>
										<div class="pink_button">
											<input type="button" value="구매내역보기" onclick='window.location.href="/buyList.ca"'>
										</div>
									</div>

								</div>

							</div>


							<!-- 버튼 끝 -->
						</div>

					</form>
				</div>
			</div>
		</div>
		<!-- checkout-area end -->
	</section>
	<!-- Page Content Wraper Area End -->
	<!-- Fotter Area Start -->
	<footer>
		<%@ include file="../default/footer.jsp"%>
	</footer>
	<!-- Fotter Area End -->

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
</body>
</html>

