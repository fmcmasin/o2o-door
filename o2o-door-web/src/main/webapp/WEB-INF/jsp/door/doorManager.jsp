<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>门管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<%@include file="../common/common.jsp"%>
<script src="jQueryAssets/jquery-1.11.1.min.js"></script>
<link rel="shortcut icon" href="assets/ico/minus.png">
<link href="jQueryAssets/jquery.ui.core.min.css" rel="stylesheet"
	type="text/css">
<link href="jQueryAssets/jquery.ui.theme.min.css" rel="stylesheet"
	type="text/css">
<link href="jQueryAssets/jquery.ui.dialog.min.css" rel="stylesheet"
	type="text/css">
<link href="jQueryAssets/jquery.ui.resizable.min.css" rel="stylesheet"
	type="text/css">
<style type="text/css">
th, tr {
	text-align: center;
}

.mask {
	width: 100%;
	height: 100%;
	background: #000;
	opacity: 0.8;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 100;
	display: none;
}

.button_div button {
	margin-left: 5px;
}

.button_div p {
	margin-top: 7px;
	float: left;
}

.select_hide {
	display: none;
}
</style>
</head>
<body>
	<div class="container-fluid paper-wrap bevel tlbr">
		<div class="row">
			<div id="paper-top">
				<div class="col-sm-3">
					<h2 class="tittle-content-header">
						<i class="icon-window"></i> <span> <strong>门管理</strong>
						</span>
					</h2>
				</div>
				<div class="col-sm-7">
					<div class="devider-vertical visible-lg"></div>
					<div class="tittle-middle-header">
						<div class="alert">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<span class="tittle-alert entypo-info-circled"></span>
							管理人员对门进行管理。
						</div>
					</div>
				</div>
			</div>
		</div>
		<ul id="breadcrumb">
			<li><span class="entypo-home"></span></li>
			<li><i class="fa fa-lg fa-angle-right"></i></li>
			<li><a href="#" title="Sample page 1">门禁管理</a></li>
			<li><i class="fa fa-lg fa-angle-right"></i></li>
			<li><a href="#" title="Sample page 1">基础设施</a></li>
			<li><i class="fa fa-lg fa-angle-right"></i></li>
			<li><a href="#" title="Sample page 1">门管理</a></li>
		</ul>
		<div class="content-wrap">
			<div class="mask"></div>
			<div class="row">
				<div class="col-sm-12">
					<div class="nest" id="FilteringClose">
						<div class="title-alt">
							<h6>门管理</h6>
						</div>
						<div class="body-nest" id="Blank_Page_Content">
							<div class="row">
								<!-- edit form column -->
								<div class="col-md-12 personal-info">
									<form class="form-horizontal" role="form">
										<div class="row">
											<div class="body-nest">
												<div class="form-group col-xs-3 row">
													<label class="col-lg-4 control-label">名称</label>
													<div class="col-sm-7">
														<input type="text" class="form-control" id="dname"
															name="name" />
													</div>
												</div>
												<div class="form-group col-xs-4 row">
													<label class="col-sm-5 control-label">门类型</label>
													<div class="col-sm-7">
														<select class="filter-status form-control" id="dtype"
															name="doortype">
															<option value="cmdoor">小区公共门</option>
															<option value="custdoor">楼栋单元门</option>
														</select>
													</div>
												</div>
												<div class="form-group col-xs-4 row">
													<label class="col-sm-6 control-label">门禁类型</label>
													<div class="col-sm-6">
														<select class="filter-status form-control" id="rtype"
															name="rketype">
															<option value="smrdoor">智能门禁</option>
															<option value="macdoor">机械门禁</option>
															<option value="other">其他</option>
														</select>
													</div>
												</div>
												<div class="col-xs-1">
													<a id="serach"
														class="pull-right btn btn-info filter-api entypo-search"
														title="Filter using the Filter API">&nbsp;搜索</a>
												</div>
												<div class="col-xs-12 row">
													<div class="body-nest">
														<table class="table table-bordered cf tb"
															id="footable-res2">
															<thead class="cf">
																<tr>
																	<td colspan="6" style="font-weight: bold"
																		class="button_div">
																		<p>门管理列表</p>
																		<button type="button"
																			class="btn btn-primary pull-right entypo-plus-squared"
																			id="addToMask">新增</button>
																	</td>
																</tr>
																<tr>
																	<th myColName="name" myOrder>名称</th>
																	<th myColName="devicecode" myOrder>设备ID</th>
																	<th myColName="doortype" myOrder>门类型</th>
																	<th myColName="rketype" myOrder>门禁类型</th>
																	<th myColName="remarks" myOrder>备注</th>
																	<th myColName="myTabCol_operation">操作</th>
																</tr>
															</thead>
														</table>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="Dialog1"
		style="display: none; position: relative; z-index: 10000;">
		<label class="col-md-12 personal-info">
			<form id="this_form" class="form-horizontal" role="form">
				<div class="form-group" style="margin-left: 0; margin-right: 0;">
					<label class="col-sm-6 change_label" style="line-height: 50px; font-size: 20px;"></label>
					<div class="col-sm-2 pull-right" style="line-height: 50px;">
						<a class="btn btn-info filter-api" id="save"
							title="Filter using the Filter API" style="margin-left: 100px;">保存</a>
					</div>
				</div>
				<div class="body-nest" id="tableStatic1"
					style="background: transparent;">
					<label class="row"> 主要信息 </label>
					<div class="row">
						<div class="col-sm-2">
							<label class="pull-right" style="line-height: 30px;"><span calss="mark" style="color: red">*</span>名称</label>
						</div>
						<div class="col-sm-2">
							<input class="form-control" type="text" id="doorname" >
							<input class="form-control" type="hidden" id="id">
						</div>
						<div class="col-sm-2">
							<label class="pull-right" style="line-height: 30px;"><span calss="mark" style="color: red">*</span>设备ID</label>
						</div>
						<div class="col-sm-2">
							<input class="form-control" type="text" id="devicecode"
								name="devicecode">
						</div>
						<div class="col-sm-2">
							<label class="pull-right" style="line-height: 30px;"><span calss="mark" style="color: red">*</span>门禁类型</label>
						</div>
						<div class="col-sm-2">
							<select class="filter-status form-control" id="rketype"
								name="rketype">
								<option value=""></option>
								<option value="smrdoor">智能门禁</option>
								<option value="macdoor">机械门禁</option>
								<option value="other">其他</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2">
							<label class="pull-right" style="line-height: 30px;"><span calss="mark" style="color: red">*</span>门类型</label>
						</div>
						<div class="col-sm-2">
							<select id="doortype" class="filter-status form-control">
								<option value=""></option>
								<option value="cmdoor">小区公共门</option>
								<option value="custdoor">楼栋单元门</option>
							</select>
						</div>
						 <div class="col-sm-2"><label class="pull-right  select_hide" style="line-height: 30px;">楼栋</label></div>
                    	<div class="col-sm-2 ">
	                        <select id="building_list" class="filter-status form-control select_hide">
	                            <option value=""></option>
	                            <option value="1">1栋</option>
	                            <option value="2">2栋</option>
	                            <option value="3">3栋</option>
	                        </select>
                    	</div>
	                    <div class="col-sm-2 select_hide"><label class="pull-right" style="line-height: 30px;">单元</label></div>
	                    <div class="col-sm-2 select_hide">
	                        <select id="unit_list" class="filter-status form-control ">
	                            <option value=""></option>
	                            <option value="1">1单元</option>
	                            <option value="2">2单元</option>
	                            <option value="3">3单元</option>
	                        </select>
	                    </div>
                	</div>
				</div>
					<div class="row">
						<div class="col-sm-2">
							<label class="pull-right" style="line-height: 30px;">备注</label>
						</div>
						<div class="col-sm-10">
							<input class="form-control" type="text" id="remarks"
								name="remarks">
						</div>
					</div>
			</form>
		</label>
	</div>
	<!-- MAIN EFFECT -->
