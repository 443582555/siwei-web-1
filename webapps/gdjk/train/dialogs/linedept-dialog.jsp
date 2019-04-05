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
	<!-- Begin of easyui-dialog -->
    <form id="linedept-form" method="post">
        <table>
            <tr>
                <td width="150" align="right">线路名称:</td>
                <td>
                	<input class="easyui-textbox" type="text" name="line_name" id="line_name" data-options="readonly:true" style="width:200px">
                </td>
   
                <td width="150" align="right">单位名称:</td>
                <td><input class="easyui-textbox" name="dept_name" id="dept_name" data-options="readonly:true" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">起始里程:</td>
                <td><input class="easyui-textbox" type="text" name="start_dk" id="start_dk" style="width:200px"></td>
          
                <td align="right">终止里程:</td>
                <td><input class="easyui-textbox" type="text" name="end_dk" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">备注:</td>
                <td><input class="easyui-textbox" type="text" name="remark" style="width:200px"></td>
            </tr>
        </table>
    </form>
</body>
</html>