<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../default/header.jsp"%>
<!-- Header Area End -->
<style>
label {
	margin-top: 10px;
}

#join {
	background: #f6c6c9;
}

#cancle {
	background: #9bcaba;
}

.verifycode {
	background: #9bcaba;
	margin-left: 10px;
}

.search {
	background: #9bcaba;
	margin-top: 10px;
}

input[type="file"] {
	display: none;
}
</style>

<script>
	$(document).ready(function() {

		$("input[id='file']").change(function(e) {
			var $this = $(this);
			$("input[id='inputPhoto']").val($this.val().split('\\').pop());
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
										<li style="border-bottom: 0px;"><a href="#"><i
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
									<form class="form-horizontal" action = "bizModify.ca" method = "POST" enctype="multipart/form-data">
										<input type="hidden" name="id" value="${member.id }">
										<div class="form-group">
											<label class="col-sm-3 control-label" for="inputPhoto">업체사진</label>
											<div class="col-sm-4">
												<input class="form-control" id="inputPhoto" type="text"
													placeholder="업체사진" name="photo" value="${member.photo}" readOnly>
											</div>
											<label for="file" class="btn search"> 사진등록</label> <input
												id="file" type="file" name="file" />
										
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
											<div class="col-sm-6">
												<input class="form-control" id="inputPassword"
													type="password" placeholder="비밀번호" name="passwd">
												<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label"
												for="inputPasswordCheck">비밀번호 확인</label>
											<div class="col-sm-6">
												<input class="form-control" id="inputPasswordCheck"
													type="password" placeholder="비밀번호 확인">
												<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label" for="inputMasterName">담당자
												이름</label>
											
											
											<div class="col-sm-6">
												<input class="form-control" id="inputMasterName" type="text"
													placeholder="담당자 이름" name="masterName" value = "${mastername}"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
											<div class="col-sm-6">
											
													<input type="tel" class="form-control" id="inputNumber"
														placeholder="- 포함하여 입력하세요"  name="phone" value = "${member.phone }"/> 
												
											</div>
										</div>
										

										<div class="form-group">
											<div class="col-sm-12 text-center">
												<button class="btn btn-primary btn-lg" type="submit"
													id="join">
													정보수정
												</button>
												<button class="btn btn-danger btn-lg" type="submit"
													id="cancle">
													수정취소
												</button>
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

<!-- FOOTER END -->


</body>
	<script src="/resources/js/biz_modify.js"></script>
</html>
<%@ include file="../default/footer.jsp"%>
