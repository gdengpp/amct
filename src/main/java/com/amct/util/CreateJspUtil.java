package com.amct.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.amct.entity.amctUser;

public class CreateJspUtil {

	// 创建JSP文件
	public static String createJsp(List<Object> parse, String menu_ename,
			HttpSession session) throws Exception {
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
		fileJSP.createNewFile();
		String query_name = null;
		String query_ename = null;
		for (int i = parse.size() - 1; i >= 0; i--) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			if (json.getString("is_query") != null
					&& json.getString("is_query") != ""
					&& json.getString("is_query").equals("1")) {
				query_name = json.getString("menu_name");
				query_ename = json.getString("menu_ename");
			}
		}

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
		data.append("<div class=\"bgWhite\"><div class=\"layui-fluid\">\n");
		data.append("<div class=\"layui-row layui-col-space10\"><div class=\"layui-col-md12\">\n");
		data.append("<div class=\"layui-form\">\n");
		data.append("<div class=\"layui-inline\">\n");
		if (query_name != null) {
			data.append("<div class=\"layui-input-inline\">\n");
			data.append("<input type=\"text\" value=\"\" placeholder=\"请输入"
					+ query_name + "\"class=\"layui-input search_input\"/>\n");
			data.append("</div>\n");
		}
		data.append("<div class=\"layui-btn-group\">\n");
		if (query_name != null) {
			data.append("<a class=\"layui-btn layui-btn-primary search_btn\"> <i class=\"layui-icon\">&#xe615;</i>查询</a>\n");
		}
		data.append("<a class=\"layui-btn layui-btn-primary search_add\"> <i class=\"layui-icon\">&#xe654;</i>新增</a>\n");
		data.append("<a class=\"layui-btn layui-btn-primary search_edit\"> <i class=\"layui-icon\">&#xe642;</i>修改</a>\n");
		data.append("<a class=\"layui-btn layui-btn-primary search_del\"> <i class=\"layui-icon\">&#xe640;</i>删除 </a>\n");
		data.append("</div></div></div>\n");
		data.append("<div class=\"layui-form top_menu_list\">\n");
		data.append("<table class=\"layui-hide\" id=\"datagrid_" + menu_ename
				+ "\" lay-data=\"{id: 'datagrid_" + menu_ename
				+ "'}\" lay-filter=\"datagrid_" + menu_ename
				+ "Filter\"></table>\n");
		data.append("</div></div></div></div></div>\n");
		// 主体结束--------------------------------------------------------------------------

		// 新增/编辑开始----------------------------------------------------------------------
		data.append("<div id=\"addAmdUpdate\" style=\"display:none;padding:10px;\">\n");
		data.append("<form class=\"layui-form\" action=\"\">\n");
		for (int i = parse.size() - 1; i >= 0; i--) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			data.append("<div class=\"layui-row\">\n");
			data.append("<div class=\"layui-col-md6\">\n");
			data.append("<div class=\"layui-form-item\">\n");
			data.append("<label for=" + json.getString("menu_ename")
					+ " class=\"layui-form-label\">"
					+ json.getString("menu_name") + "</label>\n");
			data.append("<div class=\"layui-input-inline\">\n");
			data.append("<input type=\"text\" id="
					+ json.getString("menu_ename") + " name="
					+ json.getString("menu_ename")
					+ " autocomplete=\"off\" class=\"layui-input\">\n");
			data.append("</div></div></div>\n");
			try {
				JSONObject jsons = JSON
						.parseObject(parse.get(i - 1).toString());
				data.append("<div class=\"layui-col-md6\">\n");
				data.append("<div class=\"layui-form-item\">\n");
				data.append("<label for=" + jsons.getString("menu_ename")
						+ " class=\"layui-form-label\">"
						+ jsons.getString("menu_name") + "</label>\n");
				data.append("<div class=\"layui-input-inline\">\n");
				data.append("<input type=\"text\" id="
						+ jsons.getString("menu_ename") + " name="
						+ jsons.getString("menu_ename")
						+ " autocomplete=\"off\" class=\"layui-input\">\n");
				data.append("</div></div></div>\n");
				data.append("</div>\n");
			} catch (Exception e) {
				logger.log(((amctUser) session.getAttribute("user")).getUsername(), "创建文件JSP 循环字段异常"
						+ e, "error", "jsp");
			}

