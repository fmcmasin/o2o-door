<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>权限查询</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@include file="../common/common.jsp"%>
    <style type="text/css">
        th,tr{
            text-align:center;
        }
        .confirm_mask{
            position: absolute;
        }
        .mask{
            position: fixed;
            z-index: 1000;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: rgba(0, 0, 0, 0.6);
        }
        .dialog_mask{
            position: fixed;
            z-index: 5000;
            width: 80%;
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            background-color: #FAFAFC;
            text-align: center;
            border-radius: 3px;
            overflow: hidden;
        }
        .button_div button{
            margin-left:5px;
        }
        .button_div p{
            margin-top:7px;
            float:left;
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
                            <span> <strong>权限查询</strong>
                            </span>
                </h2>
            </div>
            <div class="col-sm-7">
                <div class="devider-vertical visible-lg"></div>
                <div class="tittle-middle-header">
                    <div class="alert">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <span class="tittle-alert entypo-info-circled"></span>
                        管理人员所有的权限进行查看。
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
        <li><a href="#" title="Sample page 1">权限查询</a>
        </li>
    </ul>
    <!-- END OF BREADCRUMB -->
    <!--  DEVICE MANAGER -->
    <div class="content-wrap">
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
                                                    <input type = "text" class="form-control"  id="tel"/>
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-3 row select_hide">
                                                    <label class="col-lg-4 control-label">楼栋</label>
                                                    <div class="col-sm-7">
                                                        <select id="building_list" class="filter-status form-control select_hide">
                                                        </select>
                                                    </div>
                                            </div>
                                            <div class="form-group col-xs-3 row select_hide">
                                                <label class="col-lg-4 control-label">单元</label>
                                                <div class="col-sm-7">
                                                    <select id="unit_list" class="filter-status form-control select_hide">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-3 row select_hide">
                                                <label class="col-lg-4 control-label">房号</label>
                                                <div class="col-sm-7">
                                                    <select id="house_list" class="filter-status form-control select_hide">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-3 row">
                                                <label class="col-lg-4 control-label">门类型</label>
                                                <div class="col-sm-7">
                                                    <select class="filter-status form-control" id="doortype">
                                                        <option value=""></option>
                                                        <option value="cmdoor">小区公共门</option>
                                                        <option value="custdoor">楼栋单元门</option>
                                                    </select>
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
                                            <div class="form-group col-xs-3 control-label">
                                                <a id="serach" class="pull-right btn btn-info filter-api entypo-search" title="Filter using the Filter API">&nbsp;搜索</a>
                                            </div>
                                            <div class="col-xs-12 row">
                                                <div class="body-nest">
                                                 <table class="table table-bordered cf tb"
															id="footable-res2">
															<thead class="cf">
																<tr>
																	<td colspan="8" style="font-weight: bold"
																		class="button_div">
																		<p>权限申请列表</p>
																	</td>
																</tr>
																<tr>
																	<th myColName="username" myOrder>姓名</th>
																	<th myColName="wechatname" myOrder>微信昵称</th>
																	<th myColName="identity" myOrder>身份</th>
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

//工作人员和访客，去掉楼栋单元房号下拉选择
$("#isowner").change(function(){
    var opt=$("#isowner").val();
    if(opt==='3'||opt==='5'){
        $('.select_hide').hide();
    }else{
    	$('.select_hide').show();
    }
});

//用于条件搜索记录和第一次进入查询包含分页
function tableLoad() {
	var _username = $("#username").val(); //姓名
	var _bid = $("#building_list").val(); //楼栋
	var _uid = $("#unit_list").val(); 	 //单元
	var _hid = $("#house_list").val(); 	 //房号
	var _tel = $("#tel").val(); 			 //电话
	var _isowner = $('#isowner').val();   //身份
	var _doortype = $("#doortype").val(); //门类型
	$('#footable-res2').myJqueryTable({
		url : 'doorAuth/indexQuery.do',
		data : {
			"vid":1,  //小区编号
			"bid" : _bid,
			"uid" : _uid,
			"username" : _username,
			"tel" : _tel,
			"hid" : _hid,
			"doortype" : _doortype,
			"isowner":_isowner
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