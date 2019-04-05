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
    <form id="line-form" method="post">
    	<input type="hidden" name="id"/>
        <table>
            <%-- <tr>
                <td width="150" align="right">线路名称:</td>
                <td>
                	<input type="hidden" name="id"/>
                	<input class="easyui-textbox" type="text" name="line_name" style="width:200px">
                </td>

                <td width="150" align="right">轨道类型:</td>
                <td>
					<select class="easyui-combobox" name="line_type" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${xianluxingbie}" var="item">  
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
				</td>
            </tr>
            <tr>
                <td align="right">线路等级:</td>
                <td>
                	<select class="easyui-combobox" name="rail_grade" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${rail_grade}" var="item">  
							<option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
          
                <td align="right">线路行别:</td>
                <td>
                	<select class="easyui-combobox" name="travel_type" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${travel_type}" var="item">  
							<option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
            <tr>
                <td align="right">线路所处行别:</td>
                <td>
                	<select class="easyui-combobox" name="travel" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${travel_type}" var="item">  
							<option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
         
                <td align="right">线路长度(km):</td>
                <td><input class="easyui-textbox" type="text" name="lenth" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">钢轨类型:</td>
                <td>
                	<select class="easyui-combobox" name="rail_type" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${rail_type}" var="item">  
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
          
                <td align="right">运营状态:</td>
                <td>
					<select class="easyui-combobox" name="state" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${state}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
				</td>
            </tr>
            <tr>
                <td align="right">修建日期:</td>
                <td><input class="easyui-datebox" type="text" name="bulid_date" style="width:200px"></td>
           
                <td align="right">通车日期:</td>
                <td><input class="easyui-datebox" type="text" name="run_date" style="width:200px"></td>
            </tr> --%>
            <tr>
            	<td align="right">铁路线编码:</td>
                <td><input class="easyui-textbox" type="text" name="rwb_railwayno" style="width:200px"></td>
            
           		<td align="right">线路行别类型:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_traveltype" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${xianluxingbieleixing}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
                
            <tr>
                <td align="right">铁路线名称:</td>
                <td><input class="easyui-textbox" type="text" name="rwb_name" style="width:200px"></td>
                
                <td align="right">铁路线大类类型:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_railwaybigtype" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${tieluxiandaleileixing}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
            <tr>           
                <td align="right">铁路线小类类型:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_railwaykind" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${tieluxianxiaoleileixing}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>                
           
                <td align="right">铁路线长度:</td>
                <td><input class="easyui-textbox" type="text" name="rwb_lenth" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">站线所属车站:</td>
                <td><input class="easyui-textbox" type="text" name="rwb_railstationno" style="width:200px"></td>
           
                <td align="right">铁路线管辖类别:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_managetype" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${tieluxianguanxialeibie}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
            <tr>
            	<td align="right">父级铁路线名称:</td>
                <td>	
                	<input class="easyui-textbox" type="text" name="rwb_fathername" style="width:200px">
                	<input type="hidden" name="rwb_fatherno">
                </td>
                
                <td align="right">线路父子级别:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_fatherson" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${xianlufuzijibie}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>           
            </tr>
            <tr>
                <td align="right">线路运营状态:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_state" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${xianluyunyingzhuangtai}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
                
                <td align="right">线路轨道类型:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_tracktype" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${xianluguidaoleixing}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
            <tr>
                <td align="right">线路钢轨类型:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_railtype" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${xianlugangguileixing}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
                
                <td align="right">线路速度等级:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_railgrade" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${xianlusududengji}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
            <tr>
                <td align="right">是否有效:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_unitenable" data-options="editable:false" style="width:200px;">
                		<option value="">请选择</option>
	 					<c:forEach items="${shifouyouxiao}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>

                <td align="right">是否删除:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_unitdelete" data-options="editable:false" style="width:200px;">
                		<option value="">请选择</option>
	 					<c:forEach items="${shifoushanchu}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
            <tr>                
                <td align="right">说明:</td>
                <td><input class="easyui-textbox" type="text" name="rwb_remark" style="width:200px"></td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
    	$(function(){
    		$("[name=rwb_railwaybigtype]").combobox({
        		onSelect: function(){        		
                    $("[name=rwb_fathername]").combobox({
                    	url:'line/listNameList.do?rwb_railwaybigtype=1',
                        valueField:'id',
                        textField:'text'
                    });
                    $("[name=rwb_railstationno]").combobox({
                    	url:'line/listNameList.do?rwb_railwaybigtype=2',
                        valueField:'id',
                        textField:'text'
                    });
            	}
        	})
    	})
    </script>
</body>
</html>