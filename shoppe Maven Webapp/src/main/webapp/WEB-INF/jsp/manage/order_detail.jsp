<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>订单详情</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="./../htgl/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="./../js/jquery/jquery-2.2.4.min.js"></script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="order"></i><em>订单编号：${order.orderNum }</em></span>
  </div>
  <dl class="orderDetail">
   <dt class="order-h">订单详情</dt>
   <dd>
    <ul>
     <li>
      <span class="h-cont h-right">收件人姓名：</span>
      <span class="h-cont h-left">${order.uname }</span>
     </li>
     <li>
      <span class="h-cont h-right">联系电话：</span>
      <span class="h-cont h-left">${order.uphone }</span>
     </li>
     <li>
      <span class="h-cont h-right">联系地址：</span>
      <span class="h-cont h-left">${order.address }</span>
     </li>
     <li>
      <span class="h-cont h-right">付款状态：</span>
      <span class="h-cont h-left">${order.status.statusName }</span>
     </li>
     <li>
      <span class="h-cont h-right">下单时间：</span>
      <span class="h-cont h-left">${order.time }</span>
     </li>
     <li>
      <span class="h-cont h-right">付款时间：</span>
      <span class="h-cont h-left">${order.paytime }</span>
     </li>
    </ul>
   </dd>
   <dd style="padding:1em 0;">
    <span><b>订单留言：</b></span>
    <span>...这里是用户留言信息，务必***请到****谢谢~</span>
   </dd>
   <dd>
    <table class="list-style">
     <tr class="center">
      <th>缩略图</th>
      <th>产品</th>
      <th>单价</th>
      <th>数量</th>
      <th>小计</th>
     </tr>
     <c:forEach items="${order.orderitems }" var="oil">
     <tr class="center cc">
      <td><img src="./../images/product/${oil.product.pimage }" class="thumbnail"/></td>
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
         <b>${order.total }</b>
        </span>
       </div>
      </td>
     </tr>
    </table>
   </dd>
   <dd>
    <table class="noborder">
     <tr>
      <td width="10%" style="text-align:right;"><b>管理员操作：</b></td>
      <td>
       <textarea class="block" style="width:80%;height:35px;outline:none;"></textarea>
      </td>
     </tr>
    </table>
   </dd>
   <dd>
      <!-- Operation -->
	  <div class="BatchOperation">
	   <input type="button" value="打印订单" class="btnStyle"/>
	   <input type="button" value="配送" class="btnStyle"/>
	   <input type="button" value="发货" class="btnStyle"/>
	   <input type="button" value="取消订单" class="btnStyle"/>
	  </div>
   </dd>
  </dl>
 </div>
</body>
<script type="text/javascript">
	//订单小计
	(function(){
			$("tr.cc").each(function(){
				var price=$(this).children("td").eq(2).children("span").children("em").text();
				var num=$(this).children("td").eq(3).text();
				$(this).children("td").eq(4).children("span").children("em").text(price*num);
				console.log(price);
				console.log(num);
			});
	})();
</script>
</html>