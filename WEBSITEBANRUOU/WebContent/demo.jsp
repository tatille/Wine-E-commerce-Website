
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/view/client/assets" var="url" />
<!-- Start header section -->

<!-- / header section -->
<!-- Start slider -->

<!-- / slider -->
<br>
<br>
<%-- <!-- Start Promo section -->
  <section id="aa-promo">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-promo-area">
            <div class="row">
              <!-- promo left -->
              <div class="col-md-5 no-padding">                
                <div class="aa-promo-left">
                  <div class="aa-promo-banner">                    
                    <img src="${url}/images/section-1.jpg" alt="dâu tây Đà Lạt">                    
                    <div class="aa-prom-content">
                      <span>Sale up to 10%</span>
                                  
                    </div>
                  </div>
                </div>
              </div>
              <!-- promo right -->
              <div class="col-md-7 no-padding">
                <div class="aa-promo-right">
                  <div class="aa-single-promo-right">
                    <div class="aa-promo-banner">                      
                      <img src="${url}/images/ielts_practice.jpg" alt="hạt tiêu daklak">                      
                      <div class="aa-prom-content">
                        <span>Sale up to 20%</span>
                                           
                      </div>
                    </div>
                  </div>
                  <div class="aa-single-promo-right">
                    <div class="aa-promo-banner">                      
                      <img src="${url}/images/it1.jpg" alt="img">                      
                      <div class="aa-prom-content">
                        <span>Sale up to 35%</span>
                                           
                      </div>
                    </div>
                  </div>
                  <div class="aa-single-promo-right">
                    <div class="aa-promo-banner">                      
                      <img src="${url}/images/psy1.jpg" alt="img">                      
                      <div class="aa-prom-content">
                        <span>Sale up to 25%</span>
                                          
                      </div>
                    </div>
                  </div>
                  <div class="aa-single-promo-right">
                    <div class="aa-promo-banner">                      
                      <img src="${url}/images/psy4.jpg" alt="img">                      
                      <div class="aa-prom-content">
                        <span>Sale up to 10%</span>
                                      
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Promo section --> --%>
<!-- Support section -->
<section id="aa-support">
	<div class="container">
		<br> <br>
		<div class="row">
			<div class="col-md-12">
				<div class="aa-support-area">
					<!-- single support -->
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="aa-support-single">
							<span class="fa fa-truck"></span>
							<h4>Free ship</h4>
							<P>Miễn phí giao hàng với đơn từ 300.000VND.</P>
						</div>
					</div>
					<!-- single support -->
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="aa-support-single">
							<span class="fa fa-clock-o"></span>
							<h4>Fast delivery</h4>
							<P>Nhanh chóng và an toàn</P>
						</div>
					</div>
					<!-- single support -->
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="aa-support-single">
							<span class="fa fa-phone"></span>
							<h4>Support 24/7</h4>
							<P>Hỗ trợ khách hàng 24/7</P>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- / Support section -->