<%@include file="../common/foot.jsp"%>
<script type="text/javascript">
$(function (){
	tableLoad();   //刷新页面表格
    //初始化弹出框
	$("#Dialog1").dialog({
		autoOpen : false,
		height : "600", //高度
		width : "900", //宽度
		close : function() {
			$(".mask").hide();
			$('#ui-id-1').html('&nbsp;');
		},
		position : {
			using : function(pos) {
				console.log(pos);
				var topOffset = $(this).css(pos).offset().top;
				if (topOffset = 0 || topOffset > 0) {
					$(this).css('top', 80);
				}
			}
		}
	});
});

$('#serach').click(function(){
	tableLoad();   //查询
});

//弹出新增界面
$("#addToMask").click(function() {
	$(".mask").show();
	$("#Dialog1").dialog("open");
	$("#this_form")[0].reset();
	$(".change_label").html("新增门");
	$(".ui-button-text").css('display','none');
});

$("#doortype").change(function(){
    var opt=$("#doortype").val();
    if(opt==="custdoor"){
        $('.select_hide').show();
        //选择了楼栋之后出现楼栋下拉框
        //selectLoad()()
    }else{
        $('.select_hide').hide();
    }
});

//保存
$('#save').click(function(){
	var name = $('#doorname').val();
	var devicecode = $('#devicecode').val();
	var rketype = $('#rketype').val();
	var doortype = $('#doortype').val();
	if(name==null||name.trim().length==0){
		$('#ui-id-1').text("请输入名称！");
		return;
	}
	if(devicecode==null||devicecode.trim().length==0){
		$('#ui-id-1').text("请输设备ID！");
		return;
	}
	if(rketype==null||rketype.trim().length==0){
		$('#ui-id-1').text("请输入门禁类型！");
		return;
	}
	if(doortype==null||doortype.trim().length==0){
		$('#ui-id-1').text("请输入门类型！");
		return;
	}
	var _id = $('#id').val();
	var _url =null;
	//判断是编辑门还是新增门,有Id则是编辑门
	if(_id){
		_url ="<%=basePath%>door/update/Door.do";   
	}else{
		_url ="<%=basePath%>door/add/Door.do";
	}
	
	var json ={'id':_id,'name':name,'devicecode':devicecode,'rketype':rketype,
			'doortype':doortype,'remarks':$('#remarks').val(),'vid':1,'bid':$('#building_list').val(),'uid':$('#unit_list').val()};
	
	$.ajax({
		async:false,
		cache : false,
		type : "post",
		url: _url,
		datatype:"json",
		data:json,       
		success: function(json){
			alert(json);
			$( "#Dialog1" ).dialog( "close" );
			$('#footable-res2').myJqueryTable('refresh');
			$('#id').val("");  //清除  id  标识
			$('#ui-id-1').html('&nbsp;');
		},
		error: function(data, status, e) {
			 alert("【服务器异常，请联系管理员！】"+e);
		}
	});

});
</script>
<script type="text/javascript">
//编辑门
function editdoor(id){
     $(".mask").show();
     $( "#Dialog1" ).dialog( "open" );
     $(".change_label").html("编辑门");
     $(".ui-button-text").css('display','none');
     $.ajax({
			async:false,
    		cache : false,
			type : "post",
			url: '<%=basePath%>door/index/Detail.do',
			datatype:"json",
			data:{id:id},       
			success: function(json){
				var  data = eval("("+json+")"); 
				$('#id').val(data.id);  //门id
				$('#doorname').val(data.name);  //门
				$('#devicecode').val(data.devicecode);  //设备编码
				$('#rketype').val(data.rketype);  //门禁类型
				$('#doortype').val(data.doortype);  //门类型
				$('#remarks').val(data.remarks);  //备注
			},
			 error: function(data, status, e) {
				 alert("【服务器异常，请联系管理员！】"+e);
			 }
	});
	
}

