<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>订单列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="./../htgl/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="./../htgl/js/jquery.js"></script>
<script src="./../htgl/js/public.js"></script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="order"></i><em>订单列表</em></span>
  </div>
  <div class="operate">
   <form>
    <img src="./../htgl/images/icon_search.gif"/>
    <input type="text" class="textBox length-long" placeholder="输入订单编号或收件人姓名..."/>
    <select class="inline-select">
     <option>未付款</option>
     <option>已付款</option>
    </select>
    <input type="button" value="查询" class="tdBtn"/>
   </form>
  </div>
  <table class="list-style Interlaced">
   <tr>
    <th>订单编号</th>
    <th>下单时间</th>
    <th>收件人</th>
    <th>订单金额</th>
    <th>订单状态</th>
    <th>操作</th>
   </tr>
   <c:forEach items="${orderList }" var="ol">
   <tr>
    <td>
     <input type="checkbox"/>
     <a href="/shoppe/admin/order_detail?orderNum=${ol.orderNum }">${ol.orderNum }</a>
    </td>
    <td class="center">
     <span class="block">${ol.time }</span>
    </td>
    <td width="450" class="center">
     <span class="block">${ol.uname }[${ol.uphone }]</span>
     <address>${ol.address }</address>
    </td>
    <td class="center">
     <span><i>￥</i><b>${ol.total }</b></span>
    </td>
    <td class="center">
     <span>${ol.status.statusName }</span>
    </td>
    <td class="center">
     <a href="/shoppe/admin/order_detail?orderNum=${ol.orderNum }" class="inline-block" title="查看订单"><img src="./../htgl/images/icon_view.gif"/></a>
     <a href="/shoppe/admin/del_order?orderNum=${ol.orderNum }" class="inline-block" title="删除订单"><img src="./../htgl/images/icon_trash.gif"/></a>
    </td>
   </tr>
   </c:forEach>
  </table>
  <!-- BatchOperation -->
  <div style="overflow:hidden;">
      <!-- Operation -->
	  <div class="BatchOperation fl">
	   <input type="checkbox" id="del"/>
	   <label for="del" class="btnStyle middle">全选</label>
	   <input type="button" value="打印订单" class="btnStyle"/>
	   <input type="button" value="配货" class="btnStyle"/>
	   <input type="button" value="删除订单" class="btnStyle"/>
	  </div>
	  <!-- turn page -->
	  <div class="turnPage center fr">
	   <a href="/shoppe/admin/order_list?start=0">首页</a>
     <a href="/shoppe/admin/order_list?start=${page.start-page.count }">上一页</a>
     <a href="/shoppe/admin/order_list?start=${page.start+page.count }">下一页</a>
	   <a href="/shoppe/admin/order_list?start=${page.end }">尾页</a>
	  </div>
  </div>
 </div>
</body>
</html>