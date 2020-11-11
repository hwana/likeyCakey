<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="list" value="${requestScope.list}" />
<c:set var="member" value="${sessionScope.member}" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>HostInfo</title>
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
.th {
	padding: 10px 2px;
}

td{
	padding-top: 5px !important;
	padding-bottom: 5px !important;
	text-align:center;
	margin:0 auto; 
}


</style>
<body class="other-page">




	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Header Area Start -->
	<header></header>
	<!-- Header Area End -->
	<!-- Page Content Wraper Area Start -->
	<section class="page-content-wrapper pt-100 pb-40">

		<!-- checkout-area start -->
		<div class="checkout-area">
			<div class="container">
				<div class="row">
					<form action="#">

						<div class="checkbox-form">

							<!-- 무슨 창인지 설명하는 부분 -->
							<div class="row">
								<h2 style="width: 20%; display: inline-block; font-weight: 500;">사업장 정보</h2>
								<h3></h3>


							</div>
							<!-- 무슨 창인지 설명하는 부분-->
							<br> <br>
							<!-- 회원 정보 리스트 시작 -->
							<div class="row">
								<h3>사업장 정보</h3>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<form action="#">





										<!-- 회원 정보 리스트 시작 -->
										<div class="table-content table-responsive">

											<table>
												<thead>
													<tr>
														<th class="product-thumbnail eceff8"><input
															type="checkbox" style="height: 12px; width:20px;"></th>
														<th class="product-thumbnail eceff8">번호</th>
														<th class="product-thumbnail eceff8">회원 id</th>
														<th class="product-thumbnail eceff8">가게이름</th>

														<th class="product-thumbnail eceff8">가게 전화번호</th>
														<th class="product-thumbnail eceff8">사업자 등록번호</th>
														<th class="product-thumbnail eceff8">업체 이메일</th>
														<th class="product-thumbnail eceff8">배송비</th>
														<th class="product-thumbnail eceff8">담당자 이름</th>
														<th class="product-remove eceff8" style="width:50px;">수정</th>
													</tr>
												</thead>
												<tbody>
												
												<c:forEach var="b" items="${list}" varStatus="status">
												
													<!-- 회원 1 시작 -->
													<tr>
														<td><input type="checkbox" style="height: 12px; width:20px"></td>
														<td>1
														</td>

														<td><input type="text" 
															class="text" value="${b.id}"
															></td>
														<td><input type="text"
															placeholder="" class="text" value="${b.bizName}"></td>
														<td><input type="text"
															placeholder="" class="text" value="${b.bizPN}"></td>
														<td><input type="text"
															placeholder="" class="text" value="${b.bizNum}">
														</td>
														<td><input type="text"
															placeholder="" class="text" value="${member.email}">

														</td>
														<td><input type="text"
															placeholder="" class="text" value="${b.bizDeliveryYN}">

														</td>
														<td><input type="text"
															placeholder="" class="text" value="${b.masterName}">

														</td>
														<td>
															<div class="buttons-cart" style="margin-bottom: 0px;">
																<div class="pink_button small_button"
																	>


																	<a href="#">수정</a>
																</div>
															</div>
														</td>

													</tr>
													<!--  회원 1 끝 -->
													
													</c:forEach>




												</tbody>
											</table>
										</div>


									</form>
								</div>
							</div>
							<!-- 회원 정보 보기끝 -->
							<br> <br> <br> <br> <br> <br>

							<!-- 버튼 시작 -->
							<div class="row">
								<div class="col-md-4" style="width:20%; margin-left:30%">
									<div class="country-button" style="">
										<label><span class="required"></span></label>

										<div class="pink_button">
											<input type="submit" value="선택한 사업장 삭제하기">
										</div>
									</div>
								</div>

								<div class="col-md-4" style="width:20%;">
									<div class="country-button" style="">
										<label><span class="required"></span></label>
										<div class="pink_button">
											<input type="submit" value="전체 수정하기">
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
		<!-- Footer Top Area End -->
		<div class="fotter-area dark-gray-bg ptb-100">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-4 col-xs-12">
						<div class="address-area res-mb-sm-30">
							<a href="/resources/index.html">shopzon</a>
							<p>Lorem ipsum dolor sit amet, consemi cteta dipisi cing
								elit, sed do eiusmod tempor.</p>
							<div class="contact-social mt-40">
								<ul>
									<li><a href="#" class="social_facebook "></a></li>
									<li><a href="#" class="social_twitter "></a></li>
									<li><a href="#" class="social_googleplus"></a></li>
									<li><a href="#" class="social_linkedin "></a></li>
									<li><a href="#" class="social_instagram "></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-4 col-xs-12 xs-res-mrbtm">
						<div class="footer-menu res-mb-sm-30">
							<h4>MY ACCOUNT</h4>
							<ul>
								<li><a href="#">FAQs</a></li>
								<li><a href="#">Payments</a></li>
								<li><a href="#">Track Your Order</a></li>
								<li><a href="#">Return Polcy</a></li>
								<li><a href="#">Warranty</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 hidden-sm hidden-xs">
						<div class="footer-menu">
							<h4>SHOP GUIDE</h4>
							<ul>
								<li><a href="#">Hot Sale</a></li>
								<li><a href="#">Best Sellar</a></li>
								<li><a href="#">Suppliers</a></li>
								<li><a href="#">Our Store</a></li>
								<li><a href="#">Deal of The Day</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-4 col-xs-12 xs-res-mrbtm">
						<div class="footer-menu">
							<h4>CONTACT INFO</h4>
							<div class="contact-details">
								<ul>
									<li><span class="icon_pin"></span>
										<p>Lusmod tempor incididunt</p></li>
									<li><span class="icon_mail"></span>
										<p>Lusmod incidiunt wesbvu</p></li>
									<li><span class="icon_phone "></span>
										<p>(256) 987 654 321</p></li>
									<li><span class="icon_clock_alt"></span>
										<p>8.00 am-6.00 pm</p></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer Top Area End -->
		<!-- Footer Bottom Area Start -->
		<div class="footer-bottom-area black-bg">
			<div class="container">
				<div class="row ">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<p>
							Copyright &copy; 2017.Company name All rights reserved.More
							Templates <a href="http://www.cssmoban.com/" target="_blank"
								title="模板之家">模板之家</a> - Collect from <a
								href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a><a
								target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
						</p>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<img src="/resources/img/icon/payment.png" alt="" />
					</div>
				</div>
			</div>
		</div>
		<!-- Footer Bottom Area End -->
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

