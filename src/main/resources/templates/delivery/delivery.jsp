<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>delivery</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="img/icon/favicon.ico">



<link rel="stylesheet" href="/resources/css/eunsong.css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/elegant-font.css">
<link rel="stylesheet"
	href="/resources/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="/resources/css/meanmenu.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/animate.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/animate-heading.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/shortcode/shortcodes.css">
<link rel="stylesheet" href="/resources/css/style.css">
<script src="js/vendor/modernizr-2.8.3.min.js">
	
</script>
<style>
body {
	text-align: center; /* Quirks Mode 를 위한 가운데 정렬 */
}
td{
	padding-top: 10px !important;
	padding-bottom: 10px !important;
	text-align:center;
	margin:0 auto; 
}

th{
	padding-top: 10px !important;
	padding-bottom: 10px !important;
	text-align:center;
	margin:0 auto; 
}


</style>
</head>
<body>

	<section class="page-content-wrapper pt-100 pb-40" style="padding-top: 0px;">
		<!-- coupon-area start -->

		<div class="container">
			<div class="row">

				<!-- Page Content Wraper Area Start -->
				<section class="page-content-wrapper pt-100 pb-40"
					style="padding-top: 0px;">
					<!-- ㅇㅇㅇ -->
					<div class="checkbox-form">

						<!-- ㅇㅇㅇ
 -->

						<!-- 배송 현황 이미지 시작 -->
						<div class="delivery-img">
							<div class="testimonial-area ptb-100 bg-1"
								style="padding-top: 120px; padding-bottom: 50px; width: 100%">
								<div class="container">
									<div class="row">
										<div
											class="testimonial-gallery owl-carousel owl-theme owl-loaded owl-drag">

											<div class="owl-stage-outer">
												<div class="owl-stage"
													style="transform: translate3d(-1170px, 0px, 0px); transition: 0s; width: 3705px;">

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 배송 현황 이미지 끝-->
					
					<br>
						<!--  기본 정보 시작 -->
						<div class="derivery-area">
							<h3 style="text-align: left">배송 기본 정보</h3>
						


							<div class="col-md-6">
								<div class="review-right">

									<form action="mail.php" method="post">
										<div class="table-content table-responsive">
											<table>

												<tbody>
													<tr>
														<th class="product-thumbnail eceff8">보내는 분</th>
														<td>김은송</td>

													</tr>
													<tr>
														<th class="product-thumbnail eceff8">받는 분</th>
														<td>송지연</td>
													</tr>
													<tr>
														<th class="product-thumbnail eceff8">주소</th>
														<td>대한민국 서울시 강남구</td>

													</tr>

													<tr>
														<th class="product-thumbnail eceff8">상품정보</th>
														<td>[무료배송]알뜰 협탁 12종/4종</td>

													</tr>

													<tr>
														<th class="product-thumbnail eceff8">택배사</th>
														<td>천일택배</td>

													</tr>

													<tr>
														<th class="product-thumbnail eceff8">운송장 번호</th>
														<td>51293849047362</td>

													</tr>

												</tbody>
											</table>
										</div>
									</form>
								</div>
							</div>
						</div>


						<!--  기본 정보 끝 -->

<br>
<br>
						<!--  상세 정보 시작 -->
						<div class="derivery-area">
							<h3 style="text-align: left">배송 상세 정보</h3>
							
							<div class="col-md-6">
								<div class="review-right">
									<form action="mail.php" method="post">
										<div class="table-content table-responsive">
											<table>
												<thead>
													<tr>
														<th class="product-thumbnail eceff8">
														
														처리일시
														</th>
													
														<th class="product-thumbnail eceff8">현재위치</th>
														<th class="product-thumbnail eceff8">배송상태</th>
														<th class="product-thumbnail eceff8">배송기사 연락처</th>

													</tr>
												</thead>
												<tbody>
													<tr>
														<td>2018-02-19 21:58</td>
													
														<td>포천송우</td>
														<td>집하</td>
														<td> 031-54303729<</td>
													</tr>
													<tr>
														<td>2018-02-19 07:28</td>
												
														<td>영화배송</td>
														<td>배송중(입고)</td>
														<td>010-2200-7075</td>
													</tr>
													
												</tbody>
											</table>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!--  상세 정보 끝 -->

					<br> <br> <br> <br>
					
					
						<!-- 버튼 시작 -->
							<div class="row">
								<div class="col-md-4">
									<div class="country-button" style="margin-left: 40%; margin-right:40%;">
										<label><span class="required"></span></label>

										<div class="pink_button">
											<input type="button" value="닫기" onclick='self.close()'>
										</div>
									</div>
								</div>

							</div>


							<!-- 버튼 끝 -->
					
					
					
				</section>
			</div>
		</div>

		<!-- checkout-area end -->
	</section>


	<!-- all js here -->
	<script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/isotope.pkgd.min.js"></script>
	<script src="/resources/js/jquery.nivo.slider.js"></script>
	<script src="/resources/js/jquery.simpleLens.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/animated-heading.js"></script>
	<script src="/resources/js/price-slider.js"></script>
	<script src="/resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="/resources/js/jquery.countdown.js"></script>
	<script src="/resources/js/jquery.meanmenu.js"></script>
	<script src="/resources/js/plugins.js"></script>
	<script src="/resources/js/main.js"></script>
</body>
</html>