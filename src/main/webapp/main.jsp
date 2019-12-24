<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<jsp:include page="index.jsp"></jsp:include>
<title></title>
<style type="text/css">
.foot {
	text-align: -webkit-center;
}
</style>
</head>

<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo sys_name"></div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left top_menu" lay-filter="top_nav">

			</ul>
			<ul class="layui-nav layui-layout-right top_right"
				lay-filter="top_right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="${user.url }" class="layui-nav-img"> ${user.username }
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;">基本资料</a>
						</dd>
						<dd>
							<a href="javascript:;">设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item loginout"><a href="javascript:;">退了</a></li>

			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree left_menu" lay-filter="left_nav">

				</ul>
			</div>
		</div>

		<div class="layui-body" style="padding: 10px;">
			<!-- 内容主体区域 -->
			<span class="dbody"></span>
		</div>

		<div class="layui-footer foot">
			<!-- 底部固定区域 -->

		</div>
	</div>

	<!-- 用户基本资料展示 -->

	<div id="userInfo" style="display:none;padding:10px;">
		<div class="layui-card">
			<div class="layui-card-header">基本信息</div>
			<div class="layui-card-body">
				<div class="layui-row" style="margin-left: 3%;">
					<div class="layui-row">
						<div class="layui-col-md6">
							<form class="layui-form" action="">
								<div class="layui-inline">
									<div class="layui-input-inline">
										<label class="layui-form-label">用户名：</label>
										<div class="layui-form-mid layui-word-aux" id="user_name">${user.name }</div>
									</div>
								</div>
								<br />
								<div class="layui-inline">
									<div class="layui-input-inline">
										<label class="layui-form-label">登录名：</label>
										<div class="layui-form-mid layui-word-aux" id="user_username">${user.username }</div>
									</div>
								</div>
								<br />
								<div class="layui-inline">
									<div class="layui-input-inline">
										<label class="layui-form-label">性别：</label>
										<div class="layui-form-mid layui-word-aux" id="sex">${user.sex }</div>
									</div>
								</div>
							</form>
						</div>
						<div class="layui-col-md6">
							<form class="layui-form" action="">
								<div class="layui-inline">
									<div class="layui-input-inline">
										<label class="layui-form-label">电话/手机：</label>
										<div class="layui-form-mid layui-word-aux" id="user_phone">${user.phone }</div>
									</div>
								</div>
								<br />
								<div class="layui-inline">
									<div class="layui-input-inline">
										<label class="layui-form-label">邮箱：</label>
										<div class="layui-form-mid layui-word-aux" id="user_email">${user.email }</div>
									</div>
								</div>
								<br />
								<div class="layui-inline">
									<div class="layui-input-inline">
										<label class="layui-form-label">年龄：</label>
										<div class="layui-form-mid layui-word-aux" id="age">${user.age }</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="layui-row">
						<div class="layui-col-md12">
							<form class="layui-form" action="">
								<div class="layui-inline">
									<div class="layui-input-inline">
										<label class="layui-form-label">说明：</label>
										<div class="layui-form-mid layui-word-aux" id="user_remark">${user.remark }</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	//JavaScript代码区域
	layui
			.use(
					[ 'element', 'layer' ],
					function() {
						var element = layui.element;
						var layer = layui.layer;
						$(function() {
							$
									.ajax({
										url : "${pageContext.request.contextPath}/top_menu/findAll",
										method : 'get',
										success : function(r) {
											var headHtml = "";
											for (var i = 1; i < r.length; i++) {
												if (r[i].is_display == 1) {
													//头部菜单
													headHtml += "<li class='layui-nav-item'><a href='javascript:;' name="+r[i].url+"><span>"
															+ r[i].name
															+ "</span></a>";
													headHtml += "</li>";
												}
												;
											}
											;
											if (r[0].is_display == 1) {
												headHtml += "<li class='layui-nav-item'><a href='javascript:;' name="+r[0].url+"><span>"
														+ r[0].name
														+ "</span></a>";
												headHtml += "</li>";
											}
											$(".top_menu").html(headHtml);
											element.render();

											//头部菜单结束================================================

											/*
												获取到第一个菜单，加载出左侧菜单
											 */
											$(".layui-layout-left")
													.find("li a")[0].click();
											var firstname = $(
													".layui-layout-left").find(
													"a span")[0].innerText;
											var leftHtml = "";
											for (var i = 0; i < r.length; i++) {
												if (firstname == r[i].name) {
													var bodyhtml = "<iframe src="
															+ r[i].url
															+ " frameborder='0' scrolling='no' style='width: 100%;height: 98%;'></iframe>";
													$(".dbody").html(bodyhtml);
												}
												if (r[i].leftmenu.length > 0) {
													var leftMenu = r[i].leftmenu;
													if (firstname == r[i].name) {
														//左侧菜单
														for (var f = 0; f < leftMenu.length; f++) {
															if (leftMenu[f].is_display == 1) {
																leftHtml += "<li class='layui-nav-item layui-nav-itemed'><a href='javascript:;' name="+leftMenu[f].url+"><i class='layui-icon'>"
																		+ leftMenu[f].icon
																		+ "</i>&nbsp;&nbsp;"
																		+ leftMenu[f].name
																		+ "</a>";
																if (leftMenu[f].child.length) {
																	var fchild = leftMenu[f].child;
																	leftHtml += "<dl class='layui-nav-child'>";
																	for (var c = 0; c < fchild.length; c++) {
																		leftHtml += "<dd><a href='javascript:;' name="+fchild[c].url+"><i class='layui-icon'>"
																				+ fchild[c].icon
																				+ "</i>&nbsp;&nbsp;"
																				+ fchild[c].name
																				+ "</a></dd>";
																	}
																	leftHtml += "</dl>";
																}
																leftHtml += "</li>";
															}
														}
													}
													$(".left_menu").html(
															leftHtml);
													element.render();
												}
											}

											element
													.on(
															'nav(top_nav)',
															function(elem) {
																var leftHtml = "";
																var bodyhtml = "<iframe src="
																		+ elem[0].name
																		+ " frameborder='0' scrolling='no' style='width: 100%;height: 98%;'></iframe>";
																$(".dbody")
																		.html(
																				bodyhtml);
																for (var i = 0; i < r.length; i++) {
																	if (r[i].leftmenu.length > 0) {
																		var leftMenu = r[i].leftmenu;
																		if (elem
																				.text() == r[i].name) {
																			//左侧菜单
																			for (var f = 0; f < leftMenu.length; f++) {
																				if (leftMenu[f].is_display == 1) {
																					leftHtml += "<li class='layui-nav-item layui-nav-itemed'><a href='javascript:;' name="+leftMenu[f].url+"><i class='layui-icon'>"
																							+ leftMenu[f].icon
																							+ "</i>&nbsp;&nbsp;"
																							+ leftMenu[f].name
																							+ "</a>";
																					if (leftMenu[f].child.length) {
																						var fchild = leftMenu[f].child;
																						leftHtml += "<dl class='layui-nav-child'>";
																						for (var c = 0; c < fchild.length; c++) {
																							leftHtml += "<dd><a href='javascript:;' name="+fchild[c].url+"><i class='layui-icon'>"
																									+ fchild[c].icon
																									+ "</i>&nbsp;&nbsp;"
																									+ fchild[c].name
																									+ "</a></dd>";
																						}
																						leftHtml += "</dl>";
																					}
																					leftHtml += "</li>";
																				}
																			}
																		}
																	}
																}
																$(".left_menu")
																		.html(
																				leftHtml);
																element
																		.render();
															});
											//左侧菜单结束================

											//左侧菜单点击开始
											element
													.on(
															'nav(left_nav)',
															function(elem) {
																if (elem[0].name) {
																	var bodyhtml = "<iframe src="
																			+ elem[0].name
																			+ " frameborder='0' scrolling='no' style='width: 100%;height: 98%;'></iframe>";
																	$(".dbody")
																			.html(
																					bodyhtml);
																}
															});
										}
									});
							/*
								获取logo细信息
							 */
							$
									.ajax({
										url : '${pageContext.request.contextPath}/top_menu/logo',
										method : 'get',
										success : function(r) {
											document.title = r.name;
											var logoHtml = "<image src='${pageContext.request.contextPath}/"+r.url+"' class='layui-nav-img'/><span>"
													+ r.name + "</span>";
											$(".sys_name").html(logoHtml);
											$(".foot").text(
													"@  " + r.name + " 版权所有");
										}

									});
							/*
								获取头部右侧信息
							 */
							element.on('nav(top_right)', function(elem) {
								var text = elem.text();
								if (text == "基本资料") {
									layui.layer.open({
										type : 1, //弹窗类型
										title : "用户基本信息", //显示标题
										anim : 0,
										shade : 0.3,
										shadeClose : false, //显示模态窗口
										area : [ '600px', '400px' ], //宽高
										content : $('#userInfo'),
										cancel : function(index, layero) {
											layer.close(index)
											return false;
										},
										btn : [ '关闭' ] //只是为了演示
										,
										btn1 : function() {
											layer.closeAll();
										}
									});
								}
								console.log(elem)
								if (text == "设置") {
									layer.msg("您点击了设置，这里修改logog信息，上传logo图片");
								}
							});
							//点击退了
							$(".loginout").click(function() {
								layer.confirm('确定注销本次登陆？', {
									icon : 3,
									title : '提示'
								}, function(index) {
									location.href = "${pageContext.request.contextPath}/login/loginout";
								});
							});
						});
					});
</script>
</html>