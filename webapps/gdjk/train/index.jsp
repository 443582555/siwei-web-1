<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>轨道测控技术应用系统</title>
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/train/images/fav.ico" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/train/easyui/easyui.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/train/css/main.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/train/css/icon.css" />
		<%
			String userName = request.getAttribute("userName")==null?null:(String)request.getAttribute("userName");
			String login_name = request.getAttribute("login_name")==null?null:(String)request.getAttribute("login_name");
		%>
</head>
<body class="easyui-layout">
	<!-- begin of header -->
	<div class="tim-header" data-options="region:'north',border:false,split:true">
    	<div class="tim-header-left">
        	<!--<h1>轨道测控技术应用系统</h1>-->
        </div>
        <div class="tim-header-right">
        	<span>您好,<%=userName %></span>
        </div>
    </div>
    <div class="tim-user-opt">
		<ul>
			<li onclick="changePassWord();"><a href="javascript:void(0)">修改密码</a></li>
			<li onclick="logOut();"><a href="javascript:void(0)">安全退出</a></li>
		</ul>
    </div>
    <!-- end of header -->
    
    <!-- begin of sidebar -->
	<div class="tim-sidebar" data-options="region:'west',split:true,border:true,title:'导航'" style="width:215px;overflow-y:scroll;"> 
    	<div id="siderMenu" class="easyui-accordion" data-options="border:false" style="height:auto;">
        </div>
    </div>	
    <!-- end of sidebar --> 
       
    <!-- begin of main -->
    <div class="tim-main" data-options="region:'center'">
        <div id="tim-tabs" class="easyui-tabs" data-options="border:false,fit:true">  
            <div title="公告" data-options="href:'<%=request.getContextPath()%>/train/anno.do',closable:false,cls:'pd3'"></div>
        </div>
    </div>
    <!-- end of main --> 
    
    <div class="cssload-squeeze">
		<span></span><span></span><span></span><span></span><span></span>
	</div>

	<form id="pwd-form" method="post" style="display:none;">
        <table style="margin:30px auto;">
        	<tr>
                <td align="left">请输入原始密码:</td>
            </tr>
          	<tr>
                <td><input class="easyui-textbox" type="password" id="password_old" data-options="required:true" style="width:300px"></td>
            </tr>
          	<tr>
                <td align="left">请设置新密码：</td>
            </tr>
          	<tr>
                <td><input class="easyui-textbox" type="password" id="password_new" data-options="required:true" style="width:300px"></td>
          	</tr>
          	<tr>
                <td align="left">再次输入新密码：</td>
            </tr>
          	<tr>
                <td><input class="easyui-textbox" type="password" id="password_new2" data-options="required:true" style="width:300px"></td>
            </tr>
        </table>
    </form>

    <!-- begin of footer -->
	<div class="tim-footer" data-options="region:'south',border:true,split:true">
    	&copy; 南京高铁信息科技有限公司 2018 All Rights Reserved
    </div>
    <!-- end of footer -->  

    <script type="text/javascript" src="<%=request.getContextPath()%>/train/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/train/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/train/easyui/datagrid-groupview.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/train/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
    $(function(){
    	$(".tim-header-right,.tim-user-opt").hover(function(){
    		$(".tim-header-right").addClass("active");
    		$(".tim-user-opt").show();
    	},function(){
    		$(".tim-header-right").removeClass("active");
    		$(".tim-user-opt").hide();
    	})
    	
     	$.ajaxSetup({
            statusCode: {    
		        999: function (data) {    
		            window.open ('outlogin.do','_top');
		        }  
		    },
		    beforeSend:function () {
        		$.messager.progress({ text: '正在加载中，请稍等...' });
    		},
    		complete: function () {
        		$.messager.progress('close');
    		}  
        });
		
		//创建左侧菜单
		$.ajax({
			url: "<%=request.getContextPath()%>/sys/getMenuTree2.do?",
			dataType: 'json',
			success: function(data){
				$.each(data, function(i, menu) {
					var title = menu.text;
					var id = menu.id;
					if(i==0){
						$('#siderMenu').accordion('add',{
							title: title,
							content: '<div><ul id="tree' + id + '"></ul></div>',
							selected : true
						});
					}else{
						$('#siderMenu').accordion('add',{
							title: title,
							content: '<div><ul id="tree' + id + '"></ul></div>',
							selected : false
						});
					}
					
					$("#tree" + id).tree({
                        data: data[i].children,
                        animate: true,
                        onClick: function(node){
							var url = node.menuUrl;
							var title = node.text;
							if(url){
								addTab(title,'<%=request.getContextPath()%>/train/'+url,"");
							}							
						}
                    });
				})
			}
		})

		//切换公告
		$('#siderMenu').accordion({ onSelect : function(title,index) { 
			var tab = $('#tim-tabs').tabs('getTab',0);  // get selected panel
			tab.panel('refresh', '<%=request.getContextPath()%>/train/anno.do?title='+encodeURI(title));
		}});
		
		//页面刷新
		$('#tim-tabs').tabs({
			onSelect:function(title,index){
				if(index==0){
					var selectTab = $('#tim-tabs').tabs('getSelected');
    				var url =$('#tim-tabs').tabs('getSelected').panel('options').href;
    				selectTab.panel('refresh', url);
				}
    		},
        	tools: [{
            	iconCls: 'icon-reload',
            	border: false,
            	handler: function () {
                	var selectTab = $('#tim-tabs').tabs('getSelected');
    				var url =$('#tim-tabs').tabs('getSelected').panel('options').href;
    				selectTab.panel('refresh', url);
            	}
        	}]
    	});
	})
	
	//创建标签页面函数
	function addTab(title, href, iconCls){
		var tabPanel = $('#tim-tabs');
		if(!tabPanel.tabs('exists',title)){
			tabPanel.tabs('close', 1);
			tabPanel.tabs('add',{
				title:title,
				href:href,
				iconCls:iconCls,
				fit:true,
				cls:'pd3',
				closable:true,
				onLoad: function(){
					$.messager.progress('close');
				}
			});
		}else{
			tabPanel.tabs('select',title);
			var selectTab = $('#tim-tabs').tabs('getSelected');
			var url =$('#tim-tabs').tabs('getSelected').panel('options').href;
			selectTab.panel('refresh', url);
		}
	}
	
	function submitChange() {
        var psd = $('#password_new').val();
        var psd2 = $('#password_new2').val();
        if (psd !== psd2) {
            $.messager.alert('提示', '两次输入新密码不一致，请重新输入！', 'warning');
        } else {
            if ($('#password_new').val().length < 6 || $('#password_new').val().length > 16) {
                $.messager.alert('提示信息！', '密码为6-16字符！', 'warning');
            } else {
                if ($('#pwd-form').form('validate')) {
                    $.messager.progress({ text: '正在保存中...' });
                    $.ajax({
                        type: "POST",
                        url: "updatePassword.do",
                        data: {
                            password_old: $('#password_old').val(),
                            password_new: $('#password_new').val()
                        },
                        dataType: "json",
                        success: function (data) {
                        	var returnMsg = data.returnMsg?data.returnMsg:"提交失败";
        					if(data && 'Y' == data.state){
            					$.messager.alert('信息提示',returnMsg,'info');
            					$('#pwd-form').dialog('destroy');
       						}else{
            					$.messager.alert('信息提示',returnMsg,'info');
        					}
                        }
                    });
                }
            }
        }
    }

    function changePassWord(){
    	$('#pwd-form').form('reset');
        $('#pwd-form').dialog({
            width: 500,
            height: 320,
            title: '修改密码',
            modal: true,
    		closed: false,
    		cache: false,
            iconCls: 'icon-user-add',
            buttons: [{
            	text: '确定',
    			iconCls: 'icon-add-new',
    			handler: submitChange
            }, { 
    			text: '取消', 
    			iconCls: 'icon-redo', 
    			handler: function () { 
    				$('#pwd-form').dialog('close').form('reset'); 
    			} 
            }],
            onClose: function () {
                $('#pwd-form').form('reset');
            }
        });
    }
	//退出
	function logOut(){
		$.messager.confirm('确定操作', '确定要退出登录吗？', function (flag) {
        	if (flag) {
            	window.location.href = "<%=request.getContextPath()%>/outlogin.do";
        	}
    	});
	}
	</script>
</body>
</html>