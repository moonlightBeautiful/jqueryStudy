<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>get</title>
    <script type="text/javascript" src="../jquery_v1.11.1/jquery.js"></script>
</head>
<body>
<input id="b2" type="button" value="Get加载JSP"/><br/>
<div id="loadFrame">
    如果请求的是一个jsp页面，jsp页面没有out，则返回的是整个jsp页面。
</div>

</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $("#b2").click(function () {
            $.get("02getJSP.jsp", {id: 3}, function (data) {
                alert(data);
                $("#loadFrame").html(data);
            });
        });
    });
</script>