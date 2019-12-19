<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'mqTest.jsp' starting page</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/mqjs/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/mqjs/amq_jquery_adapter.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/mqjs/amq.js"></script>
</head>

<body>

</body>
<script type="text/javascript">
	$(function() {
	
		/*org.activemq.Amq.init({
			uri : '${pageContext.request.contextPath}/amq.do',
			logging : true,
			timeout : 20,
			clientId : (new Date()).getTime().toString()
		});
	});
	var myDestination = 'tcp://192.168.202.145:61616';//test.topic为topic的名称
	var massage = {
		rcvMessage : function(message) {
			console.log(message);
		}
	};

	//发送消息

	$("#sendBtn").click(function() {
		amq.sendMessage(myDestination, "<message name=msg/>");*/
	});
</script>
</html>
