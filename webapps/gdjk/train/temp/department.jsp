<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',split:true,collapsible:false,title:'单位目录'" style="width:250px;padding:10px;">
			<ul id="tt" data-options="url:'sys/getDepTree.do'"></ul>
		</div>
		<div data-options="region:'center',border:false">
			<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
					<div style="margin:10px">
			            <label>单位名称：</label><input id="key-dept" class="easyui-textbox"><input id="key-up-dept" type="hidden">
			            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="query()">查询</a>
			            <a href="#" class="easyui-linkbutton" iconCls="icon-undo" onclick="reset()">重置</a>
		            </div>
				</div>
				<div data-options="region:'center'">
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
        	if(!$("#dept-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
        	$.ajax({
            	type: 'POST',
                url:'<%=request.getContextPath()%>/sys/addDepartment.do',
                data: {
                	depart_name: $("#depart_name").textbox("getValue"),
                	p_id: $('#tt').tree('getSelected').id,
               		idPayDept: $("#idPayDept").textbox("getValue"),
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
        	if(!$("#dept-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
        	$.ajax({
            	type: 'POST',
                url:'<%=request.getContextPath()%>/sys/updateDepartment.do',
                data: {
                	depart_id: $('#dg').datagrid('getSelected').depart_id,
                	depart_name: $("#depart_name").textbox("getValue"),
               		idPayDept: $("#idPayDept").textbox("getValue"),
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
                        url:'<%=request.getContextPath()%>/sys/deleteDepartment.do',
                        data:{
                            depart_id: item.depart_id
                        },
                        dataType: "json",
                        success:function(data){
                            var returnMsg = data.returnMsg?data.returnMsg:"提交失败";
                    		if(data && 'Y' == data.state){
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
        	var selected = $('#tt').tree('getSelected');
        	if(!selected){
        		$.messager.alert('提醒','请先选择上级单位！');
        		return;
        	}
            
			$('<div id="dialog"></div>').dialog({
                title: "修改信息",
                width: 700,
                height: 400,
                modal:true,
                closed: false,
                href: "<%=request.getContextPath()%>/train/department-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	$('#up_dept').textbox('setValue',selected.name);
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
                href: "<%=request.getContextPath()%>/train/department-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	$('#dept-form').form('load', item);
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

        function query(){
        	$('#dg').datagrid('options').queryParams = {
            	up_dept: $("#key-up-dept").val(),
                depart_name: $("#key-dept").val()
            };
            $('#dg').datagrid("reload");
        }
        
        function reset(){
            $("#key-up-dept").textbox('setValue','');
            $("#key-dept").textbox('setValue','');
            $('#dg').datagrid('options').queryParams = {};
            $('#dg').datagrid("reload");           
        }
                
        $('#dg').datagrid({
            url:'sys/DepartmentList.do',
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
		        { field:'',width:100,align:'center',checkbox:true},
                { field:'depart_id',title:'单位编码',width:150,align:'center'}
		    ]],
        	columns:[[                
                { field:'depart_name',title:'单位名称',width:280,align:'center'},
                { field:'p_id',title:'上级单位编码',width:150,align:'center'},
                { field:'up_dept',title:'上级单位名称',width:250,align:'center'},
                { field:'idPayDeptName',title:'是否为付费单位',width:120,align:'center'}
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
        
        /*
         * 左侧单位目录
         */
    	$('#tt').tree({
			onClick: function(node){
				$("#key-up-dept").val(node.id);
				query();
			}
		});
	
    </script>