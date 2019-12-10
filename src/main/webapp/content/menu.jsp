<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../index.jsp"></jsp:include>
</head>
<body>
	<div class="bgWhite">
		<div class="bgWhitePadding">
			<div class="layui-fluid">
				<div class="layui-row layui-col-space10">
					<div class="layui-col-md4">
						<div class="layui-form">
							<div class="layui-inline">
								<div class="layui-input-inline">
									<input type="text" value="" placeholder="菜单名"
										class="layui-input search_input" />
								</div>
								<div class="layui-btn-group">
									<a class="layui-btn layui-btn-primary search_btn"> <i
										class="layui-icon">&#xe615;</i>查询
									</a> <a class="layui-btn layui-btn-primary top_menu_add"> <i
										class="layui-icon">&#xe654;</i>新增
									</a> <a class="layui-btn layui-btn-primary top_menu_edit"> <i
										class="layui-icon">&#xe642;</i>修改
									</a> </a> <a class="layui-btn layui-btn-primary top_menu_del"> <i
										class="layui-icon">&#xe640;</i>删除
									</a>
								</div>
							</div>
						</div>
						<div class="layui-form top_menu_list">
							<table class="layui-hide" id="topMenudatagrid"
								lay-data="{id: 'topMenudatagrid'}" lay-filter="topTableFilter"></table>
						</div>
					</div>
					<div class="layui-col-md4">
						<div class="layui-form">
							<div class="layui-inline">
								<div class="layui-btn-group">
									</a> <a class="layui-btn layui-btn-primary left_menu_add"> <i
										class="layui-icon">&#xe654;</i>新增
									</a> <a class="layui-btn layui-btn-primary left_menu_edit"> <i
										class="layui-icon">&#xe642;</i>修改
									</a> </a> <a class="layui-btn layui-btn-primary left_menu_del"> <i
										class="layui-icon">&#xe640;</i>删除
									</a>
								</div>
							</div>
						</div>
						<div class="layui-form left_menu_list">
							<table class="layui-hide" id="leftMenudatagrid"
								lay-data="{id: 'leftMenudatagrid'}" lay-filter="leftTableFilter"></table>
						</div>
					</div>
					<div class="layui-col-md4">
						<div class="layui-form">
							<div class="layui-inline">
								<div class="layui-btn-group">
									</a> <a class="layui-btn layui-btn-primary apply_auth_btn"> <i
										class="layui-icon">&#xe654;</i>新增
									</a> <a class="layui-btn layui-btn-primary return_auth_btn"> <i
										class="layui-icon">&#xe642;</i>修改
									</a> </a> <a class="layui-btn layui-btn-primary return_auth_btn"> <i
										class="layui-icon">&#xe640;</i>删除
									</a>
								</div>
							</div>
						</div>
						<div class="layui-form left_menu_list">
							<table class="layui-hide" id="leftchildMenudatagrid"
								lay-data="{id: 'leftchildMenudatagrid'}"
								lay-filter="leftchildTableFilter"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 头部新增begin======== -->
	<div id="topMenuAdd" style="display:none;padding:10px;">
		<form class="layui-form" action="">
			<div class="layui-row">
				<div class="layui-col-md6">
					<div class="layui-form-item">
						<label for="menu_name" class="layui-form-label"> <span
							style="color:red">*</span>菜单名
						</label>
						<div class="layui-input-inline">
							<input type="text" id="menu_name" name="menu_name"
								autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-col-md6">
					<div class="layui-form-item">
						<label for="menu_ename" class="layui-form-label"> <span
							style="color:red">*</span>表名
						</label>
						<div class="layui-input-inline">
							<input type="text" id="menu_ename" name="menu_ename"
								autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-col-md12">
					<div class="layui-form-item">
						<label class="layui-form-label"><span style="color:red">*</span>表字段</label>
						<div class="layui-input-block" style="width: 78%;">
							<table class="layui-hide" id="monitor" lay-data="{id: 'monitor'}"
								lay-filter="monitor"></table>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-md12">
					<div class="layui-form-item">
						<label class="layui-form-label">是否显示</label>
						<div class="layui-input-block">
							<input type="radio" name="menu_display" value="1" title="是">
							<input type="radio" name="menu_display" value="0" title="否"
								checked="checked">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-md12">
					<div class="layui-form-item">
						<label for="menu_remark" class="layui-form-label">说明</label>
						<div class="layui-input-block" style="width: 79%;">
							<input type="text" id="menu_remark" name="menu_remark"
								autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<script>
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
	//layui begin 
	layui
			.use(
					[ 'table', 'form', 'tree', 'layer', 'jquery', 'upload',
							'laydate', 'element' ],
					function() {
						var table = layui.table;
						var layer = layui.layer;
						var form = layui.form;
						var element = layui.element;
						var $ = layui.$;
						form.render();
						element.init();

						//在修改字段的时候使用						
						var addField = [];//新增的字段
						var delField = [];//删除的字段
						/*
						    ==================数据表格左侧头部========================================
						 */
						table.render({
							elem : '#topMenudatagrid',
							id : 'topMenudatagrid',
							url : basurl + 'top_menu/findTopMenuList',
							height : 'full-100',
							limits : [ 10, 20, 30, 50, 100, 300, 600, 1000 ],
							cols : [ [ {
								field : 'id',
								type : 'checkbox'
							}, {
								field : 'name',
								title : '菜单名',
								align : 'left'
							}, {
								field : 'ename',
								title : '表名',
								align : 'left'
							},

							] ],
							page : true,
							done : function(res, curr, count) {
								$(".laytable-cell-checkbox").css("padding",
										"5px");
								signleSelect($, 'topMenudatagrid');
							}
						});

						//查询
						$(".search_btn").click(function() {
							table.reload('topMenudatagrid', {
								where : {
									name : $(".search_input").val()
								},
								page : {
									curr : 1
								//重新从第 1 页开始
								}
							});
						});

						//监听行单击事件（双击事件为：rowDouble）
						table.on('row(topTableFilter)', function(obj) {
							var data = obj.data;
							table.reload('leftMenudatagrid', {
								data : data.leftmenu,
							});
							table.reload('leftchildMenudatagrid', {
								data : [],
							});
						});

						//新增
						$(".top_menu_add").click(function() {
							add("topMenudatagrid", "top_menu/topMenuAdd");
						});

						//修改
						$(".top_menu_edit").click(function() {
							modify("topMenudatagrid","monitor/findMonitorList","top_menu/topMenuEdit");
								});

						//删除
						$(".top_menu_del").click(function() {
							remove("topMenudatagrid", "top_menu/removeTab");
						});

						//============================头部结束===========================================

						/*
						===============================数据表格左侧一级====================================
						 */
						table.render({
							elem : '#leftMenudatagrid',
							id : 'leftMenudatagrid',
							height : 'full-100',
							data : [],
							limits : [ 10, 20, 30, 50, 100, 300, 600, 1000 ],
							cols : [ [ {
								field : 'id',
								type : 'checkbox'
							}, {
								field : 'name',
								title : '菜单名',
								align : 'left'
							}, {
								field : 'ename',
								title : '表名',
								align : 'left'
							},

							] ],
							page : true,
							done : function(res, curr, count) {
								$(".laytable-cell-checkbox").css("padding",
										"5px");
								signleSelect($, 'leftMenudatagrid');
							}
						});

						//监听行left_mune单击事件（双击事件为：rowDouble）
						table.on('row(leftTableFilter)', function(obj) {
							var data = obj.data;
							console.log(data.child);
							table.reload('leftchildMenudatagrid', {
								data : data.child,
							});
						});
						//======================数据表格左侧一级结束============================
						/*
						==========================数据表格左侧二级============================
						 */
						table.render({
							elem : '#leftchildMenudatagrid',
							id : 'leftchildMenudatagrid',
							height : 'full-100',
							limits : [ 10, 20, 30, 50, 100, 300, 600, 1000 ],
							data : [],
							cols : [ [ {
								field : 'id',
								type : 'checkbox',
							}, {
								field : 'name',
								title : '菜单名',
								align : 'left',
							}, {
								field : 'ename',
								title : '表名',
								align : 'left',
							},

							] ],
							page : true,
							done : function(res, curr, count) {
								$(".laytable-cell-checkbox").css("padding",
										"5px");
								signleSelect($, 'leftchildMenudatagrid');
							}
						});
						//==============================数据表格左侧二级=======================

						//========================方法共用开始======================================================================================
						//-----------------------增加add------------------------------------------------------------------------------------------
						function add(model_id, url) {
							$("#menu_ename").removeAttr("readonly");
							$("#menu_ename").css("color", "black");
							$("#menu_name").val("");
							$("#menu_ename").val("");
							$("#menu_remark").val("");
							$(".tableField").val("");
							layui.layer
									.open({
										type : 1, //弹窗类型
										title : "新增菜单", //显示标题
										closeBtn : 1, //是否显示关闭按钮
										anim : 0,
										shade : 0.3,
										shadeClose : false, //显示模态窗口
										area : [ '800px', '600px' ], //宽高
										content : $('#topMenuAdd'),
										cancel : function(index, layero) {
											layer.closeAll();
											return false;
										},
										success : function() {
											//==============================表字段展示Table=======================
											table
													.render({
														id : 'monitor',
														elem : '#monitor',
														data : [],
														//height:'full-100',
														toolbar : '#toolbarDemo',
														defaultToolbar : [
																'filter',
																'exports',
																'print',
																{ //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
																	title : '提示',
																	layEvent : 'LAYTABLE_TIPS',
																	icon : 'layui-icon-tips',
																} ],
														cols : [ [
																{
																	field : 'id',
																	type : 'checkbox',
																},
																{
																	field : 'menu_name',
																	title : '展示名称',
																	edit : 'text',
																	align : 'center',
																},
																{
																	field : 'menu_ename',
																	title : '名称',
																	edit : 'text',
																	align : 'center',
																},
																{
																	field : 'type',
																	title : '类型',
																	event : 'type_event',
																	align : 'center',
																	templet : function(
																			d) {
																		var select = {};
																		if (d.type == "String") {
																			select.o1 = 'selected="selected"';
																		} else if (d.type == "int") {
																			select.o2 = 'selected="selected"';
																		}

																		html = '<form class="layui-form" action="">\
									                                                <div class="layui-form-item">\
									                                                    <select name="res" lay-filter="typeFilter">\
									                                                        <option value="String" '+ select.o1 + '>String</option>\
									                                                        <option value="int" '+ select.o2 + '>int</option>\
									                                                    </select>\
									                                                </div>\
									                                            </from>';
																		return html;
																	}
																},
																{
																	field : 'len',
																	title : '长度',
																	edit : 'text',
																	align : 'center',
																},
																{
																	field : 'is_query',
																	title : '查询字段',
																	width : 110,
																	unresize : true,
																	templet : function(
																			d) {
																		if (d.is_query == "1") {
																			return "<input type=\"checkbox\" name=\"lock\" value=\"1\" title=\"是\" lay-filter=\"lockDemo\" checked = 'true'>";
																		}
																		return "<input type=\"checkbox\" name=\"lock\" value=\"1\" title=\"是\" lay-filter=\"lockDemo\">";
																	}
																}

														] ],
														limit : 100000,
														done : function(res,
																curr, count) {
															signleSelect($,
																	'monitor');
															form.render();
															$(
																	"[data-field='type'] [class$=4]")
																	.find(
																			"input")
																	.css(
																			{
																				'max-width' : '100%'
																			});
															for (var i = 1; i < $("[data-field='type'] [class$=4]").length; i++) {
																$(
																		$("[data-field='type'] [class$=4]")[i])
																		.css(
																				{
																					'overflow' : 'visible',
																					"padding" : "0px"
																				});
															}

														}
													});

											//==============================表字段展示Table=======================
										},
										btn : [ "新增", "关闭" ],
										yes : function(index, layero) {
											var menu_name = $("#menu_name")
													.val();
											var menu_ename = $("#menu_ename")
													.val();
											var menu_display = $(
													"input[name=menu_display]:checked")
													.val();
											var menu_remark = $("#menu_remark")
													.val();
											var table_field = tables = table.cache.monitor;
											if (table_field.length == 0) {
												layer.msg("表字段不能为空", {
													icon : 5
												});
												return false;
											}
											;
											//拼接入库String
											var tab_field_data = [];
											var str = "id varchar(64) NOT NULL,";
											for (var i = 0; i < table_field.length; i++) {
												var obj = {
													menu_name : table_field[i].menu_name,
													menu_ename : table_field[i].menu_ename,
													type : table_field[i].type,
													len : table_field[i].len,
													is_query : table_field[i].is_query
												};
												tab_field_data.push(obj);
												var type;
												if (table_field[i].type == "String") {
													type = "varchar";
												} else {
													type = "int";
												}
												str += table_field[i].menu_ename
														+ " "
														+ type
														+ "("
														+ table_field[i].len
														+ ")"
														+ " DEFAULT NULL,";
											}
											str += "PRIMARY KEY (id)";
											if (!menu_name) {
												layer.msg("请填写菜单名", {
													icon : 5
												});
												return false;
											}
											;
											if (!menu_ename) {
												layer.msg("请填写菜单英文名", {
													icon : 5
												});
												return false;
											}
											;
											if (menu_ename) {
												var reg = /^[A-Za-z]+$/;
												if (!reg.test(menu_ename)) {
													layer.msg("表名只能由字母组成", {
														icon : 5
													});
													return false;
												}
											}
											;
											var add = layer.load();
											$
													.ajax({
														url : basurl + url,
														method : 'post',
														data : {
															menu_name : menu_name,
															menu_ename : menu_ename,
															menu_display : menu_display,
															menu_remark : menu_remark,
															table_field : str,
															field : JSON
																	.stringify(tab_field_data)

														},
														success : function(r) {
															layer.closeAll();
															if (r == "yes") {
																table
																		.reload(
																				'topMenudatagrid',
																				{
																					page : {
																						curr : 1
																					//重新从第 1 页开始
																					}
																				});
																table
																		.reload(
																				'leftMenudatagrid',
																				{
																					page : {
																						curr : 1
																					//重新从第 1 页开始
																					}
																				});
																table
																		.reload(
																				'leftchildMenudatagrid',
																				{
																					page : {
																						curr : 1
																					//重新从第 1 页开始
																					}
																				});
																layer
																		.closeAll();
																layer
																		.msg(
																				"增加成功，请刷新页面显示结束",
																				{
																					icon : 6
																				});
															} else {
																layer
																		.msg(
																				"增加失败，请检查是否存在表名",
																				{
																					icon : 5
																				});
															}
														},
														error : function() {
															layer
																	.msg(
																			"增加失败，请稍后重试",
																			{
																				icon : 5
																			});
															layer.close(add);
														}
													});
										},
									});
						}
						//---------------------------------修改modify-----------------------------------------------------------------------------
						function modify(model_id, monitor_url, url) {

							var topData = table.checkStatus(model_id);
							var data = topData.data;
							console.log(data);
							if (data.length == 0) {
								layer.msg("未选择数据", {
									icon : 5
								});
								return false;
							}
							$("#menu_name").val(data[0].name);
							$("#menu_ename").val(data[0].ename);
							$("#menu_ename").attr('readonly', 'true');
							$("#menu_ename").css('color', 'rgb(238, 238, 238)');
							$("#menu_remark").val(data[0].remark);
							$(
									"input[name='menu_display'][value="
											+ data[0].is_display + "]").attr(
									'checked', true);
							//查询子表
							$
									.ajax({
										url : basurl + monitor_url,
										method : 'get',
										data : {
											menu_id : data[0].id
										},
										success : function(r) {
											form.render();
											layui.layer
													.open({
														type : 1, //弹窗类型
														title : "修改菜单", //显示标题
														closeBtn : 1, //是否显示关闭按钮
														anim : 0,
														shade : 0.3,
														shadeClose : false, //显示模态窗口
														area : [ '800px',
																'600px' ], //宽高
														content : $('#topMenuAdd'),
														cancel : function(
																index, layero) {
															layer.closeAll();
															return false;
														},
														success : function() {
															//==============================表字段展示Table=======================
															table
																	.render({
																		id : 'monitor',
																		elem : '#monitor',
																		//height:'full-100',
																		data : r,
																		toolbar : '#toolbarDemo',
																		defaultToolbar : [
																				'filter',
																				'exports',
																				'print',
																				{ //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
																					title : '提示',
																					layEvent : 'LAYTABLE_TIPS',
																					icon : 'layui-icon-tips',
																				} ],
																		cols : [ [
																				{
																					field : 'id',
																					type : 'checkbox',
																				},
																				{
																					field : 'menu_name',
																					title : '展示名称',
																					edit : 'text',
																					align : 'center',
																				},
																				{
																					field : 'menu_ename',
																					title : '名称',
																					edit : 'text',
																					align : 'center',
																				},
																				{
																					field : 'type',
																					title : '类型',
																					event : 'type_event',
																					align : 'center',
																					templet : function(
																							d) {
																						var select = {};
																						if (d.type == "String") {
																							select.o1 = 'selected="selected"';
																						} else if (d.type == "int") {
																							select.o2 = 'selected="selected"';
																						}

																						html = '<form class="layui-form" action="">\
									                                                <div class="layui-form-item">\
									                                                    <select name="res" lay-filter="typeFilter">\
									                                                        <option value="String" '+ select.o1 + '>String</option>\
									                                                        <option value="int" '+ select.o2 + '>int</option>\
									                                                    </select>\
									                                                </div>\
									                                            </from>';
																						return html;
																					}
																				},
																				{
																					field : 'len',
																					title : '长度',
																					edit : 'text',
																					align : 'center',
																				},
																				{
																					field : 'is_query',
																					title : '查询字段',
																					width : 110,
																					unresize : true,
																					templet : function(
																							d) {
																						if (d.is_query == "1") {
																							return "<input type=\"checkbox\" name=\"lock\" value=\"1\" title=\"是\" lay-filter=\"lockDemo\" checked = 'true'>";
																						}
																						return "<input type=\"checkbox\" name=\"lock\" value=\"1\" title=\"是\" lay-filter=\"lockDemo\">";
																					}
																				}

																		] ],
																		limit : 100000,
																		done : function(
																				res,
																				curr,
																				count) {
																			console
																					.log(res)
																			signleSelect(
																					$,
																					'monitor');
																			form
																					.render();
																			$(
																					"[data-field='type'] [class$=4]")
																					.find(
																							"input")
																					.css(
																							{
																								'max-width' : '100%'
																							});
																			for (var i = 1; i < $("[data-field='type'] [class$=4]").length; i++) {
																				$(
																						$("[data-field='type'] [class$=4]")[i])
																						.css(
																								{
																									'overflow' : 'visible',
																									"padding" : "0px"
																								});
																			}

																		}
																	});

															//==============================表字段展示Table=======================
														},
														btn : [ "修改", "关闭" ],
														yes : function(index,
																layero) {
															var menu_display = $(
																	"input[name=menu_display]:checked")
																	.val();
															if (data[0].id == 1) {
																if (menu_display == 0) {
																	layer
																			.confirm(
																					'配置菜单，隐藏只能在数据库中修改显示',
																					{
																						icon : 3,
																						title : '提示'
																					},
																					function(
																							index) {
																						if (index) {
																							modifyMenu(
																									data,
																									url);
																						}
																					});
																} else {
																	modifyMenu(
																			data,
																			url);
																}
															} else {
																modifyMenu(
																		data,
																		url);
															}

														},
													});
										}
									});
						}
						//-----------------------------------删除 remove---------------------------------------------------------------------------
						function remove(model_id, url) {
							var topData = table.checkStatus(model_id);
							var data = topData.data;
							if (data.length == 0) {
								layer.msg("未选择数据", {
									icon : 5
								});
								return false;
							}
							if (data[0].id == 1) {
								layer.msg("配置菜单，不可删除", {
									icon : 5
								});
								return false;
							}
							layer
									.confirm(
											'是否确定删除？',
											{
												icon : 3,
												title : '提示'
											},
											function(index) {
												if (index) {
													layer.load();
													$
															.ajax({
																url : basurl
																		+ url,
																method : 'get',
																data : {
																	id : data[0].id,
																	tab_name : data[0].ename
																},
																success : function(
																		r) {
																	layer
																			.closeAll();
																	if (r == 1) {
																		layer
																				.msg(
																						"删除成功",
																						{
																							icon : 6
																						});
																		table
																				.reload(
																						'leftMenudatagrid',
																						{
																							page : {
																								curr : 1
																							//重新从第 1 页开始
																							}
																						});
																		table
																				.reload(
																						'topMenudatagrid',
																						{
																							page : {
																								curr : 1
																							//重新从第 1 页开始
																							}
																						});
																		table
																				.reload(
																						'leftchildMenudatagrid',
																						{
																							page : {
																								curr : 1
																							//重新从第 1 页开始
																							}
																						});
																	} else {
																		layer
																				.msg(
																						"删除失败",
																						{
																							icon : 5
																						});
																	}
																}
															});
												}
											});
						}

						//修改
						function modifyMenu(data, url) {
							var menu_name = $("#menu_name").val();
							var menu_ename = $("#menu_ename").val();
							var menu_display = $(
									"input[name=menu_display]:checked").val();
							var menu_remark = $("#menu_remark").val();
							var table_field = tables = table.cache.monitor;
							var field = JSON.stringify(table_field);
							if (!table_field) {
								layer.msg("请填写表字段", {
									icon : 5
								});
								return false;
							}

							if (!menu_name) {
								layer.msg("请填写菜单名", {
									icon : 5
								});
								return false;
							}
							;
							if (!menu_ename) {
								layer.msg("请填写菜单英文名", {
									icon : 5
								});
								return false;
							}
							;
							if (menu_ename) {
								var reg = /^[A-Za-z]+$/;
								if (!reg.test(menu_ename)) {
									layer.msg("菜单英文名只能由字母组成", {
										icon : 5
									});
									return false;
								}
							}
							;
							var edit = layer.load();
							$.ajax({
								url : basurl + url,
								method : 'post',
								data : {
									id : data[0].id,
									menu_ename : menu_ename,
									menu_name : menu_name,
									menu_display : menu_display,
									menu_remark : menu_remark,
									field : field

								},
								success : function(r) {
									if (r == 1) {
										table.reload('topMenudatagrid', {
											page : {
												curr : 1
											//重新从第 1 页开始
											}
										});
										table.reload('leftMenudatagrid', {
											page : {
												curr : 1
											//重新从第 1 页开始
											}
										});
										table.reload('leftchildMenudatagrid', {
											page : {
												curr : 1
											//重新从第 1 页开始
											}
										});
										layer.closeAll();
										layer.msg("修改成功，请刷新页面显示结束", {
											icon : 6
										});
									} else {
										layer.close(edit);
										layer.msg("修改失败", {
											icon : 5
										});
									}
								},
								error : function() {
									layer.msg("修改失败，请稍后重试", {
										icon : 5
									});
									layer.close(edit);
								}
							});
						}
						//========================方法共用结束=======================================================================================

						//头工具栏事件
						table
								.on(
										'toolbar(monitor)',
										function(obj) {
											switch (obj.event) {
											case 'add':
												var data = tables = table.cache.monitor;
												addMonitorTable(data);
												break;
											case 'del':
												delMonitorTable();
												break;
											//自定义头工具栏右侧图标 - 提示
											case 'LAYTABLE_TIPS':
												layer
														.alert('配置字段，第一个字段请选择用默认String类型，查询字段：是否定义页面通过此字段进行查询,修改字段类型请保证数据库中有值的数据类型相匹配');
												break;
											}
											;
										});

						//新增
						function addMonitorTable(data) {
							var obj = {
								menu_name : "",
								menu_ename : "",
								type : "String",
								len : "",
								is_query : 0
							};
							data.unshift(obj);
							table.reload('monitor', {
								data : data,
							});
						}
						//删除
						function delMonitorTable() {
							var data = table.checkStatus('monitor').data;
							if (data.length == 0) {
								layer.msg("未选择数据", {
									icon : 5
								});
								return false;
							}
							var deldialog = layer
									.confirm(
											'您是否要删除已选信息？',
											{
												btn : [ '确定', '取消' ]
											},
											function() {
												var del = layer.load();
												var datas = tables = table.cache.monitor;
												for (var i = 0; i < datas.length; i++) {
													if (datas[i].len == data[0].len
															&& datas[i].menu_ename == data[0].menu_ename
															&& datas[i].menu_name == data[0].menu_name
															&& datas[i].type == data[0].type
															&& datas[i].is_query == data[0].is_query) {
														datas.splice(i, 1);
													}
												}
												table.reload('monitor', {
													data : datas,
												});
												layer.close(del);
												layer.close(deldialog);
												return;
											}, function() {

											});
						}

						//监听指标信息表
						table.on('tool(monitor)', function(obj) {
							if (obj.event == "type_event") {
								$(this).find(".layui-form-select dl").toggle();
								$(this).find(".layui-form-select dl").css({
									"top" : "33px"
								});
							}
						});

						//监听select
						form.on('select(typeFilter)', function(data) {
							var selectElem = $(data.elem); //获取下拉框
							var tdElem = selectElem.closest('tr').attr(
									"data-index"); //父元素td
							var tab_data = tables = table.cache.monitor;
							tab_data[tdElem].type = data.value;
							$(this).parent("dl").hide();
						});

						//监听锁定操作
						form.on('checkbox(lockDemo)', function(obj) {
							var selectElem = $(obj.elem); //获取下拉框
							var tdElem = selectElem.closest('tr').attr(
									"data-index"); //父元素td
							var tab_data = tables = table.cache.monitor;
							if (obj.elem.checked) {
								tab_data[tdElem].is_query = 1;
							} else {
								tab_data[tdElem].is_query = 0;
							}
							console.log(tab_data)
						});

					});
</script>
<script type="text/html" id="toolbarDemo">
  <a class="layui-btn layui-btn-xs" lay-event="add">新增</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<style>
.layui-table-cell,.layui-table-tool-panel li {
	overflow: visible !important;
}

.layui-form-select .layui-input {
	height: 30px;
}

.layui-table-box {
	overflow: visible !important;
}

.layui-table-body {
	overflow: visible !important;
}
</style>
</html>
