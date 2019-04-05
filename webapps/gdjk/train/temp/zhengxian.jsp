<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
            <div style="margin:10px" class="searchSection">
                <label>铁路线名称：</label><input id="key-rwb_name" class="easyui-textbox">
                <label>线路行别类型：</label><input id="key-rwb_traveltype" class="easyui-textbox">
                <label>铁路线大类类型：</label><input id="key-rwb_railwaybigtype" class="easyui-textbox">
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
        	if(!$("#zhengxian-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
            $.ajax({
                url:'line/addLine.do',
                data: $('#zhengxian-form').serialize(),
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
        	if(!$("#zhengxian-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
            $.ajax({
            	type: 'POST',
                url:'line/updateLine.do',
                data: $('#zhengxian-form').serialize(),
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
                        url:'line/deleteLine.do',
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
                href: "train/lineDialog.do?rwb_railwaybigtype=1",
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
                href: "train/lineDialog.do?rwb_railwaybigtype=1",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	$('#zhengxian-form').form('load', item);
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
            	rwb_name: $("#key-rwb_name").val(),
            	rwb_traveltype: $("#key-rwb_traveltype").val(),
            	rwb_railwaybigtype: $("#key-rwb_railwaybigtype").val()
            };
            $('#dg').datagrid("reload");
        }
        
        function reset(){
        	$("#key-rwb_name").textbox("setValue","");
        	$("#key-rwb_traveltype").textbox("setValue","");
        	$("#key-rwb_railwaybigtype").textbox("setValue","");
        	$('#dg').datagrid('options').queryParams = {};
            $('#dg').datagrid("reload");
        }
        
        /**
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'line/queryLine.do',
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
		        { field:'',align:'center',checkbox:true},
                { field:'rwb_name',title:'铁路线名称',width:120,align:'center'},
		        { field:'rwb_railwayno',title:'铁路线编码',width:150,align:'center'}
		    ]],
            columns:[[
            	{ field:'rwb_traveltype_name',title:'线路行别类型',width:120,align:'center'},
            	{ field:'rwb_traveltype_name',title:'下属车站',width:120,align:'center'},
                { field:'rwb_managetype_name',title:'铁路线管辖类别',width:120,align:'center'},
                { field:'rwb_lenth',title:'铁路线长度',width:120,align:'center'},
                { field:'rwb_state_name',title:'线路运营状态',width:120,align:'center'},
                { field:'rwb_tracktype_name',title:'线路轨道类型',width:120,align:'center'},
                { field:'rwb_railtype_name',title:'线路钢轨类型',width:120,align:'center'},
                { field:'rwb_railgrade_name',title:'线路速度等级',width:120,align:'center'},
                { field:'rwb_builddate',title:'修建日期',width:120,align:'center'},
                { field:'rwb_opendate',title:'通车日期',width:120,align:'center'},
                { field:'rwb_recdate',title:'信息录入日期',width:150,align:'center'},
                { field:'rwb_recnameno',title:'信息录入人员编码',width:150,align:'center'},
                { field:'rwb_lastupdatemanno',title:'最后一次维护人员编码',width:150,align:'center'},
                { field:'rwb_lastupdatedatetime',title:'最后一次维护时间',width:150,align:'center'},
                { field:'rwb_unitenable_name',title:'是否有效',width:120,align:'center'},
                { field:'rwb_unitdelete_name',title:'是否删除',width:120,align:'center'},
                { field:'rwb_remark',title:'说明',width:120,align:'center'}
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