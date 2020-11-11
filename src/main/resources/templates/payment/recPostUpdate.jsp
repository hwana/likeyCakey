<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="member" value="${sessionScope.member}" />
<c:set var="poNum" value="${requestScope.poNum}" />

<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>배송지 정보 수정창</title>
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
<!-- 추가해야하는 js 벤더 -->
<script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>
<!-- 추가해야하는 js 벤더 끝-->
	
<!-- 주소 라이브러리 추가 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 주소 라이브러리 추가 끝 -->
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
<style>
body {
	text-align: center; /* Quirks Mode 를 위한 가운데 정렬 */
}

td {
	padding-top: 10px !important;
	padding-bottom: 10px !important;
	text-align: center;
	margin: 0 auto;
}

th {
	padding-top: 10px !important;
	padding-bottom: 10px !important;
	text-align: center;
	margin: 0 auto;
}

.input_height {
	height: 33px !important;
}

.height {
	height: 50px !important;
	margin-bottom: 20px !important;
}
</style>
</head>
<body>

	<!-- <section class="page-content-wrapper pt-100 pb-40"
		style="padding-top: 0px;"> -->
		<!-- coupon-area start -->
		<form action="recPostUpdate.ca" id="recPostUpdateForm">
			<input type="hidden" value="${poNum}" id="poNum" name="poNum">
			<div class="container">
				<div class="row">

					<!-- Page Content Wraper Area Start -->
					<section class="page-content-wrapper pt-100 pb-40"
						style="padding-top: 0px;">
						<!-- ㅇㅇㅇ -->
						<div class="checkbox-form" style="padding-left: 5%; padding-right: 5%;">

							<!-- ㅇㅇㅇ
 -->



							<br>
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
										<label style="float: left">수령인<span class="required">*</span></label>
										<input class="input_height" id="recName" type="text" name="recName"
											placeholder="">
									</div>
								</div>

								<div class="col-md-12">
									<div class="checkout-form-list height">
										<label style="float: left">연락처<span class="required">*</span></label>
										<input class="input_height" id="recCP" type="text" name="recCP"
											placeholder="">
									</div>
								</div>


								<div class="col-md-8">
									<div class="checkout-form-list height">
										<label style="float: left">배송지<span class="required">*</span></label><input
											class="input_height" type="text" placeholder="우편번호" name="recPost"
											id="recPost">
									</div>
								</div>

								<div class="col-md-4">
									<div class="country-button height" style="">
										<label><span class="required"></span></label>

										<div class="pink_button">
											<input class="input_height" type="button" value="우편번호"
												id="postSearch" onclick="DaumPostcode()">
										</div>
									</div>
								</div>


								<div class="col-md-12">
									<div class="checkout-form-list" style="margin-bottom: 10px;">
										<input class="input_height" type="text" placeholder="기본주소" name="recBasicAddr"
											id="recBasicAddr">
									</div>
								</div>

								<div class="col-md-12">
									<div class="checkout-form-list" style="margin-bottom: 15px;">
										<input type="text" class="input_height" id="recDetailAddr" name="recDetailAddr"
											placeholder="상세주소">
									</div>
								</div>


								<div class="col-md-12">
									<div class="checkout-form-list height">
										<label style="float: left">배송 메모<span class="required">*</span></label>
										<input class="input_height" type="text" id="recMemo" name="recMemo"
											placeholder="">
									</div>
								</div>
								
							</div>
							<!-- (배송지 정보 끝, 픽업 선택할 때 말고 배송 선택할 때만 뜨도록 해야함) -->


							<!-- 버튼 시작 -->
							<div class="row">
								 <!-- <div class="col-md-4 col-sm-5 col-xs-5"> -->
									<div class="country-button" style="">
										<label><span class="required"></span></label>
										<div class="pink_button">
											<input type="submit" value="수정" style="width:20%; margin-right:5%">
											<input type="button" value="닫기" onclick='self.close()' style="width:20%; margin-left:5%">
										</div>
									</div>
								<!-- </div> -->
							</div>
							<!-- 버튼 끝 -->

						</div>
					</section>
				</div>
			</div>
		</form>
		<!-- checkout-area end -->
	<!-- </section> -->


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

	<script>
		$(function() {

			$("#recPostUpdateForm").on(
					'submit',
					function() {
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
						} else {
							//업데이트 시작			
							//.serialize를 사용하여 폼에 저장된 모든 데이터를 가져온다.
							var form_data = $("#recPostUpdateForm").serialize();
							$.ajax({
								url : "recPostUpdate.ca",
								type : "post",
								data : form_data,
								success : function(value) {//
									if (value == "ok") {
										alert("주소지 변경에 성공했습니다.");
										window.opener.location.reload();//부모창 재로딩, window.opener는 자식창을 열어준 창에 접근하는 접근자!

										self.close();
										//location.reload();
									} else {
										alert("주소지 변경에 실패했습니다.");
									}
								},
								error : function(value) {
									alert("잘못 입력하셨습니다." + value);
								}
							});//AJAX
							return false;

						}//else

					});//recPostUpdateForm
		});//function()
	</script>
	<script type="text/javascript">
		$(function() {
			
			//1.주문자 정보와 동일한 주소 시작//
			$("#originalAddress")
					.click(
							function() {

								if ($(this).is(":checked")) {
									var recName = "<c:out value='${member.name}'/>";
									var recCP = "<c:out value='${member.phone}'/>";
									var recPost = "<c:out value='${member.post}'/>";
									var recBasicAddr = "<c:out value='${member.addressBasic}'/>";
									var recDetailAddr = "<c:out value='${member.addressDetail}'/>";
									$("#recName").val(recName).attr("readonly",
											true);
									/* $("#recName").readOnly=true; */
									$("#recCP").val(recCP).attr("readonly",
											true);
									$("#recPost").val(recPost).attr("readonly",
											true);
									$("#recBasicAddr").val(recBasicAddr).attr(
											"readonly", true);
									$("#recDetailAddr").val(recDetailAddr)
											.attr("readonly", true);
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

		});
	</script>
</body>
</html>