<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zxx">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>订单确认</title>
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
				<h2>订单添加</h2>
				<ul class="breadcrumb">
					<li><a href="/shoppe/home/index">首页</a></li>
					<li>订单添加</li>
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
							<!--panel-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="#collapse0" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle" aria-expanded="true">添加订单
											<i class="fa fa-caret-down"></i>
										</a>
									</h4>
								</div>
								<div id="collapse0" class="panel-collapse collapse in" role="tabpanel">
									<div class="panel-body">
										<div class="table-responsive">
											<form>
												<div class="form-group">
													<label class="control-label f-normal" for="input-uname">用户名</label>
													<input type="text" name="uname" value="${user.uname }" placeholder="用户名" id="input-uname" class="form-control form-item">
												</div>
												<div class="form-group">
													<label class="control-label f-normal" for="input-uphone">手机号码</label>
													<input type="text" name="uphone" value="${user.uphone }" placeholder="手机号码" id="input-uphone" class="form-control form-item">
												</div>
												<div class="form-group">
													<label class="control-label f-normal" for="input-address">用户地址</label>
													<input type="text" name="address" value="${user.address }" placeholder="用户地址" id="input-address" class="form-control form-item">
												</div>
											</form>
											<form>
												<div>
													<div class="table-div">
														<div class="row m-0 table-heading">
															<div class="col col-xs-1"><strong>商品图案</strong></div>
															<div class="col col-xs-3"><strong>商品名称</strong></div>
															<div class="col col-xs-2"><strong>商品类型</strong></div>
															<div class="col col-xs-2"><strong>选购数量</strong></div>
															<div class="col col-xs-2"><strong>商品单价</strong></div>
															<div class="col col-xs-2"><strong>Total</strong></div>
														</div>
														<c:forEach items="${carList }" var="c">
														<div class="row m-0 table-content ee">
															<div class="col col-xs-1">
																<a href="#"><img src="../images/product/${c.product.pimage }" width="70" alt="iPhone" title="iPhone"></a>
															</div>
															<div class="col col-xs-3">
																<a href="#">${c.product.pname }</a>
															</div>
															<div class="col col-xs-2">${c.product.type.tname }</div>
															<div class="col col-xs-2">
																<div class="input-group btn-block">
																	<span>${c.num }</span>
																</div>
															</div>
															<div class="col col-xs-2">$<span>${c.product.price }</span></div>
															<div class="col col-xs-2">$00.00</div>
														</div>
														</c:forEach>
														<!--end row-->
													</div>
												</div>
												<div class="row">
													<div class="col-xs-5 pull-right">
														<div class="total table-div">
															<ul class="table-content">
																<li class="row m-0">
																	<div class="col col-xs-6">
																		<strong>Total:</strong>
																	</div>
																	<div class="col col-xs-6" id="ordsum">
																		$<span>00.00</span>
																	</div>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</form>
										</div>
										<div class="buttons m-t-30">
											<div class="pull-right">
												<button type="button" class="btn ht-btn bg-6" id="pay">确认订单</button>
											</div>
										</div>
									</div>
								</div>
							</div>
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
			<div id="mon" style="left: 0; top: 0; position: fixed; z-index: 9999; background: #ccc; display: none; width: 100%; height: 100%;opacity:0.85;">
				<div style="left: 50%; top: 50%; position: fixed; z-index: 9999; background: white; width: 370px; height: 305px; margin-left: -185px; margin-top: -152.5px;opacity:1;">
					<img src="../images/pay.jpg" alt="支付二维码" title="支付二维码" style="display:block;width:150px;height:150px;margin:30px auto">
					<div style="padding:0px 90px">
						<button type="button" class="btn ht-btn bg-6" style="float:left" onclick="subOrder(${user.uid},2)">支付</button>
						<button type="button" class="btn ht-btn bg-6" style="float:right" onclick="subOrder(${user.uid},1)">取消</button>
					</div>
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
	$("#pay").click(function(){
		$("#mon").css("display","block");
	});
	
	function subOrder(uid,status_id){
		var total=$("#ordsum").children("span").text();
		var uname=$("#input-uname").val();
		var uphone=$("#input-uphone").val();
		var address=$("#input-address").val();
		$.ajax({
			url:"/shoppe/order/isNewOrder",
			dataType:"json",
			data:{
				"uid":uid,
				"total":total,
				"status_id":status_id,
				"uname":uname,
				"uphone":uphone,
				"address":address
			},
			success:function(data){
				if(data=="success"){
					$(window).attr("location","http://localhost:8080/shoppe/home/index");
				}
			}
		});
	};

	//订单总计
	(function(){
		var ordsum=0;
		$("div.ee").each(function(){
			var price=$(this).children("div").eq(4).children("span").text();
			var num=$(this).children("div").eq(3).children("div").children("span").text();
			$(this).children("div").eq(5).text("$"+price*num);
			ordsum=ordsum+price*num;
		});
		$("#ordsum").children("span").text(ordsum);
	})();	
</script>
</html>

