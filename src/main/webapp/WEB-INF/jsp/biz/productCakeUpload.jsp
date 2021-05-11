<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../default/header.jsp"%>

<style>
	label{margin-top:10px;}
	.radio{
	height : auto;
	width : auto;
	font-size : 15px;
	margin : auto 0;
}
.checkbox{
	margin-top:18px;
}



#join{
	background : #f6c6c9;
}

#cancle{
	background : #9bcaba;
}

#joinbutton{
	margin-top : 30px;
}



input[type="file"] {
    display: none;
}

#search{
	border:none;
	margin-top:3px;
	background : #9bcaba;
}

</style>

<script>
	$(document).ready(function(){
		
		$("input[id='file']").change(function (e) {
			var $this = $(this);
		    $("input[id='inputImage']").val($this.val().split('\\').pop());
		});
		
		var value = 1;
		$("#plus").click(function () {
			var length = $(".inputtag").length;
					if(length < 5){
						$('.tag').each(function(){
							$(this).append('<div class = "form-group"><div class="col-sm-6 col-sm-offset-3"><input class="form-control inputtag" name = "inputtag'+(value)+'" type="text" placeholder="태그입력"><br></div></div>');
							value++;
						});
					}else{
						alert("태그는 5개까지 입력 가능합니다.");
					}
			});
		});
	
</script>

<!-- Page Content Wraper Area Start -->
<section class="page-content-wrapper">
	<div class="container">
		<div class="row">
			<div class="content-full ptb-50 fix" style="margin: 0 auto;">


				<!-- Left Side Start -->
				<div class="col-md-2">
					<div class="right-area">
						<div class="product-filter">
							<!-- Category Product -->
							<div class="category">
								<h4>My Page</h4>
								<div class="category-list mt-20">
									<ul>
										<!-- li style="border-bottom:0px;" << 라인 없애기 -->
										<li style="border-bottom: 0px;"><a href="pcSelect.ca"><i
												class="zmdi zmdi-chevron-right"></i>케이크 등록하기</a></li>
										<li style="border-bottom: 0px;"><a href="bizMypageModify.ca"><i
												class="zmdi zmdi-chevron-right"></i>사업가 정보 수정</a></li>
										<li style="border-bottom: 0px;"><a href="#"><i
												class="zmdi zmdi-chevron-right"></i>주문내역</a></li>
									

									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Left Side End -->

				<!-- Right Side Start -->
				<div style = "margin-bottom : 30px;">
				<span style="border: 2px solid pink;"></span>&nbsp;&nbsp;
				<h1 style="display: inline; margin-top: 0">
					<small><b>케이크 등록하기</b></small>
				</h1>
				</div>
				<br>
				<c:set var="member" value="${sessionScope.member}"/>
				<article class="container">
					<div class="col-md-10">
						
						<form class="form-horizontal" action="cakeInsert.ca" method="POST" enctype="multipart/form-data">
						<!-- 아이디를 사용해서 아이디에 해당하는 멤버의 쿼리로 주소를 가져옴 -->
							<input type="hidden" name="id" value="${member.id }"></input>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputID">이미지</label>
								<div class="col-sm-4">
									<input class="form-control" id="inputImage" type="text" placeholder="이미지" name="inputImage">
								</div>	
								
								<label for="file" class="btn btn-success btn-lg" id="search">이미지 찾기</label>
								<input id="file" type="file" name="file"/>
								
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputCakeName">케이크 이름</label>
								<div class="col-sm-6">
									<input class="form-control" id="inputCakeName" name="pName" type="text"
										placeholder="케이크 이름">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputMiniCakeName">케이크 소제목</label>
								<div class="col-sm-6">
									<input class="form-control" id="inputMiniCakeName" name="pbMiniTitle" type="text"
										placeholder="케이크 소제목">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputPrice">가격
									</label>
								<div class="col-sm-6">
									<input class="form-control" id="inputPrice" name="pPrice" type="text"
										placeholder="가격">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputCakeInfo">케이크 설명</label>
								<div class="col-sm-6">
									<textarea class="form-control" id="inputCakeInfo" name="pbContent"
										placeholder="본문에 들어갈 설명을 입력해주세요." rows = 6 style = "resize : none"></textarea>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputMiniCakeInfo">케이크 소설명</label>
								<div class="col-sm-6">
									<textarea class="form-control" id="inputMiniCakeInfo" name="pbMiniContent"
										placeholder="제목 아래에 들어갈 작은 설명을 입력해주세요." rows = 6 style = "resize : none"></textarea>
								</div>
							</div>
							
						
							
							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputWarningCakeInfo">예약시 주의사항</label>
								<div class="col-sm-6">
									<textarea class="form-control" id="inputWarningCakeInfo" name="pbWarn"
										placeholder="주의사항을 입력해 주세요." rows = 6 style = "resize : none"></textarea>
								</div>
							</div>
							<div class = "form-group tag">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputCakeInfo">태그</label>
								<div class="col-sm-6">
									<input class="form-control inputtag"  name="inputtag1" type="text" placeholder="태그입력">
								</div>
								<div class = "col-sm-1">
								<button class="btn" id = "plus" type="button" style = "border-radius : 50%; margin-top : 20px; margin-left : 45%;" >+</button>
								</div>
							</div>
							</div>
							
							
							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputemail">케이크 당일 구매 여부</label>
								<div class="col-sm-3 checkbox" name="checkbox">
									<input class="checkbox-inline radio"  name="pbYN" type="radio" value = "Y">
									&nbsp;가능
								</div>

								<div class="col-sm-3 checkbox">
									<input class="checkbox-inline radio" name="pbYN" type="radio" value = "N">
									&nbsp;불가능
								</div>
							</div>

							
							<div class="form-group">
								<div class="col-sm-12 text-center" id="joinbutton">
									<button class="btn btn-primary btn-lg" type="submit" id="join">
										등록하기</button>
									<button class="btn btn-danger btn-lg" type="reset" id="cancle">
										등록취소</button>
								</div>
							</div>
						</form>
					</div>
				</article>
			</div>
		</div>
	</div>
</section>

</body>

</html>
<%@ include file="../default/footer.jsp"%>