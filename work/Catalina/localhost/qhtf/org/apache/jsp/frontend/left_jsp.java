/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.75
 * Generated at: 2017-03-21 07:44:43 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.frontend;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import com.aegon_cnooc.oa.ibatis.to.TuOafUsersTO;
import com.aegon_cnooc.oa.constants.Constants;

public final class left_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

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
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
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
      response.setContentType("text/html;charset=gbk");
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

String path = request.getContextPath();

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("<title>同方全球人寿IT内部管理系统</title>\r\n");
      out.write("<link href=\"");
      out.print(path );
      out.write("/css/reset.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link href=\"");
      out.print(path );
      out.write("/css/styles.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<script src=\"");
      out.print(path );
      out.write("/js/jquery.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<script src=\"");
      out.print(path );
      out.write("/js/treeview.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("html{overflow:scroll;overflow-y:auto;overflow-x:hidden;}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");

TuOafUsersTO user = (TuOafUsersTO)session.getAttribute(Constants.GLOBAL_SESSION_USER);
String dept = user.getDept();
 
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body style=\"background:#E4F4FD;padding:0;padding:0;\">\r\n");
      out.write("<div id=\"left\">\r\n");
      out.write("  <div class=\"xbjys\" >\r\n");
      out.write("  \r\n");
      out.write("    <div class=\"left_navtit\">\r\n");
      out.write("      <!--\r\n");
      out.write("      <h3 class=\"menu_22 menu_2 menu_bg\"><em>行政部门流程</em></h3>\r\n");
      out.write("      <div class=\"menu_3\">\r\n");
      out.write("        <div class=\"left_tit current\">\r\n");
      out.write("          <h4>办公用品申请</h4>\r\n");
      out.write("          <div class=\"left_list\">\r\n");
      out.write("            <ul>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">礼品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">访客申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">印刷申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">办公用品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"left_tit\">\r\n");
      out.write("          <h4>办公用品申请1</h4>\r\n");
      out.write("          <div class=\"left_list accordionContent\">\r\n");
      out.write("            <ul>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">礼品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">访客申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">印刷申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">办公用品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"left_tit\">\r\n");
      out.write("          <h4>办公用品申请2</h4>\r\n");
      out.write("          <div class=\"left_list accordionContent\">\r\n");
      out.write("            <ul>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">礼品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">访客申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">印刷申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">办公用品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\t\r\n");
      out.write("    <div class=\"left_navtit\">\r\n");
      out.write("      <h3 class=\"menu_22\"><em>法务部门流程</em></h3>\r\n");
      out.write("      <div class=\"menu_3 accordionContent\">\r\n");
      out.write("        <div class=\"left_tit current\">\r\n");
      out.write("          <h4>办公用品申请</h4>\r\n");
      out.write("          <div class=\"left_list\">\r\n");
      out.write("            <ul>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">礼品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">访客申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">印刷申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">办公用品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"left_navtit\">\r\n");
      out.write("      <h3 class=\"menu_22\"><em>营运部门流程</em></h3>\r\n");
      out.write("      <div class=\"menu_3 accordionContent\">\r\n");
      out.write("        <div class=\"left_tit current\">\r\n");
      out.write("          <h4>办公用品申请</h4>\r\n");
      out.write("          <div class=\"left_list\">\r\n");
      out.write("            <ul>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">礼品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">访客申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">印刷申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">办公用品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"left_navtit\">\r\n");
      out.write("      <h3 class=\"menu_22\"><em>法务部门流程</em></h3>\r\n");
      out.write("      <div class=\"menu_3 accordionContent\">\r\n");
      out.write("        <div class=\"left_tit current\">\r\n");
      out.write("          <h4>办公用品申请</h4>\r\n");
      out.write("          <div class=\"left_list\">\r\n");
      out.write("            <ul>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">礼品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">访客申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">印刷申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">办公用品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"left_navtit\">\r\n");
      out.write("      <h3 class=\"menu_22\"><em>HR部门流程</em></h3>\r\n");
      out.write("      <div class=\"menu_3 accordionContent\">\r\n");
      out.write("        <div class=\"left_tit current\">\r\n");
      out.write("          <h4>功能列表</h4>\r\n");
      out.write("          <div class=\"left_list\">\r\n");
      out.write("            <ul>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">礼品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">访客申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">印刷申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">办公用品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("-->\r\n");
      out.write("    <div class=\"left_navtit\">\r\n");
      out.write("      <h3 class=\"menu_22\"><em>IT部门功能列表</em></h3>\r\n");
      out.write("      <div class=\"menu_3 current\">\r\n");
      out.write("        <div class=\"left_tit current\">\r\n");
      out.write("          <h4>功能列表</h4>\r\n");
      out.write("          <div class=\"left_list\">\r\n");
      out.write("            <ul>\r\n");
      out.write("            \r\n");
      out.write("              <li><a href=\"");
      out.print(path );
      out.write("/timesheet/initTimesheetSummary.do?user_id=");
      out.print(user.getUser_id() );
      out.write("\" target=\"main_content\">工作日志填写</a></li>\r\n");
      out.write("                <!--\r\n");
      out.write("              <li><a href=\"");
      out.print(path );
      out.write("/humanresmgmt/resMgmtOnload.do?work=init&organ_id=102\"  target=\"main_content\">人力资源统计</a></li>\r\n");
      out.write("              -->\r\n");
      out.write("              ");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      boolean _jspx_th_c_005fif_005f0_reused = false;
      try {
        _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
        _jspx_th_c_005fif_005f0.setParent(null);
        // /frontend/left.jsp(160,14) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
        _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${roleType>0}", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
        int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
        if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\r\n");
            out.write("              <li><a href=\"");
            out.print(path );
            out.write("/humanresmgmt/initResPlanning.do\"  target=\"main_content\">人力资源计划</a></li>\r\n");
            out.write("              <li><a href=\"");
            out.print(path);
            out.write("/admin/projectTreeFrameOnload.do\" target=\"main_content\">同方全球项目定义</a></li>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
            out.write("              <li><a href=\"");
            out.print(path );
            out.write("/humanresmgmt/humanResMgmtOnload.do?work=init\"  target=\"main_content\">外包资源管理</a></li>  \r\n");
            out.write("              ");
            int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return;
        }
        _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
        _jspx_th_c_005fif_005f0_reused = true;
      } finally {
        if (!_jspx_th_c_005fif_005f0_reused) {
          _jspx_th_c_005fif_005f0.release();
          _jsp_getInstanceManager().destroyInstance(_jspx_th_c_005fif_005f0);
        }
      }
      out.write("     \r\n");
      out.write("               ");
if("BPR".equals(dept) ||"IT".equals(dept)) {
      out.write("  \r\n");
      out.write("\t\t\t  <li><a href=\"");
      out.print(path);
      out.write("/timesheet/dummySROnload.do\" target=\"main_content\">虚拟SR定义</a></li>\r\n");
      out.write("\t\t\t   ");
} 
      out.write("\r\n");
      out.write("\t\t\t   ");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      boolean _jspx_th_c_005fif_005f1_reused = false;
      try {
        _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
        _jspx_th_c_005fif_005f1.setParent(null);
        // /frontend/left.jsp(168,6) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
        _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${roleType>0}", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
        int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
        if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\r\n");
            out.write("\t\t\t  <li><a href=\"");
            out.print(path );
            out.write("/timesheet/workTimeTotal.do?work=week\" target=\"main_content\">工作量统计（周报）</a> </li>\r\n");
            out.write("\t\t\t  <li><a href=\"");
            out.print(path );
            out.write("/timesheet/workTimeTotal.do?work=month\" target=\"main_content\">工作量统计（月报）</a> </li>\r\n");
            out.write("\t\t\t  <li><a href=\"");
            out.print(path );
            out.write("/timesheet/workTimeTotal.do?work=weekList\" target=\"main_content\">工作日志明细报表(周报)</a> </li>\r\n");
            out.write("\t\t\t  <!--  +V1.0 modify Bug No. by huzhongchi 2011/10/13 Start  -->\r\n");
            out.write("\t\t\t  <li><a href=\"");
            out.print(path );
            out.write("/timesheet/workTimeTotal.do?work=monthList\" target=\"main_content\">工作日志明细报表(月报)</a> </li>\r\n");
            out.write("\t\t\t  <!--  +V1.0 modify Bug No. by huzhongchi 2011/10/13 End  -->\r\n");
            out.write("\t\t\t  <li><a href=\"");
            out.print(path );
            out.write("/timesheet/workTimeTotal.do?work=occuryList\" target=\"main_content\">工作预估明细报表</a> </li>\r\n");
            out.write("\t\t\t  <!-- \r\n");
            out.write("\t\t\t  <li><a href=\"");
            out.print(path );
            out.write("/timesheet/teamWorkTimeSum.do\" target=\"main_content\">P/S/O分类统计（月报）</a> </li>\t\r\n");
            out.write("\t\t\t   -->\r\n");
            out.write("\t\t\t   <li><a href=\"");
            out.print(path );
            out.write("/timesheet/teamWorkTimeSum1.do\" target=\"main_content\">P/S/O分类统计（月报）</a> </li>\t\r\n");
            out.write("\t\t\t  ");
            //  c:if
            org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f2 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
            boolean _jspx_th_c_005fif_005f2_reused = false;
            try {
              _jspx_th_c_005fif_005f2.setPageContext(_jspx_page_context);
              _jspx_th_c_005fif_005f2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fif_005f1);
              // /frontend/left.jsp(180,5) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
              _jspx_th_c_005fif_005f2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${isCutOff>0}", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
              int _jspx_eval_c_005fif_005f2 = _jspx_th_c_005fif_005f2.doStartTag();
              if (_jspx_eval_c_005fif_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                do {
                  out.write("\r\n");
                  out.write("\t\t\t  <li><a href=\"");
                  out.print(path );
                  out.write("/timesheet/initFreezeTimesheetFuture.do\" target=\"main_content\">Cut Off</a> </li>\t\r\n");
                  out.write("\t\t\t  ");
                  int evalDoAfterBody = _jspx_th_c_005fif_005f2.doAfterBody();
                  if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                    break;
                } while (true);
              }
              if (_jspx_th_c_005fif_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                return;
              }
              _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f2);
              _jspx_th_c_005fif_005f2_reused = true;
            } finally {
              if (!_jspx_th_c_005fif_005f2_reused) {
                _jspx_th_c_005fif_005f2.release();
                _jsp_getInstanceManager().destroyInstance(_jspx_th_c_005fif_005f2);
              }
            }
            out.write("\r\n");
            out.write("\t\t\t  ");
            int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return;
        }
        _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
        _jspx_th_c_005fif_005f1_reused = true;
      } finally {
        if (!_jspx_th_c_005fif_005f1_reused) {
          _jspx_th_c_005fif_005f1.release();
          _jsp_getInstanceManager().destroyInstance(_jspx_th_c_005fif_005f1);
        }
      }
      out.write("\t\r\n");
      out.write("\t\t\t  ");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f3 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      boolean _jspx_th_c_005fif_005f3_reused = false;
      try {
        _jspx_th_c_005fif_005f3.setPageContext(_jspx_page_context);
        _jspx_th_c_005fif_005f3.setParent(null);
        // /frontend/left.jsp(184,5) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
        _jspx_th_c_005fif_005f3.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${amRoleType>0}", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
        int _jspx_eval_c_005fif_005f3 = _jspx_th_c_005fif_005f3.doStartTag();
        if (_jspx_eval_c_005fif_005f3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\r\n");
            out.write("\t\t\t  <li><a href=\"");
            out.print(path );
            out.write("/timesheet/workTimeTotal.do?work=week\" target=\"main_content\">工作量统计（周报）</a> </li>\r\n");
            out.write("\t\t\t  <li><a href=\"");
            out.print(path );
            out.write("/timesheet/workTimeTotal.do?work=month\" target=\"main_content\">工作量统计（月报）</a> </li>\r\n");
            out.write("\t\t\t  <li><a href=\"");
            out.print(path );
            out.write("/timesheet/workTimeTotal.do?work=weekList\" target=\"main_content\">工作日志明细报表(周报)</a> </li>\r\n");
            out.write("\t\t\t  <!--  +V1.0 modify Bug No. by huzhongchi 2011/10/13 Start  -->\r\n");
            out.write("\t\t\t  <li><a href=\"");
            out.print(path );
            out.write("/timesheet/workTimeTotal.do?work=monthList\" target=\"main_content\">工作日志明细报表(月报)</a> </li>\r\n");
            out.write("\t\t\t  <!--  +V1.0 modify Bug No. by huzhongchi 2011/10/13 End  -->\r\n");
            out.write("\t\t\t  <li><a href=\"");
            out.print(path );
            out.write("/timesheet/workTimeTotal.do?work=occuryList\" target=\"main_content\">工作预估明细报表</a> </li>\r\n");
            out.write("\t\t\t  ");
            int evalDoAfterBody = _jspx_th_c_005fif_005f3.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_005fif_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return;
        }
        _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f3);
        _jspx_th_c_005fif_005f3_reused = true;
      } finally {
        if (!_jspx_th_c_005fif_005f3_reused) {
          _jspx_th_c_005fif_005f3.release();
          _jsp_getInstanceManager().destroyInstance(_jspx_th_c_005fif_005f3);
        }
      }
      out.write("\r\n");
      out.write("\t\t\t    ");
