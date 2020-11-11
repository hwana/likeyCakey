<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="list" value="${requestScope.list}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홈페이지 문의게시판</title>
<!-- Bootstrap -->
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<style>
#container {
	width: 70%;
	margin: 0 auto; /* 가로로 중앙에 배치 */
}

#list {
	text-align: center;
}

#write {
	text-align: right;
}

/* Bootstrap 수정 */
.table>thead {
	background-color: #f6c6c9;
}

.table>thead>tr>th {
	text-align: center;
	color: white;
	border: 0px;
}

.table-hover>tbody>tr:hover {
	background-color: #e6ecff;
}

.table>tbody>tr>td {
	text-align: center;
}

.table>tbody>tr>#title {
	text-align: left;
}

div>#paging {
	text-align: center;
}

.hit {
	animation-name: blink;
	animation-duration: 1.5s;
	animation-timing-function: ease;
	animation-iteration-count: infinite;
	/* 위 속성들을 한 줄로 표기하기 */
	/* -webkit-animation: blink 1.5s ease infinite; */
}

/* 애니메이션 지점 설정하기 */
/* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
@
keyframes blink {
	from {color: white;
}

30%
{
color

 

:

 

yellow


;
}
to {
	color: red;
	font-weight: bold;
}
/* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
}
</style>

<script>
	/**
	 * Page클래스의 paging메서드
	 */
	// pageBlock에 포함되는 페이지 숫자 출력하고, 링크를 달아준다.
	for (i = startPage; i <= endPage; i++) {
		if (i == pageNum) {
			sb.append("&nbsp;&nbsp;<b><font color='#668cff' size='4'>");
			sb.append(i);
			sb.append("</font></b>");
		} else {
			sb.append("&nbsp;&nbsp;<a href='list.bbs?pageNum=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>");
		}
	}
</script>


</head>
<body>
	<%@ include file="../default/header.jsp"%>

	<div id="container" style="padding-top: 10px; margin-top: 10px;">
		<span style="border: 2px solid pink;"></span>&nbsp;&nbsp;
		<h1 style="display: inline; margin-top: 0">
			<small><b>홈페이지 문의게시판</b></small>
		</h1>

		<c:if test="${member.id == null }">
			<div id="write"></div>
		</c:if>

		<c:if test="${member.id != null }">
			<div id="write">
				<a href="homeqna_write.ca">글쓰기</a>
			</div>
		</c:if>

		<div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="10%">번호</th>
						<th width="50%">제목</th>
						<th width="10%">작성자</th>
						<th width="20%">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="qna" items="${list}" varStatus="status">
						<tr>
							<td>${qna.hqNum}</td>
							<td id="title"><a href="homeqnaView.ca?hqNum=${qna.hqNum}">${qna.hqTitle}</a>
							</td>
							<td>${qna.id}</td>
							<td>
								<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate
									value="${qna.hqDate}" pattern="yyyy-MM-dd HH:mm" />
							</td>
						<tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="../default/footer.jsp"%>
</body>
</html>