<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后台管理中心起始页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="./../htgl/style/adminStyle.css" rel="stylesheet" type="text/css" />
<style>html,body{width:100%;height:100%;}</style>
<script src="./../htgl/js/jquery.js"></script>
<script src="./../htgl/js/eject.js"></script>
<script src="./../htgl/js/public.js"></script>
</head>
<body>
<div class="wrap start-page">
 <h1><i class="home-icon"></i>欢迎回到**站点管理中心</h1>
 <dl>
  <dt>统计信息</dt>
  <dd>
   <ul>
    <li>
     <span>订单总数：</span>
     <span>${ordersum }</span>
    </li>
    <li>
     <span>商品总数：</span>
     <span>${productsum }</span>
    </li>
    <li>
     <span>用户总数：</span>
     <span>${usersum }</span>
    </li>
   </ul>
  </dd>
 </dl>
 
 <dl>
  <dt>系统信息</dt>
  <dd>
   <ul>
    <li>
     <span>服务器操作系统：</span>
     <span>WIN7</span>
    </li>
    <li>
     <span>WEB服务器：</span>
     <span>APACHE2.2.9</span>
    </li>
    <li>
     <span>MySQL 版本：</span>
     <span>5.0</span>
    </li>
    <li>
     <span>安全模式：</span>
     <span>否</span>
    </li>
    <li>
     <span>安全模式GID:：</span>
     <span>否</span>
    </li>
    <li>
     <span>时区设置：</span>
     <span>Europe/Paris</span>
    </li>
    <li>
     <span>编码：</span>
     <span>UTF-8</span>
    </li>
   </ul>
  </dd>
 </dl>
</div>
</body>
</html>