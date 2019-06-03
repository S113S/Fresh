<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>个人信息</title>
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
		
		<link rel="stylesheet" type="text/css" href="../css/other.css" media="screen">
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
				<h2>个人信息</h2>
				<ul class="breadcrumb">
					<li><a href="/shoppe/home/index">首页</a></li>
					<li>个人信息</li>
				</ul>
			</div>
		</div>
		<!-- Checkout -->
		<section>
			<div class="container">
				<div>
					<div id="content">
						<div class="panel-group">
							<!--panel-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="#collapse0" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle" aria-expanded="true">用户信息
											<i class="fa fa-caret-down"></i>
										</a>
									</h4>
								</div>
								 <div id="collapse0" class="panel-collapse collapse in" role="tabpanel">
									<div class="panel-body">
										<div class="row">
											<div class="col-sm-6">
												<div class="bore p-40 p-xs-20">
													<h3 class="title">New Customer</h3>
													<form action="/shoppe/user/isInfoCenter?uid=${user.uid }&uimage=${user.uimage }" method="post" enctype="multipart/form-data">
														<div class="form-group">
															<label class="control-label f-normal" for="input-uname">用户名</label>
															<input type="text" name="uname" value="${user.uname }" placeholder="用户名" id="input-uname" class="form-control form-item">
														</div>
														<div class="form-group">
															<label class="control-label f-normal" for="input-usex">用户性别</label><br/>
															     <select class="textBox" name="usex" id="input-usex" class="form-control form-item">
																     <c:if test="${user.usex eq '男' or user.usex eq null }">
																     <option value="男">男</option>
																     <option value="女">女</option>
																     </c:if>
																     <c:if test="${user.usex eq '女' }">
																     <option value="女">女</option>
																     <option value="男">男</option>
																     </c:if>
															     </select>
														</div>
														<div class="form-group">
															<label class="control-label f-normal" for="input-email">用户邮箱</label>
															<input type="text" name="email" value="${user.email }" placeholder="用户邮箱" id="input-email" class="form-control form-item">
														</div>
														<div class="form-group">
															<label class="control-label f-normal" for="input-uphone">手机号码</label>
															<input type="text" name="uphone" value="${user.uphone }" placeholder="手机号码" id="input-uphone" class="form-control form-item">
														</div>
														<div class="form-group">
															<label class="control-label f-normal" for="input-upwd">用户密码</label>
															<input type="password" name="upwd" value="${user.upwd }" placeholder="用户密码" id="input-upwd" class="form-control form-item">
														</div>
														<div class="form-group">
															<label class="control-label f-normal" for="input-address">用户地址</label>
															<input type="text" name="address" value="${user.address }" placeholder="用户地址" id="input-address" class="form-control form-item">
														</div>
														<div class="form-group">
															<input type="file" id="suoluetu" class="hide" name="image" accept="image/*"/>
														    <label for="suoluetu" class="labelBtnAdd">+</label>
														    <img src="./../images/user/${user.uimage }" width="60" height="60" class="mlr5" id="imgShow"/>
														</div>
														<input type="submit" class="btn ht-btn bg-6 m-t-20"/>
													</form>
												</div>
											</div>
										 </div>
									</div>
								</div>
							</div>
							<!--panel-->
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
								<i class="fa fa-undo bg-6"></i>
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
	$("#suoluetu").change(function(){
	var objUrl = getObjectURL(this.files[0]) ;
	console.log("objUrl = "+objUrl) ;
	if (objUrl) {
		$("#imgShow").attr("src", objUrl) ;
	}
	}) ;
	//建立一個可存取到該file的url
	function getObjectURL(file) {
	var url = null ; 
	if (window.createObjectURL!=undefined) { // basic
		url = window.createObjectURL(file) ;
	} else if (window.URL!=undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file) ;
	} else if (window.webkitURL!=undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file) ;
	}
	return url ;
	}
</script>
</html>

