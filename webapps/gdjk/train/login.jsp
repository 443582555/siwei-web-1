<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
    <title>登录</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/train/images/fav.ico" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/train/css/login.css">
</head>

<body style="overflow:hidden">
	<!--<div class="bg"></div>-->
    <div class="pagewrap">
        <div class="main">
            <div class="content">
                <div class="con_right">
                    <div class="con_r_top">
                    	<a href="javascript:;" class="left" style="color: #5d5a5a; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: rgb(46, 85, 142);"><b>登录管理</b></a>
                    </div>
                    <div id="reMessage">
                    	${requesMessage}
                    </div>
                    <ul>
                        <li class="con_r_left" style="display: block;">
                            <form name="form1" method="post" action="<%=request.getContextPath()%>/login.do" autocomplete="off">
                                <div class="user">
                                    <div>
                                        <span class="user-icon"></span>
                                        <input type="text" id="userid" name="userid" placeholder="　输入账号" value="" autocomplete="off"/>
                                    </div>
                                    <div>
                                        <span class="mima-icon"></span>
                                        <input type="password" id="pwd" name="pwd" placeholder="　输入密码" value="" autocomplete="off"/>
                                    </div>
                                    <div>
                                        <span class="yzmz-icon"></span>
                                        <input id="vdcode" type="text" name="validate" placeholder="　验证码" value="" style=" width:210px;"/>
                                        <img style="cursor: pointer;margin-left:10px;width:80px;height:33px;" id="captcha" name="captcha" alt="看不清？点击更换"
                                         title="看不清？点击更换" src="<%=request.getContextPath()%>/authCode.do"/>
                                    </div>
                                </div>
 
                                <button id="btn_Login" type="submit">登 录</button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div style="position:absolute;bottom:5px;width:100%;text-align:center;color:#5d5a5a;font-size:14px;font-weight:bold">
        	版本：V1.1.9-2019年3月6日<br>&copy 南京高铁信息科技有限公司 2018 All Rights Reserveda
    </div>
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/train/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/train/js/login.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/train/js/jquery.particleground.js"></script>
    <script type="text/javascript">
	    $(function(){
	    	$("#captcha").click(function(){
	    		$(this).attr("src",'<%=request.getContextPath()%>/authCode.do?'+new Date().getTime());
	    		$("#reMessage").html("<font color='red'> </font>");
	    	})
	    });

        document.addEventListener('DOMContentLoaded', function () {
          particleground(document.getElementsByTagName('body')[0], {
            dotColor: '#5cbdaa',
            lineColor: '#5cbdaa'
          });
        }, false);


        $(document).ready(function() {
          $('body').particleground({
            dotColor: '#5cbdaa',
            lineColor: '#5cbdaa'
          });
          $('.intro').css({
            'margin-top': -($('.intro').height() / 2)
          });
        });

    </script>
</body>

</html>