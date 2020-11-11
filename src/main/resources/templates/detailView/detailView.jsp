<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>상품 상세 페이지</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

       <link rel="apple-touch-icon" href="/resources/img/apple-touch-icon.png">
		<link rel="shortcut icon" type="/resources/image/x-icon" href="/resources/img/icon/favicon.ico">
        <!-- Place favicon.ico in the root directory -->		
		
		<!-- all css here -->
<!--         <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="/resources/css/elegant-font.css">
        <link rel="stylesheet" href="/resources/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="/resources/css/meanmenu.min.css">
        <link rel="stylesheet" href="/resources/css/animate.css">
        <link rel="stylesheet" href="/resources/css/magnific-popup.css">
		<link rel="stylesheet" href="/resources/css/animate-heading.css">
        <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
        <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="/resources/css/shortcode/shortcodes.css">
        <link rel="stylesheet" href="/resources/css/style.css">
        <link rel="stylesheet" href="/resources/css/responsive.css"> -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
        <link rel="stylesheet" href="/resources/css/na.css">
       	<link rel="stylesheet" href="/resources/css/young.css">
	
        <script src="/resources/js/vendor/modernizr-2.8.3.min.js"></script>
		<script src="/resources/js/na.js"></script>
		
		<script type="text/javascript">
		$(function(){

// 상품 개수 start			
			var pPrice = parseInt($('.prce-stock').children('h4').text().replace("\\","").replace(",",""), 10);
			$('.dec').click(function(e){
				e.preventDefault();
				var stat = $('.cart-plus-minus-box').val();
				var num = parseInt(stat, 10);
				num--;
				if(num<0) num=0;
				$('.cart-plus-minus-box').val(num);
				var totalPrice = pPrice * num;
				$('.totalPrice').text(totalPrice+'원');
				
			});
			
			$('.inc').click(function(e){
				e.preventDefault();
				var stat = $('.cart-plus-minus-box').val();
				var num = parseInt(stat, 10);
				num++;
				if(num>3) {
					alert('3개 이상 구매하실 수 없습니다.');
					num=3;
				}
				
				$('.cart-plus-minus-box').val(num);
				var totalPrice = pPrice * num;
				$('.totalPrice').text(totalPrice+'원');
			});
// 상품 개수 end		
			
			
// 전화 걸기 모달 창 start --------------------------------------

			  var callOpen = $("#callOpen");
			  var callLink = $(".callLink");

			  callLink.click(function(e){
				e.preventDefault();  
				callOpen.fadeIn("slow");
			    return false;
			  });

			  $(".btn-call-close").click(function(e){
				  e.preventDefault();  
				  callOpen.fadeOut("slow");
			  });	
			  
			  
			  
// 전화 걸기 모달 창  end --------------------------------------
			
		})
		</script>
        
		<!-- 헤더 -->
		<jsp:include page="../default/header.jsp" flush="false"/>
        <!-- 헤더 끝 -->
      
    </head>
    <body class="other-page">

		 <!-- 현재 페이지 주소 값 currentPage에 저장 -->          
         <c:set var="currentPage" value="${pageContext.request.requestURL}"/>
   		 <input type="hidden" value="${currentPage}" class="currentPage"/>
    
        <section class="page-content-wrapper ptb-100">
			<!-- Single Product Top Info Start -->
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="breadcrumbs mb-40">
							<ul>
								<li class="home">
									<a title="Go to Home Page" href="index.html">Cake</a>
									<span class="arrow_carrot-right"></span>
								</li>
								<li class="home">
									<a title="Go to Paroduct page" href="single-product.html">All cake</a>
									<span class="arrow_carrot-right"></span>
								</li>
								<li class="category3">
									<span>Detail View</span>
								</li>
							</ul>
						</div>
					</div>
					
			<c:set var="pDetail" value="${requestScope.productDetail}"/>
			<c:set var="pBiz" value="${requestScope.productDetailBiz}"/>
			<!-- 댓글 달기 버튼 id 비교할 hidden태그 -->
			<input type="hidden" value="${pBiz.id}" class="pBizId"/>
			
					<div class="col-md-6">
						<div class="singlepro-left">
							<div class="pro-img-tab-content tab-content">
								<div class="tab-pane active" id="image-1">
									<div class="simpleLens-big-image-container">
										<a class="simpleLens-lens-image" data-lightbox="roadtrip" data-lens-image="/resources/img/product/${pDetail.pImg}.jpg">
											<img src="/resources/img/product/${pDetail.pImg }.jpg" alt="" class="simpleLens-big-image">
										</a>
									</div>
								</div>
							</div>
							
							<div class="detail-likes-wrap">
								<!-- 좋아요 누르면 fa fa-heart-o에서 fa-heart로 변경될 것 -->
								<input type="hidden" id="pbNum" value="${pDetail.pbNum}" >
								<a class="detail-likes"><i class="heart fa fa-heart-o"></i>&nbsp;${pDetail.pbLike} Likes </a>
							</div>
							
							<div class="category mt-50">
										<h4>TAGS</h4>
										<div class="tag-list mt-30 text-uppercase">
											<ul>
												<c:forEach var="pbTag" items="${requestScope.pbTag}">
												<li><a href="cakeSearch.ca?input_search=%23${pbTag}">#${pbTag}</a></li>
												</c:forEach>
											</ul>
										</div>
									</div>
						</div>
					</div>
					
			<c:set var="pReviewListSize" value="${requestScope.pReviewListSize}"/>
			<c:set var="pReviewAverage" value="${requestScope.averageStar}"/>
			<fmt:formatNumber value="${pReviewListSize}" type="number" var="pReviewNum"/>
			<fmt:formatNumber value="${pReviewAverage}" type="number" var="pReviewAverNum"/>
			<c:set var="pReviewStarGrey" value="${5-pReviewAverNum}"/>
			
					<div class="col-md-6">
						<div class="singlepro-right">
							<div class="snglepro-content">
								<span>${pDetail.pbMiniTitle }</span>
								<h3 style="font-size: 2em;"><a>${pDetail.pName}</a></h3>
								<div class="rating-box">
								<c:forEach begin="1" end="${pReviewAverage}">
									<i class="fa fa-star"></i>
								</c:forEach>
								<c:forEach var="grey" begin="1" end="${pReviewStarGrey}">
									<i class="fa fa-star" style="color:#dbdbdb;"></i>
								</c:forEach>
									<span>${pReviewNum} Reviews</span>
								</div>
								<div class="prce-stock">
									<h4><fmt:formatNumber value="${pDetail.pPrice}" pattern="\#,###"/></h4>
									<h6 id="bizName">${pBiz.bizName}</h6>
								</div>
								<p>${pDetail.pbMiniContent}</p>
								<div class="pro-info">
									<ul>
									
										<!-- 당일 구매 가능 상품 여부 if/else  -->
										<c:choose>
											<c:when test="${pDetail.pbYN eq 'Y'}">
												<li>* 당일 구매 가능</li>
											</c:when>
											<c:otherwise>
												<li>* 당일 구매 불가능</li>
											</c:otherwise>
										</c:choose>
										<li>* 한달 내로 예약 가능</li>
										<li>* 문구 추가 가능</li>
									</ul>
								</div>
								<div class="input-content mb-50">
									
									<div class="detail-input">
									<label>문구 추가</label> 
									<input class="detail-text mt-10" id="productAddText" placeholder="케이크에 추가하실 문구를 입력해주세요." type="text">
									</div>
									
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
        <script>
        $(function() {
    		//datepicker 한국어로 사용하기 위한 언어설정
    		$.datepicker.setDefaults($.datepicker.regional['ko']);

    		//시작일.
    		$('.cake-reserve').datepicker({
    			dateFormat : "yy-mm-dd", // 날짜의 형식
    			changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
    			minDate : 1, // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
    			maxDate: "+1m +1w" 
    		});
    		});
        </script>
									
									<div class="detail-input">
									<label for="fromDate">예약 날짜</label> 
									<input class="cake-reserve detail-text mt-10" id="productReserve" placeholder="예약 날짜를 선택해 주세요." type="text" id="cake-reserve">
									</div>
									
									<div class="quantity mt-10">
									<label>상품 개수</label>
									<!-- 상품 + / - 제이쿼리에서 처리할 것 -->
										<div class="dec qtybutton">-</div>
										  <input type="text" value="0" name="qtybutton" class="cart-plus-minus-box pl-20 pr-20">
										 <div class="inc qtybutton">+</div>
									</div>
									
									<div class="detail-input">
									<label>배송비</label> 
									<span>
										<c:choose>
											<c:when test="${pBiz.bizDeliveryYn eq 'Y'}">
												<!-- 배송 가능하면 배송비 표시 -->
												<c:set var="delivery" value="${pBiz.bizDelivery}원"/>
											</c:when>
											<c:otherwise>
												<!-- 배송 불가능하면 배송 불가 표시-->
												<c:set var="delivery" value="배송 불가능한 상품입니다."/>
											</c:otherwise>
										</c:choose>
									<label class="delivery" style="clear:none; margin-left:20px;">${delivery}</label>
									</span>
									</div>
									
									
									<div class="detail-input">
									<label>총 &nbsp;가격</label> 
									<span><label class="totalPrice" style="clear:none; margin-left:10px;">0원</label></span>
									</div>
									
									<div class="detail-input">
									<button class="detail-btn" id="addCart">장바구니 담기</button>
									<button class="detail-btn" id="directCheckout">구매하기</button>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Single Product Top Info Start -->



	<hr class="ml-100 mr-100">
	
