<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="list" value="${requestScope.list}" />
<c:set var="coList" value="${requestScope.coList}" />
<c:set var="member" value="${sessionScope.member}" />
<c:set var="next" value="${requestScope.next}" />
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
<title>Checkout</title>
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
<script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>

<!-- 주소 라이브러리 추가 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 주소 라이브러리 추가 끝 -->
<!-- 아임포트 라이브러리 추가 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아임포트 라이브러리 추가 끝 -->



<!-- 주소 라이브러리 script 코드 시작 -->
<script>
	function DaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('recPost').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('recBasicAddr').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('recDetailAddr').focus();
					}
				}).open();
	}
</script>
<!-- 주소 라이브러리 script 코드 끝 -->

<!-- 내가 만든 script 코드 시작 -->
<script type="text/javascript">
	$(function() {
		//1.주문자 정보와 동일한 주소 시작//
		$("#originalAddress").click(function() {

			if ($(this).is(":checked")) {
				var recName = "<c:out value='${member.name}'/>";
				var recCP = "<c:out value='${member.phone}'/>";
				var recPost = "<c:out value='${member.post}'/>";
				var recBasicAddr = "<c:out value='${member.addressBasic}'/>";
				var recDetailAddr = "<c:out value='${member.addressDetail}'/>";
				$("#recName").val(recName).attr("readonly", true);
				/* $("#recName").readOnly=true; */
				$("#recCP").val(recCP).attr("readonly", true);
				$("#recPost").val(recPost).attr("readonly", true);
				$("#recBasicAddr").val(recBasicAddr).attr("readonly", true);
				$("#recDetailAddr").val(recDetailAddr).attr("readonly", true);
				$("#postSearch").toggleClass("hidden");
			} else {
				$("#recName").val('');
				$("#recCP").val('');
				$("#recPost").val('');
				$("#recBasicAddr").val('');
				$("#recDetailAddr").val('');
				$("#postSearch").toggleClass("hidden");
			}

		}); //click

		//1.주문자 정보와 동일한 주소 끝//

		//2.계좌이체 시작//
		$("#withoutBank").click(function() {

			if ($(this).is(":checked")) {
				$("#bank").toggleClass("hidden");
				$("#accountHolder").toggleClass("hidden");
				$("#due").toggleClass("hidden");
			} else {
				$("#bank").toggleClass("hidden");
				$("#accountHolder").toggleClass("hidden");
				$("#due").toggleClass("hidden");
			}

		}); //click

		//2.계좌이체 끝//

	}); //ready
</script>
<!-- 내가 만든 script 코드 끝 -->
</head>

<style>
.input_height {
	height: 33px !important;
}

