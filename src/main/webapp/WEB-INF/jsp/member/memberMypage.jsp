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


<!-- 주소 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function findPost() {
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
						document.getElementById('inputAddrnum').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('inputAddrB').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('inputAddrD').focus();
					}
				}).open();
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
							<small><b>회원정보수정</b></small>
						</h1>
						<div class="blog-details-area">
							<div
								class="blog-left-single mb-30 res-mb-30 res-mb-sm-30 res-blog-mt-50">
								<div class="left-area">

									<!-- 위의 div 4개는 오른쪽 사이드 설정하는 div -->
									<!-- 여기서부터 마이페이지에 들어가는 내용 변경하기 -->
									<div class="col-md-12">
										<form class="form-horizontal" action="memberModify.ca" method="post">
											<div class="form-group">
												<label class="col-sm-3 control-label" for="inputName">이름</label>
												<div class="col-sm-6">
													<input class="form-control" id="inputName" type="text"
														placeholder="이름" value="${member.name}" readonly name="name">
												</div>
											</div>


											<div class="form-group">
												<label class="col-sm-3 control-label" for="inputEmail">이메일</label>
												<div class="col-sm-6">
													<input class="form-control" id="inputEmail" type="text"
														placeholder="이메일" name="email" value="${member.email}" readonly>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label" for="inputPhone">핸드폰</label>
												<div class="col-sm-6">
													<input class="form-control" id="inputPhone" type="text"
														placeholder="핸드폰 번호" name="phone" value="${member.phone}">
												</div>
											</div>


											<div class="form-group">
												<label class="col-sm-3 control-label" for="inputAddrnum">
													우편번호 </label>
												<div class="col-sm-6">
													<div class="input-group">
														<input class="form-control" id="inputAddrnum" type="text"
															placeholder="우편번호" name="post" value="${member.post }">
														<span class="input-group-btn"> <input type="button"
															class="btn btn-success btn-in"
															style="background-color: #9bcaba; border: 0; height: 50px;"
															id="post_find" value="우편찾기" onclick="findPost()">
														</span>
													</div>
												</div>
											</div>


											<div class="form-group">
												<label class="col-sm-3 control-label" for="inputAddrB">기본주소</label>
												<div class="col-sm-6">
													<input class="form-control" type="text" placeholder="기본주소"
														id="inputAddrB" name="addressBasic"
														value="${member.addressBasic }">
												</div>
											</div>



											<div class="form-group">
												<label class="col-sm-3 control-label" for="inputAddrD">상세주소</label>
												<div class="col-sm-6">
													<input class="form-control" type="text" id="inputAddrD"
														placeholder="나머지 주소를 입력해주세요" name="addressDetail"
														value="${member.addressDetail }">
												</div>
											</div>


											<!-- 사진등록 -->
											<div class="form-group">
												<label class="col-sm-3 control-label" for="inputPhoto">사진등록</label>
												<div class="col-sm-6">
													<input class="form-control" type="file" name= "photo" id="inputFile" value="${member.photo}">
												</div>
											</div>

											<!-- <div class="form-group">
												<label class="col-sm-3 control-label" for="inputNumberCheck">인증번호
													확인</label>
												<div class="col-sm-6">
													<div class="input-group">
														<input class="form-control" id="inputNumberCheck"
															type="text" placeholder="인증번호"> <span
															class="input-group-btn">
															<button class="btn btn-success"
																style="background-color: #9bcaba; font-size: 12px; margin-left: 5px"
																type="button">
																인증번호 확인 <i class="fa fa-edit spaceLeft"></i>
															</button>
														</span>
													</div>
													<p class="help-block">전송된 인증번호를 입력해주세요.</p>
												</div>
											</div> -->

											<div class="form-group">
												<div class="col-sm-12 text-center">
													<input class="btn btn-primary" type="submit" id="join"
														style="background-color: #f6c6c9; border: 0px; width: 200px;"
														value="회원정보수정"> 
													<input type="reset"
														class="btn btn-danger" id="cancel"
														style="background-color: #9bcaba; border: 0px; width: 200px;"
														value="정보입력취소">
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
	<!-- 유효성검사 자바스크립트 -->
	<script src="/resources/js/modifyMember.js"></script>
</body>
</html>
