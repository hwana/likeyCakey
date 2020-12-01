$(document)
		.ready(
				function() {
					// 비밀번호변경 클릭 시 유효성 검사
					$("#chpw")
							.click(
									function() {
										var pwP = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; // 비밀번호
										
										// alert("ok");
										if ($("#inputPassword").val() == "") {
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
										
										} else if($("#pwcheck").val() == false){
											alert("비밀번호를 동일하게 입력해주세요");
											$("#inputPassword").val("");
											$("#inputPasswordCheck").val("");
											$("#inputPassword").focus();
										} 
										
										else {
											alert("비밀번호 수정이 완료되었습니다.");
											return true;
										}
									});
				});