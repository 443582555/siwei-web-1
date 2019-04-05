<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>设备标定记录</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
            <div style="margin:10px">
                <label>检测仪序列号：</label>
 				<input class="easyui-textbox" name="key-sw-id" id="key-sw-id">
 				<label>记录状态：</label>
 				<select class="easyui-combobox" id="key-st" data-options="editable:false" style="width: 130px;">
	 				<option value="all">全部</option>
	 				<option value="0" selected>最新记录</option>
	 				<option value="1">历史记录</option>
	 			</select>
                <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="query()">查询</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-undo" onclick="reset()">重置</a>
            </div>
        </div>
        <div data-options="region:'center'">
        	<table id="dg" class="easyui-datagrid"></table>
        </div>
    </div>
    
    <script type="text/javascript">
        function uploadFile (){
        	//获取上传文件控件内容
        	var file = $("#file").filebox('files')[0];
        	//判断控件中是否存在文件内容，如果不存在，弹出提示信息，阻止进一步操作
       		if (file == null) { alert('错误，请选择文件'); return; }
        	//获取文件名称
        	var fileName = file.name;
        	//获取文件类型名称
        	var file_typename = fileName.substring(fileName.lastIndexOf('.'), fileName.length);
        	//这里限定上传文件文件类型必须为.xlsx，如果文件类型不符，提示错误信息
        	if (file_typename == '.xlsx'){
            	var formData = new FormData($("#sbbdjl-form")[0]);
            	$.ajax({
                	url: "<%=basePath%>/equ/bdUpload.do",
                	type: 'POST',
                	data: formData,
                	cache: false,
                	contentType: false,
                	processData: false,
                	dataType: 'json',
                	success: function (data) {
                    	var returnMsg = data.returnMsg?data.returnMsg:"提交失败";
                    	if(data && 'Y' == data.state){
                        	$.messager.alert('信息提示',returnMsg,'info');
                        	$('#dialog').dialog('destroy');
                    	}else{
                       		$.messager.alert('信息提示',returnMsg,'info');
                    	}
                    	$('#dg').datagrid('reload');
                	},
                	error: function (data) {
                    	alert("失败");
                	}
            	});
        	}else {
            	alert("文件类型错误");
        	}
    	}
    	
        function openAdd(){
            $('<div id="dialog"></div>').dialog({
                title: "导入信息",
                width: 600,
                height: 360,
                modal:true,
                closed: false,
                href: "<%=basePath%>/train/sbbdjl-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                buttons: [{
                    text: '上传',
                    iconCls: 'icon-ok',
                    handler: uploadFile
                }, {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $('#dialog').dialog('close');                    
                    }
                }]
            });
        }
        /**
        * Name 删除记录
        */
        function remove(){
            var item = $('#dg').datagrid('getSelected');
            if(!item){
                $.messager.alert('提醒','请选择需要删除的记录!');
                return false;
            }
            $.messager.confirm('信息提示','确定要删除该记录？', function(result){
                if(result){
                    $.ajax({
                    	type: 'POST',
                        url:'<%=basePath%>/equ/deleteoutBd.do',
                        data:{
                            id:item.id
                        },
                        dataType: "json",
                        success:function(data){
                            var returnMsg = data.returnMsg?data.returnMsg:"提交失败";
                    		if(data && 'Y' == data.state){
                        		$.messager.alert('信息提示',returnMsg,'info');
                    		}else{
                       			$.messager.alert('信息提示',returnMsg,'info');
                    		}
                    		$('#dg').datagrid('reload');
                        }	
                    });
                }	
            });
        }
        
        function downLoad(){
        	window.location.href='<%=basePath%>/upLoad/SIWEI智能轨道检测仪出厂标定表模板.xlsx';
        }
        
        /*
        * 检索
        */
        function query(){
        	$('#dg').datagrid('options').queryParams = {
        		sw_id: $("#key-sw-id").val(),
        		zxjl: $("#key-st").combobox("getValue")
            };
            $('#dg').datagrid("reload"); 
        }
        
         function reset(){
         	$("#key-st").combobox("setValue","");
        	$('#dg').datagrid('options').queryParams = {};
            $('#dg').datagrid("reload"); 
        }
        
        /**
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'equ/outBdList.do',
            method:'post',
            singleSelect:true,
            footer:'#ft',
            rownumbers:true,
            pageSize:20,           
            pagination:true,
            multiSort:true,
            fitColumns:true,
            fit:true,
            border:false,
            striped: true,
            frozenColumns:[[
		        { field:'',width:100,align:'center',checkbox:true},
		        { field:'swinstrumentid',title:'检测仪序列号',width:120,align:'center'}
		    ]],
            columns:[[
                { field:'type_name',title:'标定类型',width:100,align:'center'},
                { field:'dsy',title:'检定员',width:100,align:'center'},
                { field:'bdrq',title:'标定日期',width:100,align:'center'},
                { field:'user_name',title:'操作人',width:100,align:'center'},
                { field:'retime',title:'录入时间',width:150,align:'center'},
                { field:'zxjl',title:'记录状态',width:100,align:'center'},
                { field:'dqbdcs',title:'当前标定次数',width:120,align:'center'},
                { field:'_operate',title:'操作',width:200,align:'center',formatter:formatOper}
            ]],
            toolbar: [{ 
	            text: '导入',
	            iconCls: 'icon-add', 
	            handler: openAdd
	        }, '-', { 
	            text: '删除',
	            iconCls: 'icon-remove', 
	            handler: remove
	        }, '-', { 
	            text: '模板下载',
	            iconCls: 'icon-down', 
	            handler: downLoad
	        }]
        });
        function formatOper(val,row,index){
        	var url=encodeURI("<%=basePath%>"+row.url);
        	return '<a href='+url+' class="easyui-linkbutton l-btn l-btn-small"><span class="l-btn-left"><span class="l-btn-text">下载文件</span></span></a> '
        			+'<a href="#" class="easyui-linkbutton l-btn l-btn-small"><span class="l-btn-left"><span class="l-btn-text" onclick="goBdDetail('+row.id+')">查询详情</span></span></a>';
        }
        function goBdDetail(id){
			$('<div id="dialog"></div>').dialog({
				title: '详情',
                width: '90%',
                height: '90%',
                modal:true,
                closed: false,
                href: "train/bdDetail.do?id="+id,
                onClose:function(){  
                    $(this).dialog('destroy');  
                }
            });
        }
    </script>
</body>
</html>