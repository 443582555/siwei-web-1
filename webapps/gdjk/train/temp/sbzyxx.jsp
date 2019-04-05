<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>标定基准参数</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:130px;">
            <form id="searchForm">
	            <div style="margin:10px">
		                <label>小车序列号：</label>
		 				<input class="easyui-textbox" name="swinstrumentid" id="key-xcxlh"> 
		                <label>作业ID：</label>
		 				<input class="easyui-textbox" name="taskid" id="key-zy">
		 				<label>工程名称：</label>
		 				<input class="easyui-textbox" name="project_name" id="key-gc">
		 				<label>线路名称：</label>
		 				<input class="easyui-textbox" name="line_name" id="key-xl">
		                <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="query()">查询</a>
		                <a href="#" class="easyui-linkbutton" iconCls="icon-undo" onclick="reset()">重置</a>
	            </div>
	            <div style="margin:10px">
	                <label>作业起始和结束时间：</label>
					<input class="easyui-datetimebox" type="text" name="start_time" id="key-start-time" style="width:180px">
					--
					<input class="easyui-datetimebox" type="text" name="end_time" id="key-end-time" style="width:180px">
	 				<label>是否有效：</label>
	 				<select class="easyui-combobox" name="sfyx_name" id="key-sfyx" data-options="editable:false" style="width:120px">
	 					<option value="">请选择</option>
	 					<c:forEach items="${shifouyouxiao}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
	            </div>
            </form>
        </div>
        <div data-options="region:'center'">
        	<table id="dg" class="easyui-datagrid"></table>
        </div>
    </div>
    
    <script type="text/javascript">
        /*
        * 检索
        */
        function query(){
            $('#dg').datagrid('options').queryParams = {
            	swinstrumentid: $("#key-xcxlh").val(),
            	taskid: $("#key-zy").val(),
                project_name: $("#key-gc").val(),
                line_name: $("#key-xl").val(),
                start_time: $("#key-start-time").val(),
                end_time: $("#key-end-time").val(),
                sfyx_name: $("#key-sfyx").val()
            };
            $('#dg').datagrid("reload");
        }
        
        function reset(){
        	$("#key-xcxlh").textbox('setValue','');
        	$("#key-zy").textbox('setValue','');
            $("#key-gc").textbox('setValue','');
            $("#key-xl").textbox('setValue','');
            $("#key-start-time").datetimebox('setValue','');
            $("#key-end-time").datetimebox('setValue','');
            $("#key-sfyx").textbox('setValue','');
            $('#dg').datagrid('options').queryParams = {};
            $('#dg').datagrid("reload");
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
                        url:'equ/deleteZy.do',
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
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'equ/zyList.do',
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
            striped: false,
            queryParams: {
            	id: '${id}'
            },
            frozenColumns:[[
		        { field:'',width:100,align:'center',checkbox:true},
                { field:'swinstrumentid',title:'小车序列号',sortable:true,width:100,align:'center'}
		    ]],
		    rowStyler: function(index,row){
				if (row.sfyx_name == "无效"){
					return 'background-color:#ddd;';
				}
			},
            columns:[[
				{ field:'taskid',title:'作业ID',sortable:true,width:410,align:'center'},
				{ field:'start_time',title:'作业起始时间',sortable:true,width:170,align:'center'},
				{ field:'end_time',title:'作业结束时间',sortable:true,width:170,align:'center'},
				{ field:'mileage',title:'作业长度',sortable:true,width:170,align:'center'},
                { field:'start_mileage',title:'起始里程',sortable:true,width:170,align:'center'},
                { field:'end_mileage',title:'终止里程',sortable:true,width:170,align:'center'},
            	{ field:'xcbda',title:'现场标定A',sortable:true,width:100,align:'center'},
            	{ field:'xcbdb',title:'现场标定B',sortable:true,width:100,align:'center'},
            	{ field:'xcbdc',title:'现场标定C',sortable:true,width:100,align:'center'},
            	{ field:'xcbdd',title:'现场标定D',sortable:true,width:100,align:'center'},
            	{ field:'qjcgqfw',title:'单作业倾角传感器0的百分比',sortable:true,width:150,align:'center'},
 
            	{ field:'wdcgqzxz',title:'作业温度传感器最小值',sortable:true,width:150,align:'center'},
            	{ field:'wdcgqzdz',title:'作业温度传感器最大值',sortable:true,width:150,align:'center'},
            	{ field:'bmq1',title:'编码器',sortable:true,width:100,align:'center'},
            	{ field:'bmq2',title:'编码器',sortable:true,width:100,align:'center'},
            	
            	{ field:'ywcgq1',title:'左位移传感器状态',sortable:true,width:150,align:'center'},
            	{ field:'ywcgq2',title:'右位移传感器状态',sortable:true,width:150,align:'center'},
                { field:'insert_time',title:'录入时间',sortable:true,width:170,align:'center'},
                { field:'update_time',title:'更新时间',sortable:true,width:170,align:'center'},
                { field:'bs',title:'计算次数',sortable:true,width:100,align:'center'},
                { field:'sfyx_name',title:'是否有效',sortable:true,width:100,align:'center'},
                { field:'ddd',title:'备注',width:100,align:'center'},
                { field:'wycgq',title:'位移传感器',sortable:true,width:150,align:'center'},
                { field:'wycgqp',title:'位移传感器P列',sortable:true,width:150,align:'center'},
                { field:'wycgqq',title:'位移传感器Q列 ',sortable:true,width:150,align:'center'},
                { field:'bczyhs',title:'本次作业的行数',sortable:true,width:150,align:'center'},
                { field:'eee',title:'操作',width:120,align:'center',formatter:formatOper}
            ]],
            toolbar: [{
	            text: '删除',
	            iconCls: 'icon-remove', 
	            handler: remove
	        }, '-', { 
	            text: '下载', 
	            iconCls: 'icon-down', 
	            handler: downLoad
	        }],
	        onLoadSuccess: function(){
				$('.sb').switchbutton({
            		onChange: function(checked){
                		$.ajax({
                			url: '',
                			type: 'post',
                			data: {
                				id: $(this).data("id"),
                				isChecked: checked
                			},
                			error: function (data) {
                    			alert("状态保存失败！");
                			}
                		})
            		}
        		})
			}
        });
        
        function formatOper(val,row,index){
        	var isChecked = row.isChecked?"checked":"";
        	return '<input class="sb" data-id="'+row.id+'" '+isChecked+' data-options="onText:\'已处理\',offText:\'未处理\'" style="width:100px;height:30px">';
        }
        
        function downLoad(){
           window.location.href ="equ/download_index.do?"+$("#searchForm").serialize();
        }
    </script>
</body>
</html>