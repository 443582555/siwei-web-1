<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>数据备份</title>
    <link type="text/css" rel="stylesheet" href="./train/css/login.css">
    <script type="text/javascript" src="./train/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="./train/js/login.js"></script>
</head>
<body>
<table style="margin: 50px auto;" cellspacing="8">
        <tbody><tr>
            <td style="text-align: right;">数据库安装目录：</td>
            <td>
                <input class="easyui-textbox textbox-f" id="mysqlBinPath" style="width: 360px; height: 28px; display: none;" textboxname="mysqlBinPath">
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">数据库备份保存到：</td>
            <td>
                <input class="easyui-textbox textbox-f" id="mysqlBackupPath" style="width: 360px; height: 28px; display: none;" textboxname="mysqlBackupPath">
             </td>
        </tr>
        <tr>
            <td style="text-align: right;">服务器名称：</td>
            <td>
                <input class="easyui-textbox textbox-f" id="mysqlServer" style="width: 360px; height: 28px; display: none;" textboxname="mysqlServer">
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">服务器端口：</td>
            <td>
                <input class="easyui-textbox textbox-f" id="mysqlPort" style="width: 360px; height: 28px; display: none;" textboxname="mysqlPort">
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">数据库名称：</td>
            <td>
                <input class="easyui-textbox textbox-f" id="mysqlDbName" style="width: 360px; height: 28px; display: none;" textboxname="mysqlDbName">
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">数据库用户名：</td>
            <td>
                <input type="text" class="easyui-textbox textbox-f" id="mysqlUserName" style="width: 360px; height: 28px; display: none;" textboxname="mysqlUserName">
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">数据库密码：</td>
            <td>
                <input type="password" class="easyui-textbox textbox-f" id="mysqlPassword" style="width: 360px; height: 28px; display: none;" textboxname="mysqlPassword">
            </td>
        </tr>
        <tr>
        	<td style="text-align: right;"></td>
            <td style="text-align: center;">
                <a href="#" class="easyui-linkbutton" data-options="width:'100px'" iconCls="icon-save" onclick="reset()">重置</a>
            </td>
        </tr>
    </tbody>
</table>
</body>
</html>