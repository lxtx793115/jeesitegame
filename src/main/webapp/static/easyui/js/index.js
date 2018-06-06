$(function(){
	buildTree();
});


//创建目录树
function buildTree(){
	$('#menu').accordion('add', {
		title: '编目管理',
		content: '<ul id="menu_bmgl"></ul>',
		selected: false
	});
	
	$('#menu').accordion('add', {
		title: '印前管理',
		content: '<ul id="menu_yqgl"></ul>',
		selected: false
	});
	
	$('#menu').accordion('add', {
		title: '审读管理',
		content: '<ul id="menu_sdgl"></ul>',
		selected: false
	});
	
	$('#menu').accordion('add', {
		title: '系统管理',
		content: '<ul id="menu_xtgl"></ul>',
		selected: false
	});
	$('#menu_bmgl').tree({
		url:basePath+'/sys/data/menu_bmgl.json',
		onClick:function(node){
			addTab(node.text, node.attributes["url"]);
		},
		onBeforeExpand:function(node,param){ 
			
		}
	}); 
	
	$('#menu_yqgl').tree({
		url:basePath+'/sys/data/menu_yqgl.json',
		onClick:function(node){			
		addTab(node.text, node.attributes["url"]);
		},
		onBeforeExpand:function(node,param){ 
			
		}
	});
	$('#menu_sdgl').tree({
		url:basePath+'/sys/data/menu_sdgl.json',
		onClick:function(node){
		addTab(node.text, node.attributes["url"]);
		},
		onBeforeExpand:function(node,param){
			
		}
	});
	$('#menu_xtgl').tree({
		url:basePath+'/sys/data/menu_xtgl.json',
		onClick:function(node){
		addTab(node.text, node.attributes["url"]);
		},
		onBeforeExpand:function(node,param){
			
		}
	});
}
