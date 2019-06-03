<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>商品修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="./../htgl/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="./../js/jquery/jquery-2.2.4.min.js"></script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="add"></i><em>修改商品</em></span>
    <span class="modular fr"><a href="/shoppe/admin/product_list" class="pt-link-btn">商品列表</a></span>
  </div>
  <form action="/shoppe/admin/isEdit_product?pid=${editProduct.pid }&pimage=${editProduct.pimage }" method="post" enctype="multipart/form-data">
  <table class="list-style">
   <tr>
    <td style="text-align:right;width:15%;">商品名称：</td>
    <td><input type="text" class="textBox length-long" name="pname" value="${editProduct.pname }"/></td>
   </tr>
   <tr>
    <td style="text-align:right;">商品分类：</td>
    <td>
     <select class="textBox" name="tid">
      <c:if test="${editProduct.tid eq '1' or editProduct.tid eq '0' }">
      	<option value="1">蔬菜</option>
      	<option value="2">水果</option>
      	<option value="3">海鲜</option>
      </c:if>
      <c:if test="${editProduct.tid eq '2' }">
      	<option value="2">水果</option>
      	<option value="1">蔬菜</option>
      	<option value="3">海鲜</option>
      </c:if>
      <c:if test="${editProduct.tid eq '3' }">
      	<option value="3">海鲜</option>
      	<option value="1">蔬菜</option>
      	<option value="2">水果</option>
      </c:if>
     </select>
    </td>
   </tr>
   <tr>
    <td style="text-align:right;">单价：</td>
    <td>
     <input type="text" class="textBox length-short" name="price" value="${editProduct.price }"/>
     <span>元</span>
    </td>
   </tr>
   <tr>
    <td style="text-align:right;">库存：</td>
    <td>
     <input type="text" class="textBox length-short" name="pnum" value="${editProduct.pnum }"/>
     <span>个</span>
    </td>
   </tr>
   <tr>
    <td style="text-align:right;">商品描述：</td>
    <td><input type="text" class="textBox length-long" name="pdesc" value="${editProduct.pdesc }"/></td>
   </tr>
   <tr>
    <td style="text-align:right;">推荐：</td>
    <td>
     <select class="textBox" name="rid">
     <c:if test="${editProduct.rid eq '1' or editProduct.rid eq '0'}">
      <option value="1">热销</option>
      <option value="2">新品</option>
      <option value="3">精品</option>
      </c:if>
      <c:if test="${editProduct.rid eq '2' }">
      <option value="2">新品</option>
      <option value="1">热销</option>
      <option value="3">精品</option>
      </c:if>
      <c:if test="${editProduct.rid eq '3' }">
      <option value="3">精品</option>
      <option value="1">热销</option>
      <option value="2">新品</option>
      </c:if>
     </select>
    </td>
   </tr>
   
   <tr>
    <td style="text-align:right;">商品图片：</td>
    <td>
     <input type="file" id="suoluetu" class="hide" name="image" accept="image/*"/>
     <label for="suoluetu" class="labelBtnAdd">+</label>
     <img src="./../images/product/${editProduct.pimage }" width="60" height="60" class="mlr5" id="imgShow"/>
    </td>
   </tr>
   
   <tr>
    <td style="text-align:right;">商品详情：</td>
    <td><textarea class="textarea" name="pdeta">${editProduct.pdeta }</textarea></td>
   </tr>
   <tr>
    <td style="text-align:right;"></td>
    <td><input type="submit" value="修改商品" class="tdBtn"/></td>
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