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
									<input type="text" value="" placeholder="菜单名"
										class="layui-input search_input" />
								</div>
								<div class="layui-btn-group">
									<a class="layui-btn layui-btn-primary search_btn"> <i
										class="layui-icon">&#xe615;</i>查询
									</a><a class="layui-btn layui-btn-primary resert_btn"> <i
										class="layui-icon">&#xe615;</i>重置
									</a> <a class="layui-btn layui-btn-primary icon_add"> <i
										class="layui-icon">&#xe654;</i>新增
									</a> <a class="layui-btn layui-btn-primary icon_edit"> <i
										class="layui-icon">&#xe642;</i>修改
									</a> </a> <a class="layui-btn layui-btn-primary icon_del"> <i
										class="layui-icon">&#xe640;</i>删除
									</a>
								</div>
							</div>
						</div>
						<div class="layui-form icon_list">
							<table class="layui-hide" id="icondatagrid"
								lay-data="{id: 'icondatagrid'}" lay-filter="iconTableFilter"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="iconAdd" style="display:none;padding:30px;">
			<div class="layui-row">
				<div class="layui-col-md12">
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
			<div class="layui-row">
				<div class="layui-col-md12">
					<div class="layui-form-item">
						<label for="icon_name" class="layui-form-label"> <span
							style="color:red">*</span>图标名
						</label>
						<div class="layui-input-block">
							<input type="text" id="icon_name" name="icon_name"
								autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-md12">
					<div class="layui-form-item">
						<label for="icon_code" class="layui-form-label"> <span
							style="color:red">*</span>图标code
						</label>
						<div class="layui-input-block">
							<input type="text" id="icon_code" name="icon_code"
								autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-md12">
					<div class="layui-form-item">
						<label for="remark" class="layui-form-label">图标说明 </label>
						<div class="layui-input-block">
							<input type="text" id="remark" name="remark" autocomplete="off"
								class="layui-input">
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
	layui.use([ 'table', 'form', 'tree', 'layer', 'jquery', 'upload',
			'laydate', 'element' ], function() {
		var table = layui.table;
		var layer = layui.layer;
		var form = layui.form;
		var element = layui.element;
		var $ = layui.$;
		form.render();
		element.init();

		table.render({
			elem : '#icondatagrid',
			id : 'icondatagrid',
			url : basurl + 'amct_icon/query',
			limits : [ 10, 20, 30, 50, 100, 300, 600, 1000 ],
			cols : [ [ {
				field : 'id',
				type : 'checkbox'
			}, {
				field : 'icon_class',
				title : '图标路径',
				align : 'left'
			}, {
				field : 'icon_name',
				title : '图标名',
				align : 'left'
			}, {
				field : 'icon_code',
				title : '图标',
				align : 'left',
				templet : function(d) {
					return "<i class=\"layui-icon\">"+d.icon_code+"</i>";
				}
			}, {
				field : 'remark',
				title : '图标说明',
				align : 'left'
			},

			] ],
			page : true,
			done : function(res, curr, count) {
				$(".laytable-cell-checkbox").css("padding", "5px");
				signleSelect($, 'icondatagrid');
			}
		});

		//查询
		$(".search_btn").click(function() {
			table.reload('icondatagrid', {
				where : {
					icon_name : $(".search_input").val()
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
			table.reload('icondatagrid', {
				where : {
					icon_name : $(".search_input").val()
				},
				page : {
					curr : 1
				//重新从第 1 页开始
				}
			});
		});

		//新增
		$(".icon_add").click(function() {
			addAndEdit([]);
		});
		//修改
		$(".icon_edit").click(function() {
			var topData = table.checkStatus("icondatagrid");
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
		$(".icon_del").click(function() {
			var topData = table.checkStatus("icondatagrid");
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
					url : basurl + "amct_icon/remove",
					method : 'get',
					data : {
						id : data[0].id,
					},
					success : function(r) {
						layer.closeAll();
						layer.msg("删除成功", {
							icon : 6
						});
						table.reload('icondatagrid', {
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
			var id;
			if (data.length > 0) {
				url = "amct_icon/modify";
				$("#icon_class").val(data[0].icon_class);
				$("#icon_name").val(data[0].icon_name);
				$("#icon_code").val(data[0].icon_code);
				$("#remark").val(data[0].remark);
				id = data[0].id;
			}
			layui.layer.open({
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
				btn : [ "新增", "关闭" ],
				yes : function(index, layero) {
					var add = layer.load();
					$.ajax({
						url : basurl + url,
						method : 'get',
						data : {
							id : id,
							icon_class : $("#icon_class").val(),
							icon_name : $("#icon_name").val(),
							icon_code : $("#icon_code").val(),
							remark : $("#remark").val()
						},
						success : function(r) {
							if (r == 1) {
								layer.closeAll();
								layer.msg("操作成功", {
									icon : 6
								});
								table.reload('icondatagrid', {
									page : {
										curr : 1
									}
								});
							} else {
								layer.close(add);
								layer.msg("操作失败", {
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

