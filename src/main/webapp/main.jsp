<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<li class="layui-nav-item"><a href="javascript:;"> <img id="user_picture"
						src="${user.url }" class="layui-nav-img"> ${user.username }
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;">基本资料</a>
						</dd>
						<dd>
							<a href="javascript:;">修改密码</a>
						</dd>
						<dd>
							<a href="javascript:;">修改头像</a>
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
		
		
		
		<div class="layui-card">
			<div class="layui-card-header">角色信息</div>
			<div class="layui-card-body">
				<div class="layui-row" style="margin-left: 3%;">
							<form class="layui-form" action="">
					<div class="layui-row">
						<div class="layui-col-md4">
								<div class="layui-inline">
									<div class="layui-input-inline">
										<label class="layui-form-label">角色名称：</label>
										<div class="layui-form-mid layui-word-aux">${user.role.role_name }</div>
									</div>
								</div>
								</div>
								<div class="layui-col-md4">
								<div class="layui-inline">
									<div class="layui-input-inline">
										<label class="layui-form-label">角色编码：</label>
										<div class="layui-form-mid layui-word-aux">${user.role.role_code }</div>
									</div>
								</div>
								</div>
								<div class="layui-col-md4">
								<c:if test="${user.role.role_status==0 }">
									<div class="layui-inline">
										<div class="layui-input-inline">
											<label class="layui-form-label">角色状态：</label>
											<div class="layui-form-mid layui-word-aux">正常</div>
										</div>
									</div>
								</c:if>
								<c:if test="${user.role.role_status==1 }">
									<div class="layui-inline">
										<div class="layui-input-inline">
											<label class="layui-form-label">角色状态：</label>
											<div class="layui-form-mid layui-word-aux">异常</div>
										</div>
									</div>
								</c:if>
								</div>
						</div>
							</form>
					</div>
				</div>
			</div>
		</div>


	<div id="modifyPass" style="display:none;padding:10px;margin-left: -40px;">
		<form class="layui-form" action="">
		<div class="layui-row">
			<div class="layui-col-md12">
				<div class="layui-form-item">
					<label for="name" class="layui-form-label">新密码
					</label>
					<div class="layui-input-block">
						<input type="password" id="password" name="password"
							autocomplete="off" class="layui-input" placeholder="请输入新密码">
					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
		<div class="layui-col-md12">
				<div class="layui-form-item">
					<label for="username" class="layui-form-label">新密码
					</label>
					<div class="layui-input-block">
						<input type="password" id="newpassword" name="newpassword"
							autocomplete="off" class="layui-input" placeholder="请再次输入新密码">
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>


	<div id="modify_head_picture" style="display:none;padding:10px;margin-left: 26%;">
		<div class="layui-upload">
		  <div class="layui-upload-list">
		    <img class="layui-upload-img" src="${user.url }" style="width: 45%;" id="demo1">
		    <p id="demoText"></p>
		  </div>
		  <button type="button" class="layui-btn" id="test1">上传图片</button>
		</div>   
	</div>


	<div id="setUp" style="display:none;padding:10px;">
		<div class="layui-row">
			<div class="layui-col-md4">
				<div class="layui-upload">
				  <div class="layui-upload-list">
				    <img class="layui-upload-img" id="logo" style="width: 55%;">
				    <p id="setText"></p>
				  </div>
				  <button type="button" class="layui-btn" id="set">上传图片</button>
				</div>  
			</div>
			<div class="layui-col-md8">
				<form class="layui-form" action="">
					<div class="layui-row">
						<div class="layui-col-md12">
							<div class="layui-form-item">
								<label for="sysname" class="layui-form-label"><span style="color:red">*</span>系统名称
								</label>
								<div class="layui-input-block">
									<input type="text" id="sysname" name="sysname"
										autocomplete="off" class="layui-input">
								</div>
							</div>
						</div>
					</div>
					<div class="layui-row">
					<div class="layui-col-md12">
							<div class="layui-form-item">
								<label for="sysis_display" class="layui-form-label"><span style="color:red">*</span>是否显示
								</label>
								<div class="layui-input-block">
									<input type="radio" name="sysis_display" value="1" title="显示"
									checked="checked"> <input type="radio"
									name="sysis_display" value="0" title="隐藏">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>

