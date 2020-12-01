<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="listCount" value="${requestScope.listCount}" />
<c:set var="currentPage" value="${requestScope.currentPage}" />
<c:set var="startPage" value="${requestScope.startPage}" />
<c:set var="endPage" value="${requestScope.endPage}" />
<c:set var="maxPage" value="${requestScope.maxPage}" />
<c:set var="list" value="${requestScope.list}" />
<c:set var="member" value="${sessionScope.member}" />

<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>MemberList</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="shortcut icon" type="image/x-icon"
   href="img/icon/favicon.ico">
<!-- Place favicon.ico in the root directory -->


<!-- all css here -->
<link rel="stylesheet" href="/resources/css/eunsong.css">
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
<script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
   //1.한명만 업데이트 하는 ajax 코드 시작//
   $(function() {
      var checkAll;
      var delMembers = new Array();
      $("button[name=updateMember]").click(function() {
         $.ajax({
            url : "adminMemberUpdate.ca",
            data : {
               mcode : $(this).closest("tr").find("#mcode").val(),
               mid : $(this).closest("tr").find("#mid").val(),
               mpasswd : $(this).closest("tr").find("#mpasswd").val(),
               mname : $(this).closest("tr").find("#mname").val(),
               memail : $(this).closest("tr").find("#memail").val(),
               mphone : $(this).closest("tr").find("#mphone").val(),
               mstatus : $(this).closest("tr").find("#mstatus").val(),
               mblackCnt : $(this).closest("tr").find("#mblackCnt").val()
            },

            dataType : "text",
            type : "post",
            success : function(value) {//
               if (value == "ok") {
                  alert("수정에 성공했습니다.");
               } else {
                  alert("수정에 실패했습니다.");
               }
            },
            error : function(value) {
               alert("잘못 입력하셨습니다." + value);
            }
         });//AJAX
         return false;
      }); //click

      //1. 한명만 업데이트 하는 ajax 코드 끝//

      //2. 체크박스 전체 선택하는 jQuery 코드 시작//
      $("#checkAll").click(function() {
         if ($(this).is(":checked")) {
            $("input[name=check]").prop("checked", true);
            checkAll = true;
            console.log(checkAll);
         } else {
            $("input[name=check]").prop("checked", false);
            checkAll = false;
            delMembers.splice(0, delMembers.length);//배열의 엘리먼트를 삭제하는 코드 추가
            console.log(checkAll);
            console.log(delMembers);
         }
      });

      //2. 체크박스 전체 선택하는 jQuery 코드 끝//

      //3. 체크박스가 선택되면 list에 해당 id를 추가하고, 해제 되면 해당 id를 리스트에서 삭제하는 제이쿼리 시작
      $("input[name=check]").change(function() {
         
         var mem = $(this).closest("tr").find("#mid").val();
         if ($(this).is(":checked")) {
            delMembers.push(mem);
            console.log(delMembers);
         } else {
            
             delMembers = $.grep(delMembers, function(n) {
                return n != mem;
            }); 
             
            console.log(delMembers);
         }
      });
      //3. 체크박스가 선택되면 list에 해당 id를 추가하고, 해제 되면 해당 id를 리스트에서 삭제하는 제이쿼리 끝
      
      
      //4. 삭제 버튼을 눌렀을 때, checkAll이 treu면 전체 삭제로 가고, false면 일부 삭제로 간다. 경로 조정 가능?
      $("#adminDelete").click(function() {
         console.log("adminDelete 클릭");
         if(checkAll){
               alert("전체 탈퇴를 실행합니다.");
            $.ajax({
               url : "adminMemberTotalDelete.ca",
               type : "post",
               success : function(value) {//
                  if (value == "ok") {
                     alert("전체 탈퇴에 성공했습니다.");
                     location.reload();
                  } else {
                     alert("전체 탈퇴에 실패했습니다.");
                  }
               },
               error : function(value) {
                  alert("잘못 입력하셨습니다." + value);
               }
            });//AJAX
            return false;            
         }else if(delMembers.length == 0){
            alert("탈퇴시킬 회원을 선택해주세요.");
         }else{
            alert("선택 탈퇴를 실행합니다.");
            jQuery.ajaxSettings.traditional = true;
            $.ajax({
               url : "adminMemberDelete.ca",
               data : {
                  delMembers: delMembers
               },
               dataType : "text",
               type : "post",
               success : function(value) {//
                  if (value == "ok") {
                     alert("선택 탈퇴에 성공했습니다.");
                     location.reload();
                  } else {
                     alert("선택 탈퇴에 실패했습니다.");
                  }
               },
               error : function(value) {
                  alert("잘못 입력하셨습니다." + value);
               }
            });//AJAX
            return false;   
         }
      });
      //4. 삭제 버튼을 눌렀을 때, checkAll이 treu면 전체 삭제로 가고, false면 일부 삭제로 간다. 경로 조정 가능? 

   }); //ready
</script>
</head>

<style>
.th {
   padding: 10px 2px;
}

