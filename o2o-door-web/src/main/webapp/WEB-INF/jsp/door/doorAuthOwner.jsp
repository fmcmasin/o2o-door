<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>业主权限设定</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Le styles -->
    <%@include file="../common/common.jsp"%>
    <script src="jQueryAssets/jquery-1.11.1.min.js"></script>
    <link href="jQueryAssets/jquery.ui.core.min.css" rel="stylesheet"
	type="text/css">
    <link href="jQueryAssets/jquery.ui.theme.min.css" rel="stylesheet"
	type="text/css">
    <link href="jQueryAssets/jquery.ui.dialog.min.css" rel="stylesheet"
	type="text/css">
    <link href="jQueryAssets/jquery.ui.resizable.min.css" rel="stylesheet"
	type="text/css">
    <style type="text/css">
        th,tr{
            text-align:center;
        }
        .mask{
            width:100%;height:100%;background: #000;opacity: 0.8;position:absolute;top:0;left:0;z-index:100;display:none;
        }
        .button_div button{
            margin-left:5px;
        }
        .button_div p{
            margin-top:7px;
            float:left;
        }
        .select_hide{
            display: none;
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
                    <i class="icon-window"></i>
                            <span> <strong>业主权限设定</strong>
                            </span>
                </h2>
            </div>
            <div class="col-sm-7">
                <div class="devider-vertical visible-lg"></div>
                <div class="tittle-middle-header">
                    <div class="alert">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <span class="tittle-alert entypo-info-circled"></span>
                        管理人员对业主的门禁权限进行控制。
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ TITLE -->
    <!-- BREADCRUMB -->
    <ul id="breadcrumb">
        <li>
            <span class="entypo-home"></span>
        </li>
        <li><i class="fa fa-lg fa-angle-right"></i>
        </li>
        <li><a href="#" title="Sample page 1">门禁管理</a>
        </li>
        <li><i class="fa fa-lg fa-angle-right"></i>
        </li>
        <li><a href="#" title="Sample page 1">门禁管理</a>
        </li>
        <li><i class="fa fa-lg fa-angle-right"></i>
        </li>
        <li><a href="#" title="Sample page 1">业主权限设定</a>
        </li>
    </ul>
    <!-- END OF BREADCRUMB -->
    <!--  DEVICE MANAGER -->
    <div class="content-wrap">
        <div class = "mask"></div>
        <div class="row">
            <div class="col-sm-12">
                <div class="nest" id="FilteringClose">
                    <div class="title-alt">
                        <h6>
                            权限设定</h6>
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
                                                    <input type = "text" class="form-control" id="username"/>
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-3 row">
                                                <label class="col-lg-4 control-label">电话</label>
                                                <div class="col-sm-7">
                                                    <input type = "text" class="form-control" id="tel"/>
                                                </div>
                                            </div>
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
                                            <div class="form-group col-xs-9 control-label">
                                                <a id="serach" class="pull-right btn btn-info filter-api entypo-search" title="Filter using the Filter API">&nbsp;搜索</a>
                                            </div>
                                            <div class="col-xs-12 row">
                                                <div class="body-nest">
                                                    <table class="table table-bordered cf tb"
                                                        id="footable-res2">
                                                        <thead class = "cf">
                                                        <tr>
                                                            <td colspan="8" style="font-weight:bold" class = "button_div">
                                                                <p>权限设定列表</p>
                                                                <a href="${pageContext.request.contextPath }/upload/downloadFile.do?excelTemp=excelTemplet.xls" class="btn btn-primary pull-right icon-export">
                                                                    导出授权模板</a>
                                                                <button type="button" onclick="selectFile()" class="btn btn-primary pull-right entypo-download">
                                                                    导入授权数据
                                                                </button>
                                                                <button type="button" class="btn btn-success house pull-right edit icon-document-edit">
                                                                    授权</button><input type="file" id="file" onchange="getFilePath()" name='excelProperty'
                                                                           style="filter:alpha(opacity=0);opacity:0;width: 0;height: 0;"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th myColName="myTabCol_checkbox">#</th>
															<th myColName="username" myOrder>姓名</th>
															<th myColName="wechatname" myOrder>微信昵称</th>
															<th myColName="tel" myOrder>电话</th>
															<th myColName="buid" myOrder>楼栋</th>
															<th myColName="unit" myOrder>单元</th>
															<th myColName="house" myOrder>房号</th>
															<th myColName="doorname" myOrder>门禁权限</th>
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
        <form class="form-horizontal" role="form">
            <div class="form-group" style="margin-left:0;margin-right:0;">
                <label class="col-sm-6 change_label" style="line-height:50px;font-size: 20px;"></label>
                <div class="col-sm-2 pull-right" style="line-height:50px;">
                    <a id="save" class="btn btn-info filter-api" title="Filter using the Filter API" style="margin-left:100px;">保存</a>
                </div>
            </div>
            <div class="body-nest" id="tableStatic1" style="background:transparent;">
                <div class="row">
                    <input type="hidden" id="userid"/>
                    <div class="col-sm-1"><label style="line-height: 30px;">姓名</label></div>
                    <div class="col-sm-2"><input class="form-control" type="text"  disabled="disabled" id="name"></div>
                    <div class="col-sm-1"><label style="line-height: 30px;">楼栋</label></div>
                    <div class="col-sm-2"><input class="form-control" type="text"  disabled="disabled" id="buid"></div>
                    <div class="col-sm-1"><label style="line-height: 30px;">单元</label></div>
                    <div class="col-sm-2"><input class="form-control" type="text"  disabled="disabled" id="unit"></div>
                    <div class="col-sm-1"><label style="line-height: 30px;">房号</label></div>
                    <div class="col-sm-2"><input class="form-control" type="text"  disabled="disabled" id="house"></div>
                </div>
               <hr>
                <div class="row">
                    <table class="table table-bordered cf"
                          id="footable-res3">
                        <thead class = "cf">
                        <tr><td colspan="3">
                            <div>门权限列表</div>
                        </td></tr>
                        <tr>
                            <td colspan="3" style="font-weight:bold;" class = "button_div">
                                <div class="col-sm-1"><label style="line-height: 30px;">范围</label></div>
                                <div class = "col-sm-2">
                                    <select class="filter-status form-control" id=range>
                                        <option value="1">已授权</option>
                                        <option value="0">全部</option>
                                    </select>
                                </div>
                                <div class="col-sm-1"><label style="line-height: 30px;">类型</label></div>
                                <div class = "col-sm-2">
                                    <select class="filter-status form-control" id="doortype">
                                        <option value="cmdoor">小区公共门</option>
                                        <option value="custdoor">楼栋单元门</option>
                                    </select>
                                </div>
                                <div class="col-sm-1 select_hide"><label style="line-height: 30px;">楼栋</label></div>
                                <div class = "col-sm-2">
                                    <select class="filter-status form-control select_hide" id="building">
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th myColName="myTabCol_checkboxs">#</th>
							<th myColName="name" myOrder>门</th>
							<th myColName="remarks" myOrder>备注</th>
						</tr>
                        </thead>
                    </table>
                </div>
            </div>
        </form>
    </label>
</div>
<!-- MAIN EFFECT -->
<%@include file="../common/foot.jsp"%>
<script type="text/javascript">
$(function (){
	tableLoad();     //刷新页面表格
	//selectLoad();  //加载楼栋单元房号下拉框
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
});


$('#serach').click(function(){
	tableLoad();   //查询
});

$(".edit").click(function(){
	var _owner_list = document.getElementsByName("ownerlist");
	var  _flag = false;
	var _obj;
	for (i=0; i<_owner_list.length; i++) {  
        if (_owner_list[i].checked) {  
        	_obj = (_owner_list[i].value);
        	_flag = true;
        	break;
        }  
    }
	if(!_flag){
		alert("请选中业主进行授权");
		return;
	}
    $(".mask").show();
    $( "#Dialog1" ).dialog( "open" );
    $(".change_label").html("编辑业主权限");
    $(".ui-button-text").css('display','none');
    
    _obj = JSON.parse(_obj);
    $('#userid').val(_obj.userid);
    $('#name').val(_obj.username);
    $('#buid').val(_obj.buid);
    $('#unit').val(_obj.unit);
    $('#house').val(_obj.house);
    
    //加载门列表
    getdoorlist();
});

$("#range").change(function(){
	//更改范围之后加载门列表
    getdoorlist();
});

$("#building").change(function(){
	//更改楼栋之后加载门列表
    getdoorlist();
});

$("#doortype").change(function(){
    var opt=$("#doortype").val();
    if(opt==="custdoor"){
        $('.select_hide').show();
        //选择了楼栋之后出现楼栋下拉框
        //selectLoadBuilding()
    }else{
        $('.select_hide').hide();
    }
});


//选择门进行授权
$('#save').click(function(){
	var  _flag = false;
	var _door_list = document.getElementsByName("doorlist");
	var _door_object = new Array();
	for (i=0; i<_door_list.length; i++) {  
        if (_door_list[i].checked) {
        	_flag = true;
        	_door_object[i] = (_door_list[i].value)  
        }  
    }
	if(!_flag){
		alert("请选中门进行授权");
		return;
	}
	//后台保存数据
	 $.ajax({
		   async : false,
	  	   cache : false,
			type : "post",
			url: 'doorAuthSetting/saveDoorList.do',
				datatype : "json",
				data : {
					userid : $('#userid').val(),
					params : _door_object
				},
				traditional:true, 
				success : function(json) {
					alert(json);
					$( "#Dialog1" ).dialog( "close" );
					$('#footable-res2').myJqueryTable('refresh');
				},error: function (data, status, e){
				    alert("【服务器异常，请联系管理员！】"+e);
				}
			});
});

</script>

<script type="text/javascript">
//用于条件搜索记录和第一次进入查询包含分页
function tableLoad() {
	var _user_name = $("#username").val();  //姓名
	var _bid = $("#building_list").val(); 			//楼栋
	var _uid = $("#unit_list").val(); 			//单元
	var _hid = $("#house_list").val(); 			//房号
	var _tel = $("#tel").val(); 			//电话
	$('#footable-res2').myJqueryTable({
		url : 'doorAuthSetting/ownerIndex.do',
		data : {
			"vid":1, //小区编号
			"bid" : _bid,
			"uid" : _uid,
			"username" : _user_name,
			"tel" : _tel,
			"hid" : _hid
		},
		pageSize : 10,
		success : function(items) {
		}
	});
}

//人员列表单选框
function myTabCol_checkbox(row){
	var data = JSON.stringify(row);
   	return "<input type = 'checkbox' name='ownerlist' value='"+data+"'/>";
}

//加载门列表
function getdoorlist(){
	
	var _userid = $('#userid').val();  //用户id
	var _range = $('#range').val();   //授权范围
	var _doortype = $('#doortype').val();  //门类型
	var _bid = $('#building').val();    //楼栋编号
	$('#footable-res3').myJqueryTable({
		url : 'doorAuthSetting/getDoorList.do',
		data : {
			"vid":1, //小区编号
			"userid" : _userid,
			"range" : _range,
			"doortype" : _doortype,
			"bid" : _bid
		},
		pageSize : 10,
		success : function(items) {
		}
	});
	
}

//门列表单选框
function myTabCol_checkboxs(row){
   	return "<input type = 'checkbox' name='doorlist' value='"+row.id+"'/>";
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
	    	selectHouse($('#unit_list').val());
	    },
	    selectChange:function(value){
	    	selectHouse(value);
	    }
   	});
}

//查询房号
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

//用于弹出界面下拉选择楼栋
function selectLoadBuilding(){
	$('#building').mySelect({
    	id:"id",
   		text:"name",
   		url:"house/buildingList.do",
   		success:function(){
	    },
   	});
}
//上传文件
function selectFile(){
    $("#file").trigger("click");
}
var _excelDate;
function getFilePath(){
	$.ajaxFileUpload({
		url:'doorAuthSetting/owner/excelUpload.do',
		fileElementId:'excelProperty',
		dataType: 'niejun',
		success: function (data){
			alert(data);
		},
		error: function (data, status, e){
		    alert("【服务器异常，请联系管理员！】"+e);
		}
	});	
	
}
</script>
</body>
</html>