# jqueryStudy
简介：
    表单验证插件，核心思想验证条件及验证提示信息绑定到每个表单元素。
使用：
    1.引入必须文件3个
        jquery、Validform、css
    2.给需要验证的表单元素绑定附加属性：凡要验证格式的元素均需绑定datatype属性
        <form class="demoform">
            <input type="text" value="" name="name" datatype="s5-16" errormsg="昵称至少5个字符,最多16个字符！" />
        </form>
    3.初始化
        $(".demoform").Validform();
绑定附加属性：
    可以绑定的附加属性有：datatype、nullmsg、sucmsg、errormsg、ignore、recheck、tip、altercss、ajaxurl 和 plugin
    1.datatype：验证格式
        凡要验证格式的元素均需绑定datatype属性，datatype可选值内置有10类，用来指定不同的验证格式。
        内置基本的datatype类型有： * | *6-16 | n | n6-16 | s | s6-18 | p | m | e | url
            *：检测是否有输入，可以输入任何字符，不留空即可通过验证；
            *6-16：检测是否为6到16位任意字符；
            n：数字类型；
            n6-16：6到16位数字；
            s：字符串类型；
            s6-18：6到18位字符串；
            p：验证是否为邮政编码；
            m：手机号码格式；
            e：email格式；
            url：验证字符串是否为网址。
            还支持直接绑定正则
    2.nullmsg：表单元素值为空时的提示信息
        自动查找class为Validform_label下的文字作为提示文字:请输入+Validform_label下的文字+！
        同级里没有找到的话，它还会在同级的子级、父级的同级、父级的同级的子级里查找。都找不到则默认提示"请填写信息！"。 
    3.sucmsg ：通过验证时的提示信息
        默认提示"通过信息验证！"
    4.errormsg：不能通过验证时的提示信息
        默认提示"请输入正确信息！"
    5.ignore : 这个没看懂
        绑定了ignore="ignore"的表单元素，在有输入时，会验证所填数据是否符合datatype所指定数据类型，
        没有填写内容时则会忽略对它的验证；
    6.recheck ：与同一个表单的另一个元素的值比较是是否相等
        recheck="另一个表单元素的name" 如果不值相等，errormsg不绑定的话，则默认提示"两次输入的内容不一致！"。
    7.tip：文本框灰色的提示文字
        当获得焦点时提示文字消失，失去焦点时提示文字显示。
    8.altercss：
        它需要和tip属性配合使用，altercss指定的样式名，会在文本框获得焦点时被删除，没有输入内容而失去焦点时重新加上。
    9.ajaxurl:实时验证
        实时验证表单值的后台文件的地址，会自动传递2个参数param和name。param是文本框的值，name是文本框的name属性
        可以在ajaxurl指定的url后绑定参数，ajaxurl="地址?myparam1=value1&myparam2=value2"；
        返回数据须是{"info":"提示信息","status":"y y之外都是错误"}
    10.plugin:指定需要使用的插件。
初始化参数说明
    
