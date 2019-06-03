<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="nofollow"/>
<link href="./../htgl/style/adminStyle.css" rel="stylesheet" type="text/css" />
<style>
body{width:100%;height:100%;overflow:hidden;background:url(images/pc_loginBg.jpg) no-repeat;background-size:cover;position:absolute;}
</style>
<script src="./../htgl/js/jquery.js"></script>
<script src="./../htgl/js/Particleground.js"></script>
<script>
$(document).ready(function() {
  $('body').particleground({
    dotColor:'green',
    lineColor:'#c9ec6e'
  });
  $('.intro').css({
    'margin-top': -($('.intro').height() /2)
  });
});
</script>

</head>
<body>
  <section class="loginform">
   <h1>后台管理系统</h1>
   <form action="/shoppe/admin/isAdminRegister">
   <ul>
    <li>
     <label>账号：</label>
     <input type="text" class="textBox" name="phone" placeholder="管理员账号"/>
    </li>
    <li>
     <label>昵称：</label>
     <input type="text" class="textBox" name="name" placeholder="管理员账号"/>
    </li>
    <li>
     <label>密码：</label>
     <input type="password" class="textBox" name="pwd" placeholder="登陆密码"/>
    </li>
    <li>
     <input type="submit" value="立即登陆"/>
    </li>
   </ul>
   </form>
  </section>
</body>
</html>