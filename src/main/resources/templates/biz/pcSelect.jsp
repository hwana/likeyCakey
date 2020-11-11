<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../default/header.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
<script src="resources/js/classie.js"></script>
<script src="resources/js/modernizr.custom.js"></script>
<style>
	#customupload{
		width : 30%;
		background : #f6c6c9;
		border : #f6c6c9;
		padding : 40px;
		font-size : 30px;
		
	}
	
	#productupload{
		width : 30%;
		background : #9bcaba;
		border : #9bcaba;
		padding : 40px;
		font-size : 30px;
	}
	
	#cake{
		font-size : 30px;
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

				<!-- Right Side Start -->
				<div style = "margin-bottom : 30px;">
				<span style="border: 2px solid pink;"></span>&nbsp;&nbsp;
				<h1 style="display: inline; margin-top: 0">
					<small><b>케이크 등록하기</b></small>
				</h1>
				</div>
				<br>
				
				<button class="btn btn-3 btn-3c" id = "customupload" onclick = "location.href = 'customCakeUpload.ca'">&nbsp;&nbsp;<div>커스터마이징 <br>케이크 등록하기</div></button>
				<button class="btn btn-3 btn-3c" id = "productupload" onclick = "location.href = 'productCakeUpload.ca'">&nbsp;&nbsp;<div>완제품 <br>케이크 등록하기</div></button>

			</div>
		</div>
	</div>

</section>

</body>

</html>
<%@ include file="../default/footer.jsp"%>