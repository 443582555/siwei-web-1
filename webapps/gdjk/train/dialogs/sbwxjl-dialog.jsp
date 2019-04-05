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
    <form id="sbwxjl-form" method="post">
    	<input type="hidden" name="id"/>
        <table>
        	<tr>
                <td width="150" align="right">设备号:</td>
                <td>
                	<select class="easyui-combobox" name="sw_id" id="sw_id" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${sbList}" var="item">  
					        <option value="${item.swinstrumentid}">${item.swinstrumentid}</option>
					    </c:forEach>
	 				</select>
                </td>
            
                <td width="150" align="right">设备类型:</td>
                <td>
                	<select class="easyui-combobox" name="devtype" id="devtype" data-options="editable:false" style="width:200px">
                	<option value=""></option>
	 					<c:forEach items="${shebeileixing}" var="item">  
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
            <tr>
                <td width="150" align="right">故障类型:</td>
                <td>
                	<select class="easyui-combobox" name="mtype" id="mtype" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${guzhangleixing}" var="item">  
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
  
                <td align="right">故障现象:</td>
                <td>
                	<select class="easyui-combobox" name="issue" id="issue" style="width:200px">
	 				</select>
                </td>
            </tr>
            <tr>
                <td align="right">现场反馈:</td>
                <td><input class="easyui-textbox" type="text" name="response" data-options="" style="width:200px"></td>
            
                <td align="right">故障发生时间:</td>
                <td><input class="easyui-datebox" type="text" name="mtime" data-options="editable:false" style="width:200px"></td>
         	</tr>
            <tr>
                <td align="right">故障发生地点:</td>
                <td><input class="easyui-textbox" type="text" name="issue_place" data-options="" style="width:200px"></td>
            
                <td align="right">解决方法:</td>
                <td><input class="easyui-textbox" type="text" name="resolved" data-options="" style="width:200px"></td>
          	</tr>
            <tr>
                <td align="right">送修日期:</td>
                <td>
                	<input class="easyui-datebox" type="text" name="maintain_date" data-options="editable:false" style="width:200px">
                </td>
            
                <td align="right">是否标定:</td>
                <td>
                	<select class="easyui-combobox" name="is_calibration" id="is_calibration" data-options="editable:false" style="width:200px">
	 					<option value="是">是</option>
	 					<option value="否">否</option>
	 				</select>
                </td>
            </tr>
            <tr>
                <td align="right">是否收费:</td>
                <td>
                	<select class="easyui-combobox" name="idpaydept" id="idpaydept" data-options="editable:false" style="width:200px">
	 					<option value="是">是</option>
	 					<option value="否">否</option>
	 				</select>
                </td>
           
                <td align="right">收费金额:</td>
                <td><input class="easyui-textbox" type="text" name="amount" data-options="" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">送修人:</td>
                <td><input class="easyui-textbox" type="text" name="manperson" data-options="" style="width:200px"></td>
            </tr>
        </table>
    </form>
    <script>
    $("#mtype").combobox({
    	onSelect: function(record){
    		var target = (record.value=="01"||record.value=="02")?issues[record.value]:[];
    		$("#issue").combobox({
    			data: target,
    			valueField:'dd_value',
    			textField:'dd_value'
    		})
    	}
    })
    </script>
</body>
</html>