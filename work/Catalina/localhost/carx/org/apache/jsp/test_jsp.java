/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.75
 * Generated at: 2018-03-26 03:22:04 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class test_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>测试页面</title>\r\n");

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;

      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<p style=\"color: red; margin-left: 45%\">\r\n");
      out.write("\t\t测试页面(");
      out.print(basePath);
      out.write(")\r\n");
      out.write("\t</p>\r\n");
      out.write("\r\n");
      out.write("<a href=\"http://www.json.cn\" target=\"_blank\">JSON解析</a>\r\n");
      out.write("\t<form action=\"");
      out.print(basePath);
      out.write("/clgla.do\" method=\"post\">\r\n");
      out.write("\t\t<!-- <form action=\"http://localhost:8080/carx/updateClgla.do\" method=\"post\"> -->\r\n");
      out.write("\t\t<font color=\"red\">1.查询(<input name=\"clgl\" value=\"clgla.do\">)\r\n");
      out.write("\t\t</font><br /> SN：<input name=\"SN\" value=\"864394010980110\"> IMEI：<input\r\n");
      out.write("\t\t\tname=\"IMEI\" value=\"\"> <input type=\"submit\">\r\n");
      out.write("\t</form>\r\n");
      out.write("\t<form action=\"");
      out.print(basePath);
      out.write("/updateClgla.do\" method=\"post\">\r\n");
      out.write("\t\t<font color=\"red\">2.更新(<input name=\"updateClgl\"\r\n");
      out.write("\t\t\tvalue=\"updateClgla.do\">)\r\n");
      out.write("\t\t</font><br /> 违规次数：<input name=\"Illegal\" value=\"9\"> SN：<input\r\n");
      out.write("\t\t\tname=\"SN\" value=\"864394010980110\"> IMEI：<input name=\"IMEI\"\r\n");
      out.write("\t\t\tvalue=\"\"> 车牌号：<input name=\"plateNumber\" value=\"苏AC55S3\">\r\n");
      out.write("\t\t备注： <input name=\"message\" value=\"撒旦法拉法基\"> <input type=\"submit\">\r\n");
      out.write("\t</form>\r\n");
      out.write("\r\n");
      out.write("\t<form action=\"");
      out.print(basePath);
      out.write("/authorization.do\" method=\"post\">\r\n");
      out.write("\t\t<font color=\"red\">3.授权</font><br /> name：<input name=\"name\" value=\"\">\r\n");
      out.write("\t\tSN：<input name=\"SN\" value=\"\"> IMEI：<input name=\"IMEI\" value=\"\">\r\n");
      out.write("\r\n");
      out.write("\t\t<input type=\"submit\">\r\n");
      out.write("\t</form>\r\n");
      out.write("\t\r\n");
      out.write("\t\t<form action=\"");
      out.print(basePath);
      out.write("/qcwx.do\" method=\"post\">\r\n");
      out.write("\t\t<font color=\"red\">4.汽车维修首页(<input name=\"clgl\" value=\"qcwx.do\">)\r\n");
      out.write("\t\t</font><br /> SN：<input name=\"SN\" value=\"864394010980110\"> IMEI：<input\r\n");
      out.write("\t\t\tname=\"IMEI\" value=\"\">\r\n");
      out.write("<br /> uuid：<input name=\"uuid\" value=\"\"/>\r\n");
      out.write("<br /> name：<input name=\"name\" value=\"\"/>\r\n");
      out.write("<br /> carNo：<input name=\"carNo\" value=\"\"/>\r\n");
      out.write("<br /> \t\t\t <input type=\"submit\">\r\n");
      out.write("\t</form>\r\n");
      out.write("\t\t<form action=\"");
      out.print(basePath);
      out.write("/qcwxSy.do\" method=\"post\">\r\n");
      out.write("\t\t<font color=\"red\">4.汽车维修首页2(<input name=\"clgl\" value=\"qcwxSy.do\">)\r\n");
      out.write("\t\t</font><br /> SN：<input name=\"SN\" value=\"864394010980110\"> IMEI：<input\r\n");
      out.write("\t\t\tname=\"IMEI\" value=\"\">\r\n");
      out.write("<br /> uuid：<input name=\"uuid\" value=\"\"/>\r\n");
      out.write("<br /> name：<input name=\"name\" value=\"\"/>\r\n");
      out.write("<br /> carNo：<input name=\"carNo\" value=\"\"/>\r\n");
      out.write("<br /> \t\t\t <input type=\"submit\">\r\n");
      out.write("\t</form>\t\r\n");
      out.write("\t\t<form action=\"");
      out.print(basePath);
      out.write("/qcwxMx.do\" method=\"post\">\r\n");
      out.write("\t\t<font color=\"red\">4.汽车维修首页3(<input name=\"clgl\" value=\"qcwxMx.do\">)\r\n");
      out.write("\t\t</font><br /> SN：<input name=\"SN\" value=\"864394010980110\"> IMEI：<input\r\n");
      out.write("\t\t\tname=\"IMEI\" value=\"\">\r\n");
      out.write("<br /> uuid：<input name=\"uuid\" value=\"\"/>\r\n");
      out.write("<br /> name：<input name=\"name\" value=\"\"/>\r\n");
      out.write("<br /> carNo：<input name=\"carNo\" value=\"苏AC55S3\"/>\r\n");
      out.write("<br /> \t\t\t <input type=\"submit\">\r\n");
      out.write("\t</form>\r\n");
      out.write("\t\r\n");
      out.write("\t\t<form action=\"");
      out.print(basePath);
      out.write("/insertQcwx.do\" method=\"post\">\r\n");
      out.write("\t\t<font color=\"red\">5.汽车维修保存(<input name=\"clgl\" value=\"insertQcwx.do\">)\r\n");
      out.write("\t\t</font><br /> SN：<input name=\"SN\" value=\"864394010980110\"> IMEI：<input\r\n");
      out.write("\t\t\tname=\"IMEI\" value=\"\"> \r\n");
      out.write(" \r\n");
      out.write("<br /> uuid：<input name=\"uuid\" value=\"\"/>\r\n");
      out.write("<br /> name：<input name=\"name\" value=\"\"/>\r\n");
      out.write("<br /> carNo：<input name=\"carNo\" value=\"\"/>\r\n");
      out.write("<br /> models：<input name=\"models\" value=\"\"/>\r\n");
      out.write("<br /> kilometre：<input name=\"kilometre\" value=\"\"/>\r\n");
      out.write("<br /> fwzy：<input name=\"fwzy\" value=\"\"/>\r\n");
      out.write("<br /> cDate：<input name=\"cDate\" value=\"\"/>\r\n");
      out.write("<br /> tel：<input name=\"tel\" value=\"\"/>\r\n");
      out.write("<br /> insertTime：<input name=\"insertTime\" value=\"\"/>\r\n");
      out.write("<br /> updateTime：<input name=\"updateTime\" value=\"\"/>\r\n");
      out.write("<br /> jsz_zp：<input name=\"jsz_zp\" value=\"\"/>xxx_照片（uuid1.jpg:uuid2.jpg:uuid3.jpg:uuid4.jpg）\r\n");
      out.write("<br /> jsz_bz：<input name=\"jsz_bz\" value=\"\"/>xxx_备注\r\n");
      out.write("<br /> xsz_bz：<input name=\"xsz_bz\" value=\"\"/>\r\n");
      out.write("<br /> xsz_zp：<input name=\"xsz_zp\" value=\"\"/>\r\n");
      out.write("<br /> qcdg：<input name=\"qcdg\" value=\"\"/>\r\n");
      out.write("<br /> qcdg_zp：<input name=\"qcdg_zp\" value=\"\"/>\r\n");
      out.write("<br /> qcdg_bz：<input name=\"qcdg_bz\" value=\"\"/>\r\n");
      out.write("<br /> bls：<input name=\"bls\" value=\"\"/>\r\n");
      out.write("<br /> bls_zp：<input name=\"bls_zp\" value=\"\"/>\r\n");
      out.write("<br /> bls_bz：<input name=\"bls_bz\" value=\"\"/>\r\n");
      out.write("<br /> ygq：<input name=\"ygq\" value=\"\"/>\r\n");
      out.write("<br /> ygq_bz：<input name=\"ygq_bz\" value=\"\"/>\r\n");
      out.write("<br /> ygq_zp：<input name=\"ygq_zp\" value=\"\"/>\r\n");
      out.write("<br /> dpjcddy：<input name=\"dpjcddy\" value=\"\"/>\r\n");
      out.write("<br /> dpjcddy_zp：<input name=\"dpjcddy_zp\" value=\"\"/>\r\n");
      out.write("<br /> dpjcddy_bz：<input name=\"dpjcddy_bz\" value=\"\"/>\r\n");
      out.write("<br /> lqy：<input name=\"lqy\" value=\"\"/>\r\n");
      out.write("<br /> lqy_bz：<input name=\"lqy_bz\" value=\"\"/>\r\n");
      out.write("<br /> lqy_zp：<input name=\"lqy_zp\" value=\"\"/>\r\n");
      out.write("<br /> dlzxy：<input name=\"dlzxy\" value=\"\"/>\r\n");
      out.write("<br /> dlzxy_zp：<input name=\"dlzxy_zp\" value=\"\"/>\r\n");
      out.write("<br /> dlzxy_bz：<input name=\"dlzxy_bz\" value=\"\"/>\r\n");
      out.write("<br /> zdbsxy：<input name=\"zdbsxy\" value=\"\"/>\r\n");
      out.write("<br /> zdbsxy_zp：<input name=\"zdbsxy_zp\" value=\"\"/>\r\n");
      out.write("<br /> zdbsxy_bz：<input name=\"zdbsxy_bz\" value=\"\"/>\r\n");
      out.write("<br /> zdy：<input name=\"zdy\" value=\"\"/>\r\n");
      out.write("<br /> zdy_zp：<input name=\"zdy_zp\" value=\"\"/>\r\n");
      out.write("<br /> zdy_bz：<input name=\"zdy_bz\" value=\"\"/>\r\n");
      out.write("<br /> kqlx：<input name=\"kqlx\" value=\"\"/>\r\n");
      out.write("<br /> kqlx_bz：<input name=\"kqlx_bz\" value=\"\"/>\r\n");
      out.write("<br /> kqlx_zp：<input name=\"kqlx_zp\" value=\"\"/>\r\n");
      out.write("<br /> ktlx：<input name=\"ktlx\" value=\"\"/>\r\n");
      out.write("<br /> ktlx_bz：<input name=\"ktlx_bz\" value=\"\"/>\r\n");
      out.write("<br /> ktlx_zp：<input name=\"ktlx_zp\" value=\"\"/>\r\n");
      out.write("<br /> jqm：<input name=\"jqm\" value=\"\"/>\r\n");
      out.write("<br /> jqm_bz：<input name=\"jqm_bz\" value=\"\"/>\r\n");
      out.write("<br /> jqm_zp：<input name=\"jqm_zp\" value=\"\"/>\r\n");
      out.write("<br /> fdjyx：<input name=\"fdjyx\" value=\"\"/>\r\n");
      out.write("<br /> fdjyx_bz：<input name=\"fdjyx_bz\" value=\"\"/>\r\n");
      out.write("<br /> fdjyx_zp：<input name=\"fdjyx_zp\" value=\"\"/>\r\n");
      out.write("<br /> fdjlyls：<input name=\"fdjlyls\" value=\"\"/>\r\n");
      out.write("<br /> fdjlyls_bz：<input name=\"fdjlyls_bz\" value=\"\"/>\r\n");
      out.write("<br /> fdjlyls_zp：<input name=\"fdjlyls_zp\" value=\"\"/>\r\n");
      out.write("<br /> ltqy：<input name=\"ltqy\" value=\"\"/>\r\n");
      out.write("<br /> ltqy_bz：<input name=\"ltqy_bz\" value=\"\"/>\r\n");
      out.write("<br /> ltqy_zp：<input name=\"ltqy_zp\" value=\"\"/>\r\n");
      out.write("<br /> ltdph：<input name=\"ltdph\" value=\"\"/>\r\n");
      out.write("<br /> lthwsd：<input name=\"lthwsd\" value=\"\"/>\r\n");
      out.write("<br /> lthwsd_z4：<input name=\"lthwsd_z4\" value=\"\"/>\r\n");
      out.write("<br /> lthwsd_z3：<input name=\"lthwsd_z3\" value=\"\"/>\r\n");
      out.write("<br /> lthwsd_z2：<input name=\"lthwsd_z2\" value=\"\"/>\r\n");
      out.write("<br /> lthwsd_z1：<input name=\"lthwsd_z1\" value=\"\"/>\r\n");
      out.write("<br /> lthwsd_zp：<input name=\"lthwsd_zp\" value=\"\"/>\r\n");
      out.write("<br /> lthwsd_bz：<input name=\"lthwsd_bz\" value=\"\"/>\r\n");
      out.write("<br /> zdmcpsyhd：<input name=\"zdmcpsyhd\" value=\"\"/>\r\n");
      out.write("<br /> zdmcpsyhd_z4：<input name=\"zdmcpsyhd_z4\" value=\"\"/>\r\n");
      out.write("<br /> zdmcpsyhd_z3：<input name=\"zdmcpsyhd_z3\" value=\"\"/>\r\n");
      out.write("<br /> zdmcpsyhd_z2：<input name=\"zdmcpsyhd_z2\" value=\"\"/>\r\n");
      out.write("<br /> zdmcpsyhd_z1：<input name=\"zdmcpsyhd_z1\" value=\"\"/>\r\n");
      out.write("<br /> zdmcpsyhd_zp：<input name=\"zdmcpsyhd_zp\" value=\"\"/>\r\n");
      out.write("<br /> zdmcpsyhd_bz：<input name=\"zdmcpsyhd_bz\" value=\"\"/>\r\n");
      out.write("<br /> zdpdmmshd：<input name=\"zdpdmmshd\" value=\"\"/>\r\n");
      out.write("<br /> zdpdmmshd_z4：<input name=\"zdpdmmshd_z4\" value=\"\"/>\r\n");
      out.write("<br /> zdpdmmshd_z3：<input name=\"zdpdmmshd_z3\" value=\"\"/>\r\n");
      out.write("<br /> zdpdmmshd_z2：<input name=\"zdpdmmshd_z2\" value=\"\"/>\r\n");
      out.write("<br /> zdpdmmshd_z1：<input name=\"zdpdmmshd_z1\" value=\"\"/>\r\n");
      out.write("<br /> zdpdmmshd_bz：<input name=\"zdpdmmshd_bz\" value=\"\"/>\r\n");
      out.write("<br /> zdpdmmshd_zp：<input name=\"zdpdmmshd_zp\" value=\"\"/>\r\n");
      out.write("<br /> scplgljc：<input name=\"scplgljc\" value=\"\"/>\r\n");
      out.write("<br /> scplgljc_zp：<input name=\"scplgljc_zp\" value=\"\"/>\r\n");
      out.write("<br /> scplgljc_bz：<input name=\"scplgljc_bz\" value=\"\"/>\r\n");
      out.write("<br /> dpljj：<input name=\"dpljj\" value=\"\"/>\r\n");
      out.write("<br /> dpljj_zp：<input name=\"dpljj_zp\" value=\"\"/>\r\n");
      out.write("<br /> dpljj_bz：<input name=\"dpljj_bz\" value=\"\"/>\r\n");
      out.write("<br /> dpls：<input name=\"dpls\" value=\"\"/>\r\n");
      out.write("<br /> dpls_bz：<input name=\"dpls_bz\" value=\"\"/>\r\n");
      out.write("<br /> dpls_zp：<input name=\"dpls_zp\" value=\"\"/>\r\n");
      out.write("<br /> clbydab_bz：<input name=\"clbydab_bz\" value=\"\"/>\r\n");
      out.write("<br /> clbydab_zp：<input name=\"clbydab_zp\" value=\"\"/>\r\n");
      out.write("<br /> tjzk：<input name=\"tjzk\" value=\"\"/>\r\n");
      out.write("<br /> jcjg：<input name=\"jcjg\" value=\"\"/>\r\n");
      out.write("<br /> dhhm：<input name=\"dhhm\" value=\"\"/>\r\n");
      out.write("<br /> khwxh：<input name=\"khwxh\" value=\"\"/>\r\n");
      out.write("<br /> sfbc：<input name=\"sfbc\" value=\"\"/>1：保存 2：提交，3转发\r\n");
      out.write("<br /> sftj：<input name=\"sftj\" value=\"\"/>废弃\r\n");
      out.write("\r\n");
      out.write("<br /> bls_zt：<input name=\"bls_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> ygq_zt：<input name=\"ygq_zt\" value=\"\"/>XXX_状态（1良好，2警告，3危险）\r\n");
      out.write("\t\t\t <br /> dpjcddy_zt：<input name=\"dpjcddy_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> lqy_zt    ：<input name=\"lqy_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> dlzxy_zt  ：<input name=\"dlzxy_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> zdbsxy_zt ：<input name=\"zdbsxy_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> zdy_zt    ：<input name=\"zdy_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> kqlx_zt   ：<input name=\"kqlx_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> ktlx_zt   ：<input name=\"ktlx_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> jqm_zt    ：<input name=\"jqm_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> fdjyx_zt  ：<input name=\"fdjyx_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> fdjlyls_zt：<input name=\"fdjlyls_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> ltqy_zt   ：<input name=\"ltqy_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> lthwsd_zt ：<input name=\"lthwsd_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> zdmcpsyhd_zt ：<input name=\"zdmcpsyhd_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> zdpdmmshd_zt ：<input name=\"zdpdmmshd_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> dpls_zt：<input name=\"dpls_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> qcdg_zt：<input name=\"qcdg_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t  <br /> dpljj_zt：<input name=\"dpljj_zt\" value=\"\"/>\r\n");
      out.write("<br />\r\n");
      out.write(" <input type=\"submit\">\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<form action=\"");
      out.print(basePath);
      out.write("/updateQcwx.do\" method=\"post\">\r\n");
      out.write("<font color=\"red\">6.汽车维修更新(<input name=\"clgl\" value=\"updateQcwx.do\">)\r\n");
      out.write("</font><br /> SN：<input name=\"SN\" value=\"864394010980110\"> \r\n");
      out.write("IMEI：<input name=\"IMEI\" value=\"\"> \r\n");
      out.write("<br /> uuid：<input name=\"uuid\" value=\"\"/>\r\n");
      out.write("<br /> name：<input name=\"name\" value=\"\"/>\r\n");
      out.write("<br /> carNo：<input name=\"carNo\" value=\"\"/>\r\n");
      out.write("<br /> models：<input name=\"models\" value=\"\"/>\r\n");
      out.write("<br /> kilometre：<input name=\"kilometre\" value=\"\"/>\r\n");
      out.write("<br /> fwzy：<input name=\"fwzy\" value=\"\"/>\r\n");
      out.write("<br /> cDate：<input name=\"cDate\" value=\"\"/>\r\n");
      out.write("<br /> tel：<input name=\"tel\" value=\"\"/>\r\n");
      out.write("<br /> insertTime：<input name=\"insertTime\" value=\"\"/>\r\n");
      out.write("<br /> updateTime：<input name=\"updateTime\" value=\"\"/>\r\n");
      out.write("<br /> jsz_zp：<input name=\"jsz_zp\" value=\"\"/>\r\n");
      out.write("<br /> jsz_bz：<input name=\"jsz_bz\" value=\"\"/>\r\n");
      out.write("<br /> xsz_bz：<input name=\"xsz_bz\" value=\"\"/>\r\n");
      out.write("<br /> xsz_zp：<input name=\"xsz_zp\" value=\"\"/>\r\n");
      out.write("<br /> qcdg：<input name=\"qcdg\" value=\"\"/>\r\n");
      out.write("<br /> qcdg_zp：<input name=\"qcdg_zp\" value=\"\"/>\r\n");
      out.write("<br /> qcdg_bz：<input name=\"qcdg_bz\" value=\"\"/>\r\n");
      out.write("<br /> bls：<input name=\"bls\" value=\"\"/>\r\n");
      out.write("<br /> bls_zp：<input name=\"bls_zp\" value=\"\"/>\r\n");
      out.write("<br /> bls_bz：<input name=\"bls_bz\" value=\"\"/>\r\n");
      out.write("<br /> ygq：<input name=\"ygq\" value=\"\"/>\r\n");
      out.write("<br /> ygq_bz：<input name=\"ygq_bz\" value=\"\"/>\r\n");
      out.write("<br /> ygq_zp：<input name=\"ygq_zp\" value=\"\"/>\r\n");
      out.write("<br /> dpjcddy：<input name=\"dpjcddy\" value=\"\"/>\r\n");
      out.write("<br /> dpjcddy_zp：<input name=\"dpjcddy_zp\" value=\"\"/>\r\n");
      out.write("<br /> dpjcddy_bz：<input name=\"dpjcddy_bz\" value=\"\"/>\r\n");
      out.write("<br /> lqy：<input name=\"lqy\" value=\"\"/>\r\n");
      out.write("<br /> lqy_bz：<input name=\"lqy_bz\" value=\"\"/>\r\n");
      out.write("<br /> lqy_zp：<input name=\"lqy_zp\" value=\"\"/>\r\n");
      out.write("<br /> dlzxy：<input name=\"dlzxy\" value=\"\"/>\r\n");
      out.write("<br /> dlzxy_zp：<input name=\"dlzxy_zp\" value=\"\"/>\r\n");
      out.write("<br /> dlzxy_bz：<input name=\"dlzxy_bz\" value=\"\"/>\r\n");
      out.write("<br /> zdbsxy：<input name=\"zdbsxy\" value=\"\"/>\r\n");
      out.write("<br /> zdbsxy_zp：<input name=\"zdbsxy_zp\" value=\"\"/>\r\n");
      out.write("<br /> zdbsxy_bz：<input name=\"zdbsxy_bz\" value=\"\"/>\r\n");
      out.write("<br /> zdy：<input name=\"zdy\" value=\"\"/>\r\n");
      out.write("<br /> zdy_zp：<input name=\"zdy_zp\" value=\"\"/>\r\n");
      out.write("<br /> zdy_bz：<input name=\"zdy_bz\" value=\"\"/>\r\n");
      out.write("<br /> kqlx：<input name=\"kqlx\" value=\"\"/>\r\n");
      out.write("<br /> kqlx_bz：<input name=\"kqlx_bz\" value=\"\"/>\r\n");
      out.write("<br /> kqlx_zp：<input name=\"kqlx_zp\" value=\"\"/>\r\n");
      out.write("<br /> ktlx：<input name=\"ktlx\" value=\"\"/>\r\n");
      out.write("<br /> ktlx_bz：<input name=\"ktlx_bz\" value=\"\"/>\r\n");
      out.write("<br /> ktlx_zp：<input name=\"ktlx_zp\" value=\"\"/>\r\n");
      out.write("<br /> jqm：<input name=\"jqm\" value=\"\"/>\r\n");
      out.write("<br /> jqm_bz：<input name=\"jqm_bz\" value=\"\"/>\r\n");
      out.write("<br /> jqm_zp：<input name=\"jqm_zp\" value=\"\"/>\r\n");
      out.write("<br /> fdjyx：<input name=\"fdjyx\" value=\"\"/>\r\n");
      out.write("<br /> fdjyx_bz：<input name=\"fdjyx_bz\" value=\"\"/>\r\n");
      out.write("<br /> fdjyx_zp：<input name=\"fdjyx_zp\" value=\"\"/>\r\n");
      out.write("<br /> fdjlyls：<input name=\"fdjlyls\" value=\"\"/>\r\n");
      out.write("<br /> fdjlyls_bz：<input name=\"fdjlyls_bz\" value=\"\"/>\r\n");
      out.write("<br /> fdjlyls_zp：<input name=\"fdjlyls_zp\" value=\"\"/>\r\n");
      out.write("<br /> ltqy：<input name=\"ltqy\" value=\"\"/>\r\n");
      out.write("<br /> ltqy_bz：<input name=\"ltqy_bz\" value=\"\"/>\r\n");
      out.write("<br /> ltqy_zp：<input name=\"ltqy_zp\" value=\"\"/>\r\n");
      out.write("<br /> ltdph：<input name=\"ltdph\" value=\"\"/>\r\n");
      out.write("<br /> lthwsd：<input name=\"lthwsd\" value=\"\"/>\r\n");
      out.write("<br /> lthwsd_z4：<input name=\"lthwsd_z4\" value=\"\"/>\r\n");
      out.write("<br /> lthwsd_z3：<input name=\"lthwsd_z3\" value=\"\"/>\r\n");
      out.write("<br /> lthwsd_z2：<input name=\"lthwsd_z2\" value=\"\"/>\r\n");
      out.write("<br /> lthwsd_z1：<input name=\"lthwsd_z1\" value=\"\"/>\r\n");
      out.write("<br /> lthwsd_zp：<input name=\"lthwsd_zp\" value=\"\"/>\r\n");
      out.write("<br /> lthwsd_bz：<input name=\"lthwsd_bz\" value=\"\"/>\r\n");
      out.write("<br /> zdmcpsyhd：<input name=\"zdmcpsyhd\" value=\"\"/>\r\n");
      out.write("<br /> zdmcpsyhd_z4：<input name=\"zdmcpsyhd_z4\" value=\"\"/>\r\n");
      out.write("<br /> zdmcpsyhd_z3：<input name=\"zdmcpsyhd_z3\" value=\"\"/>\r\n");
      out.write("<br /> zdmcpsyhd_z2：<input name=\"zdmcpsyhd_z2\" value=\"\"/>\r\n");
      out.write("<br /> zdmcpsyhd_z1：<input name=\"zdmcpsyhd_z1\" value=\"\"/>\r\n");
      out.write("<br /> zdmcpsyhd_zp：<input name=\"zdmcpsyhd_zp\" value=\"\"/>\r\n");
      out.write("<br /> zdmcpsyhd_bz：<input name=\"zdmcpsyhd_bz\" value=\"\"/>\r\n");
      out.write("<br /> zdpdmmshd：<input name=\"zdpdmmshd\" value=\"\"/>\r\n");
      out.write("<br /> zdpdmmshd_z4：<input name=\"zdpdmmshd_z4\" value=\"\"/>\r\n");
      out.write("<br /> zdpdmmshd_z3：<input name=\"zdpdmmshd_z3\" value=\"\"/>\r\n");
      out.write("<br /> zdpdmmshd_z2：<input name=\"zdpdmmshd_z2\" value=\"\"/>\r\n");
      out.write("<br /> zdpdmmshd_z1：<input name=\"zdpdmmshd_z1\" value=\"\"/>\r\n");
      out.write("<br /> zdpdmmshd_bz：<input name=\"zdpdmmshd_bz\" value=\"\"/>\r\n");
      out.write("<br /> zdpdmmshd_zp：<input name=\"zdpdmmshd_zp\" value=\"\"/>\r\n");
      out.write("<br /> scplgljc：<input name=\"scplgljc\" value=\"\"/>\r\n");
      out.write("<br /> scplgljc_zp：<input name=\"scplgljc_zp\" value=\"\"/>\r\n");
      out.write("<br /> scplgljc_bz：<input name=\"scplgljc_bz\" value=\"\"/>\r\n");
      out.write("<br /> dpljj：<input name=\"dpljj\" value=\"\"/>\r\n");
      out.write("<br /> dpljj_zp：<input name=\"dpljj_zp\" value=\"\"/>\r\n");
      out.write("<br /> dpljj_bz：<input name=\"dpljj_bz\" value=\"\"/>\r\n");
      out.write("<br /> dpls：<input name=\"dpls\" value=\"\"/>\r\n");
      out.write("<br /> dpls_bz：<input name=\"dpls_bz\" value=\"\"/>\r\n");
      out.write("<br /> dpls_zp：<input name=\"dpls_zp\" value=\"\"/>\r\n");
      out.write("<br /> clbydab_bz：<input name=\"clbydab_bz\" value=\"\"/>\r\n");
      out.write("<br /> clbydab_zp：<input name=\"clbydab_zp\" value=\"\"/>\r\n");
      out.write("<br /> tjzk：<input name=\"tjzk\" value=\"\"/>\r\n");
      out.write("<br /> jcjg：<input name=\"jcjg\" value=\"\"/>\r\n");
      out.write("<br /> dhhm：<input name=\"dhhm\" value=\"\"/>\r\n");
      out.write("<br /> khwxh：<input name=\"khwxh\" value=\"\"/>\r\n");
      out.write("<br /> sfbc：<input name=\"sfbc\" value=\"\"/>1：保存 2：提交\r\n");
      out.write("<br /> sftj：<input name=\"sftj\" value=\"\"/>废弃\r\n");
      out.write("<br /> bls_zt：<input name=\"bls_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> ygq_zt：<input name=\"ygq_zt\" value=\"\"/>XXX_状态\r\n");
      out.write("\t\t\t <br /> dpjcddy_zt：<input name=\"dpjcddy_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> lqy_zt    ：<input name=\"lqy_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> dlzxy_zt  ：<input name=\"dlzxy_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> zdbsxy_zt ：<input name=\"zdbsxy_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> zdy_zt    ：<input name=\"zdy_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> kqlx_zt   ：<input name=\"kqlx_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> ktlx_zt   ：<input name=\"ktlx_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> jqm_zt    ：<input name=\"jqm_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> fdjyx_zt  ：<input name=\"fdjyx_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> fdjlyls_zt：<input name=\"fdjlyls_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> ltqy_zt   ：<input name=\"ltqy_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> lthwsd_zt ：<input name=\"lthwsd_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> zdmcpsyhd_zt ：<input name=\"zdmcpsyhd_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> zdpdmmshd_zt ：<input name=\"zdpdmmshd_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> dpls_zt：<input name=\"dpls_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t <br /> qcdg_zt：<input name=\"qcdg_zt\" value=\"\"/>\r\n");
      out.write("\t\t\t  <br /> dpljj_zt：<input name=\"dpljj_zt\" value=\"\"/>\r\n");
      out.write("<br />\r\n");
      out.write("<input type=\"submit\">\r\n");
      out.write("\t</form>\r\n");
      out.write("\t\t<form action=\"");
      out.print(basePath);
      out.write("/checkState.do\" method=\"post\">\r\n");
      out.write("\t\t<font color=\"red\">7.检查是否存在(<input name=\"clgl\" value=\"checkState.do\">)\r\n");
      out.write("\t\t</font><br />  \r\n");
      out.write("<br /> uuid：<input name=\"uuid\" value=\"\"/>\r\n");
      out.write("<br /> carNo：<input name=\"carNo\" value=\"\"/>\r\n");
      out.write("<br /> sfbc：<input name=\"sfbc\" value=\"\"/>\r\n");
      out.write("<br /> cDate：<input name=\"cDate\" value=\"\"/>\r\n");
      out.write("\r\n");
      out.write("<br /> \t\t\t <input type=\"submit\">\r\n");
      out.write("\t</form>\t\r\n");
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
