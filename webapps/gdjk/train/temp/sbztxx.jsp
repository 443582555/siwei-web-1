<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>设备状态信息</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:false,collapsible:false,title:'条件查询'" style="height:90px;">
            <div style="margin:10px">
                <label>设备号：</label>
 				<input class="easyui-textbox" name="key-sw" id="key-sw">
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
            	swinstrumentid: $("#key-sw").val()
            };
            $('#dg').datagrid("reload");           
        }
        
        function reset(){
        	$("#key-sw").textbox('setValue','');
            $('#dg').datagrid('options').queryParams = {};
            $('#dg').datagrid("reload");           
        }
        
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
                        url:'equ/deleteSbzt.do',
                        data:{
                            id: item.id
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
        * Name 载入数据
        */
        $('#dg').datagrid({
            url:'equ/querySbztList.do',
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
		        { field:'',rowspan:2,width:100,align:'center',checkbox:true},
		        { field:'swinstrumentid',title:'设备号',rowspan:2,width:100,align:'center'}
		    ],[]],
            columns:[[
                    {title:'当前状态',rowspan:2,field:'zt',width:100,align:'center',formatter:formatOper},
                    {title:'倾角传感器',colspan:3},
                    {title:'温度传感器',colspan:3},
                    {title:'左位移传感器',colspan:3},
                    {title:'右位移传感器',colspan:3},
                    {title:'编码器',colspan:3},
                    {title:'机械',colspan:3},
                    {title:'电气',colspan:3}
                ],[
            	{ field:'qjcgq_zt',title:'状态',width:100,align:'center',formatter:formatOper},
            	{ field:'qjcgq_bz',title:'备注',width:180,align:'center'},
            	{ field:'qjcgq_ly',title:'来源',width:100,align:'center'},
            	
            	{ field:'wdcgq_zt',title:'状态',width:100,align:'center',formatter:formatOper},
            	{ field:'wdcgq_bz',title:'备注',width:180,align:'center'},
            	{ field:'wdcgq_ly',title:'来源',width:100,align:'center'},
            	
            	{ field:'zwycgq_zt',title:'状态',width:100,align:'center',formatter:formatOper},
            	{ field:'zwycgq_bz',title:'备注',width:180,align:'center'},
            	{ field:'zwycgq_ly',title:'来源',width:100,align:'center'},
            	
            	{ field:'ywycgq_zt',title:'状态',width:100,align:'center',formatter:formatOper},
            	{ field:'ywycgq_bz',title:'备注',width:180,align:'center'},
            	{ field:'ywycgq_ly',title:'来源',width:100,align:'center'},
            	
            	{ field:'bmq_zt',title:'状态',width:100,align:'center',formatter:formatOper},
            	{ field:'bmq_bz',title:'备注',width:180,align:'center'},
            	{ field:'bmq_ly',title:'来源',width:100,align:'center'},
            	
            	{ field:'jx_zt',title:'状态',width:100,align:'center',formatter:formatOper},
            	{ field:'jx_bz',title:'备注',width:180,align:'center'},
            	{ field:'jx_ly',title:'来源',width:100,align:'center'},
            	
            	{ field:'dq_zt',title:'状态',width:100,align:'center',formatter:formatOper},
            	{ field:'dq_bz',title:'备注',width:100,align:'center'},
            	{ field:'dq_ly',title:'来源',width:180,align:'center'}
            ]],
            toolbar: [{ 
	            text: '删除', 
	            iconCls: 'icon-remove', 
	            handler: remove
	        }]
        });
        function formatOper(val,row,index){
        	if(val!="正常" && val!="运行"){
        		return '<span style="color:#ffb300;">'+val+'</span>';
        	}else{
        		return '<span>'+val+'</span>';
        	}
        }
    </script>
</body>
</html>