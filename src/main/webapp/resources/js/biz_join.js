//우편번호 api 
function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('inputPost').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('inputBasicAddr').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('inputDetailAddr').focus();
            }
        }).open();
    }


$(document)
		.ready(
				function() {

					$("#join")
							.click(
									function() {

										var nameP = /^[가-힣]+$/; // 이름 한글만 사용가능
										var telP = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/; // 전화번호 형식
										var bizP = /([0-9]{3})-?([0-9]{2})-?([0-9]{5})/; // 사업자등록번호 형식
										var emailP = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/ //이메일 형식
										var pwP = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; //비밀번호 형식

										// alert("ok");
										if ($("#inputPhoto").val() == "") {
											alert("사진을 업로드 하세요.");
											return false;

										} else if ($("#inputID").val() == "") {
											alert("아이디를 입력하세요.");
											$("#inputID").focus();
											return false;

										} else if ($("#inputPassword").val() == "") {
											alert("비밀번호를 입력하세요.");
											$("#inputPassword").focus();
											return false;

										} else if (!pwP.test($("#inputPassword")
												.val())) {
											alert("비밀번호 형식은 영어, 숫자포함 6~20 자리 입니다.");
											$("#inputPassword").val("");
											$("#inputPassword").focus();
											return false;

										}else if ($("#inputPasswordCheck")
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

										} else if ($("#inputName").val() == "") {
											alert("대표자 이름을 입력하세요");
											$("#inputName").focus();
											return false;

										} else if (!nameP.test($("#inputName").val())) {
											alert("대표자 이름은 한글만 입력가능합니다.");
											$("#inputName").val("");
											$("#inputName").focus();
											return false;

										} else if ($("#inputStoreName").val() == "") {
											alert("상호명을 입력하세요.");
											$("#inputStoreName").focus();
											return false;

										} else if ($("#inputStoreCall").val() == "") {
											alert("업체의 전화번호를 입력하세요.");
											$("#inputStoreCall").focus();
											return false;

										} else if (!telP.test($(
												"#inputStoreCall").val())) {
											alert("업체전화번호 형식은 000-0000-0000입니다.");
											$("#inputStoreCall").val("");
											$("#inputStoreCall").focus();
											return false;

										} else if ($("#inputBizNum").val() == "") {
											alert("사업자 등록번호를 입력하세요.");
											$("#inputBizNum").focus();
											return false;

										} else if (!bizP.test($("#inputBizNum")
												.val())) {
											alert("사업자 등록번호 형식은 000-00-0000입니다.");
											$("#inputBizNum").val("");
											$("#inputBizNum").focus();
											return false;

										}else if ($("#inputBasicAddr").val() == "") {
											alert("기본주소를 입력하세요");
											$("#inputBasicAddr").focus();
											return false;

										}else if ($("#inputDetailAddr").val() == "") {
											alert("상세주소를 입력하세요");
											$("#inputDetailAddr").focus();
											return false;

										}else if ($("#inputMasterName").val() == "") {
											alert("담당자 이름을 입력하세요");
											$("#inputMasterName").focus();
											return false;

										} else if (!nameP.test($("#inputMasterName")
												.val())) {
											alert("담당자 이름은 한글만 입력가능합니다.");
											$("#inputMasterName").val("");
											$("#inputMasterName").focus();
											return false;

										}else if ($("#inputNumber").val() == "") {
											alert("담당자의 전화번호를 입력하세요.");
											$("#inputNumber").focus();
											return false;

										} else if (!telP.test($(
												"#inputNumber").val())) {
											alert("담당자 전화번호 형식은 000-0000-0000입니다.");
											$("#inputNumber").val("");
											$("#inputNumber").focus();
											return false;
											
										}else if ($("#inputemail").val() == "") {
											alert("이메일을 입력하세요");
											$("#inputemail").focus();
										}else if (!emailP.test($("#inputemail")
												.val())) {
											alert("올바른 이메일 형식으로 입력하십시오.");
											$("#inputemail").val("");
											$("#inputemail").focus();
											return false;

										} else if ($("#delyes").is(':checked') == false
												&& $("#delno").is(':checked') == false) {
											alert("배송 가능여부를 선택하세요.");
											return false;
											
										}else if ($("#cusyes").is(':checked') == false
												&& $("#cusno").is(':checked') == false) {
											alert("커스터마이징 가능여부를 선택하세요.");
											return false;
											
										}
										  else {
											 
											  alert("회원가입이 완료되었습니다.");
											
		
											return true;
										}

									});


				});
