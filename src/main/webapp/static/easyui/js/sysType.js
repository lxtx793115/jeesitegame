//初始化方法
$(function(){
	//初始化表格
	$("#dg").datagrid({
		height:350,
		striped:true,
		url:basePath +'/SysType/loadTypes',
		queryParams:{
			keyWord:''
		},
		remoteSort: false,
		columns:[[
			{field:'name',title:'名称',width:150},
			{field:'code',title:'类型代码',width:100},
			{field:'typeDesc',title:'描述',width:200}
		]],
		pagination:true,
		onLoadSuccess: function(data){
			//$("#totalCount").text(data.total);
			//iniCernEvent();
		},
		onDblClickRow: function(rowIndex, rowData){
			code = rowData['code'];
			editSysType(rowData['name'],rowData['code']);
		}
	});
	
	enterPress('searchSysType()');
			

});

//绑定回车按钮事件
function enterPress(fn){
	$("input").die("keypress");
	$("input").live("keypress",function(e){
    	if(e.keyCode==13){
    		eval(fn);
    		return false;
		}
    });
}

var code = '';

//查询
function searchSysType(){
 	//查询分类
	$('#dg').datagrid('load',{keyWord:$("#query").val()});
 }

//新增
function newSysType(){
    $('#dlg').dialog('open').dialog('setTitle','新增系统类型');
    $('#fm').form('clear');
    
}
//编辑
function editSysType(title,code){
    $('#valueDlg').dialog('open').dialog('setTitle',"编辑选项—"+title);
    var lastIndex;
	$('#vDataGrid').datagrid({
		url:basePath +'/SysType/loadTypeItems',
		queryParams:{
			code:code
		},
		onBeforeLoad:function(){
			$(this).datagrid('rejectChanges');
		},
		onClickRow:function(rowIndex){
			if (lastIndex != rowIndex){
				$('#vDataGrid').datagrid('endEdit', lastIndex);
				$('#vDataGrid').datagrid('beginEdit', rowIndex);
			}
			lastIndex = rowIndex;
		}
	});
			
    
}
//保存
function saveSysType(){
    url = basePath +'/SysType/createType';    
    $('#fm').form('submit',{
        url: url,
        onSubmit: function(){
            return $(this).form('validate');
        },
        success: function(data){    	
            var result =  $.parseJSON(data);
            if (result.errorMsg){
            	alert(result.errorMsg);
            } else {
                $('#dlg').dialog('close');        // close the dialog
                $('#dg').datagrid('reload');    // reload the user data
            }
        }
    });
}

//删除
function delSysType(){
	var url = basePath +'/SysType/delType';   
    var row = $('#dg').datagrid('getSelected');
    if (row){
        $.messager.confirm('提示','你确定要删除么？',function(r){
            if (r){
               $.post(url, {id:row.code},
				   function(data){
				      $('#dg').datagrid('reload');  
				   },'json');
              
            }
        });
        
    }
}

//添加类型选项
function addSysTypeItem(){
	$("#vDataGrid").datagrid('appendRow',{
			name: '',
			code: code,
			value:'',
			itemOrder:'0'
		});
}
//保存类型选项
function saveSysTypeItems(){
	$('#vDataGrid').datagrid('acceptChanges');
	var rows = $("#vDataGrid").datagrid('getRows');
	var url = basePath +'/SysType/saveTypeItem';   
	$.post(url, {code:code,beans:$.toJSON(rows)},
				   function(data){
				   	  if(data.errorMsg){
				   	  	alert(data.errorMsg);
				   	  }else{
				      	$('#vDataGrid').datagrid('reload');
				      }
				   },'json');
	
}
//删除类型选项
function delSysTypeItem(){
	var row = $('#vDataGrid').datagrid('getSelected');
	if(!row){
		alert('请选择要删除的选项？');
		return;
	}
	var rowIndex = $('#vDataGrid').datagrid('getRowIndex',row)
	$('#vDataGrid').datagrid('deleteRow',rowIndex);
}
