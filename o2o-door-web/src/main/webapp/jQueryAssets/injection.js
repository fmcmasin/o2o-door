//防止javascript注入
function injection(str) {
	return str.replace(/&amp;/g, "＆").replace(/&lt;/g, "＜").replace(/&gt;/g, "＞").replace(/</g, "＜").
	replace(/>/g, "＞").replace(/"/g, "＂").replace(/'/g, "＇").replace(/&/g,"＆");
};

//按回车执行确定 只能输入数字下划线
function reno_enter(e,load,iptThis,max){
	var regExp =/[^0-9]/g;
	var value = $(iptThis).val();
	if(regExp.test(value)){
		$(iptThis).val(
			value.replace(regExp,'')
		);
		return;
	}
	if(value>max){
		return;
	}
	var key = window.event ? e.keyCode : e.which;
	if(key==13){
		load(value);
	}
}