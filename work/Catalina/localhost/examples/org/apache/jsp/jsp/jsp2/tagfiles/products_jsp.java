/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.75
 * Generated at: 2019-02-13 10:01:35 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp.jsp2.tagfiles;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class products_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/tags/displayProducts.tag", Long.valueOf(1484751422000L));
  }

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
      response.setContentType("text/html");
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
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("    <title>JSP 2.0 Examples - Display Products Tag File</title>\r\n");
      out.write("  </head>\r\n");
      out.write("  <body>\r\n");
      out.write("    <h1>JSP 2.0 Examples - Display Products Tag File</h1>\r\n");
      out.write("    <hr>\r\n");
      out.write("    <p>This JSP page invokes a tag file that displays a listing of\r\n");
      out.write("    products.  The custom tag accepts two fragments that enable\r\n");
      out.write("    customization of appearance.  One for when the product is on sale\r\n");
      out.write("    and one for normal price.</p>\r\n");
      out.write("    <p>The tag is invoked twice, using different styles</p>\r\n");
      out.write("    <hr>\r\n");
      out.write("    <h2>Products</h2>\r\n");
      out.write("    ");
      //  tags:displayProducts
      org.apache.jsp.tag.web.displayProducts_tag _jspx_th_tags_005fdisplayProducts_005f0 = (new org.apache.jsp.tag.web.displayProducts_tag());
      _jsp_getInstanceManager().newInstance(_jspx_th_tags_005fdisplayProducts_005f0);
      _jspx_th_tags_005fdisplayProducts_005f0.setJspContext(_jspx_page_context);
      javax.servlet.jsp.tagext.JspFragment _jspx_temp0 = new Helper( 0, _jspx_page_context, _jspx_th_tags_005fdisplayProducts_005f0, null);
      // /jsp/jsp2/tagfiles/products.jsp(32,4) null
      _jspx_th_tags_005fdisplayProducts_005f0.setNormalPrice(_jspx_temp0);
      javax.servlet.jsp.tagext.JspFragment _jspx_temp1 = new Helper( 1, _jspx_page_context, _jspx_th_tags_005fdisplayProducts_005f0, null);
      // /jsp/jsp2/tagfiles/products.jsp(32,4) null
      _jspx_th_tags_005fdisplayProducts_005f0.setOnSale(_jspx_temp1);
      _jspx_th_tags_005fdisplayProducts_005f0.doTag();
      _jsp_getInstanceManager().destroyInstance(_jspx_th_tags_005fdisplayProducts_005f0);
      out.write("\r\n");
      out.write("    <hr>\r\n");
      out.write("    <h2>Products (Same tag, alternate style)</h2>\r\n");
      out.write("    ");
      //  tags:displayProducts
      org.apache.jsp.tag.web.displayProducts_tag _jspx_th_tags_005fdisplayProducts_005f1 = (new org.apache.jsp.tag.web.displayProducts_tag());
      _jsp_getInstanceManager().newInstance(_jspx_th_tags_005fdisplayProducts_005f1);
      _jspx_th_tags_005fdisplayProducts_005f1.setJspContext(_jspx_page_context);
      javax.servlet.jsp.tagext.JspFragment _jspx_temp2 = new Helper( 2, _jspx_page_context, _jspx_th_tags_005fdisplayProducts_005f1, null);
      // /jsp/jsp2/tagfiles/products.jsp(45,4) null
      _jspx_th_tags_005fdisplayProducts_005f1.setNormalPrice(_jspx_temp2);
      javax.servlet.jsp.tagext.JspFragment _jspx_temp3 = new Helper( 3, _jspx_page_context, _jspx_th_tags_005fdisplayProducts_005f1, null);
      // /jsp/jsp2/tagfiles/products.jsp(45,4) null
      _jspx_th_tags_005fdisplayProducts_005f1.setOnSale(_jspx_temp3);
      _jspx_th_tags_005fdisplayProducts_005f1.doTag();
      _jsp_getInstanceManager().destroyInstance(_jspx_th_tags_005fdisplayProducts_005f1);
      out.write("\r\n");
      out.write("  </body>\r\n");
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

  private class Helper
      extends org.apache.jasper.runtime.JspFragmentHelper
  {
    private javax.servlet.jsp.tagext.JspTag _jspx_parent;
    private int[] _jspx_push_body_count;

    public Helper( int discriminator, javax.servlet.jsp.JspContext jspContext, javax.servlet.jsp.tagext.JspTag _jspx_parent, int[] _jspx_push_body_count ) {
      super( discriminator, jspContext, _jspx_parent );
      this._jspx_parent = _jspx_parent;
      this._jspx_push_body_count = _jspx_push_body_count;
    }
    public void invoke0( javax.servlet.jsp.JspWriter out ) 
      throws java.lang.Throwable
    {
      out.write("Item: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("<br/>\r\n");
      out.write("        Price: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${price}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      return;
    }
    public void invoke1( javax.servlet.jsp.JspWriter out ) 
      throws java.lang.Throwable
    {
      out.write("Item: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("<br/>\r\n");
      out.write("        <font color=\"red\"><strike>Was: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${origPrice}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</strike></font><br/>\r\n");
      out.write("        <b>Now: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${salePrice}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</b>");
      return;
    }
    public void invoke2( javax.servlet.jsp.JspWriter out ) 
      throws java.lang.Throwable
    {
      out.write('<');
      out.write('b');
      out.write('>');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</b> @ ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${price}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(" ea.");
      return;
    }
    public void invoke3( javax.servlet.jsp.JspWriter out ) 
      throws java.lang.Throwable
    {
      out.write('<');
      out.write('b');
      out.write('>');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</b> @ ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${salePrice}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(" ea. (was: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${origPrice}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(')');
      return;
    }
    public void invoke( java.io.Writer writer )
      throws javax.servlet.jsp.JspException
    {
      javax.servlet.jsp.JspWriter out = null;
      if( writer != null ) {
        out = this.jspContext.pushBody(writer);
      } else {
        out = this.jspContext.getOut();
      }
      try {
        Object _jspx_saved_JspContext = this.jspContext.getELContext().getContext(javax.servlet.jsp.JspContext.class);
        this.jspContext.getELContext().putContext(javax.servlet.jsp.JspContext.class,this.jspContext);
        switch( this.discriminator ) {
          case 0:
            invoke0( out );
            break;
          case 1:
            invoke1( out );
            break;
          case 2:
            invoke2( out );
            break;
          case 3:
            invoke3( out );
            break;
        }
        jspContext.getELContext().putContext(javax.servlet.jsp.JspContext.class,_jspx_saved_JspContext);
      }
      catch( java.lang.Throwable e ) {
        if (e instanceof javax.servlet.jsp.SkipPageException)
            throw (javax.servlet.jsp.SkipPageException) e;
        throw new javax.servlet.jsp.JspException( e );
      }
      finally {
        if( writer != null ) {
          this.jspContext.popBody();
        }
      }
    }
  }
}
