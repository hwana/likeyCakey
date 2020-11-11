<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- for naver login api -->
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
<script src="/resources/js/jquery.innerfade.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"></script>
<script type="text/javascript" src="jquery.cookie.js"></script>

<%@ include file="../default/header.jsp"%>

<script>
$(document).on('click','#findId',function(){
	var name = $('#name').val();
 	var email = $('#email').val();
 	var postData = {'name' : name , 'email' : email};

	$.ajax({
        url:'findingId.ca',
        type:'POST',
        data: postData,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType : "json",

        success:function(data){
        	var ur_id = data.id;
       	 	$("#urId").append("<h1>"+"회원님의 정보로 등록된 아이디는 : "+ur_id+" 입니다.</h1>")
        },
        error: function (XMLHttpRequest, textStatus, errorThrown){
        	alert('정보를 다시 입력해주시길 바랍니다.' );
        }
    });
});

</script>

<div class="container" id="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-login" id="panel-login">
				<div class="panel-heading" id="panel-heading">
					<div class="row">
						<div class="col-xs-6">
							<a href="#" class="active" id="id-find-link">아이디찾기</a>
						</div>
						<div class="col-xs-6">
							<a href="#" id="pw-find-link">비밀번호 찾기</a>
						</div>
					</div>
					<hr>
				</div>


				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
						
							<!-- 아이디를 찾기 위한 폼 -->
							<form id="id-find" action="findingId.ca"
								class="form-horizontal" method="post" role="form"
								style="display: block;">
								<div class="form-group">
									<label class="col-xs-3 text-right" id="email" for="email">이메일</label>
									<div class="col-xs-8">
										<input type="text" name="email" tabindex="1" id="email"
											class="form-control" placeholder="가입 이메일을 입력하세요.">
									</div>

									<label class="col-xs-3 text-right">이름</label>
									<div class="col-xs-8">
										<input type="text" name="name" id="name"
											tabindex="2" class="form-control" placeholder="가입 이름을 입력하세요.">
									</div>
									<div id="found_id"></div>
								</div>

								<div class="row">
									<div class="col-xs-8 col-xs-offset-2">
										<input type="button" name="login-submit"
											tabindex="4" class="form-control btn btn-login login-submit" value="아이디 찾기"
											id="findId">
									</div>
								</div>
								<div id="urId"></div>
							</form>

							
							<!-- 비밀번호를 찾기 위한 폼 -->
							<form id="pw-find" action="findingPw.ca" method="post"
								role="form" style="display: none;" class="form-horizontal">

								<div class="form-group">
									<label class="col-xs-3 text-right" id="id">아이디</label>
									<div class="col-xs-8">
										<input type="text" name="id" tabindex="1" id="username"
											class="form-control username" placeholder="아이디를 입력하세요.">
									</div>

									<label class="col-xs-3 text-right">이메일</label>
									<div class="col-xs-8">
										<input type="text" name="email" id="email"
											tabindex="2" class="form-control" placeholder="이메일을 입력하세요.">
									</div>
								</div>
								<div class="col-xs-12 message"
									style="text-align: center; color: red; margin-bottom: 10px;"></div>
								<div class="row">
									<div class="col-xs-8 col-xs-offset-2">

										<input type="button" name="login-submit" tabindex="4"
											class="form-control btn btn-login login-submit" value="비밀번호 찾기"
											id="forgot-find-pw">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="resources/js/find.js"></script>
</body>
<%@include file="../default/footer.jsp" %>
</html>
