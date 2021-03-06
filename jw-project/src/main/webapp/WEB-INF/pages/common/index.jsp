<%@page import="JW.listener.SessionListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教务管理系统</title>
<!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/default.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<!-- 导入ztree类库 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/js/ztree/zTreeStyle.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath }/js/ztree/jquery.ztree.all-3.5.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/javascript">
	// 初始化ztree菜单
	$(function() {
		var setting = {
			data : {
				simpleData : { // 简单数据
					enable : true
				}
			},
			callback : {
				onClick : onClick
			}
		};

		// 基本功能菜单加载
		$
				.ajax({
					url : '${pageContext.request.contextPath}/function/findMenu.action',
					type : 'POST',
					dataType : 'text',
					success : function(data) {
						var zNodes = eval("(" + data + ")");
						$.fn.zTree.init($("#treeMenu"), setting, zNodes);
					},
					error : function(msg) {
						alert('菜单加载异常!');
					}
				});

		// 系统管理菜单加载
		$.ajax({
			url : '${pageContext.request.contextPath}/json/admin.json',
			type : 'POST',
			dataType : 'text',
			success : function(data) {
				var zNodes = eval("(" + data + ")");
				$.fn.zTree.init($("#adminMenu"), setting, zNodes);
			}
		});

		$("#btnCancel").click(function() {
			$('#editPwdWindow').window('close');
		});
	});

	function onClick(event, treeId, treeNode, clickFlag) {
		// 判断树菜单节点是否含有 page属性
		if (treeNode.page != undefined && treeNode.page != "") {
			if ($("#tabs").tabs('exists', treeNode.name)) {// 判断tab是否存在
				$('#tabs').tabs('select', treeNode.name); // 切换tab
			} else {
				// 开启一个新的tab页面
				var content = '<div style="width:100%;height:100%;overflow:hidden;">'
						+ '<iframe src="'
						+ treeNode.page
						+ '" scrolling="auto" style="width:100%;height:100%;border:0;" ></iframe></div>';

				$('#tabs').tabs('add', {
					title : treeNode.name,
					content : content,
					closable : true
				});
			}
		}
	}

	/*******顶部特效 *******/
	/**
	 * 更换EasyUI主题的方法
	 * @param themeName
	 * 主题名称
	 */
	changeTheme = function(themeName) {
		var $easyuiTheme = $('#easyuiTheme');
		var url = $easyuiTheme.attr('href');
		var href = url.substring(0, url.indexOf('themes')) + 'themes/'
				+ themeName + '/easyui.css';
		$easyuiTheme.attr('href', href);
		var $iframe = $('iframe');
		if ($iframe.length > 0) {
			for (var i = 0; i < $iframe.length; i++) {
				var ifr = $iframe[i];
				$(ifr).contents().find('#easyuiTheme').attr('href', href);
			}
		}
	};
	// 退出登录
	function logoutFun() {
		$.messager
				.confirm(
						'系统提示',
						'您确定要退出本次登录吗?',
						function(isConfirm) {
							if (isConfirm) {
								location.href = '${pageContext.request.contextPath }/logout.action';
							}
						});
	}
	// 修改密码
	function editPassword() {
		$('#editPwdWindow').window('open');
	}
	// 版权信息
	function showAbout() {
		$.messager.alert("教务管理系统 v1.0", "管理员邮箱: 502513206@qq.com");
	}
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false"
		style="height: 80px; padding: 10px; background: url('./images/header_bg.png') no-repeat right;">
		<div>
			<img src="${pageContext.request.contextPath }/images/logo_jw.png"
				border="0">
		</div>
		<div id="sessionInfoDiv"
			style="position: absolute; right: 5px; top: 10px;"></div>
		<div style="position: absolute; right: 5px; bottom: 10px;">
			<a href="javascript:void(0);" class="easyui-menubutton"
				data-options="menu:'#layout_north_pfMenu',iconCls:'icon-ok'">更换皮肤</a>
			<a href="javascript:void(0);" class="easyui-menubutton"
				data-options="menu:'#layout_north_kzmbMenu',iconCls:'icon-help'">控制面板</a>
		</div>
		<div id="layout_north_pfMenu" style="width: 120px; display: none;">
			<div onclick="changeTheme('default');">default</div>
			<div onclick="changeTheme('gray');">gray</div>
			<div onclick="changeTheme('black');">black</div>
			<div onclick="changeTheme('bootstrap');">bootstrap</div>
			<div onclick="changeTheme('metro');">metro</div>
		</div>
		<div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
			<div onclick="editPassword();">修改密码</div>
			<div onclick="showAbout();">联系管理员</div>
			<div class="menu-sep"></div>
			<div onclick="logoutFun();">退出系统</div>
		</div>
	</div>
	<div data-options="region:'west',split:true,title:'菜单导航'"
		style="width: 200px">
		<div class="easyui-accordion" fit="true" border="false">
			<div title="基本功能" data-options="iconCls:'icon-mini-add'"
				style="overflow: auto">
				<ul id="treeMenu" class="ztree"></ul>
			</div>
			<div title="系统管理" data-options="iconCls:'icon-mini-add'"
				style="overflow: auto">
				<ul id="adminMenu" class="ztree"></ul>
			</div>
		</div>
	</div>
	<div data-options="region:'center'">
		<div id="tabs" fit="true" class="easyui-tabs" border="false">
			<div title="消息中心" id="subWarp"
				style="width: 100%; height: 100%; overflow: hidden">
				<iframe src="${pageContext.request.contextPath }/portal/home.action"
					style="width: 100%; height: 100%; border: 0;"></iframe>
				<%--				这里显示公告栏--%>
			</div>
		</div>
	</div>
	<div data-options="region:'south',border:false"
		style="height: 50px; padding: 10px; background: url('./images/header_bg.png') no-repeat right;">
		<table style="width: 100%;">
			<tbody>
				<tr>
					<td style="width: 300px;">
						<div style="color: #999; font-size: 8pt;">
							Author: 朱小威 | Powered by <a href="#g">zxw</a>
						</div>
					</td>
					<td style="width: *;" class="co1"><span id="online"
						style="background: url(${pageContext.request.contextPath }/images/online.png) no-repeat left;padding-left:18px;margin-left:3px;font-size:8pt;color:#005590;">在线人数:${onlinePeople }</span>
					</td>
				</tr>
				<tr></tr>
				<tr>
					<td style="width: 300px;">
						<div style="color: #999; font-size: 8pt;"></div>
					</td>
					<td style="width: *;" class="co1"><span id="onlineIp"
						style="background: url(${pageContext.request.contextPath }/images/online.png) no-repeat left;padding-left:18px;margin-left:3px;font-size:8pt;color:#005590;">你本次登录IP地址为:</span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!--修改密码窗口-->
	<div id="editPwdWindow" class="easyui-window" title="修改密码"
		collapsible="false" minimizable="false" modal="true" closed="true"
		resizable="false" maximizable="false" icon="icon-save"
		style="width: 300px; height: 160px; padding: 5px; background: #fafafa">
		<div class="easyui-layout" fit="true">
			<div region="center" border="false"
				style="padding: 10px; background: #fff; border: 1px solid #ccc;">
				<form id="editPasswordForm">
					<table cellpadding=3>
						<tr>
							<td>新密码：</td>
							<td><input id="txtNewPass" type="Password"
								class="txt01 easyui-validatebox" required="true"
								data-options="validType:'length[4,8]'" /></td>
						</tr>
						<tr>
							<td>确认密码：</td>
							<td><input id="txtRePass" type="Password"
								class="txt01 easyui-validatebox" required="true"
								data-options="validType:'length[4,8]'" /></td>
						</tr>
					</table>
				</form>
			</div>
			<div region="south" border="false"
				style="text-align: right; height: 30px; line-height: 30px;">
				<a id="btnEp" class="easyui-linkbutton" icon="icon-ok"
					href="javascript:void(0)">确定</a> <a id="btnCancel"
					class="easyui-linkbutton" icon="icon-cancel"
					href="javascript:void(0)">取消</a>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#btnEp")
				.click(
						function() {
							var v = $("#editPasswordForm").form("validate");
							if (v) {
								var v1 = $("#txtNewPass").val();
								var v2 = $("#txtRePass").val();
								if (v1 == v2) {
									var url = '${pageContext.request.contextPath}/user/editPassword.action'
									$.post(url, {
										"password" : v1
									}, function(data) {
										if (data == "1") {
											$.messager.alert("提示信息", "密码修改成功",
													"info");
										} else {
											$.messager.alert("提示信息", "密码修改错误",
													"error");
										}
										$("#editPwdWindow").window("close");
									});
								} else {
									$.messager.alert("提示信息", "两次输入的密码长度不一样！",
											"warning");
								}
							}
						});
	</script>
	<script type="text/javascript">
		var a = returnCitySN["cip"] + ',' + returnCitySN["cname"]
		$("#onlineIp").append(a);
	</script>

	<script type="text/javascript">
		window.setInterval(countNum, 5000);
		function countNum() {
			<%
			Integer people = (Integer) application.getAttribute("onlinePeople");
			int i=0;
			i++;
			%>
			$.ajax({
				url : '${pageContext.request.contextPath}/onlinePeople.action',
				type : 'GET',
				success : function(data) {
					$("#online").html("在线人数:"+data);
				}
			});
		}
		
		//var _beforeUnload_time = 0, _gap_time = 0;
		/* $(window).unload(function() {
			var n = window.event.screenX - window.screenLeft;
			var b = n > document.documentElement.scrollWidth - 20;
			$.ajax({
				url : '${pageContext.request.contextPath}/logout.action',
				type : 'GET',
				success : function(data) {

				}
			});
		}); */
	</script>
	
	<%--<script>
		var websocket = null;
	    //判断当前浏览器是否支持WebSocket
	    if ('WebSocket' in window) {
	        websocket = new WebSocket("ws://localhost:8080/websocket");
	    }
	    else {
	        alert('当前浏览器 Not support websocket')
	    }
	    
	    //连接发生错误的回调方法
	    websocket.onerror = function () {
	        setMessageInnerHTML("WebSocket连接发生错误");
	    };

	    //连接成功建立的回调方法
	    websocket.onopen = function () {
	        setMessageInnerHTML("WebSocket连接成功");
	    }

	    //接收到消息的回调方法
	    websocket.onmessage = function (event) {
	        setMessageInnerHTML(event.data);
	    }

	    //连接关闭的回调方法
	    websocket.onclose = function () {
	        setMessageInnerHTML("WebSocket连接关闭");
	    }

	    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	    window.onbeforeunload = function () {
	        closeWebSocket();
	    }

	    //将消息显示在网页上
	    function setMessageInnerHTML(innerHTML) {
	    	// alert(innerHTML);
	    	$("#online").html("在线人数:")
	    }

	    //关闭WebSocket连接
	    function closeWebSocket() {
	        websocket.close();
	    }

	</script>--%>
</body>
</html>