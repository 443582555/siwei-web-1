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
    <form id="jcsbgl-form" method="post">
        <table>
            <tr>
                <td width="150" align="right">检测仪序列号:</td>
                <td><input class="easyui-textbox" type="text" name="swinstrumentid" data-options="required:true" style="width:200px"></td>
   
                <td width="150" align="right">设备所属单位:</td>
                <td>
                	<select class="easyui-combobox" name="depart_id" id="depart_id" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${deptList}" var="item">  
					        <option value="${item.depart_id}">${item.depart_name}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
<!--             <tr>
                 <td align="right">全站仪序列号:</td>
                <td><input class="easyui-textbox" type="text" name="quanzhan_sn" data-options="" style="width:200px"></td> 
          

            </tr> -->
            <tr>
                <td align="right">运行总里程(M):</td>
                <td><input class="easyui-textbox" type="text" name="totalkm" data-options="" style="width:200px"></td>
         
                <td align="right">阶段里程:</td>
                <td><input class="easyui-textbox" type="text" name="partkm" data-options="" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">最近作业时间:</td>
                <td><input class="easyui-datebox" type="text" name="retime" data-options="editable:false" style="width:200px"></td>
          
                <td align="right">当前状态:</td>
                <td>
                	<select class="easyui-combobox" name="currentstatus" id="currentstatus" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${dangqianzhuangtai}" var="item">  
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
            <tr>
                <td align="right">状态时间:</td>
                <td><input class="easyui-datebox" type="text" name="statustime" data-options="editable:false" style="width:200px"></td>
           
                <td align="right">施工单位:</td>
                <td><input class="easyui-textbox" type="text" name="sg_depart_id" data-options="" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">启用时间:</td>
                <td><input class="easyui-datebox" type="text" name="starttime" data-options="editable:false" style="width:200px"></td>
           
                <td align="right">维护信息:</td>
                <td><input class="easyui-textbox" type="text" name="manageinfo" style="width:200px"></td>
            </tr>
            <tr>
<!--                 <td align="right">GEOCOM代码:</td>
                <td><input class="easyui-textbox" type="text" name="geocom_code" data-options="" style="width:200px"></td> -->
                            <td align="right">出厂日期:</td>
                <td><input class="easyui-datebox" type="text" name="datetime" data-options="editable:false" style="width:200px"></td>
                <td align="right">全站仪注册时间:</td>
                <td><input class="easyui-datebox" type="text" name="quanzhan_reg_time" data-options="editable:false" style="width:200px"></td>
            </tr>
            <tr>
            	<td align="right">是否适应普速铁路:</td>
                <td>
                	<select class="easyui-combobox" name="sfpstl" id="sfpstl" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${shifou}" var="item">  
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
                <td align="right">销售状态:</td>
                <td>
                	<select class="easyui-combobox" name="salesstatus" id="salesstatus" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${xiaoshouzhuangtai}" var="item">  
					        <option value="${item.dd_desc}" data-ddid="${item.dd_id}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
            <tr>
                <td align="right">备注:</td>
                <td><input class="easyui-textbox" type="text" name="remark" style="width:200px"></td>
                <td align="right"></td>
                <td></td>
            </tr>
        </table>
    </form>
    
    <script>
	    var cas=${cas};
		$('#currentstatus').combobox({
			valueField:'dd_desc',
		    textField:'dd_value'
		})
		$('#salesstatus').combobox({
	        onSelect: function(rec){
	        	var dd_desc=rec.value;
				$('#currentstatus').combobox("clear").combobox('loadData', cas[dd_desc]).combobox("select",$('#dg').datagrid('getChecked').currentstatus);
            }
		})
    </script>
</body>
</html>