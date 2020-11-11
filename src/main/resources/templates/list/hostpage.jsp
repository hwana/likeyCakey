<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="vendorcakeCount" value="${requestScope.vendorcakeCount}"/>
<c:set var="vendorreviewCount" value="${requestScope.vendorreviewCount }"/>
<c:set var="pagecake_current" value="${requestScope.pagecake_current}"/>
<c:set var="pagereview_current" value="${requestScope.pagereview_current}"/>
<c:set var="startpagecake" value="${requestScope.startpagecake}"/>
<c:set var="startpagereview" value="${requestScope.startpagereview}"/>
<c:set var="endpagecake" value="${requestScope.endpagecake}"/>
<c:set var="endpagereview" value="${requestScope.endpagereview}"/>
<c:set var="maxpagecake" value="${requestScope.maxpagecake}"/>
<c:set var="maxpagereview" value="${requestScope.maxpagereview}"/>
<c:set var="vendorcakelist" value="${requestScope.vendorcakelist}"/>
<c:set var="vendorreviewlist" value="${requestScope.vendorreviewlist }"/>
<c:set var="vendorlocationlist" value="${requestScope.vendorlocationlist}"/>
<c:set var="reviewimglist" value="${requestScope.reviewimglist }"/>
<c:set var="reviewcakelist" value="${requestScope.reviewcakelist }"/>
<c:set var="input_vendor" value="${requestScope.input_vendor}"/>
<c:set var="member" value="${sessionScope.member}"/>
<c:set var="vendorimg" value="${requestScope.vendorimg }"/>

<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Shop List</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="/resources/img/apple-touch-icon.png">
		<link rel="shortcut icon" type="image/x-icon" href="/resources/img/icon/favicon.ico">
        <!-- Place favicon.ico in the root directory -->
		
		
		<!-- all css here -->
        <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="/resources/css/elegant-font.css">
        <link rel="stylesheet" href="/resources/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="/resources/css/meanmenu.min.css">
		<link rel="stylesheet" href="/resources/css/magnific-popup.css">
        <link rel="stylesheet" href="/resources/css/animate.css">
        <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
		<link rel="stylesheet" href="/resources/css/animate-heading.css">
        <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="/resources/css/jquery-ui.css">
        <link rel="stylesheet" href="/resources/css/shortcode/shortcodes.css">
        <link rel="stylesheet" href="/resources/css/style.css">
        <link rel="stylesheet" href="/resources/css/responsive.css">
        <link rel="stylesheet" href="/resources/css/young.css">	
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body class="other-page">
		<!-- Header Area Start -->
		<%@ include file="../default/header.jsp"%>
        <!-- Header Area End -->
        <!-- Page Content Wraper Area Start -->
		<section class="young-page-content-wrapper">
			<div class="container">
				<div class="row">
					<div class="content-full pt-50 pb-55 fix">
						<!-- Left Side Start -->
						<div class="col-md-4">
							<div class="right-area pt-35">
								<div class="young-host-profile-box" style="transition: transform 0.5s cubic-bezier(0.39, 0.575, 0.565, 1) 0s; transform: translateY(0px);">
									<span><img src="/resources/img/member/${vendorimg }" alt="" /></span>
                				    <div>BAKERY</div>
                        			<p class="young-host-profile-box-name">${input_vendor }</p>
                        			<p class="young-host-profile-box-exp">안녕하세요~ ${input_vendor }입니다.</p>
                    	        </div>
							</div>
						</div>
						<!-- Left Side End -->
						<!-- Right Side Start -->
						<div class="col-md-8">
							<div class="tab-content">
								<div class="text_box first">
                    				<h4 class="h_intro">
                       					<em>${input_vendor }</em>의 케이크 <strong class="txt_primary"><em id="_spaceCount">${vendorcakeCount }개</em></strong>
                    				</h4>
                				</div>
								<div id="list" class="shop-right pt-35 tab-pane fade in active">
									<div class="row">
										<c:set var="list" value="${vendorlocationlist}" />
										<c:forEach var="cake" items="${vendorcakelist}" varStatus="loop">	
										<!-- Single Product Start -->
										<div class="col-md-6 col-sm-6">
											<div class="single-product style-two mb-50">
												<div class="young-single-img">
													<a href="#"><img src="/resources/img/product/${cake.pImg}.jpg" alt="" /></a>
													<span class="pro-level">당일</span>
													<div class="hover-content text-center">
														<ul>
