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
	<form id="zlht-form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id"/>
        <table>
            <tr>
                <td width="140" align="right">租赁编号:</td>
                <td>
                	<select class="easyui-combobox" name="bh" id="bh" data-options="readonly:true" style="width:200px">
                		<c:forEach items="${zlbh}" var="item">  
					        <option value="${item.bh}" data-ii="${item}">${item.bh}</option>
					    </c:forEach>
	 				</select>
                </td>
                <td width="160" align="right">租赁单位名称:</td>
                <td>
					<select class="easyui-combobox" name="dwmc" data-options="editable:false" style="width:200px">
                		<c:forEach items="${deptList}" var="item">  
					        <option value="${item.depart_id}">${item.depart_name}</option>
					    </c:forEach>
	 				</select>
				</td>
            </tr>
            <tr>
                <td align="right">租赁起始日期:</td>
                <td><input class="easyui-datebox" type="text" name="qsrq" data-options="editable:false" style="width:200px"></td>
          
                <td align="right">租赁结束日期:</td>
                <td><input class="easyui-datebox" type="text" name="jsrq" data-options="editable:false" style="width:200px"></td>
            </tr>
            <tr>
                <td align="right">是否结算费用:</td>
				<td>
					<select class="easyui-combobox" name="sfjs" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${shifou}" var="item">  
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
				</td>
				
                <td align="right">合同状态:</td>
                <td>
                	<select class="easyui-combobox" name="htzt" data-options="editable:false" style="width:200px">
	 					<c:forEach items="${hetongzhuangtai}" var="item">  
					        <option value="${item.dd_desc}">${item.dd_value}</option>
					    </c:forEach>
	 				</select>
                </td>
            </tr>
            <tr>
                <td align="right">作业总行程:</td>
                <td><input class="easyui-textbox" type="text" name="zyzlc" style="width:200px"></td>
                
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
            <tr>
                <td align="right">发票扫描件:</td>
                <td><input type="file" name="fp" id="file-fp-img" style="width:150px;" onchange="javascript:setImagePreviews(this,'fp-img');" accept="image/*" /></td>
            	<td>
            		<div id="fp-img" class="img-box" style="width:50px;height:50px;"></div>
            		<input type="hidden" name="delete-fp-img" id="delete-fp-img">
            	</td>
            </tr>
            <tr>
                <td align="right">归还设备清单扫描件:</td>
                <td><input type="file" name="qd" id="file-qd-img" style="width:150px;" onchange="javascript:setImagePreviews(this,'qd-img');" accept="image/*" /></td>
            	<td>
            		<div id="qd-img" class="img-box" style="width:50px;height:50px;"></div>
            		<input type="hidden" name="delete-qd-img" id="delete-qd-img">
            	</td>
            </tr>
            <tr>
                <td align="right">归还设备照片:</td>
                <td><input type="file" name="gh" id="file-gh-img" style="width:150px;" onchange="javascript:setImagePreviews(this,'gh-img');" accept="image/*" /></td>
            	<td>
            		<div id="gh-img" class="img-box" style="width:50px;height:50px;"></div>
            		<input type="hidden" name="delete-gh-img" id="delete-gh-img">
            	</td>
            </tr>
        </table>
    </form>
    <script>
    	$(function(){
    		var zlbhJson = ${zlbhJson};
    		$("#bh").combobox({
    			onSelect: function(record){
    				var bh=record.value;
    				var item={};
    				for(var i=0,l=zlbhJson.length;i<l;i++){
    					if(bh==zlbhJson[i].bh){
    						item=zlbhJson[i];
    					}
    				}
    				$('#zlht-form').form('load', {
    					dwmc: item.dw,
    					qsrq: item.qsrq,
    					jsrq: item.jsrq
    				});
    			}
    		});
    	})
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
	                imgObjPreview.style.borderRadius = '2px';
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