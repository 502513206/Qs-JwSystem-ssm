/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2019-10-19 00:55:55 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.pages.portal;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class gonggao_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
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
      out.write("<html>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t$('#dg').datagrid({\r\n");
      out.write("\t\turl:'datagrid_data.json',\r\n");
      out.write("\t\tcolumns:[[\r\n");
      out.write("\t\t\t{field:'code',title:'代码',width:100},\r\n");
      out.write("\t\t\t{field:'name',title:'名称',width:100},\r\n");
      out.write("\t\t\t{field:'price',title:'价格',width:100,align:'right'}\r\n");
      out.write("\t\t]]\r\n");
      out.write("\t}); </script>\r\n");
      out.write("<body>\r\n");
      out.write("<div style=\"padding: 10px;\">\r\n");
      out.write("\t<table class=\"easyui-datagrid\" style=\"height: auto\">\r\n");
      out.write("\t\t<thead>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th data-options=\"field:'priority'\">优先级</th>\r\n");
      out.write("\t\t\t<th data-options=\"field:'state'\">状态</th>\r\n");
      out.write("\t\t\t<th data-options=\"field:'subject'\">主题</th>\r\n");
      out.write("\t\t\t<th data-options=\"field:'sender'\">发送人</th>\r\n");
      out.write("\t\t\t<th data-options=\"field:'senddate'\">发送日期</th>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t</thead>\r\n");
      out.write("\t\t<tbody>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>重要</td>\r\n");
      out.write("\t\t\t<td>未查看</td>\r\n");
      out.write("\t\t\t<td>吉首大学</td>\r\n");
      out.write("\t\t\t<td>xxx</td>\r\n");
      out.write("\t\t\t<td>2019年10月18日</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t</tbody>\r\n");
      out.write("\t</table>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
