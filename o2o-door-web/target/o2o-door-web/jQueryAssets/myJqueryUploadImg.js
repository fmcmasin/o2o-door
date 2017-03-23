$.fn.extend({
    myUploadImage:function(opts){  
    	var objUpload = this;
    	if(opts=="getDelUrls"){
    		return objUpload.data("images_del_url");
    	}
    	objUpload.data("images_del_url",[]);
    	var defOpt = {
	        name:'o2o_file_upload',
	        countMax:5,
	        maxWidth:150,
	        maxHeight:150,
	        updateImgPrefix:"",
	        updateObject:[],
	        updateUrl:""
	    };
    	var optInfo = $.extend(defOpt, opts);
    	objUpload.load=function(){
    		objUpload.html("<div></div><div></div>");
    	};
    	objUpload.updateLoad=function(){
    		firstU=objUpload.find(">div:first-child");
    		lastI=objUpload.find(">div:last-child");
    		var urls=optInfo.updateObject;
    		for(var i=0;i<urls.length;i++){
    			var path=optInfo.updateImgPrefix;
    			var pName=optInfo.updateUrl;
    			path+=pName==""?urls[i]:urls[i][pName];
    			firstU.append('<input type="file" name="'+optInfo.name+'" style="display: none;" >');
    			lastI.append('<div class="___upload___images" Object_Index='+i+' style="width:'+optInfo.maxWidth
        				+'px;height:'+optInfo.maxHeight+'px;" ><img style="max-width:'
        				+optInfo.maxWidth+'px;max-height: '+optInfo.maxHeight
        				+'px;" src="'+path+'" /><div class="___upload___images___del"></div></div>');
    		}
    		$(".___upload___images").bind('mouseover',function (){
           		$(this).children(".___upload___images___del").show();
				}).bind('mouseout',function (){
					$(this).children(".___upload___images___del").hide();
				});
			$(".___upload___images___del").bind('click',function(){
				var p=$(this).parent(".___upload___images");
				objUpload.data("images_del_url").push(urls[p.attr('Object_Index')]);
				var myIndex =lastI.children("div").index(p);
				$(firstU.find("input[name=" + optInfo.name + "][type='file']")[myIndex]).remove();
				p.remove();
				var vInput=firstU.find("input:visible");
				if(vInput.length<=0){
					objUpload.addFile();
				}
			});
    	}
    	objUpload.addFile=function(){
    		firstU=objUpload.find(">div:first-child");
    		lastI=objUpload.find(">div:last-child");
    		var inputFile =firstU.find("input[name=" + optInfo.name + "][type='file']");
    		if(inputFile.length>=optInfo.countMax){
    			return;
    		}
    		firstU.append('<input type="file" name="'+optInfo.name+'">');
    		inputFile =firstU.find("input[name=" + optInfo.name + "][type='file']");
    		inputFile.unbind('change').bind('change',function(){
    			$(this).hide();
    			objUpload.addFile();
    			var index = firstU.children("input").index($(this));
    			lastI.append('<div class="___upload___images" style="width:'+optInfo.maxWidth
    				+'px;height:'+optInfo.maxHeight+'px;" ><img style="max-width:'
    				+optInfo.maxWidth+'px;max-height: '+optInfo.maxHeight
    				+'px;" /><div class="___upload___images___del"></div></div>');
    			var file=this.files[0];
    			var url = null;
	            if (window.createObjectURL != undefined) {
	                url = window.createObjectURL(file);
	            } else if (window.URL != undefined) {
	                url = window.URL.createObjectURL(file);
	            } else if (window.webkitURL != undefined) {
	                url = window.webkitURL.createObjectURL(file);
	            }
	            $(lastI.children("div")[index]).children("img").attr('src',url);
	            $(lastI.children("div")[index]).bind('mouseover',function (){
	           		$(this).children(".___upload___images___del").show();
   				}).bind('mouseout',function (){
   					$(this).children(".___upload___images___del").hide();
   				});
	            $(lastI.children("div")[index])
	            	.children(".___upload___images___del").bind('click',function(){
   					var p=$(this).parent(".___upload___images");
   					var myIndex =lastI.children("div").index(p);
   					$(firstU.find("input[name=" + optInfo.name + "][type='file']")[myIndex]).remove();
   					p.remove();
   					var vInput=firstU.find("input:visible");
   					if(vInput.length<=0){
   						objUpload.addFile();
   					}
   				});
	    	});
    	};
    	objUpload.load();
    	if(optInfo.updateObject.length>0){
    		objUpload.updateLoad();
    	}
    	objUpload.addFile();	
    },  
});
