package com.amct.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

public class CreateJavaUtil {
	// 创建实体文件
	public static String createJavaEntityFile(List<Object> parse,
			String menu_ename, HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath(
				File.separator);
		String fielName = realPath + "java" + File.separator + "entity";
		File file = new File(fielName);
		if (!file.exists()) {
			file.mkdirs();
		}
		String newJavaEntity = fielName + File.separator + menu_ename + ".java";
		// 创健实体文件
		File fileJava = new File(newJavaEntity);
		fileJava.createNewFile();
		FileOutputStream out = new FileOutputStream(fileJava, false);
		StringBuffer data = new StringBuffer();
		data.append("package com.amct.entity;\nimport java.io.Serializable;\n");
		data.append("public class " + menu_ename
				+ " implements Serializable{\n");
		// String[] field = table_field.split(",");
		String str = "String id,";
		data.append("private String id;\n");
		for (int i = 0; i < parse.size(); i++) {
			JSONObject jsonObject = JSON.parseObject(parse.get(i).toString());
			String s = "String";
			if (jsonObject.getString("type").equals("String")) {
				s = "String";
			}
			if (jsonObject.getString("type").equals("int")) {
				s = "Integer";
			}
			data.append("private " + s + " "
					+ jsonObject.getString("menu_ename") + ";\n");
			str += s + " " + jsonObject.getString("menu_ename") + ",";
		}

		str = str.substring(0, str.length() - 1);
		// 无参构造函数
		data.append("public " + menu_ename + "() {\n");
		data.append("super();\n}\n");
		// 有参构造函数
		data.append("public " + menu_ename + "(" + str + ") {\n");
		data.append("super();\n");
		data.append("this.id=id;\n");
		for (int i = 0; i < parse.size(); i++) {
			JSONObject jsonObject = JSON.parseObject(parse.get(i).toString());
			data.append("this." + jsonObject.getString("menu_ename") + "="
					+ jsonObject.getString("menu_ename") + ";\n");
		}
		data.append("}\n");
		// 拼接get,set方法
		data.append("public String getId(){\n");
		data.append("return id;\n");
		data.append("}\n");
		data.append("public void setId(String id){\n");
		data.append("this.id=id;\n");
		data.append("}\n");
		for (int i = 0; i < parse.size(); i++) {
			JSONObject jsonObject = JSON.parseObject(parse.get(i).toString());
			String up = jsonObject.getString("menu_ename");
			char[] cs = jsonObject.getString("menu_ename").toCharArray();
			cs[0] -= 32;
			String upperCase = String.valueOf(cs);
			String s = "String";
			if (jsonObject.getString("type").equals("String")) {
				s = "String";
			}
			if (jsonObject.getString("type").equals("int")) {
				s = "Integer";
			}
			data.append("public " + s + " get" + upperCase + "(){\n");
			data.append("return " + up + ";\n");
			data.append("}\n");
			data.append("public void set" + upperCase + "(" + s + " " + up
					+ "){\n");
			data.append("this." + up + "=" + up + ";\n");
			data.append("}\n");

		}
		// toString 方法
		data.append("@Override\n");
		data.append("public String toString() {\n");
		String toStr = "return \"" + menu_ename + "[ id=\"+id+\",";
		for (int i = 0; i < parse.size(); i++) {
			JSONObject jsonObject = JSON.parseObject(parse.get(i).toString());
			toStr += jsonObject.getString("menu_ename") + "=\"+"
					+ jsonObject.getString("menu_ename") + "+\",";
		}
		toStr = toStr.substring(0, toStr.length() - 1);
		toStr += "]\";\n";
		data.append(toStr);
		data.append("}\n");

		data.append("}");
		out.write(data.toString().getBytes("utf-8"));
		Thread.sleep(1000 * 1);
		out.flush();
		out.close();
		return newJavaEntity;
	}

