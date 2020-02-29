简介
    jquery对ajax进行了封装
1.load
    把请求到的数据加载到dom里
        $("dom选择器").load(
            "url",
            {入参json},
            function(response,status,xhr){ //回调函数 }
        );
2.get/post
    get：传递的参数会自动追加到url后面
        $.get(
             "url",
            {入参json},
            function(response,status,xhr){ //回调函数 }
        );
    post
        $.post(
             "url",
            {入参json},
            function(response,status,xhr){ //回调函数 }
        );
    对数据长度的限制：
        GET 方法向 URL 添加数据；URL 的长度是受限制的（URL 的最大长度是 2048 个字符），
        POST 无限制。
3.jsonP
    同源策略：
        XmlHttpRequest只允许请求当前源（域名、协议、端口）的资源。
    JSONP（JSON with Padding）  
        为了便于客户端跨域使用数据，逐渐形成了一种非正式传输协议（传递数据的一种方式），人们把它称作JSONP。
        Jsonp(JSON with Padding) 是 json 的一种"使用模式"，可以让网页从别的域名（网站）那获取资料，即跨域读取数据。       
    跨域请求
        通过html的script标记来进行跨域请求，Web页面上调用js（非本地的）文件时不受是否跨域的影响。
        凡是拥有”src”这个属性的标签都拥有跨域的能力，比如<\script>、<\img>、<\iframe>。
    jquery中使用，本质上还是script
        $.getJSON(
            url,
            data,
            function (responseObj) {
                alert(responseObj.name1);
            }
        );   
4.ajax
    自己配置ajax请求 get还是post还是jsonP
    $.ajax({
        type: "get",
        url: "/ajax?action=ajax",
        async: true,
        data: {id: 5},
        dataType: "json", //返回的数据类型
        success: function (responseText, statusText, xhr) {
            alert("外部内容加载成功!返回的数据age属性：" + responseText.age + "，statusText:" + statusText + " ，xhr.status：" + xhr.status);
        },
        error: function (xhr, statusText, errorText) {
            /*alert("Error: " + xhr.status + "，" + xhr.statusText);
            alert("Error: " + statusText + ": " + errorText);*/
        }
    });