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
	<form id="zlsq-form" method="post">
		<input type="hidden" name="id"/>
        <table>
            <tr>
                <td width="150" align="right">租赁类型:</td>
                <td>
                	<select class="easyui-combobox" name="lx" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${zulinleixing}" var="item">  
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
   
                <td width="150" align="right">租赁设备名称:</td>
                <td>
					<select class="easyui-combobox" name="sbmc" data-options="editable:false" style="width:200px">
                		<c:forEach items="${shebeimingcheng}" var="item">  
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
				</td>
            </tr>
            <tr>
                <td align="right">租赁编号:</td>
                <td><input class="easyui-textbox" type="text" name="bh" id="bh" style="width:200px"></td>
          
                <td align="right">租赁单位:</td>
                <td>
                	<select class="easyui-combobox" name="dw" data-options="editable:false" style="width:200px">
                		<c:forEach items="${deptList}" var="item">  
					        <option value="${item.depart_id}">${item.depart_name}</option>
					    </c:forEach>
	 				</select>
				</td>
            </tr>
            <tr>
                <td align="right">拟租赁台数:</td>
                <td><input class="easyui-textbox" type="text" name="sl" style="width:200px"></td>
            
                <td align="right">租赁设备序列号:</td>
                <td>
                	<select class="easyui-combobox" name="sbxlh" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${sbList}" var="item">  
					        <option value="${item.swinstrumentid}">${item.swinstrumentid}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
            <tr>
                <td align="right">租赁单位联系人:</td>
                <td><input class="easyui-textbox" type="text" name="lxr" style="width:200px"></td>
                
                <td align="right">联系电话:</td>
                <td><input class="easyui-textbox" type="text" name="dh" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">租赁起始日期:</td>
                <td><input class="easyui-datebox" type="text" name="qsrq" data-options="editable:false" style="width:200px"></td>
            
                <td align="right">租赁结束日期:</td>
                <td><input class="easyui-datebox" type="text" name="jsrq" data-options="editable:false" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">申请人:</td>
                <td><input class="easyui-textbox" id="sqr" name="sqr" data-options="editable:false" style="width:200px"></td>
                
                <td align="right">申请日期:</td>
                <td><input class="easyui-datebox" type="text" name="sqrq" data-options="editable:false" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">批准人:</td>
                <td><input class="easyui-textbox" id="pzr" type="text" name="pzr" data-options="editable:false" style="width:200px"></td>
    
                <td align="right">批准日期:</td>
                <td><input class="easyui-datebox" type="text" name="pzrq" data-options="editable:false" style="width:200px"></td>
            </tr>
            
            <tr>
                <td align="right">里程单价 :</td>
                <td><input class="easyui-textbox" type="text" name="lcdj" style="width:200px"></td>
    
                <td align="right">天数单价:</td>
                <td><input class="easyui-textbox" type="text" name="tsdj" style="width:200px"></td>
            </tr>
        </table>
    </form>
    <script>
    	var u=${userList};
    	$("#sqr").combobox({
    		valueField: 'tu_id',
    		textField: 'username',
    		data: u,
    		onSelect: function(record){
    			var uu = u.filter(function(item){
    				return item.tu_id != record.tu_id
    			});
    			$("#pzr").combobox({
    				valueField: 'tu_id',
    	    		textField: 'username',
    	   			data: uu
    	   		})
    		}
    	})
    </script>
</body>
</html>