<!-- Products section -->
<section id="aa-product">
	<div class="container">
		<br> <br>
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="aa-product-area">
						<div class="aa-product-inner">
							<!-- start prduct navigation -->
							<ul class="nav nav-tabs aa-products-tab">
								<li class="active"><a href="#cate1" data-toggle="tab">Chăm
										sóc da mặt</a></li>
								<li><a href="#cate2" data-toggle="tab">Trang điểm</a></li>
								<li><a href="#cate3" data-toggle="tab">Nước hoa </a></li>
								<li><a href="#cate4" data-toggle="tab">Chăm sóc cơ thể</a></li>
								<li><a href="#cate5" data-toggle="tab">Dụng cụ làm đẹp</a></li>
								<li><a href="#cate6" data-toggle="tab">Sản phẩm cho nam</a></li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content">
								<!-- Start men product category -->
								<div class="tab-pane fade in active" id="cate1">
									<ul class="aa-product-catg">
										<!-- start single product item -->
										<c:forEach items="${chamsocdamat}" var="product" end="3">
											<li>
												<figure>
													<a class="aa-product-img" href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}"><img
														src="${product.image_link}" alt="polo shirt img"></a>
													<a class="aa-add-card-btn"
														href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}"><span
														class="fa fa-shopping-cart"></span>Add to cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">${product.name }</a>
														</h4>

														<c:choose>
															<c:when test="${product.discount == 0}">
																<span class="aa-product-price">${product.price} VNĐ</span>
																<span class="aa-product-price"></span>
															</c:when>
															<c:otherwise>
																<c:forEach items="${productlist1}" var="product1">
																	<c:if test="${product1.id == product.id}">
																		<span class="aa-product-price">${product1.price}	VNĐ</span>
																		<span class="aa-product-price">
																		<del>${product.price} VNĐ</del></span>
																	</c:if>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</figcaption>
												</figure> <c:if test="${product.discount != 0}">
													<!-- product badge -->
													<span class="aa-badge aa-sale">-
														${product.discount}%</span>
												</c:if>
											</li>
										</c:forEach>
										<!-- start single product item -->

									</ul>

								</div>
								<!-- / men product category -->
								<!-- start women product category -->
								<div class="tab-pane fade" id="cate2">
									<ul class="aa-product-catg">
										<!-- start single product item -->
										<c:forEach items="${trangdiem}" var="product" end="3">
											<li>
												<figure>
													<a class="aa-product-img"
														href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}"><img
														src="${product.image_link}" alt="polo shirt img"></a>
													<a class="aa-add-card-btn"
														href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}"><span
														class="fa fa-shopping-cart"></span>Add to cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a
																href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">${product.name }</a>
														</h4>
														<c:choose>
															<c:when test="${product.discount == 0}">
																<span class="aa-product-price">${product.price}
																	VNĐ</span>
																<span class="aa-product-price"></span>
															</c:when>
															<c:otherwise>
																<c:forEach items="${productlist1}" var="product1">
																	<c:if test="${product1.id == product.id}">
																		<span class="aa-product-price">${product1.price}
																			VNĐ</span>
																		<span class="aa-product-price"><del>${product.price}
																				VNĐ</del></span>
																	</c:if>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</figcaption>
												</figure> <c:if test="${product.discount != 0}">
													<!-- product badge -->
													<span class="aa-badge aa-sale">-
														${product.discount}%</span>
												</c:if>
											</li>
										</c:forEach>
										<!-- start single product item -->

									</ul>

								</div>
								<!-- / women product category -->
								<!-- start sports product category -->
								<div class="tab-pane fade" id="cate3">
									<ul class="aa-product-catg">
										<!-- start single product item -->
										<c:forEach items="${nuochoa}" var="product" end="3">
											<li>
												<figure>
													<a class="aa-product-img"
														href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}"><img
														src="${product.image_link}" alt="polo shirt img"></a>
													<a class="aa-add-card-btn"
														href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}"><span
														class="fa fa-shopping-cart"></span>Add to cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a
																href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">${product.name }</a>
														</h4>
														<c:choose>
															<c:when test="${product.discount == 0}">
																<span class="aa-product-price">${product.price}
																	VNĐ</span>
																<span class="aa-product-price"></span>
															</c:when>
															<c:otherwise>
																<c:forEach items="${productlist1}" var="product1">
																	<c:if test="${product1.id == product.id}">
																		<span class="aa-product-price">${product1.price}
																			VNĐ</span>
																		<span class="aa-product-price"><del>${product.price}
																				VNĐ</del></span>
																	</c:if>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</figcaption>
												</figure> <c:if test="${product.discount != 0}">
													<!-- product badge -->
													<span class="aa-badge aa-sale">-
														${product.discount}%</span>
												</c:if>
											</li>
										</c:forEach>
										<!-- start single product item -->

									</ul>

								</div>
								<!-- / sports product category -->
								<!-- start electronic product category -->
								<div class="tab-pane fade" id="cate4">
									<ul class="aa-product-catg">
										<!-- start single product item -->
										<c:forEach items="${chamsoccothe}" var="product" end="3">
											<li>
												<figure>
													<a class="aa-product-img"
														href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}"><img
														src="${product.image_link}" alt="polo shirt img"></a>
													<a class="aa-add-card-btn"
														href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}"><span
														class="fa fa-shopping-cart"></span>Add to cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a
																href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">${product.name }</a>
														</h4>
														<c:choose>
															<c:when test="${product.discount == 0}">
																<span class="aa-product-price">${product.price}
																	VNĐ</span>
																<span class="aa-product-price"></span>
															</c:when>
															<c:otherwise>
																<c:forEach items="${productlist1}" var="product1">
																	<c:if test="${product1.id == product.id}">
																		<span class="aa-product-price">${product1.price}
																			VNĐ</span>
																		<span class="aa-product-price"><del>${product.price}
																				VNĐ</del></span>
																	</c:if>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</figcaption>
												</figure> <c:if test="${product.discount != 0}">
													<!-- product badge -->
													<span class="aa-badge aa-sale">-
														${product.discount}%</span>
												</c:if>
											</li>
										</c:forEach>
										<!-- start single product item -->

									</ul>

								</div>
								<div class="tab-pane fade" id="cate5">
									<ul class="aa-product-catg">
										<!-- start single product item -->
										<c:forEach items="${dungculamdep}" var="product" end="3">
											<li>
												<figure>
													<a class="aa-product-img"
														href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}"><img
														src="${product.image_link}" alt="polo shirt img"></a>
													<a class="aa-add-card-btn"
														href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}"><span
														class="fa fa-shopping-cart"></span>Add to cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a
																href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">${product.name }</a>
														</h4>
														<c:choose>
															<c:when test="${product.discount == 0}">
																<span class="aa-product-price">${product.price}
																	VNĐ</span>
																<span class="aa-product-price"></span>
															</c:when>
															<c:otherwise>
																<c:forEach items="${productlist1}" var="product1">
																	<c:if test="${product1.id == product.id}">
																		<span class="aa-product-price">${product1.price}
																			VNĐ</span>
																		<span class="aa-product-price"><del>${product.price}
																				VNĐ</del></span>
																	</c:if>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</figcaption>
												</figure> <c:if test="${product.discount != 0}">
													<!-- product badge -->
													<span class="aa-badge aa-sale">-
														${product.discount}%</span>
												</c:if>
											</li>
										</c:forEach>
										<!-- / electronic product category -->
								</div>
								<div class="tab-pane fade" id="cate6">
									<ul class="aa-product-catg">
										<!-- start single product item -->
										<c:forEach items="${sanphamchonam}" var="product" end="3">
											<li>
												<figure>
													<a class="aa-product-img"
														href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}"><img
														src="${product.image_link}" alt="polo shirt img"></a>
													<a class="aa-add-card-btn"
														href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}"><span
														class="fa fa-shopping-cart"></span>Add to cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a
																href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">${product.name }</a>
														</h4>
														<c:choose>
															<c:when test="${product.discount == 0}">
																<span class="aa-product-price">${product.price}
																	VNĐ</span>
																<span class="aa-product-price"></span>
															</c:when>
															<c:otherwise>
																<c:forEach items="${productlist1}" var="product1">
																	<c:if test="${product1.id == product.id}">
																		<span class="aa-product-price">${product1.price}
																			VNĐ</span>
																		<span class="aa-product-price"><del>${product.price}
																				VNĐ</del></span>
																	</c:if>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</figcaption>
												</figure> <c:if test="${product.discount != 0}">
													<!-- product badge -->
													<span class="aa-badge aa-sale">-
														${product.discount}%</span>
												</c:if>
											</li>
										</c:forEach>
										<div class="more-product">
											<a class="aa-browse-btn"
												href="${pageContext.request.contextPath}/view/client/product">Xem
												thêm <span class="fa fa-long-arrow-right"></span>
											</a>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</section>