//删除门
function deletedoor(id){
	if(!confirm("确认要删除？")){
    	return;
   	}
    $.ajax({
		async:false,
  	   cache : false,
		type : "post",
		url: '<%=basePath%>door/delete/Door.do',
			datatype : "json",
			data : {
				id : id
			},
			success : function(json) {
				alert(json);
				$('#footable-res2').myJqueryTable('refresh');
			},error: function (data, status, e){
			    alert("【服务器异常，请联系管理员！】"+e);
			}
	});

}

//用于条件搜索记录和第一次进入查询包含分页
function tableLoad() {
	var _door_name = $("#dname").val(); //门名称
	var _door_type = $("#dtype").val(); //门类型
	var _rketype = $("#rtype").val(); //门禁类型
	$('#footable-res2').myJqueryTable({
		url : 'door/index.do',
		data : {
			"vid":1, //小区 id
			"name" : _door_name,
			"doortype" : _door_type,
			"rketype" : _rketype
		},
		pageSize : 10,
		success : function(items) {
		}
	});
}

//操作栏位
function myTabCol_operation(row) {
	var str = "<button type='button' class='btn btn-success house edit' onclick='editdoor("
			+ row.id
			+ ")' ><span class='entypo-pencil'></span>&nbsp;&nbsp;编辑</button>";
	str += "&nbsp;&nbsp;<button type='button' class='btn btn-danger' onclick='deletedoor("
			+ row.id
			+ ")'><span class='entypo-cancel-squared'></span>&nbsp;&nbsp;删除</button>";
	return str;
}

//查询楼栋
function selectLoad(){
	$('#building_list').mySelect({
    	id:"id",
   		text:"name",
   		url:"house/buildingList.do",
   		success:function(){
	    	selectUnit($('#building_list').val());
	    },
	    selectChange:function(value){
	    	selectUnit(value);
	    }
   	});
}

//查询单元
function selectUnit(bid){
	$('#unit_list').mySelect({
    	id:"id",
   		text:"name",
   		url:"house/unitList.do",
   		data:{"bid":bid},
   		success:function(){
	    },
   	});
}
</script>
</body>
</html>