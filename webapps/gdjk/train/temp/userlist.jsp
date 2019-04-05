<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户管理</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
        	<div style="margin:10px">
	            <label>姓名：</label><input id="key-username" class="easyui-textbox">
	            <label>账号：</label><input id="key-loginname" class="easyui-textbox">
	            <input type="hidden" id="key-dept">
	            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="query()">查询</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-undo" onclick="reset()">重置</a>
            </div>
		</div>
		<div data-options="region:'west',split:true,collapsible:false,title:'单位目录'" style="width:250px;padding:10px;">
			<ul id="tt" data-options="url:'sys/getDepTree.do'"></ul>
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
        	if(!$("#user-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
        	$.ajax({
        		type: 'POST',
                url:'sys/addUser.do',
                data: $('#user-form').serialize(),
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
            });
        }
        
        /**
        * Name 修改记录
        */
        function edit(){
        	if(!$("#user-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
       		$.ajax({
       			type: 'POST',
                url:'sys/updateUser.do',
                data: $('#user-form').serialize(),
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
            });
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
                        url:'sys/deleteUser.do',
                        data:{
                            tu_id:item.tu_id
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
                href: "train/userlist-dialog.do",
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
                iconCls: 'icon-tim-add',
                width: 700,
                height: 400,
                modal:true,
                closed: false,
                href: "train/userlist-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	$('#user-form').form('load', item);
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
            	depart_id: $('#tt').tree("getSelected")?$('#tt').tree("getSelected").id:"",        //部门
                username: $("#key-username").val(),     //用户名
                login_name: $("#key-loginname").val()   //登录名
            };
            $('#dg').datagrid("reload");            
        }
        
        function reset(){
        	$("#tt").find('.tree-node-selected').removeClass('tree-node-selected');
            $("#key-username").val("");
            $("#key-loginname").val("");
        	$('#dg').datagrid('options').queryParams = {};
            $('#dg').datagrid("reload");            
        }
        
        /*
        * 右侧用户列表
        */
        $('#dg').datagrid({
            url:'sys/userList.do',
            method:'post',
            title:'用户信息', 
	        iconCls:'icon-edit',
            singleSelect:true,
            rownumbers:true,
            pageSize:20,
            pagination:true,
            multiSort:true,
            fitColumns:false,
            fit:true,
            border:false,
            striped: true,
            frozenColumns:[[
		        { field:'',align:'center',checkbox:true},
                { field:'username',title:'姓名',width:'100',align:'center'},
                { field:'login_name',title:'帐号',width:'100',align:'center'}
		    ]],
            columns:[[
                { field:'tr_name',title:'角色',width:'100',align:'center'},
                { field:'depart_name',title:'单位',width:'230',align:'center'},
                { field:'mobile',title:'电话',width:'150',align:'center'},
                { field:'email',title:'邮箱',width:'200',align:'center'},
                { field:'gen_time',title:'创建时间',width:'170',align:'center'},
                { field:'login_time',title:'登录时间',width:'170',align:'center'},
                { field:'last_login_time',title:'上次登录时间',width:'170',align:'center'},
                { field:'count',title:'登录次数',width:'100',align:'center'}
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
	        }],
        });
        
		/*
         * 左侧单位目录
         */
    	$('#tt').tree({
    		animate: true,
			onClick: function(node){
				query();
			}
		});
    </script>
</body>
</html>