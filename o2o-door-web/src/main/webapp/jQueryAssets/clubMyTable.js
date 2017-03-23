//自定义分页标签插件
$.fn.extend({
    myClubTable:function(opts){  
    	var defOpt = {
	        url:'url',
	        data:{},
	        pageNum:1,
	        pageSize:10,
	        success:function(){
	        }
	    };
    	var optInfo = $.extend(defOpt, opts);
    	var pageNum=optInfo.pageNum;
    	//当前输入为0弹出，输入""弹出
    	if(pageNum==0){
    		return;
    	}
    	var json =optInfo.data;
    	json["pageNum"]=pageNum;
    	json["pageSize"]=optInfo.pageSize;
    	this.load(optInfo.url,json,function(){
    		optInfo.success();
		});
    },  
});

