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
            	type: 'POST',
                url:'equ/addSb.do',
                data: $('#sb-form').serialize(),
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
            $.ajax({
            	type: 'POST',
                url:'equ/updateSb.do',
                data: $('#sb-form').serialize(),
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
                        url:'equ/deleteSb.do',
                        data:{
                            id:item.id
                        },
                        dataType: "json",
                        success:function(data){
                            var returnMsg = data.returnMsg?data.returnMsg:"提交失败";
                    		if(data && 'Y' == data.state){
                        		$.messager.alert('信息提示',returnMsg,'info');
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
                height: 400,
                modal:true,
                closed: false,
                href: "train/sb-dialog.do",
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
                href: "train/sb-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	$('#sb-form').form('load', item);
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
                depart_id: $("#key-dept").val()
            };
            $('#dg').datagrid("reload");           
        }
        function reset(){
            $("#key-dept").textbox('setValue','');
            $('#dg').datagrid('options').queryParams = {};
            $('#dg').datagrid("reload");           
        }
        
        /**
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'equ/sbList.do',
            method:'post',
            singleSelect:true,
            toolbar:'#toolbar',
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
                { field:'id',title:'设备号',width:100,align:'center'}
		    ]],
            columns:[[                
                { field:'name',title:'设备名称',width:100,align:'center'},
                { field:'model',title:'设备型号',width:100,align:'center'},
                { field:'sn',title:'设备sn码',width:100,align:'center'},
                { field:'server_code',title:'快速服务代码',width:100,align:'center'},
                { field:'dept_id',title:'设备所属单位id',width:100,align:'center'},
                { field:'dept_name',title:'设备所属单位',width:100,align:'center'},
                { field:'purchase_date',title:'采购日期',width:100,align:'center'},
                { field:'production_date',title:'设备出厂日期',width:100,align:'center'},
                { field:'status',title:'设备状态',width:100,align:'center'},
                { field:'num',title:'采购数量',width:100,align:'center'},
                { field:'price',title:'采购单价',width:100,align:'center'},
                { field:'total_price',title:'采购总价',width:100,align:'center'},
                { field:'export_number',title:'出库数量',width:100,align:'center'},
                { field:'surplus_number',title:'剩余数量',width:100,align:'center'},
                { field:'cs',title:'与cs绑定',width:100,align:'center'},
                { field:'insert_date',title:'插入时间',width:100,align:'center'},
                { field:'update_date',title:'修改时间',width:100,align:'center'},
                { field:'tu_id',title:'用户id',width:100,align:'center'}
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