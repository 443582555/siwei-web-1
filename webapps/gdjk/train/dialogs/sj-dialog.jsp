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
	<form id="sj-form" method="post">
		<input type="hidden" name="id"/>
        <table>
            <tr>
                <td width="150" align="right">设备名称:</td>
                <td><input class="easyui-textbox" type="text" name="name" style="width:200px"></td>
   
                <td width="150" align="right">设备型号:</td>
                <td><input class="easyui-textbox" type="text" name="model" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">设备sn码:</td>
                <td><input class="easyui-textbox" type="text" name="sn" style="width:200px"></td>
          
                <td align="right">快速服务代码:</td>
                <td><input class="easyui-textbox" type="text" name="server_code" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">设备所属单位:</td>
                <td>
					<select class="easyui-combobox" name="dept_id" id="dept_id" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${deptList}" var="item">  
					        <option value="${item.depart_id}">${item.depart_name}</option>
					    </c:forEach>
	 				</select>
				</td>
            </tr>
            <tr>
                <td align="right">采购日期:</td>
                <td><input class="easyui-datebox" type="text" name="purchase_date" data-options="editable:false" style="width:200px"></td>
          
                <td align="right">设备出厂日期:</td>
                <td><input class="easyui-datebox" type="text" name="production_date" data-options="editable:false" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">设备状态:</td>
                <td>
					<select class="easyui-combobox" name="status" id="status" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${status}" var="item">  
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
				</td>
           
                <td align="right">采购数量:</td>
                <td><input class="easyui-textbox" type="text" name="num" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">采购单价:</td>
                <td><input class="easyui-textbox" type="text" name="price" style="width:200px"></td>
           
                <td align="right">采购总价:</td>
                <td><input class="easyui-textbox" type="text" name="total_price" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">出库数量:</td>
                <td><input class="easyui-textbox" type="text" name="export_number" style="width:200px"></td>
            
                <td align="right">剩余数量:</td>
                <td><input class="easyui-textbox" type="text" name="surplus_number" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">与cs绑定:</td>
                <td><input class="easyui-textbox" type="text" name="cs" style="width:200px"></td>
            </tr>
        </table>
    </form>
</body>
</html>