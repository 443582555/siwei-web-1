<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Language" content="UTF-8">
	<title>轨道测控技术应用系统</title>
</head>
<body>
	<div id="annoWrap">
		<h2>${type}公告</h2>
		<div id="annoContent"></div>
	</div>

    <script type="text/javascript">
		$(function(){ 
			var data=${anno};
			var str="<table class='anno'>";
			str+="<tr>";
			str+="<th  style='width: 12%'>类型名称</th>";
			str+="<th style='width: 12%'>检测仪序列号</th>";
			str+="<th>公告内容</th>";
	/* 		str+="<th style='width: 10%'>计算值</th>"; */
			str+="<th style='width: 15%'>时间</th>";
			str+="</tr>";
			for(var i=0,l=data.length;i<l;i++){
				str+="<tr data-item-id="+data[i].out_id+">";
				str+="<td class='anno-col2'>【"+data[i].type_name+"】</td>";
				str+="<td class='anno-col2'>"+data[i].object+"</td>";
				str+="<td class='anno-col3'>"+data[i].content+"</td>";
/* 				str+="<td class='anno-col4'>"+data[i].jsz+"</td>"; */
				str+="<td class='anno-col5'>"+data[i].insert_time+"</td>";
				
				str+="</tr>";
			}
			str+="</table>";
			$("#annoContent").html(str);
			
			$("#annoContent").on("click","tr",function(){
				var itemId = $(this).data("item-id");
				addTab("设备作业信息",'<%=request.getContextPath()%>/train/sbzyxx.do?id='+itemId,"");
			})
		})
	</script>
</body>
</html>