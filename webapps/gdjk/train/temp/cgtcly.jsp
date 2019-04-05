<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
            <div style="margin:10px">
                <label>设备所属单位：</label>
 				<input class="easyui-textbox" name="key-dept" id="key-dept">
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
            $.ajax({
                url:'equ/addCgtcly.do',
                data: {
                	name: $("#name").textbox("getValue"),
                	dept_id: $("#dept_id").combobox("getValue"),
                	dept_name: $("#dept_id").combobox("getText"),
                	production_date: $("#production_date").datebox("getValue"),
                	status: $("#status").textbox("getValue"),
                },
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
            $.ajax({
                url:'equ/updateCgtcly.do',
                data: {
                	id: $('#dg').datagrid('getSelected').id,
                	name: $("#name").textbox("getValue"),
                	dept_id: $("#dept_id").combobox("getValue"),
                	dept_name: $("#dept_id").combobox("getText"),
                	production_date: $("#production_date").datebox("getValue"),
                	status: $("#status").textbox("getValue"),
                },
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
                        url:'equ/deleteCgtcly.do',
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
                iconCls: 'icon-tim-add',
                width: 700,
                height: 400,
                modal:true,
                closed: false,
                href: "train/cgtcly-dialog.do",
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
            var item = $('#dg').datagrid('getSelected');
            if(!item){
                $.messager.alert('提醒','请选择需要修改的记录!');
                return false;
            }
            
            $('<div id="dialog"></div>').dialog({
                title: "修改信息",
                width: 700,
                height: 400,
                modal:true,
                closed: false,
                href: "train/cgtcly-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	$('#cgtcly-form').form('load', item);
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
            	dept_name: $("#key-dept").val()
            };
            $('#dg').datagrid("reload");
        }
        
        function reset(){
        	$("#key-dept").combobox("setValue", "");
        	$('#dg').datagrid('options').queryParams = {};
        	$('#dg').datagrid("reload");
        }
        
        /**
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'equ/cgtclyList.do',
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
            columns:[[
                { field:'',width:50,align:'center',checkbox:true},
                { field:'name',title:'设备名称',width:100,align:'center'},
                { field:'dept_name',title:'设备所属单位',width:150,align:'center'},
				{ field:'production_date',title:'设备出厂日期',width:100,align:'center'},
				{ field:'status',title:'设备状态',width:100,align:'center'},
                { field:'user_name',title:'添加人员',width:100,align:'center'}
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