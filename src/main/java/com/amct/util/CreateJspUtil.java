package com.amct.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

public class CreateJspUtil {

	// 创建JSP文件
	public static String createJsp(String table_field, String menu_ename,
			HttpSession session) throws IOException {
		// 获取当前项目的路径
		String realPath = session.getServletContext().getRealPath(
				File.separator);
		String path = realPath + "menu";

		File file2 = new File(path);
		if (!file2.exists()) {
			file2.mkdirs();
		}
		;
		String newJSP = realPath + "menu" + File.separator + menu_ename
				+ ".jsp";
		// 创健实体文件
		File fileJSP = new File(newJSP);
		boolean newFile = fileJSP.createNewFile();
		String[] field = table_field.split(",");
		if (newFile) {
			// 创建成功，写入文件
			FileOutputStream out = new FileOutputStream(fileJSP, false);
			StringBuffer data = new StringBuffer();
			data.append("<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%>\n");
			data.append("<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>\n");
			data.append("<html>\n");
			data.append("<head>\n");
			data.append("<jsp:include page='../index.jsp'></jsp:include>\n");
			data.append("</head>\n");
			data.append("<body>\n");
			// JSP正式内容开始=====================================================================
			// 主体开始---------------------------------------------------------------------------
			data.append("<div class=\"bgWhite\"><div class=\"bgWhite\"><div class=\"layui-fluid\">\n");
			data.append("<div class=\"layui-row layui-col-space10\"><div class=\"layui-col-md12\">\n");
			data.append("<div class=\"layui-form\"><div class=\"layui-inline\">\n");
			data.append("<div class=\"layui-input-inline\">\n");
			data.append("<input type=\"text\" value=\"\" placeholder=\"请输入"
					+ field[0] + " class=\"layui-input search_input\" />\n");
			data.append("</div>\n");
			data.append("<div class=\"layui-btn-group\">\n");
			data.append("<a class=\"layui-btn layui-btn-primary search_btn\"> <i class=\"layui-icon\">&#xe615;</i>查询</a>\n");
			data.append("<a class=\"layui-btn layui-btn-primary search_add\"> <i class=\"layui-icon\">&#xe654;</i>新增</a>\n");
			data.append("<a class=\"layui-btn layui-btn-primary search_edit\"> <i class=\"layui-icon\">&#xe642;</i>修改</a>\n");
			data.append("<a class=\"layui-btn layui-btn-primary search_del\"> <i class=\"layui-icon\">&#xe640;</i>删除 </a>\n");
			data.append("</div></div></div>\n");
			data.append("<div class=\"layui-form top_menu_list\">\n");
			data.append("<table class=\"layui-hide\" id=\"datagrid\" lay-data=\"{id: 'datagrid'}\" lay-filter=\"datagridFilter\"></table>\n");
			data.append("</div></div></div></div></div></div>\n");
			// 主体结束--------------------------------------------------------------------------

			// 新增/编辑开始----------------------------------------------------------------------
			data.append("<div id=\"addAmdUpdate\" style=\"display:none;padding:10px;\">\n");
			data.append("<form class=\"layui-form\" action=\"\">\n");
			for (int i = 0; i < field.length; i++) {
				data.append("<div class=\"layui-row\">\n");
				data.append("<div class=\"layui-col-md6\">\n");
				data.append("<div class=\"layui-form-item\">\n");
				data.append("<label for=" + field[i]
						+ " class=\"layui-form-label\">" + field[i]
						+ "</label>\n");
				data.append("<div class=\"layui-input-inline\">\n");
				data.append("<input type=\"text\" id=" + field[i] + " name="
						+ field[i]
						+ " autocomplete=\"off\" class=\"layui-input\">\n");
				data.append("</div></div></div>\n");

				data.append("<div class=\"layui-col-md6\">\n");
				data.append("<div class=\"layui-form-item\">\n");
				data.append("<label for=" + field[i + 1]
						+ " class=\"layui-form-label\">" + field[i + 1]
						+ "</label>\n");
				data.append("<div class=\"layui-input-inline\">\n");
				data.append("<input type=\"text\" id=" + field[i + 1]
						+ " name=" + field[i + 1]
						+ " autocomplete=\"off\" class=\"layui-input\">\n");
				data.append("</div></div></div>\n");
				data.append("</div>\n");
				i++;
			}

			data.append("<div class=\"layui-form-item\">\n");
			data.append("<div class=\"layui-input-block\">\n");
			data.append("<button type=\"submit\" class=\"layui-btn\" lay-submit=\"\" lay-filter="
					+ menu_ename + ">立即提交</button>\n");
			data.append("<button type=\"reset\" class=\"layui-btn layui-btn-primary\">重置</button>\n");
			data.append("</div>\n");
			data.append("</div>\n");
			data.append("</form>\n");
			data.append("</div>\n");
			// 新增/编辑结束----------------------------------------------------------------------
			
			//script文件开始---------------------------------------------------------------------
			data.append("<script>\n");
			//回车搜索
			data.append("$(document).keyup(function(event) {\n");
			data.append("if (event.keyCode == 13) {\n");
			data.append("var is_shade = $(\".layui-layer-shade\").length;\n");
			data.append("var btns = [\".search_btn\", [] ];\n");
			data.append("var btn = btns[0];\n");
			data.append("var l = 0;\n");
			data.append("for ( var i in btns[1]) {\n");
			data.append("if ($(btns[1][i]).parents(\".layui-layer-page\").length != 0) {\n");
			data.append("var layer_num = parseInt((\"\" + $(btns[1][i]).parents(\".layui-layer-page\").attr(\"id\")).replace(/layui-layer/g, \"\"));\n");
			data.append("if (layer_num && layer_num > l) {\n");
			data.append("l = layer_num;\n");
			data.append("btn = btns[1][i];\n");
			data.append("}}}\n");
			data.append("if (btn != btns[0]) {\n");
			data.append("$(btn).click();\n");
			data.append("} else if (is_shade == 0) {\n");
			data.append("$(btn).click();\n");
			data.append("}}});\n");
			
			data.append("var basurl = '${pageContext.request.contextPath}/';\n");
			//layui begin 
			data.append("layui.use([ 'table', 'form', 'tree', 'layer', 'jquery', 'upload', 'laydate', 'element' ], function() {\n");
			data.append("table = layui.table;\n");
			data.append("var layer = layui.layer;\n");
			data.append("form = layui.form;\n");
			data.append("var element = layui.element;\n");
			data.append("var $ = layui.$;\n");
			data.append("form.render();\n");
			data.append("element.init();\n");
			
		    //==================数据表格左侧头部========================================
			
			List<List<String>> lists = new ArrayList<List<String>>();
			List<String> list = new ArrayList<String>();
			for (int i = 0; i < field.length; i++) {
				String str ="{field : '"+field[i]+"',title : '"+field[i]+"',align : 'left'}";
				list.add(str);
			}
			System.out.println(list);
			lists.add(list);
			System.out.println(lists);
			data.append("table.render({\n");
			data.append("elem : '#datagrid',\n");
			data.append("id : 'datagrid',\n");
			data.append("url : basurl + "+menu_ename+"/findAll\",\n");
			data.append("height : 'full-100',\n");
			data.append("limits : [ 10, 20, 30, 50, 100, 300, 600, 1000 ],\n");
			data.append("page : true,\n");
			data.append(lists+",\n");
			data.append("done : function(res, curr, count) {\n");
			data.append("$(\".laytable-cell-checkbox\").css(\"padding\", \"5px\");\n");
			data.append("signleSelect($, 'topMenudatagrid');\n");
			data.append("}});\n");
			//查询
			data.append("$(\".search_btn\").click(function() {\n");
			data.append("table.reload('datagrid', {\n");
			data.append("where : { name : $(\".search_input\").val() },\n");
			data.append("page : {curr : 1}\n");
			data.append("});});\n");
			
			//新增
			//data.append("form.on('submit("+menu_ename+")', function(data){\n");
			//data.append("console.log(\"提交的数据====\",JSON.stringify(data.field))\n");
			data.append("$(\".search_add\").click(function() {\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			data.append("\n");
			
			data.append("</script>\n");
			//script文件结束---------------------------------------------------------------------
			// JSP正式内容结束=====================================================================
			data.append("</body>\n");
			data.append("</html>\n");
			out.write(data.toString().getBytes("utf-8"));
			out.flush();
			out.close();

		}
		return newJSP;
	}
}
