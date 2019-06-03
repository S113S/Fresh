<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="./../js/jquery/jquery-2.2.4.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加用户</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="./../htgl/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="./../htgl/js/jquery.js"></script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="add_user"></i><em>添加用户</em></span>
  </div>
  <form action="/shoppe/admin/isAdd_user" method="post" enctype="multipart/form-data">
  <table class="list-style">
   <tr>
    <td style="width:15%;text-align:right;">用户名：</td>
    <td><input type="text" class="textBox length-middle" name="uname"/></td>
   </tr>
   <tr>
    <td style="text-align:right;">用户头像：</td>
    <td>
     <input type="file" id="suoluetu" class="hide" name="image" accept="image/*"/>
     <label for="suoluetu" class="labelBtnAdd">+</label>
     <img src="" width="60" height="60" class="mlr5" id="imgShow"/>
    </td>
   </tr>
   <tr>
    <td style="text-align:right;">性别：</td>
    <td>
     <select class="textBox" name="usex">
      <option value="男">男</option>
      <option value="女">女</option>
     </select>
    </td>
   </tr>
   <tr>
    <td style="text-align:right;">用户邮箱：</td>
    <td><input type="text" class="textBox length-middle" name="email"/></td>
   </tr>
   <tr>
    <td style="text-align:right;">设置密码：</td>
    <td><input type="password" class="textBox length-middle" name="upwd"/></td>
   </tr>
   <tr>
    <td style="text-align:right;">手机号码：</td>
    <td><input type="text" class="textBox length-middle" name="uphone"/></td>
   </tr>
   <tr>
    <td style="text-align:right;">用户地址：</td>
    <td><input type="text" class="textBox length-middle" name="address"/></td>
   </tr>
   <tr>
    <td style="text-align:right;"></td>
    <td><input type="submit" class="tdBtn" value="添加新用户"/></td>
   </tr>
  </table>
  </form>
 </div>
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