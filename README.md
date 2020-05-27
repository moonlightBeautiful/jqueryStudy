# jqueryStudy
简介：
    JavaScript框架，轻量级。很优秀，功能强悍。
使用
    页面引入一个js文件就可以，以后用1.11.1版本，和easyui 1.4.2配合使用
    <script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {  //想当于 body onload="func" ，当文档加载完毕再执行。
            //js代码
        });
        ==    $(function () {  
                  //js代码
              });
    </script>
版本问题
    jquery-2.0以上版本不再支持IE 6/7/8) 并不是最新的版本就最好的，而是根据您项目需求所适合的版本
    以后使用1版本的最后一个版本 1.11.3
jquery是否引入成功
    判断网页是否引入了jquery（jquery是否可用）
    alert($);
    返回函数定义string，则引入，无反应或者返回 undefined，则是么有引入。
第三方插件
    1.lhgDialog，开源的弹窗提示窗口组件
        

