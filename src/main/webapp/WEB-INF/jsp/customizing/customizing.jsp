<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="customlist" value="${requestScope.customlist }"/>
<c:set var="namelist" value="${requestScope.namelist }"/>
<c:set var="photolist" value="${requestScope.photolist }"/>
<c:set var="creamlist" value="${requestScope.creamlist }"/>
<c:set var="sheetlist" value="${requestScope.sheetlist }"/>
<c:set var="toppinglist" value="${requestScope.toppinglist }"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset=UTF-8">
		<title>Customizing</title>
		<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="/resources/img/apple-touch-icon.png">
		<link rel="shortcut icon" type="image/x-icon" href="/resources/img/icon/favicon.ico">
		
		<!-- all css here -->
        <!-- import all css, js from header file -->
	</head>
	<body>
		<!-- Header Area Start -->
		<%@ include file="../default/header.jsp" %>
		<!-- Header Area End -->
		
		<!-- 커스텀 케이크 제목 시작 -->
		<section class="young-notice-area"	>
			<div class="container">
				<div class="row">
					<div class="content-full pt-20 pb-25 fix">
						<div class="col-md-12">
							<div class="shop-tab-pill">
								<div class="young-nav-menu-grid">
									<ul></ul>
								</div>	
								<div class="show-more text-center">
									<h2><strong><font color="#9bcaba">커스텀 케이크</font></strong></h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- 커스텀 케이크 제목 끝 -->
		
		<!-- 호스트 게시판 시작 -->
		<section class="young-page-content-wrapper">
			<div class="container">
				<div class="row">
					<div class="content-full pt-50 pb-55 fix">
						<div class="col-md-12">
							<div class="tab-content">
								<div id="grid" class="shop-left pt-35 tab-pane fade in active">
									<div class="shop-tab-area">
										<c:forEach var="custom" items="${customlist }" varStatus="loop">
										<!-- Single Product Start -->
										<div class="col-md-6 col-sm-6">
											<div class="single-product style-two mb-50 young-bot-margin	">
												<div class="young-custom-logo">
													<img src="/resources/img/member/${photolist[loop.index] }" alt="" />
												</div>
												<div class="young-custom-exp">
													<h4><a href="single-product.html"><font color="9bcaba"><strong>${namelist[loop.index] }</strong></font> </a></h4>
													<div><i class="fa fa-paper-plane"></i><span>&nbsp;제공 시트 : ${sheetlist[loop.index] }</span></div>
													<div><i class="fa fa-paper-plane"></i><span>&nbsp;제공 토핑 : ${toppinglist[loop.index] }</span></div>
													<div><i class="fa fa-paper-plane"></i><span>&nbsp;제공 크림 : ${creamlist[loop.index] }</span></div>
												</div>
												<div class="young-custom-button">
													<p><strong>보러가기</strong></p>
												</div>
											</div>
										</div>
										<!-- Single Product End -->
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="tab-content">
								<div id="grid" class="shop-left pt-35 tab-pane fade in active">
									<div class="shop-tab-area">						
										<div class = "young_blank">
										</div>
										<div class="text_box first">
		                    				<h4 class="h_intro">
		                       					<strong><font color="9ababc">&nbsp;&nbsp;&nbsp;커스텀 베이커리 리스트</font></strong>
		                       				</h4>
		                				</div>
		                			</div>
		                		</div>
		                	</div>
		                </div>
		                <div class="col-md-12">
							<div class="tab-content">
								<div id="grid" class="shop-left pt-35 tab-pane fade in active">
									<div class="shop-tab-area">
										<c:set var="list" value="${locationlist}" />
										<%-- <c:forEach var="cake" items="${cakelist}" varStatus="loop"> --%>
										<!-- Single Bakery Start -->
										<div class="col-md-4 col-sm-6">
											<div class="single-product style-two mb-50">
												<div class="right-area pt-35">
													<div class="young-host-profile-box"	>
														<span><a href = "hostinfo.ca?input_vendor_id=tous"><img src="/resources/img/young/touslesjours.png" alt="" /></a></span>
					                				    <div>BAKERY</div>
					                        			<p class="young-host-profile-box-name">${input_vendor }</p>
					                        			<p class="young-host-profile-box-exp">안녕하세요~ 뚜레주르 입니다.</p>
					                    	        </div>
												</div>
											</div>
										</div>
										<!-- Single Bakery End -->
										<!-- Single Bakery Start -->
										<div class="col-md-4 col-sm-6">
											<div class="single-product style-two mb-50">
												<div class="right-area pt-35">
													<div class="young-host-profile-box"	>
														<span><img src="/resources/img/young/after.png" alt="" /></span>
					                				    <div>BAKERY</div>
					                        			<p class="young-host-profile-box-name">${input_vendor }</p>
					                        			<p class="young-host-profile-box-exp">오늘도 당신의 오후를 따뜻하게 하는 오후의 빵집</p>
					                    	        </div>
												</div>
											</div>
										</div>
										<!-- Single Bakery End -->
										<!-- Single Bakery Start -->
										<div class="col-md-4 col-sm-6">
											<div class="single-product style-two mb-50">
												<div class="right-area pt-35">
													<div class="young-host-profile-box"	>
														<span><img src="/resources/img/young/paris.png" alt="" /></span>
					                				    <div>BAKERY</div>
					                        			<p class="young-host-profile-box-name">${input_vendor }</p>
					                        			<p class="young-host-profile-box-exp">파리의 맛을 그대로</p>
					                    	        </div>
												</div>
											</div>
										</div>
										<!-- Single Bakery End -->
										<!-- Single Bakery Start -->
										<div class="col-md-4 col-sm-6">
											<div class="single-product style-two mb-50">
												<div class="right-area pt-35">
													<div class="young-host-profile-box"	>
														<span><img src="/resources/img/young/sam.png" alt="" /></span>
					                				    <div>BAKERY</div>
					                        			<p class="young-host-profile-box-name">${input_vendor }</p>
					                        			<p class="young-host-profile-box-exp">은송이가 하는 삼송빵</p>
					                    	        </div>
												</div>
											</div>
										</div>
										<!-- Single Bakery End -->
										<!-- Single Bakery Start -->
										<div class="col-md-4 col-sm-6">
											<div class="single-product style-two mb-50">
												<div class="right-area pt-35">
													<div class="young-host-profile-box"	>
														<span><img src="/resources/img/young/dore.png" alt="" /></span>
					                				    <div>BAKERY</div>
					                        			<p class="young-host-profile-box-name">${input_vendor }</p>
					                        			<p class="young-host-profile-box-exp">도리도리 도레도레</p>
					                    	        </div>
												</div>
											</div>
										</div>
										<!-- Single Bakery End -->
										<!-- Single Bakery Start -->
										<div class="col-md-4 col-sm-6">
											<div class="single-product style-two mb-50">
												<div class="right-area pt-35">
													<div class="young-host-profile-box"	>
														<span><img src="/resources/img/young/crown.png" alt="" /></span>
					                				    <div>BAKERY</div>
					                        			<p class="young-host-profile-box-name">${input_vendor }</p>
					                        			<p class="young-host-profile-box-exp">안녕하세요 왕관입니다</p>
					                    	        </div>
												</div>
											</div>
										</div>
										<!-- Single Bakery End -->
										<%-- </c:forEach> --%>
									</div>		
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- 호스트 게시판 끝 -->
		
	</body>	
</html>