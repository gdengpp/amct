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
					<div class="layui-col-md12">
						<div class="layui-form">
							<div class="layui-inline">
								<div class="layui-input-inline">
									<select name="user_name" id="user_name">

									</select>
								</div>
								<div class="layui-input-inline">
									<select name="menu_code" id="menu_code">

									</select>
								</div>
								<div class="layui-input-inline">
									<select name="status" id="status" lay-verify="required"
										lay-search="">
										<option value="" selected="selected">请选择日志状态</option>
										<option value="debug">debug</option>
										<option value="info">info</option>
										<option value="error">error</option>
									</select>
								</div>
								<div class="layui-btn-group">
									<a class="layui-btn layui-btn-primary search_btn"> <i
										class="layui-icon">&#xe615;</i>查询
									</a><a class="layui-btn layui-btn-primary resert_btn"> <i
										class="layui-icon">&#xe615;</i>重置
									</a> <a class="layui-btn layui-btn-primary resertAll_btn"> <i
										class="layui-icon">&#xe9aa;</i>清空
									</a>
								</div>
							</div>
						</div>
						<div class="layui-form icon_list">
							<table class="layui-hide" id="logdatagrid"
								lay-data="{id: 'logdatagrid'}" lay-filter="logTableFilter"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
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
						var $ = layui.$;
						form.render();
						element.init();

						table
								.render({
									elem : '#logdatagrid',
									id : 'logdatagrid',
									url : basurl + 'amct_log/find',
									limits : [ 10, 20, 30, 50, 100, 300, 600,
											1000 ],
									cols : [ [
											{
												field : 'id',
												type : 'checkbox'
											},
											{
												field : 'user_name',
												title : '操作人',
												width : '10%',
												align : 'left'
											},
											{
												field : 'menu_code',
												title : '菜单code',
												align : 'left',
												width : '10%'
											},
											{
												field : 'opt',
												title : '日志内容',
												align : 'left'
											},
											{
												field : 'status',
												title : '状态',
												align : 'left',
												width : '10%'
											},
											{
												field : 'log_date',
												title : '操作时间',
												align : 'left',
												width : '10%',
												templet : function(d) {
													return new Date(d.log_date)
															.Format("yyyy-MM-dd hh:mm:ss");
													;
												}
											},

									] ],
									page : true,
									done : function(res, curr, count) {
										$(".laytable-cell-checkbox").css(
												"padding", "5px");
										signleSelect($, 'logdatagrid');
									}
								});

						//查询
						$(".search_btn")
								.click(
										function() {
											table
													.reload(
															'logdatagrid',
															{
																where : {
																	user_name : $(
																			"#user_name option:selected")
																			.val(),
																	status : $(
																			"#status option:selected")
																			.val(),
																	menu_code : $(
																			"#menu_code option:selected")
																			.val(),
																},
																page : {
																	curr : 1
																//重新从第 1 页开始
																}
															});
										});

						//重置
						$(".resert_btn").click(function() {
							$("#user_name").val("");
							$("#status").val("");
							$("#menu_code").val("");
							form.render();
							table.reload('logdatagrid', {
								where : {
									user_name : "",
									status : "",
									menu_code : ""
								},
								page : {
									curr : 1
								//重新从第 1 页开始
								}
							});
						});

						$(".resertAll_btn").click(function() {
							$.ajax({
								url : basurl + 'amct_log/resertAll',
								method : 'get',
								success : function(tree) {
									$("#user_name").val("");
									$("#status").val("");
									$("#menu_code").val("");
									form.render();
									table.reload('logdatagrid', {
										where : {
											user_name : "",
											status : "",
											menu_code : ""
										},
										page : {
											curr : 1
										//重新从第 1 页开始
										}
									});
								},
								error : function() {

								}
							});
						});

						$(function() {
							$
									.ajax({
										url : basurl + 'amct_log/findUsername',
										method : 'get',
										success : function(tree) {
											var html = "<option value=\"\" selected=\"selected\">请选择操作人</option>";
											for (var i = 0; i < tree.length; i++) {
												html += "<option value="+tree[i]+">"
														+ tree[i] + "</option>";
											}
											$("#user_name").append(html);
											form.render();
										},
										error : function() {
											layer.msg("加载操作人下拉失败", {
												icon : 5
											});
										}
									});

							$
									.ajax({
										url : basurl + 'amct_log/findMenucode',
										method : 'get',
										success : function(tree) {
											var html = "<option value=\"\" selected=\"selected\">请选择菜单编码</option>";
											for (var i = 0; i < tree.length; i++) {
												html += "<option value="+tree[i]+">"
														+ tree[i] + "</option>";
											}
											$("#menu_code").append(html);
											form.render();
										},
										error : function() {
											layer.msg("加载操作人下拉失败", {
												icon : 5
											});
										}
									});
						});

						Date.prototype.Format = function(fmt) { //author: meizz 
							var o = {
								"M+" : this.getMonth() + 1, //月份 
								"d+" : this.getDate(), //日 
								"H+" : this.getHours(), //小时 
								"h+" : this.getHours(), //小时 
								"m+" : this.getMinutes(), //分 
								"s+" : this.getSeconds(), //秒 
								"q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
								"S" : this.getMilliseconds()
							//毫秒 
							};
							if (/(y+)/.test(fmt))
								fmt = fmt.replace(RegExp.$1, (this
										.getFullYear() + "")
										.substr(4 - RegExp.$1.length));
							for ( var k in o)
								if (new RegExp("(" + k + ")").test(fmt))
									fmt = fmt
											.replace(
													RegExp.$1,
													(RegExp.$1.length == 1) ? (o[k])
															: (("00" + o[k])
																	.substr(("" + o[k]).length)));
							return fmt;
						}
					});
</script>
</html>
