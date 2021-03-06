# lhgdialog学习
简介：
    开源的弹窗提示窗口组件，主要以iframe方式加载单独页面为主的弹出窗口。
引入：
    2个css和3个js
        <!-- jqGrid基础样式-必要 -->
        <link rel="stylesheet" href="jqGrid-4.4.3/css/ui.jqgrid.css" />	
        <!-- jqueryUI主题-非必要 --> 
        <link rel="stylesheet" href="jquery-ui-themes/themes/类型/jquery-ui.min.css" />  
        <!-- jquery-必要 -->
        <script type="text/javascript" src="../../jqueryUI/jqGrid-4.4.3/js/jquery-1.7.2.min.js"></script>
        <!-- jqGrid-必要 -->
        <script type="text/javascript" src="../../jqueryUI/jqGrid-4.4.3/js/jquery.jqGrid.min.js"></script>
        <!-- jqGrid语言包-非必要 -->
        <script type="text/javascript" src="../../jqueryUI/jqGrid-4.4.3/js/i18n/grid.locale-cn.js"></script>
    jqueryUI主题下载地址：
        http://jqueryui.com/themeroller/ 
hello：
    <table id="jqGrid"></table>
    <div id="pager"></div>
    $("#jqGrid").jqGrid({
        url: 'data/JSONData.json',  //组件创建完成之后请求数据的url
        datatype: "json",   //请求数据返回的类型。可选json,xml,txt
        colNames: ['Inv No', 'Date', 'Client', 'Amount', 'Tax', 'Total', 'Notes'],  //jqGrid的列显示名字
        colModel: [    
            {name: 'id', index: 'id', width: 55},
            {name: 'invdate', index: 'invdate', width: 90},
            {name: 'name', index: 'name asc, invdate', width: 100},
            {name: 'amount', index: 'amount', width: 80, align: "right"},
            {name: 'tax', index: 'tax', width: 80, align: "right"},
            {name: 'total', index: 'total', width: 80, align: "right"},
            {name: 'note', index: 'note', width: 150, sortable: false}
        ],   //jqGrid每一列的配置信息。包括名字，索引，宽度,对齐方式.....
        rowNum: 10,//一页显示多少条
        rowList: [10, 20, 30],//可供用户选择一页显示多少条
        pager: '#pager2',//表格页脚的占位符(一般是div)的id
        sortname: 'id',//初始化的时候排序的字段
        sortorder: "desc",//排序方式,可选desc,asc
        mtype: "post",//向后台请求数据的ajax的类型。可选post,get
        viewrecords: true,
        caption: "JSON Example"//表格的标题名字
    });
    /*创建jqGrid的操作按钮容器*/
    /*可以控制界面上增删改查的按钮是否显示*/
    $("#jqGrid").jqGrid('navGrid', '#pager', {edit: false, add: false, del: false});
