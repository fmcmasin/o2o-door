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
													<label class="col-sm-5 control-label">名称</label>
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
																	<td colspan="10" style="font-weight: bold"
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
																	<th myColName="doortypedec" myOrder>门类型</th>
																	<th myColName="rketypedec" myOrder>门禁类型</th>
																	<th myColName="remarks" myOrder>备注</th>
																	<th myColName="myTabCol_operation">操作</th>
																</tr>
															</thead>
															</tbody>
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
						<button class="btn btn-info filter-api" id="save"
							title="Filter using the Filter API" style="margin-left: 100px;">保存</button>
					</div>
				</div>
				<div class="body-nest" id="tableStatic1"
					style="background: transparent;">
					<label class="row"> 主要信息 </label>
					<div class="row">
						<div class="col-sm-2">
							<label class="pull-right" style="line-height: 30px;">名称</label>
						</div>
						<div class="col-sm-2">
							<input class="form-control" type="text" id="doorname" >
							<input class="form-control" type="hidden" id="id">
						</div>
						<div class="col-sm-2">
							<label class="pull-right" style="line-height: 30px;">设备ID</label>
						</div>
						<div class="col-sm-2">
							<input class="form-control" type="text" id="devicecode"
								name="devicecode">
						</div>
						<div class="col-sm-2">
							<label class="pull-right" style="line-height: 30px;">门禁类型</label>
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
							<label class="pull-right" style="line-height: 30px;">门类型</label>
						</div>
						<div class="col-sm-2">
							<select id="doortype" class="filter-status form-control">
								<option value=""></option>
								<option value="cmdoor">小区公共门</option>
								<option value="custdoor">楼栋单元门</option>
							</select>
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
				</div>
			</form>
		</label>
	</div>
	<!-- MAIN EFFECT -->
	<%@include file="../common/foot.jsp"%>
	<script type="text/javascript">
$(function (){
	tableLoad();   //刷新页面表格
});

$('#serach').click(function(){
	tableLoad();   //查询
});

//编辑门
function editdoor(id){
     $(".mask").show();
     $( "#Dialog1" ).dialog( "open" );
     $(".change_label").html("编辑门");
     
     $.ajax({
			async:false,
    		cache : false,
			type : "post",
			url: '<%=basePath%>door/index/Detail.do',
			datatype:"json",
			data:{id:id},       
			success: function(json){
				var  data = eval("("+json+")"); 
				$('#id').val(data.id);  //id
				$('#doorname').val(data.name);  //门
				$('#devicecode').val(data.devicecode);  //设备编码
				$('#rketype').val(data.rketype);  //门禁类型
				$('#doortype').val(data.doortype);  //门类型
				$('#remarks').val(data.remarks);  //备注
			},
			 error: function(XMLHttpRequest, textStatus, errorThrown) {
				 alert(XMLHttpRequest.status);
				 alert(XMLHttpRequest.readyState);
				 alert(textStatus);
			 }
	});
	
}

//保存
$('#save').click(function(){
	var id = $('#id').val();
	var url =null;
	//判断是编辑门还是更改门
	if(id){
		 url ="<%=basePath%>door/update/Door.do";   
	}else{
		 url ="<%=basePath%>door/add/Door.do";
	}
	
	var json ={'id':id,'name':$('#doorname').val(),'devicecode':$('#devicecode').val(),'rketype':$('#rketype').val(),
			'doortype':$('#doortype').val(),'remarks':$('#remarks').val()};
	
	$.ajax({
		async:false,
		cache : false,
		type : "post",
		url: url,
		datatype:"json",
		data:json,       
		success: function(json){
			alert('保存成功！');
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			 alert(XMLHttpRequest.status);
			 alert(XMLHttpRequest.readyState);
			 alert(textStatus);
		}
});

	
	
});

//删除门
function deletedoor(id){
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
					alert("删除成功！");
					$('#footable-res2').myJqueryTable('refresh');
				},
			});

		}

		//用于条件搜索记录和第一次进入查询包含分页
		function tableLoad() {
			var name = $("#dname").val(); //门名称
			var doortype = $("#dtype").val(); //门类型
			var rketype = $("#rtype").val(); //门禁类型
			$('#footable-res2').myJqueryTable({
				url : 'door/index.do',
				data : {
					"name" : name,
					"doortype" : doortype,
					"rketype" : rketype
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
	</script>

	<script type="text/javascript">
		$(function() {
			var button_del_1 = $(".button_del");
			var edit = $(".edit");
			for (var i = 0; i < button_del_1.length; i++) {
				$(button_del_1[i]).click(function() {
					;
					del(this);
				});
				$(edit[i]).click(function() {
					;
					var type = $(this).parent().prev().prev().html();
					if (type === "楼栋单元门") {
						$('.select_hide').show();
					}
				});
			}

			$("#Dialog1").dialog({
				autoOpen : false,
				height : "600", //高度
				width : "900", //宽度
				close : function() {
					$(".mask").hide();
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

			$("#addToMask").click(function() {
				$(".mask").show();
				$("#Dialog1").dialog("open");
				$("#this_form")[0].reset();
				$(".change_label").html("新增门");
			});

			$("#doortype").change(function() {
				var opt = $("#mySelect").val();
				if (opt === "楼栋单元门") {
					$('.select_hide').show();
				} else {
					$('.select_hide').hide();
				}
			});

		});
		function del(_a) {
			if ($(_a).parent().parent().next()) {
				var trs = $(_a).parent().parent().nextAll("tr");
				trs.each(function() {
					var val = $(this).find("td").eq(0).html();
					$(this).find("td").eq(0).html(val - 1);
				});
			}
			$(_a).parent().parent().remove();
		}
	</script>
</body>
</html>
