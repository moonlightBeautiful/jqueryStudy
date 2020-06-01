简介
    jquery对ajax进行了封装。4个方法。
1.load：把响应的数据加载到dom里
    $(selector).load(url[,data][,function(response,status,xhr)]);
2.get/post
    $.get/post(url[,data][,callback](response,status,xhr)][,dataType]);
        dataType:服务器响应的数据类型。默认地，jQuery 会智能判断。一般json。
        对入参数据长度的限制：
            GET方法：向 URL 添加数据；URL 的长度是受限制的（URL 的最大长度是 2048 个字符），
            POST方法： 无限制。
3.jsonP：跨域请求
    同源策略：如果两个页面的协议，端口（如果有指定）和域名都相同，则两个页面具有相同的源。
        XmlHttpRequest只允许请求当前源（域名、协议、端口）的资源。
    JSONP（JSON with Padding） ： 
        为了便于客户端跨域使用数据，逐渐形成了一种非正式传输协议（传递数据的一种方式），人们把它称作JSONP。
        Jsonp(JSON with Padding) 是 json 的一种"使用模式"，可以让网页从别的域名（网站）那获取资料，即跨域读取数据。       
    跨域请求解决方案：
        通过html的script标记来进行跨域请求，项目中调用别的项目js文件时不受是否跨域的影响。
        凡是拥有”src”这个属性的标签都拥有跨域的能力，比如<\script>、<\img>、<\iframe>。
    jquery中使用，本质上还是script属性
        $.getJSON(
            url,
            data,
            function (responseObj) {
                alert(responseObj.name1);
            }
        );   
4.ajax：自己配置ajax请求 get还是post还是jsonP
    $.ajax([settings]);
    示例
        $.ajax({
            type: "get", //
            url: "/ajax?action=ajax",
            async: true,    //表示请求是否异步处理。默认是 true。
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
    简介：
        type 规定请求的类型（GET 或 POST、jsonP）。
        url	规定发送请求的 URL。默认是当前页面。
        async	布尔值，表示请求是否异步处理。默认是 true。
        cache	布尔值，表示浏览器是否缓存被请求页面。默认是 true。
        contentType	发送数据到服务器时所使用的内容类型。默认是："application/x-www-form-urlencoded"。
        timeout	设置本地的请求超时时间（以毫秒计）。
        data：规定要发送到服务器的数据。
        dataType：预期服务器返回的数据类型。
            "xml": 返回 XML 文档，可用 jQuery 处理。
            "html": 返回纯文本 HTML 信息；包含的 script 标签会在插入 dom 时执行。
            "script": 返回纯文本 JavaScript 代码。不会自动缓存结果。除非设置了 "cache" 参数。注意：在远程请求时(不在同一个域下)，所有 POST 请求都将转为 GET 请求。（因为将使用 DOM 的 script标签来加载）
            "json": 返回 JSON 数据 。
            "jsonp": JSONP 格式。使用 JSONP 形式调用函数时，如 "myurl?callback=?" jQuery 将自动替换 ? 为正确的函数名，以执行回调函数。
            "text": 返回纯文本字符串
        beforeSend(xhr)	发送请求前运行的函数。
        success(result,status,xhr)	当请求成功时运行的函数
        error(xhr,status,error)	如果请求失败要运行的函数。
        complete(xhr,status)	请求完成时运行的函数（在请求成功或失败之后均调用，即在 success 和 error 函数之后）
工作中get：
1.ajax上传文件
    1.入参
        方式1：自己新建
            var formData = new FormData();//存放表单数据
            formData.append("myFile", $('#uploadFile')[0].files[0]);    //单文件，因为multiple="multiple"属性，单个<input type="file">标签能够上传多个文件
            //for(var i=0; i<$('#uploadFile')[0].files.length;i++){     //多文件   
            //   formData.append('myFiles[]', $('#uploadFile')[0].files[i]);
            //}
            formData.append("fileType","3");
        方式2：在form基础上创建，note：form的enctype="multipart/form-data
            var form = new FormData($('#formId'));
    2.ajax
        $.ajax({
            url:'http://www.baidu.com/',
            type:'post',
            data: formData, //入参
            contentType: false, //上传文件特殊配置
            processData: false, //上传文件特殊配置
            success:function(res){
                console.log(res.data);
                if(res.data["code"]=="succ"){
                    alert('成功');
                }else if(res.data["code"]=="err"){
                    alert('失败');
                }else{
                    console.log(res);
                }
            }
        });
    3.后台接受
        和普通的接收文件上传处理一样
    
    