<script>
	//JavaScript代码区域
	layui
			.use(
					[ 'element', 'layer' ,'upload','form'],
					function() {
						var element = layui.element;
						var layer = layui.layer;
						var upload = layui.upload;
						var form = layui.form;
						$(function() {
							$
									.ajax({
										url : "${pageContext.request.contextPath}/top_menu/findAll",
										method : 'get',
										success : function(r) {
										if(r==""){
											layer.msg("登录过期，请重新登录",{icon:5});
											location.href = "login.jsp";
											return false;
										}
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
										area : [ '700px', '480px' ], //宽高
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
								if (text == "设置") {
									layui.layer.open({
										type : 1, //弹窗类型
										title : "设置系统属性", //显示标题
										anim : 0,
										shade : 0.3,
										shadeClose : false, //显示模态窗口
										area : [ '500px', '270px' ], //宽高
										content : $('#setUp'),
										cancel : function(index, layero) {
											layer.close(index);
											return false;
										},
										success:function(){
											$.ajax({
												url : "${pageContext.request.contextPath}/logo/find",
												method : 'get',
												success : function(r) {
													$("#sysname").val(r.name);
													$("input[name='sysis_display'][value="+r.is_display+"]").prop('checked', true);
													$("#logo").attr('src',r.url);
													form.render();
												}
											});
											
											//上传图像
											var uploadInst = upload.render({
											    elem: '#set'
											    ,url: '${pageContext.request.contextPath}/logo/upload'
											    ,before: function(obj){
											      //预读本地文件示例，不支持ie8
											      obj.preview(function(index, file, result){
											        $('#logo').attr('src', result); //图片链接（base64）
											      });
											    }
											    ,done: function(res){
											      //如果上传失败
											      if(res.code > 0){
											        return layer.msg('上传失败');
											      }
											      //上传成功
											      layer.msg('上传成功,刷新页面查看');
											    }
											    ,error: function(){
											      //演示失败状态，并实现重传
											      var demoText = $('#setText');
											      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
											      demoText.find('.demo-reload').on('click', function(){
											        uploadInst.upload();
											      });
											    }
									  		});
										},
										btn : [ "提交", "关闭" ],
										yes : function(index, layero) {
											 var name = $("#sysname").val();
											 if(!name){
											 	layer.msg("系统名称不能为空",{icon:5});
											 	return false;
											 }
											 var modify = layer.load();
											 $.ajax({
											 	url : "${pageContext.request.contextPath}/logo/modifyBase",
												method : 'get',
												data:{
													name:name,
													is_display:$("input[name=sysis_display]:checked").val()
												},
												success : function(r) {
													layer.close(modify);
													if(r==1){
														layer.msg("修改成功",{icon:6});
													}else{
														layer.msg("修改失败",{icon:5});
													}
												}
											 });
											}
										});
								}
								if (text == "修改密码") {
									layui.layer.open({
										type : 1, //弹窗类型
										title : "修改密码", //显示标题
										anim : 0,
										shade : 0.3,
										shadeClose : false, //显示模态窗口
										area : [ '400px', '230px' ], //宽高
										content : $('#modifyPass'),
										cancel : function(index, layero) {
											layer.close(index);
											return false;
										},
										btn : [ "提交", "关闭" ],
										yes : function(index, layero) {
											var pass = $("#password").val();
											var newpass = $("#newpassword").val();
											if(!pass){
												layer.msg("密码不能为空",{icon:5});
												return false;
											}
											if(!newpass){
												layer.msg("再次输入密码不能为空",{icon:5});
												return false;
											}
											if(pass!=newpass){
												layer.msg("两次输入密码不相同",{icon:5});
												return false;
											}
											layer.load();
											$.ajax({
												url : "${pageContext.request.contextPath}/user/modifyPass",
												method : 'get',
												data:{
													key:pass
												},
												success : function(r) {
													layer.closeAll();
													if(r==1){
														layer.msg("修改成功,3秒后返回登录页面重新登录",{icon:6});
														 setTimeout(function () { 
														        location.href = "${pageContext.request.contextPath}/login/loginout";
														    }, 3*1000);
													}
												}
											});
										}
									});
								}
								if (text == "修改头像") {
									
									layui.layer.open({
										type : 1, //弹窗类型
										title : "修改头像", //显示标题
										anim : 0,
										shade : 0.3,
										shadeClose : false, //显示模态窗口
										area : [ '300px', '270px' ], //宽高
										content : $('#modify_head_picture'),
										cancel : function(index, layero) {
											layer.close(index);
											return false;
										},
										success:function(){
											 //普通图片上传
									  var uploadInst = upload.render({
											    elem: '#test1'
											    ,url: '${pageContext.request.contextPath}/user/upload'
											    ,before: function(obj){
											      //预读本地文件示例，不支持ie8
											      obj.preview(function(index, file, result){
											        $('#demo1').attr('src', result); //图片链接（base64）
											      });
											    }
											    ,done: function(res){
											      //如果上传失败
											      if(res.code > 0){
											        return layer.msg('上传失败');
											      }
											      //上传成功
											      layer.msg('上传成功,刷新页面查看');
											    }
											    ,error: function(){
											      //演示失败状态，并实现重传
											      var demoText = $('#demoText');
											      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
											      demoText.find('.demo-reload').on('click', function(){
											        uploadInst.upload();
											      });
											    }
									  		});
										},
										});


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