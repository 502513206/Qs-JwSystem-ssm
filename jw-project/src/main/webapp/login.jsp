<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/jquery-1.8.3.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/style.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/css/style_grey.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<style>
input[type=text] {
	width: 80%;
	height: 25px;
	font-size: 12pt;
	font-weight: bold;
	margin-left: 45px;
	padding: 3px;
	border-width: 0;
}

input[type=password] {
	width: 80%;
	height: 25px;
	font-size: 12pt;
	font-weight: bold;
	margin-left: 45px;
	padding: 3px;
	border-width: 0;
}

#codeInput {
	margin-left: 1px;
	margin-top: 1px;
}

#loginform\:vCode {
	margin: 0px 0 0 60px;
	height: 34px;
}
</style>
<script type="text/javascript">
	if (window.self != window.top) {
		window.top.location = window.location;
	}
</script>
</head>
<body>
	<div
		style="width: 900px; height: 50px; position: absolute; text-align: left; left: 50%; top: 50%; margin-left: -450px;; margin-top: -280px;">
		<img src="${pageContext.request.contextPath }/images/logo.png"
			style="border-width: 0; margin-left: 0;" /> <span
			style="float: right; margin-top: 35px; color: #488ED5;"></span>
	</div>
	<div class="main-inner" id="mainCnt"
		style="width: 900px; height: 440px; overflow: hidden; position: absolute; left: 50%; top: 50%; margin-left: -450px; margin-top: -180px; background: url('${pageContext.request.contextPath }/images/login_pic.png') no-repeat 0 0;">
		<div id="loginBlock" class="login" style="height: 255px;">
			<div class="loginFunc">
				<div id="lbNormal" class="loginFuncMobile">教务管理系统登录</div>
			</div>
			<div class="loginForm">
				<form id="loginform" name="loginform" method="post" class="niceform"
					action="${pageContext.request.contextPath }/login/home.action">
					<div id="idInputLine" class="loginFormIpt showPlaceholder"
						style="margin-top: 5px;">
						<input id="idInput" type="text" name="username"
							class="loginFormTdIpt" maxlength="50" /> <label for="idInput"
							class="placeholder" id="idPlaceholder">帐号：</label>
					</div>
					<div class="forgetPwdLine"></div>
					<div id="pwdInputLine" class="loginFormIpt showPlaceholder">
						<input id="pwdInput" class="loginFormTdIpt" type="password"
							name="password" value="" /> <label for="pwdInput"
							class="placeholder" id="pwdPlaceholder">密码：</label>
					</div>
					<div class="loginFormIpt loginFormIptWiotTh"
						style="margin-top: 58px;">
						<div id="codeInputLine" class="loginFormIpt showPlaceholder"
							style="margin-left: 0px; margin-top: -40px; width: 50px;">
							<input id="codeInput" class="loginFormTdIpt" type="text"
								name="checkcode" title="请输入验证码" /> <img id="loginform:vCode"
								src="${pageContext.request.contextPath }/validatecode.jsp"
								onclick="javascript:document.getElementById('loginform:vCode').src='${pageContext.request.contextPath }/validatecode.jsp?'+Math.random();" />
						</div>
						<a href="javascript:void(0)" id="login" name="loginform:j_id19">
							<span id="loginform:loginBtn" class="btn btn-login"
							style="margin-top: -36px;">登录</span>
						</a>
					</div>
					<div style="padding-left: 100px; margin-top: 10px">
						<tr align="center">
							<td><input id="RadioButtonList1_1" type="radio"
								name="RadioButtonList1" value="教师" tabindex="4" /><label
								for="RadioButtonList1_1">教师</label></td>
							<td><input id="RadioButtonList1_2" type="radio"
								name="RadioButtonList1" value="学生" tabindex="4" /><label
								for="RadioButtonList1_2">学生</label></td>
							<td><input id="RadioButtonList1_3" type="radio"
								name="RadioButtonList1" value="管理员" checked="checked"
								tabindex="4" /><label for="RadioButtonList1_3">管理员</label></td>
						</tr>
					</div>
					<div>
						<font color="red"> </font>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div
		style="width: 900px; height: 50px; position: absolute; text-align: left; left: 50%; top: 50%; margin-left: -450px;; margin-top: 120px;">
		<span style="color: #488ED5;">Author: zxw</span><span
			style="color: #488ED5; margin-left: 10px;">推荐浏览器（右键链接-目标另存为）：<a
			href="http://download.firefox.com.cn/releases/full/23.0/zh-CN/Firefox-full-latest.exe">360极速浏览器</a>
		</span><span style="margin-left: 250px; color: #488ED5;">教务管理系统</span>
	</div>
	<script type="text/javascript">
		$("#login")
				.click(
						function() {
							var url = "${pageContext.request.contextPath}/home.action";
							var username = $("#idInput").val();
							var password = $("#pwdInput").val();
							var checkcode = $("#codeInput").val();
							var RadioButtonList = $("input:checked").val();
							$
									.post(
											url,
											{
												"username" : username,
												"password" : password,
												"checkcode" : checkcode,
												"RadioButtonList1" : RadioButtonList
											},
											function(data) {
												var v1 = data.msg;
												var v2 = data.status;
												var v3 = data;
												if (data.status == 200) {
													location.href = "${pageContext.request.contextPath}/index.action";
												} else if (data.status == 101) {
													$.messager
															.alert(
																	"提示信息",
																	data.msg,
																	"warning",
																	function() {
																		window.location
																				.reload();
																	});
												} else if (data.status == 102) {
													$.messager
															.alert(
																	"提示信息",
																	data.msg,
																	"warning",
																	function() {
																		window.location
																				.reload();
																	});
												} else if (data.status == 114) {
													$.messager
															.alert(
																	"提示信息",
																	data.msg,
																	"warning",
																	function() {
																		window.location
																				.reload();
																	});
												}
											})
						});
	</script>

</body>
</html>