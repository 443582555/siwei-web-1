<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>设备维修记录</title>
</head>
<body>
	<style>
		.datagrid-cell, .datagrid-cell-group, .datagrid-header-rownumber, .datagrid-cell-rownumber{
			text-overflow: ellipsis;
		}
	</style>
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
        	if(!$("#sbwxjl-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
            $.ajax({
            	type: 'POST',
                url:'equ/addSbwx.do',
                data: $('#sbwxjl-form').serialize(),
                dataType: "json",
                success:function(data){
                    var returnMsg = data.returnMsg?data.returnMsg:"提交失败";
                    if(data && 'Y' == data.state){
                        $.messager.alert('信息提示',returnMsg,'info');
                        $('#dialog').dialog('destroy');
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
        	if(!$("#sbwxjl-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
            $.ajax({
            	type: 'POST',
                url:'equ/updateSbwx.do',
                data: $('#sbwxjl-form').serialize(),
                dataType: "json",
                success:function(data){
                    var returnMsg = data.returnMsg?data.returnMsg:"提交失败";
                    if(data && 'Y' == data.state){
                        $.messager.alert('信息提示',returnMsg,'info');
                        $('#dialog').dialog('destroy');
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
            var items = $('#dg').datagrid('getChecked');
            var idsArray = [];
            if(items.length == 0){
                $.messager.alert('提醒','请选择需要删除的记录!');
                return false;
            }
            for(var i in items){
            	idsArray.push(items[i].id)
            }
            $.messager.confirm('信息提示','确定要删除该记录？', function(result){
                if(result){
                    $.ajax({
                    	type: 'POST',
                        url:'equ/deleteSbwx.do',
                        data:{
                            ids:idsArray.join(",")
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
                height: 450,
                modal:true,
                closed: false,
                href: "train/sbwxjl-dialog.do",
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
            var items = $('#dg').datagrid('getChecked');
            if(items.length != 1){
                $.messager.alert('提醒','修改时必须且只能选中一条记录!');
                return false;
            }
            
            $('<div id="dialog"></div>').dialog({
                title: "修改信息",
                width: 700,
                height: 450,
                modal:true,
                closed: false,
                href: "train/sbwxjl-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	$('#sbwxjl-form').form('load', items[0]);
                	
                	$('#issue').combobox("setValue",items[0].issue)
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
        	$('#dg').datagrid('options').queryParams = {
        		sw_id: $("#key-sw-id").val()
            };
            $('#dg').datagrid("reload");           
        }
        
        /**
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'equ/sbwxjlList.do',
            method:'post',
            singleSelect:false,
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
                { field:'sw_id',title:'设备号',width:100,align:'center'}
		    ]],
            columns:[[                
                { field:'devtype_name',title:'设备类型',width:100,align:'center'},
                { field:'mtype_name',title:'故障类型',width:100,align:'center'},
                { field:'issue',title:'故障现象',width:100,align:'center',
                	                    formatter: function(value,row,index){
                		                      return '<span title='+value+'>'+value+'</span>'  
                		                    }},
                { field:'response',title:'现场反馈',width:100,align:'center'},
                { field:'mtime',title:'故障发生时间',width:150,align:'center'},
                { field:'issue_place',title:'故障发生地点',width:100,align:'center'},
                { field:'resolved',title:'解决方法',width:100,align:'center'},
                { field:'maintain_date',title:'送修日期',width:150,align:'center'},
                { field:'is_calibration',title:'是否标定',width:100,align:'center'},
                { field:'idpaydept',title:'是否收费',width:100,align:'center'},
                { field:'amount',title:'收费金额',width:100,align:'center'},
                { field:'manperson',title:'送修人',width:100,align:'center'},
                { field:'user_name',title:'填写人',width:100,align:'center'}                    
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
        
        var issues=${gzjson};
    </script>
</body>
</html>