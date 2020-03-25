<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/23
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>load</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery_v3.3.1/jquery.min.js"></script>
</head>
<body>

<input id="b1" type="button" value="Load加载"/><br/>
<hr>
<div id="d1"></div>
<hr>

</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $("#b1").click(function () {
            $("#d1").load(
                "${pageContext.request.contextPath}/ajaxStudy?action=load",
                {name: "张三", age: 14},
                function (responseTxt, statusTxt, xhr) {
                    if (statusTxt == "success") {
                        responseTxt = eval("(" + responseTxt + ")");
                        alert("外部内容加载成功!返回的数据：" + responseTxt.result + " ，xhr.status：" + xhr.status);
                    }
                    if (statusTxt == "error") {
                        alert("Error: " + xhr.status + ": " + xhr.statusText);
                    }
                });
        });
    });
</script>