<!-- 상품 디테일 시작 -->
		<div class="detail-text-box mt-100 mb-100 ml-150 mr-150" style="width:70%;">
			<h2 class="detail-title">${pDetail.pName}</h2>
			<h3 class="detail-intro mtb-40">상품 소개</h3>
			
			<p class="detail-contents mtb-100">
				${pDetail.pbContent}
			</p>
				
				<h6 class="detail-h6">
				색소에 관련하여 알려드립니다. <br>
				본 제품에 사용된 색소는 미국 및 한국식약청의 허가를 받은 제품으로,인체에 무해한 안전한 색소입니다. <br>
				본제품은 데코레이션 기본케익색상이 진한편으로 색소에 대해 거부감이 있으신 분들께서는 색이흐린 타제품으로 선택해 주시기 바랍니다.<br>
				</h6>

			<ul class="mtb-40">
				<li><span class="tit">규격</span> <span class="data">${pDetail.pSize}호</span></li>
				<li><span class="tit">사이즈</span> <span class="data">(cm)${pDetail.pCM}</span></li>
				<li><span class="tit">보관방법</span> <span class="data">-18˚C 이하</span></li>
				<li><span class="tit">유통기한</span> <span class="data">제조일로부터 6개월</span></li>
				
			</ul>

			<h3 class="detail-intro mt-100 mb-40">예약시 주의 사항</h3>
			<h6 class="detail-h6">
				- 필요하신 날보다 안전하게 하루 전 받아보시는 편을 추천해드립니다.<br>
				- 공휴일의 경우 택배사의 휴무로 인해 배송일 지정이 불가합니다. <br>
				- 월요일과 일요일은 토요일 택배 집하가 없으므로 선택하실 수 없습니다. <br>
				- 택배는 배송시간을 지정할 수 없으므로, 시간을 선택하실 수 없습니다. <br>
				- 날짜에 맞춰 배송처리 되지만 고객님의 주문서 표기에는 발송중 처리됩니다.<br>
				- 개봉 후 에는 변질의 우려가 있으니 가급적 한 번에 드시기 바랍니다. <br>
				- 함께 동봉해드리는 이용 및 보존안내 설명서를 반드시 읽어보시고 상품을 사용, 보관해주시기 바랍니다.<br>
				- 본 상품은 주문 후 제작에 들어가는 수제작 맞춤 상품으로, 주문 후 상품을 받으신 후에는 취소 및 반품이 불가합니다.<br>
				- 제작 요청시 고객님의 과실(문구오류 등)로 인한 환불은 불가능하므로, 충분히 검토 후 주문 부탁드립니다.
				</h6>
			
			<!-- shop 소개 시작 -->
			<div class="inner mt-150 mb-10">
				<div class="shop-location">
					
					<!-- 경도, 위도  -->
					<input type="hidden" name="spcLat" id="spcLat" value="37.518986">
					<input type="hidden" name="spcLng" id="spcLng" value="127.04174">
					
					<p class="shop-name mt-30">${pBiz.bizName}</p>
					<p class="shop-address">${pBiz.mBasicAddr}&nbsp;${pBiz.mDetailAddr}</p>
				</div>

				<div class="row" id="_contact" _spaceid="3425" _spcnm="${pBiz.bizName}">
					
					<div> 
						<a href=#callOpen class="callLink"> 
							<span class="btn-inner mr-10"><i class="fa fa-phone mr-10"></i>전화걸기</span>
						</a>
						
						<!-- 길찾기 누르면 해당 가게가 목적지로 설정됨 -->
						<a id="roadFind"> 
							<span class="btn-inner"><i class="fa fa-location-arrow mr-10"></i>길찾기</span>
						</a>
					</div>
						
						<div class="modalOpen" id="callOpen">
							<div class="mask">
							</div>
						<div class="white_content">
							  <div>
							  	<p class="pop_guide_txt mb-30">
							  	"LikeyCakey를 통해 연락드렸어요~"
							  	<br>라고 말씀하시면 더 친절하게 
							  	<br>안내 받으실 수 있습니다! 
							  	</p>
							  	<hr>
							  	<p class="shop-name">${pBiz.bizName}</p>
							  	<h4 class="mb-20">${pBiz.bizPn}</h4>
								<hr>	  	
							  	
							  	<button type="button" class="btn btn-call-close">닫기</button>
							  </div>
						</div>
						</div>
					
				</div>
			</div>

