<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<!-- JqueryUI -->
<link rel="stylesheet" type="text/css" href="../css/jquery-ui.css">
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<!-- Awesome font icons -->
<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css" media="screen">
<!-- Owlcoursel -->
<link rel="stylesheet" type="text/css" href="../css/owl-coursel/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="../css/owl-coursel/owl.transitions.css">
<!-- Magnific-popup -->
<link rel="stylesheet" type="text/css" href="../css/magnific-popup/magnific-popup.css">
<!-- Style -->
<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen">
<!-- Fw -->
<link rel="stylesheet" type="text/css" href="../css/fw.css" media="screen">
</head>
<body class="bg-m">
	<div class="preloader">
		<i class="fa fa-spinner"></i>
	</div>
	<header>
		<div class="container">
			<div class="row top-header">
				<div class="col-sm-3 text-left">
					<a href="#" class="logo">
						<img src="../images/logo.png" alt="logo">
					</a>
				</div>				
				<div class="col-sm-9">
					<ul class="top-link pull-right">
						<li class="hidden-xs"><a href="/shoppe/collect/collectShow?uid=${user.uid }">收藏</a></li>
						<li class="hidden-xs"><a href="/shoppe/order/newOrder">结算</a></li>
						<li class="dropdown hidden-xs">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" id="dropdownMenu1" aria-haspopup="true" aria-expanded="false">我的账户<span class="caret"></span></a>
							<c:if test="${empty user.uname }">
								<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
									<li><a href="/shoppe/user/login">登录</a></li>
									<li><a href="/shoppe/user/register">注册</a></li>
								</ul>
							</c:if>
							<c:if test="${not empty user.uname }">
								<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
									<li><a href="#">${user.uname }</a></li>
									<li><a href="/shoppe/user/infoCenter?uid=${user.uid }">个人信息</a></li>
									<li><a href="/shoppe/order/orderCenter?uid=${user.uid }">订单信息</a></li>
									<li><a href="/shoppe/user/outLogin">退出登录</a></li>
								</ul>
							</c:if>
						</li>
						<li class="pull-right">
							<div id="car">
								<div class="cart dropdown">
									<a href="javascript:void(0);" class="cart-item dropdown-toggle" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="carSum()">
										<span>${carNum }</span><i class="fa fa-cart-plus"></i>
									</a>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
										<c:forEach items="${carList }" var="c">
											<li class="ii">
												<div class="media">
													<div class="media-left">
														<a href="#">
															<img class="media-object" src="../images/product/${c.product.pimage }" width="50" alt="...">
														</a>
													</div>
													<div class="media-body">
														<h4 class="product-name">${c.product.pname }</h4>
														<p>
															<span>${c.product.price }</span>
															<span> x</span>
															<span>${c.num }</span>
															<i class="fa fa-remove" onclick="delProduct(${c.product.pid },${user.uid })"></i>
														</p>
													</div>
												</div>
											</li>
										</c:forEach>
										<li class="table-div">
											<ul class="table-content">
												<li class="row m-0">
													<div class="col col-xs-6">
														<strong>Total:</strong>
													</div>
													<div class="col col-xs-6 color-3 f-bold" id="sum">
														00.00
													</div>
												</li>
											</ul>
										</li>
										<li>
											<p>
												<a href="/shoppe/order/newOrder" class="btn ht-btn bg-3">Checkout</a>
												<a href="/shoppe/car/cart" class="btn ht-btn bg-6">Cart</a>
											</p>
										</li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="bg-mn color-inher">
				<div class="row m-0">
					<div class="col-sm-1 col-md-1 col-lg-2 p-0">
						<div class="dropdown category-bar open">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">
								<i class="fa fa-bars"></i><span>Categories</span>
							</a>
							<ul class="dropdown-menu display-none hidden-xs">
								<li><a href="#"><span><img src="../images/25.jpg" width="50" alt="image"></span>蔬菜</a></li>
								<li><a href="#"><span><img src="../images/20.jpg" width="50" alt="image"></span>水果</a></li>
								<li><a href="#"><span><img src="../images/xia1.png" width="50" alt="image"></span>海鲜</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-8 col-md-8 col-lg-7 p-0">
						<div class="main-menu">
							<nav class="navbar navbar-default menu">
								<div class="navbar-header">
									<button type="button" class="navbar-toggle collapsed m-r-xs-15" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
										<span class="sr-only">Toggle navigation</span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
									</button>
								</div>
								<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
									<ul class="nav navbar-nav"> 
										<li><a href="/shoppe/home/index">首页</a></li>
										<li><a href="/shoppe/home/about">关于</a></li>
										<li><a href="/shoppe/user/login">登录</a></li>
										<li><a href="/shoppe/user/register">注册</a></li>
										<li><a href="#">联系我们</a></li>
									</ul>
								</div>
							</nav>
						</div>
					</div>	
					<div class="col-sm-3 col-md-3 col-lg-3 p-0">
						<div class="search-box m-l-xs-15 m-r-xs-15">
							<input type="text" class="form-item" placeholder="Search...">
							<button type="submit" class="fa fa-search"></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Banner -->
	<section class="m-t-0">
		<div class="container">
			<div class="row slider slider-1">
				<div class="owl" data-items="4" data-itemsDesktop="3" data-itemsDesktopSmall="2" data-itemsTablet="2" data-itemsMobile="1" data-transitionstyle="fade" data-singleItem="true" data-autoplay="true" data-pag="false" data-buttons="false">
					<div class="col-sm-8 col-md-9 pull-right">
						<div class="slider-item">
							<img src="../images/bg-13.png" alt="image">
							<div class="slider-caption">
							<h3 class="heading-size-3">100% Natural</h3> 
								<h2 class="heading-size-1">ORGANIC</h2>
								<h4 class="heading-size-5">Best product organic shop</h4>
							</div>
						</div>
					</div>
					<div class="col-sm-8 col-md-9 pull-right">
						<div class="slider-item">
							<img src="../images/bg-12.png" alt="image">
							<div class="slider-caption">
								<h3 class="heading-size-3">We supply farm</h3> 
								<h2 class="heading-size-1">VEGETABLE</h2>
								<h4 class="heading-size-5">Farm fresh vegetables & fruits</h4>
							</div>
						</div>
					</div>
					<div class="col-sm-8 col-md-9 pull-right">
						<div class="slider-item">
							<img src="../images/bg-21.png" alt="image">
							<div class="slider-caption">
								<h3 class="heading-size-3">Simply</h3>
								<h1 class="heading-size-1">FRUIT</h1>
								<h4 class="heading-size-5">Little things make a big difference</h4>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</section>
	<section class="m-t-0">
		<div class="container">
			<div class="row m-0">
				<div class="col-sm-4 m-b-30 p-0">
					<div class="banner bg-img-8 bg-3">
						<div class="caption">
							<h2 class="heading-size-4">水果</h2>
							<h3 class="heading-size-6 f-normal">简单又简洁</h3>
							<a href="#" class="btn ht-btn ht-btn-bg-2">阅读更多</a>
						</div>
					</div>
				</div>
				<div class="col-sm-4 m-b-30 p-0">
					<div class="banner bg-img-0 bg-2">
						<div class="caption">
							<h2 class="heading-size-4">蔬菜</h2>
							<h3 class="heading-size-6 f-normal">健康每一天</h3>
							<a href="#" class="btn ht-btn ht-btn-bg-2">阅读更多</a>
						</div>
					</div>
				</div>
				<div class="col-sm-4 p-0">
					<div class="banner bg-img-7 bg-6">
						<div class="caption">
							<h2 class="heading-size-4">海鲜</h2>
							<h3 class="heading-size-6 f-normal">喂养你的家人</h3>
							<a href="#" class="btn ht-btn ht-btn-bg-2">阅读更多</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product tabs -->
	<div>
		<div class="container text-center m-t-30">
			<h3 class="title f-30">Our Product</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>	
			<div class="ht-tabs ht-tabs-product text-center" id="tbox">
				
			</div>
		</div>
	</div>
	<!-- Testimonials -->
	<section class="text-center m-t-30">
		<div class="container">
			<div class="bg-img-1">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-4">
						<div class="testimonials">
							<h3 class="title f-30">Testimonials</h3>
							<div class="owl" data-items="4" data-itemsDesktop="3" data-itemsDesktopSmall="2" data-itemsTablet="2" data-itemsMobile="1" data-transitionstyle="fade" data-singleItem="true" data-autoplay="true" data-pag="true" data-buttons="false">
								<div class="testimonial-item">
									<span><img src="../images/1.jpg" alt="image"></span>
									<p>ORANIC has freed up my time by delivering excellent quality fruit and veg to my doorstep. I couldn't buy the same quality or quantity for the same price anywhere else locally. It's a great service.</p>	
									<strong>Bec Stewart, Marketing Director</strong>
								</div>
								<div class="testimonial-item">
									<span><img src="../images/2.jpg" alt="image"></span>
									<p>After having ORGANIC deliver fruit and vegetables to my home, for about 10 years, I can unreservedly recommend them I appreciate the freshness, variety, convenience, and all round goodness Well done Wild Greens!</p>	
									<strong>Anneliese Whipp, Registered Nurse Como</strong>
								</div>
								<div class="testimonial-item">
									<span><img src="../images/3.jpg" alt="image"></span>
									<p>Fresh fruit and vegies, easy and reliable service, and always with a smile – highly recommended.</p>	
									<strong>Peter and Lisa . Balmain</strong>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product slider-->
	<section class="text-center">
		<div class="container">
			<h3 class="title f-30">Featured</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
			<div class="row">
				<div class="owl" data-items="4" data-itemsDesktop="3" data-itemsDesktopSmall="2" data-itemsTablet="2" data-itemsMobile="1" data-transitionstyle="backslide" data-singleItem="false" data-autoplay="false" data-pag="false" data-buttons="false">
					<div class="col-lg-12">
						<!-- Product item -->
						<div class="product-item">
							<a href="product_detail.html">
								<img src="../images/8.jpg" alt="image">
							</a>
							<div class="product-caption">
								<h4 class="product-name">
									<a href="#">Red bell pepper</a>
								</h4>
								<div class="product-price-group">
									<span class="product-price">$64.00</span>
								</div>
								<div class="ht-btn-group">
									<a href="#" class="wishlist_btn"><i class="fa fa-heart-o"></i></a>
									<a href="#">Add to cart</a>
									<a href="#" class="compare_btn"><i class="fa fa-exchange"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<!-- Product item -->
						<div class="product-item">
							<a href="product_detail.html">
								<img src="../images/9.jpg" alt="image">
							</a>
							<div class="product-caption">
								<h4 class="product-name">
									<a href="#">Strawberry</a>
								</h4>
								<div class="product-price-group">
									<span class="product-price">$6,00</span>
								</div>
								<div class="ht-btn-group">
									<a href="#" class="wishlist_btn"><i class="fa fa-heart-o"></i></a>
									<a href="#">Add to cart</a>
									<a href="#" class="compare_btn"><i class="fa fa-exchange"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<!-- Product item -->
						<div class="product-item">
							<a href="product_detail.html">
								<img src="../images/10.jpg" alt="image">
							</a>
							<div class="product-caption">
								<h4 class="product-name">
									<a href="#">Celery Leaf</a>
								</h4>
								<div class="product-price-group">
									<span class="product-price">$6,00</span>
								</div>
								<div class="ht-btn-group">
									<a href="#" class="wishlist_btn"><i class="fa fa-heart-o"></i></a>
									<a href="#">Add to cart</a>
									<a href="#" class="compare_btn"><i class="fa fa-exchange"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<!-- Product item -->
						<div class="product-item">
							<a href="product_detail.html">
								<img src="../images/11.jpg" alt="image">
							</a>
							<div class="product-caption">
								<h4 class="product-name">
									<a href="#">Orange</a>
								</h4>
								<div class="product-price-group">
									<span class="product-price">$64.00</span>
								</div>
								<div class="ht-btn-group">
									<a href="#" class="wishlist_btn"><i class="fa fa-heart-o"></i></a>
									<a href="#">Add to cart</a>
									<a href="#" class="compare_btn"><i class="fa fa-exchange"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<!-- Product item -->
						<div class="product-item">
							<a href="product_detail.html">
								<img src="../images/12.jpg" alt="image">
							</a>
							<div class="product-caption">
								<h4 class="product-name">
									<a href="#">Pear</a>
								</h4>
								<div class="product-price-group">
									<span class="product-price">$64.00</span>
								</div>
								<div class="ht-btn-group">
									<a href="#" class="wishlist_btn"><i class="fa fa-heart-o"></i></a>
									<a href="#">Add to cart</a>
									<a href="#" class="compare_btn"><i class="fa fa-exchange"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<!-- Product item -->
						<div class="product-item">
							<a href="product_detail.html">
								<img src="../images/22.jpg" alt="image">
							</a>
							<div class="product-caption">
								<h4 class="product-name">
									<a href="#">Fresh peas</a>
								</h4>
								<div class="product-price-group">
									<span class="product-price">$64.00</span>
								</div>
								<div class="ht-btn-group">
									<a href="#" class="wishlist_btn"><i class="fa fa-heart-o"></i></a>
									<a href="#">Add to cart</a>
									<a href="#" class="compare_btn"><i class="fa fa-exchange"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<!-- Product item -->
						<div class="product-item">
							<a href="product_detail.html">
								<img src="../images/14.jpg" alt="image">
							</a>
							<div class="product-caption">
								<h4 class="product-name">
									<a href="#">Pineapple</a>
								</h4>
								<div class="product-price-group">
									<span class="product-price">$64.00</span>
								</div>
								<div class="ht-btn-group">
									<a href="#" class="wishlist_btn"><i class="fa fa-heart-o"></i></a>
									<a href="#">Add to cart</a>
									<a href="#" class="compare_btn"><i class="fa fa-exchange"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="m-t-30">
		<div class="container text-center">
			<h3 class="title f-30">From Blog</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>	
			<div class="row m-t-30">
				<div class="owl" data-items="3" data-itemsDesktop="3" data-itemsDesktopSmall="2" data-itemsTablet="2" data-itemsMobile="1" data-transitionstyle="fade" data-singleItem="false" data-autoplay="false" data-pag="false" data-buttons="false">
					<div class="col-sm-12">
						<div class="blog-item m-b-0">
							<a href="#" class="blog-img">
								<img src="../images/banner1.jpg" alt="image">
							</a>	
							<div class="blog-caption">
								<ul class="blog-date">
									<li><i class="fa fa-clock-o"></i>Nov 04, 2016</li>
									<li><a href="#"><i class="fa fa-comments-o"></i>3</a></li>
								</ul>
								<h3 class="blog-heading"><a href="#">Growing Tomatoes, Peppers and Eggplants in Containers</a></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
								<a href="#" class="btn ht-btn ht-btn-1"><i class="fa fa-long-arrow-right"></i>Read more</a>
							</div>
						</div>
					</div><!--end blog-->
					<div class="col-sm-12">
						<div class="blog-item m-b-0">
							<a href="#" class="blog-img">
								<img src="../images/banner2.jpg" alt="image">
							</a>	
							<div class="blog-caption">
								<ul class="blog-date">
									<li><i class="fa fa-clock-o"></i>Nov 04, 2016</li>
									<li><a href="#"><i class="fa fa-comments-o"></i>3</a></li>
								</ul>
								<h3 class="blog-heading"><a href="#">Container Vegetables - Broccoli & Cauliflower</a></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
								<a href="#" class="btn ht-btn ht-btn-1"><i class="fa fa-long-arrow-right"></i>Read more</a>
							</div>
						</div>
					</div><!--end blog-->
					<div class="col-sm-12">
						<div class="blog-item m-b-0">
							<a href="#" class="blog-img">
								<img src="../images/banner3.jpg" alt="image">
							</a>	
							<div class="blog-caption">
								<ul class="blog-date">
									<li><i class="fa fa-clock-o"></i>Nov 04, 2016</li>
									<li><a href="#"><i class="fa fa-comments-o"></i>3</a></li>
								</ul>
								<h3 class="blog-heading"><a href="#">Growing Pole & Bush Beans</a></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
								<a href="#" class="btn ht-btn ht-btn-1"><i class="fa fa-long-arrow-right"></i>Read more</a>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="blog-item m-b-0">
							<a href="#" class="blog-img">
								<img src="../images/banner4.jpg" alt="image">
							</a>	
							<div class="blog-caption">
								<ul class="blog-date">
									<li><i class="fa fa-clock-o"></i>Nov 04, 2016</li>
									<li><a href="#"><i class="fa fa-comments-o"></i>3</a></li>
								</ul>
								<h3 class="blog-heading"><a href="#">Indeterminate Tomatoes</a></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
								<a href="#" class="btn ht-btn ht-btn-1"><i class="fa fa-long-arrow-right"></i>Read more</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Process order -->
	<section  class="process">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4">	
					<div class="media ht-media">
						<div class="media-left">
							<i class="fa fa-phone bg-6"></i>
						</div>
						<div class="media-body">
							<h5 class="media-heading">Support 24/7: 0123-456-789</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4">	
					<div class="media ht-media">
						<div class="media-left">
							<i class="fa fa-truck bg-2"></i>
						</div>
						<div class="media-body">
							<h5 class="media-heading">Free shipping on all orders</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4">	
					<div class="media ht-media">
						<div class="media-left">
							<i class="fa fa-undo bg-3"></i>
						</div>
						<div class="media-body">
							<h5 class="media-heading">100% money back guarantee</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer -->
	<footer class="color-inher">
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-3 m-b-xs-30">
						<h3 class="title">Infomation</h3>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Delivery Information</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Terms & Conditions</a></li>
						</ul>
					</div>
					<div class="col-sm-3 m-b-xs-30">
						<h3 class="title">My Account</h3>
						<ul>
							<li><a href="#">My Account</a></li>
							<li><a href="#">Order History</a></li>
							<li><a href="#">Wish List</a></li>
							<li><a href="#">Guide use</a></li>
						</ul>
					</div>
					<div class="col-sm-3 m-b-xs-30">
						<h3 class="title">Extras</h3>
						<ul>
							<li><a href="#">Brands</a></li>
							<li><a href="#">Gift Vouchers</a></li>
							<li><a href="#">Affiliates</a></li>
							<li><a href="#">Specials</a></li>
						</ul>
					</div>
					<div class="col-sm-3 m-b-xs-30">
						<h3 class="title">Customer Service</h3>
						<ul>
							<li><a href="#">Contact Us</a></li>
							<li><a href="#">Returns</a></li>
							<li><a href="#">Site Map</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container">
				<p>Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
			</div>
		</div>
	</footer>
	<!-- jQuery -->
	<script src="../js/jquery/jquery-2.2.4.min.js"></script>
	<!-- JqueryUI -->
	<script src="../js/jquery/jquery-ui.js"></script>
	<!-- Bootstrap -->
	<script src="../js/bootstrap/bootstrap.min.js"></script>
	<!-- Owl-coursel -->
	<script src="../js/owl-coursel/owl.carousel.js"></script>
	<!-- Magnific-popup -->
	<script src="../js/magnific-popup/jquery.magnific-popup.min.js"></script>
	<!-- Script -->
	<script src="../js/script.js"></script>
	<script src="../js/car.js"></script>
</body>
<script type="text/javascript">

	//商品展示
	productShow(1,0);
	function productShow(tid,start){
		$.ajax({
			url:"/shoppe/product/productShow",
			dataType:"html",
			data:{"tid":tid,"start":start},
			success:function(msg){
				$("#tbox").html(msg);
			},
			error:function(msg){
				alert(msg);
			}
		});
	};
	
	//添加收藏
	function addCollect(pid,uid){
		$.ajax({
			async:false,
			url:"/shoppe/collect/addCollect",
			dataType:"json",
			data:{"pid":pid,"uid":uid},
			success:function(msg){
				console.log(msg);
			}
		});
	};
</script>
</html>