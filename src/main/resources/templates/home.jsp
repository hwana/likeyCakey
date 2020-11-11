<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Home</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- naver login api -->
		<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

		
        <link rel="apple-touch-icon" href="/resources/img/apple-touch-icon.png">
		<!-- <link rel="shortcut icon" type="/resources/image/x-icon" href="/resources/img/icon/favicon.ico"> -->
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
       	<link rel="stylesheet" href="/resources/css/young.css">
        <script src="/resources/js/vendor/modernizr-2.8.3.min.js"></script>
    
    <script type="text/javascript" src="/resources/js/jquery-3.2.1.min.js"></script>
    <script src="/resources/js/na.js"></script>
    
    <script type="text/javascript">
    $(function() {
    	
    	$.ajax({
    		url : "top3List.ca",
    		type : "get",
    		dataType : "json",
    		success : function(data) {
    			// 객체를 문자열로 변환
    			var jsonStr = JSON.stringify(data);
    			
    			// 문자열을 배열 객체로 바꿈
    			var json = JSON.parse(jsonStr); 
    			
    			var values = $("#top3-list").html();
    			
    			for( var i in json.list) {
    				values += "<div class='col-md-4 col-sm-4 col-xs-12 res-mb-25'>"
						   +  "<div class='cate-bnr-sngle'>"
    					   +  "<img src='/resources/img/product/" + json.list[i].pImg + ".jpg'>" 
    					   +  "<div class='cate-content text-center'>"
    					   +  "<h6>" + decodeURIComponent(json.list[i].pName) + "</h6>"
    					   +  "<a href='detail.ca?pbNum=" + json.list[i].pbNum + "'>상품 보러가기</a>"
    					   +  "</div>"
    					   +  "</div>"
    					   +  "</div>";
    				
    			}
    			$("#top3-list").html(values);
    		},
    		error : function(request,status,error) {
    			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
	  	});
    	
    
    });
    </script>
    
    
    </head>
    <body>
    
    <!-- session에 아이디 값이 있을 경우 변수 선언하기-->
    <c:if test="${!empty sessionScope.member}">
    	 <c:set var="member" value="${sessionScope.member}" />
   		 <c:set var="id" value="${member.id}"/>
   		 <input type="hidden" value="${id}" class="memberId"/>
    </c:if>
    
	<!--현재 페이지 주소 값 currentPage 변수에 저장 -->    
    <c:set var="currentPage" value="${pageContext.request.requestURL}"/>
    <input type="hidden" value="${currentPage}" class="currentPage"/>
    
    	<!-- Header Area Start -->
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
							<c:if test="${member.code == 1}">
								<a class="sign-button" href="logout.ca">Log-out</a>
								<a class="sign-button" href="adminMemberList.ca">Member Page</a>
							</c:if>
							<c:if test="${member.code == 2}">
								<a class="sign-button" href="logout.ca">Log-out</a><a class="sign-button" href="memberMypage.ca">My Page</a>
							</c:if>
							<c:if test="${member.code == 3}">
								<a class="sign-button" href = "logout.ca">Log-out</a><a class="sign-button" href = "bizMypageModify.ca">My Page</a>
							</c:if> 	
						</div>
					</c:if>

					<div class="col-md-3 col-sm-12">
						<div class="logo-area text-center text-uppercase">
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
											<li><a href="hostpage.ca"><i
													class="arrow_carrot-right"></i> 케이크 가게 모아보기</a></li>
										</ul></li>

									<li><a href="customlist.ca">CUSTOMIZING</a>
										<ul>
											<li><a href="hostpage.ca"><i
													class="arrow_carrot-right"></i> 커스터마이징 케이크</a></li>
										</ul></li>
									
									<!-- 세션에 멤버 존재 > 마이페이지 > 코드분류에 따라 일반 및 사업자로 분류 / 세션에 멤버 비존재 > 가입 -->
									<c:if test="${empty sessionScope.member }">
										<li><a href="mem_choice.ca">JOIN</a></li>
									</c:if>
									<c:if test="${!empty sessionScope.member }">
										<c:if test="${member.code} == 2">
											<li><a href="memberMypage.ca">MY PAGE</a></li>
										</c:if>
										<c:if test="${member.code} == 3">
											<li><a href="bizMypageModify.ca">BIZ PAGE</a></li>
										</c:if>
									</c:if>
								
									<li><a href="notice.ca">NOTICE</a></li>
									<li><a href="homeqna.ca">Q &amp; A</a></li>
								</ul>
							</nav>
							<!-- Product Cart -->
							<div class="menu-right-area">
								<a href="cartList.ca" class="mini-cart-icon"> <i class="icon_cart_alt"></i>
								<!-- 	<span>2</span> -->
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
		<!-- Header Slider Area -->
		<div class="slider-area">
			<div class="bend niceties preview">
				<div id="ensign-nivoslider" class="slides">
					<img src="/resources/img/slider/1.jpg" alt=""
						title="#slider-direction-1" />
				</div>
				<!-- direction 1 -->
				<div id="slider-direction-1" class="slider-direction">
					<div class="slider-content text-center s-tb slider-1">
						<div class="title-container s-tb-c title-compress">
							<h2 class="title2">
								<span class="NanumGothicBold">어떤 케이크</span>가 필요하세요?
							</h2>

							<div class="input_wrap">
								<form id="user_input" name="user_input" action="cakeSearch.ca">
									<input type="text" id="input_search" name="input_search" class="_query"
										maxlength="40" value="" placeholder="초코 케이크"/> 
									<a href="javascript:{}" onclick="document.getElementById('user_input').submit();"><i class="fa fa-search" aria-hidden="true"></i></a>
								</form>
							</div>

							<p class="main_info NanumGothic">
								<i class="fa fa-info"></i><strong> 케이크 종류, 브랜드명 </strong>을
								검색해보세요.
							</p>
						</div>
					</div>
				</div>
			</div>
			</div>
			<!-- Header Slider Area -->
			<!-- MOBILE-MENU-AREA START --> 
			<div class="mobile-menu-area">
				<div class="container">
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="mobile-area">		
								<div class="mobile-menu">
									<nav id="mobile-nav">
										<ul>
											<li><a href="index.html">Home </a>
												<ul>
													<li><a href="index.html">Home Two</a></li>
													<li><a href="index-3.html">Home Three</a></li>
													<li><a href="index-4.html">Home Four</a></li>
												</ul>
											</li>
											<li><a href="about.html"> About Us </a></li>
											<li><a href="shop.html">SHOP</a>
												<ul>
													<li><a href="shop.html">Shop</a></li>
													<li><a href="shop-grid.html"> Shop Grid</a></li>
													<li><a href="shop-list.html"> Shop List</a></li>
													<li><a href="single-product.html">Single Product</a></li>
												</ul>
											</li>
											<li><a href="blog.html">Blog</a></li>
											<li><a href="blog-details.html">Blog Details</a></li>
											<li><a href="#">PAGES</a>
												<ul>
													<li><a href="checkout.html">Checkout</a></li>
													<li><a href="cart.html">Cart</a></li>
													<li><a href="account.html">Account</a></li>
													<li><a href="wishlist.html">Wishlist</a></li>
													<li><a href="blog-details.html">Blog</a></li>
													<li><a href="login.html">Login</a></li>
												</ul>
											</li>
											<li><a href="portfolio.html">Portfolio</a></li>
											<li><a href="404.html">404 Error</a></li>
											<li><a href="contact.html">Contact</a></li>
										</ul>
									</nav>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- MOBILE-MENU-AREA END  -->
		</header>
        <!-- Header Area End -->
        <!-- Page Content Wraper Area Start -->
		<div class="page-content-wrapper wrapper-white">
			<!-- Category Banner Area Start -->
			<div class="section-titel style-two text-center text-uppercase margin-top">
					<h3 style="font-family: 'Open Sans', sans-serif;">TOP 3</h3>
				</div>
			<section class="category-banner pb-65 pt-50">
				<div class="container">
					<div class="row" id="top3-list">
						
					</div>
				</div>
			</section>
			</div>
			<!-- Category Banner Area End -->
			

			<!-- 오늘의 상품 start -->
			<!-- 변수 설정  -->
			<c:set var="todaysCake" value="${requestScope.todaysCake}"/>
			<c:set var="todaysBiz" value="${requestScope.todaysBiz}"/>
			<!-- 오늘 날짜 구하기  -->
			<c:set var="now" value="<%=new java.util.Date(new java.util.Date().getTime() + 60 * 60 * 24 * 1000)%>" />
			<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd" /></c:set> 
			
			<section class="deal-month-area ptb-100 dark-gray-bg">
				<!-- SECTION TITEL -->
				<div class="section-titel text-center mb-85 text-uppercase">
					<h3>오늘의 상품</h3>
				</div>
				<!-- SECTION TITEL -->
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-sm-6 col-xs-12 res-mb-25">
							<div class="deal-month-left">
								<img src="/resources/img/product/${todaysCake.pImg}.png" alt="" />
							</div>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="deal-month-right white-bg p-20">
								<span class="titel">${todaysBiz.bizName }</span>
								<div class="main-content">
									<h2><a href="./detail.ca/${todaysCake.pbNum }">${todaysCake.pName}</a></h2>
									<h4><fmt:formatNumber value="${todaysCake.pPrice}" pattern="\#,###"/></h4>
									<p>${todaysCake.pbMiniContent }</p>
									<div class="count-down-area">
										<div class="timer default-bg">
											<div data-countdown="${sysYear}"></div>
										</div> 
									</div>
									<div class="deal-btn mt-40">
										<a href="#">add to cart</a>
										<span class="titel f-right"><a href="#">VIEW DETAIL</a></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>			
			
	<!-- Product Tab Area Start -->
	<section class="product-tab-area pt-90 pb-50">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div
						class="tab-menu section-titel style-two text-center text-uppercase">
						<ul>
							<li class="active"><a data-toggle="tab" href="#arrival">new arrival </a></li>
							<li><a data-toggle="tab" href="#saler">Best seller</a></li>
							<li><a data-toggle="tab" href="#tranding">Best likey</a></li>
						</ul>
					</div>
				</div>
				<div class="tab-content">
				
				
				
				
<!-- NEW ARRIVAL 시작 -->
				<div id="arrival" class="tab-pane fade in active">
				
				<c:set var="newArrivalAddr" value="${requestScope.newArrivalAddr}"/>
			
				<!-- 반복문 시작 -->
				<c:forEach var="newArrival" items="${requestScope.newArrivalList}" varStatus="status">
						<div class="col-md-4 col-sm-6">
							<div class="single-product style-two mb-50">
								<div class="single-img">
									<a href="detail.ca?pbNum=${newArrival.pbNum}"><img src="/resources/img/product/${newArrival.pImg}.jpg" alt="" /></a> 
							 
							 <!-- 당일구매여부에 따라 당일 마크 부착  -->
							 <c:if test="${newArrival.pbYN eq 'Y'}">
									<span class="pro-level">당일</span>
							 </c:if> 
							 
									<div class="hover-content text-center" id="pbNumWrap">
										<input type="hidden" id="pbNum" value="${newArrival.pbNum}" >
										<ul>
											<li></li>
											<li></li>
											<c:choose>
												<%-- memberLikeList가 비어있을 때 --%>
												<c:when test="${empty requestScope.memberLikeList}">
													<%-- 빈 하트 출력  --%>
													<li><a class="heart fa fa-heart-o"></a></li>
												</c:when>
												<c:otherwise>
													<%-- 회원의 좋아요 리스트에 있는 번호와 케이크 번호 비교 --%>
													<c:set var="doneLoop" value="false"/>
													<c:forEach var="memberLike" items="${requestScope.memberLikeList}" varStatus="status">
														<%-- 리스트에 있는 번호와 일치하면 --%>
														<%-- <c:out value="${memberLike.pbNum},${newArrival.pbNum}"/> --%>
															<c:if test="${not doneLoop}">
																<c:choose>
																	<c:when test="${memberLike.pbNum eq newArrival.pbNum}">
																		<%-- 꽉 찬 하트 출력 --%>
																		<c:set var="heartSelect" value="fa-heart" />
																		<c:set var="doneLoop" value="true" />
																	</c:when>
																	<c:otherwise>
																		<c:set var="heartSelect" value="fa-heart-o" />
																	</c:otherwise>
																</c:choose>
															</c:if>
														</c:forEach>
														<li><a class="heart fa ${heartSelect}"></a></li>
												</c:otherwise>
											</c:choose>
											
										</ul>
									</div>
								</div>
								<div class="young-product-details mt-20">
									<h4>
										<a href="detail.ca?pbNum=${newArrival.pbNum}">${newArrival.pName}</a>
									</h4>
									<div class="young-product-details-tag">
										<i class="fa fa-map-marker"></i> <span
											class="young-product-details-tag-place">${newArrivalAddr[status.index]}</span> <i
											class="fa fa-tag"></i> <span
											class="young-product-details-tag-place-detail">${newArrival.pbTag}</span> <!-- <span
											class="young-product-details-tag-place-detail">#마카롱이라구?</span>
										<span class="young-product-details-tag-place-detail">#말도안돼</span> -->
									</div>
									<div class="young-product-details-price">
										<span><fmt:formatNumber value="${newArrival.pPrice}" pattern="#,###" type="number"/>원</span> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 반복문 끝 -->
					</div>
<!-- NEW ARRIVALl 끝  -->
					
<!-- BEST SELLER 시작 -->
					<div id="saler" class="tab-pane fade">
						
						<c:set var="bestSellerAddr" value="${requestScope.bestSellerAddr}"/>
						<!-- 베스트 셀러 리스트 반복문 시작 -->
						<c:forEach var="bestSellerList" items="${requestScope.bestSellerList}" varStatus="status">
						<div class="col-md-4 col-sm-6">
							<div class="single-product style-two mb-50">
								<div class="single-img">
									<a href="detail.ca?pbNum=${bestSellerList.pbNum}"><img src="/resources/img/product/${bestSellerList.pImg}.jpg" alt="" /></a>
							
							<!-- 당일구매여부에 따라 당일 마크 부착  -->
							 <c:if test="${bestSellerList.pbYN eq 'Y'}">
									<span class="pro-level">당일</span>
							 </c:if> 
									<div class="hover-content text-center" id="pbNumWrap">
										<input type="hidden" id="pbNum" value="${bestSellerList.pbNum}" >
										<ul>
											<li></li>
											<c:choose>
												<%-- memberLikeList가 비어있을 때 --%>
												<c:when test="${empty requestScope.memberLikeList}">
													<%-- 빈 하트 출력  --%>
													<li><a class="heart fa fa-heart-o"></a></li>
												</c:when>
												<c:otherwise>
													<%-- 회원의 좋아요 리스트에 있는 번호와 케이크 번호 비교 --%>
													<c:set var="doneLoop" value="false"/>
													<c:forEach var="memberLike" items="${requestScope.memberLikeList}" varStatus="status">
														<%-- 리스트에 있는 번호와 일치하면 --%>
														<%-- <c:out value="${memberLike.pbNum},${newArrival.pbNum}"/> --%>
															<c:if test="${not doneLoop}">
																<c:choose>
																	<c:when test="${memberLike.pbNum eq bestSellerList.pbNum}">
																		<%-- 꽉 찬 하트 출력 --%>
																		<c:set var="heartSelect" value="fa-heart" />
																		<c:set var="doneLoop" value="true" />
																	</c:when>
																	<c:otherwise>
																		<c:set var="heartSelect" value="fa-heart-o" />
																	</c:otherwise>
																</c:choose>
															</c:if>
														</c:forEach>
														<li><a class="heart fa ${heartSelect}"></a></li>
												</c:otherwise>
											</c:choose>
											
										</ul>
									</div>
								</div>
								<div class="young-product-details mt-20">
									<h4>
										<a href="detail.ca?pbNum=${bestSellerList.pbNum}">${bestSellerList.pName}</a>
									</h4>
									<div class="young-product-details-tag">
										<i class="fa fa-map-marker"></i> 
										<span class="young-product-details-tag-place">${bestSellerAddr[status.index]} </span> 
										<i class="fa fa-tag"></i> 
										<span class="young-product-details-tag-place-detail">${bestSellerList.pbTag}</span> 
										<!-- <span class="young-product-details-tag-place-detail">#마카롱이라구?</span>
										<span class="young-product-details-tag-place-detail">#말도안돼</span> -->
									</div>
									<div class="young-product-details-price">
										<span><fmt:formatNumber value="${bestSellerList.pPrice}" pattern="#,###" type="number"/>원</span> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
						<!-- 반복문 종료 -->
					</div>
<!-- BEST SELLER 끝 -->

<!-- BEST LIKEY 시작 -->
					<div id="tranding" class="tab-pane fade">
						
						<c:set var="bestLikeyAddr" value="${requestScope.bestLikeyAddr}"/>
						<c:forEach var="bestLikeyList" items="${requestScope.bestLikeyList}" varStatus="status">
					
						<div class="col-md-4 padding_14px">
							<div class="single-product style-two mb-50">
								<div class="single-img">
									<a href="detail.ca?pbNum=${bestLikeyList.pbNum}"><img src="/resources/img/product/${bestLikeyList.pImg}.jpg" alt="" /></a>
									
									<!-- 당일구매여부에 따라 당일 마크 부착  -->
									 <c:if test="${bestLikeyList.pbYN eq 'Y'}">
											<span class="pro-level">당일</span>
									 </c:if> 
									<div class="hover-content text-center" id="pbNumWrap">
										<input type="hidden" id="pbNum" value="${bestLikeyList.pbNum}" >
										<ul>
											<li><a href="#" class="icon_cart_alt "></a></li>
											<c:choose>
												<%-- memberLikeList가 비어있을 때 --%>
												<c:when test="${empty requestScope.memberLikeList}">
													<%-- 빈 하트 출력  --%>
													<li><a class="heart fa fa-heart-o"></a></li>
												</c:when>
												<c:otherwise>
													<%-- 회원의 좋아요 리스트에 있는 번호와 케이크 번호 비교 --%>
													<c:set var="doneLoop" value="false"/>
													<c:forEach var="memberLike" items="${requestScope.memberLikeList}" varStatus="status">
														<%-- 리스트에 있는 번호와 일치하면 --%>
														<%-- <c:out value="${memberLike.pbNum},${newArrival.pbNum}"/> --%>
															<c:if test="${not doneLoop}">
																<c:choose>
																	<c:when test="${memberLike.pbNum eq bestLikeyList.pbNum}">
																		<%-- 꽉 찬 하트 출력 --%>
																		<c:set var="heartSelect" value="fa-heart" />
																		<c:set var="doneLoop" value="true" />
																	</c:when>
																	<c:otherwise>
																		<c:set var="heartSelect" value="fa-heart-o" />
																	</c:otherwise>
																</c:choose>
															</c:if>
														</c:forEach>
														<li><a class="heart fa ${heartSelect}"></a></li>
												</c:otherwise>
											</c:choose>
										</ul>
									</div>
								</div>
								<div class="young-product-details mt-20">
									<h4>
										<a href="detail.ca?pbNum=${bestLikeyList.pbNum}">${bestLikeyList.pName}</a>
									</h4>
									<div class="young-product-details-tag">
										<i class="fa fa-map-marker"></i> 
										<span class="young-product-details-tag-place">${bestLikeyAddr[status.index]}</span> 
										<i class="fa fa-tag"></i> 
										<span class="young-product-details-tag-place-detail">${bestLikeyList.pbTag}</span> 
									</div>
									<div class="young-product-details-price">
									<span><fmt:formatNumber value="${bestLikeyList.pPrice}" pattern="#,###" type="number"/>원</span> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
<!-- BEST LIKEY 끝 -->
				</div>
			</div>
		</div>
	</section>
	<!-- Product Tab Area End -->


	<!-- Newsletter Area Start -->
	<!-- 	<section class="newsletter-area gray-bg pt-85 pb-100">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-5">
							<div class="newsletter-content">
								<span class="icon_mail_alt "></span>
								<div class="text">
									<h3>NEWSLETTER</h3>
									<p>Be the first to know about the latest fashion  and get exclusive offers</p>
								</div>
							</div>
						</div>
						<div class="col-md-7">
							<div class="subcribe-newsletter">
								<form id="mc-form">
									<input autocomplete="off" placeholder="Email Addres..." type="text">
									<button type="submit">Subscribe Now</button>
									mailchimp-alerts Start
									<div class="mailchimp-alerts text-centre">
										<div class="mailchimp-submitting"></div>
										<div class="mailchimp-success"></div>
										<div class="mailchimp-error"></div>
									</div>
									mailchimp-alerts end
								</form>
							</div>
						</div>
					</div>
				</div>
			</section> -->
	<!-- Newsletter Area End -->


	<!-- Instragam Feed Start -->
	<section class="instragam-area ptb-100">
		<div class="container-fluid">
			<div class="row">
				<!-- Instragram Fedd Single -->
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="instragam-single">
						<a><img src="/resources/img/instragram/1.jpg" alt="" /></a>
						<h3 class="tag-text">
							<a>#고소한</a>
						</h3>
						<div class="instragam-content text-center text-white">
							<a class="popup-instragram"
								href="/resources/img/instragram/1.jpg"></a>
							<h3 class="tag-text">
								<a href="cakeSearch.ca?input_search=%23고소한" style="cursor:pointer;">#고소한</a>
							</h3>
						</div>
					</div>
				</div>
				<!-- Instragram Fedd Single -->
				<!-- Instragram Fedd Single -->
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="instragam-single">
						<a><img src="/resources/img/instragram/2.jpg" alt="" /></a>
						<h3 class="tag-text">
							<a>#상큼한</a>
						</h3>
						<div class="instragam-content text-center text-white">
							<a class="popup-instragram"
								href="/resources/img/instragram/1.jpg"></a>
							<h3 class="tag-text">
								<a href="cakeSearch.ca?input_search=%23상큼한" style="cursor:pointer;">#상큼한</a>
							</h3>
						</div>
					</div>
				</div>
				<!-- Instragram Fedd Single -->
				<!-- Instragram Fedd Single -->
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="instragam-single">
						<a><img src="/resources/img/instragram/3.jpg" alt="" /></a>
						<h3 class="tag-text">
							<a>#생크림</a>
						</h3>
						<div class="instragam-content text-center text-white">
							<a class="popup-instragram"
								href="/resources/img/instragram/1.jpg"></a>
							<h3 class="tag-text">
								<a href="cakeSearch.ca?input_search=%23생크림" style="cursor:pointer;">#생크림</a>
							</h3>
						</div>
					</div>
				</div>
				<!-- Instragram Fedd Single -->
				<!-- Instragram Fedd Single -->
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="instragam-single">
						<a><img src="/resources/img/instragram/4.jpg" alt="" /></a>
						<h3 class="tag-text">
							<a>#무스</a>
						</h3>
						<div class="instragam-content text-center text-white">
							<a class="popup-instragram"
								href="/resources/img/instragram/1.jpg"></a>
							<h3 class="tag-text">
								<a href="cakeSearch.ca?input_search=%23무스" style="cursor:pointer;">#무스</a>
							</h3>
						</div>
					</div>
				</div>
				<!-- Instragram Fedd Single -->
			</div>
		</div>
	</section>
	<!-- Instragam Feed End -->

	<section class="service-area default-bg ptb-100">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="service-top">
						<h6>We are unique</h6>
						<h4>국내 최초 케이크 플랫폼 LikeyCakey</h4>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 col-xs-12">
					<div class="single-service mt-50">
						<span><i class="fa fa-cubes"></i></span>
						<h4>국내 최초 케이크 플랫폼</h4>
						<p>
							가게 마다 다른 홈페이지, 모든 가게의 케이크를 한눈에 볼 수 는 없을까? 이제 LikeyCakey'에서 전국의 모든
							케이크를 검색, <br> 주문해보세요. 당신의 기념일이 훨씬 윤택해질 것입니다.
						</p>
					</div>
				</div>
				<div class="col-md-4 hidden-sm hidden-xs">
					<div class="single-service middle-border mt-50">
						<span><i class="fa fa-user"></i></span>
						<h4>케이크 커스터마이징 서비스</h4>
						<p>
							다 똑같은 케이크는 재미없습니다. <br> 빵, 토핑, 크림 등 원하는 재료로 각자의 개성에 맞게 케이크를<br>
							제작해보세요.
						</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 col-xs-12">
					<div class="single-service mt-50">
						<span><i class="fa fa-sliders"></i></span>
						<h4>케이크 필터 검색 서비스</h4>
						<p>
							다양한 케이크의 종류를 필터를 이용해 편리하게 검색해 보세요. <br> 내가 원하는 케이크를 조금 더 쉽게
							찾을 수 있습니다.
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Support Area End -->
	<!-- Client Area Start -->
	<section class="client-area ptb-100">
		<!-- SECTION TITEL -->
		<div class="section-titel style-two text-center mb-115 text-uppercase">
			<h3>Our Team</h3>
		</div>
		<!-- SECTION TITEL -->
		<div class="container">
			<div class="row">
				<div class="client-slider-cursol owl-carousel owl-theme">
					<!-- Client Single -->
					<div class="col-md-12 item">
						<div class="client-slider-single text-center">
							<div class="client-content">
								<img src="/resources/img/client/na.png" alt=""/>
								<h3>Hyunsun Na</h3>
								<h5>LikeyCakey 팀원</h5>
								<div class="sin-text">
									<p>써니써니 현써니<br>
									감각적인 개발자! 개발은 감! 미래의 웹마스터! 기대해주세요</p>
								</div>
							</div>
						</div>
					</div>
					<!-- Client Single -->
					<!-- Client Single -->
					<div class="col-md-12 item">
						<div class="client-slider-single text-center">
							<div class="client-content">
								<img src="/resources/img/client/young.png" alt="" />
								<h3>Youngyul Kim</h3>
								<h5>LikeyCakey 팀원</h5>
								<div class="sin-text">
									<p>여리여리 영려리<br></p>
								</div>
							</div>
						</div>
					</div>
					<!-- Client Single -->
					<!-- Client Single -->
					<div class="col-md-12 item">
						<div class="client-slider-single text-center">
							<div class="client-content">
								<img src="/resources/img/client/hwan.png" alt="" />
								<h3>Hwanhee Kim</h3>
								<h5>LikeyCakey 팀원</h5>
								<div class="sin-text">
									<p>퐈니퐈니 김퐈니<br></p>
								</div>
							</div>
						</div>
					</div>
					<!-- Client Single -->
					<!-- Client Single -->
					<div class="col-md-12 item">
						<div class="client-slider-single text-center">
							<div class="client-content">
								<img src="/resources/img/client/song.png" alt="" />
								<h3>Jiyeong Song</h3>
								<h5>LikeyCakey 팀장</h5>
								<div class="sin-text">
									<p>여니여니 지여니<br></p>
								</div>
							</div>
						</div>
					</div>
					<!-- Client Single -->
					<!-- Client Single -->
					<div class="col-md-12 item">
						<div class="client-slider-single text-center">
							<div class="client-content">
								<img src="/resources/img/client/eun.png" alt="" />
								<h3>Eunsong Kim</h3>
								<h5>LikeyCakey 팀원</h5>
								<div class="sin-text">
									<p>송이송이 은송이<br></p>
								</div>
							</div>
						</div>
					</div>
					<!-- Client Single -->
				</div>
			</div>
		</div>
	</section>
	<!-- Client Area End -->

	<footer>
		<!-- Footer Top Area End -->
		<div class="fotter-area dark-gray-bg ptb-100">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-4 col-xs-12">
						<div class="address-area res-mb-sm-30">
							<a href="index.html">LIKEYCAKEY</a>
							<p>여러 가게의 케이크를 한 곳에 모아볼 수 있는 국내 최초 케이크 플랫폼 서비스</p>
							<div class="contact-social mt-40">
								<ul>
									<li><a href="#" class="social_facebook "></a></li>
									<li><a href="#" class="social_twitter "></a></li>
									<li><a href="#" class="social_googleplus"></a></li>
									<li><a href="#" class="social_instagram "></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-4 col-xs-12">
						<div class="footer-menu res-mb-sm-30">
							<h4>CAKE SHOP</h4>
							<ul>
								<li><a href="#">모든 케이크</a></li>
								<li><a href="#">빵케이크</a></li>
								<li><a href="#">떡 케이크</a></li>
								<li><a href="#">아이스크림 케이크</a></li>
								<li><a href="#">커스터마이징 케이크</a></li>
								<li><a href="#">가게 모아보기</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 hidden-sm hidden-xs">
						<div class="footer-menu">
							<h4>PAGE GUIDE</h4>
							<ul>
								<li><a href="#">공지사항</a></li>
								<li><a href="#">홈페이지 Q&amp;A</a></li>
								<li><a href="#">회원가입</a></li>
								<li><a href="#">로그인</a></li>
								<li><a href="#">CONTACT</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-4 col-xs-12">
						<div class="footer-menu">
							<h4>CONTACT INFO</h4>
							<div class="contact-details">
								<ul>
									<li><span class="icon_pin"></span>
										<p>서울특별시 강남구 테헤란로14길 6</p></li>
									<li><span class="icon_mail"></span>
										<p>bgm0718@gmail.com</p></li>
									<li><span class="icon_phone "></span>
										<p>(+82) 10 3069 9095</p></li>
									<li><span class="icon_clock_alt"></span>
										<p>9.00 am-6.00 pm</p></li>
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
						<p>Copyright &copy; 2018.LikeyCakey All rights reserved.</p>
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

	<!--Quickview Product Start -->
	<div id="quickview-wrapper">
		<!-- Modal -->
		<div class="modal fade" id="productModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="modal-product">
							<div class="product-images">
								<div class="main-image images">
									<img alt="" src="/resources/img/other/quickview.jpg">
								</div>
							</div>
							<div class="product-info">
								<h1>Beauty Products</h1>
								<div class="price-box">
									<p class="price">
										<span class="special-price"><span class="amount">$132.00</span></span>
									</p>
								</div>
								<a href="product-details.html" class="see-all">See all
									features</a>
								<div class="quick-add-to-cart">
									<form method="post" class="cart">
										<div class="numbers-row">
											<input type="number" id="french-hens" value="3">
										</div>
										<button class="single_add_to_cart_button" type="submit">Add
											to cart</button>
									</form>
								</div>
								<div class="quick-desc">Lorem ipsum dolor sit amet,
									consectetur adipiscing elit. Nam fringilla augue nec est
									tristique auctor. Donec non est at libero vulputate rutrum.
									Morbi ornare lectus quis justo gravida semper. Nulla tellus mi,
									vulputate adipiscing cursus eu, suscipit id nulla.</div>
								<div class="social-sharing">
									<div class="widget widget_socialsharing_widget">
										<h3 class="widget-title-modal">Share this product</h3>
										<ul class="social-icons">
											<li><a target="_blank" title="Facebook" href="#"
												class="facebook social-icon"><i class="fa fa-facebook"></i></a>
											</li>
											<li><a target="_blank" title="Twitter" href="#"
												class="twitter social-icon"><i class="fa fa-twitter"></i></a>
											</li>
											<li><a target="_blank" title="Pinterest" href="#"
												class="pinterest social-icon"><i class="fa fa-pinterest"></i></a>
											</li>
											<li><a target="_blank" title="Google +" href="#"
												class="gplus social-icon"><i class="fa fa-google-plus"></i></a>
											</li>
											<li><a target="_blank" title="LinkedIn" href="#"
												class="linkedin social-icon"><i class="fa fa-linkedin"></i></a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<!-- .product-info -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End of Quickview Product-->

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
