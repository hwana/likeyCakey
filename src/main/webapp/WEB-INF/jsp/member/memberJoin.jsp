<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>LikeyCakey 회원가입</title>
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

<style>
html>body>section>div>div>div>form span>.btn-in {
	background: #9bcaba;
	width: 100px;
	border-radius: 1px;
	font-size: 10px;
	text-align: center;
	padding: 15px;
	line-height: 10px
}
</style>

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
	
	// 이용약관을 펼쳐볼 수 있는 토글
	function openDiv() {
		 $("#yak_div").toggle();
	}

	// 비밀번호 확인
	function checkPwd() {
		var pw1 = $("#inputPassword").val();
		var pw2 = $("#inputPasswordCheck").val();
		var pwcheck = $("#pwcheck").val();
		var pwP = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; // 비밀번호

		if (pw1 != null && pw2 != null) {
			if (!pwP.test($("#inputPassword").val())) {
				alert("비밀번호 형식은 영어, 숫자포함 6~20 자리 입니다.");
				$("#inputPassword").val("");
				$("#inputPassword").focus();
				return false;
			} else {
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
	}
</script>

<script>
	$(document)
			.ready(
					function() {
						$("#check_id")
								.click(
										function() {
											$
													.ajax({
														url : "dupid.ca",
														data : {
															id : $("#inputId")
																	.val()
														},
														dataType : "text",
														type : "post",
														success : function(
																value) {
															if (value == "ok") {
																var idcheck = $(
																		'#idcheck')
																		.val();
																document
																		.getElementById('idcheck_change').style.color = "blue";
																document
																		.getElementById('idcheck_change').innerHTML = "사용가능한 아이디입니다.";
																alert("사용가능한 아이디입니다.");
																$(
																		'input[name=passwd]')
																		.focus();
																idcheck = true;
																return idcheck;
															} else {
																var idcheck = $(
																		'#idcheck')
																		.val();
																document
																		.getElementById('idcheck_change').style.color = "red";
																document
																		.getElementById('idcheck_change').innerHTML = "이미 존재하는 아이디입니다.";
																alert("이미 존재하는 아이디입니다. 아이디를 다시 설정하세요");
																$('#inputId')
																		.select();
																idcheck = false;
																return idcheck;
															}
														},
														error : function(value) {
															alert("잘못 입력하셨습니다."
																	+ value);
														}
													});
											return false;
										}); //click
					}); //ready
</script>


</head>
<body class="other-page">

	<!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

	<!-- Header Area Start -->
	<%@ include file="../default/header.jsp"%>
	<!-- Header Area End -->

	<!-- Page Content Wraper Area Start -->
	<!-- 메인 사이에 들어가는 내용 - 회원가입 : 지연 -->
	<section class="page-content-wrapper login-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="page-header">
						<h1>
							회원가입 <small>[Likey Cakey 일반 회원]</small>
						</h1>
					</div>
					<form class="form-horizontal" action="memberInsert.ca"
						method="post" name="memberJoin">
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputId" style="line-height:36px;">아이디</label>
							<div class="col-sm-6">
								<div class="input-group">
									<input type="text" class="form-control" id="inputId" name="id"
										placeholder="아이디" /> <span class="input-group-btn"> <input
										class="btn btn-success btn-in"
										style="border: 0; height: 50px;" id="check_id" type="button"
										value="중복확인"> <!-- 아이디를 중복확인 하였는지에 대한 상태 확인 --> <input
										type="hidden" id="idcheck" value="false">
									</span>
								</div>
								<p class="help-block" id="idcheck_change">※ 아이디 중복확인을 해주세요</p>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputPassword"  style="line-height:36px;">비밀번호</label>
							<div class="col-sm-6">
								<input class="form-control" id="inputPassword" type="password"
									placeholder="숫자, 영어를 조합하여 6~20자리의 비밀번호를 입력해주세요." name="passwd">
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputPasswordCheck" style="line-height:36px;">비밀번호
								확인</label>
							<div class="col-sm-6">
								<input class="form-control" id="inputPasswordCheck"
									type="password" placeholder="비밀번호 확인" onkeyup="checkPwd()">
								<p class="help-block" id="pwcheck_change">비밀번호를 한번 더 입력해주세요.</p>
							</div>
						</div>

						<input type="hidden" id="pwcheck" value="false">


						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputName" style="line-height:36px;">이름</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="inputName"
									type="text" placeholder="이름" name="name" />
							</div>
						</div>
						
						<!-- 휴대폰 -->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputPhone" style="line-height:36px;">휴대폰번호</label>
							<div class="col-sm-6">
								<input class="form-control" type="tel" placeholder="-(대시)를 입력해주세요"
									name="phone" id="inputPhone">
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputEmail" style="line-height:36px;">이메일</label>
							<div class="col-sm-6">
								
									<input type="text" class="form-control" id="inputEmail"
										placeholder="이메일" name="email" /> 
								
							</div>
						</div>
						
							
						
						
						
						
						

						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputAddrnum" style="line-height:36px;">
								우편번호 </label>
							<div class="col-sm-6">
								<div class="input-group">
									<input class="form-control" id="inputAddrnum" type="text"
										placeholder="우편번호" name="post"> <span
										class="input-group-btn"> <input type="button"
										class="btn btn-success btn-in"
										style="border: 0; height: 50px;" id="post_find" value="우편찾기"
										onclick="findPost()">
									</span>
								</div>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputAddrB" style="line-height:36px;">기본주소</label>
							<div class="col-sm-6">
								<input class="form-control" type="text" placeholder="기본주소"
									id="inputAddrB" name="addressBasic">
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputAddrD" style="line-height:36px;">상세주소</label>
							<div class="col-sm-6">
								<input class="form-control" type="text" id="inputAddrD"
									placeholder="나머지 주소를 입력해주세요" name="addressDetail">
							</div>
						</div>


						<!-- jQuery와 Postcodify를 로딩한다 -->
						<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

						<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
						<script>
							$(function() {
								$("#post_find").postcodifyPopUp();
							});
						</script>


						<!-- 사진등록 -->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputPhoto" style="line-height:36px;">사진등록</label>
							<div class="col-sm-6">
								<input class="form-control" type="file" id="inputFile">
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputAgree">약관
								동의</label>
							<div class="col-sm-6" data-toggle="buttons">
								<input id="agree" name="agree" type="checkbox" class="col-sm-3" style="width : 20px; height:20px;" 
								checked> 
								&nbsp;&nbsp;<input type="button" id="agree_btn" value="이용약관 확인" style="width:100px; height:30px; background-color : white; border : 0px;"
								onclick="openDiv()">
							</div>
						</div>
						
						<div class="form-group" id="yak_div" style="display:none">
							<label class="col-sm-3 control-label" for="inputExp"></label>
							<div class="col-sm-6">
								<textarea rows="20" cols="150">가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
								
								&lt;회원가입&gt;
- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
만14세 미만 아동 회원가입 
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
단체아이디 회원가입 
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다. 
넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다. 
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다. 
- 신용카드 결제시 : 카드사명, 카드번호 등
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호
나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다. 
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공 
- 생성정보 수집 툴을 통한 수집
   </textarea>
							</div>
						</div>
						
						
						
						
						
						
						<div class="form-group">
							<div class="col-sm-12 text-center">
								<input class="btn btn-primary" type="submit" id="join"
									style="background-color: #f6c6c9; border: 0px; width: 200px;"
									value="회원가입"> <input type="reset"
									class="btn btn-danger" id="cancel"
									style="background-color: #9bcaba; border: 0px; width: 200px;"
									value="가입 취소">
							</div>
						</div>
					</form>
					<hr>
				</div>
			</div>
		</div>
	</section>

	<!-- Page Content Wraper Area End -->
	<!-- Footer 따로 뺀 후 페이지에 포함 : 지연 -->
	<%@ include file="../default/footer.jsp"%>


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
	<script src="/resources/js/vendor/modernizr-2.8.3.min.js"></script>
	<!-- 유효성 검사하는 js -->
	<script src="/resources/js/mem_join.js"></script>
</body>
</html>