$(document)
		.ready(
				function() {
					// 회원가입 클릭 시 유효성 검사
					$("#join")
							.click(
									function() {
										var telP = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/; // 전화번호
										var emailP = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/ // 이메일
										var pwP = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; // 비밀번호
										
										// alert("ok");
										if ($("#inputPhone").val() == "") {
											alert("핸드폰 번호를 입력하세요");
											$("#inputPhone").focus();
											return false;
										} else if (!telP.test($("#inputPhone")
												.val())) {
											alert("핸드폰번호는 -(대시)를 넣어 입력해주세요.");
											$("#inputPhone").val("");
											$("#inputPhone").focus();
											return false;
										} else if ($("#inputBasicAddr").val() == "") {
											alert("기본주소를 입력하세요");
											$("#inputBasicAddr").focus();
											return false;
										} else if ($("#inputDetailAddr").val() == "") {
											alert("상세주소를 입력하세요");
											$("#inputDetailAddr").focus();
											return false;
										} 										
										
										else {
											alert("정보수정이 완료되었습니다.");
											return true;
										}
									});
				});