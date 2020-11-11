<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홈페이지 문의글 상세보기</title>
</head>
<body>
	<%@ include file="../default/header.jsp"%>
	<!-- Page Content Wraper Area Start -->
	<section class="page-content-wrapper">
	<div class="container">
		<div class="row">
			<div class="content-full ptb-50 fix">
				<!-- Right Side Start -->
				<div class="col-md-10">
					<span style="border: 2px solid pink;"></span>&nbsp;&nbsp;
					<h1 style="display: inline; margin-top: 0">
						<small><b>문의글 상세보기</b></small>
					</h1>
					<div class="blog-details-area">
						<div
							class="blog-left-single mb-30 res-mb-30 res-mb-sm-30 res-blog-mt-50">
							<div class="left-area">
								<!-- 여기서부터 페이지에 들어가는 내용 변경하기 -->
								<form name="view" method="post">
									<table class="table">
										<tbody>
											<tr>
												<td>작성날짜</td>
												<td><input type="text" name="hqDate" id="hqDate" value="${qna.hqDate}" readonly></td>
											</tr>
											<tr>
												<td>아이디</td>
												<td><input type="text" name="id" id="id" value="${qna.id}" readonly></td>
											</tr>
											<tr>
												<td>제목</td>
												<td><input type="text" name="hqTitle" id="hqTitle" value="${qna.hqTitle}" readonly></td>
											</tr>
											<tr>
												<td>내용</td>
												<td><input type="text" name="hqContent" id="hqContent" value="${qna.hqContent}" readonly></td>
											</tr>
										</tbody>
									</table>
								</form>
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


	<%@ include file="../default/footer.jsp"%>
</body>
</html>