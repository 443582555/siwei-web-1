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
		<form id="role-form" method="post">
        	<table style="margin: 0 auto;">
                <tr>
                    <td width="80" align="left">角色名称:</td>
                    <td>
                    	<input type="hidden" name="tr_id" id="tr_id"></input>
                    	<input class="easyui-textbox" type="text" name="role_name" id="role_name" data-options="required:true" style="width:300px"></input>
                    </td>
                </tr>
                <tr>
                    <td width="80" align="left">角色描述:</td>
                    <td><input class="easyui-textbox" type="text" name="description" id="description" data-options="required:true" style="width:300px"></input></td>
                </tr>
                <tr>
                	<td width="80" align="left">菜单权限:</td>
                	<td><input class="easyui-combotree" name="tm_id" id="tm_id" data-options="url:'sys/getMenuTree2.do',multiple:true,required:true" style="width:300px"></input></td>
                </tr>
            </table>
        </form>
</body>
</html>