package com.amct.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;

public class CreateJavaUtil {
	// 创建实体文件
	public static String createJavaEntityFile(String table_field,
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
		boolean newFile = fileJava.createNewFile();
		if (newFile) {
			FileOutputStream out = new FileOutputStream(fileJava, false);
			StringBuffer data = new StringBuffer();
			data.append("package com.amct.entity;\nimport java.io.Serializable;\n");
			data.append("public class " + menu_ename
					+ " implements Serializable{\n");
			String[] field = table_field.split(",");
			String str = "String id,";
			for (int i = 0; i < field.length; i++) {
				if (i == 0) {
					data.append("private String id;\n");
				}
				data.append("private String " + field[i] + ";\n");
				str += "String " + field[i] + ",";
			}
			str = str.substring(0, str.length() - 1);
			// 无参构造函数
			data.append("public " + menu_ename + "() {\n");
			data.append("super();\n}\n");
			// 有参构造函数
			data.append("public " + menu_ename + "(" + str + ") {\n");
			data.append("super();\n");
			data.append("this.id=id;\n");
			for (int i = 0; i < field.length; i++) {
				data.append("this." + field[0] + "=" + field[i] + ";\n");
			}
			data.append("}\n");
			// 拼接get,set方法
			data.append("public String getId(){\n");
			data.append("return id;\n");
			data.append("}\n");
			data.append("public void setId(String id){\n");
			data.append("this.id=id;\n");
			data.append("}\n");
			for (int i = 0; i < field.length; i++) {
				String up = field[i];
				char[] cs = field[i].toCharArray();
				cs[0] -= 32;
				String upperCase = String.valueOf(cs);
				data.append("public String get" + upperCase + "(){\n");
				data.append("return " + up + ";\n");
				data.append("}\n");
				data.append("public void set" + upperCase + "(String "+up+"){\n");
				data.append("this." + up + "=" + up + ";\n");
				data.append("}\n");
			}
			// toString 方法
			data.append("@Override\n");
			data.append("public String toString() {\n");
			String toStr = "return \"" + menu_ename + "[ id=\"+id+\",";
			for (int i = 0; i < field.length; i++) {
				toStr += field[i] + "=\"+" + field[i] + "+\",";
			}
			toStr = toStr.substring(0, toStr.length() - 1);
			toStr += "]\";\n";
			data.append(toStr);
			data.append("}\n");

			data.append("}");
			out.write(data.toString().getBytes("utf-8"));
			out.flush();
			out.close();
		}
		return newJavaEntity;
	}

	// 创建Dao文件
	public static String createJavaDaoFile(String table_field,
			String menu_ename, HttpSession session) throws Exception {
		String[] field = table_field.split(",");
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
		// 分页查询
		data.append("List<"
				+ menu_ename
				+ "> queryList(@Param(\""
				+ field[0]
				+ "\") String "
				+ field[0]
				+ ",@Param(\"begin\") Integer begin, @Param(\"end\") Integer end);\n");
		// 新增
		data.append("Integer insertTable(" + menu_ename + " m);\n");
		// 修改
		data.append("Integer updateTable(" + menu_ename + " m);\n");
		// 通过ID删除
		data.append("Integer delTable(@Param(\"id\") Integer id);\n");

		data.append("}\n");
		out.write(data.toString().getBytes("utf-8"));
		out.flush();
		out.close();
		return daoPath;
	}

	// 创建Server接口文件
	public static String createJavaFileService(String table_field,
			String menu_ename, HttpSession session) throws Exception {
		String[] field = table_field.split(",");
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
		data.append("List<" + menu_ename + "> findList(String " + field[0]
				+ ",Integer begin,Integer end);\n");
		// 新增
		data.append("Integer addTable(" + menu_ename + " m);\n");
		// 修改
		data.append("Integer modifyTable(" + menu_ename + " m);\n");
		// 通过ID删除
		data.append("Integer removeTable(Integer id);\n");

		data.append("}\n");
		out.write(data.toString().getBytes("utf-8"));
		out.flush();
		out.close();
		return daoPath;
	}

