<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/12
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>   <%--//配置文件--%>
    <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>     <%--//编辑器源码文件--%>
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/en/en.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.parse.js"></script>
</head>
<body>
$END$
<textarea id="container" name="container" style="width: 800px; height: 400px; margin: 0 auto;"></textarea>
</body>
<script type="text/javascript">
    var ue = UE.getEditor("container");
</script>
</html>
