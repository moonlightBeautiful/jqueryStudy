<%--
  Created by gaoxu.
  User: gaoxu
  Date: 2019/9/25 0025
  Time: 15:10
  只需要<% %>代码，不需要html部分。
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    //获取callback 函数名称
    String callbackName = request.getParameter("callback");
    System.out.println("callbackName:" + callbackName);

    //获取Jquery传递过来的数据
    String userName = request.getParameter("userName");
    System.out.println("userName:" + userName);

    //设置返回的数据类型，貌似不设置也行
    response.setContentType("text/javascript;charset=gb2312");

    //要返回的json格式数据
    String jsonData = "{\"name1\":\"chenchao\"}";

    //执行callback函数名称字符串
    String jsonp = callbackName + "(" + jsonData + ")";
    System.out.println("jsonp:" + jsonp);

    //返回输出
    out.println(jsonp);
%>