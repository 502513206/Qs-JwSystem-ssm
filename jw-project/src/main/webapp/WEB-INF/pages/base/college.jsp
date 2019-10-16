<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/ztree/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/ext/portal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/default.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.portal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function doAdd() {
		//alert("增加...");
		$('#addStaffWindow').window("open");
	}

	function doView() {
		alert("查看...");
	}

	function doDelete() {
		var rows = $("#grid").datagrid("getSelections");
		if (rows.length == 0) {
			$.messager.alert("提示信息", "请选择要删除的记录", "error");
		} else {
			var array = new Array();
			for (var i = 0; i < rows.length; i++) {
				var id = rows[i].id;
				array.push(id);
			}
			var ids = array.join(",");
			/* window.location.href = "${pageContext.request.contextPath}/college/deleteCollege.action?ids="
					+ ids; */
			var url = "${pageContext.request.contextPath}/college/deleteCollege.action";
			$
					.post(
							url,
							{
								"ids" : ids
							},
							function(data) {
								if (data = 200) {
									window.location.href = "${pageContext.request.contextPath}/college/page.action";
									$.messager.alert("提示信息", "删除成功", "info");
								} else {
									$.messager.alert("提示信息", "删除失败", "info");
								}
							})
		}
	}

	function doRestore() {
		alert("将取派员还原...");
	}
	//工具栏
	var toolbar = [ {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	}, {
		id : 'button-delete',
		text : '作废',
		iconCls : 'icon-cancel',
		handler : doDelete
	}];
	// 定义列
	var columns = [ [ {
		field : 'id',
		title : '学院编号',
		width : 200,
		checkbox : true,
	}, {
		field : 'name',
		title : '学院名称',
		width : 200,
		align : 'center'
	}, {
		field : 'status',
		title : '学院状态',
		width : 200,
		align : 'center',
		formatter : function(data, row, index) {
			if (data == "0") {
				return "正在使用"
			} else {
				return "已作废";
			}
		}
	} ] ];

	$(function() {
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({
			visibility : "visible"
		});

		// 取派员信息表格
		$('#grid')
				.datagrid(
						{
							iconCls : 'icon-forward',
							fit : true,
							border : false,
							rownumbers : true,
							striped : true,
							pageList : [ 3, 5, 10 ],
							pagination : true,
							toolbar : toolbar,
							url : "${pageContext.request.contextPath}/college/pageQuery.action",
							idField : 'id',
							columns : columns,
							onDblClickRow : doDblClickRow
						});

		// 添加取派员窗口
		$('#addStaffWindow').window({
			title : '添加学院',
			width : 400,
			modal : true,
			shadow : true,
			closed : true,
			height : 400,
			resizable : false
		});

		$('#editStaffWindow').window({
			title : '修改学院',
			width : 400,
			modal : true,
			shadow : true,
			closed : true,
			height : 400,
			resizable : false
		});

	});

	function doDblClickRow(rowIndex, rowData) {
		$("#editStaffWindow").window("open");
		$("#editCollegeForm").form("load", rowData);
	}
</script>
</head>
<body class="easyui-layout" style="visibility: hidden;">
	<div region="center" border="false">
		<table id="grid"></table>
	</div>

	<div class="easyui-window" title="对学院进行添加或者修改" id="addStaffWindow"
		collapsible="false" minimizable="false" maximizable="false"
		style="top: 20px; left: 200px">
		<div region="north" style="height: 31px; overflow: hidden;"
			split="false" border="false">
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton"
					plain="true">保存</a>
				<script type="text/javascript">
					$("#save").click(function() {
						var r = $("#addCollegeForm").form("validate");
						if (r) {
							$("#addCollegeForm").submit();
						}
					});
				</script>
			</div>
		</div>

		<div region="center" style="overflow: auto; padding: 5px;"
			border="false">
			<form id="addCollegeForm" action="addCollege.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">学院信息</td>
					</tr>
					<!-- TODO 这里完善收派员添加 table -->
					<tr>
						<td>学院编号</td>
						<td><input type="text" name="id" class="easyui-validatebox"
							required="true" /></td>
					</tr>
					<tr>
						<td>学院名称</td>
						<td><input type="text" name="name" class="easyui-validatebox"
							required="true" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<!-- 修改学院信息 -->
	<div class="easyui-window" title="对学院进行添加或者修改" id="editStaffWindow"
		collapsible="false" minimizable="false" maximizable="false"
		style="top: 20px; left: 200px">
		<div region="north" style="height: 31px; overflow: hidden;"
			split="false" border="false">
			<div class="datagrid-toolbar">
				<a id="editSave" icon="icon-save" href="#" class="easyui-linkbutton"
					plain="true">保存</a>
				<script type="text/javascript">
					$("#editSave").click(function() {
						var r = $("#editCollegeForm").form("validate");
						if (r) {
							$("#editCollegeForm").submit();
						}
					});
				</script>
			</div>
		</div>

		<div region="center" style="overflow: auto; padding: 5px;"
			border="false">
			<form id="editCollegeForm" action="editCollege.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">学院信息</td>
					</tr>
					<!-- TODO 这里完善收派员添加 table -->
					<input type="hidden" name="id" />
					<input type="hidden" name="status" />
					<tr>
						<td>学院名称</td>
						<td><input type="text" name="name" class="easyui-validatebox"
							required="true" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>
