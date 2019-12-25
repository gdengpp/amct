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
				<div class="layui-row layui-col-space10">
					<div class="layui-col-md12">
						<div class="layui-form">
							<div class="layui-inline">
								<div class="layui-input-inline">
									<input type="text" value="" placeholder="用户账号"
										class="layui-input search_input" />
								</div>
								<div class="layui-btn-group">
									<a class="layui-btn layui-btn-primary search_btn"> <i
										class="layui-icon">&#xe615;</i>查询
									</a><a class="layui-btn layui-btn-primary resert_btn"> <i
										class="layui-icon">&#xe615;</i>重置
									</a> <a class="layui-btn layui-btn-primary user_add"> <i
										class="layui-icon">&#xe654;</i>新增
									</a> <a class="layui-btn layui-btn-primary user_edit"> <i
										class="layui-icon">&#xe642;</i>修改
									</a>
									<c:if test="${user.role.role_code=='admin' }">
										<a class="layui-btn layui-btn-primary user_del"> <i
											class="layui-icon">&#xe640;</i>删除
										</a>
									</c:if>
								</div>
							</div>
						</div>
						<div class="layui-form icon_list">
							<table class="layui-hide" id="userdatagrid"
								lay-data="{id: 'userdatagrid'}" lay-filter="userTableFilter"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="iconAdd" style="display:none;padding:30px;">

		<div class="layui-row">
			<div class="layui-col-md4">
				<div class="layui-upload">
					<button type="button" class="layui-btn" id="test1">上传图片</button>
					<div class="layui-upload-list">
						<img class="layui-upload-img" id="demo1"
							style="width: 100px;height: 100px;">
						<p id="demoText"></p>
					</div>
				</div>
			</div>
			<div class="layui-col-md4">
				<div class="layui-form-item">
					<label for="icon_class" class="layui-form-label"> <span
						style="color:red">*</span>图标路径
					</label>
					<div class="layui-input-block">
						<input type="text" id="icon_class" name="icon_class"
							autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-col-md4">
				<div class="layui-form-item">
					<label for="icon_class" class="layui-form-label"> <span
						style="color:red">*</span>图标路径
					</label>
					<div class="layui-input-block">
						<input type="text" id="icon_class" name="icon_class"
							autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
		</div>
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
	layui
			.use(
					[ 'table', 'form', 'tree', 'layer', 'jquery', 'upload',
							'laydate', 'element' ],
					function() {
						var table = layui.table;
						var layer = layui.layer;
						var form = layui.form;
						var element = layui.element;
						var upload = layui.upload;
						var $ = layui.$;
						form.render();
						element.init();

						table
								.render({
									elem : '#userdatagrid',
									id : 'userdatagrid',
									url : basurl + 'user/find',
									limits : [ 10, 20, 30, 50, 100, 300, 600,
											1000 ],
									cols : [ [
											{
												field : 'id',
												type : 'checkbox'
											},
											{
												field : 'name',
												title : '用户名',
												align : 'left'
											},
											{
												field : 'username',
												title : '用户账号',
												align : 'left'
											},
											{
												field : 'password',
												title : '用户密码',
												align : 'left',
												width : 350
											},
											{
												field : 'sex',
												title : '性别',
												align : 'left',
												templet : function(d) {
													if (d.sex == 1) {
														return "女";
													} else {
														return "男";
													}
												}
											},
											{
												field : 'url',
												title : '头像',
												align : 'left',
												templet : function(d) {
													if (d.sex == 1) {
														return "<img src="+basurl+d.url+" class=\"layui-nav-img\">";
													} else {
														return "<img src="+basurl+d.url+" class=\"layui-nav-img\">";
													}
												}

											},
											{
												field : 'phone',
												title : '联系电话',
												align : 'left'
											},
											{
												field : 'email',
												title : '邮箱',
												align : 'left',
												width : 200
											},
											{
												field : 'status',
												title : '状态',
												align : 'left',
												templet : function(d) {
													if (d.status == 0) {
														return "启用";
													} else {
														return "<span style='color:red'>禁用</span>";
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
										signleSelect($, 'userdatagrid');
									}
								});

						//查询
						$(".search_btn").click(function() {
							table.reload('userdatagrid', {
								where : {
									username : $(".search_input").val()
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
							table.reload('userdatagrid', {
								where : {
									username : $(".search_input").val()
								},
								page : {
									curr : 1
								//重新从第 1 页开始
								}
							});
						});

						//新增
						$(".user_add").click(function() {
							addAndEdit([]);
						});
						//修改
						$(".user_edit").click(function() {
							var topData = table.checkStatus("userdatagrid");
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
						$(".user_del").click(function() {
							var topData = table.checkStatus("userdatagrid");
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
									url : basurl + "user/remove",
									method : 'get',
									data : {
										id : data[0].id,
									},
									success : function(r) {
										layer.closeAll();
										layer.msg("删除成功", {
											icon : 6
										});
										table.reload('userdatagrid', {
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
							var url = "amct_icon/addIcon";
							$("#icon_class").val("layui-icon ");
							$("#icon_name").val("");
							$("#icon_code").val("");
							$("#remark").val("");
							$("img").removeAttr('src');
							var id;
							if (data.length > 0) {
								$('#demo1').attr('src', basurl + data[0].url);
								url = "amct_icon/modify";
								$("#icon_class").val(data[0].icon_class);
								$("#icon_name").val(data[0].icon_name);
								$("#icon_code").val(data[0].icon_code);
								$("#remark").val(data[0].remark);
								id = data[0].id;
							}
							layui.layer
									.open({
										type : 1, //弹窗类型
										title : "操作菜单", //显示标题
										closeBtn : 1, //是否显示关闭按钮
										anim : 0,
										shade : 0.3,
										shadeClose : false, //显示模态窗口
										area : [ '500px', '400px' ], //宽高
										content : $('#iconAdd'),
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
															icon_class : $(
																	"#icon_class")
																	.val(),
															icon_name : $(
																	"#icon_name")
																	.val(),
															icon_code : $(
																	"#icon_code")
																	.val(),
															remark : $(
																	"#remark")
																	.val()
														},
														success : function(r) {
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
																				'icondatagrid',
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
															layer.close(add);
															layer.msg("操作失败", {
																icon : 5
															});
														}
													});
										}
									});
						}
					});
</script>
</html>