	// 创建Dao文件
	public static String createJavaDaoFile(List<Object> parse,
			String menu_ename, HttpSession session) throws Exception {
		// String[] field = table_field.split(",");
		String realPath = session.getServletContext().getRealPath(
				File.separator);
		String fielName = realPath + "java" + File.separator + "entity";
		File file = new File(fielName);
		if (!file.exists()) {
			file.mkdirs();
		}
		String daoPath = fielName + File.separator + menu_ename + "Dao.java";
		File fileJava = new File(daoPath);
		fileJava.createNewFile();

		FileOutputStream out = new FileOutputStream(fileJava, false);
		StringBuffer data = new StringBuffer();

		data.append("package com.amct.dao;\n");
		data.append("import java.util.List;\n");
		data.append("import org.apache.ibatis.annotations.Param;\n");
		data.append("import com.amct.entity." + menu_ename + ";\n");

		data.append("public interface " + menu_ename + "Dao {\n");

		String query_ename = null;
		String stype = null;
		for (int i = parse.size() - 1; i >= 0; i--) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			if (json.getString("is_query") != null
					&& json.getString("is_query") != ""
					&& json.getString("is_query").equals("1")) {
				query_ename = json.getString("menu_ename");

				if (json.getString("type").equals("String")) {
					stype = "String";
				}
				if (json.getString("type").equals("int")) {
					stype = "Integer";
				}
			}
		}
		// 分页查询
		if (query_ename != null) {
			data.append("List<"
					+ menu_ename
					+ "> queryList(@Param(\""
					+ query_ename
					+ "\") "
					+ stype
					+ " "
					+ query_ename
					+ ",@Param(\"begin\") Integer begin, @Param(\"end\") Integer end);\n");
		} else {
			data.append("List<"
					+ menu_ename
					+ "> queryList(@Param(\"begin\") Integer begin, @Param(\"end\") Integer end);\n");

		}
		String str = "@Param(\"id\")String id";

