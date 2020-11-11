<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Home</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="/resources/img/apple-touch-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/img/icon/favicon.ico">
<!-- Place favicon.ico in the root directory -->

<!-- all css here -->

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/elegant-font.css">
<link rel="stylesheet" href="/resources/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="/resources/css/meanmenu.min.css">
<link rel="stylesheet" href="/resources/css/animate.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/animate-heading.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/shortcode/shortcodes.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/responsive.css">
<link rel="stylesheet" href="/resources/css/hwanhee.css">
<link rel="stylesheet" href="/resources/css/young.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/resources/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
	 <!-- session에 아이디 값이 있을 경우 변수 선언하기-->
    <c:if test="${!empty sessionScope.member}">
    	 <c:set var="member" value="${sessionScope.member}" />
   		 <c:set var="id" value="${member.id}"/>
   		 <input type="hidden" value="${id}" class="memberId"/>
    </c:if>
    
	<header>
		<!-- Header Menu Area -->
		<div class="menu-area mt-60">
			<div class="container">
				<div class="row">
			
				<!-- 로그인, 회원가입 / 로그아웃, 마이페이지 -->
					<c:set var="member" value="${sessionScope.member}" />
					<c:if test="${empty member}">
						<div class="sign-wrapper">
							<a class="sign-button" href = "mem_choice.ca">Sign-Up</a><a class="sign-button" href = "bizLogin.ca">Log-in</a> 
						</div>
					</c:if>

						<c:if test="${!empty member}">

						<div class="sign-wrapper">
							<span class="mr-10" style="color:white">안녕하세요, ${member.name} 님 </span>
							<c:if test="${member.code == 2}">
								<a class="sign-button" href="logout.ca">Log-out</a><a class="sign-button" href="memberMypage.ca">My Page</a>
							</c:if>
							<c:if test="${member.code == 3}">
								<a class="sign-button" href = "logout.ca">Log-out</a><a class="sign-button" href = "bizMypageModify.ca">My Page</a>
							</c:if> 	
						</div>
					</c:if>
					<div class="col-md-3 col-sm-12">
						<div class="logo-area text-center text-uppercase res-logo-sm">
							<a href="home.ca"><img src="/resources/img/icon/logo.png"
								alt="" /></a>
						</div>
					</div>
					<div class="col-md-9 col-sm-12">
					
						<div class="main-menu lemon-bg">
							<nav>
								<ul id="nav">
									<li><a href="home.ca">Home</a></li>

									<li>
										<c:url var="headercake" value="cakeSearch.ca">
											<c:param name="page" value="1"/>
											<c:param name="input_search" value="#"/>
											<c:param name="simple_filter" value=""/>
										</c:url>
										<a href="${headercake}">CAKE</a>
										<ul>
											<li>
												<c:url var="headercake" value="cakeSearch.ca">
													<c:param name="page" value="1"/>
													<c:param name="input_search" value="#"/>
													<c:param name="simple_filter" value=""/>
												</c:url>
												<a href="${headercake}"><i class="arrow_carrot-right"></i>모든 케이크</a>
											</li>
											<li>
												<c:url var="headercake" value="cakeSearch.ca">
													<c:param name="page" value="1"/>
													<c:param name="input_search" value="빵"/>
													<c:param name="simple_filter" value=""/>
												</c:url>
												<a href="${headercake}"><i class="arrow_carrot-right"></i>빵 케이크</a>
											</li>
											<li>
												<c:url var="headercake" value="cakeSearch.ca">
													<c:param name="page" value="1"/>
													<c:param name="input_search" value="떡"/>
													<c:param name="simple_filter" value=""/>
												</c:url>
												<a href="${headercake}"><i class="arrow_carrot-right"></i>떡 케이크</a>
											</li>
											<li>
												<c:url var="headercake" value="cakeSearch.ca">
													<c:param name="page" value="1"/>
													<c:param name="input_search" value="아이스크림"/>
													<c:param name="simple_filter" value="아이스"/>
												</c:url>
												<a href="${headercake}"><i class="arrow_carrot-right"></i>아이스크림 케이크</a>
											</li>
										</ul></li>
									<li><a href="hostinfo.ca?input_vendor_id=tous">SHOP</a>
										<ul>
											<li><a href="hostinfo.ca?input_vendor_id=tous"><i
													class="arrow_carrot-right"></i> 케이크 가게 모아보기</a></li>
										</ul></li>

									<li><a href="customlist.ca">CUSTOMIZING</a>
										<ul>
											<li><a href="customlist.ca"><i
													class="arrow_carrot-right"></i> 커스터마이징 케이크</a></li>
										</ul></li>
									
									<li><a href="notice.ca">NOTICE</a></li>
									<li><a href="homeqna.ca">Q & A</a></li>
								</ul>
							</nav>
							<!-- Product Cart -->
							<div class="menu-right-area">
								<a href="cartList.ca" class="mini-cart-icon"> <i class="icon_cart_alt"></i>
									<!-- <span>2</span> -->
								</a>
								<!-- <div class="top-cart-content">
									Cart Single
									<div class="media header-middle-checkout">
										<div class="media-left check-img">
											<a href="#"> <img alt=""
												src="/resources/img/other/cart-1.jpg">
											</a>
										</div>
										<div class="media-body checkout-content">
											<h4 class="media-heading">
												<a href="#">Men Fashion Spray</a> <span
													title="Remove This Item" class="btn-remove checkout-remove">
													<i class="fa fa-trash"></i>
												</span>
											</h4>
											<p>1 x $111.00</p>
										</div>
									</div>
									Cart Single
									Cart Single
									<div class="media header-middle-checkout">
										<div class="media-left check-img">
											<a href="#"> <img alt=""
												src="/resources/img/other/cart-2.jpg">
											</a>
										</div>
										<div class="media-body checkout-content">
											<h4 class="media-heading">
												<a href="#">Women Fashion Bag</a> <span
													title="Remove This Item" class="btn-remove checkout-remove">
													<i class="fa fa-trash"></i>
												</span>
											</h4>
											<p>3 x $125.00</p>
										</div>
									</div>
									Cart Single
									<div class="actions">
										<button type="button" title="Checkout-botton"
											class="Checkout-botton">
											<span>Checkout</span>
										</button>
									</div>
								</div> -->
							</div>
							<!-- Product Cart -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header Menu Area -->
		<!-- MOBILE-MENU-AREA START -->
		<div class="mobile-menu-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="mobile-area">
							<div class="mobile-menu">
								<nav id="mobile-nav">
									<ul id="nav">
										<li><a href="index.html">Home</a></li>

										<li><a href="shop.html">CAKE</a>
											<ul>
												<li><a href="shop.html"><i
														class="arrow_carrot-right"></i> 모든 케이크</a></li>
												<li><a href="shop-grid.html"><i
														class="arrow_carrot-right"></i> 빵 케이크</a></li>
												<li><a href="shop-list.html"><i
														class="arrow_carrot-right"></i> 떡 케이크</a></li>
												<li><a href="single-product.html"><i
														class="arrow_carrot-right"></i> 아이스크림 케이크</a></li>
											</ul></li>
										<li><a href="#">SHOP</a>
											<ul>
												<li><a href="shop.html"><i
														class="arrow_carrot-right"></i> 케이크 가게 모아보기</a></li>
											</ul></li>

										<li><a href="#">CUSTOMIZING</a>
											<ul>
												<li><a href="shop.html"><i
														class="arrow_carrot-right"></i> 커스터마이징 케이크</a></li>
											</ul></li>
										<li><a href="memberMypage.ca">MY PAGE</a></li>
										<li><a href="notice.ca">NOTICE</a></li>
										<li><a href="homeqna.ca">Q & A</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- MOBILE-MENU-AREA END  -->
		<!-- Banner Area Start -->
		<div class="banner-area pb-90 pt-160 bg-2">
			<div class="container">
				<div class="row">
					<div class="banner-content text-center text-white ptb-70">
						<h1></h1>
						<ul>
							<li></li>
							<li></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- Banner Area End -->
	</header>
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