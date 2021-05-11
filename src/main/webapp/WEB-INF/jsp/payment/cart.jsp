<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="list" value="${requestScope.list}" />
<c:set var="coList" value="${requestScope.coList}" />
<c:set var="member" value="${sessionScope.member}" />
<c:set var="totalPrice" scope="page" />
<c:set var="totalDeliveryPrice" scope="page" />
<fmt:parseNumber var="totalPrice" integerOnly="true" type="number"
	value="${totalPrice}" />
<fmt:parseNumber var="totalDeliveryPrice" integerOnly="true"
	type="number" value="${totalDeliveryPrice}" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Cart</title>
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
<script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		var checkAll;
		var delMembers = new Array();
		//1.수량이 바뀔 때마다, 총 가격이 바뀌는 이벤트 시작//
		$("input[name=poCount]").change(
				function() {
					var poNumber = $(this).closest("tr").find("input[name=poNum]")
							.val();
					var poCount = $(this).closest("tr").find(
							"input[name=poCount]").val();
					var pbPrice = $(this).closest("tr").find(
							"input[name=pbPrice]").val();
					var type = $(this).closest("tr").find(
					"input[name=type]").val();
					/* alert("수량 업데이트를 실행합니다." + poNumber + poCount + pbPrice); */
					$.ajax({
						url : "cartUpdate.ca",
						type : "post",
						data : {
							poNumber : poNumber,
							poCount : poCount,
							pbPrice : pbPrice,
							type : type
						},
						success : function(value) {//
							if (value == "ok") {
								/* alert("수량 업데이트에 성공했습니다."); */
								location.reload();
							} else {
								alert("수량 업데이트에 실패했습니다.");
							}
						},
						error : function(value) {
							alert("잘못 입력하셨습니다." + value);
						}
					});//AJAX
					return false;
				}); //click

		//1.수량이 바뀔 때마다, 해당 제품의 총 가격과 전체 총 가격이 바뀌는 이벤트 시작//
		
		
		//2. 카트 삭제 이벤트 시작//
		$("a[name=deleteButton]").click(
				function() {
					var poNumber = $(this).closest("tr").find("input[name=poNum]")
							.val();
					var type = $(this).closest("tr").find(
					"input[name=type]").val();

					alert("카트 삭제를 실행합니다.");
					$.ajax({
						url : "cartDelete.ca",
						type : "post",
						data : {
							poNumber : poNumber,
							type : type
						},
						success : function(value) {//
							if (value == "ok") {
								alert("삭제에 성공했습니다.");
								location.reload();
							} else {
								alert("삭제에 실패했습니다.");
							}
						},
						error : function(value) {
							alert("잘못 입력하셨습니다." + value);
						}
					});//AJAX
					return false;
				}); //click

		//2. 카트 삭제 이벤트 끝//
		
		
		
		$("#checkout").click(
				function() {
					var length = ${fn:length(list)};
					//alert(length);
					if(length==0){
						alert("결제할 상품이 없습니다.");
					}else{
						location.href="checkoutList.ca";	
					}
					return false;
				}); //click

	}); //ready
</script>

</head>

