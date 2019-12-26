<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../index.jsp"></jsp:include>
</head>

<body>
	<div class="bgWhite">
		<div class="bgWhitePadding">
			<div class="layui-fluid">
				<div class="layui-row">
					<div class="layui-col-md2">
						<ul id="menu_info"></ul>
					</div>
					<div class="layui-col-md10">
						<div class="layui-form">
							<div class="layui-inline">
								<div class="layui-input-inline">
									<input type="text" value="" placeholder="角色名称"
										class="layui-input search_input" />
								</div>
								<div class="layui-btn-group">
									<a class="layui-btn layui-btn-primary search_btn"> <i
										class="layui-icon">&#xe615;</i>查询
									</a><a class="layui-btn layui-btn-primary resert_btn"> <i
										class="layui-icon">&#xe615;</i>重置
									</a> <a class="layui-btn layui-btn-primary role_add"> <i
										class="layui-icon">&#xe654;</i>新增
									</a> <a class="layui-btn layui-btn-primary role_edit"> <i
										class="layui-icon">&#xe642;</i>修改
									</a>
									<c:if test="${user.role.role_code=='admin' }">
										<a class="layui-btn layui-btn-primary role_del"> <i
											class="layui-icon">&#xe640;</i>删除
										</a>
									</c:if>
									<a class="layui-btn layui-btn-primary role_auth"> <i
										class="layui-icon">&#xe672;</i>授权
									</a>
								</div>
							</div>
						</div>
						<div class="layui-form role_list">
							<table class="layui-hide" id="roledatagrid"
								lay-data="{id: 'roledatagrid'}" lay-filter="roleTableFilter"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="roleAdd" style="display:none;padding:30px;">
		<form class="layui-form" action="">
			<div class="layui-row">
				<div class="layui-col-md12">
					<div class="layui-form-item">
						<label for="icon_class" class="layui-form-label"> <span
							style="color:red">*</span>角色名称
						</label>
						<div class="layui-input-block">
							<input type="text" id="role_name" name="role_name"
								autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-md12">
					<div class="layui-form-item">
						<label for="icon_class" class="layui-form-label"> <span
							style="color:red">*</span>角色编码
						</label>
						<div class="layui-input-block">
							<input type="text" id="role_code" name="role_code"
								autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-md12">
					<div class="layui-form-item">
						<label for="role_status" class="layui-form-label"> <span
							style="color:red">*</span>角色状态
						</label>
						<div class="layui-input-block">
							<input type="radio" name="role_status" value="0" title="正常"
								checked="checked"> <input type="radio"
								name="role_status" value="1" title="异常">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-md12">
					<div class="layui-form-item">
						<label for="icon_class" class="layui-form-label">备注 </label>
						<div class="layui-input-block">
							<input type="text" id="remark" name="remark" autocomplete="off"
								class="layui-input">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

