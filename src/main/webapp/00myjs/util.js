/**
 * 出现等待页面，禁止操作
 */
Plm.prototype.startWait = function () {
    var html = "<div id='wait_bg_div' style='width:100%;height:" + $(document).height() + "px;background:#ffffff;filter:alpha(opacity=70);opacity:0.7;position:absolute;top:0px;left:0px;z-index:9;'/>";
    html += "<div id='wait_msg_div' class='PlmDivLoading'><span>请稍候，系统处理中...</span></div>";
    $("body").append(html);
};

/**
 * 取消等待页面
 */
Plm.prototype.endWait = function () {
    $("#wait_bg_div").remove();
    $("#wait_msg_div").remove();
};