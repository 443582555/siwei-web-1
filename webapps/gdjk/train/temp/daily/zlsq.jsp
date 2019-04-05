<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>租赁申请</title>
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
        	if(!$("#zlsq-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
        	if($("[name='sqr']").val() == $("[name='pzr']").val()){
        		$.messager.alert('信息提示',"批准人和申请人不能是同一个人！",'info');
        		return false;
        	}
            $.ajax({
            	type: 'POST',
                url:'lj/insertZlsq.do',
                data: $('#zlsq-form').serialize(),
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
        	if(!$("#zlsq-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
        	if($("[name='sqr']").val() == $("[name='pzr']").val()){
        		$.messager.alert('信息提示',"批准人和申请人不能是同一个人！",'info');
        		return false;
        	}
            $.ajax({
            	type: 'POST',
                url:'lj/updateZlsq.do',
                data: $('#zlsq-form').serialize()+"&bh="+$("#bh").textbox("getValue"),
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
        	var item = $('#dg').datagrid('getSelected');
            if(!item){
                $.messager.alert('提醒','请选择需要删除的记录!');
                return false;
            }
            $.messager.confirm('信息提示','确定要删除该记录？', function(result){
                if(result){
                    $.ajax({
                    	type: 'POST',
                        url:'lj/deleteZlsq.do',
                        data:{
                        	id: item.id
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
                href: "train/zlsq-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad: function(){
                	$("#bh").textbox("disable")
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
                href: "train/zlsq-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	$('#zlsq-form').form('load', items[0]);
                	$("#bh").textbox("disable");
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
            url:'lj/queryZlsqList.do',
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
		        { field:'',width:100,align:'center',checkbox:true}
		    ]],
            columns:[[
            	{field:'lx_name',title:'租赁类型',width:100,align:'center'},
            	{field:'sbmc',title:'租赁设备名称',width:100,align:'center'},
            	{field:'bh',title:'租赁编号',width:180,align:'center'},
            	{field:'dw_name',title:'租赁单位',width:150,align:'center'},
            	{field:'sl',title:'拟租赁台数',width:100,align:'center'},
            	{field:'sbxlh',title:'租赁设备序列号',width:150,align:'center'},
            	{field:'lxr',title:'租赁单位联系人',width:150,align:'center'},
            	{field:'dh',title:'联系电话',width:100,align:'center'},
            	{field:'qsrq',title:'租赁起始日期',width:100,align:'center'},
            	{field:'jsrq',title:'租赁结束日期',width:100,align:'center'},
            	//{field:'smj',title:'合同扫描件',width:100,align:'center'},
            	{field:'sqr_name',title:'申请人',width:100,align:'center'},
            	{field:'sqrq',title:'申请日期',width:100,align:'center'},
            	{field:'pzr_name',title:'批准人',width:100,align:'center'},
            	{field:'pzrq',title:'批准日期',width:100,align:'center'},
            	{field:'lcdj',title:'里程单价',width:100,align:'center'},
            	{field:'tsdj',title:'天数单价',width:100,align:'center'},
            	{field:'_operate',title:'操作',width:180,align:'center',formatter:formatOper}
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
    	function formatOper(val,row,index){
    	    if("0"==row.sfty){
    	    	return '已同意'
    	    }else if("1"==row.sfty){
    	    	return '已拒绝'
    	    }else{
    	    	if(row.bOperate){
	    	    	return '<a href="#" onclick="shenhe('+row.id+',0)">同意</a>'+
	        		' <a href="#" onclick="shenhe('+row.id+',1)">不同意</a>';
    	    	}else{
    	    		return "尚未审批，您无权限"
    	    	}
    	    }
    	}
    	function shenhe(id,code){
    		$.ajax({
            	type: 'POST',
                url:'lj/updateZlsqsp.do',
                data:{
                	id: id,
                	sfty: code
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
    </script>
</body>
</html>