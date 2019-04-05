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
		<form id="user-form" method="post">
            <table cellspacing="5" style="margin: 0 auto;">
                <tr>
                    <td style="text-align:right;font-weight:bold;">姓名:</td>
                    <td>
                    	<input type="hidden" name="tu_id"></input>
                    	<input class="easyui-textbox" type="text" name="username" data-options="required:true" style="width:300px;"></input>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;font-weight:bold;">账号:</td>
                    <td><input class="easyui-textbox" type="text" name="login_name" data-options="required:true" style="width:300px;"></input></td>
                </tr>
                <tr>
                    <td style="text-align:right;font-weight:bold;">角色:</td>
                    <td>
						<select class="easyui-combobox" name="tr_id" id="tr_id" data-options="editable:false" style="width:300px">
	 						<c:forEach items="${roleList}" var="item">  
					        	<option value="${item.tr_id}">${item.role_name}</option>
					    	</c:forEach>
	 					</select>
					</td>
                </tr>
                <tr>
                    <td style="text-align:right;font-weight:bold;">单位:</td>
                    <td>
						<select class="easyui-combobox" name="depart_id" id="depart_id" data-options="editable:false" style="width:300px">
	 						<c:forEach items="${deptList}" var="item">  
					        	<option value="${item.depart_id}">${item.depart_name}</option>
					    	</c:forEach>
	 					</select>
					</td>
                </tr>
                <tr>
                    <td style="text-align:right;font-weight:bold;">电话:</td>
                    <td><input class="easyui-textbox" type="text" name="mobile" data-options="required:true" style="width:300px;"></input></td>
                </tr>
                <tr>
                    <td style="text-align:right;font-weight:bold;">邮箱:</td>
                    <td><input class="easyui-textbox" type="text" name="email" data-options="required:true" style="width:300px;"></input></td>
                </tr>
            </table>
    	</form>
</body>
</html>