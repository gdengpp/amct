<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%>
<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
<head>
<jsp:include page='../index.jsp'></jsp:include>
</head>
<body>
	<div class="bgWhite">
		<div class="layui-fluid">
			<div class="layui-row layui-col-space10">
				<div class="layui-col-md12">
					<div class="layui-form">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<input type="text" value="" placeholder="请输入姓名"
									class="layui-input search_input" />
							</div>
							<div class="layui-btn-group">
								<a class="layui-btn layui-btn-primary search_btn"> <i
									class="layui-icon">&#xe615;</i>查询
								</a> <a class="layui-btn layui-btn-primary search_add"> <i
									class="layui-icon">&#xe654;</i>新增
								</a> <a class="layui-btn layui-btn-primary search_edit"> <i
									class="layui-icon">&#xe642;</i>修改
								</a> <a class="layui-btn layui-btn-primary search_del"> <i
									class="layui-icon">&#xe640;</i>删除
								</a>
							</div>
						</div>
					</div>
					<div class="layui-form top_menu_list">
						<table class="layui-hide" id="datagrid"
							lay-data="{id: 'datagrid'}" lay-filter="datagridFilter"></table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="addAmdUpdate" style="display:none;padding:10px;">
		<form class="layui-form" action="">
			<div class="layui-row">
				<div class="layui-col-md6">
					<div class="layui-form-item">
						<label for=name class="layui-form-label">姓名</label>
						<div class="layui-input-inline">
							<input type="text" id=name name=name autocomplete="off"
								class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-col-md6">
					<div class="layui-form-item">
						<label for=age class="layui-form-label">年龄</label>
						<div class="layui-input-inline">
							<input type="text" id=age name=age autocomplete="off"
								class="layui-input">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-md6">
					<div class="layui-form-item">
						<label for=email class="layui-form-label">邮箱</label>
						<div class="layui-input-inline">
							<input type="text" id=email name=email autocomplete="off"
								class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-col-md6">
					<div class="layui-form-item">
						<label for=sex class="layui-form-label">性别</label>
						<div class="layui-input-inline">
							<input type="text" id=sex name=sex autocomplete="off"
								class="layui-input">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-md6">
					<div class="layui-form-item">
						<label for=iphone class="layui-form-label">电话</label>
						<div class="layui-input-inline">
							<input type="text" id=iphone name=iphone autocomplete="off"
								class="layui-input">
						</div>
					</div>
				</div>
		</form>
	</div>
	<script>
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
		layui
				.use(
						[ 'table', 'form', 'tree', 'layer', 'jquery', 'upload',
								'laydate', 'element' ],
						function() {
							table = layui.table;
							var layer = layui.layer;
							form = layui.form;
							var element = layui.element;
							var $ = layui.$;
							form.render();
							element.init();
							table
									.render({
										elem : '#datagrid',
										id : 'datagrid',
										url : '${pageContext.request.contextPath}/dengpp/findAll',
										height : 'full-100',
										where : {
											name : null
										},
										limits : [ 10, 20, 30, 50, 100, 300,
												600, 1000 ],
										page : true,
										cols : [ [ {
											type : 'checkbox'
										}, {
											field : 'name',
											title : '姓名',
											align : 'left'
										}, {
											field : 'age',
											title : '年龄',
											align : 'left'
										}, {
											field : 'email',
											title : '邮箱',
											align : 'left'
										}, {
											field : 'sex',
											title : '性别',
											align : 'left'
										}, {
											field : 'iphone',
											title : '电话',
											align : 'left'
										} ] ],
										done : function(res, curr, count) {
											$(".laytable-cell-checkbox").css(
													"padding", "5px");
											signleSelect($, 'datagrid');
										}
									});
							$(".search_btn").click(function() {
								table.reload('datagrid', {
									where : {
										name : $(".search_input").val()
									},
									page : {
										curr : 1
									}
								});
							});
							$(".search_add")
									.click(
											function() {
												$("#name").val('');
												$("#age").val('');
												$("#email").val('');
												$("#sex").val('');
												$("#iphone").val('');
												layui.layer
														.open({
															type : 1,
															title : "新增",
															closeBtn : 1,
															anim : 0,
															shade : 0.3,
															shadeClose : false,
															area : [ '700px',
																	'500px' ],
															content : $('#addAmdUpdate'),
															cancel : function(
																	index,
																	layero) {
																layer
																		.closeAll();
																return false;
															},
															btn : [ "提交", "关闭" ],
															yes : function(
																	index,
																	layero) {
																var add = layer
																		.load();
																$
																		.ajax({
																			url : '${pageContext.request.contextPath}/dengpp/add',
																			method : 'post',
																			data : {
																				name : $(
																						"#name")
																						.val(),
																				age : $(
																						"#age")
																						.val(),
																				email : $(
																						"#email")
																						.val(),
																				sex : $(
																						"#sex")
																						.val(),
																				iphone : $(
																						"#iphone")
																						.val()
																			},
																			success : function(
																					r) {
																				if (r == "1") {
																					layer
																							.closeAll();
																					table
																							.reload(
																									'datagrid',
																									{
																										page : {
																											curr : 1
																										}
																									});
																					layer
																							.msg(
																									"增加成功",
																									{
																										icon : 6
																									});
																				} else {
																					layer
																							.close(add);
																					layer
																							.msg(
																									"增加失败，请重试",
																									{
																										icon : 5
																									});
																				}
																			},
																			error : function() {
																				layer
																						.close(add);
																				layer
																						.msg(
																								"新增失败，请重试",
																								{
																									icon : 5
																								});
																			}
																		});
															},
														});
											});
							$(".search_edit")
									.click(
											function() {
												var topData = table
														.checkStatus("datagrid");
												var data = topData.data;
												if (data.length == 0) {
													layer.msg("请选择数据", {
														icon : 5
													});
													return false;
												}
												$("#iphone")
														.val(data[0].iphone);
												$("#sex").val(data[0].sex);
												$("#email").val(data[0].email);
												$("#age").val(data[0].age);
												$("#name").val(data[0].name);
												layui.layer
														.open({
															type : 1,
															title : "编辑",
															closeBtn : 1,
															anim : 0,
															shade : 0.3,
															shadeClose : false,
															area : [ '700px',
																	'500px' ],
															content : $('#addAmdUpdate'),
															cancel : function(
																	index,
																	layero) {
																layer
																		.closeAll();
																return false;
															},
															btn : [ "提交", "关闭" ],
															yes : function(
																	index,
																	layero) {
																var edit = layer
																		.load();
																$
																		.ajax({
																			url : '${pageContext.request.contextPath}/dengpp/modify',
																			method : 'post',
																			data : {
																				id : data[0].id,
																				iphone : $(
																						"#iphone")
																						.val(),
																				sex : $(
																						"#sex")
																						.val(),
																				email : $(
																						"#email")
																						.val(),
																				age : $(
																						"#age")
																						.val(),
																				name : $(
																						"#name")
																						.val()
																			},
																			success : function(
																					r) {
																				if (r == "1") {
																					layer
																							.closeAll();
																					table
																							.reload(
																									'datagrid',
																									{
																										page : {
																											curr : 1
																										}
																									});
																					layer
																							.msg(
																									"修改成功",
																									{
																										icon : 6
																									});
																				} else {
																					layer
																							.close(edit);
																					layer
																							.msg(
																									"修改失败，请重试",
																									{
																										icon : 5
																									});
																				}
																			},
																			error : function() {
																				layer
																						.close(edit);
																				layer
																						.msg(
																								"修改失败，请重试",
																								{
																									icon : 5
																								});
																			}
																		});
															},
														});
											});
							$(".search_del ")
									.click(
											function() {
												var topData = table
														.checkStatus("datagrid");
												var data = topData.data;
												if (data.length == 0) {
													layer.msg("未选择数据", {
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
																		layer
																				.load();
																		$
																				.ajax({
																					url : '${pageContext.request.contextPath}/dengpp/remove',
																					method : 'get',
																					data : {
																						id : data[0].id
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
																											'datagrid',
																											{
																												page : {
																													curr : 1
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
											});
						});
	</script>
</body>
</html>
