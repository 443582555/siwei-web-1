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
	<!-- Begin of easyui-dialog -->
    <form id="chezhan-form" method="post">
    	<input type="hidden" name="id"/>
        <table style="margin:0 auto;">
            <tr>
            	<td align="right">车站属性:</td>
                <td>
					<select class="easyui-combobox" name="station_property" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${chezhanshuxing}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
				</td>
            
           		<td align="right">车站附属正线:</td>
                <td>
	 				<select class="easyui-combobox" name="line_id" id="line_id" data-options="editable:false" style="width:200px">
	 				</select>
                </td>
            </tr>
                
            <tr>
                <td align="right">车站名称:</td>
                <td><input class="easyui-textbox" type="text" name="name" style="width:200px"></td>
                
                <td align="right">车站中心里程:</td>
                <td><input class="easyui-textbox" type="text" name="rwb_lenth" style="width:200px"></td>
            </tr>
            
            <tr>
                <td align="right">股道数:</td>
                <td><input class="easyui-textbox" type="text" name="stock_number" style="width:200px"></td>
                
                <td align="right">车站编码:</td>
                <td><input class="easyui-textbox" type="text" name="rwb_stationno" style="width:200px"></td>
            </tr>            
        </table>
    </form>
    <script>
    $.ajax({
    	type: 'post',
        url:'line/queryLine.do',
        dataType: "json",
        success:function(data){
           $("#line_id").combobox({
	   			data: data.rows,
	   			valueField:'rwb_railwayno',
	   			textField:'rwb_name'
	   		})
        }
    })
    </script>
</body>
</html>