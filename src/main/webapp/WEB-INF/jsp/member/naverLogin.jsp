<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div id="naver_id_login"></div>

	<script type="text/javascript">
		//client_id 와 redirect_uri 등록

		var naver_id_login = new naver_id_login("zWIQFmZiGAZ2qCOwYWjl",
				"http://127.0.0.1:8088/bizLogin.ca");

		/* 사용 가능한버튼 Option
		버튼 색상 : white, green
		크기 : 1(버튼형), 2(작은 배너), 3(큰 배너)
		배너 및 버튼 높이 : 사용자 지정값 */

		naver_id_login.setButton("green", 1, 40);
		naver_id_login.setDomain(".service.com");
		naver_id_login.setState("abcdefghijkmnopqrst");

		//로그인 popup 형태로 설정

		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
		
		function testcallback()
		{
			alert(naver_id_login.getProfileData('email'));
			alert(naver_id_login.getProfileData('name'));
			alert(naver_id_login.getProfileData('age'));
		}

		naver_id_login.get_naver_userprofile("testcallback()");
	</script>
	<div id="naver_id_login"></div>
	<!-- 버튼이 들어갈 위치 선언-->
