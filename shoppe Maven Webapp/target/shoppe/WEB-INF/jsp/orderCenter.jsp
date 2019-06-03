<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>订单信息</title>
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
				<h2>订单信息</h2>
				<ul class="breadcrumb">
					<li><a href="/shoppe/home/index">首页</a></li>
					<li>订单信息</li>
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
							<c:forEach items="${orderList }" var="ol">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="#${ol.orderNum }" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle collapsed" aria-expanded="false">订单编号：${ol.orderNum }
											<i class="fa fa-caret-down"></i>
										</a>
									</h4>
								</div>
								<div id="${ol.orderNum }" class="panel-collapse collapse" role="tabpanel">
									<div class="panel-body">
										<dl class="orderDetail">
										   <dt class="order-h">订单详情</dt>
										   <dd>
										    <ul>
										     <li>
										      <span class="h-cont h-right">收件人姓名：</span>
										      <span class="h-cont h-left">${ol.uname }</span>
										     </li>
										     <li>
										      <span class="h-cont h-right">联系电话：</span>
										      <span class="h-cont h-left">${ol.uphone }</span>
										     </li>
										     <li>
										      <span class="h-cont h-right">联系地址：</span>
										      <span class="h-cont h-left">${ol.address }</span>
										     </li>
										     <li>
										      <span class="h-cont h-right">付款状态：</span>
										      <span class="h-cont h-left">${ol.status.statusName }</span>
										     </li>
										     <li>
										      <span class="h-cont h-right">下单时间：</span>
										      <span class="h-cont h-left">${ol.time }</span>
										     </li>
										     <li>
										      <span class="h-cont h-right">付款时间：</span>
										      <span class="h-cont h-left">${ol.paytime }</span>
										     </li>
										    </ul>
										   </dd>
										   <dd style="padding:1em 0;">
										    <span><b>订单留言：</b></span>
										    <span>...这里是用户留言信息，务必***请到****谢谢~</span>
										   </dd>
										   <dd>
										    <table class="list-style">
										     <tr>
										      <th>商品图</th>
										      <th>产品</th>
										      <th>单价</th>
										      <th>数量</th>
										      <th>小计</th>
										     </tr>
										     <c:forEach items="${ol.orderitems }" var="oil">
										     <tr class="cc">
										      <td><img src="../images/product/${oil.product.pimage }" class="thumbnail"/></td>
										      <td>${oil.product.pname }</td>
										      <td>
										       <span>
										        <i>￥</i>
										        <em>${oil.product.price }</em>
										       </span>
										      </td>
										      <td>${oil.pnum }</td>
										      <td>
										       <span>
										        <i>￥</i>
										        <em>0.00</em>
										       </span>
										      </td>
										     </tr>
										     </c:forEach>
										     <tr>
										      <td colspan="5">
										       <div class="fr">
										        <span style="font-size:15px;font-weight:bold;">
										         <i>订单共计金额：￥</i>
										         <b>${ol.total }</b>
										        </span>
										       </div>
										      </td>
										     </tr>
										    </table>
										   </dd>
										   <dd>
											   <div class="buttons m-t-30">
											   		<div class="pull-right">
											   			<c:if test="${ol.status_id eq 1 }">
											   				<a href="/shoppe/order/pay?uid=${user.uid }&orderNum=${ol.orderNum }" class="btn ht-btn bg-6">支付</a>
											   			</c:if>
												  		<a href="/shoppe/order/del?uid=${user.uid }&orderNum=${ol.orderNum }" class="btn ht-btn bg-6">取消订单</a>
												 	</div>
												</div>
										   </dd>
										  </dl>
									</div>
								</div>
							</div>
							</c:forEach>
							<!--/panel-->
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
	//订单小计
	(function(){
			$("tr.cc").each(function(){
				var price=$(this).children("td").eq(2).children("span").children("em").text();
				var num=$(this).children("td").eq(3).text();
				$(this).children("td").eq(4).children("span").children("em").text(price*num);
			});
	})();
</script>
</html>

