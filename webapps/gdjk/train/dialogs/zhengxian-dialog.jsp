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
    <form id="zhengxian-form" method="post">
    	<input type="hidden" name="id"/>
    	<input type="hidden" name="rwb_railwaybigtype" value="1"/>
        <table>
            <tr>
           		<td align="right">线路行别类型:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_traveltype" id="rwb_traveltype" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${xianluxingbieleixing}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
                
                <td align="right">父级铁路线名称:</td>
                <td>	
                	<input class="easyui-textbox" type="text" name="rwb_fathername" id="rwb_fathername" style="width:200px">
                	<input type="hidden" name="rwb_fatherno">
                </td>
            </tr>
            
            <tr>
                <td align="right">线路父子级别:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_fatherson" id="rwb_fatherson" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${xianlufuzijibie}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
                
                <td align="right">铁路线名称:</td>
                <td><input class="easyui-textbox" type="text" name="rwb_name" id="rwb_name" style="width:200px"></td>          
            </tr>
                
            <tr>
                <td align="right">铁路线编码:</td>
                <td><input class="easyui-textbox" type="text" name="rwb_railwayno" data-options="editable:false" style="width:200px"></td>
            	
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
                <td align="right">铁路线长度:</td>
                <td><input class="easyui-textbox" type="text" name="rwb_lenth" id="rwb_lenth" style="width:200px"></td>

                <td align="right">线路运营状态:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_state" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${xianluyunyingzhuangtai}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
            
            <tr>   
                <td align="right">线路轨道类型:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_tracktype" id="rwb_tracktype" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${xianluguidaoleixing}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>

                <td align="right">线路钢轨类型:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_railtype" id="rwb_railtype" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${xianlugangguileixing}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
            
            <tr>   
                <td align="right">线路速度等级:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_railgrade" id="rwb_railgrade" data-options="editable:false" style="width:200px">
                		<option value="">请选择</option>
	 					<c:forEach items="${xianlusududengji}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>

                <td align="right">修建日期:</td>
                <td>
                	<input class="easyui-datebox" type="text" name="rwb_builddate" data-options="editable:false" style="width:200px">
                </td>
			</tr>
            
            <tr>
                <td align="right">通车日期:</td>
                <td>
                	<input class="easyui-datebox" type="text" name="rwb_opendate" data-options="editable:false" style="width:200px">
                </td>
         
                <td align="right">是否有效:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_unitenable" data-options="editable:false" style="width:200px;">
                		<option value="">请选择</option>
	 					<c:forEach items="${shifouyouxiao}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
			</tr>
            
            <tr>
                <td align="right">是否删除:</td>
                <td>
                	<select class="easyui-combobox" name="rwb_unitdelete" data-options="editable:false" style="width:200px;">
                		<option value="">请选择</option>
	 					<c:forEach items="${shifoushanchu}" var="item">
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
                           
                <td align="right">说明:</td>
                <td><input class="easyui-textbox" type="text" name="rwb_remark" style="width:200px"></td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
    	$(function(){
    		$("#rwb_traveltype").combobox({
    			//如果行别选择了父线0，单线9，父级铁路线名称灰掉
    			onChange: function(){
    				var rwb_traveltype = $(this).combobox("getValue");
    				if( rwb_traveltype == 0 || rwb_traveltype == 9 ){
    					$("#rwb_fathername").combobox({
    						disabled: true
    					})
    					
    					//如果行别选择了单线9，线路父子级别灰掉
    					if( rwb_traveltype == 9 ){
    						$("#rwb_fatherson").combobox({
        						disabled: true
        					})
        				}else{
        					if($("#rwb_fatherson").prop("disabled")){
    							$("#rwb_fatherson").combobox({
            						disabled: false
            					})
    						}
        				}
    				}else{
    					if($("#rwb_fathername").prop("disabled")){
							$("#rwb_fathername").combobox({
        						disabled: false
        					})
						}
    					
    					$("#rwb_fathername").combobox({
    		            	url:'line/listNameList.do?rwb_railwaybigtype=1',
    		                valueField:'id',
    		                textField:'text'
    		            });
    				}
    			}
    		})
    		
    		$("#rwb_fatherson").combobox({
    			onChange: function(){
    				var rwb_traveltype = $("#rwb_traveltype").combobox("getValue");
    				var rwb_fatherson = $(this).combobox("getValue");

    				
    				if( rwb_fatherson == 1 ){//如果选择了父级，铁路线长度、线路轨道类型、线路钢轨类型、线路速度等级灰掉
    					$("#rwb_lenth,#rwb_tracktype,#rwb_railtype,#rwb_railgrade").combobox({
    						disabled: true
    					})
    				}else{
    					$("#rwb_lenth,#rwb_tracktype,#rwb_railtype,#rwb_railgrade").each(function(){
    						if($(this).prop("disabled")){
    							$(this).combobox({
    	    						disabled: false
    	    					})
    						}
    					})
    				}
    					
    				if( rwb_fatherson == 2 ){//如果选择了子级
    					if( $.inArray(rwb_traveltype,['1','2','3','4','5','6','7','8']) == -1){
    						$.messager.alert('提醒','与行别不匹配！');
    						$(this).combobox("clear");
    					}
    				}
    			}
			})
			
			$("#rwb_fathername").combobox({
    			onChange: function(){
    				var name = $(this).combobox("getText");
    				if(name){
    					if(name.indexOf("线")!=-1){
    						$("#rwb_name").textbox('setValue',name.substring(0,name.indexOf("线")))
    					}else{
    						$("#rwb_name").textbox('setValue',name)
    					}
    				}
    				
    				$.ajax({
                    	type: 'POST',
                        url:'line/queryLine.do',
                        data:{
                            rwb_name: $("#rwb_fathername").combobox("getText")
                        },
                        dataType: "json",
                        success:function(data){
                        	$("#rwb_managetype").combobox("setValue",data.rows[0].rwb_managetype);
                        	$("#rwb_state").combobox("setValue",data.rows[0].rwb_state);
                        	$("#rwb_builddate").textbox("setValue",data.rows[0].rwb_builddate);
                        	$("#rwb_opendate").textbox("setValue",data.rows[0].rwb_opendate);
                        }	
                    });
    			}
			})
    	})
    </script>
</body>
</html>