td {
   padding-top: 5px !important;
   padding-bottom: 5px !important;
   text-align: center;
   margin: 0 auto;
}
</style>
<body class="other-page">




   <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
   <!-- Header Area Start -->
   <header></header>
   <!-- Header Area End -->
   <!-- Page Content Wraper Area Start -->
   <section class="page-content-wrapper pt-100 pb-40">

      <!-- checkout-area start -->
      <div class="checkout-area">
         <div class="container">
            <div class="row">
               <form action="#">

                  <div class="checkbox-form">

                     <!-- 무슨 창인지 설명하는 부분 -->
                     <div class="row">
                        <h2 style="width: 20%; display: inline-block; font-weight: 500;">회원
                           정보</h2>
                        <h3></h3>


                     </div>
                     <!-- 무슨 창인지 설명하는 부분-->
                     <br> <br>
                     <!-- 회원 정보 리스트 시작 -->
                     <div class="row">
                        <h3>
                           회원 정보

                           <!-- 회원 상태 설명 시작 -->
                           <div class="checkout-form-list create-acc" style="margin-bottom: 0px; float: right">
                               <select style="height:30px;">
                                 <option value="volvo">분류 번호 순
                                 <option value="saab">신고 당한 횟수 순
                                 <option value="mercedes">활동 회원만
                                 <option value="audi">경고 회원만
                                 <option value="audi">블록 회원만
                                 <option value="audi">탈퇴 회원만
                                 <option value="audi">일반회원만
                                 <option value="audi">관리자만
                                 <option value="audi">사업자만
                              </select>
                           </div>
                           <!-- 회원 상태 설명 끝 -->

                        </h3>
                        <div class="checkout-form-list create-acc"
                              style="margin-bottom: 0px; float: right; margin-right:15px">
                              <label style="color: #9bcaba">1.일반 2.경고 3.블랙리스트 4.탈퇴</label>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                           <form action="adminMemberDelete.ca" method="post">
                              <!-- 회원 정보 리스트 시작 -->
                              <div class="table-content table-responsive">

                                 <table>
                                    <thead>
                                       <tr>
                                          <th class="product-thumbnail eceff8"><input
                                             type="checkbox" id="checkAll"
                                             style="height: 12px; width: 20px;"></th>
                                          <th class="product-thumbnail eceff8">분류번호</th>
                                          <th class="product-thumbnail eceff8">id</th>
                                          <th class="product-thumbnail eceff8">passwd</th>

                                          <th class="product-thumbnail eceff8">이름</th>
                                          <th class="product-thumbnail eceff8">회원 이메일</th>
                                          <th class="product-thumbnail eceff8">회원 전화번호</th>
                                          <th class="product-thumbnail eceff8">상태</th>
                                          <th class="product-thumbnail eceff8">신고횟수</th>
                                          <th class="product-remove eceff8" style="width: 50px;">수정</th>
                                       </tr>
                                    </thead>
                                    <tbody>

                                       <c:forEach var="m" items="${list}" varStatus="status">

                                          <!-- 회원 1 시작 -->
                                          <tr>
                                             <td><input type="checkbox" name="check"
                                                style="height: 12px; width: 20px;"></td>
                                             <td><input type="text" class="s_text" placeholder=""
                                                id="mcode" value="${m.code}"></td>

                                             <td><a href="#"><input type="text" class="text"
                                                   id="mid" name="mid" value="${m.id}"></a></td>
                                             <td><input type="text" placeholder="" class="text"
                                                id="mpasswd" value="${m.passwd}"></td>
                                             <td><input type="text" placeholder="" class="text"
                                                id="mname" value="${m.name}"></td>
                                             <td><input type="text" placeholder="" class="text"
                                                id="memail" value="${m.email}"></td>
                                             <td><input type="text" placeholder="" class="text"
                                                id="mphone" value="${m.phone}"></td>
                                             <td><input type="text" class="s_text" placeholder=""
                                                id="mstatus" value="${m.status}"></td>
                                             <td><input type="text" class="s_text" placeholder=""
                                                id="mblackCnt" value="${m.blackCnt}"></td>
                                             <td>
                                                <div class="buttons-cart" style="margin-bottom: 0px;">
                                                   <div class="pink_button small_button">
                                                      <button type="button" name="updateMember"
                                                         style="height: 30px; width: 50px; line-height: 30px; margin: 0 auto; text-align: center; padding-right: 0; padding-left: 0">
                                                         수정</button>
                                                   </div>
                                                </div>
                                             </td>
                                          </tr>
                                          <!--  회원 1 끝 -->
                                       </c:forEach>
                                    </tbody>
                                 </table>
                              </div>


                           </form>
                        </div>
                     </div>
                     <!-- 회원 정보 보기끝 -->
                     <br>

                     <!-- 버튼 시작 -->
                     <div class="row">
                        <div class="col-md-4" style="width: 40%; margin-left: 30%">
                           <div class="country-button" style="">
                              <label><span class="required"></span></label>
                              <div class="pink_button">
                                 <input type="button" id="adminDelete" value="선택한 회원 탈퇴 처리">
                              </div>
                           </div>
                        </div>

                        

                     </div>


                     <!-- 버튼 끝 -->


                  </div>

               </form>
            </div>
         </div>
      </div>
      <!-- checkout-area end -->
   </section>
   <!-- Page Content Wraper Area End -->
   <!-- Fotter Area Start -->
   <footer>
   
   </footer>
   <!-- Fotter Area End -->

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
