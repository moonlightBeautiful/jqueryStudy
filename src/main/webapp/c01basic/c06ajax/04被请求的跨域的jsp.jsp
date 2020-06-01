<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    //获取请求的参数：callback 和 userName
    String callback = request.getParameter("callback");
    String userName = request.getParameter("userName");
    System.out.println(userName);

    //调用请求页面的函数
    response.setContentType("text/javascript;charset=gb2312");
    String jsonData = "{\"name1\":\"chenchao\"}";
    String jsonp = callback + "(" + jsonData + ")";
    out.println(jsonp);
%>