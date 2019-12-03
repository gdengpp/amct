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
						<h3>横向导航条配置：</h3>
						<br />
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
						<h3>纵向导航条配置：</h3>
						<br />
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
							<table class="layui-hide" id="leftMenudatagrid"
								lay-data="{id: 'leftMenudatagrid'}" lay-filter="leftTableFilter"></table>
						</div>
					</div>
					<div class="layui-col-md4">
						<h3>纵向导航条子菜单配置：</h3>
						<br />
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
		<div class="layui-row">
			<div class="layui-col-md12">
				<form class="layui-form" action="">
					<div class="layui-form-item">
						<label for="menu_name" class="layui-form-label"> <span
							style="color:red">*</span>菜单名
						</label>
						<div class="layui-input-inline">
							<input type="text" id="menu_name" name="menu_name"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label for="menu_ename" class="layui-form-label"> <span
							style="color:red">*</span>表名
						</label>
						<div class="layui-input-inline">
							<input type="text" id="menu_ename" name="menu_ename"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><span style="color:red">*</span>表字段</label>
						<div class="layui-input-block">
							<textarea placeholder="请输入内容以英文,分隔（name,age,sex）"
								class="layui-textarea tableField"></textarea>
						</div>
					</div>

					<div class="layui-form-item">
						<label class="layui-form-label">是否显示</label>
						<div class="layui-input-block">
							<input type="radio" name="menu_display" value="1" title="是">
							<input type="radio" name="menu_display" value="0" title="否"
								checked="checked">
						</div>
					</div>

					<div class="layui-form-item">
						<label for="menu_remark" class="layui-form-label">说明</label>
						<div class="layui-input-inline">
							<input type="text" id="menu_remark" name="menu_remark"
								autocomplete="off" class="layui-input">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
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
									if ($(btns[1][i]).parents(
											".layui-layer-page").length != 0) {
										var layer_num = parseInt(("" + $(
												btns[1][i]).parents(
												".layui-layer-page").attr("id"))
												.replace(/layui-layer/g, ""));
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
		layui.use([ 'table', 'form', 'tree', 'layer', 'jquery', 'upload',
				'laydate', 'element' ], function() {
			table = layui.table;
			var layer = layui.layer;
			form = layui.form;
			var element = layui.element;
			var $ = layui.$;
			form.render();
			element.init();
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
					$(".laytable-cell-checkbox").css("padding", "5px");
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
			$(".top_menu_add").click(
					function() {
						$("#menu_ename").removeAttr("readonly");
						$("#menu_ename").css("color","black");
						$("#menu_name").val("");
						$("#menu_ename").val("");
						$("#menu_remark").val("");
						$(".tableField").val("");
						layui.layer.open({
							type : 1, //弹窗类型
							title : "新增菜单", //显示标题
							closeBtn : 1, //是否显示关闭按钮
							anim : 0,
							shade : 0.3,
							shadeClose : false, //显示模态窗口
							area : [ '500px', '500px' ], //宽高
							content : $('#topMenuAdd'),
							cancel : function(index, layero) {
								layer.closeAll();
								return false;
							},
							btn : [ "新增", "关闭" ],
							yes : function(index, layero) {
								var menu_name = $("#menu_name").val();
								var menu_ename = $("#menu_ename").val();
								var menu_display = $(
										"input[name=menu_display]:checked")
										.val();
								var menu_remark = $("#menu_remark").val();
								var table_field = $(".tableField").val();
								if (!table_field) {
									layer.msg("请填写表字段", {
										icon : 5
									});
									return false;
								}
								var tab = table_field.split(",");

								var str = "id varchar(64) NOT NULL,";
								for (var i = 0; i < tab.length; i++) {
									str += tab[i]
											+ " varchar(64) DEFAULT NULL,";
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
										layer.msg("菜单英文名只能由字母组成", {
											icon : 5
										});
										return false;
									}
								}
								;
								$.ajax({
									url : basurl + 'top_menu/topMenuAdd',
									method : 'get',
									data : {
										menu_name : menu_name,
										menu_ename : menu_ename,
										menu_display : menu_display,
										menu_remark : menu_remark,
										table_field : str,
										field : table_field

									},
									success : function(r) {
										if (r == "yes") {
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
											table.reload(
													'leftchildMenudatagrid', {
														page : {
															curr : 1
														//重新从第 1 页开始
														}
													});
											layer.closeAll();
											layer.msg("增加成功，请刷新页面显示结束", {
												icon : 6
											});
										} else {
											layer.msg("增加失败，请检查是否存在表名", {
												icon : 5
											});
										}
									}
								});
							},
						});
					});

			//修改
			$(".top_menu_edit").click(
					function() {
						var topData = table.checkStatus("topMenudatagrid");
						console.log(topData);
						var data = topData.data;
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
						$(".tableField").val(data[0].tab_field);
						form.render();
						layui.layer.open({
							type : 1, //弹窗类型
							title : "新增菜单", //显示标题
							closeBtn : 1, //是否显示关闭按钮
							anim : 0,
							shade : 0.3,
							shadeClose : false, //显示模态窗口
							area : [ '500px', '500px' ], //宽高
							content : $('#topMenuAdd'),
							cancel : function(index, layero) {
								layer.closeAll();
								return false;
							},
							btn : [ "修改", "关闭" ],
							yes : function(index, layero) {
								var menu_display = $("input[name=menu_display]:checked").val();
								if (data[0].id == 1) {
									if (menu_display == 0) {
										layer.confirm('配置菜单，隐藏只能在数据库中修改显示', {
											icon : 3,
											title : '提示'
										}, function(index) {
											if (index) {
												modifyMenu(data);
											}
										});
									}else{
										modifyMenu(data);
									}
								}else{
									modifyMenu(data)
								}

							},
						});

					});

			function modifyMenu(data) {
				var menu_name = $("#menu_name").val();
				var menu_ename = $("#menu_ename").val();
				var menu_display = $("input[name=menu_display]:checked").val();
				var menu_remark = $("#menu_remark").val();
				var table_field = $(".tableField").val();
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
				$.ajax({
					url : basurl + 'top_menu/topMenuEdit',
					method : 'post',
					data : {
						id : data[0].id,
						menu_ename : menu_ename,
						menu_name : menu_name,
						menu_display : menu_display,
						menu_remark : menu_remark,
						table_field : table_field
					},
					success : function(r) {
						if (r == "yes") {
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
							layer.msg("修改失败", {
								icon : 5
							});
						}
					}
				});
			}
			//删除
			$(".top_menu_del").click(function() {
				var topData = table.checkStatus("topMenudatagrid");
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
				layer.confirm('是否确定删除？', {
					icon : 3,
					title : '提示'
				}, function(index) {
					if (index) {
						layer.load();
						$.ajax({
							url : basurl + 'top_menu/removeTab',
							method : 'get',
							data : {
								id : data[0].id,
								tab_name : data[0].ename
							},
							success : function(r) {
								layer.closeAll();
								if (r == 1) {
									layer.msg("删除成功", {
										icon : 6
									});
									table.reload('leftMenudatagrid', {
										page : {
											curr : 1
										//重新从第 1 页开始
										}
									});
									table.reload('topMenudatagrid', {
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
								} else {
									layer.msg("删除失败", {
										icon : 5
									});
								}
							}
						});
					}
				});
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
					$(".laytable-cell-checkbox").css("padding", "5px");
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
					$(".laytable-cell-checkbox").css("padding", "5px");
					signleSelect($, 'leftchildMenudatagrid');
				}
			});
			//==============================数据表格左侧二级=======================
		});
	</script>
</body>
</html>
