<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>配件信息</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
            <div style="margin:10px">
                <label>名称：</label>
 				<input class="easyui-textbox" name="key-name" id="key-name">
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
	             url:'lj/insertLj.do',
	             data: $('#pjxx-form').serialize(),
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
	             url:'lj/updateLj.do',
	             data: $('#pjxx-form').serialize(),
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
	                     url:'lj/deleteLj.do',
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
	             href: "train/pjxx-dialog.do",
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
	             href: "train/pjxx-dialog.do",
	             onClose:function(){  
	                 $(this).dialog('destroy');  
	             },
	             onLoad:function(){
	             	$('#pjxx-form').form('load', item);
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
	             name: $("#key-name").val()
	         };
	         $('#dg').datagrid("reload");           
	     }
	     function reset(){
	         $("#key-name").textbox('setValue','');
	         $('#dg').datagrid('options').queryParams = {};
	         $('#dg').datagrid("reload");           
	     }
        
        /**
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'lj/queryLjList.do',
            method:'post',
            singleSelect:true,
            footer:'#ft',
            rownumbers:true,
            pageSize:50,           
            pagination:true,
            multiSort:false,
            fitColumns:false,
            fit:true,
            border:false,
            striped: true,
            frozenColumns:[[
		        { field:'',width:100,align:'center',checkbox:true},
		    ]],
            columns:[[
				{ field:'code',title:'物料编号',sortable:true,width:150,align:'center'},
				{ field:'name',title:'名称',sortable:true,width:100,align:'center'},
				{ field:'price',title:'单价',sortable:true,width:100,align:'center'},
				{ field:'amount',title:'数量',sortable:true,width:100,align:'center'},
                { field:'source_name',title:'货源',sortable:true,width:180,align:'center'},
                { field:'source_tel',title:'联系人及电话',sortable:true,width:180,align:'center'},
                { field:'remark',title:'备注',sortable:true,width:100,align:'center'},
            	{ field:'inserttime',title:'插入日期',sortable:true,width:150,align:'center'},
            	{ field:'updatetime',title:'更新日期',sortable:true,width:150,align:'center'},
            	{ field:'operator',title:'操作人',sortable:true,width:100,align:'center'}
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