<style>
</style>
<body class="other-page">




	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Header Area Start -->
	<%@ include file="../default/header.jsp"%>
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

							<!-- 장바구니 창 -->
							<div class="row">
								<h2 style="width: 20%; display: inline-block; font-weight: 500;">카트</h2>

								<div>
									<h5 class="text_right">&nbsp;03 주문 완료</h5>
									<h5 class="text_right"">&nbsp;02 주문/결제 ></h5>
									<h5 class="text_right" style="color: #9bcaba">01 카트 ></h5>
									<br>
									<h3></h3>
								</div>


							</div>
							<!-- 장바구니 창 -->
							<br> <br>
							<!-- 장바구니 시작 -->
							<div class="row">
								<h3>주문 상품 정보</h3>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<form action="#">
										<div class="table-content table-responsive">
											<table>
												<thead>
													<tr>
														<th class="product-thumbnail eceff8">이미지</th>
														<th class="product-name eceff8">상품 정보</th>
														<th class="product-price eceff8">상품 금액</th>
														<th class="product-quantity eceff8">수량</th>
														<th class="product-subtotal eceff8">총 상품 금액</th>
														<th class="product-subtotal eceff8">예약 날짜</th>
														<th class="product-remove eceff8">배송 금액</th>
														<th class="product-remove eceff8">삭제</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="p" items="${list}" varStatus="status">
														<tr>
															<td class="product-thumbnail"><a href="#"><img
																	src="/resources/img/product/${p.pbImg }.jpg" alt=""></a></td>
															<td class="product-name">
																<p style="font-weight: bold;">${p.mbBizName}</p> <span>${p.pbName}(구매수량
																	${p.poCnt}개)</span> <input class="hidden" name="poNum"
																value="${p.poNum}"> <input class="hidden"
																name="pbPrice" value="${p.pbPrice}">
																<input class="hidden"
																name="type" value="${p.type}">
															</td>
															<td class="product-price"><span class="amount">${p.pbPrice}</span>
															</td>
															<td class="product-quantity"><input type="number"
																id="poCnt" name="poCount" min="1" max="3"
																value="${p.poCnt}"></td>

															<td class="product-subtotal" id="poPrice"
																name="smallTotalPrice">${p.poPrice}</td>

															<c:set var="totalPrice" scope="page"
																value="${totalPrice+p.poPrice}" />
															<td class="product-subtotal">
															<fmt:formatDate value="${p.poBookDate}" pattern="yyyy-MM-dd HH:mm" />
															</td>
															<td class="product-subtotal" name="BizDelivery">${p.poBizDelivery}</td>
															<c:set var="totalDeliveryPrice" scope="page"
																value="${totalDeliveryPrice+p.poBizDelivery}" />
															<td class="product-remove"><a href="#"
																name="deleteButton"><i class="fa fa-times"></i></a></td>
														</tr>
													</c:forEach>
													<c:forEach var="co" items="${coList}" varStatus="status">
														<tr>
															<td class="product-thumbnail"><a href="#"><img
																	src="/resources/img/product/3.jpg" alt=""></a></td>
															<td class="product-name">
																<p style="font-weight: bold;">${co.mbBizName}</p> <span>${co.pbName}(구매수량
																	${co.poCnt}개)</span> 
																	<br>시트 : ${co.coSheet}, 토핑 : ${co.coTopping}, 크림  : ${co.coCream}
															<br> 사이즈 : ${co.coSize}
																	<input class="hidden" name="poNum"
																value="${co.poNum}"> <input class="hidden"
																name="pbPrice" value="${co.pbPrice}">
																<input class="hidden"
																name="type" value="${co.type}">
															</td>
															<td class="product-price"><span class="amount">${co.pbPrice}</span>
															</td>
															<td class="product-quantity"><input type="number"
																id="poCnt" name="poCount" min="1" max="3"
																value="${co.poCnt}"></td>

															<td class="product-subtotal" id="poPrice"
																name="smallTotalPrice">${co.poPrice}</td>

															<c:set var="totalPrice" scope="page"
																value="${totalPrice+co.poPrice}" />
															<td class="product-subtotal">
															<fmt:formatDate value="${co.poBookDate}" pattern="yyyy-MM-dd HH:mm" />
															</td>
															<td class="product-subtotal" name="BizDelivery">
															
															${co.poBizDelivery}</td>
															<c:set var="totalDeliveryPrice" scope="page"
																value="${totalDeliveryPrice+co.poBizDelivery}" />
															<td class="product-remove"><a href="#"
																name="deleteButton"><i class="fa fa-times"></i></a></td>
														</tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
										<!-- 장바구니 끝 -->
										<!-- 버튼, 총 금액 시작 -->


										<div class="row">
											<div class="col-md-8 col-sm-7 col-xs-12">
												<br> <br> <br> <br> <br> <br>
												<div class="buttons-cart">

													<div class="pink_button">
														<input type="button" id="checkout" value="구매하기"
															style="width: 200px;"> <input type="button"
															value="쇼핑 계속하기" style="width: 200px;" onclick="location.href='home.ca'">
														<!--  <a href="#" style="width:200px; text-align:center">쇼핑 계속하기</a> -->
													</div>

												</div>

											</div>
											<div class="col-md-4 col-sm-5 col-xs-12">
												<div class="cart_totals">
													<h2>Cart Totals</h2>
													<br>
													<table>
														<tbody>
															<tr class="cart-subtotal">
																<th>상품 금액</th>
																<td><span class="amount">${totalPrice}</span></td>
															</tr>
															<tr class="cart-subtotal">
																<th>배송 금액</th>
																<td><span class="amount">${totalDeliveryPrice}</span></td>
															</tr>
															<tr class="order-total">
																<th>Total</th>
																<td><strong><span class="amount">${totalPrice+totalDeliveryPrice}</span></strong>
																</td>
															</tr>
														</tbody>
													</table>

												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							<!-- 버튼 끝 -->
							<br> <br> <br>



						</div>

					</form>
				</div>
			</div>
		</div>
		<!-- checkout-area end -->
	</section>
	<!-- Page Content Wraper Area End -->


	<!-- Fotter Area Start -->
	<%@ include file="../default/footer.jsp"%>
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

