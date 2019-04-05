<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"> 
	<meta http-equiv="Content-Language" content="UTF-8">
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	%>
</head>
<body>
    <form id="sbbdjl-form" method="post" action="<%=basePath%>/equ/bdUpload.do" enctype="multipart/form-data">
        <table style='margin:30px auto;'>
        	<tr>
                <td align="right">检测仪序列号:</td>
                <td>
					<select class="easyui-combobox" name="sw_id" id="sw_id" data-options="editable:false" style="width:250px">
	 					<option value="">无</option>
	 					<c:forEach items="${sbList}" var="item">  
					        <option value="${item.swinstrumentid}">${item.swinstrumentid}</option>
					    </c:forEach>
	 				</select>
				</td>
          	</tr>
          	<tr>
                <td align="right">文件名:</td>
                <td><input id="file" name="file" class="easyui-filebox" labelPosition="right" data-options="prompt:'选择文件',buttonText:'&nbsp;选&nbsp;择&nbsp;',required:true" style="width:250px"></td>
          	</tr>
        </table>
    </form>
</body>
</html>