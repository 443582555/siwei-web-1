<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"> 
	<meta http-equiv="Content-Language" content="UTF-8">
</head>
<body>
	<form id="zltj-form" method="post">
		<input type="hidden" name="id"/>
        <table>
            <tr>
				<td width="150" align="right">单位:</td>
                <td>
					<select class="easyui-combobox" name="dw" data-options="editable:false" style="width:200px">
                		<c:forEach items="${deptList}" var="item">  
					        <option value="${item.depart_id}">${item.depart_name}</option>
					    </c:forEach>
	 				</select>
				</td>
				<td width="150" align="right">租赁编号:</td>
				<td><input class="easyui-textbox" type="text" name="bh" style="width:200px"></td>
            </tr>
            <tr>
				<td align="right">起始时间:</td>
				<td><input class="easyui-datebox" type="text" name="qsrq" data-options="editable:false" style="width:200px"></td>
				<td align="right">终止时间:</td>
				<td><input class="easyui-datebox" type="text" name="zzrq" data-options="editable:false" style="width:200px"></td>
            </tr>
            <tr>
				<td align="right">作业总行程:</td>
				<td><input class="easyui-textbox" type="text" name="lc" style="width:200px"></td>
				<td align="right">租赁天数:</td>
				<td><input class="easyui-textbox" type="text" name="ts" style="width:200px"></td>
            </tr>
            <tr>
				<td align="right">总费用:</td>
				<td><input class="easyui-textbox" type="text" name="fy" style="width:200px"></td>
				<td align="right">已收账款:</td>
				<td><input class="easyui-textbox" type="text" name="ys" style="width:200px"></td>
            </tr>
            <tr>
				<td align="right">应收账款:</td>
				<td><input class="easyui-textbox" type="text" name="yszk" style="width:200px"></td>
            </tr>
        </table>
    </form>
</body>
</html>