<!-- 지도  시작 -->
<!-- &libraries=services -->
			<div id="map" style="width:80%;height:400px; pointer-events:auto;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36cabc0a509368e0120f98820eb971c0&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch($('.shop-address').text(), function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {

		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				
		        $('#roadFind').attr('href', 'http://map.daum.net/link/to/'+ $('.shop-address').text() + ',' + result[0].y + ',' + result[0].x)
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ $('.shop-name.mt-30').text()+'</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
			</script>
<!-- shop 소개 끝 -->
		<div class="detail-text-box mt-150"> </div>


<!-- 리뷰 시작 -->
			<div class="detail-text-box width-80 mt-100 mb-100">
				<h2 class="detail-intro">
					이용 후기 <strong class="review-cnt mint">4개</strong> 
					<i class="fa fa-circle ml-10 mr-10" style="font-size: 0.2em; color: #999999; 
					   vertical-align: middle"></i>
					평균 평점 <strong class="review-average mint">0점</strong>
				</h2>

				<div>
					<ul class="review_list" id="review_list">
						<li class="rlist ">
							<div class="tab-content"></div>
						</li>
					</ul>
					<div class="paging text-center"></div>
				</div>
			</div>

			<div class="modalOpen" id="replyOpen">
				<div class="mask"></div>
				<div class="white_content">
					<div>
						<h4 style="text-align: left;" class="modal-title">댓글 수정하기</h4>
						<hr style="margin: 0">
						<input type="hidden" class='reply-prNum'>
						<div class="modal-caption">
							<label class="ml-10"> 댓글 </label>
							<div class="reply-length-wrap">
								<em class="reply-length">0</em>자/<em>200</em>자
							</div>
						</div>
						<textarea name="" class="replyContent"
							placeholder="등록할 댓글을 입력해주세요." maxlength="200">
												</textarea>
						<div class="reply-btn-relative">
							<div class="reply-btn-wrap">
								<button type="button" class="btn btn-reply-close"
									style="background-color: #9a9a9a">취소</button>
								<button type="button" class="btn btn-reply-submit">수정</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 리뷰 끝 -->
		