<!-- / Products section -->
<!-- banner section -->
<section id="aa-banner">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="aa-banner-area">
						<a href="#"><img src="${url}/images/banner-makeup.jpg"
							alt="banner trang chủ"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- popular section -->
<section id="aa-popular-category">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="aa-popular-category-area">
						<!-- start prduct navigation -->
						<ul class="nav nav-tabs aa-products-tab">
							<li class="active"><a href="#sanphammoi" data-toggle="tab">Sản
									phẩm mới</a></li>
							<li><a href="#sanphambanchay" data-toggle="tab">Sản phẩm
									bán chạy</a></li>
							<li><a href="#sanphamgiamgia" data-toggle="tab">Sản phẩm
									giảm giá</a></li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
							<!-- Start men popular category -->
							<div class="tab-pane fade in active" id="sanphammoi">
								<ul class="aa-product-catg aa-popular-slider">
									<!-- start single product item -->
									<c:forEach items="${sanphammoi}" var="product" end="3">
										<li>
											<figure>
												<a class="aa-product-img"
													href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}"><img
													src="${product.image_link}" alt="polo shirt img"></a>
												<a class="aa-add-card-btn"
													href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}"><span
													class="fa fa-shopping-cart"></span>Thêm vào giỏ hàng</a>
												<figcaption>
													<h4 class="aa-product-title">
														<a
															href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">${product.name }</a>
													</h4>
													<c:choose>
														<c:when test="${product.discount == 0}">
															<span class="aa-product-price">${product.price}
																VNĐ</span>
															<span class="aa-product-price"></span>
														</c:when>
														<c:otherwise>
															<c:forEach items="${productlist1}" var="product1">
																<c:if test="${product1.id == product.id}">
																	<span class="aa-product-price">${product1.price}
																		VNĐ</span>
																	<span class="aa-product-price"><del>${product.price}
																			VNĐ</del></span>
																</c:if>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</figcaption>
											</figure> <c:if test="${product.discount != 0}">
												<!-- product badge -->
												<span class="aa-badge aa-sale">- ${product.discount}%</span>
											</c:if>
										</li>
									</c:forEach>
									<!-- start single product item -->
									<!-- start single product item -->

								</ul>

							</div>
							<!-- / popular product category -->

							<!-- start featured product category -->
							<div class="tab-pane fade" id="sanphambanchay">
								<ul class="aa-product-catg aa-popular-slider">
									<!-- start single product item -->
									<c:forEach items="${sanphambanchay}" var="product" end="3">
										<li>
											<figure>
												<a class="aa-product-img"
													href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}"><img
													src="${product.image_link}" alt="polo shirt img"></a>
												<a class="aa-add-card-btn"
													href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}"><span
													class="fa fa-shopping-cart"></span>Thêm vào giỏ hàng</a>
												<figcaption>
													<h4 class="aa-product-title">
														<a
															href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">${product.name }</a>
													</h4>
													<c:choose>
														<c:when test="${product.discount == 0}">
															<span class="aa-product-price">${product.price}
																VNĐ</span>
															<span class="aa-product-price"></span>
														</c:when>
														<c:otherwise>
															<c:forEach items="${productlist1}" var="product1">
																<c:if test="${product1.id == product.id}">
																	<span class="aa-product-price">${product1.price}
																		VNĐ</span>
																	<span class="aa-product-price"><del>${product.price}
																			VNĐ</del></span>
																</c:if>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</figcaption>
											</figure> <c:if test="${product.discount != 0}">
												<!-- product badge -->
												<span class="aa-badge aa-sale">- ${product.discount}%</span>
											</c:if>
										</li>
									</c:forEach>
									<!-- start single product item -->
									<!-- start single product item -->

								</ul>

							</div>
							<!-- / featured product category -->

							<!-- start latest product category -->
							<div class="tab-pane fade" id="sanphamgiamgia">

								<ul class="aa-product-catg aa-popular-slider">
									<!-- start single product item -->
									<c:forEach items="${sanphamgiamgia}" var="product" end="3">
										<li>
											<figure>
												<a class="aa-product-img"
													href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}"><img
													src="${product.image_link}" alt="polo shirt img"></a>
												<a class="aa-add-card-btn"
													href="${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}"><span
													class="fa fa-shopping-cart"></span>Thêm vào giỏ hàng</a>
												<figcaption>
													<h4 class="aa-product-title">
														<a
															href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}">${product.name }</a>
													</h4>
													<c:choose>
														<c:when test="${product.discount == 0}">
															<span class="aa-product-price">${product.price}
																VNĐ</span>
															<span class="aa-product-price"></span>
														</c:when>
														<c:otherwise>
															<c:forEach items="${productlist1}" var="product1">
																<c:if test="${product1.id == product.id}">
																	<span class="aa-product-price">${product1.price}
																		VNĐ</span>
																	<span class="aa-product-price"><del>${product.price}
																			VNĐ</del></span>
																</c:if>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</figcaption>
											</figure> <c:if test="${product.discount != 0}">
												<!-- product badge -->
												<span class="aa-badge aa-sale">- ${product.discount}%</span>
											</c:if>
										</li>
									</c:forEach>
									<!-- start single product item -->
									<!-- start single product item -->

								</ul>
							</div>
							<!-- / latest product category -->
						</div>
						<div class="more-product">
							<a class="aa-browse-btn"
								href="${pageContext.request.contextPath}/view/client/product">Xem
								thêm <span class="fa fa-long-arrow-right"></span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- / popular section -->