修改源码
    给请求传值，自己扩展的
        urlParam，而不是用url后面拼接参数。
    给js传值，原本的功能，frameElement.api为窗口实例
        data为窗口属性，所以，frameElement.api.data调用窗口实例属性。
        api.opener 为源窗口
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
        5.视觉相关
            1.lock：开启锁屏
                类型：Boolean
                默认：false
                说明：中断用户对话框之外的交互，用于显示非常重要的操作/消息，所以不建议频繁使用它，它会让操作变得繁琐
            background：锁屏遮罩颜色
                类型：String
                默认：'#FFF'
                说明：请注意这是一个会影响到全局的配置，后续出现的对话框的遮罩颜色都和此设置一样，再设置不再起作用
            opacity：锁屏遮罩透明度
                类型：Number
                默认：.5
                说明：请注意这是一个会影响到全局的配置，后续出现的对话框的遮罩透明度都和此设置一样，再设置不再起作用
            icon：定义消息图标
                类型：String
                默认：null
                说明：可定义“skins/icons/”目录下的图标名作为参数名（一定要包含后缀名）
            titleIcon：标题栏左边的小图标
                类型：String
                默认：null
                说明：可定义“skins/icons/”目录下的图标名作为参数名（一定要包含后缀名）
            padding：内容与边界填充边距(即css padding)
                类型：String
                默认：'15px 10px'
                说明：如果内容页为iframe方式加载的则在css里需要设置为0，要不在IE6中易出问题
            skin：多皮肤共存时指定的皮肤样式
                类型：String
                默认：''
                说明：指定窗口要使用的皮肤的主类名
        6.交互相关
            time：设置对话框显示时间
                类型：Number
                默认：null
                说明：以秒为单位
            resize：是否允许用户调节尺寸
                类型：Boolean
                默认：true
            drag：是否允许用户拖动位置
                类型：Boolean
                默认：true
            esc：是否允许用户按Esc键关闭对话框
                类型：Boolean
                默认：true
                说明：只有窗口获得焦点后才能使用此功能
            cache：是否缓存iframe方式加载的窗口内容页
                类型：Boolean
                默认：true
                说明：只有使用iframe方式加载的单独页面的内容时此参数才有效
            extendDrag：是否开启增强拖拽体验
                类型：Boolean
                默认：true
                说明：1.此属性为全局性设置，不能在窗口调用的参数里设置，只能使用lhgdialog.setting.extendDrag来设置
                     2.防止鼠标落入iframe导致不流畅，对超大对话框拖动优化
        7.高级相关
            id：设定对话框唯一标识
                类型：String|Number
                默认：null
                说明：1.防止重复弹出
                     2.定义id后可以使用this.get(youID)和lhgdialog.list[youID]获取扩展方法
            zIndex：重置全局zIndex初始值
                类型：Number
                默认：1976
                说明：用来改变对话框叠加高度，请注意这是一个会影响到全局的配置，后续出现的对话框叠加高度将重新按此累加。
            init：对话框弹出后执行的函数
                类型：Function
                默认：null
                说明：如果是以iframe方式加载的内容页此函数会在内容页加载完成后执行
            close：对话框关闭前执行的函数
                类型：Function
                默认：null
                说明：函数如果返回false将阻止对话框关闭。请注意这不是关闭按钮的回调函数，无论何种方式关闭对话框，close都将执行。
            parent：打开子窗口的父窗口对象
                类型：Object
                默认：null
                说明：此参数只用在打开多层窗口都使用遮罩层时才会用到此参数，注意多层窗口锁屏时一定要加此参数      
        8.传值相关
            1.data：传递给打开窗口的值
                类型：js的数据类型都可以
                默认：undefined
                说明：在打开的窗口中使用frameElement.api.data获取
            2.urlParam：拼接在url后面参数
                类型：{key:value...}
                默认：无
                说明：在打开的窗口中使用request.getParameter()获取
    3.扩展方法 
        窗口实例对象内部方法
            close()：关闭对话框
                参数：无
                说明：在需要关闭窗口时可调用此方法
            reload(win,url)：刷新或跳转指定的页面
                参数1：指定的要刷新或跳转的页面的window对象
                参数2：要跳转到的页面地址
            show()：显示对话框
                参数：无
            hide()：隐藏对话框
                参数：无
            title(value)：写入标题
                参数1：标题的文本
                说明：无参数则返回创建的窗口对象实例
            content(value)：向窗口中写入内容
                参数1：窗口中的内容
                说明：如果参数的前3个字符为'url:'参使用iframe方式加载单独的内容页，无参数则返回创建的窗口对象实例
            button(arguments)：插入一个自定义按钮
                参数1：name -- 按钮名称
                参数2：callback -- 按下后执行的函数
                参数3：focus -- 是否聚焦点
                参数4：disabled -- 是否标记按钮为不可用状态（后续可使用扩展方法让其恢复可用状态）
                说明：此参数为多个对象
                示例：
                button({
                    name: '登录',
                    focus: true,
                    callback: function(){}
                },{
                    name: '取消'
                });
            position(left,top)：重新定位对话框
                参数1：X轴的坐标
                参数2：Y轴的坐标
                说明：参数可以为数字或带单位的字符如：'200px'或使用'0%' ~ '100%'作为相对坐标
            size(width,height)：重新设定对话框大小
                参数1：窗口的宽度
                参数2：窗口的高度
                说明：参数可以为数字或带单位的字符如：'200px'或使用'0%' ~ '100%'百分值单位
            max()：最大化窗口
                参数：无
            min()：最小化窗口
                参数：无
            lock()：锁屏
                参数：无
            unlock()：解锁
                参数：无
            time(val,callback)：定时关闭（单位秒）
                参数1：数值，以秒为单位
                参数2：回调函数
                说明：参数2为窗口关闭前执行的函数
            focus() ：自动设置窗口中焦点元素
                参数：无
            zindex() ：置顶窗口
                参数：无
            get(id,object) ：根据指定id获取相应的对象
                参数1：窗口的id
                参数2：是否返回的是窗口实例对象
                说明：参数2的值只有为数字1时才返回指定id的窗口的实例对象
            api：内容页中调用窗口实例对象接口
                说明：此对象属性是附加在iframe元素的一个属性，在iframe方式加载的内容页中通过调用此函数来获取窗口的实例对象，
                示例：var api = frameElement.api; 注：此句代码是加在iframe方式加载的内容页中的，一定要注意
            opener：加载窗口组件页面的window对象
                说明：此属性主要用在iframe方式加载的内容页中，
                示例：var api = frameElement.api, W = api.opener; 此时的W即为加载窗口组件页面的window对象
            iframe：iframe方式加载内容的iframe对象
                说明：此属性主要用于在窗口组件调用页面操作窗口中的iframe对象
            iwin：iframe方式加载内容页的window对象
                说明：此属性主要用于在窗口组件调用页面操作窗口中的window对象，示例：var dg = $.dialog({'url:content.html',init:function(){ if( this.iwin.document.body ) alert('窗口内容页加载完成'); });
        窗口外部方法 
            $.dialog.focus：获取焦点的窗口实例对象
                说明：可以使用此属性获取儿得焦点的窗口的对象，示例：var dg = $.dialog.focus; 此时的dg就是当前焦点窗口的对象实例
            $.dialog.list：所有窗口对象实例的集合
                说明：通过此属性可获取所有打开的窗口对象，示例：关闭页面所有对话框
                var list = $.dialog.list;
                for( var i in list ){
                    list[i].close();
                }
            $.dialog.top：获取lhgdialog可用最高层window对象
                说明：这与直接使用window.top不同，它能排除url参数self为true时定义的顶层页面为调用窗口组件页面或者顶层页面为框架集的情况
            $.dialog.data(name,value)：跨框架数据共享写入接口
                参数1：存储的数据名
                参数2：将要存储的任意数据(无此项则返回被查询的数据，如果此值为false就删除指定名称的数据)
                说明：框架与框架之间以及与主页面之间进行数据交换是非常头疼的事情，常规情况下你必须知道框架的名称才能进行数据交换，如果是在复杂的多层框架下操作简直就是噩梦。
                而data方法就是为了解决这个问题，你完全不用管框架层级问题，它可以写入任何类型的数据，而做到各个页面之间数据共享。                      
    4.扩展的一些提示性的窗口
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
    

