<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>header</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="./../htgl/style/adminStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="header">
 <div class="logo">
  <img src="./../htgl/images/admin_logo.png" title="在哪儿"/>
 </div>
 <div class="fr top-link">
  <c:if test="${empty admin.name }">
  <a href="/shoppe/admin/adminLogin" target="mainCont" title="登录" style="background:rgb(60,60,60);"><span>登录</span></a>|
  <a href="/shoppe/admin/adminRegister" target="mainCont" title="注册" style="background:rgb(60,60,60);margin-left:0;"><span>注册</span></a>
  </c:if>
  <c:if test="${not empty admin.name }">
  <a href="admin_list.html" target="mainCont" title="DeathGhost"><i class="adminIcon"></i><span>管理员：${admin.name }</span></a>
  <a href="#" title="安全退出" style="background:rgb(60,60,60);"><i class="quitIcon"></i><span>安全退出</span></a>
  </c:if>
 </div>
</div>
</body>
</html>