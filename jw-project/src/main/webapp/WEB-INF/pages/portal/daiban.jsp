<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<script type="text/javascript">
	$('#dg').datagrid({
		url:'datagrid_data.json',
		columns:[[
			{field:'code',title:'代码',width:100},
			{field:'name',title:'名称',width:100},
			{field:'price',title:'价格',width:100,align:'right'}
		]]
	}); </script>
<body>
<div style="padding: 10px;">
	<table class="easyui-datagrid" style="height: auto">
		<thead>
		<tr>
			<th data-options="field:'priority'">优先级</th>
			<th data-options="field:'state'">状态</th>
			<th data-options="field:'subject'">主题</th>
			<th data-options="field:'sender'">发送人</th>
			<th data-options="field:'senddate'">发送日期</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>重要</td>
			<td>未查看</td>
			<td>吉首大学</td>
			<td>xxx</td>
			<td>2019年10月18日</td>
		</tr>
		</tbody>
	</table>
</div>
</body>
</html>