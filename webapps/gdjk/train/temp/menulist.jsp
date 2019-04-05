<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
	<div class="easyui-layout" data-options="fit:true">  
        <table id="menu-dg" style="width:100%;height:500px"></table>
    </div>

    <script type="text/javascript">
        $('#menu-dg').treegrid({
		    url:'sys/menuList.do',
		    idField:'id',
		    treeField:'menu_name',
            animate: true,
		    columns:[[
		   		{field:'menu_name',title:'菜单名称',align:'left',width:'25%'},
		        {field:'menu_url',title:'菜单地址',align:'left',width:'25%'},
		        {field:'description',title:'描述',align:'left',width:'25%'},
		        {field:'icon',title:'菜单图标',align:'left',width:'25%'}
		    ]],
		    loadFilter: function(data){
		    	result = getChild(data.rows, 0);
				return result;
		    }
		});
		
		function getChild(data, parentId){
			var arr = [];
			for( var i = 0, l = data.length; i < l; i++ ){
				var item = data[i];
	    		if(parentId == item.parent_tr_id){
	    			var obj = {};
	    			obj.id = item.tm_id;
	    			obj.menu_url = item.menu_url;
	    			obj.menu_name = item.menu_name;
	    			obj.description = item.description;
	    			obj.icon = item.icon;
	    			obj.children = getChild(data, item.tm_id);
	    			arr.push(obj);
	    		}
	    	}
	    	return arr;
		}
    </script>