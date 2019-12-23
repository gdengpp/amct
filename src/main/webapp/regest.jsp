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
		<div class="layui-row">
			<div class="layui-col-md10">
				<div class="layui-form-item">
					<label for="icon_class" class="layui-form-label">用户名： </label>
					<div class="layui-input-block">
						<input type="text" id="icon_class" name="icon_class" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="icon_class" class="layui-form-label">密码： </label>
					<div class="layui-input-block">
						<input type="text" id="icon_class" name="icon_class" class="layui-input">
					</div>
				</div>
			</div>
		</div>
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
	
</script>
</html>