		for (int i = 0; i < parse.size(); i++) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			String s = "String";
			if (json.getString("type").equals("String")) {
				s = "String";
			}
			if (json.getString("type").equals("int")) {
				s = "Integer";
			}
			str += ",@Param(\"" + json.getString("menu_ename") + "\")" + s
					+ " " + json.getString("menu_ename");
		}
		// 新增
		data.append("Integer insertTable(" + str + ");\n");
		// 修改
		data.append("Integer updateTable(" + str + ");\n");
		// 通过ID删除
		data.append("Integer delTable(@Param(\"id\") String id);\n");

		data.append("}\n");
		out.write(data.toString().getBytes("utf-8"));
		Thread.sleep(1000 * 1);
		out.flush();
		out.close();
		return daoPath;
	}

	// 创建Server接口文件
	public static String createJavaFileService(List<Object> parse,
			String menu_ename, HttpSession session) throws Exception {
		// String[] field = table_field.split(",");
		String realPath = session.getServletContext().getRealPath(
				File.separator);
		String fielName = realPath + "java" + File.separator + "entity";
		File file = new File(fielName);
		if (!file.exists()) {
			file.mkdirs();
		}
		String daoPath = fielName + File.separator + menu_ename
				+ "Service.java";
		File fileJava = new File(daoPath);
		fileJava.createNewFile();

		FileOutputStream out = new FileOutputStream(fileJava, false);
		StringBuffer data = new StringBuffer();

		data.append("package com.amct.service;\n");
		data.append("import java.util.List;\n");
		data.append("import com.amct.entity." + menu_ename + ";\n");
		data.append("import org.springframework.stereotype.Service;\n");
		data.append("@Service\n");
		data.append("public interface " + menu_ename + "Service {\n");
		// 分页查询
		String query_ename = null;
		String stype = null;
		for (int i = parse.size() - 1; i >= 0; i--) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			if (json.getString("is_query") != null
					&& json.getString("is_query") != ""
					&& json.getString("is_query").equals("1")) {
				query_ename = json.getString("menu_ename");

				if (json.getString("type").equals("String")) {
					stype = "String";
				}
				if (json.getString("type").equals("int")) {
					stype = "Integer";
				}
			}
		}
		if (query_ename != null) {
			data.append("List<" + menu_ename + "> findList(" + stype + " "
					+ query_ename + ",Integer begin,Integer end);\n");
		} else {
			data.append("List<" + menu_ename
					+ "> findList(Integer begin,Integer end);\n");
		}

		String str = "";
		String estr = "String id";
		for (int i = 0; i < parse.size(); i++) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			String s = "String";
			if (json.getString("type").equals("String")) {
				s = "String";
			}
			if (json.getString("type").equals("int")) {
				s = "Integer";
			}
			str += s + " " + json.getString("menu_ename") + ",";
			estr += "," + s + " " + json.getString("menu_ename");
		}
		str = str.substring(0, str.length() - 1);

		// 新增
		data.append("Integer addTable(" + str + ");\n");
		// 修改
		data.append("Integer modifyTable(" + estr + ");\n");
		// 通过ID删除
		data.append("Integer removeTable(String id);\n");

		data.append("}\n");
		out.write(data.toString().getBytes("utf-8"));
		Thread.sleep(1000 * 1);
		out.flush();
		out.close();
		return daoPath;
	}

	// 创建server实现类
	public static String createJavaFileServiceImpl(List<Object> parse,
			String menu_ename, HttpSession session) throws Exception {
		// String[] field = table_field.split(",");
		String realPath = session.getServletContext().getRealPath(
				File.separator);
		String fielName = realPath + "java" + File.separator + "entity";
		File file = new File(fielName);
		if (!file.exists()) {
			file.mkdirs();
		}
		String daoPath = fielName + File.separator + menu_ename
				+ "ServiceImpl.java";
		File fileJava = new File(daoPath);
		fileJava.createNewFile();

		FileOutputStream out = new FileOutputStream(fileJava, false);
		StringBuffer data = new StringBuffer();
		data.append("package com.amct.serviceimpl;\n");
		data.append("import java.util.List;\n");
		data.append("import java.util.UUID;\n");
		data.append("import com.amct.dao." + menu_ename + "Dao;\n");
		data.append("import com.amct.entity." + menu_ename + ";\n");
		data.append("import com.amct.service." + menu_ename + "Service;\n");
		data.append("import org.springframework.stereotype.Service;\n");
		data.append("import org.springframework.beans.factory.annotation.Autowired;\n");
		data.append("@Service\n");
		data.append("public class " + menu_ename + "ServiceImpl implements "
				+ menu_ename + "Service {\n");
		data.append("@Autowired\n");
		data.append("private " + menu_ename + "Dao a;\n");
		// 分页查询
		String query_ename = null;
		String stype = null;
		for (int i = parse.size() - 1; i >= 0; i--) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			if (json.getString("is_query") != null
					&& json.getString("is_query") != ""
					&& json.getString("is_query").equals("1")) {
				query_ename = json.getString("menu_ename");

				if (json.getString("type").equals("String")) {
					stype = "String";
				}
				if (json.getString("type").equals("int")) {
					stype = "Integer";
				}
			}
		}
		if (query_ename != null) {
			data.append("@Override\n");
			data.append("public List<" + menu_ename + "> findList(" + stype
					+ " " + query_ename + ",Integer page,Integer limit) {\n");
			if (stype == "String") {
				data.append("if (" + query_ename + " != null) {\n");
				data.append(query_ename + "=\"%\"+" + query_ename + "+\"%\";\n");
				data.append("}\n");
			}
			data.append("return a.queryList(" + query_ename
					+ ",page - 1, limit);\n");
			data.append("}\n");
		} else {
			data.append("@Override\n");
			data.append("public List<" + menu_ename
					+ "> findList(Integer page,Integer limit) {\n");
			data.append("return a.queryList((page - 1)*limit, limit);\n");
			data.append("}\n");
		}

		String str = "";
		String estr = "String id";
		String dstr = "";
		String edstr = "id";
		for (int i = 0; i < parse.size(); i++) {
			String ss = "String";
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			if (json.getString("type").equals("String")) {
				ss = "String";
			}
			if (json.getString("type").equals("int")) {
				ss = "Integer";
			}
			str += ss + " " + json.getString("menu_ename") + ",";
			dstr += json.getString("menu_ename") + ",";
			estr += "," + ss + " " + json.getString("menu_ename");
			edstr += "," + json.getString("menu_ename");
		}

		str = str.substring(0, str.length() - 1);
		dstr = dstr.substring(0, dstr.length() - 1);
		// 新增
		data.append("@Override\n");
		data.append("public Integer addTable(" + str + "){\n");
		data.append("return a.insertTable(UUID.randomUUID().toString()," + dstr
				+ ");\n");
		data.append("}\n");
		// 修改
		data.append("@Override\n");
		data.append("public Integer modifyTable(" + estr + "){\n");
		data.append("return a.updateTable(" + edstr + ");\n");
		data.append("}\n");

		// 删除
		data.append("@Override\n");
		data.append("public Integer removeTable(String id){\n");
		data.append("return a.delTable(id);\n");
		data.append("}\n");

		data.append("}\n");
		out.write(data.toString().getBytes("utf-8"));
		Thread.sleep(1000 * 1);
		out.flush();
		out.close();
		return daoPath;
	}

	// 创建mapper文件
	public static String createMapper(List<Object> parse, String menu_ename,
			HttpSession session) throws Exception {

		// String[] field = table_field.split(",");
		String realPath = session.getServletContext().getRealPath(
				File.separator);
		String daoPath = realPath + "WEB-INF" + File.separator + "classes"
				+ File.separator + "mapper" + File.separator + menu_ename
				+ ".xml";
		File fileJava = new File(daoPath);
		fileJava.createNewFile();

		FileOutputStream out = new FileOutputStream(fileJava, false);
		StringBuffer data = new StringBuffer();

		data.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
		data.append("<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\" \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\" >\n");
		data.append("<mapper namespace=\"com.amct.dao." + menu_ename
				+ "Dao\">\n");
		// 查询
		data.append("<select id=\"queryList\" resultType=\"" + menu_ename
				+ "\">\n");

		String query_ename = null;
		for (int i = parse.size() - 1; i >= 0; i--) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			if (json.getString("is_query") != null
					&& json.getString("is_query") != ""
					&& json.getString("is_query").equals("1")) {
				query_ename = json.getString("menu_ename");
			}
		}

		data.append("select * from amct_" + menu_ename + " <where><if test=\""
				+ query_ename + " != null\">\n");
		data.append(query_ename + " like #{" + query_ename
				+ ",jdbcType=VARCHAR} and </if>\n");
		data.append("<if test=\"1 == 1\">1=1</if>\n");
		data.append(" limit #{begin},#{end}\n");
		data.append("</where></select>\n");
		// 删除
		data.append("<delete id=\"delTable\">\n");
		data.append("delete from amct_" + menu_ename + " where id = #{id}\n");
		data.append("</delete>\n");
		// 增加
		data.append("<insert id=\"insertTable\">\n");
		String str = "#{id}";
		String datastr = "id";

		for (int i = 0; i < parse.size(); i++) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			str += ",#{" + json.getString("menu_ename") + "}";
			datastr += "," + json.getString("menu_ename");
		}

		data.append("insert into amct_" + menu_ename + "(" + datastr
				+ ") value(" + str + ")\n");
		data.append("</insert>\n");
		// 修改

		String strUpdate = "update amct_" + menu_ename + " set ";

		for (int i = 0; i < parse.size(); i++) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			strUpdate += json.getString("menu_ename") + "=#{"
					+ json.getString("menu_ename") + "},";
		}

		strUpdate = strUpdate.substring(0, strUpdate.length() - 1);
		strUpdate += " where id=#{id}";
		data.append("<update id=\"updateTable\">\n");
		data.append(strUpdate + "\n");
		data.append("</update>\n");
		data.append("</mapper>\n");
		out.write(data.toString().getBytes("utf-8"));
		Thread.sleep(1000 * 1);
		out.flush();
		out.close();
		return daoPath;
	}

	// 创建Controller文件
	public static String createJavaFileController(List<Object> parse,
			String menu_ename, HttpSession session) throws Exception {

		// String[] field = table_field.split(",");
		String realPath = session.getServletContext().getRealPath(
				File.separator);
		String fielName = realPath + "java" + File.separator + "entity";
		File file = new File(fielName);
		if (!file.exists()) {
			file.mkdirs();
		}
		String daoPath = fielName + File.separator + menu_ename
				+ "Controller.java";
		File fileJava = new File(daoPath);
		fileJava.createNewFile();

		FileOutputStream out = new FileOutputStream(fileJava, false);
		StringBuffer data = new StringBuffer();

		data.append("package com.amct.controller;\n");
		data.append("import java.util.List;\n");
		data.append("import org.springframework.beans.factory.annotation.Autowired;\n");
		data.append("import org.springframework.context.annotation.Scope;\n");
		data.append("import org.springframework.stereotype.Controller;\n");
		data.append("import com.amct.dto.findListDto;\n");
		data.append("import org.springframework.web.bind.annotation.*;\n");
		data.append("import com.amct.entity." + menu_ename + ";\n");
		data.append("import com.amct.service." + menu_ename + "Service;\n");
		data.append("@Controller\n");
		data.append("@RequestMapping(\"/" + menu_ename + "\")\n");
		data.append("@Scope(\"prototype\")\n");
		data.append("public class " + menu_ename + "Controller {\n");
		data.append("@Autowired\n");
		data.append("private " + menu_ename + "Service am;\n");
		// 分页查询
		data.append("@ResponseBody\n");
		data.append("@RequestMapping(value = \"/findAll\",method=RequestMethod.GET)\n");
		String query_ename = null;
		String stype = null;
		for (int i = parse.size() - 1; i >= 0; i--) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			if (json.getString("is_query") != null
					&& json.getString("is_query") != ""
					&& json.getString("is_query").equals("1")) {
				query_ename = json.getString("menu_ename");

				if (json.getString("type").equals("String")) {
					stype = "String";
				}
				if (json.getString("type").equals("int")) {
					stype = "Integer";
				}
			}
		}
		if (query_ename != null) {
			data.append("public findListDto<"
					+ menu_ename
					+ "> findAll(@RequestParam(\""
					+ query_ename
					+ "\")"
					+ stype
					+ " "
					+ query_ename
					+ ",@RequestParam(\"page\")Integer page,@RequestParam(\"limit\")Integer limit) {\n");
			data.append("List<" + menu_ename + "> list = am.findList("
					+ query_ename + ", page, limit);\n");
		} else {
			data.append("public findListDto<"
					+ menu_ename
					+ "> findAll(@RequestParam(\"page\")Integer page,@RequestParam(\"limit\")Integer limit) {\n");
			data.append("List<" + menu_ename + "> list = am.findList(page, limit);\n");
		}

		data.append("findListDto<" + menu_ename + "> fd = new findListDto<"
				+ menu_ename + ">();\n");
		data.append("fd.setData(list);\n");
		data.append("fd.setCode(0);\n");
		data.append("fd.setCount(list.size());\n");
		data.append("fd.setMsg(\"查询成功\");\n");

		data.append("return fd;\n");
		data.append("}\n");
		// 删除
		data.append("@ResponseBody\n");
		data.append("@RequestMapping(value=\"/remove\",method=RequestMethod.GET)\n");
		data.append("public Integer remove(@RequestParam(\"id\")String id){\n");
		data.append("return am.removeTable(id);\n");
		data.append("}\n");

		String str = "";
		String estr = "@RequestParam(\"id\")String id";
		String dstr = "";
		String edstr = "id";
		for (int i = 0; i < parse.size(); i++) {
			JSONObject json = JSON.parseObject(parse.get(i).toString());
			String s = "String";
			if (json.getString("type").equals("String")) {
				s = "String";
			}
			if (json.getString("type").equals("int")) {
				s = "Integer";
			}
			str += "@RequestParam(\"" + json.getString("menu_ename") + "\")"
					+ s + " " + json.getString("menu_ename") + ",";
			estr += ",@RequestParam(\"" + json.getString("menu_ename") + "\")"
					+ s + " " + json.getString("menu_ename");
			dstr += json.getString("menu_ename") + ",";
			edstr += "," + json.getString("menu_ename");
		}

		str = str.substring(0, str.length() - 1);
		dstr = dstr.substring(0, dstr.length() - 1);

		// 修改
		data.append("@ResponseBody\n");
		data.append("@RequestMapping(value=\"/modify\",method=RequestMethod.POST)\n");
		data.append("public Integer modify(" + estr + "){\n");
		data.append("return am.modifyTable(" + edstr + ");\n");
		data.append("}\n");
		// 增加
		data.append("@ResponseBody\n");
		data.append("@RequestMapping(value=\"/add\",method=RequestMethod.POST)\n");
		data.append("public Integer add(" + str + "){\n");
		data.append("return am.addTable(" + dstr + ");\n");
		data.append("}\n");

		data.append("}\n");
		out.write(data.toString().getBytes("utf-8"));
		Thread.sleep(1000 * 1);
		out.flush();
		out.close();
		return daoPath;
	}

}
