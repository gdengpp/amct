<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="index.jsp"></jsp:include>
<style type="text/css">
.login {
	width: 400px;
	height: 250px;
	position: absolute;
	margin: 15% 40%;
	padding: 35px;
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	-webkit-box-shadow: #ccc 0px 0px 10px;
	-moz-box-shadow: #ccc 0px 0px 10px;
	box-shadow: #ccc 0px 0px 10px;
	color: white;
}

.login_btn {
	width: 84%;
	margin-left: 20%;
}

a:link {
	color: white;
}

a:visited {
	color: white;
}

h2 {
	text-align: -webkit-center;
	font-family: cursive;
	font-size: 35px;
}
</style>
</head>

<body style="background-color: #393d49;">
	<div class="login">
		<h2>
			<b>自动配置系统</b>
		</h2>
		<br /> <br />
		<div class="layui-row">
			<div class="layui-col-md10">
				<div class="layui-form-item">
					<label for="icon_class" class="layui-form-label">用户名： </label>
					<div class="layui-input-block">
						<input type="text" id="username" name="username"
							class="layui-input">
					</div>
				</div>
				<br />
				<div class="layui-form-item">
					<label for="icon_class" class="layui-form-label">密码： </label>
					<div class="layui-input-block">
						<input type="password" id="user_key" name="user_key"
							class="layui-input">
					</div>
				</div>
			</div>
		</div>
		<br />
		<div class="layui-row">
			<div class="layui-col-md10">
				<button
					class="layui-btn layui-btn-normal layui-btn-radius login_btn">登录</button>
			</div>
		</div>

		<!--20191225 注释掉注册，不需要注册
		<br /> <span style="margin-left: 46%;"><a href="regest.jsp">
				没有用户？创建用户>>></a></span> -->
	</div>
</body>
<script type="text/javascript">
	//回车搜索
	$(document)
			.keyup(
					function(event) {
						if (event.keyCode == 13) {
							let
							is_shade = $(".layui-layer-shade").length;
							let
							btns = [ ".login_btn", [] ];
							let
							btn = btns[0];
							let
							l = 0;
							for ( var i in btns[1]) {
								if ($(btns[1][i]).parents(".layui-layer-page").length != 0) {
									let
									layer_num = parseInt(("" + $(btns[1][i])
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
	layui.use([ 'layer' ], function() {
		var layer = layui.layer;
		$(".login_btn").click(function() {
			if (!$("#username").val()) {
				layer.open({
					title : '提示信息',
					offset : 'rb',
					time : 2000,
					anim : 2,
					content : '账号不能为空'
				});
				return false;
			}
			if (!$("#user_key").val()) {
				layer.open({
					title : '提示信息',
					offset : 'rb',
					time : 2000,
					anim : 2,
					content : '密码不能为空'
				});
				return false;
			}
			var login = layer.load();
			$.ajax({
				url : "${pageContext.request.contextPath}/login/login",
				method : "get",
				data : {
					username : $("#username").val(),
					user_key : $("#user_key").val(),
				},
				timeout : 10 * 1000,
				success : function(r) {
					layer.close(login);
					if (r == "success") {
						layer.msg("登录成功，即将跳转", {
							icon : 6
						});
						location.href = "main.jsp";
					} else if (r == "fail") {
						layer.open({
							title : '提示信息',
							offset : 'rb',
							time : 2000,
							anim : 2,
							content : '账号或密码错误！'
						});
					} else {
						layer.open({
							title : '提示信息',
							offset : 'rb',
							time : 2000,
							anim : 2,
							content : '账号被禁用'
						});
					}

				},
				error : function() {
					layer.close(login);
					layer.msg("登录失败，请刷新重试", {
						icon : 5
					});
				}
			});
		});
	});
</script>
</html>
