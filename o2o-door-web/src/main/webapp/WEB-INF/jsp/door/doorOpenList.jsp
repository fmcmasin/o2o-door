<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>开门记录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Le styles -->
<%@include file="../common/common.jsp"%>
<script type="text/javascript" src="assets/js/jquery.js"></script>

<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/loader-style.css">
<link rel="stylesheet" href="assets/css/bootstrap.css">

<link rel="stylesheet"
	href="assets/js/timepicker/bootstrap-timepicker.css">
<link rel="stylesheet" href="assets/js/datepicker/datepicker.css">

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
<link rel="shortcut icon" href="assets/ico/minus.png">
</head>

<body>
	<div class="container-fluid paper-wrap bevel tlbr">
		<!-- CONTENT -->
		<!--TITLE -->
		<div class="row">
			<div id="paper-top">
				<div class="col-sm-3">
					<h2 class="tittle-content-header">
						<i class="icon-window"></i> <span> <strong>记录列表</strong>
						</span>
					</h2>
				</div>
				<div class="col-sm-7">
					<div class="devider-vertical visible-lg"></div>
					<div class="tittle-middle-header">
						<div class="alert">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<span class="tittle-alert entypo-info-circled"></span>
							管理人开门记录进行查询。
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
			<li><a href="#" title="Sample page 1">开门记录</a></li>
			<li><i class="fa fa-lg fa-angle-right"></i></li>
			<li><a href="#" title="Sample page 1">记录列表</a></li>
		</ul>
		<div class="content-wrap">
			<div class="row">
				<div class="col-sm-12">
					<div class="nest" id="FilteringClose">
						<div class="title-alt">
							<h6>记录列表</h6>
						</div>
						<div class="body-nest" id="Blank_Page_Content">
							<div class="row">
								<!-- edit form column -->
								<div class="col-md-12 personal-info">
									<form class="form-horizontal" role="form">
										<div class="row">
											<div class="body-nest">
												<div class="form-group col-xs-3 row">
													<label class="col-lg-4 control-label">姓名</label>
													<div class="col-sm-7">
														<input type="text" class="form-control" id ="username"/>
													</div>
												</div>
												<div class="form-group col-xs-3 row">
													<label class="col-lg-4 control-label">身份</label>
													<div class="col-sm-7">
														<select class="filter-status form-control" id="isowner">
															<option value=""></option>
															<option value="0">业主</option>
															<option value="1">业主家属</option>
															<option value="2">租户</option>
															<option value="3">访客</option>
															<option value="5">工作人员</option>
														</select>
													</div>
												</div>
												<div class="form-group col-xs-3 row">
													<label class="col-lg-4 control-label">楼栋</label>
													<div class="col-sm-7">
														<select class="filter-status form-control" id="building_list">
														</select>
													</div>
												</div>
												<div class="form-group col-xs-3 row">
													<label class="col-lg-4 control-label">单元</label>
													<div class="col-sm-7">
														<select class="filter-status form-control" id="unit_list">
														</select>
													</div>
												</div>
												<div class="form-group col-xs-3 row">
													<label class="col-lg-4 control-label">房号</label>
													<div class="col-sm-7">
														<select class="filter-status form-control" id="house_list">
														</select>
													</div>
												</div>
												<div class="form-group col-xs-3 row">
													<label class="col-lg-4 control-label">访问时间</label>
													<div class="col-sm-7">
														<input type="text" class="form-control" id ="date"/>
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
																	<td colspan="7" style="font-weight: bold"
																		class="button_div">
																		<p>门禁访问记录列表</p>
																	</td>
																</tr>
																<tr>
																	<th myColName="username" myOrder>姓名</th>
																	<th myColName="buid" myOrder>楼栋</th>
																	<th myColName="unit" myOrder>单元</th>
																	<th myColName="house" myOrder>房号</th>
																	<th myColName="isowner" myOrder>身份</th>
																	<th myColName="doorname">门</th>
																	<th myColName="tel">电话</th>
																</tr>
															</thead>
														</table>
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
	<script type="text/javascript" src="assets/js/bootstrap.js"></script>
	<script type="text/javascript" src="assets/js/app.js"></script>

	<script type="text/javascript"
		src="assets/js/timepicker/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="assets/js/datepicker/bootstrap-datepicker.js"></script>

    <script type="text/javascript">
		$('#date').datepicker();   //日期控件
		var year = new Date().getFullYear();
		var month = new Date().getMonth()+1+"";
		if(month.length<2){
			month = "0"+month;
		}
		var date = new Date().getDate()+"";
		if(date.length<2){
			date = "0"+date;
		}
		document.getElementById("date").value=year+"-"+month+"-"+date;  //默认当前日期
		$('#serach').click(function(){
			tableLoad();   //查询
		});
	</script>

	<script type="text/javascript">
		$(function() {
			tableLoad(); //刷新页面表格
			//selectLoad();  //加载楼栋单元房号下拉框
		});

		//用于条件搜索记录和第一次进入查询包含分页
		function tableLoad() {
			var _username = $('#username').val();  //姓名
			var _isowner = $('#isowner').val();   //身份
			var _buid = $('#building_list').val();  //楼栋
			var _unit = $('#unit_list').val();  //单元
			var _hid = $('#house_list').val();   //房号、
			var _date  = $('#date').val();  //访问日期
			$('#footable-res2').myJqueryTable({
				url : 'door/doorOpenListIndex.do',
				data : {
					"vid" : 1, //小区 id
					"username" : _username,
					"isowner" : _isowner,
					"bid" : _buid,
					"uid":_unit,
					"hid":_hid,
					"date":_date,
				},
				pageSize : 10,
				success : function(items) {
				}
			});
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