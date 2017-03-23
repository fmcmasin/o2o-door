//自定义table标签插件
$.fn.extend({
    myJqueryTable:function(opts){  
    	var objTable = this;
    	objTable.initialize=function(){
    		objTable.addClass(defOpt.style);
    		//添加表格内容标签
    		objTable.append("<tbody></tbody>");
    		//添加分页菜单标签
    		objTable.append("<tfoot></tfoot>");
    		//表格排序开始
    		//表格头th元素
    		var theadTh=objTable.find(">thead>tr>th["+optInfo.myOrder+"]");
    		theadTh.append("<div class='member_table_dv'><span></span><span></span></div>");
    		theadTh.click(function(){
    			//表格内容tr元素
    			var first_span=$(this).find(">.member_table_dv>span:first-child");
    			var last_child=$(this).find(">.member_table_dv>span:last-child");
    			var index =$(this).index();
    			if(first_span.is(':hidden')){
    				objTable.style();
    				objTable.order("orderDesc",index);
    				first_span.css("margin-top","3px");
    				last_child.hide();
    			}else if(last_child.is(':hidden')){
    				objTable.myJqueryTable('refresh');
    			}else{
    				objTable.style();
    				objTable.order("order",index);
    				last_child.css("margin-top","3px");
    				first_span.hide();
    			}
    		});
    		//表格排序结束
    		objTable.data("myJqueryTable_initialize","initialize");
    	}
    	
    	//排序方法加样式
    	objTable.style=function(){
    		objTable.find(">thead>tr>th["+optInfo.myOrder+
    				"]>.member_table_dv>span:first-child").css("margin-top","0px");
    		objTable.find(">thead>tr>th["+optInfo.myOrder+
    				"]>.member_table_dv>span:last-child").css("margin-top","1px");
    		objTable.find(">thead>tr>th["+optInfo.myOrder+
    				"]>.member_table_dv>span").show();
    	}
    	
    	//排序方法表格排序
    	objTable.order=function(order,index){
    		var orderDatas =[];
    		var tbodyTr=objTable.find(">tbody>tr");
    		tbodyTr.each(function(){
    			var orderTd={};
    			orderTd.td=$($(this).children("td")[index]).text();
    			orderTd.tr=$(this).html();
    			orderDatas.push(orderTd);
    		});
    		if(order=="order"){
    			orderDatas.sort(objTable.numberOrder);
    		}else if(order=="orderDesc"){
    			orderDatas.sort(objTable.numberOrderDesc);
    		}
    		var order_number = objTable.data("order_number");
    		var i= objTable.find(">thead>tr>th["+optInfo.orderNum+"]").index();
    		for(var j=0;j<orderDatas.length;j++){
    			$(tbodyTr[j]).html(orderDatas[j].tr);
    			$($(tbodyTr[j]).children("td")[i]).html(order_number++);
    		}
    	}
    	
    	//正序
    	objTable.numberOrder=function(a,b){  
    		var x=a.td;
    		var y=b.td;
    	    return x>y?1:-1;
    	} 
    	
    	//倒序
    	objTable.numberOrderDesc=function(a,b){  
    	    var x=a.td;
    		var y=b.td;
    	    return x<y?1:-1;
    	} 
    	
    	objTable.load=function(pageNo){
    		if(pageNo==0){
        		return;
        	}
    		optInfo.data["pageNo"]=pageNo;
        	optInfo.data["pageSize"]=optInfo.pageSize;
    		$.ajax({
        		async:optInfo.async,
           		cache : false,
    			type : "post",
    			url: optInfo.url,		       
    			dataType : "json",
    			data:optInfo.data,
    			success: function(msg){
    				//表格头th元素
    				objTable.style();
    				var theadTh=$(objTable).find(">thead>tr>th");
    				//表格内容添加开始
    				var tableBody="";
    				var oNumber = msg.startRow;
    				objTable.data("order_number",oNumber);
    				for(var i=0;i<msg.list.length;i++){
    					tableBody+="<tr>";
    					theadTh.each(function(){
    						var colName =$(this).attr(optInfo.myColName);
    						var cpf=optInfo.colPrefix;
    						if($(this).attr(optInfo.orderNum)==""){
    							tableBody+="<td mytableIndex="+i+" >"+oNumber+++"</td>";
    							return;
    						}
    						if(colName!=undefined&&colName!=null&&colName.substring(0,cpf.length)==cpf){
    							tableBody+="<td mytableIndex="+i+" >"+eval(colName)(msg.list[i])+"</td>";
    						}else{
    							tableBody+="<td mytableIndex="+i+" >"+msg.list[i][colName]+"</td>";
    						}
    					});
    					tableBody+="</tr>";
    				}
    				$(objTable).children("tbody").html(tableBody);
    				//表格内容tr元素
    				var tbodyTr=$(objTable).find(">tbody>tr");
    				tbodyTr.click(function(){
    					optInfo.onclick(msg.list[$($(this).children("td")[0]).attr('mytableIndex')]);
    				});
    				tbodyTr.dblclick(function(){
    					optInfo.ondbclick(msg.list[$($(this).children("td")[0]).attr('mytableIndex')]);
    				});
    				//表格内容添加结束
    				
    				//表格样式开始
    				tbodyTr.mouseover(function (){
    					$(this).addClass("member_table_tr_bg");
    				}).mouseout(function (){
    					$(this).removeClass("member_table_tr_bg");
    				});
    				//表格样式结束
    				
    				//分页导航开始
    				var len=theadTh.length;
    				var tableFoot='<tr><td colspan='+len+'><ul>'+
    					'<li>«</li>'+
    					'<li>‹</li>'+
                   		'<li><input type="text" value="'
    					+msg.pageNum+'" /></li>'+
                   		'<li>›</li>'+
                   		'<li>»</li>'+
                   		'</ul><div>当前第<font>'+msg.pageNum+'</font>页，共'
                   		+msg.pages+'页</div></td></tr>';
    				$(objTable).children("tfoot").html(tableFoot);
    				var tLi=$(objTable).find("tfoot>tr>td>ul>li");
    				$(tLi[0]).click(function(){
    					objTable.load(1);
    				});
    				$(tLi[1]).click(function(){
    					objTable.load(msg.prePage);
    				});
    				$(tLi[3]).click(function(){
						objTable.load(msg.nextPage);
					});
    				$(tLi[4]).click(function(){
						objTable.load(msg.pages);
					});
    				$(tLi[2]).children("input").keyup(function(e) {  
						var regExp =/[^0-9]/g;
						var value = $(this).val();
						if(regExp.test(value)){
							$(this).val(
								value.replace(regExp,'')
							);
							return;
						}
						if(value>msg.pages){
							return;
						}
						var key = window.event ? e.keyCode : e.which;
						if(key==13){
							objTable.load(value);
						} 
			        });  
    				//分页导航结束
					
    				optInfo.success(msg.list);
    			},
    			error:function(){
    				optInfo.error();
    			}
    		});
    	};
    	
    	if(opts=="refresh"){
    		optInfo = objTable.data("myJqueryTable_optInfo");
    		objTable.load($(objTable).find("tfoot>tr>td>div>font").html());
    		return;
    	}
    	
		var defOpt = {
	        url:'url',//地址
	        data:{},//参数
	        pageSize:10,//每页显示行数
	        async:true,//同步异步
	        colPrefix:"myTabCol_",//方法名
	        myColName:"myColName",//属性名
	        orderNum:"orderNum",//行号
	        myOrder:"myOrder",//排序
	        style:"myJs_Table",//表格样式
	        success:function(items){
	        	//成功后返回对象
	        },
	        onclick:function(row){
	        	//单击一行事件
	        },
	        ondbclick:function(row){
	        	//双击一行事件
	        },
	        error:function(){
	        	//错误提示
	        }
	    };
		
		var optInfo = $.extend(defOpt, opts);
		
		if(objTable.data("myJqueryTable_initialize")!="initialize"){
    		objTable.initialize();
    	}
		
		objTable.data("myJqueryTable_optInfo",optInfo);
		objTable.load(1);
    }  
});