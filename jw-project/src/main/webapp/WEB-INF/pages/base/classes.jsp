<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <script src="${pageContext.request.contextPath }/js/custom.box.main.js"
            type="text/javascript"></script>
    <script
            src="${pageContext.request.contextPath }/js/jquery.ocupload-1.1.2.js"
            type="text/javascript"></script>
    <script type="text/javascript">
        function doAdd() {
            var rows = $("#grid").datagrid("getSelected");
            if (rows == null) {
                $.messager.alert("提示信息", "您还没有选择班级", "warning");
            } else {
                var ids = rows.id;
                createmodalwindow("班级管理", 1260, 600,
                    '${pageContext.request.contextPath}/classes/findById.action?ids='
                    + ids)
            }
        }

        function doExportXlsModel() {
            window.location.href = "${pageContext.request.contextPath}/student/exportXlsModel.action";
        }

        function doImportXlsStudent() {
            var rows = $("#grid").datagrid("getSelected");
            if (rows == null) {
                $.messager.alert("提示信息", "请选择一个班级", "warning");
            } else {
                $(function () {
                    $("#button-importXlsStudent")
                        .upload(
                            {
                                action: '${pageContext.request.contextPath}/student/importXlsStudent.action?cid='
                                    + rows.id,
                                name: 'myFile',
                                onComplete: function (data) {
                                    if (data == '1') {
                                        $.messager.alert("提示信息", "导入成功！",
                                            "info");
                                    } else {
                                        $.messager.alert("提示信息", "导入失败！",
                                            "warning");
                                    }
                                }
                            });
                });
            }
        }

        function doExportXlsStudent() {
            var rows = $("#grid").datagrid("getSelected");
            if (rows == null) {
                $.messager.alert("提示信息", "请选择一个班级", "warning");
            } else {
                window.location.href = "${pageContext.request.contextPath}/student/exportXlsStudent.action?cid="
                    + rows.id;
            }
        }

        function doDelete() {
            var rows = $("#grid").datagrid("getSelected");
            if (rows.length == 0) {
                $.messager.alert("提示信息", "请选择要删除的记录", "error");
            } else {
                var ids = rows.id;
                window.location.href = "${pageContext.request.contextPath}/specialty/delete?ids="
                    + ids;
            }
        }

        function doView() {
            $("#editStaffWindow").window("open");
        }

        //工具栏
        var toolbar = [{
            id: 'button-add',
            text: '添加班级',
            iconCls: 'icon-add',
            handler: doView
        }, {
            id: 'button-add',
            text: '查询学生',
            iconCls: 'icon-add',
            handler: doAdd
        }, {
            id: 'button-exportXlsModel',
            text: '导出模板',
            iconCls: 'icon-redo',
            handler: doExportXlsModel
        }, {
            id: 'button-importXlsStudent',
            text: '导入学生',
            iconCls: 'icon-redo',
            handler: doImportXlsStudent
        }, {
            id: 'button-exportXlsStudent',
            text: '导出学生',
            iconCls: 'icon-redo',
            handler: doExportXlsStudent
        }];
        // 定义列
        var columns = [[{
            field: 'id',
            title: '课程编号',
            width: 230,
            checkbox: true
        }, {
            field: 'collegeName',
            title: '学院名称',
            width: 230,
            align: 'center',
            formatter: function (data, row, index) {
                return row.tSpecialty.college.name;
            }
        }, {
            field: 'specialtyName',
            title: '专业名称',
            width: 230,
            align: 'center',
            formatter: function (data, row, index) {
                return row.tSpecialty.name;
            }
        }, {
            field: 'classname',
            title: '班级名称',
            width: 230,
            align: 'center'
        }]];

        $(function () {
            // 先将body隐藏，再显示，不会出现页面刷新效果
            $("body").css({
                visibility: "visible"
            });

            // 取派员信息表格
            $('#grid')
                .datagrid(
                    {
                        iconCls: 'icon-forward',
                        fit: true,
                        border: false,
                        rownumbers: true,
                        striped: true,
                        singleSelect: true,
                        pageList: [30, 50, 100],
                        pagination: true,
                        toolbar: toolbar,
                        url: "${pageContext.request.contextPath}/classes/pageQuery.action",
                        idField: 'id',
                        columns: columns,
                        onDblClickRow: doDblClickRow
                    });

            // 添加取派员窗口
            $('#importStudent').window({
                title: '添加班级',
                width: 400,
                modal: true,
                shadow: true,
                closed: true,
                height: 400,
                resizable: false
            });

            $('#editStaffWindow').window({
                title: '添加班级',
                width: 400,
                modal: true,
                shadow: true,
                closed: true,
                height: 400,
                resizable: false
            });

        });

        function doDblClickRow(rowIndex, rowData) {
            $("#importStudent").window("open");
            $("#addClassesForm").form("load", rowData);
        }

        function editSpecialtyForm(id) {
            $("#editSpecialtyForm").form("load", row);
        }
    </script>
