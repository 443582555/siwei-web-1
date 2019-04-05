<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
            <div style="margin:10px" class="searchSection">
 				<label>当前状态：</label>
 				<select class="easyui-combobox" id="key-device-status" data-options="editable:false" style="width:135px;">
 					<option value="">全部</option>
 					<c:forEach items="${dangqianzhuangtai}" var="item">  
				        <option value="${item.dd_desc}">${item.dd_value}</option>
				    </c:forEach>
 				</select>
 				<label>检测仪序列号：</label>
 				<input class="easyui-textbox" id="key-swid">
 				<label>设备所属单位：</label>
 				<input class="easyui-textbox" id="key-dept">
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
        	if(!$("#jcsbgl-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
            $.ajax({
                url:'train/jcsbglInsert.do',
                data: $('#jcsbgl-form').serialize(),
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
        	if(!$("#jcsbgl-form").form('enableValidation').form('validate')){
        		$.messager.alert('信息提示',"您有必填项目未填写，请填写完整！",'info');
        		return false;
        	}
            $.ajax({
            	type: 'POST',
                url:'train/jcsbglUpdate.do',
                data: $('#jcsbgl-form').serialize(),
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
            var items = $('#dg').datagrid('getChecked');
            var idsArray = [];
            if(items.length == 0){
                $.messager.alert('提醒','请选择需要删除的记录!');
                return false;
            }
            for(var i in items){
            	idsArray.push(items[i].swinstrumentid)
            }
            $.messager.confirm('信息提示','确定要删除该记录？', function(result){
                if(result){
                    $.ajax({
                    	type: 'POST',
                        url:'train/jcsbglDelete.do',
                        data:{
                            ids:idsArray.join(",")
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
                href: "train/jcsbgl-dialog.do",
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
            var items = $('#dg').datagrid('getChecked');
            if(items.length != 1){
                $.messager.alert('提醒','修改时必须且只能选中一条记录!');
                return false;
            }
            
            $('<div id="dialog"></div>').dialog({
                title: "修改信息",
                iconCls: 'icon-tim-add',
                width: 700,
                height: 400,
                modal:true,
                closed: false,
                href: "train/jcsbgl-dialog.do",
                onClose:function(){  
                    $(this).dialog('destroy');  
                },
                onLoad:function(){
                	$('#jcsbgl-form').form('load', items[0]);
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
            	currentstatus: $("#key-device-status").combobox("getValue"),
                depart_name: $("#key-dept").val(),
                swinstrumentid: $("#key-swid").val()
            };
            $('#dg').datagrid("reload");
        }
        
        function reset(){
        	$("#key-device-status").combobox("setValue",""),
        	$("#key-dept").textbox("setValue", "");
        	$("#key-swid").textbox("setValue", "");
        	$('#dg').datagrid('options').queryParams = {};
        	$('#dg').datagrid('reload');
        }
        
        /**
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'train/jcsbglList.do',
            method:'post',
            singleSelect:false,
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
		        { field:'swinstrumentid',title:'检测仪序列号',width:150,align:'center'}
		    ]],
            columns:[[
                { field:'depart_name',title:'设备所属单位',width:250,align:'center'},
                { field:'retime',title:'最近作业时间',width:150,align:'center'},
                { field:'totalkm',title:'总行程',width:170,align:'center'},
                { field:'partkm',title:'阶段行程',width:170,align:'center'},
                { field:'statustime',title:'最近标定时间',width:150,align:'center'},
                { field:'currentstatus_name',title:'当前状态',width:100,align:'center'},
                { field:'sfpstl',title:'是否适应普速铁路',width:150,align:'center',formatter:formatOper2},
                { field:'datetime',title:'出厂日期',width:150,align:'center'},
                { field:'salesstatus_name',title:'销售状态',width:150,align:'center'}
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
        function formatOper2(val,row,index){
        	if(val == "0"){
        		return '否';
        	}else if(val == "1"){
        		return '是';
        	}else{
        		return '';
        	}
        }
    </script>