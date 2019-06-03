<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="./../htgl/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="./../htgl/js/jquery.js"></script>
<script src="./../htgl/js/public.js"></script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="user"></i><em>用户列表</em></span>
    <span class="modular fr"><a href="/shoppe/admin/add_user" class="pt-link-btn">+添加用户</a></span>
  </div>
  <div class="operate">
   <form>
    <input type="text" class="textBox length-long" placeholder="输入用户昵称、手机号码..."/>
    <input type="button" value="查询" class="tdBtn"/>
   </form>
  </div>
  <table class="list-style Interlaced">
   <tr>
     <th>编号</th>
     <th>头像</th>
     <th>用户昵称</th>
     <th>邮件地址</th>
     <th>手机号码</th>
     <th>收货地址</th>
     <th>操作</th>
   </tr>
   <c:forEach items="${userList }" var="u">
   <tr>
	    <td class="center">
	     <input type="checkbox"/>
	     <span class="middle">${u.uid }</span>
	    </td>
	    <td class="center pic-area"><img src="./../images/user/${u.uimage }" class="thumbnail"/></td>
	    <td class="center">${u.uname }</td>
	    <td class="center">${u.email }</td>
	    <td class="center">${u.uphone }</td>
	    <td class="center">${u.address }</td>
	    <td class="center">
	     <a href="/shoppe/admin/edit_user?uid=${u.uid }" class="inline-block" title="编辑"><img src="./../htgl/images/icon_edit.gif"/></a>
	     <a href="/shoppe/admin/del_user?uid=${u.uid }" class="inline-block" title="删除"><img src="./../htgl/images/icon_drop.gif"/></a>
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
      <a href="/shoppe/admin/user_list?start=0">首页</a>
     <a href="/shoppe/admin/user_list?start=${page.start-page.count }">上一页</a>
     <a href="/shoppe/admin/user_list?start=${page.start+page.count }">下一页</a>
	   <a href="/shoppe/admin/user_list?start=${page.end }">尾页</a>
	  </div>
  </div>
 </div>
</body>
</html>