<!-- 문의 시작 -->
<!-- 		<div class="detail-text-box width-80 mb-70" id="qna" style="">
			<h2 class="detail-intro">
				Q&amp;A&nbsp; <strong><em class="qna-cnt">0</em>개</strong>  		
				모달창 처리하기 
				<a href="#" class="btn_qna_write"><i class="fa fa-pencil mr-10"></i> <span>질문 작성하기</span></a>
			</h2>

				<div>
					<ul class="review_list" id="review_list">
						<li class="rlist ">
							<div class="tab-content">
								<div class='rbox_mine'>
									<input type='hidden' value='"+ json[i].prNum +"'
										class='reviewNum'> <span class='pf_img'
										style='background-image: url(/resources/img/client/1.png)'></span>
									<strong class='guest_name'></strong>
									<p class='p_review'></p>
									<div class='rbox_info_base'>
										<a class='review-reply-insert-btn'>&nbsp;댓글 달기 &nbsp;<i
											class='fa fa-comment mr-10'></i></a> <span class='time_info'>2018.03.31</span>
									</div>
								</div>
								<div class='rbox_reply'>
									<input type='hidden' value='"+ json[i].prNum +"' class='prNum'>
									<p class='p_tit_reply'>
										<em>뚜레주르</em>님의 댓글
									</p>
									<p class='p_review'>굳굳</p>
									<div class='rbox_info_base'>
										<p class='time_info'>2018/04/13</p>
										<span class='reply-btn'> <a href='#replyOpen'
											class='replyUpdate mr-10'>수정</a><a class='replyDelete'>삭제</a>
										</span>
									</div>
								</div>
								<p class="qna_result">등록된 질문이 아직 없습니다.</p>
							</div>
						</li>
					</ul>
					<div class="paging text-center"></div>
				</div>
			</div> -->