	// 创建server实现类
	public static String createJavaFileServiceImpl(String table_field,
			String menu_ename, HttpSession session) throws Exception {
		String[] field = table_field.split(",");
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
		data.append("@Override\n");
		data.append("public List<" + menu_ename + "> findList(String "
				+ field[0] + ",Integer page,Integer limit) {\n");
		data.append("System.out.println(\"=========Server文件========\");\n");
		data.append("System.out.println(\"=========Dao \"+a+\"========\");\n");
		data.append("if (" + field[0] + " != null) {\n");
		data.append(field[0] + "=\"%\"+" + field[0] + "+\"%\";\n");
		data.append("}\n");
		data.append("return a.queryList(" + field[0] + ",page - 1, limit);\n");
		data.append("}\n");
		// 新增
		data.append("@Override\n");
		data.append("public Integer addTable(" + menu_ename + " m){\n");
		data.append("m.setId(UUID.randomUUID().toString());\n");
		data.append("return a.insertTable(m);\n");
		data.append("}\n");
		// 修改
		data.append("@Override\n");
		data.append("public Integer modifyTable(" + menu_ename + " m){\n");
		data.append("return a.updateTable(m);\n");
		data.append("}\n");

		// 删除
		data.append("@Override\n");
		data.append("public Integer removeTable(Integer id){\n");
		data.append("return a.delTable(id);\n");
		data.append("}\n");

		data.append("}\n");
		out.write(data.toString().getBytes("utf-8"));
		out.flush();
		out.close();
		return daoPath;
	}

	// 创建mapper文件
	public static String createMapper(String table_field, String menu_ename,
			HttpSession session) throws IOException {

		String[] field = table_field.split(",");
		String realPath = session.getServletContext().getRealPath(
				File.separator);
		System.out.println(realPath + "realPath");
		String daoPath = realPath + "WEB-INF" + File.separator + "classes"
				+ File.separator + "mapper" + File.separator + menu_ename
				+ ".xml";
		System.out.println(daoPath + "daoPath");
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
		data.append("select * from amct_" + menu_ename
				+ " <where><if test=\"name != null\">\n");
		data.append(field[0] + " like #{" + field[0]
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
		for (int i = 0; i < field.length; i++) {
			str += ",#{" + field[i] + "}";
		}
		data.append("insert into amct_" + menu_ename + " value(" + str + ")\n");
		data.append("</insert>\n");
		// 修改
		String strUpdate = "update amct_" + menu_ename + " set ";
		for (int i = 0; i < field.length; i++) {
			strUpdate += field[i] + "=#{" + field[i] + "},";
		}
		strUpdate += " where id=#{id}";
		data.append("<update id=\"addTopMenu\">\n");
		data.append(strUpdate + "\n");
		data.append("</update>\n");
		data.append("</mapper>\n");
		out.write(data.toString().getBytes("utf-8"));
		out.flush();
		out.close();
		return daoPath;
	}

	// 创建Controller文件
	public static String createJavaFileController(String table_field,
			String menu_ename, HttpSession session) throws IOException {

		String[] field = table_field.split(",");
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
		data.append("public findListDto<" + menu_ename + "> findAll(@RequestParam(\""+field[0]+"\")String "
				+ field[0] + ",@RequestParam(\"page\")Integer page,@RequestParam(\"limit\")Integer limit) {\n");
		data.append("System.out.println(\"=========Controller文件========\");\n");
		data.append("List<" + menu_ename
				+ "> list = am.findList("+ field[0] +", page, limit);\n");
		data.append("findListDto<" + menu_ename + "> fd = new findListDto<"
				+ menu_ename + ">();\n");
		data.append("fd.setData(list);\n");
		data.append("fd.setCode(0);\n");
		data.append("fd.setCount(list.size());\n");
		data.append("fd.setMsg(\"查询成功\");\n");
		
		data.append("System.out.println(\"=========Controller文件查询成功========\");\n");
		data.append("return fd;\n");
		data.append("}\n");
		// 删除
		data.append("@ResponseBody\n");
		data.append("@RequestMapping(value=\"/remove\",method=RequestMethod.GET)\n");
		data.append("public Integer remove(@RequestParam(\"id\")Integer id){\n");
		data.append("return am.removeTable(id);\n");
		data.append("}\n");
		// 修改
		data.append("@ResponseBody\n");
		data.append("@RequestMapping(value=\"/modify\",method=RequestMethod.POST)\n");
		data.append("public Integer modify(@RequestParam(\"m\")" + menu_ename + " m){\n");
		data.append("return am.modifyTable(m);\n");
		data.append("}\n");
		// 增加
		data.append("@ResponseBody\n");
		data.append("@RequestMapping(value=\"/add\",method=RequestMethod.POST)\n");
		data.append("public Integer add(@RequestParam(\"m\")" + menu_ename + " m){\n");
		data.append("return am.addTable(m);\n");
		data.append("}\n");

		data.append("}\n");
		out.write(data.toString().getBytes("utf-8"));
		out.flush();
		out.close();
		return daoPath;
	}

}
