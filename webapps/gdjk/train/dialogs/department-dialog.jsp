<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"> 
	<meta http-equiv="Content-Language" content="UTF-8">
</head>
<body>
	<form id="dept-form" method="post">
        <table style="margin:0 auto;">
            <tr>
                <td style="text-align:right;font-weight:bold;">单位名称:</td>
                <td>
                	<input class="easyui-textbox" type="text" name="depart_name" id="depart_name" data-options="required:true" style="width:200px;"></input>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;font-weight:bold;">上级单位名称:</td>
                <td>
	                <input class="easyui-textbox" type="text" name="up_dept" id="up_dept" data-options="required:true,readonly:true" style="width:200px;"></input>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;font-weight:bold;">是否为付费用户:</td>
                <td>
	                <select class="easyui-combobox" id="idPayDept" data-options="editable:false" style="width:200px;">
	 					<option value="1">是</option>
	 					<option value="0" selected>否</option>
	 				</select>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>