<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../default/header.jsp"%>

<style>
label {
	margin-top: 10px;
}

#radio {
	height: auto;
	width: auto;
	font-size: 15px;
	margin: auto 0;
}

#checkbox {
	margin-top: 15px;
}

.plus1, .plus2, .plus3, .plus4 {
	background: #9bcaba;
}

#join {
	background: #f6c6c9;
}

#cancle {
	background: #9bcaba;
}

#joinbutton {
	margin-top: 30px;
}

.inputtag {
	margin-top: 10px;
}

input[type="checkbox"] {
	width: auto;
	height: auto;
}
</style>

<script>
	$(document)
			.ready(
					function() {
						var value = 2;
						var value2 = 2;
						var value3 = 2;
						var value4 = 2;

						$(".plus1")
								.click(
										function() {
											var length = $(".shNum").length;
											if (length < 5) {
												$('.tag1')
														.each(
																function() {
																	$(this)
																			.append(
																					'<div class = "form-group"><div class="col-sm-2 col-sm-offset-3"><input class="form-control shNum" name = "shNum" type="text"placeholder="번호입력" value = "'
																							+ (value)
																							+ '" readOnly></div><div class="col-sm-2"><input class="form-control" name = "shName" type="text" placeholder="종류입력"></div><div class="col-sm-2"><input class="form-control" name = "shPrice'
																							+ (value)
																							+ '" type="text" placeholder="추가가격"></div></div>');
																	value++;
																});
											} else {
												alert("시트입력은 5개까지 가능합니다.");
											}
										});
						$(".plus2")
								.click(
										function() {
											var length = $(".tpNum").length;
											if (length < 5) {
												$('.tag2')
														.each(
																function() {
																	$(this)
																			.append(
																					'<div class = "form-group"><div class="col-sm-2 col-sm-offset-3"><input class="form-control tpNum" name = "tpNum" type="text"placeholder="번호입력" value = "'
																							+ (value2)
																							+ '" readOnly></div><div class="col-sm-2"><input class="form-control" name = "tpName" type="text" placeholder="종류입력"></div><div class="col-sm-2"><input class="form-control" name = "tpPrice'
																							+ (value2)
																							+ '" type="text" placeholder="추가가격"></div></div>');
																	value2++;
																});
											} else {
												alert("토핑입력은 5개까지 가능합니다.");
											}
										});

						$(".plus3")
								.click(
										function() {
											var length = $(".crNum").length;
											if (length < 5) {
												$('.tag3')
														.each(
																function() {
																	$(this)
																			.append(
																					'<div class = "form-group"><div class="col-sm-2 col-sm-offset-3"><input class="form-control crNum" name = "crNum" type="text"placeholder="번호입력" value = "'
																							+ (value3)
																							+ '" readOnly></div><div class="col-sm-2"><input class="form-control" name = "crName" type="text" placeholder="종류입력"></div><div class="col-sm-2"><input class="form-control" name = "crPrice'
																							+ (value3)
																							+ '" type="text" placeholder="추가가격"></div></div>');
																	value3++;
																});
											} else {
												alert("크림입력은 5개까지 가능합니다.");
											}
										});

						$(".plus4")
								.click(
										function() {
											var length = $(".inputtag").length;
											if (length < 5) {
												$('.tag4')
														.each(
																function() {
																	$(this)
																			.append(
																					'<div class="form-group"><div class="col-sm-6 col-sm-offset-3"><input class="form-control inputtag" name = "inputtag'
																							+ (value4)
																							+ '" type="text" placeholder="태그입력"><br></div></div>');
																	value4++;
																});
											} else {
												alert("태그입력은 5개까지 가능합니다.");
											}
										});

						$("#join").click(
								function() {
									if ($('input:checkbox[id="sizeName1"]').is(
											":checked") == true) {
										if ($("#sizePrice1").val() == "") {
											alert("호수에 해당하는 가격을 입력하세요");
											return false;
										}

									}

									if ($('input:checkbox[id="sizeName2"]').is(
											":checked") == true) {
										if ($("#sizePrice2").val() == "") {
											alert("호수에 해당하는 가격을 입력하세요");
											return false;
										}

									}

									if ($('input:checkbox[id="sizeName3"]').is(
											":checked") == true) {
										if ($("#sizePrice3").val() == "") {
											alert("호수에 해당하는 가격을 입력하세요");
											return false;
										}

									}

									if ($('input:checkbox[id="sizeName4"]').is(
											":checked") == true) {
										if ($("#sizePrice4").val() == "") {
											alert("호수에 해당하는 가격을 입력하세요");
											return false;
										}

									}

									if ($('input:checkbox[id="sizeName5"]').is(
											":checked") == true) {
										if ($("#sizePrice5").val() == "") {
											alert("호수에 해당하는 가격을 입력하세요");
											return false;
										}

									}
								})

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
										<li style="border-bottom: 0px;"><a
											href="bizMypageModify.ca"><i
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
				<div style="margin-bottom: 30px;">
					<span style="border: 2px solid pink;"></span>&nbsp;&nbsp;
					<h1 style="display: inline; margin-top: 0">
						<small><b>케이크 등록하기</b></small>
					</h1>
				</div>
				<br>

				<article class="container">
					<div class="col-md-10">
						<form class="form-horizontal" action="customCakeInsert.ca"
							method="post">
							<input type="hidden" name="id" value="${member.id }"></input>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputCakeName">케이크
									이름</label>
								<div class="col-sm-6">
									<input class="form-control" id="inputCakeName" name="cbName"
										type="text" placeholder="케이크 이름">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputMiniCakeName">케이크
									소제목</label>
								<div class="col-sm-6">
									<input class="form-control" id="inputMiniCakeName"
										name="cbMiniTitle" type="text" placeholder="케이크 소제목">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputPrice">가격
								</label>
								<div class="col-sm-6">
									<input class="form-control" id="inputPrice" name="cbPrice"
										type="text" placeholder="기본가격">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputCakeInfo">케이크
									설명</label>
								<div class="col-sm-6">
									<textarea class="form-control" id="inputCakeInfo"
										name="cbContent" placeholder="본문에 들어갈 설명을 입력해주세요." rows=6
										style="resize: none"></textarea>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputMiniCakeInfo">케이크
									소설명</label>
								<div class="col-sm-6">
									<textarea class="form-control" id="inputMiniCakeInfo"
										name="cbMiniContent" placeholder="제목 아래에 들어갈 작은 설명을 입력해주세요."
										rows=6 style="resize: none"></textarea>
								</div>
							</div>



							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputWarningCakeInfo">예약시
									주의사항</label>
								<div class="col-sm-6">
									<textarea class="form-control" id="inputWarningCakeInfo"
										name="cbWarn" placeholder="주의사항을 입력해 주세요." rows=6
										style="resize: none"></textarea>
								</div>
							</div>



							<div class="form-group tag1">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="inputCakeInfo">시트</label>
									<div class="col-sm-2">
										<input class="form-control shNum" name="shNum" type="text"
											placeholder="번호입력" value="1" readOnly>
									</div>

									<div class="col-sm-2">
										<input class="form-control" name="shName" type="text"
											placeholder="종류입력">
									</div>

									<div class="col-sm-2">
										<input class="form-control" name="shPrice1" type="text"
											placeholder="추가가격">
									</div>
									<div class=col-sm-1>
										<button class="btn plus1" type="button"
											style="border-radius: 50%; margin-left: 45%; margin-top: 20px;">+</button>
									</div>

								</div>
							</div>


							<div class="form-group tag2">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="inputCakeInfo">토핑</label>
									<div class="col-sm-2">
										<input class="form-control tpNum" name="tpNum" type="text"
											placeholder="번호입력" value="1" readOnly>
									</div>

									<div class="col-sm-2">
										<input class="form-control" name="tpName" type="text"
											placeholder="종류입력">
									</div>

									<div class="col-sm-2">
										<input class="form-control" name="tpPrice1" type="text"
											placeholder="추가가격">
									</div>
									<div class=col-sm-1>
										<button class="btn plus2" type="button"
											style="border-radius: 50%; margin-left: 45%; margin-top: 20px;">+</button>
									</div>
								</div>
							</div>

							<div class="form-group tag3">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="inputCakeInfo">크림</label>
									<div class="col-sm-2">
										<input class="form-control crNum" name="crNum" type="text"
											placeholder="번호입력" value="1" readOnly>
									</div>

									<div class="col-sm-2">
										<input class="form-control" name="crName" type="text"
											placeholder="종류입력">
									</div>

									<div class="col-sm-2">
										<input class="form-control" name="crPrice1" type="text"
											placeholder="추가가격">
									</div>
									<div class=col-sm-1>
										<button class="btn plus3" type="button"
											style="border-radius: 50%; margin-left: 45%; margin-top: 20px;">+</button>
									</div>
								</div>
							</div>

							<div class="form-group tag4">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="inputCakeInfo">태그</label>
									<div class="col-sm-6">
										<input class="form-control inputtag" name="inputtag1"
											type="text" placeholder="태그입력">
									</div>
									<div class="col-sm-1">
										<button class="btn plus4" type="button"
											style="border-radius: 50%; margin-top: 20px; margin-left: 45%;">+</button>
									</div>
								</div>
							</div>


							<div class="form-group">
								<label class="col-sm-9 col-sm-offset-3"><strong>케이크의
										호수를 체크한 후 해당하는 가격을 입력하세요.</strong></label> <label
									class="col-sm-3 control-label" for="inputCakeInfo">규격</label>
								<div class="col-sm-9" id=checkbox>
									<div class="col-sm-12">
										<input type="hidden" name="sizeNum" value = "1" /> <input class="span"
											type="checkbox" id="sizeName1" name="sizeName" value="1호"
											style="margin-top: 20px;" />&nbsp;&nbsp;&nbsp;1호
										<div class="col-sm-4">
											<input class="form-control" type="text" name="sizePrice1"
												id="sizePrice1" value = "0"/><br>
										</div>
									</div>

									<div class="col-sm-12">
										<input type="hidden" name="sizeNum" value = "2"/> <input class="span"
											type="checkbox" name="sizeName" id="sizeName2" value="2호"
											style="margin-top: 20px;" />&nbsp;&nbsp;&nbsp;2호
										<div class="col-sm-4">
											<input class="form-control" type="text" name="sizePrice2"
												id="sizePrice2" value = "0" /><br>
										</div>
									</div>

									<div class="col-sm-12">
										<input type="hidden" name="sizeNum" value = "3"/> <input class="span"
											type="checkbox" name="sizeName" id="sizeName3" value="3호"
											style="margin-top: 20px;" />&nbsp;&nbsp;&nbsp;3호
										<div class="col-sm-4">
											<input class="form-control" type="text" name="sizePrice3"
												id="sizePrice3" value = "0"/><br>
										</div>
									</div>

									<div class="col-sm-12">
										<input type="hidden" name="sizeNum" value = "4"/> <input class="span"
											type="checkbox" name="sizeName" id="sizeName4" value="4호"
											style="margin-top: 20px;" />&nbsp;&nbsp;&nbsp;4호
										<div class="col-sm-4">
											<input class="form-control" type="text" name="sizePrice4"
												id="sizePrice4" value = "0" /><br>
										</div>
									</div>

									<div class="col-sm-12">
										<input type="hidden" name="sizeNum" value = "5"/> <input class="span"
											type="checkbox" name="sizeName" id="sizeName5" value="5호"
											style="margin-top: 20px;" />&nbsp;&nbsp;&nbsp;5호
										<div class="col-sm-4">
											<input class="form-control" type="text" name="sizePrice5"
												id="sizePrice5" value = "0"/><br>
										</div>
									</div>

								</div>
							</div>






							<div class="form-group">
								<div class="col-sm-12 text-center" id="joinbutton">
									<button class="btn btn-primary btn-lg" type="submit" id="join">
										등록하기</button>
									<button class="btn btn-danger btn-lg" type="submit" id="cancle">
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