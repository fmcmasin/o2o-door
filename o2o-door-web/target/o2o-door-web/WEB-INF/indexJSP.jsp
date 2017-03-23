<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>会所管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Le styles -->
    <%@ include file="jsp/common/common.jsp"%>
</head>

<body><div id="awwwards" class="right black"><a href="http://www.awwwards.com/best-websites/apricot-navigation-admin-dashboard-template" target="_blank">best websites of the world</a></div>
    <!-- Preloader -->
    <div id="preloader">
        <div id="status">&nbsp;</div>
    </div>
    <!-- TOP NAVBAR -->
 <nav role="navigation" class="navbar navbar-static-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button data-target="#bs-example-navbar-collapse-1" data-toggle="collapse" class="navbar-toggle" type="button">
                    <span class="entypo-menu"></span>
                </button>
                <button class="navbar-toggle toggle-menu-mobile toggle-left" type="button">
                    <span class="entypo-list-add"></span>
                </button>




                <div id="logo-mobile" class="visible-xs">
                   <h1>WEB管理<span>v1.2</span></h1>
                </div>

            </div>


            <!-- Collect the nav links, forms, and other content for toggling -->
            <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">

                    <li class="dropdown">

                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i style="font-size:20px;" class="icon-conversation"></i><div class="noft-red">23</div></a>


                        <ul style="margin: 11px 0 0 9px;" role="menu" class="dropdown-menu dropdown-wrap">
                            <li>
                                <a href="#">
                                    <img alt="" class="img-msg img-circle" src="http://api.randomuser.me/portraits/thumb/men/1.jpg">Jhon Doe <b>Just Now</b>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <img alt="" class="img-msg img-circle" src="http://api.randomuser.me/portraits/thumb/women/1.jpg">Jeniffer <b>3 Min Ago</b>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <img alt="" class="img-msg img-circle" src="http://api.randomuser.me/portraits/thumb/men/2.jpg">Dave <b>2 Hours Ago</b>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <img alt="" class="img-msg img-circle" src="http://api.randomuser.me/portraits/thumb/men/3.jpg"><i>Keanu</i>  <b>1 Day Ago</b>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <img alt="" class="img-msg img-circle" src="http://api.randomuser.me/portraits/thumb/men/4.jpg"><i>Masashi</i>  <b>2 Mounth Ago</b>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div>See All Messege</div>
                            </li>
                        </ul>
                    </li>
                    <li>

                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i style="font-size:19px;" class="icon-warning tooltitle"></i><div class="noft-green">5</div></a>
                        <ul style="margin: 12px 0 0 0;" role="menu" class="dropdown-menu dropdown-wrap">
                            <li>
                                <a href="#">
                                    <span style="background:#DF2135" class="noft-icon maki-bus"></span><i>From Station</i>  <b>01B</b>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <span style="background:#AB6DB0" class="noft-icon maki-ferry"></span><i>Departing at</i>  <b>9:00 AM</b>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <span style="background:#FFA200" class="noft-icon maki-aboveground-rail"></span><i>Delay for</i>  <b>09 Min</b>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <span style="background:#86C440" class="noft-icon maki-airport"></span><i>Take of</i>  <b>08:30 AM</b>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <span style="background:#0DB8DF" class="noft-icon maki-bicycle"></span><i>Take of</i>  <b>08:30 AM</b>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div>See All Notification</div>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#"><i data-toggle="tooltip" data-placement="bottom" title="Help" style="font-size:20px;" class="icon-help tooltitle"></i></a>
                    </li>

                </ul>
                <div id="nt-title-container" class="navbar-left running-text visible-lg">
                    <ul class="date-top">
                        <li class="entypo-calendar" style="margin-right:5px"></li>
                        <li id="Date"></li>


                    </ul>

                    <ul id="digital-clock" class="digital">
                        <li class="entypo-clock" style="margin-right:5px"></li>
                        <li class="hour"></li>
                        <li>:</li>
                        <li class="min"></li>
                        <li>:</li>
                        <li class="sec"></li>
                        <li class="meridiem"></li>
                    </ul>
                    <ul id="nt-title">
                        <li><i class="wi-day-lightning"></i>&#160;&#160;Berlin&#160;
                            <b>85</b><i class="wi-fahrenheit"></i>&#160;; 15km/h
                        </li>
                        <li><i class="wi-day-lightning"></i>&#160;&#160;Yogyakarta&#160;
                            <b>85</b><i class="wi-fahrenheit"></i>&#160;; Tonight- 72 °F (22.2 °C)
                        </li>

                        <li><i class="wi-day-lightning"></i>&#160;&#160;Sttugart&#160;
                            <b>85</b><i class="wi-fahrenheit"></i>&#160;; 15km/h
                        </li>

                        <li><i class="wi-day-lightning"></i>&#160;&#160;Muchen&#160;
                            <b>85</b><i class="wi-fahrenheit"></i>&#160;; 15km/h
                        </li>

                        <li><i class="wi-day-lightning"></i>&#160;&#160;Frankurt&#160;
                            <b>85</b><i class="wi-fahrenheit"></i>&#160;; 15km/h
                        </li>

                    </ul>
                </div>

                <ul style="margin-right:0;" class="nav navbar-nav navbar-right">
                    <li>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" class="admin-pic img-circle" src="http://api.randomuser.me/portraits/thumb/men/10.jpg">你好，刘永平 <b class="caret"></b>
                        </a>
                        <ul style="margin-top:14px;" role="menu" class="dropdown-setting dropdown-menu">
                            <li>
                                <a href="#">
                                    <span class="entypo-user"></span>&#160;&#160;修改密码</a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="entypo-vcard"></span>&#160;&#160;个人账单</a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="entypo-lifebuoy"></span>&#160;&#160;个人资产</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="http://themeforest.net/item/apricot-navigation-admin-dashboard-template/7664475?WT.ac=category_item&WT.z_author=themesmile">
                                    <span class="entypo-basket"></span>&#160;&#160; 帮助</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="icon-gear"></span>&#160;&#160;设置</a>
                                         <ul style="margin-top:14px;" role="menu" class="dropdown-setting dropdown-menu">
                            <li>
                                <a href="member.html">
                                    <span class="entypo-user"></span>&#160;&#160;员工管理</a>
                            </li>
                                <li>
                                <a href="member.html">
                                    <span class="entypo-user"></span>&#160;&#160;服务提供商管理</a>
                            </li>

                        </ul>
                    </li>
                    <li class="hidden-xs">
                        <a class="toggle-left" href="#">
                            <span class="entypo-list-add"></span>IBMS</a>
                        </a>
                    </li>
                </ul>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- /END OF TOP NAVBAR -->

  <div id="skin-select">
        <div id="logo">
         <h1>统建社区<span>v1.0</span></h1>
        </div>

        <a id="toggle">
            <span class="entypo-menu"></span>
        </a>
        <div class="dark">
            <form action="#">
                <span>
                    <input type="text" name="search" value="" class="search rounded id_search" placeholder="搜索..." autofocus="">
                </span>
            </form>
        </div>

        <div class="search-hover">
            <form id="demo-2">
                <input type="search" placeholder="Search Menu..." class="id_search">
            </form>
        </div><!-- #BeginLibraryItem "/Library/menu.lbi" --><div class="skin-part">
            <div id="tree-wrap">
                <div class="side-bar">
  
                    <ul id="menu-showhide" class="topnav menu-left-nest">
                        <li>
                            <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

                                <span>会所管理</span>
                                <i data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

                            </a>
                        </li>


                        <li>
                            <a class="tooltip-tip" href="#" title="UI Element">
                                <i class="icon-monitor"></i>
                                <span>服务管理</span>
                            </a>
                            <ul>
                            <li>
                                    <a class="tooltip-tip2 ajax-load" href="javascript:index_href('project/addProject.do')" title="Element"><i class="icon-attachment"></i><span>服务项目</span>  </a>
                                </li>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="javascript:index_href('club/clubServe.do')" title="Element"><i class="icon-attachment"></i><span>会所场馆</span>  </a>
                                </li>
                                <li><a class="tooltip-tip2 ajax-load" href="javascript:index_href('mCard/addMCard.do')" title="Button"><i class="icon-view-list-large"></i><span>会员卡</span> <div class="noft-blue-number">10</div></a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="tooltip-tip" href="#" title="Form">
                                <i class="icon-document"></i>
                                <span>消费管理</span>
                            </a>
                            <ul>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="javascript:index_href('pre/buildingUse.do')" title="Form Elements"><i class="icon-document-edit"></i><span>场地使用</span></a>
                                </li>                           
                                       
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="javascript:index_href('pre/buildingOrder.do')" title="Andvance Form"><i class="icon-map"></i><span>场地预定</span></a>
                                </li>
                            </ul>
                        </li>
                  <li>
                            <a class="tooltip-tip" href="#" title="Form">
                                <i class="icon-document"></i>
                                <span>会员管理</span>
                            </a>
                            <ul>                               
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="javascript:index_href('member/addMember.do')" title="Text Editor"><i class="icon-code"></i><span>新会员登记</span></a>
                                </li>      
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="javascript:index_href('member/memberList.do')" title="Text Editor"><i class="icon-code"></i><span>会员信息</span></a>
                                </li>                
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="javascript:index_href('consume/consumeSearch.do')" title="Andvance Form"><i class="icon-map"></i><span>消费账单</span></a>
                                </li>
                            </ul>
                        </li>

                    </ul>
 <ul id="menu-showhide" class="topnav menu-left-nest">
                        <li>
                            <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

                                <span>微装服务</span>
                                <i data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

                            </a>
                        </li>


                        <li>
                            <a class="tooltip-tip" href="#" title="UI Element">
                                <i class="icon-monitor"></i>
                                <span>服务管理</span>
                            </a>
                            <ul>
                            <li>
                                    <a class="tooltip-tip2 ajax-load" href="javascript:index_href('upload1/go.do')" title="Element"><i class="icon-attachment"></i><span>服务项目</span>  </a>
                                </li>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="builds.html" title="Element"><i class="icon-attachment"></i><span>会所场馆</span>  </a>
                                </li>
                                <li><a class="tooltip-tip2 ajax-load" href="idcard.html" title="Button"><i class="icon-view-list-large"></i><span>会员卡</span> <div class="noft-blue-number">10</div></a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="tooltip-tip" href="#" title="Form">
                                <i class="icon-document"></i>
                                <span>消费管理</span>
                            </a>
                            <ul>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="buildings.html" title="Form Elements"><i class="icon-document-edit"></i><span>场地使用</span></a>
                                </li>                           
                                       
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="buildingOrder.html" title="Andvance Form"><i class="icon-map"></i><span>场地预定</span></a>
                                </li>
                            </ul>
                        </li>
                  <li>
                            <a class="tooltip-tip" href="#" title="Form">
                                <i class="icon-document"></i>
                                <span>会员管理</span>
                            </a>
                            <ul>                               
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="adduser.html" title="Text Editor"><i class="icon-code"></i><span>新会员登记</span></a>
                                </li>      
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="users.html" title="Text Editor"><i class="icon-code"></i><span>会员信息</span></a>
                                </li>                
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="bills.html" title="Andvance Form"><i class="icon-map"></i><span>消费账单</span></a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                     <ul id="menu-showhide" class="topnav menu-left-nest">
                        <li>
                            <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

                                <span>专业保洁</span>
                                <i data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

                            </a>
                        </li>
                        <li>
                            <a class="tooltip-tip" href="#" title="UI Element">
                                <i class="icon-monitor"></i>
                                <span>服务管理</span>
                            </a>
                            <ul>
                            <li>
                                    <a class="tooltip-tip2 ajax-load" href="server.html" title="Element"><i class="icon-attachment"></i><span>服务项目</span>  </a>
                                </li>
                   
                            </ul>
                        </li>
                        <li>
                            <a class="tooltip-tip" href="#" title="Form">
                                <i class="icon-document"></i>
                                <span>消费管理</span>
                            </a>
                            <ul>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="buildings.html" title="Form Elements"><i class="icon-document-edit"></i><span>场地使用</span></a>
                                </li>                           
                                       
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="buildingOrder.html" title="Andvance Form"><i class="icon-map"></i><span>场地预定</span></a>
                                </li>
                            </ul>
                        </li>
                  <li>
                            <a class="tooltip-tip" href="#" title="Form">
                                <i class="icon-document"></i>
                                <span>会员管理</span>
                            </a>
                            <ul>                               
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="adduser.html" title="Text Editor"><i class="icon-code"></i><span>新会员登记</span></a>
                                </li>      
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="users.html" title="Text Editor"><i class="icon-code"></i><span>会员信息</span></a>
                                </li>                
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="bills.html" title="Andvance Form"><i class="icon-map"></i><span>消费账单</span></a>
                                </li>
                            </ul>
                        </li>

                    </ul>

 				<ul id="menu-showhide" class="topnav menu-left-nest">
                        <li>
                            <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

                                <span>公告与广告</span>
                                <i data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

                            </a>
                        </li>
                        <li>
                            <a class="tooltip-tip" href="#" title="UI Element">
                                <i class="icon-monitor"></i>
                                <span>服务管理</span>
                            </a>
                            <ul>
                            <li>
                                    <a class="tooltip-tip2 ajax-load" href="server.html" title="Element"><i class="icon-attachment"></i><span>服务项目</span>  </a>
                                </li>
                   
                            </ul>
                        </li>
                        <li>
                            <a class="tooltip-tip" href="#" title="Form">
                                <i class="icon-document"></i>
                                <span>消费管理</span>
                            </a>
                            <ul>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="buildings.html" title="Form Elements"><i class="icon-document-edit"></i><span>场地使用</span></a>
                                </li>                           
                                       
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="buildingOrder.html" title="Andvance Form"><i class="icon-map"></i><span>场地预定</span></a>
                                </li>
                            </ul>
                        </li>
                  <li>
                            <a class="tooltip-tip" href="#" title="Form">
                                <i class="icon-document"></i>
                                <span>会员管理</span>
                            </a>
                            <ul>                               
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="adduser.html" title="Text Editor"><i class="icon-code"></i><span>新会员登记</span></a>
                                </li>      
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="users.html" title="Text Editor"><i class="icon-code"></i><span>会员信息</span></a>
                                </li>                
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="bills.html" title="Andvance Form"><i class="icon-map"></i><span>消费账单</span></a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                    
                    <ul id="menu-showhide" class="topnav menu-left-nest">
                        <li>
                            <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

                                <span>物业缴费</span>
                                <i data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

                            </a>
                        </li>
                        <li>
                            <a class="tooltip-tip" href="#" title="UI Element">
                                <i class="icon-monitor"></i>
                                <span>服务管理</span>
                            </a>
                            <ul>
                            <li>
                                    <a class="tooltip-tip2 ajax-load" href="server.html" title="Element"><i class="icon-attachment"></i><span>服务项目</span>  </a>
                                </li>
                   
                            </ul>
                        </li>
                        <li>
                            <a class="tooltip-tip" href="#" title="Form">
                                <i class="icon-document"></i>
                                <span>消费管理</span>
                            </a>
                            <ul>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="buildings.html" title="Form Elements"><i class="icon-document-edit"></i><span>场地使用</span></a>
                                </li>                           
                                       
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="buildingOrder.html" title="Andvance Form"><i class="icon-map"></i><span>场地预定</span></a>
                                </li>
                            </ul>
                        </li>
                  <li>
                            <a class="tooltip-tip" href="#" title="Form">
                                <i class="icon-document"></i>
                                <span>会员管理</span>
                            </a>
                            <ul>                               
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="adduser.html" title="Text Editor"><i class="icon-code"></i><span>新会员登记</span></a>
                                </li>      
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="users.html" title="Text Editor"><i class="icon-code"></i><span>会员信息</span></a>
                                </li>                
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="bills.html" title="Andvance Form"><i class="icon-map"></i><span>消费账单</span></a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                    
                    <ul id="menu-showhide" class="topnav menu-left-nest">
                        <li>
                            <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

                                <span>门禁管理</span>
                                <i data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

                            </a>
                        </li>
                        <li>
                            <a class="tooltip-tip" href="#" title="UI Element">
                                <i class="icon-monitor"></i>
                                <span>服务管理</span>
                            </a>
                            <ul>
                            <li>
                                    <a class="tooltip-tip2 ajax-load" href="server.html" title="Element"><i class="icon-attachment"></i><span>服务项目</span>  </a>
                                </li>
                   
                            </ul>
                        </li>
                        <li>
                            <a class="tooltip-tip" href="#" title="Form">
                                <i class="icon-document"></i>
                                <span>消费管理</span>
                            </a>
                            <ul>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="buildings.html" title="Form Elements"><i class="icon-document-edit"></i><span>场地使用</span></a>
                                </li>                           
                                       
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="buildingOrder.html" title="Andvance Form"><i class="icon-map"></i><span>场地预定</span></a>
                                </li>
                            </ul>
                        </li>
                  <li>
                            <a class="tooltip-tip" href="#" title="Form">
                                <i class="icon-document"></i>
                                <span>会员管理</span>
                            </a>
                            <ul>                               
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="adduser.html" title="Text Editor"><i class="icon-code"></i><span>新会员登记</span></a>
                                </li>      
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="users.html" title="Text Editor"><i class="icon-code"></i><span>会员信息</span></a>
                                </li>                
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="bills.html" title="Andvance Form"><i class="icon-map"></i><span>消费账单</span></a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                    
                    <div class="side-dash">
                        <h3>
                            <span>设施价值</span>
                        </h3>
                        <ul class="side-dashh-list">
                            <li>运行成本
                                <span>2500.00<i style="color:#44BBC1;" class="fa fa-arrow-circle-up"></i>
                                </span>
                            </li>
                            <li>全寿命成本
                                <span>80000.00<i style="color:#AB6DB0;" class="fa fa-arrow-circle-down"></i>
                                </span>
                            </li>
                            <li>投资价值
                                <span>13000.00<i style="color:#19A1F9;" class="fa fa-arrow-circle-up"></i>
                                </span>
                            </li>
                        </ul>
                        <h3>
                            <span>空间价值</span>
                        </h3>
                        <ul class="side-bar-list">
                            <li>空间运用评价
                                <div class="linebar">5,7,8,9,3,5,3,8,5</div>
                            </li>
                            <li>空间适应性评价
                                <div class="linebar2">9,7,8,9,5,9,6,8,7</div>
                            </li>
                            <li>空间使用满意度评价
                                <div class="linebar3">5,7,8,9,3,5,3,8,5</div>
                            </li>
                        </ul>
                        <h3>
                            <span>IFMA健康评分</span>
                        </h3>
                        <div id="g1" style="height:180px" class="gauge"></div>
                    </div>
                </div>
            </div>
        </div><!-- #EndLibraryItem --></div>



    <!--  PAPER WRAP -->
