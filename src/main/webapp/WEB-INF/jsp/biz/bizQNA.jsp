<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../default/header.jsp"%>


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
					<small><b>문의글 모음</b></small>
				</h1>
				</div>
				<br>
				
				<div class = "col-md-10">
				<table class = "table table-hover">
					<thead>
					<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<th>1234</th>
					<th>빵의 유통기한은 어떻게 되나요?</th>
					<th>화니</th>
					<th>2011.11.11</th>
					</tr>
					<tr>
					<th>1235</th>
					<th>매장 오픈시간은 언제인가요?</th>
					<th>스프링</th>
					<th>2010.22.11</th>
					</tr>
					<tr>
					<th>1234</th>
					<th>빵 맛있나요?</th>
					<th>프로젝트</th>
					<th>2018.11.11</th>
					</tr>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
</section>
</body>

</html>
<%@ include file="../default/footer.jsp"%>