<!-- 															<li><a href="#" class="icon_refresh"></a></li>
 -->															<li><a href="#" class="icon_cart_alt "></a></li>
															<li><a href="#" class="icon_heart_alt"></a></li>
															<!-- <li>
																<a title="Quick View" href="#" data-toggle="modal" data-target="#productModal" class="icon_search"></a>
															</li> -->
														</ul>
													</div>
												</div>
												<div class="young-product-details mt-20">
													<h4><a href="single-product.html">${cake.pName }</a></h4>
													<div class="young-product-details-tag">
														<i class="fa fa-map-marker"></i>
														<span class="young-product-details-tag-place"><c:out value="${list[loop.index]}"/></span>
														<i class="fa fa-tag"></i>
														<span class="young-product-details-tag-place-detail">${cake.pbTag }</span>
														</div>
													<div class="young-product-details-price">
														<span>${cake.pPrice }</span>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</div>
												</div>
											</div>
										</div>
										<!-- Single Product End -->
										</c:forEach>
										<!-- Page Pagination Start -->
										<div class="col-md-12">
											<div class="page-pagination text-center">
												<c:if test="${pagecake_current <= 1}">
													<span class="icon-right" data-icon="&#x23;" style="text-decoration:none;"></span>
												</c:if>
												<c:if test="${pagecake_current > 1}">
													<c:url var="blistST" value="hostinfo.ca">
														<c:param name="page_cake" value="${pagecake_current-1}"/>
														<c:param name="page_review" value="${pagereview_current}"/>
														<c:param name="input_vendor_id" value="${input_vendor}"/>
													</c:url>
													<a href="${blistST}" style="text-decoration:none;"><span class="icon-right" data-icon="&#x23;" style="text-decoration:none;"></span></a>
												</c:if>
												<c:forEach var="p" begin="${startpagecake}" end="${endpagecake}">
													<c:if test="${p eq pagecake_current}">
														<font color="#9ababc"><b>${p}</b></font>
													</c:if>
													<c:if test="${p ne pagecake_current}">
														<c:url var="blistchk" value="hostinfo.ca">
															<c:param name="page_cake" value="${p}"/>
															<c:param name="page_review" value="${pagereview_current}"/>
															<c:param name="input_vendor_id" value="${input_vendor}"/>
														</c:url>
														<a href="${blistchk}" style="text-decoration:none">${p}</a>
													</c:if>
												</c:forEach>
												<c:if test="${pagecake_current >= maxpagecake}">
													<span class="icon-left" data-icon="&#x24;" style="text-decoration:none"></span>
												</c:if><c:if test="${pagecake_current < maxpagecake}">
												<c:url var="blistEND" value="hostinfo.ca">
													<c:param name="page_cake" value="${pagecake_current+1}"/>
													<c:param name="page_review" value="${pagereview_current}"/>
													<c:param name="input_vendor_id" value="${input_vendor}"/>
												</c:url>
													<a href="${blistEND}" style="text-decoration:none"><span class="icon-left" data-icon="&#x24;" style="text-decoration:none"></span></a>
												</c:if>
											</div>
										</div>
										<!-- Page Pagination End -->
									</div>
								</div>
								<div class = "young_blank">
								</div>
								<div class="text_box first">
                    				<h4 class="h_intro">
                       					이용 후기 <em>${vendorreviewCount }개</em> 평균 평점 <strong class="txt_primary"><em id="_spaceCount">4.4</em></strong>
                    				</h4>
                				</div>
								<div id="list" class="shop-right pt-35 tab-pane fade in active young-lesspadding">
									<div class="row">
										<!-- Review List Start -->
										<div class="col-md-12">
											<div class="page-pagination text-center pt-50 young-getridofpaddingtop">
												<div class="young-review-wrap">
													<ul class="young-review-list">
														<c:set var="reviewcakelist" value="${reviewcakelist}" />
														<c:set var="reviewimglist" value="${reviewimglist}" />
														<c:forEach var="review" items="${vendorreviewlist}" varStatus="loop">	
														<li class="young-rlist">
															<span class="young-pfimage">
																	<img src="/resources/img/young/${reviewimglist[loop.index]}.JPG" alt="" />
															</span>
															<div class="young-review-mine">
																<strong class="young-guestname">
																	${review.id }
																</strong>
																<p class="young-preview">
																	${review.prContent }
																</p>
																<div class="young-extraimg">
																</div>
																<div class="young-infobase">
																	<a class="young-infobase-cake"><c:out value="${reviewcakelist[loop.index]}"/></a>
																	<span class="young-infobase-time">${review.prDate }</span>
																</div>
																<span class="young-ratearea">
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																</span>
															</div>
														</li>
														</c:forEach>											
													</ul>
												</div>
											</div>
										</div>
										<!-- Review List End -->
										<div class = "young_blank">
										</div>
										<!-- Review Pagination Start -->
										<div class="col-md-12">
											<div class="page-pagination text-center">
												<c:if test="${pagereview_current <= 1}">
													<span class="icon-right" data-icon="&#x23;" style="text-decoration:none;"></span>
												</c:if>
												<c:if test="${pagereview_current > 1}">
													<c:url var="blistST2" value="hostinfo.ca">
														<c:param name="page_review" value="${pagereview_current-1}"/>
														<c:param name="page_cake" value="${pagecake_current}"/>
														<c:param name="input_vendor_id" value="${input_vendor}"/>
													</c:url>
													<a href="${blistST2}" style="text-decoration:none;"><span class="icon-right" data-icon="&#x23;" style="text-decoration:none;"></span></a>
												</c:if>
												<c:forEach var="p" begin="${startpagereview}" end="${endpagereview}">
													<c:if test="${p eq pagereview_current}">
														<font color="#9ababc"><b>${p}</b></font>
													</c:if>
													<c:if test="${p ne pagereview_current}">
														<c:url var="blistchk2" value="hostinfo.ca">
															<c:param name="page_review" value="${p}"/>
															<c:param name="page_cake" value="${pagecake_current}"/>
															<c:param name="input_vendor_id" value="${input_vendor}"/>
														</c:url>
														<a href="${blistchk2}" style="text-decoration:none">${p}</a>
													</c:if>
												</c:forEach>
												<c:if test="${pagereview_current >= maxpagereview}">
													<span class="icon-left" data-icon="&#x24;" style="text-decoration:none"></span>
												</c:if><c:if test="${pagereview_current < maxpagereview}">
												<c:url var="blistEND2" value="hostinfo.ca">
													<c:param name="page_review" value="${pagereview_current+1}"/>
													<c:param name="page_cake" value="${pagecake_current}"/>
													<c:param name="input_vendor_id" value="${input_vendor}"/>
												</c:url>
													<a href="${blistEND2}" style="text-decoration:none"><span class="icon-left" data-icon="&#x24;" style="text-decoration:none"></span></a>
												</c:if>
											</div>
										</div>
										<!-- Review Pagination End -->
									</div>
								</div>
							</div>	
						</div>
						<!-- Right Side End -->
					</div>
				</div>
			</div>
		</section>
        <!-- Page Content Wraper Area End -->
        <!-- Fotter Area Start -->
		<%@ include file="../default/footer.jsp"%>
        <!-- Fotter Area End -->
	   
	   <!--Quickview Product Start -->
        <div id="quickview-wrapper">
            <!-- Modal -->
            <div class="modal fade" id="productModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-product">
                                <div class="product-images">
                                    <div class="main-image images">
                                        <img alt="" src="img/other/quickview.jpg">
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h1>Beauty Products</h1>
                                    <div class="price-box">
                                        <p class="price"><span class="special-price"><span class="amount">$132.00</span></span></p>
                                    </div>
                                    <a href="product-details.html" class="see-all">See all features</a>
                                    <div class="quick-add-to-cart">
                                        <form method="post" class="cart">
                                            <div class="numbers-row">
                                                <input type="number" id="french-hens" value="3">
                                            </div>
                                            <button class="single_add_to_cart_button" type="submit">Add to cart</button>
                                        </form>
                                    </div>
                                    <div class="quick-desc">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla.
                                    </div>
                                    <div class="social-sharing">
                                        <div class="widget widget_socialsharing_widget">
                                            <h3 class="widget-title-modal">Share this product</h3>
                                            <ul class="social-icons">
                                                <li>
													<a target="_blank" title="Facebook" href="#" class="facebook social-icon"><i class="fa fa-facebook"></i></a>
												</li>
                                                <li>
													<a target="_blank" title="Twitter" href="#" class="twitter social-icon"><i class="fa fa-twitter"></i></a>
												</li>
                                                <li>
													<a target="_blank" title="Pinterest" href="#" class="pinterest social-icon"><i class="fa fa-pinterest"></i></a>
												</li>
                                                <li>
													<a target="_blank" title="Google +" href="#" class="gplus social-icon"><i class="fa fa-google-plus"></i></a>
												</li>
                                                <li>
													<a target="_blank" title="LinkedIn" href="#" class="linkedin social-icon"><i class="fa fa-linkedin"></i></a>
												</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div><!-- .product-info -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End of Quickview Product-->
	   
		<!-- all js here -->
        <!-- <script src="/resources/js/vendor/jquery-1.12.4.min.js"></script> -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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
        <script src="/resources/js/young.js"></script>
    </body>
</html>