if("BPR".equals(dept) ||"IT".equals(dept)) {
      out.write("  \r\n");
      out.write("\t\t\t  <li><a href=\"");
      out.print(path );
      out.write("/humanresmgmt/workTimeRrport.do?work=fact\" target=\"main_content\">P/S/O比例统计（实际发生）</a></li>\r\n");
      out.write("              <li><a href=\"");
      out.print(path );
      out.write("/humanresmgmt/workTimeRrport.do?work=intending\" target=\"main_content\">P/S/O比例统计（预估）</a></li>\r\n");
      out.write("              ");
} 
      out.write("\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("<!--  \r\n");
      out.write("    <div class=\"left_navtit\" >\r\n");
      out.write("      <h3 class=\"menu_22\"><em>流程演示demo</em></h3>\r\n");
      out.write("      <div class=\"menu_3 accordionContent\">\r\n");
      out.write("        <div class=\"left_tit current\">\r\n");
      out.write("          <h4>流程列表</h4>\r\n");
      out.write("          <div class=\"left_list\">\r\n");
      out.write("            <ul>\r\n");
      out.write("              <li><a href=\"");
      out.print(path );
      out.write("/workflow/newDemoWFOnload.do?wfid=9999&type=Post\"   target=\"main_content\">演示流程</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    -->\r\n");
      out.write("    <!--\r\n");
      out.write("    <div class=\"left_navtit\"  >\r\n");
      out.write("      <h3 class=\"menu_22\"><em>业务部门流程</em></h3>\r\n");
      out.write("      <div class=\"menu_3 accordionContent\">\r\n");
      out.write("        <div class=\"left_tit current\">\r\n");
      out.write("          <h4>办公用品申请</h4>\r\n");
      out.write("          <div class=\"left_list\">\r\n");
      out.write("            <ul>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">礼品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">访客申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">印刷申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">办公用品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"left_navtit\" >\r\n");
      out.write("      <h3 class=\"menu_22\"><em>其他</em></h3>\r\n");
      out.write("      <div class=\"menu_3 accordionContent\">\r\n");
      out.write("        <div class=\"left_tit current\">\r\n");
      out.write("          <h4>办公用品申请</h4>\r\n");
      out.write("          <div class=\"left_list\">\r\n");
      out.write("            <ul>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">礼品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">访客申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">印刷申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">办公用品申请</a></li>\r\n");
      out.write("              <li><a href=\"#\">名片申请</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\t-->\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