.height {
	height: 50px !important;
	margin-bottom: 20px !important;
}
</style>
<body class="other-page">




	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Header Area Start -->
	<header></header>
	<%@ include file="../default/header.jsp"%>
	<!-- Header Area End -->
	<!-- Page Content Wraper Area Start -->
	<section class="page-content-wrapper pt-100 pb-40">

		<!-- checkout-area start -->
		<div class="checkout-area">
			<div class="container">
				<div class="row">
					<form action="#" id="payForm">
						
						<div class="checkbox-form">

							<!-- 결제 방법 창 -->
							<div class="row">
								<h2 style="width: 20%; display: inline-block; font-weight: 500;">주문/결제</h2>

								<div>
									<h5 class="text_right">&nbsp;03 주문 완료</h5>
									<h5 class="text_right" style="color: #9bcaba">&nbsp;02
										주문/결제 ></h5>
									<h5 class="text_right">01 카트 ></h5>
									<br>
									<h3></h3>
								</div>


							</div>
							<!-- 결제 방법 창 -->
							<input type="hidden" id="next" value="${next}">
							<br> <br>
							<!-- 장바구니 시작 -->
							<div class="row">
								<h3>주문 상품 정보</h3>
								<div class="col-md-12 col-sm-12 col-xs-12">
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
												</tr>
											</thead>
											<tbody>
												<c:forEach var="p" items="${list}" varStatus="status">
													<tr>
														<td class="product-thumbnail"
															style="padding-top: 5px; padding-bottom: 5px;"><a
															href="#"><img src="/resources/img/product/${p.pbImg }.jpg"
																style="height: 120px; width: 120px;" alt=""></a></td>
														<td class="product-name" style="height: 130px;">
															<p style="font-weight: bold;">${p.mbBizName}</p> 
															<span>${p.pbName}(구매수량
																: ${p.poCnt}개)</span>
															
																
														</td>
														<td class="product-price" style="height: 130px;"><span
															class="amount">${p.pbPrice}</span></td>
														<td class="product-subtotal" style="height: 130px;">${p.poCnt}</td>
														<td class="product-subtotal" style="height: 130px;">${p.poPrice}</td>
														<td class="product-subtotal" style="height: 130px;">
														<fmt:formatDate value="${p.poBookDate}" pattern="yyyy-MM-dd HH:mm" />
														</td>
														<td class="product-subtotal" style="height: 130px;">${p.poBizDelivery}
														<input type="hidden" id="type" value="${p.type}">
														</td>
														
														<c:set var="totalPrice" scope="page"
															value="${totalPrice+p.poPrice}" />
														<c:set var="totalDeliveryPrice" scope="page"
															value="${totalDeliveryPrice+p.poBizDelivery}" />
													</tr>
												</c:forEach>
												<c:forEach var="co" items="${coList}" varStatus="status">
													<tr>
														<td class="product-thumbnail"
															style="padding-top: 5px; padding-bottom: 5px;"><a
															href="#"><img src="/resources/img/product/3.jpg"
																style="height: 120px; width: 120px;" alt=""></a></td>
														<td class="product-name" style="height: 130px;">
															<p style="font-weight: bold;">${co.mbBizName}</p> <span>${co.pbName}(구매수량
																: ${co.poCnt}개)</span>
															<br>시트 : ${co.coSheet}, 토핑 : ${co.coTopping}, 크림  : ${co.coCream}
															<br> 사이즈 : ${co.coSize} 
														</td>
														<td class="product-price" style="height: 130px;"><span
															class="amount">${co.pbPrice}</span></td>
														<td class="product-subtotal" style="height: 130px;">${co.poCnt}</td>
														<td class="product-subtotal" style="height: 130px;">${co.poPrice}</td>
														<td class="product-subtotal" style="height: 130px;">
														<fmt:formatDate value="${co.poBookDate}" pattern="yyyy-MM-dd HH:mm" />
														</td>
														<td class="product-subtotal" style="height: 130px;">${co.poBizDelivery}
														<input type="hidden" id="type" value="${co.type}">
														</td>
														
														<c:set var="totalPrice" scope="page"
															value="${totalPrice+co.poPrice}" />
														<c:set var="totalDeliveryPrice" scope="page"
															value="${totalDeliveryPrice+co.poBizDelivery}" />
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="row">
										<div class="col-md-8 col-sm-7 col-xs-12"></div>
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
															<c:set var="total" scope="request" value="${totalPrice+totalDeliveryPrice}"/>
															</td>
														</tr>
													</tbody>
												</table>

											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 장바구니 끝 -->
							<br> <br> <br>
							<!-- (배송지 정보 시작, 픽업 선택할 때 말고 배송 선택할 때만 뜨도록 해야함) -->
							<div class="row">
								<h3>
									배송지 정보
									<!-- 주문자 정보와 동일 시작 -->
									<div class="checkout-form-list create-acc"
										style="margin-bottom: 0px; float: right">
										<input id="originalAddress" type="checkbox"> <label>
											주문자 정보와 동일</label>
									</div>
									<!-- 주문자 정보와 동일 끝 -->
								</h3>
								<div class="col-md-12">
									<div class="checkout-form-list height">
										<label>수령인<span class="required">*</span></label> <input
											class="input_height" id="recName" type="text" placeholder="">
									</div>
								</div>

								<div class="col-md-12">
									<div class="checkout-form-list height">
										<label>연락처<span class="required">*</span></label> <input
											class="input_height" id="recCP" type="text" placeholder="">
									</div>
								</div>


								<div class="col-md-8">
									<div class="checkout-form-list height">
										<label>배송지<span class="required">*</span></label><input
											class="input_height" type="text" placeholder="우편번호"
											id="recPost">
									</div>
								</div>

								<div class="col-md-4">
									<div class="country-button height" style="">
										<label><span class="required"></span></label>

										<div class="pink_button">
											<input class="input_height" type="submit" value="우편번호"
												id="postSearch" onclick="DaumPostcode()">
										</div>
									</div>
								</div>


								<div class="col-md-12">
									<div class="checkout-form-list" style="margin-bottom: 10px;">
										<input class="input_height" type="text" placeholder="기본주소"
											id="recBasicAddr">
									</div>
								</div>

								<div class="col-md-12">
									<div class="checkout-form-list" style="margin-bottom: 15px;">
										<input type="text" class="input_height" id="recDetailAddr"
											placeholder="상세주소">
									</div>
								</div>


								<div class="col-md-12">
									<div class="checkout-form-list height">
										<label>배송 메모<span class="required">*</span></label> <input
											class="input_height" type="text" id="recMemo" placeholder="">
											
									</div>
								</div>
								<hr>
							</div>
							<!-- (배송지 정보 끝, 픽업 선택할 때 말고 배송 선택할 때만 뜨도록 해야함) -->

					


						

							<br> <br> <br>
							<!-- 버튼 시작 -->
							<div class="row">
								<div class="col-md-4 col-sm-5 col-xs-5" style="width: 20%; margin-left: 30%">
									<div class="country-button" style="">
										<label><span class="required"></span></label>

										<div class="pink_button">
											<input type="button" value="취소" onclick="location.href='cartList.ca'">
										</div>
									</div>
								</div>

								<div class="col-md-4 col-sm-5 col-xs-5" style="width: 20%;">
									<div class="country-button" style="">
										<label><span class="required"></span></label>
										<div class="pink_button">
											<input type="submit" value="결제하기" id="payStart">
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
	
	<!-- 아임포트 script 코드 시작 -->
