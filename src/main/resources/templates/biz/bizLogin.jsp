<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 카카오 로그인을 위한 API 경로지정 -->
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- for naver login api -->
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
<script src="js/jquery.innerfade.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"></script>
<script type="text/javascript" src="jquery.cookie.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, div, body, h3 {
	margin: 0;
	padding: 0;
}

h3 {
	display: inline-block;
	padding: 0.6em;
}
</style>

<!-- <script type='text/javascript'>
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('YOUR APP KEY');
	function loginWithKakao() {
		// 로그인 창을 띄웁니다.
		Kakao.Auth.login({
			success : function(authObj) {
				alert(JSON.stringify(authObj));
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
	};
	//]]>
</script> -->

<script>
	$(document)
			.ready(
					function() {
						Kakao.init("40a1519b1664a63360f87490b7164bf3");
						function getKakaotalkUserProfile() {
							Kakao.API
									.request({
										url : '/v1/user/me',
										success : function(res) {
											$("#kakao-profile").append(
													res.properties.nickname);
											$("#kakao-profile")
													.append(
															$(
																	"<img/>",
																	{
																		"src" : res.properties.profile_image,
																		"alt" : res.properties.nickname
																				+ "님의 프로필 사진"
																	}));
										},
										fail : function(error) {
											console.log(error);
										}
									});
						}

						/* function createKakaotalkLogin() {
							$(
									"#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn")
									.remove();
							var loginBtn = $("<a/>", {
								"class" : "kakao-login-btn",
								"text" : "로그인"
							});
							loginBtn.click(function() {
								Kakao.Auth.login({
									persistAccessToken : true,
									persistRefreshToken : true,
									success : function(authObj) {
										getKakaotalkUserProfile();
										createKakaotalkLogout();
									},
									fail : function(err) {
										console.log(err);
									}
								});
							});
							$("#kakao-logged-group").prepend(loginBtn)
						} */

						function createKakaotalkLogout() {
							$(
									"#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn")
									.remove();
							var logoutBtn = $("<a/>", {
								"class" : "kakao-logout-btn",
								"text" : "로그아웃"
							});
							logoutBtn.click(function() {
								Kakao.Auth.logout();
								createKakaotalkLogin();
								$("#kakao-profile").text("");
							});
							$("#kakao-logged-group").prepend(logoutBtn);
						}
						if (Kakao.Auth.getRefreshToken() != undefined
								&& Kakao.Auth.getRefreshToken().replace(/ /gi,
										"") != "") {
							createKakaotalkLogout();
							getKakaotalkUserProfile();
						} else {
							createKakaotalkLogin();
						}
					});
</script>

<%@ include file="../default/header.jsp"%>


<script type="text/javascript">
	$(document).ready(function() {

		// 일반회원 아이디 저장하기
		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		var userInputId1 = getCookie("userInputId");
		$(".id").val(userInputId1);
		console.log("0" + userInputId1);
		if ($(".id").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
			$(".remember").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
			console.log("1" + userInputId1);
		}

		$(".remember").change(function() { // 체크박스에 변화가 있다면,
			if ($(".remember").is(":checked")) { // ID 저장하기 체크했을 때,
				var userInputId1 = $(".id").val();
				setCookie("userInputId1", userInputId1, 7); // 7일 동안 쿠키 보관
				console.log("2" + userInputId1);
			} else { // ID 저장하기 체크 해제 시,
				deleteCookie("userInputId1");
			}
		});

		// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		$(".id").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
			if ($(".remember").is(":checked")) { // ID 저장하기를 체크한 상태라면,
				var userInputId = $(".id").val();

				setCookie("userInputId1", userInputId1, 7); // 7일 동안 쿠키 보관
				console.log("3" + userInputId1);
			}
		});

		// 사업자 아이디 저장하기
		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		var userInputId2 = getCookie("userInputId2");
		$("#username").val(userInputId2);
		console.log("0" + userInputId2);
		if ($("#username").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
			$(".remember").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
			console.log("1" + userInputId2);
		}

		$(".remember").change(function() { // 체크박스에 변화가 있다면,
			if ($(".remember").is(":checked")) { // ID 저장하기 체크했을 때,
				var userInputId2 = $("#username").val();
				setCookie("userInputId2", userInputId2, 7); // 7일 동안 쿠키 보관
				console.log("2" + userInputId2);
			} else { // ID 저장하기 체크 해제 시,
				deleteCookie("userInputId2");
			}
		});

		// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		$("#username").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
			if ($(".remember").is(":checked")) { // ID 저장하기를 체크한 상태라면,
				var userInputId = $("#username").val();

				setCookie("userInputId2", userInputId2, 7); // 7일 동안 쿠키 보관
				console.log("3" + userInputId2);
			}
		});

		$("#biz_login").click(function() {
			//.serialize를 사용하여 폼에 저장된 모든 데이터를 가져온다.
			var form_data = $("#register-form").serialize();
			$.ajax({
				type : "POST",
				url : "loginCheck2.ca",
				dataType : "text",
				data : form_data,
				success : function(data) {
					if (data == "ok") {
						alert("로그인에 성공하셨습니다.")
						location.href = "home.ca?id=" + username.value;
					} else {
						$(".message").html("아이디 또는 비밀번호가 잘못되었습니다.");
					}
				}
			});//ajax
		});//submit
	});//ready

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
</script>

