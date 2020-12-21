$(document)
		.ready(
				function() {

					$("#join")
							.click(
									function() {

										var nameP = /^[가-힣]+$/; // 이름 한글만 사용가능
										var telP = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/; // 전화번호
																						// 형식
										var bizP = /([0-9]{3})-?([0-9]{2})-?([0-9]{5})/; // 사업자등록번호
																							// 형식
							
										var pwP = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; // 비밀번호
																								// 형식

										
										if ($("#inputPhoto").val() == "") {
											alert("사진을 업로드 하세요.");
											return false;

										}  else if ($("#inputPassword").val() == "") {
											alert("비밀번호를 입력하세요.");
											$("#inputPassword").focus();
											return false;

										} else if (!pwP
												.test($("#inputPassword").val())) {
											alert("비밀번호 형식은 영어, 숫자포함 6~20 자리 입니다.");
											$("#inputPassword").val("");
											$("#inputPassword").focus();
											return false;

										} else if ($("#inputPasswordCheck")
												.val() == "") {
											alert("비밀번호확인을 입력하세요.");
											$("#inputPasswordCheck").focus();
											return false

										} else if ($("#inputPassword").val() != $(
												"#inputPasswordCheck").val()) {
											alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
											$("#inputPassword").val("");
											$("#inputPasswordCheck").val("");
											$("#inputPassword").focus();
											return false;

										}  else if ($("#inputMasterName").val() == "") {
											alert("담당자 이름을 입력하세요");
											$("#inputMasterName").focus();
											return false;

										} else if (!nameP.test($(
												"#inputMasterName").val())) {
											alert("담당자 이름은 한글만 입력가능합니다.");
											$("#inputMasterName").val("");
											$("#inputMasterName").focus();
											return false;

										} else if ($("#inputNumber").val() == "") {
											alert("담당자의 전화번호를 입력하세요.");
											$("#inputNumber").focus();
											return false;

										} else if (!telP.test($("#inputNumber")
												.val())) {
											alert("담당자 전화번호 형식은 000-0000-0000입니다.");
											$("#inputNumber").val("");
											$("#inputNumber").focus();
											return false;

										} else {

											alert("정보수정이 완료되었습니다.");

											return true;
										}

									});

				});