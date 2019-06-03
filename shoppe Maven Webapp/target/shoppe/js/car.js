//购物车总计
function carSum(){
    var sum=0;
    var i=0;
    $("li.ii").each(function(){
        var price=$(this).children().children(".media-body").children("p").children("span").eq(0).text();
        var num=$(this).children().children(".media-body").children("p").children("span").eq(2).text();
        sum=sum+price*num;
    });
    $("#sum").text("$"+sum);
};

//添加购物车
function addProduct(pid,uid){
	$.ajax({
		async:false,
		url:"/shoppe/car/add",
		dataType:"json",
		data:{"pid":pid,"uid":uid},
		success:function(msg){
			//window.location.reload();
			$("#car").load(location.href+" #car");
		}
	});
};

//删除购物车
function delProduct(pid,uid){
	$.ajax({
		async:false,
		url:"/shoppe/car/del",
		dataType:"json",
		data:{"pid":pid,"uid":uid},
		success:function(msg){
			//window.location.reload();
			$("#car").load(location.href+" #car");
		}
	});
};