<div class="container" id="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-login" id="panel-login">
				<div class="panel-heading" id="panel-heading">
					<div class="row">
						<div class="col-xs-12">
							<a href="#" id="biz-member-link">로그인</a>
						</div>
					</div>
					<hr>
				</div>


				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<form id="register-form" action="loginCheck2.ca" method="post"
								role="form"  class="form-horizontal">

								<div class="form-group">
									<label class="col-xs-3 text-right" id="id">아이디</label>

									<div class="col-xs-8">

										<input type="text" name="id" tabindex="1" id="username"
											class="form-control username" placeholder="아이디를 입력하세요.">

									</div>



									<label class="col-xs-3 text-right">비밀번호</label>
									<div class="col-xs-8">


										<input type="password" name="passwd" tabindex="2"
											class="form-control" placeholder="비밀번호를 입력하세요.">
									</div>
								</div>
								<div class="col-xs-12 message"
									style="text-align: center; color: red; margin-bottom: 10px;"></div>
								<div class="row">
									<div class="col-xs-8 col-xs-offset-2">

										<input type="button" name="login-submit" tabindex="4"
											class="form-control btn btn-login login-submit"
											id="biz_login" value="로그인">
									</div>
								</div>
								<div class="row text-center">
									<input type="checkbox" class="remember" name="remember">
									<label for="remember"> 아이디 저장하기</label>
								</div>

								<div class="row">
									<div class="col-xs-5 text-right">
										<a href="bizJoin.ca" class="forgot-password">회원가입</a>
									</div>
									<div class="col-xs-5 text-left">
										<a href="findIdPw.ca" class="forgot-password">아이디/비밀번호 찾기</a>
									</div>
								</div>

								<div id="kakao-logged-group"></div>
								<div id="kakao-profile"></div>
								<%-- <%@include file="../member/naverLogin.jsp"%> --%>

								<!-- naver login -->
								<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
								<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
								<div id="naverIdLogin"></div>
								<!-- 버튼이 들어갈 위치 선언. ID는 반드시 지정된 값으로 설정하여야 합니다.-->

								<script type="text/javascript">
								var naverLogin = new naver.LoginWithNaverId(
								{
									clientId: "{zWIQFmZiGAZ2qCOwYWjl}",
									callbackUrl: "{http://192.168.219.103:8088/home.ca}",
									loginButton: {color: "green", type: 2, height: 50} /* 로그인 버튼의 타입을 지정 */
								}
								);
	
							   /* 설정정보를 초기화하고 연동을 준비 */
								naverLogin.init();
								</script>
							</form>

							<!-- API 간편 로그인 - kakao -->
							<!-- 						<div style="margin: 0 auto">
								<a id="custom-login-btn" href="javascript:loginWithKakao()">
									<img
									src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
									width="200" />
								</a>
							</div>
-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="resources/js/login.js"></script>
<script type="text/javascript" src="resources/js/jquery.cookie.js"></script>
</body>

</html>