</body>
<script type="text/javascript">
	//回车搜索
	$(document)
			.keyup(
					function(event) {
						if (event.keyCode == 13) {
							var is_shade = $(".layui-layer-shade").length;
							var btns = [ ".search_btn", [] ];
							var btn = btns[0];
							var l = 0;
							for ( var i in btns[1]) {
								if ($(btns[1][i]).parents(".layui-layer-page").length != 0) {
									var layer_num = parseInt(("" + $(btns[1][i])
											.parents(".layui-layer-page").attr(
													"id")).replace(
											/layui-layer/g, ""));
									if (layer_num && layer_num > l) {
										l = layer_num;
										btn = btns[1][i];
									}
								}
							}
							if (btn != btns[0]) {
								$(btn).click();
							} else if (is_shade == 0) {
								$(btn).click();
							}
						}
					});
	var basurl = '${pageContext.request.contextPath}/';
	$(function() {
		layui
				.use(
						[ 'table', 'form', 'tree', 'layer', 'jquery',
								'laydate', 'element', 'tree' ],
						function() {
							var table = layui.table;
							var layer = layui.layer;
							var form = layui.form;
							var element = layui.element;
							var tree = layui.tree;
							var $ = layui.$;
							form.render();
							element.init();

							//树形菜单--------------------------------------
							$
									.ajax({
										url : "${pageContext.request.contextPath}/top_menu/findAll",
										method : 'get',
										async : false,//左侧树在表格之前加载且设置同步，防止页面加载布局出现竖线问题
										success : function(data) {
											// 点击菜单查询详细情况
											if (data.length > 0) {
												var menuData = [];
												for (var i = 0; i < data.length; i++) {
													var children = [];
													var obj = {};
													obj.id = data[i].id;
													obj.title = data[i].name;
													obj.spread = true;
													if (data[i].leftmenu
															&& data[i].leftmenu.length > 0) {
														for (var j = 0; j < data[i].leftmenu.length; j++) {
															var objleft = {};
															var childrenleft = [];
															var objleftchild = {};
															objleft.id = data[i].leftmenu[j].id;
															objleft.title = data[i].leftmenu[j].name;
															objleft.spread = true;
															if (data[i].leftmenu[j].child
																	&& data[i].leftmenu[j].child.length > 0) {
																for (var m = 0; m < data[i].leftmenu[j].child.length; m++) {
																	objleftchild.id = data[i].leftmenu[j].child[m].id;
																	objleftchild.title = data[i].leftmenu[j].child[m].name;
																	objleftchild.spread = true;
																	childrenleft
																			.push(objleft);
																}
															}
															objleft.children = childrenleft;
															children
																	.push(objleft);
														}
													}
													obj.children = children;
													menuData.push(obj);
												}
												tree.render({
													elem : '#menu_info', //绑定元素
													data : menuData,
													id : 'menu_info',
													showCheckbox : true,
												});
											} else {
												layer.msg(data.msg, {
													icon : 5
												});
											}
										},
										error : function(res) {
											layer.msg(res.msg, {
												icon : 5
											});
										}
									});
							//树形菜单--------------------------------------
							table
									.render({
										elem : '#roledatagrid',
										id : 'roledatagrid',
										url : basurl + 'role/find',
										limits : [ 10, 20, 30, 50, 100, 300,
												600, 1000 ],
										cols : [ [
												{
													field : 'id',
													type : 'checkbox'
												},
												{
													field : 'role_name',
													title : '角色名称',
													align : 'left'
												},
												{
													field : 'role_code',
													title : '角色编码',
													align : 'left'
												},
												{
													field : 'role_status',
													title : '角色状态',
													align : 'left',
													templet : function(d) {
														if (d.role_status == 1) {
															return "<span style='color:red'>禁用</span>";
														} else {
															return "正常";
														}
													}
												}, {
													field : 'remark',
													title : '备注',
													align : 'left'
												},

										] ],
										page : true,
										done : function(res, curr, count) {
											$(".laytable-cell-checkbox").css(
													"padding", "5px");
											signleSelect($, 'roledatagrid');
										}
									});

							//查询
							$(".search_btn").click(function() {
								table.reload('roledatagrid', {
									where : {
										role_name : $(".search_input").val()
									},
									page : {
										curr : 1
									//重新从第 1 页开始
									}
								});
							});

							//重置
							$(".resert_btn").click(function() {
								$(".search_input").val("");
								table.reload('roledatagrid', {
									where : {
										role_name : $(".search_input").val()
									},
									page : {
										curr : 1
									//重新从第 1 页开始
									}
								});
							});

							//新增
							$(".role_add").click(function() {
								addAndEdit([]);
							});
							//修改
							$(".role_edit").click(
									function() {
										var topData = table
												.checkStatus("roledatagrid");
										var data = topData.data;
										if (data.length == 0) {
											layer.msg("没有选择数据", {
												icon : 5
											});
											return false;
										}
										addAndEdit(data);
									});
							//删除
							$(".role_del").click(
									function() {
										var topData = table
												.checkStatus("roledatagrid");
										var data = topData.data;
										if (data.length == 0) {
											layer.msg("未选择数据", {
												icon : 5
											});
											return false;
										}
										layer.load();
										layer.confirm('是否确定删除？', {
											icon : 3,
											title : '提示'
										}, function(index) {
											$.ajax({
												url : basurl + "role/remove",
												method : 'get',
												data : {
													id : data[0].id,
												},
												success : function(r) {
													layer.closeAll();
													layer.msg("删除成功", {
														icon : 6
													});
													table.reload(
															'roledatagrid', {
																page : {
																	curr : 1
																}
															});
												},
												error : function() {
													layer.closeAll();
													layer.msg("删除失败", {
														icon : 5
													});
												}
											});
										});
									});

							function addAndEdit(data) {
								var url = "role/add";
								$("#role_name").val("");
								$("#role_code").val("");
								$("#remark").val("");
								$("input[name='role_status'][value=0]").prop(
										'checked', true);
								var id = null;
								if (data.length > 0) {
									url = "role/modify";
									$("#role_name").val(data[0].role_name);
									$("#role_code").val(data[0].role_code);
									$("#remark").val(data[0].remark);
									$(
											"input[name='role_status'][value="
													+ data[0].role_status + "]")
											.prop('checked', true);
									id = data[0].id;
								}
								form.render();
								layui.layer
										.open({
											type : 1, //弹窗类型
											title : "操作菜单", //显示标题
											closeBtn : 1, //是否显示关闭按钮
											anim : 0,
											shade : 0.3,
											shadeClose : false, //显示模态窗口
											area : [ '500px', '400px' ], //宽高
											content : $('#roleAdd'),
											cancel : function(index, layero) {
												layer.closeAll();
												return false;
											},
											btn : [ "提交", "关闭" ],
											yes : function(index, layero) {
												var add = layer.load();
												$
														.ajax({
															url : basurl + url,
															method : 'get',
															data : {
																id : id,
																role_name : $(
																		"#role_name")
																		.val(),
																role_code : $(
																		"#role_code")
																		.val(),
																remark : $(
																		"#remark")
																		.val(),
																role_status : $(
																		"input[name=role_status]:checked")
																		.val()
															},
															success : function(
																	r) {
																if (r == 1) {
																	layer
																			.closeAll();
																	layer
																			.msg(
																					"操作成功",
																					{
																						icon : 6
																					});
																	table
																			.reload(
																					'roledatagrid',
																					{
																						page : {
																							curr : 1
																						}
																					});
																} else {
																	layer
																			.close(add);
																	layer
																			.msg(
																					"操作失败",
																					{
																						icon : 6
																					});
																}

															},
															error : function() {
																layer
																		.close(add);
																layer
																		.msg(
																				"操作失败",
																				{
																					icon : 5
																				});
															}
														});
											}
										});
							}

							//监听行单击事件（双击事件为：rowDouble）
							table.on('row(roleTableFilter)', function(obj) {
								var data = obj.data;
								$.ajax({
									url : basurl + 'role/getMenuId',
									method : 'get',
									data : {
										role_id : data.id
									},
									success : function(r) {
										//重载实例
										tree.reload('menu_info', {

										});
										tree.setChecked('menu_info', r); //勾选指定节点
									}
								});
								//标注选中样式
								//obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
							});

							//授权
							$(".role_auth")
									.click(
											function() {
												var topData = table
														.checkStatus("roledatagrid");
												var data = topData.data;
												if (data.length == 0) {
													layer.msg("没有选择授权角色", {
														icon : 5
													});
													return false;
												}
												var treeData = tree
														.getChecked('menu_info');
												if (treeData.length == 0) {
													layer.msg("没有选择授权菜单", {
														icon : 5
													});
													return false;
												}
												if(data[0].role_status==1){
													layer.msg("角色异常，不可授权", {
														icon : 5
													});
													return false;
												}
												var tree_id = [];
												for (var i = 0; i < treeData.length; i++) {
													tree_id
															.push(treeData[i].id);
													if (treeData[i].children.length > 0) {
														for (var j = 0; j < treeData[i].children.length; j++) {
															tree_id
																	.push(treeData[i].children[j].id);
															if (treeData[i].children[j].children.length > 0) {
																for (var m = 0; m < treeData[i].children[j].children.length; m++) {
																	tree_id
																			.push(treeData[i].children[j].children[m].id);
																}
															}
														}
													}
												}

												$
														.ajax({
															url : basurl
																	+ 'role/auth',
															method : 'get',
															data : {
																role_id : data[0].id,
																menu_id : JSON
																		.stringify(tree_id),
															},
															success : function(
																	r) {
																if (r == 1) {
																	layer
																			.closeAll();
																	layer
																			.msg(
																					"授权成功",
																					{
																						icon : 6
																					});
																	table
																			.reload(
																					'roledatagrid',
																					{
																						page : {
																							curr : 1
																						}
																					});
																} else {
																	layer
																			.msg(
																					"授权失败",
																					{
																						icon : 5
																					});
																}
															},
															error : function() {
																layer
																		.msg(
																				"授权失败",
																				{
																					icon : 5
																				});
															}
														});
											});
						});
	});
</script>
</html>

