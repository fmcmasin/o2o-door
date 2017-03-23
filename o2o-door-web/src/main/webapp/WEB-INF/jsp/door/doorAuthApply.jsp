<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>权限申请</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<%@include file="../common/common.jsp"%>
<link rel="shortcut icon" href="assets/ico/minus.png">
<style type="text/css">
th, tr {
	text-align: center;
}

.button_div button {
	margin-left: 5px;
}

.button_div p {
	margin-top: 7px;
	float: left;
}
</style>
</head>
<body>
	<div class="container-fluid paper-wrap bevel tlbr">
		<!-- CONTENT -->
		<!--TITLE -->
		<div class="row">
			<div id="paper-top">
				<div class="col-sm-3">
					<h2 class="tittle-content-header">
						<i class="icon-window"></i> <span> <strong>权限申请</strong>
						</span>
					</h2>
				</div>
				<div class="col-sm-7">
					<div class="devider-vertical visible-lg"></div>
					<div class="tittle-middle-header">
						<div class="alert">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<span class="tittle-alert entypo-info-circled"></span>
							管理人员对门禁权限进行控制。
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ TITLE -->
		<!-- BREADCRUMB -->
		<ul id="breadcrumb">
			<li><span class="entypo-home"></span></li>
			<li><i class="fa fa-lg fa-angle-right"></i></li>
			<li><a href="#" title="Sample page 1">门禁管理</a></li>
			<li><i class="fa fa-lg fa-angle-right"></i></li>
			<li><a href="#" title="Sample page 1">权限管理</a></li>
			<li><i class="fa fa-lg fa-angle-right"></i></li>
			<li><a href="#" title="Sample page 1">权限申请</a></li>
		</ul>
		<!-- END OF BREADCRUMB -->
		<!--  DEVICE MANAGER -->
		<div class="content-wrap">
			<div class="row">
				<div class="col-sm-12">
					<div class="nest" id="FilteringClose">
						<div class="title-alt">
							<h6>权限申请</h6>
						</div>
						<div class="body-nest" id="Blank_Page_Content">
							<div class="row">
								<!-- edit form column -->
								<div class="col-md-12 personal-info">
									<form class="form-horizontal" role="form">
										<div class="row">
											<div class="body-nest">
												<div class="form-group col-xs-3 row">
                                                    <label class="col-lg-4 control-label">楼栋</label>
                                                    <div class="col-sm-7">
                                                        <select id="building_list" class="filter-status form-control">
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group col-xs-3 row">
                                                    <label class="col-lg-4 control-label">单元</label>
                                                    <div class="col-sm-7">
                                                        <select id="unit_list" class="filter-status form-control">
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group col-xs-3 row">
                                                    <label class="col-lg-4 control-label">房号</label>
                                                    <div class="col-sm-7">
                                                        <select id="house_list" class="filter-status form-control">
                                                        </select>
                                                    </div>
                                                </div>
												<div class="form-group col-xs-3 row">
													<label class="col-lg-4 control-label">姓名</label>
													<div class="col-sm-7">
														<input type="text" class="form-control" id="name" />
													</div>
												</div>
												<div class="form-group col-xs-3 row">
													<label class="col-lg-4 control-label">电话</label>
													<div class="col-sm-7">
														<input type="text" class="form-control" id="tel" />
													</div>
												</div>
												<div class="form-group col-xs-3 row">
													<label class="col-lg-4 control-label">审批状态</label>
													<div class="col-sm-7">
														<select class="filter-status form-control fh" id="statu">
															<option value="wappr">待审批</option>
															<option value="appr">已通过</option>
															<option value="rappr">已禁止</option>
														</select>
													</div>
												</div>
												<div class="form-group col-xs-6 control-label">
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
																		<p>权限申请列表</p>
																	</td>
																</tr>
																<tr>
																	<th myColName="buid" myOrder>楼栋</th>
																	<th myColName="unit" myOrder>单元</th>
																	<th myColName="house" myOrder>房号</th>
																	<th myColName="username" myOrder>姓名</th>
																	<th myColName="wechatname" myOrder>微信昵称</th>
																	<th myColName="tel" myOrder>电话</th>
																	<th myColName="doorname" myOrder>申请门禁权限</th>
																	<th myColName="remarks" myOrder>备注</th>
																	<th myColName="status" myOrder>审批状态</th>
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
	<!-- MAIN EFFECT -->
	<%@include file="../common/foot.jsp"%>
	<script type="text/javascript">