<!-- Testimonial -->
<section id="aa-testimonial">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="aa-testimonial-area">
					<ul class="aa-testimonial-slider">
						<!-- single slide -->
						<li>
							<div class="aa-testimonial-single">
								<img class="aa-testimonial-img"
									src="https://www.rollingstone.com/wp-content/uploads/2022/03/Kelsea-Ballerini-0321-full.jpg?resize=1800,1200&w=1800"
									alt="avatar 1"> <span
									class="fa fa-quote-left aa-testimonial-quote"></span>
								<p>Luôn rửa mặt trước khi đi ngủ - chăm sóc da là chìa khóa
									quan trọng.</p>
								<div class="aa-testimonial-info">
									<p>Kelsea Ballerini</p>

								</div>
							</div>
						</li>
						<!-- single slide -->
						<li>
							<div class="aa-testimonial-single">
								<img class="aa-testimonial-img"
									src="https://i.pinimg.com/originals/f5/81/b5/f581b5dcbd0a8f52f64f7e8e99185876.jpg"
									alt="avatar 2"> <span
									class="fa fa-quote-left aa-testimonial-quote"></span>
								<p>Tôi rất tin tưởng rằng nếu bạn tập trung vào việc chăm
									sóc da tốt, bạn thực sự sẽ không cần trang điểm nhiều.</p>
								<div class="aa-testimonial-info">
									<p>Demi Moore</p>

								</div>
							</div>
						</li>
						<!-- single slide -->
						<li>
							<div class="aa-testimonial-single">
								<img class="aa-testimonial-img"
									src="https://www.reinarnhem.nl/wp-content/uploads/2019/11/DrMurad-image.png"
									alt="avatar 3"> <span
									class="fa fa-quote-left aa-testimonial-quote"></span>
								<p>Làn da khỏe mạnh là sự phản ánh của sức khỏe tổng thể.</p>
								<div class="aa-testimonial-info">
									<p>Dr. Murad</p>

								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- / Testimonial -->

