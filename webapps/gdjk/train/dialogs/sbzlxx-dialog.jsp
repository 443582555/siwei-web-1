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
	<form id="sbzl-form" method="post"  enctype="multipart/form-data"  action="<%=request.getContextPath()%>/equ/insertSbzl.do" >
        <table>
            <tr>
                <td width="150" align="right">设备序列号:<input type="hidden" name="id" id="id"></td>
                <td><input class="easyui-textbox" type="text" name="swinstrumentid" style="width:200px"></td>
   
                <td width="150" align="right">租赁单位:</td>
                <td>
                	<select class="easyui-combobox" name="zldw_mc" id="zldw_mc" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${deptList}" var="item">  
					        <option value="${item.depart_id}">${item.depart_name}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
            <tr>
                <td align="right">租赁起始日期:</td>
                <td><input class="easyui-datebox" type="text" name="qsrq" data-options="editable:false" style="width:200px"></td>
          
                <td align="right">租赁终止日期:</td>
                <td><input class="easyui-datebox" type="text" name="zzrq" data-options="editable:false" style="width:200px"></td>
            </tr>
            <tr>
            	<td align="right">合同编号:</td>
                <td><input class="easyui-textbox" type="text" name="htbh" style="width:200px"></td>
                
                <td align="right">租赁单位单位联系人:</td>
                <td><input class="easyui-textbox" type="text" name="dwlxr" style="width:200px"></td>
			<tr>
				<td align="right">联系电话:</td>
                <td><input class="easyui-textbox" type="text" name="lxdh" style="width:200px"></td>
            
                <td align="right">费用是否结清:</td>
                <td>
                	<select class="easyui-combobox" name="fysfjq" id="zldw_mc" data-options="editable:false" style="width:200px">
	 					<option value="1">是</option>
	 					<option value="0">否</option>
	 				</select>
                </td>
            </tr>
            <tr>
                <td align="right">租赁合同扫描件:</td>
                <td><input type="file" name="htsmj" id="file-ht-img" style="width:150px;" onchange="javascript:setImagePreviews(this,'ht-img');" accept="image/*" /></td>
            	<td>
            		<div id="ht-img" class="img-box" style="width:50px;height:50px;"></div>
            		<input type="hidden" name="delete-ht-img" id="delete-ht-img">
            	</td>
            </tr>
            <tr>
                <td align="right">租赁设备登记表扫描件:</td>
                <td><input type="file" name="djbsmj" id="file-djbsmj-img" style="width:150px;" onchange="javascript:setImagePreviews(this,'djbsmj-img');" accept="image/*" /></td>
            	<td>
            		<div id="djbsmj-img" class="img-box" style="width:50px;height:50px;"></div>
            		<input type="hidden" name="delete-djbsmj-img" id="delete-djbsmj-img">
            	</td>
            </tr>
            <tr>
                <td align="right">发票扫描件:</td>
                <td><input type="file" name="fpsmj" id="file-fp-img" style="width:150px;" onchange="javascript:setImagePreviews(this,'fp-img');" accept="image/*" /></td>
            	<td>
            		<div id="fp-img" class="img-box" style="width:50px;height:50px;"></div>
            		<input type="hidden" name="delete-fp-img" id="delete-fp-img">
            	</td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
    function setImagePreviews(obj,boxId) {
        var fileObj = obj;
        var imgBox = document.getElementById(boxId);
        imgBox.innerHTML = "<span>&times;</span><img id='" + boxId + "0'/>";
        var imgObjPreview = document.getElementById(boxId+0); 
        $("#delete-"+boxId).val("");
        if (fileObj.files && fileObj.files[0]) {
                imgObjPreview.style.display = 'block';
                imgObjPreview.style.width = '50px';
                imgObjPreview.style.height = '50px';
                imgObjPreview.style.borderRadius = '3px';
                imgObjPreview.src = window.URL.createObjectURL(fileObj.files[0]);
        }else{
			imgBox.innerHTML = "";
        }
        return true;
    }
    
    $(".img-box").on("click","span",function(event){
    	var target = $(event.target);
    	$("#delete-"+$(target).parent().attr("id")).val(1);
    	$("#file-"+$(target).parent().attr("id")).val("");
    	$(target).parent().html("");
    })
	</script>
</body>
</html>