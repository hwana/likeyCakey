<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../default/header.jsp"%>

<style>
div#form {
	width: 700px;
	height: 200px;
	margin: 50px auto;
	border: solid 1px #c0c0c0;
	border-radius: 20px;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
}

label{
	margin: 40px 137px 15px 137px;
	font-size: 40px;
}

.submitcake{
			width: auto;
			padding: 9px 15px;
			background: #f6c6c9;
			border: 0;
			font-size: 14px;
			color: #FFFFFF;
			-webkit-border-radius: 5px;
			margin-left : 160px;
			text-decoration : none;
}

.submithome{
			width: auto;
			padding: 9px 15px;
			background: #f6c6c9;
			border: 0;
			font-size: 14px;
			color: #FFFFFF;
			-webkit-border-radius: 5px;
			margin-left : 30px;
			text-decoration : none;
}


</style>

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


				

				<div class="col-md-10">
					<div id="form">
						<div>
							<label for="ok">등록이 완료되었습니다.</label>
						</div>
						<br>
						<div>
							<a href="yescakeUpload.ca" class=submitcake>등록된 케이크 확인하기</a>
							<a href="home.ca" class=submithome>홈으로 돌아가기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

</body>

</html>
<%@ include file="../default/footer.jsp"%>