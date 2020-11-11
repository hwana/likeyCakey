<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>LikeyCakey 마이페이지</title>
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
<!-- 유효성 검사를 위한 자바스크립트 -->
<script type="text/javascript"
	src="/resources/js/vendor/jquery-1.12.4.min.js"></script>

<script>
	// 비밀번호 확인
	function checkPwd() {
		var pw1 = $("#inputPassword").val();
		var pw2 = $("#inputPasswordCheck").val();
		var pwcheck = $("#pwcheck").val();

		if (pw1 != null && pw2 != null) {
			if (pw1 != pw2) {
				document.getElementById('pwcheck_change').style.color = "red";
				document.getElementById('pwcheck_change').innerHTML = "동일한 암호를 입력하세요.";
				pwcheck = false;
				return pwcheck;
			} else {
				document.getElementById('pwcheck_change').style.color = "blue";
				document.getElementById('pwcheck_change').innerHTML = "암호가 동일합니다.";
				pwcheck = true;
				return true;
			}
		}
	}
</script>
</head>
<body class="other-page blog">


	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Header Area Start -->
	<!-- 지연 헤더 파일있는 폴더 경로 -->
	<%@ include file="../default/header.jsp"%>
	<!-- Header Area End -->


	<!-- Page Content Wraper Area Start -->
	<section class="page-content-wrapper">
		<div class="container">
			<div class="row">
				<div class="content-full ptb-50 fix" style="margin: 0 auto;">
					<!-- Left Side Start -->
					<%@ include file="leftside.jsp"%>
					<!-- Left Side End -->


					<!-- Right Side Start -->
					<div class="col-md-10">
						<span style="border: 2px solid pink;"></span>&nbsp;&nbsp;
						<h1 style="display: inline; margin-top: 0">
							<small><b>비밀번호수정</b></small>
						</h1>
						<div class="blog-details-area">
							<div
								class="blog-left-single mb-30 res-mb-30 res-mb-sm-30 res-blog-mt-50">
								<div class="left-area">

									<!-- 위의 div 4개는 오른쪽 사이드 설정하는 div -->
									<!-- 여기서부터 마이페이지에 들어가는 내용 변경하기 -->
									<div class="col-md-12">
										<form class="form-horizontal" action="memberPwchange.ca"
											method="post">

											<div class="form-group">
												<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
												<div class="col-sm-6">
													<input class="form-control" id="inputPassword"
														type="password" placeholder="비밀번호" name="passwd">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label"
													for="inputPasswordCheck">비밀번호 확인</label>
												<div class="col-sm-6">
													<input class="form-control" id="inputPasswordCheck"
														type="password" placeholder="비밀번호 확인" onkeyup="checkPwd()">
													<p class="help-block" id="pwcheck_change">비밀번호를 바꾸시려면
														새로운 번호를 동일하게 입력해주세요.</p>
												</div>
											</div>


											<div class="form-group">
												<div class="col-sm-12 text-center">
													<input class="btn btn-primary" type="submit" id="chpw"
														style="background-color: #f6c6c9; border: 0px; width: 200px;"
														value="비밀번호 변경"> 
													<input type="reset"
														class="btn btn-danger" id="cancel"
														style="background-color: #9bcaba; border: 0px; width: 200px;"
														value="입력 취소">
												</div>
											</div>
										</form>
										<hr>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Right Side End -->



					<!-- 페이징 처리 필요하면 이거 틀 사용해서 만들기!!! -->
					<!-- Page Pagination Start -->
					<!-- <div class="col-md-12 col-sm-12">
						<div class="page-pagination text-center pt-55 res-tb-25">
							<ul>
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li class="next"><a href="#"><span class="icon-left"
										data-icon="&#x24;"></span></a></li>
							</ul>
						</div>
					</div> -->
					<!-- Page Pagination End -->
				</div>
			</div>
		</div>
	</section>
	<!-- Page Content Wraper Area End -->
	<!-- Footer 따로 뺀 후 페이지에 포함 : 지연 -->
	<%@ include file="../default/footer.jsp"%>
	<!-- FOOTER END -->

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
	<script src="/resources/js/pwchange.js"></script>
</body>
</html>