<script>
	var IMP = window.IMP; // 생략가능
	/* IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용 */

	IMP.init('imp18428701');

	$(function() {
		//alert($("#next").val());
		$("#accountTransfer").on('change', function() {
			console.log($("#accountTransfer").is(':checked'));
			console.log($("#naverPay").is(':checked'));
			console.log($("#virtualAccount").is(':checked'));
			console.log($("#creditCard").is(':checked'));
		});
		//1.주문자 정보와 동일한 주소 시작//
		$("#payForm").on('submit', function() {
			if ($("#recName").val() == '') {
				alert('수령인 이름을 입력하세요');
				$("#recName").focus();
				event.preventDefault();
			} else if ($("#recCP").val() == '') {
				alert('수령인  전화번호를 입력하세요');
				$("#recCP").focus();
				event.preventDefault();
			} else if ($("#recPost").val() == '') {
				alert('우편번호를 입력하세요');
				$("#recPost").focus();
				event.preventDefault();
			} else if ($("#recBasicAddr").val() == '') {
				alert('기본 주소를 입력하세요');
				$("#recBasicAddr").focus();
				event.preventDefault();
			} else if ($("#recDetailAddr").val() == '') {
				alert('상세주소를 입력하세요');
				$("#recDetailAddr").focus();
				event.preventDefault();
			} else if ($("#recMemo").val() == '') {
				alert('배송 메모를 입력하세요');
				$("#recMemo").focus();
				event.preventDefault();
			}/*  else if ($("#accountTransfer").is(':checked') == false
					&& $("#creditCard").is(':checked') == false
					&& $("#virtualAccount").is(':checked') == false
					&& $("#naverPay").is(':checked') == false) {
				alert('결제 수단을 입력하세요');
				event.preventDefault();
			} */ else {
				event.preventDefault();
				var PG= 'kakao';
				var Pay_Method= 'card';
				/*  if ($("#creditCard").is(':checked') == true) {//필수정보 누락
					PG = 'danal';
					Pay_Method = 'card';
				} else if ($("#accountTransfer").is(':checked') == true) {//등록되지 않은 가맹점
					PG = 'danal';
					Pay_Method = 'trans';
				} else if ($("#virtualAccount").is(':checked') == true) {//등록되지 않은 가맹점
					PG = 'danal';
					Pay_Method = 'vbank';
				} else if ($("#naverPay").is(':checked') == true) {
					PG = 'kakao';
					Pay_Method = 'card';
				} */
					
				 IMP.request_pay(
								{
									pg : PG,
									pay_method : Pay_Method,
									merchant_uid : 'merchant_'
											+ new Date().getTime(),
									amount : '<c:out value="${total}"/>',
									buyer_name : '<c:out value="${member.name}"/>',
									buyer_tel : '<c:out value="${member.phone}"/>',
								
								},
								function(rsp) {
									var URL =null;
									if($("#next").val()=="mix"){
										URL = "/payment.ca";
									}else if($("#next").val()=="directPayment"){
										//alert("next=productDirect");
										URL = "/directPayment.ca";
									}else if($("#next").val()=="directCustomPayment"){
										URL = "/directCustomPayment.ca";
									}
								//	alert(URL);
									if (rsp.success) {
										//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
										$.ajax({
													url : URL, //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
													type : 'POST',
													dataType : 'text',
													data : {
														imp_uid : rsp.imp_uid,
														totalPrice : '<c:out value="${total}"/>',
														method : PG,
														recName : $("#recName").val(),
														recCP : $("#recCP").val(),
														recPost : $("#recPost").val(),
														recBasicAddr : $("#recBasicAddr").val(),
														recDetailAddr : $("#recDetailAddr").val(),
														recMemo : $("#recMemo").val()
														
														
													//기타 필요한 데이터가 있으면 추가 전달
													} ,
													success : 
														function(data) {
															//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
															if (data == "ok") {
																var msg = '결제가 완료되었습니다.';
																msg += '\n고유ID : '
																		+ rsp.imp_uid;
																msg += '\n상점 거래ID : '
																		+ rsp.merchant_uid;
																msg += '\결제 금액 : '
																		+ rsp.paid_amount;
																msg += '카드 승인번호 : '
																		+ rsp.apply_num;
																alert(msg);
															location.href="/checkoutSuccess.ca";
															} else {
																alert('아직 제대로 결제가 되지 않았습니다.');
																//[3] 아직 제대로 결제가 되지 않았습니다.
																//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
															}
													},
													error : function(data) {
														//console.log(data);
														alert("잘못 입력하셨습니다." + data);
													} 
												});
									} else {
										var msg = '결제에 실패하였습니다.';
										msg += '에러내용 : ' + rsp.error_msg;
										alert(msg);
									}
								}); //IMP
			}//else
		})
		;//submit check()

	});//function
</script>
<!-- 아임포트 script 코드 끝 -->

</body>
</html>

