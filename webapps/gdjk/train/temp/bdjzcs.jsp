<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>标定基准参数</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
            <div style="margin:10px">
                <label>设备号：</label>
 				<input class="easyui-textbox" name="key-sw-id" id="key-sw-id" style="width:150px">
 				<label>当前状态：</label>
	 			<select class="easyui-combobox" id="key_sw_zt" data-options="editable:false" style="width:150px;">
 					<option value="all">全部</option>
 					<c:forEach items="${shebeizhuangtai}" var="item">
 						<c:choose>
							<c:when test="${item.dd_desc==1}">
								<option value="${item.dd_desc}" selected>${item.dd_value}</option>
							</c:when>
							<c:otherwise>
								<option value="${item.dd_desc}">${item.dd_value}</option>
							</c:otherwise>
						</c:choose>
				    </c:forEach>
 				</select>
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
                url:'equ/addJccs.do',
                data: $('#bdjzcs-form').serialize(),
                dataType: "json",
                success:function(data){
                    var returnMsg = data.returnMsg?data.returnMsg:"提交失败";
                    if(data && 'Y' == data.state){
                        $.messager.alert('信息提示',returnMsg,'info');
                        $('#dialog').dialog('destroy');
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
                url:'equ/updateJccs.do',
                data: $('#bdjzcs-form').serialize(),
                dataType: "json",
                success:function(data){
                    var returnMsg = data.returnMsg?data.returnMsg:"提交失败";
                    if(data && 'Y' == data.state){
                        $.messager.alert('信息提示',returnMsg,'info');
                        $('#dialog').dialog('destroy');
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
                        url:'equ/deleteJccs.do',
                        data:{
                            id:item.id
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
                width: 700,
                height: 500,
                modal:true,
                closed: false,
                href: "train/bdjzcs-dialog.do",
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
                        $('#dialog').dialog('close');                    
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
                height: 500,
                modal:true,
                closed: false,
                href: "train/bdjzcs-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	$('#bdjzcs-form').form('load', item);
                },
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: edit
                }, {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $('#dialog').dialog('close');                    
                    }
                }]
            });
        }	

        /*
        * 检索
        */
        function query(){
        	$('#dg').datagrid('options').queryParams = {
            	swinstrumentid: $("#key-sw-id").val(),
                currentstatus: $("#key_sw_zt").val()
            };
            $('#dg').datagrid("reload");
        }
        
        function reset(){
        	$("#key_sw_zt").combobox("setValue",""),
        	$("#key-sw-id").textbox("setValue", "");
        	$('#dg').datagrid('options').queryParams = {};
            $('#dg').datagrid("reload");
        }
        /**
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'equ/jccsList.do',
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
		        { field:'swinstrumentid',title:'检测仪序列号',width:120,align:'center'}
		    ]],
            columns:[[
                { field:'currentstatus_name',title:'当前状态',width:100,align:'center'},
                { field:'meatime',title:'标定时间',width:100,align:'center'},
                { field:'materialref',title:'温度改正系数',width:130,align:'center'},
                { field:'lencd',title:'出厂CD',width:100,align:'center'},
                { field:'lenae',title:'出厂AE',width:100,align:'center'},
                { field:'lenbf',title:'出厂BF',width:100,align:'center'},
                { field:'lenh',title:'出厂H',width:100,align:'center'},
                { field:'wheeldiameter',title:'走行轮直径',width:100,align:'center'},
                { field:'lenac',title:'出厂AC',width:100,align:'center'},
                { field:'lenbd',title:'出厂BD',width:100,align:'center'},
                { field:'lenab',title:'出厂AB',width:100,align:'center'},
                { field:'leftdistsensorkl',title:'左棱镜至中心距离',width:150,align:'center'},
                { field:'rightdistsensorkr',title:'右棱镜至中心距离',width:150,align:'center'},
                { field:'distsensorat',title:'出厂AT',width:100,align:'center'},
                { field:'distsensorbt',title:'出厂BT',width:100,align:'center'},
                { field:'distsensorct',title:'出厂CT',width:100,align:'center'},
                { field:'distsensordt',title:'出厂DT',width:100,align:'center'},
                { field:'lenkl',title:'出厂KL',width:100,align:'center'},
                { field:'lenkr',title:'出厂KR',width:100,align:'center'},
                { field:'anglesensorxt',title:'出厂XT',width:100,align:'center'},
                { field:'anglesensoryt',title:'出厂YT',width:100,align:'center'},
                { field:'anglesensorkx',title:'出厂KX',width:100,align:'center'},
                { field:'anglesensorky',title:'出厂KY',width:100,align:'center'},
                { field:'temperature',title:'出厂标定温度',width:130,align:'center'},
                { field:'resolutionrate',title:'编码器分辨率',width:130,align:'center'},
                { field:'recordtime',title:'时间',width:150,align:'center'}                                       
            ]],
            toolbar: [{ 
	            text: '删除', 
	            iconCls: 'icon-remove', 
	            handler: remove
	        }] 
        });
    </script>
</body>
</html>