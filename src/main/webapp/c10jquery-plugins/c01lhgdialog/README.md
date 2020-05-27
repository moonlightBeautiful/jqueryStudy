# lhgdialog学习
简介：
    开源的弹窗提示窗口组件，主要以iframe方式加载单独页面为主的弹出窗口。
引入：
    引入lhgdialog控件主要分为两种情况
    1.引入lhgdialog控件同时页面上也引用了jquery
        <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="Scripts/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
    2.单独使用lhgdialog控件
        <script src="Scripts/lhgdialog/lhgcore.lhgdialog.min.js" type="text/javascript"></script>
hello
    $(function () {
        var dialog = $.dialog({
            title: '欢迎',
            content: '欢迎使用lhgdialog对话框组件！'
        });
    });  
使用：
    1.窗口lhgdialog.min.js文件的url参数。
        参数形式为：<script type="text/javascript" src="lhgdialog.min.js?self=true&skin=chrome"></script>
        1.self：指定弹出窗口的页面
            类型：String
            默认：'false'
            说明：此参数只用在框架页面中，如果不写此参数或值为false时则窗口跨框架弹出在框架最顶层页面，如果值为true则不跨框架，而在当前面页弹出。
        2.skin：多皮肤共享CSS文件名
            类型：String
            默认：'default'
            说明：不写此参数则值为default。如果你想在同一页面使用不同皮肤的窗口，此处的值就为多皮肤共存的CSS的文件名
    2.初始化参数列表
        1.内容相关
            1.title：窗口的标题文本
                类型：String|Boolean
                默认：'视窗'
                说明：窗口标题的文件字符，如果值为false时就会隐藏标题栏
            2.content：窗口中加载的内容
                类型：String
                默认：'loading...'
                说明：支持html标签。如果想加载单独的页面(iframe方式)，只要在字符前加'url:'字符即可，如：'url:content.html'
        2.按钮相关
            1.ok：确定按钮回调函数，默认颜色和其他按钮颜色不一样
                类型：Function|Boolean
                默认：null
                说明：null，不显示按钮。true,只显示有关闭功能的按钮。函数，确定按钮的回调函数，如果返回false将阻止对话框关闭
            2.cancel：取消按钮回调函数
                类型：Function|Boolean
                默认：null
                说明：null，不显示按钮。true,只显示有关闭功能的按钮。函数，取消按钮的回调函数，如果返回false将阻止对话框关闭
            3.okVal：确定按钮文字
                类型：String
                默认：确定
            4.cancelVal：取消按钮文字
                类型：String
                默认：取消
            5.min：是否显示最小化按钮
                类型：Boolean
                默认：true
            6.max：是否显示最大化按钮
                类型：Boolean
                默认：true
            7.button：自定义按钮，位于确定、取消按钮前面
                类型：Array
                默认：null
                说明：按钮属性
                    name —— 按钮名称。类型：String，必须指定值。
                    callback —— 按下后执行的函数。类型：Function。默认为Function(){}
                    注意：点击按钮默认会触发按钮关闭动作，需要阻止触发关闭请让回调函数返回false
                    focus —— 是否聚焦点，没看懂
                    disabled —— 是否标记按钮为不可用状态（后续可使用扩展方法让其恢复可用状态）
                示例：[{name: '登录', callback: function () {}}, {name: '取消'}] 。
        3.尺寸相关
            1.width：指定窗口的宽度
                类型：Number|String
                默认：'auto'
                说明：auto，对话框框架会自己适应内容。百分值，会以根据浏览器可视范围作为基准，此时如果浏览器窗口大小被改变其也会进行相应的调整
            2.height：指定窗口的高度
                类型：Number|String
                默认：'auto'
                说明：auto，对话框框架会自己适应内容。百分值，会以根据浏览器可视范围作为基准，此时如果浏览器窗口大小被改变其也会进行相应的调整
            3.minWidth：最小宽度限制
                类型：Number
                默认：96
                说明：此参数值只能为数字
            4.minHeight：最小高度限制
                类型：Number
                默认：32
                说明：此参数值只能为数字                    
        4.位置相关
            1.fixed：开启静止定位
                类型：Boolean
                默认：false
                说明：静止定位是css2.1的一个属性，它静止在浏览器某个地方不动，也不受滚动条拖动影响
            2.left：相对于可视区域的X轴的坐标
                类型：Number|String
                默认：'50%'
                说明：可以使用'0%' ~ '100%'作为相对坐标，如果浏览器窗口大小被改变其也会进行相应的调整
            3.top：相对于可视区域的Y轴的坐标
                类型：Number|String
                默认：'50%'
                说明：可以使用'0%' ~ '100%'作为相对坐标，如果浏览器窗口大小被改变其也会进行相应的调整            
        8.传值相关
            1.data：传递给打开窗口的值
                类型：js的数据类型都可以
                默认：undefined
                说明：在打开的窗口中使用frameElement.api.data获取
            2.urlParam：拼接在url后面参数
                类型：{key:value...}
                默认：无
                说明：在打开的窗口中使用request.getParameter()获取
                            
    3.扩展的一些提示性的窗口
        1.$.dialog.tips(content,time,icon,callback)：短暂提示
            参数1：内容
            参数2：显示时间
            参数3：提示图标
            参数4：提示关闭时执行的函数
        2.$.dialog.alert(content,callback)：警告
            参数1：内容
            参数2：窗口关闭时执行的回调函数
        3.$.dialog.confirm(content,yes,no)：确认
            参数1：内容
            参数2：确定按钮回调函数
            参数3：取消按钮回调函数
        4.$.dialog.prompt(content,yes,value)：输入
            参数1：内容
            参数2：确定按钮回调函数
            参数3：文本框默认值
        5.$.dialog.load(url,options,cache)：Ajax填充内容
            参数1：地址
            参数2：配置参数
            参数3：是否允许缓存. 默认false
    

么看懂
    1.self
    2.$.dialog.load 不能使用
    3.按钮相关相关参数，button的focus属性，没看懂
    