$(function (){
	tableLoad();   //刷新页面表格
	//selectLoad();  //加载楼栋单元房号下拉框
});

$('#serach').click(function(){
	tableLoad();   //查询
});

//审核通过
function appr(userid,doorid){
	$.ajax({
		async:false,
		cache : false,
		type : "post",
		url: 'doorAuth/updateStatus.do',
		datatype:"json",
		data:{'userid':userid,'doorid':doorid,'status':'appr'},       
		success: function(json){
			alert(json);
			$('#footable-res2').myJqueryTable('refresh');
		},error: function (data, status, e){
		    alert("【服务器异常，请联系管理员！】"+e);
		}
	});
	
}
//审核不通过
function rappr(userid,doorid){
	$.ajax({
		async:false,
		cache : false,
		type : "post",
		url: 'doorAuth/updateStatus.do',
		datatype:"json",
		data:{'userid':userid,'doorid':doorid,'status':'rappr'},       
		success: function(json){
			alert(json);
			$('#footable-res2').myJqueryTable('refresh');
		},error: function (data, status, e){
		    alert("【服务器异常，请联系管理员！】"+e);
		}
	});
	
}
//用于条件搜索记录和第一次进入查询包含分页
function tableLoad() {
	var _username = $("#name").val(); //姓名
	var _bid = $("#bid").val(); //楼栋
	var _uid = $("#uid").val(); //单元
	var _hid = $("#house").val(); //房号
	var _tel = $("#tel").val(); //电话
	var _status = $("#statu").val(); //状态
	$('#footable-res2').myJqueryTable({
		url : 'doorAuth/index.do',
		data : {
			"vid" :1,  //当前小区
			"bid" : _bid,
			"uid" : _uid,
			"username" : _username,
			"tel" : _tel,
			"hid" : _hid,
			"status" : _status,
		},
		pageSize : 10,
		success : function(items) {
		}
	});
}
//操作栏位
function myTabCol_operation(row) {
	var str=null;
	if(row.status=='待审批'){
		str = "<button type='button' class='btn btn-primary  fontawesome-ok-sign' onclick='appr("
			+ row.userid+","+row.doorid+",appr"
			+ ")' >&nbsp;审批</button>";
	    str += "&nbsp;&nbsp;<button type='button' class='btn btn-danger fontawesome-minus-sign' onclick='rappr("
			+ row.userid+","+row.doorid+",rappr"
			+ ")'>&nbsp;禁止</button>";
	}else{
		str = "<button type='button' class='btn btn-primary  fontawesome-ok-sign' disabled='disabled' onclick='appr("
			+ row.userid+","+row.doorid+",appr"
			+ ")' >&nbsp;审批</button>";
	    str += "&nbsp;&nbsp;<button type='button' class='btn btn-danger fontawesome-minus-sign' disabled='disabled' onclick='rappr("
			+ row.userid+","+row.doorid+",rappr"
			+ ")'>&nbsp;禁止</button>";
	}
	return str;
}

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


function selectUnit(bid){
	$('#unit_list').mySelect({
    	id:"id",
   		text:"name",
   		url:"house/unitList.do",
   		data:{"bid":bid},
   		success:function(){
	    	selectHouse($('#unit_list').val());
	    },
	    selectChange:function(value){
	    	selectHouse(value);
	    }
   	});
}

function selectHouse(uid){
	$('#house_list').mySelect({
    	id:"id",
   		text:"address",
   		url:'house/houseList.do',
   		data:{"uid":uid},
   		success:function(items){
   		//	tableLoad();
	    },
	    selectChange:function(value,row){
	    //	tableLoad();
	    }
   	});
}
</script>
</body>
</html>