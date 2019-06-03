<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="./../htgl/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="./../htgl/js/jquery.js"></script>
<script src="./../htgl/js/public.js"></script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i></i><em>商品列表</em></span>
    <span class="modular fr"><a href="/shoppe/admin/add_product" class="pt-link-btn">+添加商品</a></span>
  </div>
  <div class="operate">
   <form>
    <input type="text" class="textBox length-long" placeholder="输入产品名称..."/>
    <input type="button" value="查询" class="tdBtn"/>
   </form>
  </div>
  <table class="list-style Interlaced">
   <tr>
    <th>ID编号</th>
    <th>产品</th>
    <th>名称</th>
    <th>单价</th>
    <th>类型</th>
    <th>库存</th>
    <th>操作</th>
   </tr>
   <c:forEach items="${productList }" var="p">
   <tr>
    <td class="center">
	     <input type="checkbox"/>
	     <span class="middle">${p.pid }</span>
	</td>
    <td class="center pic-area"><img src="./../images/product/${p.pimage }" class="thumbnail"/></td>
    <td class="center td-name">
      <span class="ellipsis td-name block">${p.pname }</span>
    </td>
    <td class="center">
     <span>
      <i>￥</i>
      <em>${p.price }</em>
     </span>
    </td>
    <td class="center">
     <span>
     ${p.type.tname }
     </span>
    </td>
    <td class="center">
     <span>
      <em>${p.pnum }</em>
      <i>件</i>
     </span>
    </td>
    <td class="center">
     <a href="/shoppe/admin/edit_product?pid=${p.pid }"" title="编辑"><img src="./../htgl/images/icon_edit.gif"/></a>
     <a href="/shoppe/admin/del_product?pid=${p.pid }" title="删除"><img src="./../htgl/images/icon_drop.gif"/></a>
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
	   <input type="button" value="批量删除" class="btnStyle"/>
	  </div>
	  <!-- turn page -->
	  <div class="turnPage center fr">
	   <a href="/shoppe/admin/product_list?start=0">首页</a>
     <a href="/shoppe/admin/product_list?start=${page.start-page.count }">上一页</a>
     <a href="/shoppe/admin/product_list?start=${page.start+page.count }">下一页</a>
	   <a href="/shoppe/admin/product_list?start=${page.end }">尾页</a>
	  </div>
  </div>
 </div>
</body>
</html>