</head>
<body class="easyui-layout" style="visibility: hidden;">
<div region="center" border="false">
    <table id="grid"></table>
</div>
<div class="easyui-window" title="导入学生数据" id="importStudent"
     collapsible="false" minimizable="false" maximizable="false"
     style="top: 20px; left: 200px">
    <div region="north" style="height: 31px; overflow: hidden;"
         split="false" border="false">
        <div class="datagrid-toolbar">
            <a id="save" icon="icon-redo" href="#" class="easyui-linkbutton"
               plain="true">保存</a>
            <script type="text/javascript">
                $("#save").click(function () {
                    var r = $("#addClassesForm").form("validate");
                    if (r) {
                        $("#addClassesForm").submit();
                    }
                });
            </script>
        </div>
    </div>

    <div region="center" style="overflow: auto; padding: 5px;"
         border="false">
        <form id="addClassesForm" action="add.action" method="post">
            <table class="table-edit" width="80%" align="center">
                <tr class="title">
                    <td colspan="2">专业信息</td>
                </tr>
                <tr>
                    <td>班级名称</td>
                    <td><input type="text" name="tSpecialty"
                               class="easyui-validatebox" required="true"/></td>
                </tr>
                <tr>
                    <td>选择学院</td>
                    <td><input class="easyui-combobox" required="true"
                               name="collegeId"
                               data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/college/listajax.action'"/>
                    </td>
                </tr>
                <tr>
                    <td>选择专业</td>
                    <td><input class="easyui-combobox" required="true"
                               name="tSpecialty.name"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<!-- 修改班级信息 -->
<div class="easyui-window" title="添加班级" id="editStaffWindow"
     collapsible="false" minimizable="false" maximizable="false"
     style="top: 20px; left: 200px">
    <div region="north" style="height: 31px; overflow: hidden;"
         split="false" border="false">
        <div class="datagrid-toolbar">
            <a id="editSave" icon="icon-save" href="#" class="easyui-linkbutton"
               plain="true">保存</a>
            <script type="text/javascript">
                $("#editSave").click(function () {
                    var r = $("#editSpecialtyForm").form("validate");
                    if (r) {
                        $("#editSpecialtyForm").submit();
                    }
                });
            </script>
        </div>
    </div>

    <div region="center" style="overflow: auto; padding: 5px;"
         border="false">
        <form id="editSpecialtyForm" action="${pageContext.request.contextPath }/classes/add.action"
              method="post">
            <table class="table-edit" width="80%" align="center">
                <tr class="title">
                    <td colspan="2">班级信息</td>
                </tr>
                <input type="hidden" name="id"/>
                <input type="hidden" name="status"/>
                <tr>
                    <td>选择学院</td>
                    <td><input class="easyui-combobox" required="true"
                               data-options="onSelect:ajaxUnion,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/college/listajax.action'"/>
                    </td>
                </tr>
                <tr>
                    <td>选择专业</td>
                    <td><input class="easyui-combobox" required="true" id="specialtyData"
                               name="specialtyId"
                               data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/specialty/listajax.action'"/>
                    </td>
                </tr>
                <tr>
                    <td>班级名称</td>
                    <td><input type="text" name="classname" class="easyui-validatebox"
                               required="true"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script type="text/javascript">
    function ajaxUnion(recode) {
        $("#specialtyData").combobox('reload','${pageContext.request.contextPath}/specialty/listajax.action?id='+recode.id);
    }
</script>
</body>
</html>
