<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
            <div style="margin:10px" class="searchSection">
                <label>车站名称：</label><input id="key-station_name" class="easyui-textbox">
                <a href="#" class="easyui-linkbutton" iconcls="icon-search" onclick="query()">查询</a>
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
        	if(!$("#chezhan-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
            $.ajax({
                url:'line/addStation.do',
                data: $('#chezhan-form').serialize(),
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
        	if(!$("#chezhan-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
            $.ajax({
            	type: 'POST',
                url:'line/updateStation.do',
                data: $('#chezhan-form').serialize(),
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
                        url:'line/deleteStation.do',
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
                iconCls: 'icon-tim-add',
                width: 700,
                height: 450,
                modal:true,
                closed: false,
                href: "train/lineDialog.do?rwb_railwaybigtype=2",
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
                height: 450,
                modal:true,
                closed: false,
                href: "train/lineDialog.do?rwb_railwaybigtype=2",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	$('#chezhan-form').form('load', item);
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
            	name: $("#key-station_name").val()
            };
            $('#dg').datagrid("reload");
        }
        
        function reset(){
        	$("#key-station_name").textbox("setValue","");
        	$('#dg').datagrid('options').queryParams = {};
            $('#dg').datagrid("reload");
        }
        
        /**
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'line/queryStation.do',
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
		        { field:'',align:'center',checkbox:true},
		        { field:'name',title:'车站名称',width:150,align:'center'},
                { field:'rwb_stationno',title:'车站编码',width:120,align:'center'}
		    ]],
            columns:[[
                { field:'station_property',title:'车站属性',width:120,align:'center'},
                { field:'rwb_railwaykind_name',title:'车站附属正线',width:120,align:'center'},
                { field:'rwb_lenth',title:'车站中心里程',width:120,align:'center'},
                { field:'stock_number',title:'股道数',width:120,align:'center'}
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