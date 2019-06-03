<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>左侧导航</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="./../htgl/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="./../htgl/js/jquery.js"></script>
<script src="./../htgl/js/public.js"></script>
</head>
<body style="background:#313131">
<div class="menu-list">
 <a href="/shoppe/admin/main" target="mainCont" class="block menu-list-title center" style="border:none;margin-bottom:8px;color:#fff;">起始页</a>
 <ul>
  <li class="menu-list-title">
   <span>订单管理</span>
   <i>◢</i>
  </li>
  <li>
   <ul class="menu-children">
    <li><a href="/shoppe/admin/order_list" title="订单列表" target="mainCont">订单列表</a></li>
   </ul>
  </li>
 
  <li class="menu-list-title">
   <span>商品管理</span>
   <i>◢</i>
  </li>
  <li>
   <ul class="menu-children">
    <li><a href="/shoppe/admin/product_list" title="商品列表" target="mainCont">商品列表</a></li>
   </ul>
  </li>
  
  <li class="menu-list-title">
   <span>用户管理</span>
   <i>◢</i>
  </li>
  <li>
   <ul class="menu-children">
    <li><a href="/shoppe/admin/user_list" title="用户列表" target="mainCont">用户列表</a></li>
    <li><a href="/shoppe/admin/add_user" title="添加用户" target="mainCont">添加用户</a></li>
   </ul>
  </li>
  
  <li class="menu-list-title">
   <span>个人中心</span>
   <i>◢</i>
  </li>
  <li>
   <ul class="menu-children">
    <li><a href="/shoppe/admin/edit_admin?aid=${admin.aid }" title="管理员信息" target="mainCont">管理员信息</a></li>
   </ul>
  </li>
</ul>
</div>
</body>
</html>