<!-- 문의 끝 -->
		
		
<!-- 호스트 프로필 시작 -->
		<div class="host_profile mb-100">
			<div class="inner">

				<div class="host_area" id="_host_map">
					<div
						style="background-image: url(resources/img/member/${pBiz.mPhoto});"
						class="pf_left"></div>
					<div class="pf_right">
						<strong class="pf_host">HOST</strong> <span class="pf_name">${pBiz.bizName}</span>
						<p class="pf_txt">맛있는 케이크가 많은 곳 [${pBiz.bizName}] 입니다.</p>
					</div>
				</div>
				<a href="hostinfo.ca?input_vendor_id=${pBiz.id }"> <span class="btn-inner"> 호스트 페이지로 이동  <i class="fa fa-arrow-right ml-10"></i></span>
				</a>

			</div>
		</div>
<!-- 호스트 프로필 끝 -->
		
<!-- 호스트의 다른 케이크  시작 -->
		<div class="detail-text-box mb-100" id="qna" style="">
			<h2 class="detail-intro"> 뚜레쥬르의 다른 케이크 </h2>
		</div>
		
		<div class="row">
		<div class="col-md-4">
			<div class="single-product style-two mb-50">
				<div class="single-img">
					<a href="#"><img src="/resources/img/product-tab/2.jpg" alt="" /></a>
					<div class="hover-content text-center">
						<ul>
							<li><a href="#" class="icon_cart_alt "></a></li>
							<li><a href="#" class="icon_heart_alt"></a></li>
						</ul>
					</div>
				</div>
				<div class="young-product-details mt-20">
					<h4>
						<a href="single-product.html">들어는 보셧나 마카롱 케이크</a>
					</h4>
					<div class="young-product-details-tag">
						<i class="fa fa-map-marker"></i> <span
							class="young-product-details-tag-place">서울시 북구</span> <i
							class="fa fa-tag"></i> <span
							class="young-product-details-tag-place-detail">#마카롱</span> <span
							class="young-product-details-tag-place-detail">#마카롱이라구?</span> <span
							class="young-product-details-tag-place-detail">#말도안돼</span>
					</div>
					<div class="young-product-details-price">
						<span>33,000 원</span> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i>
					</div>
				</div>
			</div>
		</div>
		</div>
<!-- 호스트의 다른 케이크  시작 -->
		</div>
	</section>
		
<!-- 푸터 -->
        <jsp:include page="../default/footer.jsp" flush="false"/>
<!-- 푸터 끝 -->
        
        
		<!-- all js here -->
<!--         <script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>
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
        <script src="/resources/js/Form.js"></script> -->
        
      
    </body>
</html>
