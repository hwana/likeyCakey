	/* 좋아요 클릭했을 때 */

$(function(){
	
	
	var id = $('.memberId').val();
	console.log('현재 접속중인 아이디는 : ' + id);
	//id='tous';
	
	var currentPage = $('.currentPage').val();
//리뷰 select start -----------------------
	if(currentPage.match(/detailView.jsp/)){
		var pbNum = $('#pbNum').val();
		console.log('게시글 번호는 ' + pbNum);
	
	$.ajax({
		url : "reviewList.ca",
		type : "post",
		dataType : "json",
		data : {
			'pbNum' : pbNum 
		},
		
		success : function(pReview){
		 	var jsonStr = JSON.stringify(pReview);
			var json = JSON.parse(jsonStr);
			
			var rowsize = 2; // 한 페이지에 보일 게시물 수 
			var block = 5; // 페이징 처리할 때 1~5 / 6~10 / 11~15 식으로 보이도록 5개로 고정
			
			var total = json.length;
			console.log("총 리뷰글 수는 : " + total);
			var allPage = Math.ceil(total/rowsize);
			console.log("총 페이지 수는 : " + allPage);
			
			
			// 이용 후기 개수 표시
			$('.review-cnt').text(total+'개');

			// 리뷰가 있을 경우 
			if(total>0){
				var values = $('.rlist > .tab-content').html();
				var reviewAverage = 0;
				for(var average=0; average<total; average++){
					reviewAverage += json[average].prStar;
				}
				
				reviewAverage = Math.ceil(reviewAverage/total);
				$('.review-average').text(reviewAverage +'.0 점');
				
				var i = 0;
				for(var page = 1; page<=allPage; page++){
					// 해당 페이지 클릭하면 active in 클래스 추가하기
					values += "<div id=reviewPage"+page+" class='tab-pane fade'>"; 
				for(var o = 0; o<rowsize; o++){
					//console.log("total은 : " + total);
					//console.log("i는 : " + i);
					if(i==total){
						break;
					}
					values += "<div class='rbox_mine'>"
						   + "<input type='hidden' value='"+ json[i].prNum +"' class='reviewNum'>"
						   + "<span class='pf_img' style='background-image: url(/resources/img/member/default_user.jpg)'></span>"
						   + "<strong class='guest_name'>"+ json[i].id+"</strong>"
						   + "<p class='p_review'>"+ json[i].prContent +"</p>";
				 if(json[i].prFile!=null){
					 values += "<div class='space_list swiper_list photo_review'>"
					 + "<div class='flex_wrap column3 fluid'>"
					 + "<article class='box box_space'>"
					 +	"<div class='inner'>"
					 + 			"<div class='img_box'>"
					 +			"<span class='img' style='background-image: url(/resources/img/cake/" + json[i].prFile +")'></span>"
					 + 			"<span class='border'></span>"
					 + 			"</div>"
					 + 		"</a>"
					 + 	"</div>"
					 + "</article>"
					 + "</div>"
					 + "</div>";
				 }
					values += "<div class='rbox_info_base'>";
					// 현재 접속중인 id와 게시물 작성자(사업자)의 아이디가 같으면 댓글 등록하기 버튼 달기
					if($('.pBizId').val()===id && !json[i].prcNum){
					values += 	"<a class='review-reply-insert-btn'>&nbsp;댓글 달기 &nbsp;<i class='fa fa-comment mr-10'></i></a>";
					}
					
					values +=   "<span class='time_info'>"+ json[i].prDate+"</span>"
					       + "</div>"
					       + "<span class='rate_area'> <span class='blind'>평점&nbsp;</span>";
					prStar = json[i].prStar;
					greyStar = 5 - prStar;
					for (var j = 0; j < prStar; j++) {
				    values += 	"<span class='rate active'><i class='fa fa-star'></i></span>";
					}
					if(greyStar != 0){
						for (var j = 0; j < greyStar; j++) {
						    values += 	"<i class='fa fa-star' style='color:#dbdbdb;'></i>";
							}
					}
					values += "</div>";
					// 사업자 댓글이 있을 경우 추가
					if(json[i].prcNum){
					    values += "<div class='rbox_reply'>"
							   + "<input type='hidden' value='"+ json[i].prNum +"' class='prNum'>"
							   + "<p class='p_tit_reply'>"
							   + "<em>"+ $('#bizName').text() +"</em>님의 댓글"
							   + "</p>"
							   + "<p class='p_review'>"+ json[i].prcContent +"</p>"
							   + "<div class='rbox_info_base'>"
							   + "<p class='time_info'>"+ json[i].prcDate +"</p>";
						if($('.pBizId').val()===id){
						values += "<span class='reply-btn'>"
							   +	"<a href='#replyOpen' class='replyUpdate mr-10'>수정</a><a class='replyDelete'>삭제</a>"
							   + "</span>";
						}
						values += 	"</div>"
							   + "</div>"; 
					}
					i++;
				} // 두번째 for문
					values += "</div>";
				} // 바깥 for문
				$('.rlist > .tab-content').html(values);
				
				// 페이징 처리 start ******************************************************************************************
				
				// 처음에는 1페이지를 active
				$('#reviewPage1').attr('class', 'tab-pane fade active in');
				// 현재 페이지 불러오기
				var pg = parseInt($('.tab-pane.fade.active.in').attr('id').replace('reviewPage', '')); 
				
				var start = (pg * rowsize) - (rowsize - 1); // 해당페이지에서 게시글 시작번호
				var end = (pg * rowsize); // 해당페이지에서 게시글 끝번호
				
				 /* 시작 블럭 숫자(1~5페이지 일 경우 1, 6~10일 경우 6) */
				var startPage = ((pg-1)/block * block) + 1; 
				var endPage = ((pg-1)/block * block) + block; // 끝 블럭 숫자(1~5일 경우 5, 6 ~ 10일 경우 10)
				
				
				var pageValues = $('.paging').html();
				
				// 만약 최종 페이지 수보다 끝나는 페이지 수가 더 클 경우 두 변수 값을 같게 할 것
					if(endPage > allPage) {
							endPage = allPage;
					}
				
				// 만약 현재 페이지가 한 페이징 개수(5)보다 클경우 << < 버튼 표시
				if(pg > block){
					pageValues += "<a class='btn_prev_list_end' href='#reviewPage1'> "
							   +  "<i class='fa fa-angle-double-left'></i></a>"
							   +  "<a class='btn_prev_list>"
							   +  "<i class='fa fa-angle-left mr-10'></i></a>";
				}
				
				for(var i=startPage; i<= endPage; i++){
					if(i==pg){
						pageValues += "<a class='reviewNum active' href='#reviewPage"+i+"'>["+i+"]</a>"
					}else{
						pageValues += "<a class='reviewNum' href='#reviewPage"+i+"'>["+i+"]</a>"
					}
				}
				
				if(endPage < allPage){
				pageValues +=  "<a class='btn_next_list active'>"
						   +  "<i class='fa fa-angle-double-right ml-10'></i></a>"
						   +  "<a class='btn_next_list_end active' href='#reviewPage"+ allPage +"'>"
						   +  "<i class='fa fa-angle-right'></i></a>";
				}
			
				$('.paging').html(pageValues);

				// 페이지 번호 클릭 - 페이징 처리
				$('.reviewNum').click(function(e){
					e.preventDefault;
					var curPg = parseInt($('.reviewNum.active').text().replace('[','').replace(']',''));
					var goPg = parseInt($(this).text().replace('[','').replace(']',''))
					$('#reviewPage'+curPg +'').attr('class','tab-pane fade');
					$('#reviewPage'+goPg +'').attr('class','tab-pane fade active in');
					$($('.reviewNum.active').attr('class','reviewNum'));
					$($(this).attr('class', 'reviewNum active'))
					
				});
				// 페이징 처리 end ******************************************************************************************
				
				// 리뷰가 없을 경우	
			} else {
				var values = $('.rlist > .tab-content').html();
				values += "<div class='ptb-150'>"
					   +  "<p class='qna_result'>등록된 리뷰가 아직 없습니다.</p>"
					   +  "</div>";
				$('.rlist > .tab-content').html(values);
			}
			
		
			
// 리뷰 댓글 등록 버튼 누르기 START ************************************************************
			var replyOpen = $("#replyOpen");
			$(document).on("click", '.review-reply-insert-btn' ,function(e){
				e.preventDefault();
				$('.modal-title').text('댓글 등록하기');
				$('.btn-reply-submit').text('등록');
				$('.replyContent').val('');
				$('.reply-prNum').val($(this).parent().parent().children('.reviewNum').val());
				replyOpen.fadeIn("slow");
			});
// 리뷰 댓글 등록 버튼 누르기 END ************************************************************

			
// 리뷰 댓글 등록, 수정 START ************************************************************
			var replyUpdate = $(".replyUpdate");
			 
			// 리뷰 수정 클릭 시 모달창 open
			$(document).on("click", '.replyUpdate' ,function(e){
			//replyUpdate.click(function(e){
				e.preventDefault();  
				replyOpen.fadeIn("slow");
				$('.modal-title').text('댓글 수정하기');
				$('.btn-reply-submit').text('수정');
				$('.replyContent').val($(this).parent().parent().parent().children('.p_review').text());
			    $('.reply-prNum').val($(this).parent().parent().parent().children('.prNum').val());			
		    });
			
			// 수정 모달창 OPEN 메소드
			function updateModalOpen(selector){
				replyOpen.fadeIn("slow");
				$('.replyContent').val(selector.parent().parent().parent().children('.p_review').text());
			    $('.reply-prNum').val(selector.parent().parent().parent().children('.prNum').val());			
			}
			
			// 취소 버튼 클릭
			$('.btn-reply-close').click(function(e){
				e.preventDefault();  
				replyOpen.fadeOut("slow");
			});
			
			// 문자 길이 200자 제한 - 몇자인지 표시
			$('.replyContent').keyup(function(){
				var replyLength = $('.replyContent').val().length;
				$('.reply-length').text(replyLength);
			
			});
			
			// 수정, 등록 버튼 클릭 - 리뷰댓글 테이블 update
			$('.btn-reply-submit').click(function(e){
				var prNum  = $('.reply-prNum').val();
				
				// 댓글 수정 일시
				if($('.btn-reply-submit').text()==="수정"){
					$.ajax({
						url : "replyHandle.ca",
						type : "post",
						data : {
							'pbNum' : parseInt(pbNum),
							'prNum' : parseInt(prNum),
							'prcContent' : $('.replyContent').val(),
							'reviewFunction' : "수정"
						},
						success : function(result) {
							if(result="ok") {
								alert('댓글 수정이 완료되었습니다.');
								$('input[value*='+ prNum +'][class="prNum"]').parent().children('.p_review').text($('.replyContent').val());
								replyOpen.fadeOut("slow");
							}
								
						},
						error : function(request,status,error) {
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				// 댓글 등록 일때
				} else if($('.btn-reply-submit').text()==="등록") {
					if($('.replyContent').val()==""){
						alert('댓글 내용을 입력해주세요');
						$('.replyContent').focus();
						return false;
						
					}
					
					$.ajax({
						url : "replyHandle.ca",
						type : "post",
						data : {
							'pbNum' : parseInt(pbNum),
							'prNum' : parseInt(prNum),
							'prcContent' : $('.replyContent').val(),
							'reviewFunction' : "등록"
						},
						success : function(result) {
							if(result="ok") {
								alert('댓글 등록이 완료되었습니다.');
								
								/*location.reload();
								$('div[class="tab-pane fade active in"]').attr('class', 'tab-pane fade');
								$('input [type="hidden"][class="prNum"][value*="'+prNum+'"]').parent().parent().attr('class', 'tab-pane fade active in');*/
								// 오늘날짜
								var today = new Date();
								var dd = today.getDate();
								var mm = today.getMonth()+1; //January is 0!
								var yyyy = today.getFullYear();
								mm = mm >= 10 ? mm : '0' + mm;   
								dd = dd >= 10 ? dd : '0' + dd;   
								today = yyyy+'/'+mm+'/'+dd

								
								 var reviewAfter = "<div class='rbox_reply'>"
									   + "<input type='hidden' value='"+ prNum +"' class='prNum'>"
									   + "<p class='p_tit_reply'>"
									   + "<em>"+ $('#bizName').text() +"</em>님의 댓글"
									   + "</p>"
									   + "<p class='p_review'>"+ $('.replyContent').val() +"</p>"
									   + "<div class='rbox_info_base'>"
									   + "<p class='time_info'>"+ today +"</p>"
									   + "<span class='reply-btn'>"
									   +	"<a href='#replyOpen' class='replyUpdate mr-10'>수정</a><a class='replyDelete'>삭제</a>"
									   + "</span>"
									   + "</div>"
									   + "</div>"; 
								 
								$('input[value*='+ prNum +'][class="reviewNum"]').parent().after(reviewAfter);
								//console.log("댓글"+$('input[value*='+ prNum +'][class="reviewNum"]').siblings('.rbox_info_base').children('.review-reply-insert-btn').attr('class'));
								$('input[value*='+ prNum +'][class="reviewNum"]').siblings('.rbox_info_base').children('.review-reply-insert-btn').remove();
								replyOpen.fadeOut("slow");
								
								
							}
								
						},
						error : function(request,status,error) {
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				}
				
			});
			
			
			
// 리뷰 댓글 수정 END ************************************************************

			
// 리뷰 댓글 삭제 START ************************************************************
			$(document).on('click', '.replyDelete', function(e){
				e.preventDefault();
				if(confirm('댓글을 정말 삭제하시겠습니까?')){
					var prNum  = $(this).parent().parent().parent().children('.prNum').val();
					$.ajax({
						url : "replyHandle.ca",
						type : "post",
						data : {
							'pbNum' : parseInt(pbNum),
							'prNum' : parseInt(prNum),
							'reviewFunction' : "삭제"
						},
						success : function(result) {
							if(result="ok") {
								alert('댓글 삭제가 완료되었습니다.');
								// 댓글 삭제시 댓글 등록하기 다시 보이기
								$('input[value*='+prNum+'][class="reviewNum"]').siblings('.rbox_info_base')
								.prepend('<a class="review-reply-insert-btn">&nbsp;댓글 달기 &nbsp;<i class="fa fa-comment mr-10"></i></a>');
								// 삭제된 댓글 지우기
								$('input[value*='+ prNum +'][class="prNum"]').parent().remove();
								replyOpen.fadeOut("slow");
							}
								
						},
						error : function(request,status,error) {
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				}
				
			});
// 리뷰 댓글 삭제 END ************************************************************
		  
		},
		error : function(request,status,error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}
// 리뷰 select end -----------------------
	
	
	
// QNA start -----------------------------------------------------------------------------------------------
/*	$.ajax({
		url : "qnaList.ca",
		type : "post",
		dataType : "json",
		data : {
			'pbNum' : pbNum 
		},
		
		success : function(pQna){
		 	var jsonStr = JSON.stringify(pQna);
			var json = JSON.parse(jsonStr);
			
			var rowsize = 2; // 한 페이지에 보일 게시물 수 
			var block = 5; // 페이징 처리할 때 1~5 / 6~10 / 11~15 식으로 보이도록 5개로 고정
			
			var total = json.length;
			console.log("총 질문글 수는 : " + total);
			var allPage = Math.ceil(total/rowsize);
			console.log("총 질문 페이지 수는 : " + allPage);
			
			
			// 질문 개수 표시
			$('.qna-cnt').text(total);

			// 질문이 있을 경우 
			if(total>0){
				var values = $('.rlist > .tab-content').html();
				var reviewAverage = 0;
				for(var average=0; average<total; average++){
					reviewAverage += json[average].prStar;
				}
				
				reviewAverage = Math.ceil(reviewAverage/total);
				$('.review-average').text(reviewAverage +'.0 점');
				
				var i = 0;
				for(var page = 1; page<=allPage; page++){
					// 해당 페이지 클릭하면 active in 클래스 추가하기
					values += "<div id=reviewPage"+page+" class='tab-pane fade'>"; 
				for(var o = 0; o<rowsize; o++){
					//console.log("total은 : " + total);
					//console.log("i는 : " + i);
					if(i==total){
						break;
					}
					values += "<div class='rbox_mine'>"
						   + "<input type='hidden' value='"+ json[i].prNum +"' class='reviewNum'>"
						   + "<span class='pf_img' style='background-image: url(/resources/img/client/1.png)'></span>"
						   + "<strong class='guest_name'>"+ json[i].id+"</strong>"
						   + "<p class='p_review'>"+ json[i].prContent +"</p>"
						   + "<div class='space_list swiper_list photo_review'>"
						   + "<div class='flex_wrap column3 fluid'>"
						   + "<article class='box box_space'>"
						   +	"<div class='inner'>"
						   + 		"<a href='/resources/img/single-product/1.jpg' class='_review_img_link' target='_blank'"
						   +		         "data-img-path='/resources/img/single-product/1.jpg'>"
					       + 			"<div class='img_box'>"
						   +			"<span class='img' style='background-image: url(/resources/img/single-product/1.jpg)'></span>"
						   + 			"<span class='border'></span>"
					       + 			"</div>"
					       + 		"</a>"
					       + 	"</div>"
					       + "</article>"
					       + "</div>"
					       + "</div>"
					       + "<div class='rbox_info_base'>";
					// 현재 접속중인 id와 게시물 작성자(사업자)의 아이디가 같으면 댓글 등록하기 버튼 달기
					if($('.pBizId').val()===id && !json[i].prcNum){
					values += 	"<a class='review-reply-insert-btn'>&nbsp;댓글 달기 &nbsp;<i class='fa fa-comment mr-10'></i></a>";
					}
					
					values +=   "<span class='time_info'>"+ json[i].prDate+"</span>"
					       + "</div>"
					       + "<span class='rate_area'> <span class='blind'>평점&nbsp;</span>";
					prStar = json[i].prStar;
					greyStar = 5 - prStar;
					for (var j = 0; j < prStar; j++) {
				    values += 	"<span class='rate active'><i class='fa fa-star'></i></span>";
					}
					if(greyStar != 0){
						for (var j = 0; j < greyStar; j++) {
						    values += 	"<i class='fa fa-star' style='color:#dbdbdb;'></i>";
							}
					}
					values += "</div>";
					// 사업자 댓글이 있을 경우 추가
					if(json[i].prcNum){
					    values += "<div class='rbox_reply'>"
							   + "<input type='hidden' value='"+ json[i].prNum +"' class='prNum'>"
							   + "<p class='p_tit_reply'>"
							   + "<em>"+ $('#bizName').text() +"</em>님의 댓글"
							   + "</p>"
							   + "<p class='p_review'>"+ json[i].prcContent +"</p>"
							   + "<div class='rbox_info_base'>"
							   + "<p class='time_info'>"+ json[i].prcDate +"</p>";
						if($('.pBizId').val()===id){
						values += "<span class='reply-btn'>"
							   +	"<a href='#replyOpen' class='replyUpdate mr-10'>수정</a><a class='replyDelete'>삭제</a>"
							   + "</span>";
						}
						values += 	"</div>"
							   + "</div>"; 
					}
					i++;
				} // 두번째 for문
					values += "</div>";
				} // 바깥 for문
				$('.rlist > .tab-content').html(values);
				
				// 페이징 처리 start ******************************************************************************************
				
				// 처음에는 1페이지를 active
				$('#reviewPage1').attr('class', 'tab-pane fade active in');
				// 현재 페이지 불러오기
				var pg = parseInt($('.tab-pane.fade.active.in').attr('id').replace('reviewPage', '')); 
				
				var start = (pg * rowsize) - (rowsize - 1); // 해당페이지에서 게시글 시작번호
				var end = (pg * rowsize); // 해당페이지에서 게시글 끝번호
				
				  시작 블럭 숫자(1~5페이지 일 경우 1, 6~10일 경우 6) 
				var startPage = ((pg-1)/block * block) + 1; 
				var endPage = ((pg-1)/block * block) + block; // 끝 블럭 숫자(1~5일 경우 5, 6 ~ 10일 경우 10)
				
				
				var pageValues = $('.paging').html();
				
				// 만약 최종 페이지 수보다 끝나는 페이지 수가 더 클 경우 두 변수 값을 같게 할 것
					if(endPage > allPage) {
							endPage = allPage;
					}
				
				// 만약 현재 페이지가 한 페이징 개수(5)보다 클경우 << < 버튼 표시
				if(pg > block){
					pageValues += "<a class='btn_prev_list_end' href='#reviewPage1'> "
							   +  "<i class='fa fa-angle-double-left'></i></a>"
							   +  "<a class='btn_prev_list>"
							   +  "<i class='fa fa-angle-left mr-10'></i></a>";
				}
				
				for(var i=startPage; i<= endPage; i++){
					if(i==pg){
						pageValues += "<a class='reviewNum active' href='#reviewPage"+i+"'>["+i+"]</a>"
					}else{
						pageValues += "<a class='reviewNum' href='#reviewPage"+i+"'>["+i+"]</a>"
					}
				}
				
				if(endPage < allPage){
				pageValues +=  "<a class='btn_next_list active'>"
						   +  "<i class='fa fa-angle-double-right ml-10'></i></a>"
						   +  "<a class='btn_next_list_end active' href='#reviewPage"+ allPage +"'>"
						   +  "<i class='fa fa-angle-right'></i></a>";
				}
			
				$('.paging').html(pageValues);

				// 페이지 번호 클릭 - 페이징 처리
				$('.reviewNum').click(function(e){
					e.preventDefault;
					var curPg = parseInt($('.reviewNum.active').text().replace('[','').replace(']',''));
					var goPg = parseInt($(this).text().replace('[','').replace(']',''))
					$('#reviewPage'+curPg +'').attr('class','tab-pane fade');
					$('#reviewPage'+goPg +'').attr('class','tab-pane fade active in');
					$($('.reviewNum.active').attr('class','reviewNum'));
					$($(this).attr('class', 'reviewNum active'))
					
				});
				// 페이징 처리 end ******************************************************************************************
				
				// 리뷰가 없을 경우	
			} else {
				var values = $('.rlist > .tab-content').html();
				values += "<div class='ptb-150'>"
					   +  "<p class='qna_result'>등록된 리뷰가 아직 없습니다.</p>"
					   +  "</div>";
				$('.rlist > .tab-content').html(values);
			}
			
		
			
// 리뷰 댓글 등록 버튼 누르기 START ************************************************************
			var replyOpen = $("#replyOpen");
			$(document).on("click", '.review-reply-insert-btn' ,function(e){
				e.preventDefault();
				$('.modal-title').text('댓글 등록하기');
				$('.btn-reply-submit').text('등록');
				$('.replyContent').val('');
				$('.reply-prNum').val($(this).parent().parent().children('.reviewNum').val());
				replyOpen.fadeIn("slow");
			});
// 리뷰 댓글 등록 버튼 누르기 END ************************************************************

			
// 리뷰 댓글 등록, 수정 START ************************************************************
			var replyUpdate = $(".replyUpdate");
			 
			// 리뷰 수정 클릭 시 모달창 open
			$(document).on("click", '.replyUpdate' ,function(e){
			//replyUpdate.click(function(e){
				e.preventDefault();  
				replyOpen.fadeIn("slow");
				$('.modal-title').text('댓글 수정하기');
				$('.btn-reply-submit').text('수정');
				$('.replyContent').val($(this).parent().parent().parent().children('.p_review').text());
			    $('.reply-prNum').val($(this).parent().parent().parent().children('.prNum').val());			
		    });
			
			// 수정 모달창 OPEN 메소드
			function updateModalOpen(selector){
				replyOpen.fadeIn("slow");
				$('.replyContent').val(selector.parent().parent().parent().children('.p_review').text());
			    $('.reply-prNum').val(selector.parent().parent().parent().children('.prNum').val());			
			}
			
			// 취소 버튼 클릭
			$('.btn-reply-close').click(function(e){
				e.preventDefault();  
				replyOpen.fadeOut("slow");
			});
			
			// 문자 길이 200자 제한 - 몇자인지 표시
			$('.replyContent').keyup(function(){
				var replyLength = $('.replyContent').val().length;
				$('.reply-length').text(replyLength);
			
			});
			
			// 수정, 등록 버튼 클릭 - 리뷰댓글 테이블 update
			$('.btn-reply-submit').click(function(e){
				var prNum  = $('.reply-prNum').val();
				
				// 댓글 수정 일시
				if($('.btn-reply-submit').text()==="수정"){
					$.ajax({
						url : "replyHandle.ca",
						type : "post",
						data : {
							'pbNum' : parseInt(pbNum),
							'prNum' : parseInt(prNum),
							'prcContent' : $('.replyContent').val(),
							'reviewFunction' : "수정"
						},
						success : function(result) {
							if(result="ok") {
								alert('댓글 수정이 완료되었습니다.');
								$('input[value*='+ prNum +'][class="prNum"]').parent().children('.p_review').text($('.replyContent').val());
								replyOpen.fadeOut("slow");
							}
								
						},
						error : function(request,status,error) {
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				// 댓글 등록 일때
				} else if($('.btn-reply-submit').text()==="등록") {
					if($('.replyContent').val()==""){
						alert('댓글 내용을 입력해주세요');
						$('.replyContent').focus();
						return false;
						
					}
					
					$.ajax({
						url : "replyHandle.ca",
						type : "post",
						data : {
							'pbNum' : parseInt(pbNum),
							'prNum' : parseInt(prNum),
							'prcContent' : $('.replyContent').val(),
							'reviewFunction' : "등록"
						},
						success : function(result) {
							if(result="ok") {
								alert('댓글 등록이 완료되었습니다.');
								
								location.reload();
								$('div[class="tab-pane fade active in"]').attr('class', 'tab-pane fade');
								$('input [type="hidden"][class="prNum"][value*="'+prNum+'"]').parent().parent().attr('class', 'tab-pane fade active in');
								// 오늘날짜
								var today = new Date();
								var dd = today.getDate();
								var mm = today.getMonth()+1; //January is 0!
								var yyyy = today.getFullYear();
								mm = mm >= 10 ? mm : '0' + mm;   
								dd = dd >= 10 ? dd : '0' + dd;   
								today = yyyy+'/'+mm+'/'+dd

								
								 var reviewAfter = "<div class='rbox_reply'>"
									   + "<input type='hidden' value='"+ prNum +"' class='prNum'>"
									   + "<p class='p_tit_reply'>"
									   + "<em>"+ $('#bizName').text() +"</em>님의 댓글"
									   + "</p>"
									   + "<p class='p_review'>"+ $('.replyContent').val() +"</p>"
									   + "<div class='rbox_info_base'>"
									   + "<p class='time_info'>"+ today +"</p>"
									   + "<span class='reply-btn'>"
									   +	"<a href='#replyOpen' class='replyUpdate mr-10'>수정</a><a class='replyDelete'>삭제</a>"
									   + "</span>"
									   + "</div>"
									   + "</div>"; 
								 
								$('input[value*='+ prNum +'][class="reviewNum"]').parent().after(reviewAfter);
								//console.log("댓글"+$('input[value*='+ prNum +'][class="reviewNum"]').siblings('.rbox_info_base').children('.review-reply-insert-btn').attr('class'));
								$('input[value*='+ prNum +'][class="reviewNum"]').siblings('.rbox_info_base').children('.review-reply-insert-btn').remove();
								replyOpen.fadeOut("slow");
								
								
							}
								
						},
						error : function(request,status,error) {
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				}
				
			});
			
			
			
// 리뷰 댓글 수정 END ************************************************************

			
// 리뷰 댓글 삭제 START ************************************************************
			$(document).on('click', '.replyDelete', function(e){
				e.preventDefault();
				if(confirm('댓글을 정말 삭제하시겠습니까?')){
					var prNum  = $(this).parent().parent().parent().children('.prNum').val();
					$.ajax({
						url : "replyHandle.ca",
						type : "post",
						data : {
							'pbNum' : parseInt(pbNum),
							'prNum' : parseInt(prNum),
							'reviewFunction' : "삭제"
						},
						success : function(result) {
							if(result="ok") {
								alert('댓글 삭제가 완료되었습니다.');
								// 댓글 삭제시 댓글 등록하기 다시 보이기
								$('input[value*='+prNum+'][class="reviewNum"]').siblings('.rbox_info_base')
								.prepend('<a class="review-reply-insert-btn">&nbsp;댓글 달기 &nbsp;<i class="fa fa-comment mr-10"></i></a>');
								// 삭제된 댓글 지우기
								$('input[value*='+ prNum +'][class="prNum"]').parent().remove();
								replyOpen.fadeOut("slow");
							}
								
						},
						error : function(request,status,error) {
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				}
				
			});
// 리뷰 댓글 삭제 END ************************************************************
		  
		},
		error : function(request,status,error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
	
// QNA END --------------------------------------------------------------------------------------------------------
	*/
	function post_to_url(path, params, method) {
	    method = method || "post"; // Set method to post by default, if not specified.
	 
	    // The rest of this code assumes you are not using a library.
	    // It can be made less wordy if you use one.
	    var form = document.createElement("form");
	    form.setAttribute("method", method);
	    form.setAttribute("action", path);
	 
	    for(var key in params) {
	        var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", key);
	        hiddenField.setAttribute("value", params[key]);
	 
	        form.appendChild(hiddenField);
	    }
	 
	    document.body.appendChild(form);
	    form.submit();
	}	
	
	
// 장바구니 담기 start ----------------------	
	$('#addCart').click(function(e){
		e.preventDefault();
		addCart($(this).attr('id'));
	});
	
	$('#directCheckout').click(function(e){
		e.preventDefault();
		addCart($(this).attr('id'));
	});
// 장바구니 담기 end ----------------------	
	
	function addCart(btnStatus){

		//날짜 형식 판별
		var datePattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
		var bookDate = $('#productReserve').val();
		
		var addText = $('#productAddText').val();
		var cakeCnt = $('.cart-plus-minus-box').val();
		
		// 장바구니 담기 유효성 검사
		if(!id){
			if(confirm('회원만 가능한 서비스 입니다. 로그인 페이지로 이동하시겠습니까?')){
				location.href="bizLogin.ca";
			};
			return false;
		} else if(!$('#productReserve').val()){
			alert('예약 날짜를 선택해 주세요.');
			$('#productReserve').focus();
			return false;
		} else if(!datePattern.test(bookDate)) {
			alert('달력을 이용해 날짜를 선택해 주세요.');
			$('#productReserve').focus();
			return false;
		}else if($('.cart-plus-minus-box').val()==0){
			alert('상품 개수를 입력해 주세요.');
			$('.cart-plus-minus-box').focus();
			return false;
		} else {
			console.log('pbNum 타입은 : ' +  parseInt(pbNum));
			console.log('id 타입은 : ' +  id);
			console.log('deliver 타입은 : ' +  parseInt($('.delivery').text()));
			console.log('bookDate 타입은 : ' +  bookDate.replace(/-/gi,''));
			console.log('cnt 타입은 : ' +  parseInt(cakeCnt));
			console.log('total 타입은 : ' +  parseInt($('.totalPrice').text().replace('원', '')));
			console.log('addText' +  addText);
			
	/*		post_to_url("productAddCart.ca", {
				'pbNum' : parseInt(pbNum),
				'id' : id,
				'bizDelivery' : parseInt($('.delivery').text().replace('원', '')),
				'poBookDate' :  bookDate.replace(/-/gi,''),
				'poCnt' : parseInt(cakeCnt),
				'poPrice' : parseInt($('.totalPrice').text().replace('원', '')),
				'poText' : addText
			});*/
			
			
			$.ajax({
				url : "productAddCart.ca",
				type : "post",
				data : {
						'pbNum' : parseInt(pbNum),
						'id' : id,
						'bizDelivery' : parseInt($('.delivery').text().replace('원', '')),
						'poBookDate' :  bookDate.replace(/-/gi,''),
						'poCnt' : parseInt(cakeCnt),
						'poPrice' : parseInt($('.totalPrice').text().replace('원', '')),
						'poText' : addText
				},
				success : function(result){
					if(result=="ok"){
						if(btnStatus==="addCart"){
							if(confirm('장바구니 담기에 성공했습니다. 장바구니로 이동하시겠습니까?')){
								location.href="cartList.ca";
							} else {
								location.reload();
							}
						} else {
								location.href="directCheckoutList.ca";
						}
						
					} else {
						alert('장바구니 담기 실패');
					}
					
				},
				error : function(request,status,error) {
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
	}
	
	
// 좋아요 추가 제거 start ------------------
	$('.heart').click(function(){
		var currentPage = $('.currentPage').val();
		if(currentPage.match(/home.jsp/)){
			var pbNum = $(this).parent().parent().parent().children('#pbNum').val();
			console.log("게시글 번호는 " + pbNum);
		} else if(currentPage.match(/detailView.jsp/)){
			var pbNum = $('#pbNum').val();
			console.log("게시글 번호는 " + pbNum);
		}
		//id = 'user1';
		
		/* 로그인 상태가 아닐 경우 */
		if(!id){
			alert('로그인이 필요한 서비스입니다.');
		/* 로그인 상태일 경우 - 빈하트   일시 하트 채우고 인서트, 업데이트 +1
				      	    꽉찬하트 일시 하트 비우고 딜리트, 업데이트-1  */
		}else{
			/* 빈하트일 경우  */
			if($(this).attr('class')=='heart fa fa-heart-o'){
				/* 좋아요 성공했을 경우 하트 채우기 */
	    		$.ajax({
	    			url : "addHeart.ca",
	        		type : "post",
	        		dataType : "json",
	        		data : {
	        			'pbNum' : pbNum,
	        			'id'	: id
	        		},
	        		success : function(result){
	        			console.log('좋아요 누른 값 보내기 성공');
	        			
	        			var jsonStr = JSON.stringify(result);
	        			var json = JSON.parse(jsonStr);
	        			
	        			if(json.result=="success"){
	        				console.log('좋아요 인서트 성공');
	        				$('input[value*='+json.pbNum+']').parent().find('.heart').attr('class', 'heart fa fa-heart');
	        			}
	        		},
	        		error : function(request,status,error) {
	        			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        		}
	    			
	    		});
				
				/* 꽉찬 하트일 경우 */
			} else {
				/* MEMBER_LIKE 삭제하고 PRODUCT_BOARD P_B_LIKE UPDATE 하기 */
				$.ajax({
	    			url : "subtractHeart.ca",
	        		type : "post",
	        		dataType : "json",
	        		data : {
	        			'pbNum' : pbNum,
	        			'id'	: id
	        		},
	        		success : function(result){
	        			console.log('좋아요 취소 누른 값 보내기 성공');
	        			
	        			var jsonStr = JSON.stringify(result);
	        			var json = JSON.parse(jsonStr);
	        			
	        			if(json.result=="success"){
	        				console.log('좋아요 취소 성공');
	        				$('input[value*='+json.pbNum+']').parent().find('.heart').attr('class', 'heart fa fa-heart-o');
	        			}
	        		},
	        		error : function(request,status,error) {
	        			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        		}
	    			
	    		});
			}
		}
	});
// 좋아요 추가 제거 end ------------------
	
});
    	