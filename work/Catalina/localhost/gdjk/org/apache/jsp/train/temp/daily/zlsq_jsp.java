/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.75
 * Generated at: 2019-03-07 21:57:34 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.train.temp.daily;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class zlsq_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("\t<title>租赁申请</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div class=\"easyui-layout\" data-options=\"fit:true\">\r\n");
      out.write("        <div data-options=\"region:'north',split:false,collapsible:false,title:'条件查询'\" style=\"height:90px;\">\r\n");
      out.write("            <div style=\"margin:10px\">\r\n");
      out.write("                <label>设备号：</label>\r\n");
      out.write(" \t\t\t\t<input class=\"easyui-textbox\" name=\"key-sw-id\" id=\"key-sw-id\">\r\n");
      out.write("                <a href=\"#\" class=\"easyui-linkbutton\" iconCls=\"icon-search\" onclick=\"query()\">查询</a>\r\n");
      out.write("                <a href=\"#\" class=\"easyui-linkbutton\" iconCls=\"icon-undo\" onclick=\"reset()\">重置</a>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div data-options=\"region:'center'\">\r\n");
      out.write("        \t<table id=\"dg\" class=\"easyui-datagrid\"></table>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("        /**\r\n");
      out.write("        * Name 添加记录\r\n");
      out.write("        */\r\n");
      out.write("        function add(){\r\n");
      out.write("        \tif(!$(\"#zlsq-form\").form('enableValidation').form('validate')){\r\n");
      out.write("        \t\t$.messager.alert('信息提示',\"您有必填项目未填写，请填写完整！\",'info');\r\n");
      out.write("        \t\treturn false;\r\n");
      out.write("        \t}\r\n");
      out.write("        \tif($(\"[name='sqr']\").val() == $(\"[name='pzr']\").val()){\r\n");
      out.write("        \t\t$.messager.alert('信息提示',\"批准人和申请人不能是同一个人！\",'info');\r\n");
      out.write("        \t\treturn false;\r\n");
      out.write("        \t}\r\n");
      out.write("            $.ajax({\r\n");
      out.write("            \ttype: 'POST',\r\n");
      out.write("                url:'lj/insertZlsq.do',\r\n");
      out.write("                data: $('#zlsq-form').serialize(),\r\n");
      out.write("                dataType: \"json\",\r\n");
      out.write("                success:function(data){\r\n");
      out.write("                    var returnMsg = data.returnMsg?data.returnMsg:\"提交失败\";\r\n");
      out.write("                    if(data && 'Y' == data.state){\r\n");
      out.write("                        $.messager.alert('信息提示',returnMsg,'info');\r\n");
      out.write("                        $('#dialog').dialog('destroy');\r\n");
      out.write("                    }else{\r\n");
      out.write("                        $.messager.alert('信息提示',returnMsg,'info');\r\n");
      out.write("                    }\r\n");
      out.write("                    $('#dg').datagrid('reload');\r\n");
      out.write("                }\r\n");
      out.write("            })\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        /**\r\n");
      out.write("        * Name 修改记录\r\n");
      out.write("        */\r\n");
      out.write("        function edit(){\r\n");
      out.write("        \tif(!$(\"#zlsq-form\").form('enableValidation').form('validate')){\r\n");
      out.write("        \t\t$.messager.alert('信息提示',\"您有必填项目未填写，请填写完整！\",'info');\r\n");
      out.write("        \t\treturn false;\r\n");
      out.write("        \t}\r\n");
      out.write("        \tif($(\"[name='sqr']\").val() == $(\"[name='pzr']\").val()){\r\n");
      out.write("        \t\t$.messager.alert('信息提示',\"批准人和申请人不能是同一个人！\",'info');\r\n");
      out.write("        \t\treturn false;\r\n");
      out.write("        \t}\r\n");
      out.write("            $.ajax({\r\n");
      out.write("            \ttype: 'POST',\r\n");
      out.write("                url:'lj/updateZlsq.do',\r\n");
      out.write("                data: $('#zlsq-form').serialize()+\"&bh=\"+$(\"#bh\").textbox(\"getValue\"),\r\n");
      out.write("                dataType: \"json\",\r\n");
      out.write("                success:function(data){\r\n");
      out.write("                    var returnMsg = data.returnMsg?data.returnMsg:\"提交失败\";\r\n");
      out.write("                    if(data && 'Y' == data.state){\r\n");
      out.write("                        $.messager.alert('信息提示',returnMsg,'info');\r\n");
      out.write("                        $('#dialog').dialog('destroy');\r\n");
      out.write("                    }else{\r\n");
      out.write("                        $.messager.alert('信息提示',returnMsg,'info');\r\n");
      out.write("                    }\r\n");
      out.write("                    $('#dg').datagrid('reload');\r\n");
      out.write("                }\r\n");
      out.write("            })\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        /**\r\n");
      out.write("        * Name 删除记录\r\n");
      out.write("        */\r\n");
      out.write("        function remove(){\r\n");
      out.write("        \tvar item = $('#dg').datagrid('getSelected');\r\n");
      out.write("            if(!item){\r\n");
      out.write("                $.messager.alert('提醒','请选择需要删除的记录!');\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("            $.messager.confirm('信息提示','确定要删除该记录？', function(result){\r\n");
      out.write("                if(result){\r\n");
      out.write("                    $.ajax({\r\n");
      out.write("                    \ttype: 'POST',\r\n");
      out.write("                        url:'lj/deleteZlsq.do',\r\n");
      out.write("                        data:{\r\n");
      out.write("                        \tid: item.id\r\n");
      out.write("                        },\r\n");
      out.write("                        dataType: \"json\",\r\n");
      out.write("                        success:function(data){\r\n");
      out.write("                            var returnMsg = data.returnMsg?data.returnMsg:\"提交失败\";\r\n");
      out.write("                    \t\tif(data && 'Y' == data.state){\r\n");
      out.write("                        \t\t$.messager.alert('信息提示',returnMsg,'info');\r\n");
      out.write("                    \t\t}else{\r\n");
      out.write("                       \t\t\t$.messager.alert('信息提示',returnMsg,'info');\r\n");
      out.write("                    \t\t}\r\n");
      out.write("                    \t\t$('#dg').datagrid('reload');\r\n");
      out.write("                        }\t\r\n");
      out.write("                    });\r\n");
      out.write("                }\t\r\n");
      out.write("            });\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        /**\r\n");
      out.write("        * Name 打开添加窗口\r\n");
      out.write("        */\r\n");
      out.write("        function openAdd(){\r\n");
      out.write("            $('<div id=\"dialog\"></div>').dialog({\r\n");
      out.write("                title: \"添加信息\",\r\n");
      out.write("                width: 700,\r\n");
      out.write("                height: 450,\r\n");
      out.write("                modal:true,\r\n");
      out.write("                closed: false,\r\n");
      out.write("                href: \"train/zlsq-dialog.do\",\r\n");
      out.write("                onClose:function(){  \r\n");
      out.write("                    $(this).dialog('destroy');  \r\n");
      out.write("                },\r\n");
      out.write("                onLoad: function(){\r\n");
      out.write("                \t$(\"#bh\").textbox(\"disable\")\r\n");
      out.write("                },\r\n");
      out.write("                buttons: [{\r\n");
      out.write("                    text: '确定',\r\n");
      out.write("                    iconCls: 'icon-ok',\r\n");
      out.write("                    handler: add\r\n");
      out.write("                }, {\r\n");
      out.write("                    text: '取消',\r\n");
      out.write("                    iconCls: 'icon-cancel',\r\n");
      out.write("                    handler: function () {\r\n");
      out.write("                        $('#dialog').dialog('close');                    \r\n");
      out.write("                    }\r\n");
      out.write("                }]\r\n");
      out.write("            });\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        /**\r\n");
      out.write("        * Name 打开修改窗口\r\n");
      out.write("        */\r\n");
      out.write("        function openEdit(){\r\n");
      out.write("            var items = $('#dg').datagrid('getChecked');\r\n");
      out.write("            if(items.length != 1){\r\n");
      out.write("                $.messager.alert('提醒','修改时必须且只能选中一条记录!');\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            $('<div id=\"dialog\"></div>').dialog({\r\n");
      out.write("                title: \"修改信息\",\r\n");
      out.write("                width: 700,\r\n");
      out.write("                height: 450,\r\n");
      out.write("                modal:true,\r\n");
      out.write("                closed: false,\r\n");
      out.write("                href: \"train/zlsq-dialog.do\",\r\n");
      out.write("                onClose:function(){  \r\n");
      out.write("                    $(this).dialog('destroy');  \r\n");
      out.write("                },\r\n");
      out.write("                onLoad:function(){\r\n");
      out.write("                \t$('#zlsq-form').form('load', items[0]);\r\n");
      out.write("                \t$(\"#bh\").textbox(\"disable\");\r\n");
      out.write("                },\r\n");
      out.write("                buttons: [{\r\n");
      out.write("                    text: '确定',\r\n");
      out.write("                    iconCls: 'icon-ok',\r\n");
      out.write("                    handler: edit\r\n");
      out.write("                }, {\r\n");
      out.write("                    text: '取消',\r\n");
      out.write("                    iconCls: 'icon-cancel',\r\n");
      out.write("                    handler: function () {\r\n");
      out.write("                        $('#dialog').dialog('close');                    \r\n");
      out.write("                    }\r\n");
      out.write("                }]\r\n");
      out.write("            });\r\n");
      out.write("        }\t\r\n");
      out.write("\r\n");
      out.write("        /*\r\n");
      out.write("        * 检索\r\n");
      out.write("        */\r\n");
      out.write("        function query(){\r\n");
      out.write("        \t$('#dg').datagrid('options').queryParams = {\r\n");
      out.write("        \t\tsw_id: $(\"#key-sw-id\").val()\r\n");
      out.write("            };\r\n");
      out.write("            $('#dg').datagrid(\"reload\");           \r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        /**\r\n");
      out.write("        * Name 载入数据\r\n");
      out.write("        */\r\n");
      out.write("        $('#dg').datagrid({\r\n");
      out.write("            url:'lj/queryZlsqList.do',\r\n");
      out.write("            method:'post',\r\n");
      out.write("            singleSelect:true,\r\n");
      out.write("            footer:'#ft',\r\n");
      out.write("            rownumbers:true,\r\n");
      out.write("            pageSize:20,\r\n");
      out.write("            pagination:true,\r\n");
      out.write("            multiSort:true,\r\n");
      out.write("            fitColumns:false,\r\n");
      out.write("            fit:true,\r\n");
      out.write("            border:false,\r\n");
      out.write("            striped: true,\r\n");
      out.write("            frozenColumns:[[\r\n");
      out.write("\t\t        { field:'',width:100,align:'center',checkbox:true}\r\n");
      out.write("\t\t    ]],\r\n");
      out.write("            columns:[[\r\n");
      out.write("            \t{field:'lx_name',title:'租赁类型',width:100,align:'center'},\r\n");
      out.write("            \t{field:'sbmc',title:'租赁设备名称',width:100,align:'center'},\r\n");
      out.write("            \t{field:'bh',title:'租赁编号',width:180,align:'center'},\r\n");
      out.write("            \t{field:'dw_name',title:'租赁单位',width:150,align:'center'},\r\n");
      out.write("            \t{field:'sl',title:'拟租赁台数',width:100,align:'center'},\r\n");
      out.write("            \t{field:'sbxlh',title:'租赁设备序列号',width:150,align:'center'},\r\n");
      out.write("            \t{field:'lxr',title:'租赁单位联系人',width:150,align:'center'},\r\n");
      out.write("            \t{field:'dh',title:'联系电话',width:100,align:'center'},\r\n");
      out.write("            \t{field:'qsrq',title:'租赁起始日期',width:100,align:'center'},\r\n");
      out.write("            \t{field:'jsrq',title:'租赁结束日期',width:100,align:'center'},\r\n");
      out.write("            \t//{field:'smj',title:'合同扫描件',width:100,align:'center'},\r\n");
      out.write("            \t{field:'sqr_name',title:'申请人',width:100,align:'center'},\r\n");
      out.write("            \t{field:'sqrq',title:'申请日期',width:100,align:'center'},\r\n");
      out.write("            \t{field:'pzr_name',title:'批准人',width:100,align:'center'},\r\n");
      out.write("            \t{field:'pzrq',title:'批准日期',width:100,align:'center'},\r\n");
      out.write("            \t{field:'lcdj',title:'里程单价',width:100,align:'center'},\r\n");
      out.write("            \t{field:'tsdj',title:'天数单价',width:100,align:'center'},\r\n");
      out.write("            \t{field:'_operate',title:'操作',width:180,align:'center',formatter:formatOper}\r\n");
      out.write("            ]],\r\n");
      out.write("            toolbar: [{\r\n");
      out.write("\t            text: '添加', \r\n");
      out.write("\t            iconCls: 'icon-add', \r\n");
      out.write("\t            handler: openAdd\r\n");
      out.write("\t        }, '-', { \r\n");
      out.write("\t            text: '修改', \r\n");
      out.write("\t            iconCls: 'icon-edit', \r\n");
      out.write("\t            handler: openEdit\r\n");
      out.write("\t        }, '-',{ \r\n");
      out.write("\t            text: '删除', \r\n");
      out.write("\t            iconCls: 'icon-remove', \r\n");
      out.write("\t            handler: remove\r\n");
      out.write("\t        }]\r\n");
      out.write("        });\r\n");
      out.write("    \tfunction formatOper(val,row,index){\r\n");
      out.write("    \t    if(\"0\"==row.sfty){\r\n");
      out.write("    \t    \treturn '已同意'\r\n");
      out.write("    \t    }else if(\"1\"==row.sfty){\r\n");
      out.write("    \t    \treturn '已拒绝'\r\n");
      out.write("    \t    }else{\r\n");
      out.write("    \t    \tif(row.bOperate){\r\n");
      out.write("\t    \t    \treturn '<a href=\"#\" onclick=\"shenhe('+row.id+',0)\">同意</a>'+\r\n");
      out.write("\t        \t\t' <a href=\"#\" onclick=\"shenhe('+row.id+',1)\">不同意</a>';\r\n");
      out.write("    \t    \t}else{\r\n");
      out.write("    \t    \t\treturn \"尚未审批，您无权限\"\r\n");
      out.write("    \t    \t}\r\n");
      out.write("    \t    }\r\n");
      out.write("    \t}\r\n");
      out.write("    \tfunction shenhe(id,code){\r\n");
      out.write("    \t\t$.ajax({\r\n");
      out.write("            \ttype: 'POST',\r\n");
      out.write("                url:'lj/updateZlsqsp.do',\r\n");
      out.write("                data:{\r\n");
      out.write("                \tid: id,\r\n");
      out.write("                \tsfty: code\r\n");
      out.write("                },\r\n");
      out.write("                dataType: \"json\",\r\n");
      out.write("                success:function(data){\r\n");
      out.write("                    var returnMsg = data.returnMsg?data.returnMsg:\"提交失败\";\r\n");
      out.write("            \t\tif(data && 'Y' == data.state){\r\n");
      out.write("                \t\t$.messager.alert('信息提示',returnMsg,'info');\r\n");
      out.write("            \t\t}else{\r\n");
      out.write("               \t\t\t$.messager.alert('信息提示',returnMsg,'info');\r\n");
      out.write("            \t\t}\r\n");
      out.write("            \t\t$('#dg').datagrid('reload');\r\n");
      out.write("                }\t\r\n");
      out.write("            });\r\n");
      out.write("    \t}\r\n");
      out.write("    </script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
