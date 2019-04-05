<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>设备销售信息</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
            <div style="margin:10px">
                <label>设备号：</label>
 				<input class="easyui-textbox" name="key-sw" id="key-sw">
                <label>单位：</label>
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
        	if(!$("#sbxs-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
            $.ajax({
                url:'<%=request.getContextPath()%>/equ/insertSbxs.do',
                type: "POST",
                cache: false,
                data: new FormData($("#sbxs-form")[0]),
                processData: false,
                contentType:false,
                async: false,
                dataType: "json",
                success: function (data) {
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
        	if(!$("#sbxs-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
            $.ajax({
            	type: 'POST',
            	cache: false,
                url:'<%=request.getContextPath()%>/equ/updateSbxs.do',
                data: new FormData($("#sbxs-form")[0]),
                processData: false,
                contentType:false,
                async: false,
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
                        url:'equ/deleteSbxs.do',
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
                width: 800,
                height: 500,
                modal:true,
                closed: false,
                href: "train/sbxsxx-dialog.do",
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
                width: 800,
                height: 500,
                modal:true,
                closed: false,
                href: "train/sbxsxx-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	var target={};
                	$.each(item, function(key, val) {
                		if("htsmj"!=key && "fp"!=key && "jhd"!=key){
    						target[key]=val;                		
                		}
					}); 
                	$('#sbxs-form').form('load', target);
                	
                	if(item.htsmj){
                		createImg("ht-img",item.htsmj);
                	}
                	if(item.fp){
                		createImg("fp-img",item.fp);
                	}
                	if(item.jhd){
                		createImg("jhd-img",item.jhd);
                	}
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
        
        function createImg(boxId,src){
        	var imgBox = document.getElementById(boxId);
        	imgBox.innerHTML = "<span>&times;</span><img id='" + boxId + "0'  />";
        	var imgObjPreview = document.getElementById(boxId+0); 
        	imgObjPreview.style.display = 'block';
            imgObjPreview.style.width = '50px';
            imgObjPreview.style.height = '50px';
            imgObjPreview.style.borderRadius = '3px';
            imgObjPreview.src = "<%=request.getContextPath()%>/fileDownLoad.do?fileName="+src;
        }
        
        /*
        * 检索
        */
        function query(){
            $('#dg').datagrid('options').queryParams = {
            	swinstrumentid: $("#key-sw").val(),
                dept: $("#key-dept").val()
            };
            $('#dg').datagrid("reload");         
        }
        
        function reset(){
        	$("#key-sw").textbox('setValue','');
            $("#key-dept").textbox('setValue','');
            $('#dg').datagrid('options').queryParams = {};
            $('#dg').datagrid("reload");          
        }
        
        /**
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'equ/querySbxsList.do',
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
		        { field:'swinstrumentid',title:'设备序列号',width:150,align:'center'}
		    ]],
            columns:[[
				{ field:'cgdw_mc',title:'采购单位',width:150,align:'center'},
                { field:'jhrq',title:'交货日期',width:100,align:'center'},
                { field:'htbh',title:'合同编号',width:100,align:'center'},
            	{ field:'lxr',title:'设备所属单位联系人',width:150,align:'center'},
            	{ field:'lxdh',title:'联系电话',width:100,align:'center'},
            	{ field:'fssb1',title:'销售附属设备1',width:150,align:'center'},
            	{ field:'fssb2',title:'销售附属设备2',width:150,align:'center'},
            	{ field:'fssb3',title:'销售附属设备3',width:150,align:'center'},
            	{ field:'sbssdw',title:'设备所属单位',width:150,align:'center'},
            	{ field:'htsmj',title:'合同扫描件',width:200,align:'center',formatter:formatOper1} ,
            	{ field:'jhd',title:'交货单',width:200,align:'center',formatter:formatOper1},
            	{ field:'fp',title:'发票扫描件',width:200,align:'center',formatter:formatOper1}       	
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
        function formatOper1(val,row,index){
        	if(val){
        		var url=encodeURI('<%=request.getContextPath()%>/fileDownLoad.do?fileName='+val);
        		return '<a href='+url+'><img style="width:20px;height:20px" src='+url+'></a>';
        	}        	
        }
    </script>
</body>
</html>