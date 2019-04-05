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
	<form id="jkxcly-form" method="post">
       <table style="width:100%">
			<tr>
				<td width="100" align="right">设备名称:</td>
				<td><input class="easyui-textbox" type="text" name="name" id="name" data-options="required:true" style="width:200px"></td>
       
				<td width="100" align="right">设备所属单位:</td>
				<td>
					<select class="easyui-combobox" name="dept_id" id="dept_id" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${deptList}" var="item">  
					        <option value="${item.depart_id}">${item.depart_name}</option>
					    </c:forEach>
	 				</select>
	 			</td>
			</tr>
			<tr>
				<td align="right">设备出厂日期:</td>
				<td><input class="easyui-datebox" type="text" name="production_date" id="production_date" data-options="required:true,editable:false" style="width:200px"></td>
  
				<td align="right">设备状态:</td>
				<td>
					<select class="easyui-combobox" name="status" id="status" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${status}" var="item">  
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>