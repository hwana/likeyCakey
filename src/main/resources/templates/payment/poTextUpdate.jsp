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
<title>케이크 문구 수정창</title>
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
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
<!-- 추가해야하는 js 벤더 -->
<script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>
<!-- 추가해야하는 js 벤더 끝-->
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

		<!-- coupon-area start -->

		<div class="container">
			<div class="row">

				<!-- Page Content Wraper Area Start -->
				<section class="page-content-wrapper pt-100 pb-40"
					style="padding-top: 0px;padding-left: 5%; padding-right: 5%;">
					<br><br>
					<p>수정할 문구를 입력해 주세요.</p>
					<br>
					<input id="poText" type="text" name="poText">
					<input type="hidden" name="poNum" value="${poNum}">
				
	<br><br><br>
						<!-- 버튼 시작 -->
							<div class="row">
				
									<div class="country-button" >
										<div class="pink_button">
											<input type="button" value="수정" id="textUpdate" style="width:20%; margin-left:5%">
												<input type="button" value="닫기" onclick='self.close()' style="width:20%; margin-left:5%">
										</div>
									</div> 
						

							</div>
							<!-- 버튼 끝 -->
					
					
					
				</section>
			</div>
		</div>

		<!-- checkout-area end -->

<script>
$(function() {

			$("#textUpdate").on(
					'click',
					function() {
						if ($("#poText").val() == '') {
							alert('문구를 입력하세요');
							$("#poText").focus();
							event.preventDefault();
						} else {
							//업데이트 시작			
							$.ajax({
								url : "poTextUpdate.ca",
								type : "post",
								data :{
									poText : $("#poText").val(),
									poNum : '<c:out value="${poNum}"/>'
								},
								success : function(value) {//
									if (value == "ok") {
										alert("문구 변경에 성공했습니다.");
										window.opener.location.reload();//부모창 재로딩, window.opener는 자식창을 열어준 창에 접근하는 접근자!
										self.close();
										//location.reload();
									} else {
										alert("문구 변경에 실패했습니다.");
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