<!-- Latest Blog -->
<section id="aa-latest-blog">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="aa-latest-blog-area">
					<h2>Blog</h2>
					<div class="row">
						<!-- single latest blog -->
						<c:forEach items="${boardnewlist}" var="boardnew" end="2">
							<div class="col-md-4 col-sm-4">
								<div class="aa-latest-blog-single">
									<figure class="aa-blog-img">
										<a
											href="${pageContext.request.contextPath}/view/client/news-list-detail?id=${boardnew.id}"><img
											src="${boardnew.image_link}" alt="Tin tức ${boardnew.title}"></a>
										<figcaption class="aa-blog-img-caption">
											<span href="#"><i class="fa fa-clock-o"></i>${boardnew.created}</span>
										</figcaption>
									</figure>
									<div class="aa-blog-info">
										<h3 class="aa-blog-title">
											<a
												href="${pageContext.request.contextPath}/view/client/news-list-detail?id=${boardnew.id}">${boardnew.title}</a>
										</h3>
										<p class="desc-boardnews">${boardnew.content}</p>
										<a
											href="${pageContext.request.contextPath}/view/client/news-list-detail?id=${boardnew.id}"
											class="aa-read-mor-btn">Xem thêm<span
											class="fa fa-long-arrow-right"></span></a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- / Latest Blog -->

<!-- Client Brand -->

<!-- / Client Brand -->
<!--  footer-->

<!-- end footer-->