<div class="wrap-fluid">
		<iframe id="index_content" style="width: 100%;" frameborder="0">
				</iframe> 
        </div>
    <!--  END OF PAPER WRAP -->

    <!-- RIGHT SLIDER CONTENT -->
    <div class="sb-slidebar sb-right">
        <div class="right-wrapper">
            <div class="row">
                <h3>
                    <span><i class="entypo-gauge"></i>&nbsp;&nbsp;MAIN WIDGET</span>
                </h3>
                <div class="col-sm-12">

                    <div class="widget-knob">
                        <span class="chart" style="position:relative" data-percent="86">
                            <span class="percent"></span>
                        </span>
                    </div>
                    <div class="widget-def">
                        <b>Distance traveled</b>
                        <br>
                        <i>86% to the check point</i>
                    </div>

                    <div class="widget-knob">
                        <span class="speed-car" style="position:relative" data-percent="60">
                            <span class="percent2"></span>
                        </span>
                    </div>
                    <div class="widget-def">
                        <b>The average speed</b>
                        <br>
                        <i>30KM/h avarage speed</i>
                    </div>


                    <div class="widget-knob">
                        <span class="overall" style="position:relative" data-percent="25">
                            <span class="percent3"></span>
                        </span>
                    </div>
                    <div class="widget-def">
                        <b>Overall result</b>
                        <br>
                        <i>30KM/h avarage Result</i>
                    </div>
                </div>
            </div>
        </div>

        <div style="margin-top:0;" class="right-wrapper">
            <div class="row">
                <h3>
                    <span><i class="entypo-chat"></i>&nbsp;&nbsp;CHAT</span>
                </h3>
                <div class="col-sm-12">
                    <span class="label label-warning label-chat">Online</span>
                    <ul class="chat">
                        <li>
                            <a href="#">
                                <span>
                                    <img alt="" class="img-chat img-circle" src="http://api.randomuser.me/portraits/thumb/men/20.jpg">
                                </span><b>Dave Junior</b>
                                <br><i>Last seen : 08:00 PM</i>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span>
                                    <img alt="" class="img-chat img-circle" src="http://api.randomuser.me/portraits/thumb/men/21.jpg">
                                </span><b>Kenneth Lucas</b>
                                <br><i>Last seen : 07:21 PM</i>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span>
                                    <img alt="" class="img-chat img-circle" src="http://api.randomuser.me/portraits/thumb/men/22.jpg">
                                </span><b>Heidi Perez</b>
                                <br><i>Last seen : 05:43 PM</i>
                            </a>
                        </li>


                    </ul>

                    <span class="label label-chat">Offline</span>
                    <ul class="chat">
                        <li>
                            <a href="#">
                                <span>
                                    <img alt="" class="img-chat img-offline img-circle" src="http://api.randomuser.me/portraits/thumb/men/23.jpg">
                                </span><b>Dave Junior</b>
                                <br><i>Last seen : 08:00 PM</i>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span>
                                    <img alt="" class="img-chat img-offline img-circle" src="http://api.randomuser.me/portraits/thumb/women/24.jpg">
                                </span><b>Kenneth Lucas</b>
                                <br><i>Last seen : 07:21 PM</i>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span>
                                    <img alt="" class="img-chat img-offline img-circle" src="http://api.randomuser.me/portraits/thumb/men/25.jpg">
                                </span><b>Heidi Perez</b>
                                <br><i>Last seen : 05:43 PM</i>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span>
                                    <img alt="" class="img-chat img-offline img-circle" src="http://api.randomuser.me/portraits/thumb/women/25.jpg">
                                </span><b>Kenneth Lucas</b>
                                <br><i>Last seen : 07:21 PM</i>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span>
                                    <img alt="" class="img-chat img-offline img-circle" src="http://api.randomuser.me/portraits/thumb/men/26.jpg">
                                </span><b>Heidi Perez</b>
                                <br><i>Last seen : 05:43 PM</i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- END OF RIGHT SLIDER CONTENT-->
<input id="index_menuid" type="hidden" value="${index_menuid}" />
 <%@ include file="jsp/common/foot.jsp"%>
    <script type="text/javascript">
    $(function() {
    	index_load();
    });
    function index_load(){
    	index_href('door/indexDetail.do');
    }
    
    function index_href(url){
    	$("#index_content").attr("src",url);
    	$("#index_content").load(function () {
		    var mainheight = $(this).contents().find("body").height();
		    $(this).height(mainheight);
		});
    }
    
    </script>
<div style="text-align:center;">
<p>More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a> <a href="${pageContext.request.contextPath }/upload/downloadFile.do?excelTemp=excelTemplet.xls">下载</a><button onclick="selectFile()" type="button" class="btn btn-primary pull-right entypo-upload">
                                                                    导入Excel
                                                                </button>
</p>
<a href="${pageContext.request.contextPath }/door/doorManager.do">门禁管理列表</a> 
</div>
</body>

</html>
