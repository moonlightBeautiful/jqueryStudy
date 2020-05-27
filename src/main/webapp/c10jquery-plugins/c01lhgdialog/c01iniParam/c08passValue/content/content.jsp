<%@ page language="java" contentType="text/html;  charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String age = request.getParameter("age");
    String name = request.getParameter("name");
    System.out.println(age);
    System.out.println(name);

%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
<span id="itxt">旧值</span>
</body>
<script type="text/javascript">
    var api = frameElement.api;
    window.onload = function () {
        document.getElementById('itxt').innerText = api.data.name;
    };
</script>

</html>