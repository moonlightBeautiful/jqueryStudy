# jqueryStudy
操作dom节点
    创建dom节点
        var li1=$("<li title='这是马化腾'>马化腾</li>");
    添加dom节点
        $("ul").append(li1); //作为最后一个子节点
        var li22=$("ul li:eq(1)");  li.insertAfter(li22);   //插入到li22之后
    删除dom节点
        $("ul li:eq(1)").remove() //删除选中的节点
操作dom节点属性attr
    获取属性值
        $("ul li:eq(1)").attr("title")
    给属性赋值
        $("ul li:eq(1)").attr("title","你懂的");
    删除属性
        $("ul li:eq(1)").removeAttr("title")
操作dom节点样式
    1.通过class
        1.获取 设置 通过attr
        2.追加 移除 通过 addClass removeClass
    2.通过css
        1.获取css样式 $("#jq").css("color")
        2.设置css样式 $("#jq").css("color", "blue");
html、文本、值
    1、html【标签对和里面的所有内容 < > </ >】
        获取
            $("ul li:eq(0)").html( )
        设置
            $("ul li:eq(0)").html("<font color=red>哈哈</font>")
    2.文本
        获取
            $("ul li:eq(0)").text()
        设置
            $("ul li:eq(0)").text("呵呵")
    3.input的值
         获取
            $("ul li:eq(0)").val()
        设置
            $("ul li:eq(0)").val("呵呵")
遍历dom节点
    获取儿子节点数组
        $("ul").children() 
    获取弟弟节点
        $("ul li:eq(1)").next()
    获取哥哥节点
        $("ul li:eq(1)").prev();
