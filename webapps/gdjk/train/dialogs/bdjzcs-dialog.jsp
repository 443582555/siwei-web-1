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
    <form id="bdjzcs-form" method="post">
        <table>
        	<tr>
                <td align="right">检测仪序列号:</td>
                <td><input class="easyui-textbox" type="text" name="swinstrumentid" data-options="required:true" style="width:200px"></td>
            
                <td align="right">标定时间:</td>
                <td><input class="easyui-datebox" type="text" name="meatime" data-options="required:true,editable:false" style="width:200px"></td>
          	</tr>
          	<tr>
                <td align="right">温度改正系数:</td>
                <td><input class="easyui-textbox" type="text" name="materialref" data-options="required:true" style="width:200px"></td>
            
                <td align="right">出厂cd:</td>
                <td><input class="easyui-textbox" type="text" name="lencd" data-options="required:true" style="width:200px"></td>
          	</tr>
          	<tr>
                <td align="right">出厂h:</td>
                <td><input class="easyui-textbox" type="text" name="lenh" data-options="required:true" style="width:200px"></td>
            
                <td align="right">编码器出厂直径:</td>
                <td><input class="easyui-textbox" type="text" name="wheeldiameter" data-options="required:true" style="width:200px"></td>
          	</tr>
            <tr>
                <td align="right">出厂ac:</td>
                <td><input class="easyui-textbox" type="text" name="lenac" data-options="required:true" style="width:200px"></td>
            
                <td align="right">出厂bd:</td>
                <td><input class="easyui-textbox" type="text" name="lenbd" data-options="required:true" style="width:200px"></td>
          	</tr>
            <tr>
                <td align="right">出厂ab:</td>
                <td><input class="easyui-textbox" type="text" name="lenab" data-options="required:true" style="width:200px"></td>
            
                <td align="right">出厂eo:</td>
                <td><input class="easyui-textbox" type="text" name="leneo" data-options="required:true" style="width:200px"></td>
          	</tr>
          	<tr>
                <td align="right">出厂fo:</td>
                <td><input class="easyui-textbox" type="text" name="lenfo" data-options="required:true" style="width:200px"></td>
            
                <td align="right">出厂at:</td>
                <td><input class="easyui-textbox" type="text" name="distsensorat" data-options="required:true" style="width:200px"></td>
          	</tr>
            <tr>
                <td align="right">出厂bt:</td>
                <td><input class="easyui-textbox" type="text" name="distsensorbt" data-options="required:true" style="width:200px"></td>
            
                <td align="right">出厂ct:</td>
                <td><input class="easyui-textbox" type="text" name="distsensorct" data-options="required:true" style="width:200px"></td>
          	</tr>
            <tr>
                <td align="right">出厂dt:</td>
                <td><input class="easyui-textbox" type="text" name="distsensordt" data-options="required:true" style="width:200px"></td>
            
                <td align="right">左棱镜至中心距离:</td>
                <td><input class="easyui-textbox" type="text" name="leftdistsensorkl" data-options="required:true" style="width:200px"></td>
          	</tr>
          	<tr>
                <td align="right">右棱镜至中心距离:</td>
                <td><input class="easyui-textbox" type="text" name="rightdistsensorkr" data-options="required:true" style="width:200px"></td>
            
                <td align="right">出厂xt:</td>
                <td><input class="easyui-textbox" type="text" name="anglesensorxt" data-options="required:true" style="width:200px"></td>
          	</tr>
            <tr>
                <td align="right">出厂yt:</td>
                <td><input class="easyui-textbox" type="text" name="anglesensoryt" data-options="required:true" style="width:200px"></td>
            
                <td align="right">出厂kx:</td>
                <td><input class="easyui-textbox" type="text" name="anglesensorkx" data-options="required:true" style="width:200px"></td>
          	</tr>
          	<tr>
                <td align="right">出厂ky:</td>
                <td><input class="easyui-textbox" type="text" name="anglesensorky" data-options="required:true" style="width:200px"></td>
          	</tr> 
        </table>
    </form>
</body>
</html>