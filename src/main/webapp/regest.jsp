<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="index.jsp"></jsp:include>
<style type="text/css">
.login {
	width: 500px;
	height: 550px;
	position: absolute;
	margin: 5% 35%;
	padding: 35px;
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	-webkit-box-shadow: #ccc 0px 0px 10px;
	-moz-box-shadow: #ccc 0px 0px 10px;
	box-shadow: #ccc 0px 0px 10px;
	color: white;
}

.regest_btn {
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
		<form class="layui-form" action="">
			<div class="layui-row">
				<div class="layui-col-md10">
					<div class="layui-form-item">
						<label for="name" class="layui-form-label">用户名称： </label>
						<div class="layui-input-block">
							<input type="text" id="name" name="name" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label for="username" class="layui-form-label"><span
							style="color:red">*</span>登录账号： </label>
						<div class="layui-input-block">
							<input type="text" id="username" name="username"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label for="user_key" class="layui-form-label"><span
							style="color:red">*</span>登录密码： </label>
						<div class="layui-input-block">
							<input type="password" id="user_key" name="user_key"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label for="sex" class="layui-form-label">性别： </label>
						<div class="layui-input-block">
							<input type="radio" name="sex" value="0" title="男"> <input
								type="radio" name="sex" value="1" title="女" checked="checked">
						</div>
					</div>
					<div class="layui-form-item">
						<label for="age" class="layui-form-label">年龄： </label>
						<div class="layui-input-block">
							<input type="text" id="age" name="age" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label for="phone" class="layui-form-label">联系电话： </label>
						<div class="layui-input-block">
							<input type="text" id="phone" name="phone" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label for="email" class="layui-form-label">email： </label>
						<div class="layui-input-block">
							<input type="text" id="email" name="email" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label for="remark" class="layui-form-label">说明： </label>
						<div class="layui-input-block">
							<input type="text" id="remark" name="remark" class="layui-input">
						</div>
					</div>
				</div>
			</div>
		</form>
		<div class="layui-row">
			<div class="layui-col-md10">
				<button
					class="layui-btn layui-btn-normal layui-btn-radius regest_btn">注册</button>
			</div>
		</div>

		<br /> <span style="margin-left: 46%;"><a href="login.jsp">
				已有账号，直接登录>>></a></span>
	</div>
</body>
<script type="text/javascript">
	layui.use([ 'form', 'tree', 'layer', 'jquery' ], function() {
		var layer = layui.layer;
		var form = layui.form;
		var $ = layui.$;
		form.render();
		$(".regest_btn").click(function() {
			if (!$("#username").val()) {
				layer.msg("登录账号不能为空", {
					icon : 5
				});
				return false;
			}
			if (!$("#user_key").val()) {
				layer.msg("登录密码不能为空", {
					icon : 5
				});
				return false;
			}
			var regest = layer.load();
			$.ajax({
				url : "${pageContext.request.contextPath}/login/regest",
				method : "get",
				data : {
					username : $("#username").val(),
					user_key : $("#user_key").val(),
					name : $("#name").val(),
					sex : $("input[name=sex]:checked").val(),
					age : $("#age").val(),
					phone : $("#phone").val(),
					email : $("#email").val(),
					remark : $("#remark").val()
				},
				timeout : 10 * 1000,
				success : function(r) {
					layer.close(regest);
					console.log(r == 1, "====");
					if (r == 1) {
						layer.msg("注册成功,请前往登录", {
							icon : 6
						});
					} else {
						layer.msg("注册失败,登录账号重复", {
							icon : 5
						});
					}
				},
				error : function() {
					layer.close(regest);
					layer.msg("注册失败，请刷新重试", {
						icon : 5
					});
				}
			});
		});
	});
</script>
</html>
