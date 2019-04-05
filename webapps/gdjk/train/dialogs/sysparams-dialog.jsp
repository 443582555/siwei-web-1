<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"> 
	<meta http-equiv="Content-Language" content="UTF-8">
</head>
<body>
			<form id="dic-form" method="post">
	        	<table style="width:100%">
	                <tr>
	                    <td width="30%" align="right">字典类型:</td>
	                    <td>
	                    	<input class="easyui-combobox" type="text" name="dd_type_name" id="dd_type_name" data-options="url:'sys/dicTypeList.do',valueField:'dd_type_code',textField:'dd_type_name',required:true" style="width:300px"></input>
	                    </td>
	                </tr>
	                <tr>
	                    <td width="30%" align="right">字典名称:</td>
	                    <td><input class="easyui-textbox" type="text" name="dd_value" id="dd_value" data-options="required:true" style="width:300px"></input></td>
	                </tr>
	                <tr>
	                	<td width="30%" align="right">字典描述:</td>
	                	<td><input class="easyui-textbox" name="dd_desc" id="dd_desc" data-options="url:'sys/getMenuTree2.do',required:true" style="width:300px"></input></td>
	                </tr>
	                <tr>
	                	<td width="30%" align="right">字典状态:</td>
	                	<td>
							<select class="easyui-combobox" name="dd_status" id="dd_status" data-options="editable:false,required:true" style="width:300px;">
							    <option value="在用">在用</option>
							    <option value="停用">停用</option>
							</select>
						</td>
	                </tr>
	            </table>
	        </form>
</body>
</html>