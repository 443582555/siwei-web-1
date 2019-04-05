<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',split:true,collapsible:false,title:'线路工程目录'" style="width:180px;padding:10px;">
			<ul id="tt1" class="easyui-tree" data-options="url:'line/queryLineName.do'"></ul>
		</div>
		<div data-options="region:'center',border:false">
			<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'west',split:true,collapsible:false,title:'单位名称目录'" style="width:250px;padding:10px;">
					<ul id="tt2" class="easyui-tree" data-options="url:'sys/getDepTree.do'"></ul>
				</div>
				<div data-options="region:'center',title:'单位线路信息'">
					<div id="toolbar">
						<div style="padding:10px;border-bottom: 1px solid #ccc;">
			                <label>线路名称：</label><input id="key-line-name" class="easyui-textbox">
			                <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="query()">查询</a>
			                <a href="#" class="easyui-linkbutton" iconCls="icon-undo" onclick="reset()">重置</a>
			            </div>
			            <div>
							<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openAdd()">添加</a>
							<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="openEdit()">修改</a>
							<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="remove()">删除</a>
						</div>
					</div>
					<table id="dg" class="easyui-datagrid"></table>
				</div>
			</div>
		</div>
    </div>
    
    <script type="text/javascript">
        /**
        * Name 添加记录
        */
        function add(){
        	if(!$("#linedept-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
        	var selected1 = $('#tt1').tree('getSelected');
        	var selected2 = $('#tt2').tree('getSelected');
            $.ajax({
                url:'line/addLineDept.do',
                data: {
                	line_id: selected1.id,
                	dept_id: selected2.id,
                	start_dk: $("#dialog [name='start_dk']").val(),
					end_dk: $("#dialog [name='end_dk']").val(),
					remark: $("#dialog [name='remark']").val()
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
        	if(!$("#linedept-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
        	var item = $('#dg').datagrid('getSelected');
            $.ajax({
            	type: 'POST',
                url:'line/updateLineDept.do',
                data: {
                	id: item.id,
                	line_id: item.line_id,
                	dept_id: item.dept_id,
                	start_dk: $("#dialog [name='start_dk']").val(),
					end_dk: $("#dialog [name='end_dk']").val(),
					remark: $("#dialog [name='remark']").val()
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
                        url:'line/deleteLineDept.do',
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
        	var selected1 = $('#tt1').tree('getSelected');
        	var selected2 = $('#tt2').tree('getSelected');
        	if(!selected1){
        		$.messager.alert('提醒','请选择线路名称！');
        		return;
        	}
        	if(!selected2){
        		$.messager.alert('提醒','请选择线路所属单位！');
        		return;
        	}
        	
            $('<div id="dialog"></div>').dialog({
                title: "添加信息",
                iconCls: 'icon-tim-add',
                width: 700,
                height: 400,
                modal:true,
                closed: false,
                href: "train/linedept-dialog.do",
                onLoad:function(){
                	$('#line_name').textbox('setValue',selected1.text);
                	$('#dept_name').textbox('setValue',selected2.text);
                },
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
                href: "train/linedept-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	$('#linedept-form').form('load', item);
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
            	line_name: $("#key-line-name").val()
            };
            $('#dg').datagrid("reload");
        }
        
        function reset(){
        	$("#key-line-name").textbox("setValue","");
        	$('#dg').datagrid('gotoPage', 1);
        }
        
        /**
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'line/queryLineDept.do',
            method:'post',
            singleSelect:true,
            footer:'#ft',
            toolbar:'#toolbar',
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
		        { field:'line_name',title:'线路名称',width:120,align:'center'}
		    ]],
            columns:[[
                { field:'dept_name',title:'单位名称',width:160,align:'center'},
                { field:'start_dk',title:'起始里程',width:100,align:'center'},
                { field:'end_dk',title:'终止里程',width:100,align:'center'},
                { field:'remark',title:'备注',width:100,align:'center'}
            ]]
        });
        
        $('#tt1').tree({
			onClick: function(node){
				$("#key-line-name").textbox("setValue",node.text);
				query();
			}
		});
		$('#tt2').tree({
			onClick: function(node){
				$("#key-dept-name").textbox("setValue",node.text);
				query();
			}
		});
    </script>