<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8"> 
	<meta http-equiv="content-language" content="utf-8">
</head>
<body>
	<form id="pjxx-form" method="post">
		<input type="hidden" name="id">
        <table style="margin:0 auto;">
            <tr>
                <td align="right">物料编号:</td>
                <td><input class="easyui-textbox" type="text" name="code" style="width:200px"></td>
   
                <td align="right">名称:</td>
                <td><input class="easyui-textbox" type="text" name="name" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">单价:</td>
                <td><input class="easyui-textbox" type="text" name="price" style="width:200px"></td>
          
                <td align="right">数量:</td>
                <td><input class="easyui-textbox" type="text" name="amount" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">货源:</td>
                <td>
					<select class="easyui-combobox" name="source" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${source}" var="item">  
					        <option value="${item.id}">${item.name}</option>
					    </c:forEach>
	 				</select>
				</td>
				
                <td align="right">备注:</td>
                <td><input class="easyui-textbox" type="text" name="remark" style="width:200px"></td>
            </tr>
        </table>
    </form>
</body>
</html>