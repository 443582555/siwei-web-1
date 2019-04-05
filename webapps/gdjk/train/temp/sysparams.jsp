<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
        	<div style="margin:10px">
	            <label>项目类型：</label><input id="key-type" class="easyui-textbox">
	            <label>项目名称：</label><input id="key-name" class="easyui-textbox">
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
        	if(!$("#dic-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
            $.ajax({
            	type: 'POST',
                url:'sys/addDic.do',
                data: {
                	dd_type_code:$("#dd_type_name").combobox("getText"),
                	dd_type_name:$("#dd_type_name").combobox("getValue"),
                	dd_value:$("#dd_value").textbox("getValue"),
                	dd_desc:$("#dd_desc").textbox("getValue"),
                	dd_status:$("#dd_status").combobox("getValue")
                },
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
        	if(!$("#dic-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
            $.ajax({
            	type: 'POST',
                url:'sys/updateDic.do',
                data: {
                	dd_type_code:$("#dd_type_name").combobox("getText"),
                	dd_type_name:$("#dd_type_name").combobox("getValue"),
                	dd_value:$("#dd_value").textbox("getValue"),
                	dd_desc:$("#dd_desc").textbox("getValue"),
                	dd_id:$('#dg').datagrid('getSelected').dd_id,
                	dd_status:$("#dd_status").combobox("getValue")
                },
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
                        url:'sys/deleteDic.do',
                        data:{
                            dd_id: item.dd_id
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
        	$("#dd_type_name").combobox("enable");
            $('<div id="dialog"></div>').dialog({
                title: "添加信息",
                iconCls: 'icon-tim-add',
                width: 700,
                height: 400,
                modal:true,
                closed: false,
                href: "train/sysparams-dialog.do",
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
                        $('#dialog').dialog('destroy');                  
                    }
                }]
            });
        }
        
        /**
        * Name 打开修改窗口
        */
        function openEdit(){
        	$("#dd_type_name").combobox("disable");
            var item = $('#dg').datagrid('getSelected');
            if(!item){
                $.messager.alert('提醒','请选择需要修改的记录!');
                return false;
            }
            
            $('<div id="dialog"></div>').dialog({
                title: "修改信息",
                iconCls: 'icon-tim-add',
                width: 700,
                height: 400,
                modal:true,
                closed: false,
                href: "train/sysparams-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	$('#dic-form').form('load', item);
                },
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: edit
                }, {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $('#dialog').dialog('destroy');
                    }
                }]
            });
        }	

        /*
        * 检索
        */
        function query(){
        	$('#dg').datagrid('options').queryParams = {
            	dd_type_name: $("#key-type").val(),
                dd_value: $("#key-name").val()
            };
            $('#dg').datagrid("reload");
        }
        function reset(){
            $("#key-type").textbox('setValue','');
		    $("#key-name").textbox('setValue','');
            $('#dg').datagrid('options').queryParams = {};
            $('#dg').datagrid("reload");
        }
        
        $('#dg').datagrid({
		    title:'系统参数配置',
		    rownumbers:true,
		    pageSize:20,
		    pagination:true,
		    singleSelect:true,		    
		    remoteSort:false,
		    border:false,
		    fitColumns:true,
            fit:true,
            striped: true,
		    url:'sys/dictionariesList.do',
		    columns:[[
		    	{field:'',align:'center',checkbox:true},
		        {field:'dd_type_name',title:'项目类型',width:'25%',align:'center'},
		        {field:'dd_value',title:'项目名称',width:'25%',align:'right',align:'center'},
		        {field:'dd_status',title:'项目状态',width:'25%',align:'right',align:'center'},
		        {field:'dd_desc',title:'项目描述',width:'25%',align:'center'}
		    ]],
		    groupField:'dd_type_code',
		    view: groupview,
		    groupFormatter:function(value, rows){
		        return value + '(' + rows.length + ')';
		    },
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
	        }],
            onLoadSuccess: function () {
                $('#dg').datagrid('collapseGroup');//默认分组折叠
            }
		});
    </script>