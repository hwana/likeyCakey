<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홈페이지 문의 글쓰기</title>
</head>

<body>
	<!-- header -->
	<%@ include file="../default/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="content-full ptb-50 fix">

				<!-- page start -->
				<div class="col-md-10">
					<span style="border: 2px solid pink;"></span>&nbsp;&nbsp;
					<h1 style="display: inline; margin-top: 0">
						<small><b>홈페이지 문의</b></small>
					</h1>
					<div class="blog-details-area">
						<div
							class="blog-left-single mb-30 res-mb-30 res-mb-sm-30 res-blog-mt-50">
							<div class="left-area">

								<!-- 여기서부터 마이페이지에 들어가는 내용 변경하기 -->
								<!-- Right Side Start -->
								<div class="col-md-12">
									<div class="tab-content">
										<div class="shop-tab-area">
											<div class="row">
												<form method="post" action="insertHomeqna.ca">
													<table class="table" style="border:0px;">
														<tbody>
															<tr>
																<td style="line-height:50px; text-align:center">문의 분류</td>
																<td><select style="background-color : white;" name="category">
																		<option value="home-error">홈페이지 오류</option>
																		<option value="pay-error">결제관련</option>
																		<option value="use-error">이용불편</option>
																		<option value="etc-error">기타</option>
																</select> <br> * 정확한 분류선택은 문의 처리시간을 단축시켜줍니다.</td>
															</tr>
															<tr>
																<td style="line-height:50px; text-align:center;">아이디</td>
																<td><input type="text" value="${member.id}" name="id" id="hqId"
																style = "background-color : white; border:0px;" readonly></td>
															</tr>
															<tr>
																<td style="line-height:50px; text-align:center;">제목</td>
																<td><input type="text" id="hqTitle" name="hqTitle"
																style = "background-color : white; border:0px; "></td>
															</tr>
															<tr>
																<td style="line-height:50px; text-align:center;">문의내용</td>
																<td><textarea rows="10" style="background-color: white; border:0px;"
																name="hqContent" id="hqContent"></textarea></td>
															</tr>
															<tr>
																<td></td>
																<td><input type="submit" value="문의하기"></td>
														</tbody>
													</table>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- Right Side End -->
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

	<!-- footer -->
	<%@ include file="../default/footer.jsp"%>
</body>
</html>