			i--;
		}
		data.append("</form>\n");
		data.append("</div>\n");
		// 新增/编辑结束----------------------------------------------------------------------

		// script文件开始---------------------------------------------------------------------
		data.append("<script>\n");
		// 回车搜索
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

		// layui begin
		data.append("layui.use([ 'table', 'form', 'tree', 'layer', 'jquery', 'upload', 'laydate', 'element' ], function() {\n");
		data.append("table = layui.table;\n");
		data.append("var layer = layui.layer;\n");
		data.append("form = layui.form;\n");
		data.append("var element = layui.element;\n");
		data.append("var $ = layui.$;\n");
		data.append("form.render();\n");
		data.append("element.init();\n");

		// ==================数据表格左侧头部========================================

		List<List<String>> lists = new ArrayList<List<String>>();
		List<String> list = new ArrayList<String>();
		list.add("{type : 'checkbox'}");
		for (int i = parse.size() - 1; i >= 0; i--) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			String str = "{field : '" + json.getString("menu_ename")
					+ "',title : '" + json.getString("menu_name")
					+ "',align : 'left'}";
			list.add(str);
		}
		lists.add(list);
		data.append("table.render({\n");
		data.append("elem : '#datagrid_" + menu_ename + "',\n");
		data.append("id : 'datagrid_" + menu_ename + "',\n");
		data.append("url : '${pageContext.request.contextPath}/" + menu_ename
				+ "/findAll',\n");
		data.append("height : 'full-100',\n");
		data.append("where : { " + query_ename + " : null },\n");
		data.append("limits : [ 10, 20, 30, 50, 100, 300, 600, 1000 ],\n");
		data.append("page : true,\n");
		data.append("cols:" + lists + ",\n");
		data.append("done : function(res, curr, count) {\n");
		data.append("$(\".laytable-cell-checkbox\").css(\"padding\", \"5px\");\n");
		data.append("signleSelect($, 'datagrid_" + menu_ename + "');\n");
		data.append("}});\n");
		// 查询
		data.append("$(\".search_btn\").click(function() {\n");
		data.append("table.reload('datagrid_" + menu_ename + "', {\n");
		data.append("where : { " + query_ename
				+ " : $(\".search_input\").val() },\n");
		data.append("page : {curr : 1}\n");
		data.append("});});\n");

		// 拼接清空和传递数据
		String addStr = "";
		String dataSre = "{";
		for (int i = 0; i < parse.size(); i++) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			addStr += "$(\"#" + json.getString("menu_ename") + "\").val('');";
			String str = "";
			if (json.getString("type").equals("int")) {
				str = "parseInt($(\"#" + json.getString("menu_ename")
						+ "\").val())";
			} else {
				str = "$(\"#" + json.getString("menu_ename") + "\").val()";
			}
			dataSre += json.getString("menu_ename") + ":" + str + ",";
		}
		dataSre = dataSre.substring(0, dataSre.length() - 1);
		dataSre += "}";
		// 新增
		// data.append("form.on('submit("+menu_ename+")', function(data){\n");
		// data.append("console.log(\"提交的数据====\",JSON.stringify(data.field))\n");
		data.append("$(\".search_add\").click(function() {\n");
		// 打开之前清空
		data.append(addStr + "\n");
		data.append("layui.layer.open({\n");
		data.append("type : 1,\n");
		data.append("title : \"新增\",\n");
		data.append("closeBtn : 1,\n");
		data.append("anim : 0,\n");
		data.append("shade : 0.3,\n");
		data.append("shadeClose : false,\n");
		data.append("area : [ '700px', '500px' ],\n");
		data.append("content : $('#addAmdUpdate'),\n");
		data.append("cancel : function(index, layero) {layer.closeAll();return false;},\n");
		data.append("btn : [ \"提交\", \"关闭\" ],\n");
		data.append("yes : function(index, layero) {\n");
		data.append("var add = layer.load();\n");
		data.append("$.ajax({\n");
		data.append("url : '${pageContext.request.contextPath}/" + menu_ename
				+ "/add',\n");
		data.append("method : 'post',\n");
		data.append("data : " + dataSre + ",\n");
		data.append("success : function(r) {\n");
		data.append("if (r == \"1\") {\n");
		data.append("layer.closeAll();\n");
		data.append("table.reload('datagrid_" + menu_ename + "', {\n");
		data.append("page : {curr : 1}});\n");
		data.append("layer.msg(\"增加成功\", {icon : 6});\n");
		data.append("} else {layer.close(add);\n");
		data.append("layer.msg(\"增加失败，请重试\", {icon : 5});}\n");
		data.append("},error:function(){layer.close(add);layer.msg(\"新增失败，请重试\", {icon : 5});}});\n");
		data.append("},\n");
		data.append("});\n");
		data.append("});\n");

		// 修改
		data.append("$(\".search_edit\").click(function() {\n");
		data.append("var topData = table.checkStatus(\"datagrid_" + menu_ename
				+ "\");\n");
		data.append("var data = topData.data;\n");
		data.append("if (data.length == 0) {\n");
		data.append("layer.msg(\"请选择数据\", {icon : 5});\n");
		data.append("return false;}\n");
		// 打开弹框前赋值
		String edataSre = "{id:data[0].id,";
		for (int i = 0; i < parse.size(); i++) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			data.append("$(\"#" + json.getString("menu_ename")
					+ "\").val(data[0]." + json.getString("menu_ename")
					+ ");\n");
			edataSre += json.getString("menu_ename") + ":$(\"#"
					+ json.getString("menu_ename") + "\").val(),";
		}
		edataSre = edataSre.substring(0, edataSre.length() - 1);
		edataSre += "}";

		data.append("layui.layer.open({\n");
		data.append("type : 1,\n");
		data.append("title : \"编辑\",\n");
		data.append("closeBtn : 1,\n");
		data.append("anim : 0,\n");
		data.append("shade : 0.3,\n");
		data.append("shadeClose : false,\n");
		data.append("area : [ '700px', '500px' ],\n");
		data.append("content : $('#addAmdUpdate'),\n");
		data.append("cancel : function(index, layero) {layer.closeAll();return false;},\n");
		data.append("btn : [ \"提交\", \"关闭\" ],\n");
		data.append("yes : function(index, layero) {\n");
		data.append("var edit = layer.load();\n");
		data.append("$.ajax({\n");
		data.append("url : '${pageContext.request.contextPath}/" + menu_ename
				+ "/modify',\n");
		data.append("method : 'post',\n");
		data.append("data : " + edataSre + ",\n");
		data.append("success : function(r) {\n");
		data.append("if (r == \"1\") {\n");
		data.append("layer.closeAll();\n");
		data.append("table.reload('datagrid_" + menu_ename + "', {\n");
		data.append("page : {curr : 1}});\n");
		data.append("layer.msg(\"修改成功\", {icon : 6});\n");
		data.append("} else {layer.close(edit);\n");
		data.append("layer.msg(\"修改失败，请重试\", {icon : 5});}\n");
		data.append("},error:function(){layer.close(edit)	;layer.msg(\"修改失败，请重试\", {icon : 5});}});\n");
		data.append("},\n");
		data.append("});\n");

		data.append("});\n");

		// 删除
		data.append("$(\".search_del \").click(function() {\n");
		data.append("var topData = table.checkStatus(\"datagrid_" + menu_ename
				+ "\");\n");
		data.append("var data = topData.data;\n");
		data.append("if (data.length == 0) {\n");
		data.append("layer.msg(\"未选择数据\", {icon : 5});\n");
		data.append("return false;}\n");
		data.append("layer.confirm('是否确定删除？', {\n");
		data.append("icon : 3,title : '提示'\n");
		data.append("}, function(index) {\n");
		data.append("if (index) {\n");
		data.append("layer.load();\n");
		data.append("$.ajax({\n");
		data.append("url :'${pageContext.request.contextPath}/" + menu_ename
				+ "/remove',\n");
		data.append("method : 'get',\n");
		data.append("data : {\n");
		data.append("id : data[0].id},\n");
		data.append("success : function(r) {\n");
		data.append("layer.closeAll();\n");
		data.append("if (r == 1) {\n");
		data.append("layer.msg(\"删除成功\", {icon : 6});\n");
		data.append("table.reload('datagrid_" + menu_ename + "', {\n");
		data.append("page : {curr : 1}});\n");
		data.append("} else {\n");
		data.append("layer.msg(\"删除失败\", {icon : 5});\n");
		data.append("}}});}});});});\n");

		data.append("</script>\n");
		// script文件结束---------------------------------------------------------------------
		// JSP正式内容结束=====================================================================
		data.append("</body>\n");
		data.append("</html>\n");
		out.write(data.toString().getBytes("utf-8"));
		Thread.sleep(1000 * 1);
		out.flush();
		out.close();

		return newJSP;
	}
}
