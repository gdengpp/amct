<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="index.jsp"></jsp:include>
<style type="text/css">
.login {
	width: 400px;
	height: 270px;
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
		<br />
		<br />
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
	layui.use([ 'layer' ], function() {
		var layer = layui.layer;
		$(".login_btn").click(function() {
			if (!$("#username").val()) {
				layer.msg("账号不能为空", {
					icon : 5
				});
				return false;
			}
			if (!$("#user_key").val()) {
				layer.msg("密码不能为空", {
					icon : 5
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
						layer.msg("账号或密码错误！", {
							icon : 5
						});
					} else {
						layer.msg("账号被禁用", {
							icon : 5
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
