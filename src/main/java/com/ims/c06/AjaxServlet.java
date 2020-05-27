package com.ims.c06;

import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;


public class AjaxServlet extends HttpServlet {


    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if ("load".equals(action)) {
            this.load(request, response);
        } else if ("get".equals(action)) {
            this.get(request, response);
        } else if ("post".equals(action)) {
            this.post(request, response);
        } else if ("ajax".equals(action)) {
            this.ajax(request, response);
        }
    }

    private void load(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        System.out.println("接收到前台数据name:" + request.getParameter("name"));
        System.out.println("接收到前台数据age:" + request.getParameter("age"));
        PrintWriter out = response.getWriter();
        out.println("{result:'jquery Ajax load 数据'}");
        out.flush();
        out.close();
    }

    private void get(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        System.out.println("id:" + id);
        PrintWriter out = response.getWriter();
        out.println("{'name':'张三','age':13}");
        out.flush();
        out.close();
        System.out.println();
    }

    private void post(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        System.out.println("id:" + id);
        PrintWriter out = response.getWriter();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", "李四");
        map.put("age", 14);
        String jsonString = JSON.toJSONString(map);
        System.out.println(jsonString);
        out.print(jsonString);
        /*out.print("{name:'李四',age:14}");*/
        out.flush();
        out.close();
    }

    private void ajax(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        System.out.println("id:" + id);
        PrintWriter out = response.getWriter();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", "王五");
        map.put("age", 15);
        String jsonString = JSON.toJSONString(map);
        System.out.println(jsonString);
        out.println(jsonString);
        /*out.println("2131"); //如果输出内容不包含{}，则前台不会转换，默认为text*/
        /* out.println("{\"name\":\"李四\",\"age\":14}");  //这样的才符合json对象字符串，要用双引号*/
        out.flush();
        out.close();
    }

}
