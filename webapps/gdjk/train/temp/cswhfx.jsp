<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>标定基准参数</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
            <div style="margin:10px">
                <label>设备号：</label>
 				<input class="easyui-textbox" name="key-sw-id" id="key-sw-id">
                <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="query()">查询</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-undo" onclick="reset()">重置</a>
            </div>
        </div>
        <div data-options="region:'center'">
        	<table id="dg" class="easyui-datagrid"></table>
        </div>
    </div>
    
    <script type="text/javascript">
        /**
        * Name 添加记录
        */
        function add(){
        	if(!$("#bdjzcs-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
            $.ajax({
            	type: 'POST',
                url:'equ/addJccs.do',
                data: $('#bdjzcs-form').serialize(),
                dataType: "json",
                success:function(data){
                    var returnMsg = data.returnMsg?data.returnMsg:"提交失败";
	                if(data && 'Y' == data.state){
	                    $.messager.alert('信息提示',returnMsg,'info');
	                    $('#dialog').dialog('close');
	                }else{
	                    $.messager.alert('信息提示',returnMsg,'info');
	                }
	                $('#dg').datagrid('reload');
                }
            })
        }
        
        /**
        * Name 修改记录
        */
        function edit(){
        	if(!$("#bdjzcs-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
            $.ajax({
            	type: 'POST',
                url:'equ/updateJccs.do',
                data: $('#bdjzcs-form').serialize(),
                dataType: "json",
                success:function(data){
                    var returnMsg = data.returnMsg?data.returnMsg:"提交失败";
	                if(data && 'Y' == data.state){
	                    $.messager.alert('信息提示',returnMsg,'info');
	                    $('#dialog').dialog('close');
	                }else{
	                    $.messager.alert('信息提示',returnMsg,'info');
	                }
	                $('#dg').datagrid('reload');
                }
            })
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
                        url:'equ/deleteJccs.do',
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
        
        /**
        * Name 打开添加窗口
        */
        function openAdd(){
            $('<div id="dialog"></div>').dialog({
                title: "添加信息",
                width: 700,
                height: 500,
                modal:true,
                closed: false,
                href: "train/bdjzcs-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: add
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
        * Name 打开修改窗口
        */
        function openEdit(){
            var item = $('#dg').datagrid('getSelected');
            if(!item){
                $.messager.alert('提醒','请选择需要修改的记录!');
                return false;
            }
            
            $('<div id="dialog"></div>').dialog({
                title: "修改信息",
                width: 700,
                height: 500,
                modal:true,
                closed: false,
                href: "train/bdjzcs-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	$('#bdjzcs-form').form('load', item);
                },
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: edit
                }, {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $('#dialog').dialog('close');                    
                    }
                }]
            });
        }	

        /*
        * 检索
        */
        function query(){
            $.ajax({
                url: 'equ/jccsList.do',
                method: 'post',
                data: {
                    sw_id: $("#key-dept").val(),
                },
                dataType: "json",
                success: function(data){
                    $('#dg').datagrid('loadData',data.rows);
                }
            })            
        }
        
        /**
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'equ/jccsList.do',
            method:'post',
            singleSelect:true,
            footer:'#ft',
            rownumbers:true,
            pageSize:20,           
            pagination:true,
            multiSort:true,
            fitColumns:false,
            fit:true,
            border:false,
            striped: true,
            frozenColumns:[[
		        { field:'',width:100,align:'center',checkbox:true},
		        { field:'swinstrumentid',title:'检测仪序列号',width:120,align:'center'}
		    ]],
            columns:[[
                { field:'meatime',title:'标定时间',width:100,align:'center'},
                { field:'materialref',title:'温度改正系数',width:150,align:'center'},
                { field:'lencd',title:'出厂cd',width:100,align:'center'},
                { field:'lenh',title:'出厂h',width:100,align:'center'},
                { field:'wheeldiameter',title:'编码器出厂直径',width:150,align:'center'},
                { field:'lenac',title:'出厂ac',width:100,align:'center'},
                { field:'lenbd',title:'出厂bd',width:100,align:'center'},
                { field:'lenab',title:'出厂ab',width:100,align:'center'},
                { field:'leneo',title:'出厂eo',width:100,align:'center'},
                { field:'lenfo',title:'出厂fo',width:100,align:'center'},
                { field:'distsensorat',title:'出厂at',width:100,align:'center'},
                { field:'distsensorbt',title:'出厂bt',width:100,align:'center'},
                { field:'distsensorct',title:'出厂ct',width:100,align:'center'},
                { field:'distsensordt',title:'出厂dt',width:100,align:'center'},
                { field:'leftdistsensorkl',title:'左棱镜至中心距离',width:150,align:'center'},
                { field:'rightdistsensorkr',title:'右棱镜至中心距离',width:150,align:'center'},
                { field:'anglesensorxt',title:'出厂xt',width:100,align:'center'},
                { field:'anglesensoryt',title:'出厂yt',width:100,align:'center'},
                { field:'anglesensorkx',title:'出厂kx',width:100,align:'center'},
                { field:'anglesensorky',title:'出厂ky',width:100,align:'center'}                       
            ]],
            toolbar: [{
	            text: '添加', 
	            iconCls: 'icon-add', 
	            handler: openAdd
	        }, '-', { 
	            text: '修改', 
	            iconCls: 'icon-edit', 
	            handler: openEdit
	        }, '-',{ 
	            text: '删除', 
	            iconCls: 'icon-remove', 
	            handler: remove
	        }]
        });
    </script>
</body>
</html>