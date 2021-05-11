<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>LikeyCakey HOME Q&A</title>
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
</head>
<body class="other-page blog">

<!-- member가 비어있지 않으면 마이페이지의 home_qna 출력 -->

	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Header Area Start -->
	<!-- 지연 헤더 파일있는 폴더 경로 -->
	<%@ include file="../default/header.jsp"%>
	<!-- Header Area End -->


	<!-- Page Content Wraper Area Start -->
	<section class="page-content-wrapper">
		<div class="container">
			<div class="row">
				<div class="content-full ptb-50 fix" style="margin: 0 auto;">
					<!-- Left Side Start -->
					<%@ include file="leftside.jsp" %>
					<!-- Left Side End -->

					<!-- 홈 큐앤에이 시작 -->
					<c:set var="list" value="${requestScope.list}"/>
					
					<!-- Right Side Start -->
					<div class="col-md-10">
						<span style="border: 2px solid pink;"></span>&nbsp;&nbsp;
						<h1 style="display: inline; margin-top: 0">
							<small><b>홈페이지 문의글</b></small>
						</h1>
						<div class="blog-details-area">
							<div
								class="blog-left-single mb-30 res-mb-30 res-mb-sm-30 res-blog-mt-50">
								<div class="left-area">
			
									<!-- 위의 div 4개는 오른쪽 사이드 설정하는 div -->
									<!-- 여기서부터 마이페이지에 들어가는 내용 변경하기 -->
									<div class="col-md-12">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>날짜</th>
												</tr>
											</thead>
											<c:forEach var="qna" items="${list}" varStatus="status">
											<tbody>
												
												<tr>
													<td>${qna.hqNum}</td>
													<td>${qna.hqTitle }</td>
													<td>${qna.id }</td>
													<td><!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate
									value="${qna.hqDate}" pattern="yyyy-MM-dd HH:mm" /></td>
												</tr>
											</tbody>
											</c:forEach>
										</table>
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
	<%@ include file="../default/footer.jsp"%>
	<!-- FOOTER END -->

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
</body>
</html>

