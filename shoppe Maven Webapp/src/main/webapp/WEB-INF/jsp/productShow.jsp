<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Nav tabs -->
<ul class="nav nav-tabs m-b-20" role="tablist">
    <li role="presentation">
        <a href="javascript:void(0);" aria-controls="tab-description" role="tab" data-toggle="tab" onclick="productShow(1,0)">
            <p>
                <img src="../images/25.jpg" alt="image">
            </p>蔬菜</a>
    </li>
    <li role="presentation">
        <a href="javascript:void(0);" aria-controls="tab-review" role="tab" data-toggle="tab" onclick="productShow(2,0)">
            <p>
                <img src="../images/17.jpg" alt="image">
            </p>水果</a>
    </li>
    <li role="presentation">
        <a href="javascript:void(0);" aria-controls="tab-review" role="tab" data-toggle="tab" onclick="productShow(3,0)">
            <p>
                <img src="../images/xia2.jpg" alt="image">
            </p>海鲜</a>
    </li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="tab-description">
        <div class="row">
            <c:forEach items="${plist }" var="p">
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <!-- Product item -->
                    <div class="product-item">
                        <a href="/shoppe/product/productDetail?pid=${p.pid }">
                            <img src="../images/product/${p.pimage }" alt="image">
                        </a>
                        <div class="product-caption">
                            <h4 class="product-name">
                                <a href="#">${p.pname }</a>
                            </h4>
                            <div class="product-price-group">
                                <span class="product-price">$${p.price }</span>
                            </div>
                            <div class="ht-btn-group">
                                <a href="javascript:void(0);" class="wishlist_btn" onclick="addCollect(${p.pid },${user.uid })">
                                    <i class="fa fa-heart-o"></i>
                                </a>
                                <a href="javascript:void(0);" onclick="addProduct(${p.pid },${user.uid })">Add to cart</a>
                                <a href="#" class="compare_btn">
                                    <i class="fa fa-exchange"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- Nav tabs -->
<ul class="nav nav-tabs m-b-20" role="tablist">
    <li role="presentation">
        <a href="javascript:void(0);" aria-controls="tab-description" role="tab" data-toggle="tab" onclick="productShow(${tid},0)">
            <p>
                <img src="../images/25.jpg" alt="image">
            </p>首页</a>
    </li>
    <li role="presentation">
        <a href="javascript:void(0);" aria-controls="tab-review" role="tab" data-toggle="tab" onclick="productShow(${tid},${page.start-page.count })">
            <p>
                <img src="../images/17.jpg" alt="image">
            </p>上一页</a>
    </li>
    <li role="presentation">
        <a href="javascript:void(0);" aria-controls="tab-review" role="tab" data-toggle="tab" onclick="productShow(${tid},${page.start+page.count })">
            <p>
                <img src="../images/6.jpg" alt="image">
            </p>下一页</a>
    </li>
    <li role="presentation">
        <a href="javascript:void(0);" aria-controls="tab-review" role="tab" data-toggle="tab" onclick="productShow(${tid},${page.end })">
            <p>
                <img src="../images/9.jpg" alt="image">
            </p>末页</a>
    </li>
</ul>