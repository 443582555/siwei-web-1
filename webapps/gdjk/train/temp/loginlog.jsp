<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
        	<div style="margin:10px">
                <label>登录名：</label><input id="key-loginname" class="easyui-textbox">
                <label>用户名：</label><input id="key-username" class="easyui-textbox">
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
            	login_name: $("#key-loginname").val(),
                tu_name: $("#key-username").val()
            };
            $('#dg').datagrid("reload");
        }
        
        function reset(){
            $("#key-loginname").textbox('setValue','');
		    $("#key-username").textbox('setValue','');
            $('#dg').datagrid('options').queryParams = {};
            $('#dg').datagrid("reload");
        }
        
        /**
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'sys/loginLogList.do',
            method:'post',
            singleSelect:true,
            toolbar:'#toolbar',
            footer:'#ft',
            rownumbers:true,
            pageSize:20,
			border:false,
            pagination:true,
            multiSort:true,
            fitColumns:true,
            fit:true,
            columns:[[
                { field:'',width:100,align:'center',checkbox:true},
                { field:'log_id',title:'日志ID',width:150,align:'center'},
                { field:'tu_id',title:'登录人员ID',width:150,align:'center'} ,
                { field:'tu_name',title:'登陆人员姓名',width:150,align:'center'},
                { field:'designation',title:'单位名称',width:150,align:'center'},
                { field:'online_time',title:'上线时间',width:150,align:'center'},
                { field:'downline_time',title:'下线时间',width:150,align:'center'},
                { field:'ip',title:'登录IP',width:150,align:'center'}
            ]]
        });
    </script>