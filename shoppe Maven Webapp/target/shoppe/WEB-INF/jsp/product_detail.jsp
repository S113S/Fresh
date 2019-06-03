<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>商品详情</title>
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
	<!-- Magnific-popup -->
	<link rel="stylesheet" type="text/css" href="../css/magnific-popup/magnific-popup.css">
	<!-- Style -->
	<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen">
	<!-- Fw -->
	<link rel="stylesheet" type="text/css" href="../css/fw.css" media="screen">
</head>

<body>
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
	<div class="heading-inner-page">
		<div class="container">
			<h2>商品详情</h2>
			<ul class="breadcrumb">
				<li>
					<a href="/shoppe/home/index">首页</a>
				</li>
				<li>
					<a href="#">商品</a>
				</li>
				<li>
					<a href="#">${product.type.tname }</a>
				</li>
				<li>${product.pname }</li>
			</ul>
		</div>
	</div>
	<!-- Product -->
	<section class="m-t-30">
		<div class="container">
			<div class="row">
				<!-- Product image gallery -->
				<div class="col-sm-6 col-md-7">
					<ul class="thumbnails p-0">
						<li>
							<a class="thumbnail img-large image-zoom" href="../images/product/${product.pimage }" title="${product.pname }">
								<img src="../images/product/${product.pimage }" alt="${product.pname }">
							</a>
						</li>
						<li class="image-additional">
							<a class="thumbnail image-zoom" href="../images/9.jpg" title="iPhone">
								<img src="../images/9.jpg" title="iPhone" alt="iPhone">
							</a>
						</li>
						<li class="image-additional">
							<a class="thumbnail image-zoom" href="../images/10.jpg" title="iPhone">
								<img src="../images/10.jpg" title="iPhone" alt="iPhone">
							</a>
						</li>
						<li class="image-additional">
							<a class="thumbnail image-zoom" href="../images/11.jpg" title="iPhone">
								<img src="../images/11.jpg" title="iPhone" alt="iPhone">
							</a>
						</li>
						<li class="image-additional">
							<a class="thumbnail image-zoom" href="../images/12.jpg" title="iPhone">
								<img src="../images/12.jpg" title="iPhone" alt="iPhone">
							</a>
						</li>
						<li class="image-additional">
							<a class="thumbnail image-zoom" href="../images/13.jpg" title="iPhone">
								<img src="../images/13.jpg" title="iPhone" alt="iPhone">
							</a>
						</li>
					</ul>
				</div>
				<!-- Product decr -->
				<div class="col-sm-6 col-md-5">
					<div class="product-pare m-t-xs-60">
						<h1>${product.pname }</h1>
						<ul class="list-unstyled m-b-20">
							<li>
								<span>Fruit size:</span>4.5 inches by 4 inches</li>
							<li>
								<span>Matures:</span>70 to 80 days</li>
							<li>
								<span>Plant spacing:</span>18 to 24 inches apart</li>
							<li>
								<span>Plant size:</span>24 to 36 inches tall, 18 to 24 inches wide</li>
						</ul>
						<p>The bell pepper is a cultivar group of the species Capsicum annuum. Cultivars of the plant produce fruits in different
							colors, including red, yellow, orange, green...</p>
						<p class="product-price">$${product.price }</p>
						<div class="quantily-wrap">
							<label class="control-label" for="input-quantity"></label>
							<input type="number" value="1" size="2" id="input-quantity" class="form-control form-item">
						</div>
						<button type="button" class="btn ht-btn bg-3 m-t-0" onclick="addProduct(${product.pid },${user.uid })">Add to Cart</button>
						<div class="m-t-30">
							<a href="#">0 reviews</a> /
							<a href="#">Write a review</a>
						</div>
					</div>
				</div>
			</div>
			<!-- End row -->
			<!-- Tabs -->
			<div class="row m-t-30">
				<div class="col-sm-9">
					<div class="p-30 bore">
						<h3 class="title">DESCRIPTION</h3>
						<p>${product.pdesc }</p>
						<h5>Nutrition Facts</h5>
						<ul class="list-border width-auto-xs">
							<li>Calories: 46</li>
							<li>Carbohydrates: 9g</li>
							<li>Dietary fiber: 3g</li>
							<li>Protein: 1g</li>
							<li>Sugars: 6g</li>
							<li>Vitamin A: 93% DV</li>
							<li>Vitamin C: 317%</li>
							<li>Vitamin E: 12%</li>
							<li>Vitamin K: 9%</li>
							<li>Thiamin: 6%</li>
							<li>Vitamin B6: 22%</li>
							<li>Folate: 17%</li>
							<li>Manganese: 8%</li>
							<li>Potassium: 9%</li>
						</ul>
					</div>
					<div class="p-30 bore m-t-30" id="words_div">
						<c:forEach items="${wordList }" var="w">
							<div>
								<a href=""><img src="../images/user/${w.user.uimage }" alt="" style="width:30px;height:30px;border-radius:15px" /></a>
								<a href="">	${w.user.uname }</a>
								<span> &nbsp;${w.time }</span>
								<p> &nbsp;&nbsp;&nbsp;${w.content }</p>
							</div>
						</c:forEach>
					</div>
					<form class="form-horizontal p-30 bore m-t-30">
						<h3 class="title">买家留言</h3>
						<div class="form-group required">
							<div class="col-sm-12">
								<textarea name="content" rows="5" id="input-review" class="form-control form-item"></textarea>
								<div class="help-block">
									<span class="text-danger">Note:</span> HTML is not translated!
								</div>
							</div>
						</div>
						<div class="buttons clearfix">
							<div class="">
								<button type="button" class="btn btn-primary ht-btn bg-6" onclick="addWord(${user.uid },${product.pid })">Submit</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-sm-3">
					<div class="banner bg-img-13">
						<div class="caption text-center">
							<h2 class="heading-size-3 f-bold">100%</h2>
							<h3 class="heading-size-5 f-normal">ORGANIC</h3>
							<a href="#" class="btn ht-btn ht-btn-bg-2">Read more</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product related -->
	<section>
		<div class="container">
			<h3 class="title">Product Related</h3>
			<div class="row product-bor">
				<div class="owl" data-items="4" data-itemsDesktop="4" data-itemsDesktopSmall="3" data-itemsTablet="2" data-itemsMobile="1"
				 data-transitionstyle="backslide" data-singleItem="false" data-autoplay="false" data-pag="false" data-buttons="true">
					<div class="col-sm-12">
						<!-- Product item -->
						<div class="product-item m-b-0">
							<a href="product_detail.html" class="product-img">
								<img src="../images/5.jpg" alt="image">
							</a>
							<div class="product-caption">
								<h4 class="product-name">
									<a href="#">Apple</a>
								</h4>
								<ul class="list-inline rating">
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star"></i>
									</li>
									<li>
										<i class="fa fa-star"></i>
									</li>
								</ul>
								<div class="product-price-group">
									<span class="product-price-old">$12,00</span>
									<span class="product-price">$52,00</span>
								</div>
							</div>
							<div class="ht-btn-group">
								<a href="#">
									<i class="fa fa-heart-o"></i>
								</a>
								<a href="#">
									<i class="fa fa-exchange"></i>
								</a>
								<a href="#">Add to cart</a>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<!-- Product item -->
						<div class="product-item m-b-0">
							<a href="product_detail.html" class="product-img">
								<img src="../images/6.jpg" alt="image">
							</a>
							<div class="product-caption">
								<h4 class="product-name">
									<a href="#">Apple</a>
								</h4>
								<ul class="list-inline rating">
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star"></i>
									</li>
									<li>
										<i class="fa fa-star"></i>
									</li>
								</ul>
								<div class="product-price-group">
									<span class="product-price-old">$12,00</span>
									<span class="product-price">$52,00</span>
								</div>
							</div>
							<div class="ht-btn-group">
								<a href="#">
									<i class="fa fa-heart-o"></i>
								</a>
								<a href="#">
									<i class="fa fa-exchange"></i>
								</a>
								<a href="#">Add to cart</a>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<!-- Product item -->
						<div class="product-item m-b-0">
							<a href="product_detail.html" class="product-img">
								<img src="../images/7.jpg" alt="image">
							</a>
							<div class="product-caption">
								<h4 class="product-name">
									<a href="#">Apple</a>
								</h4>
								<ul class="list-inline rating">
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star"></i>
									</li>
									<li>
										<i class="fa fa-star"></i>
									</li>
								</ul>
								<div class="product-price-group">
									<span class="product-price-old">$12,00</span>
									<span class="product-price">$52,00</span>
								</div>
							</div>
							<div class="ht-btn-group">
								<a href="#">
									<i class="fa fa-heart-o"></i>
								</a>
								<a href="#">
									<i class="fa fa-exchange"></i>
								</a>
								<a href="#">Add to cart</a>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<!-- Product item -->
						<div class="product-item m-b-0">
							<a href="product_detail.html" class="product-img">
								<img src="../images/8.jpg" alt="image">
							</a>
							<div class="product-caption">
								<h4 class="product-name">
									<a href="#">Apple</a>
								</h4>
								<ul class="list-inline rating">
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star"></i>
									</li>
									<li>
										<i class="fa fa-star"></i>
									</li>
								</ul>
								<div class="product-price-group">
									<span class="product-price-old">$12,00</span>
									<span class="product-price">$52,00</span>
								</div>
							</div>
							<div class="ht-btn-group">
								<a href="#">
									<i class="fa fa-heart-o"></i>
								</a>
								<a href="#">
									<i class="fa fa-exchange"></i>
								</a>
								<a href="#">Add to cart</a>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<!-- Product item -->
						<div class="product-item m-b-0">
							<a href="product_detail.html" class="product-img">
								<img src="../images/9.jpg" alt="image">
							</a>
							<div class="product-caption">
								<h4 class="product-name">
									<a href="#">Apple</a>
								</h4>
								<ul class="list-inline rating">
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star"></i>
									</li>
									<li>
										<i class="fa fa-star"></i>
									</li>
								</ul>
								<div class="product-price-group">
									<span class="product-price-old">$12,00</span>
									<span class="product-price">$52,00</span>
								</div>
							</div>
							<div class="ht-btn-group">
								<a href="#">
									<i class="fa fa-heart-o"></i>
								</a>
								<a href="#">
									<i class="fa fa-exchange"></i>
								</a>
								<a href="#">Add to cart</a>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<!-- Product item -->
						<div class="product-item m-b-0">
							<a href="product_detail.html" class="product-img">
								<img src="../images/10.jpg" alt="image">
							</a>
							<div class="product-caption">
								<h4 class="product-name">
									<a href="#">Apple</a>
								</h4>
								<ul class="list-inline rating">
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star color-6"></i>
									</li>
									<li>
										<i class="fa fa-star"></i>
									</li>
									<li>
										<i class="fa fa-star"></i>
									</li>
								</ul>
								<div class="product-price-group">
									<span class="product-price-old">$12,00</span>
									<span class="product-price">$52,00</span>
								</div>
							</div>
							<div class="ht-btn-group">
								<a href="#">
									<i class="fa fa-heart-o"></i>
								</a>
								<a href="#">
									<i class="fa fa-exchange"></i>
								</a>
								<a href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Process order -->
	<section class="process">
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
							<li>
								<a href="#">About Us</a>
							</li>
							<li>
								<a href="#">Delivery Information</a>
							</li>
							<li>
								<a href="#">Privacy Policy</a>
							</li>
							<li>
								<a href="#">Terms & Conditions</a>
							</li>
						</ul>
					</div>
					<div class="col-sm-3 m-b-xs-30">
						<h3 class="title">My Account</h3>
						<ul>
							<li>
								<a href="#">My Account</a>
							</li>
							<li>
								<a href="#">Order History</a>
							</li>
							<li>
								<a href="#">Wish List</a>
							</li>
							<li>
								<a href="#">Guide use</a>
							</li>
						</ul>
					</div>
					<div class="col-sm-3 m-b-xs-30">
						<h3 class="title">Extras</h3>
						<ul>
							<li>
								<a href="#">Brands</a>
							</li>
							<li>
								<a href="#">Gift Vouchers</a>
							</li>
							<li>
								<a href="#">Affiliates</a>
							</li>
							<li>
								<a href="#">Specials</a>
							</li>
						</ul>
					</div>
					<div class="col-sm-3 m-b-xs-30">
						<h3 class="title">Customer Service</h3>
						<ul>
							<li>
								<a href="#">Contact Us</a>
							</li>
							<li>
								<a href="#">Returns</a>
							</li>
							<li>
								<a href="#">Site Map</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container">
				<p>Copyright &copy; 2017.Company name All rights reserved.
					<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
				</p>
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

	//留言
	function addWord(uid,pid){
		var content=$("#input-review").val();
		console.log(content);
		$.ajax({
			url:"/shoppe/word/add",
			dataType:"json",
			data:{"uid":uid,"pid":pid,"content":content},
			success:function(msg){
				if(msg=="success")
					$(window).attr("location","/shoppe/product/productDetail?pid="+pid);
				else
					alert("还没选购该商品！");
			},
		});
	};
	
</script>
</html>