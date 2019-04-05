<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
            <div style="margin:10px">
                <label>类型：</label>
				<select id="op_type" class="easyui-combobox" id="op_type" style="width:120px;">
				    <option value="add">新增</option>
				    <option value="edit">修改</option>
				    <option value="remove">删除</option>
				</select>
                <label>时间区间：</label>
				<input class="easyui-datebox" type="text" id="startDate" style="width:120px">
				--
				<input class="easyui-datebox" type="text" id="endDate" style="width:120px">
                <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="query()">查询</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-undo" onclick="reset()">重置</a>
	        </div>
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
            	op_type: $("#op_type").val(),
		        startDate: $("#startDate").val(),
		        endDate: $("#endDate").val()
            };
            $('#dg').datagrid("reload");  
        }
        
        function reset(){
            $("#op_type").textbox('setValue','');
		    $("#startDate").datebox('setValue','');
		    $("#endDate").datebox('setValue','');
            $('#dg').datagrid('options').queryParams = {};
            $('#dg').datagrid("reload");           
        }
        
        /**
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'sys/logList.do',
            method:'post',
            singleSelect:true,
            footer:'#ft',
            rownumbers:true,
            pageSize:10,           
            pagination:true,
            multiSort:true,
            fitColumns:true,
            fit:true,
            border:false,
            striped: true,
            nowrap: false,
            columns:[[
                { field:'',width:50,align:'center',checkbox:true},
                { field:'tu_name',title:'操作人员',width:50,align:'center'},
                { field:'op_type',title:'日志类型',width:50,align:'center'},
                { field:'page_name',title:'功能页面',width:50,align:'center'},
                { field:'outline',title:'概要信息',width:80,align:'center'},
                { field:'content_d',title:'详细信息',width:300,align:'center'},
                { field:'gen_time',title:'日志创建时间',width:100,align:'center'}
            ]]
        });
    </script>