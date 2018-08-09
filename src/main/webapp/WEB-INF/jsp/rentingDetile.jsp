<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/19
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/head.jsp"%>
<%@include file="common/tag.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <meta name=”viewport” content=”width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no” />
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" href="/resource/img/seckill.ico" />
    <link rel="bookmark"href="/resource/img/seckill.ico" />
    <title>商品详情</title>

    <style>
        element.style {
        }
        div {
            display: block;
        }
        body, button, input, select, textarea {
            font: 12px/1 Microsoft YaHei,"\5b8b\4f53",Tahoma,Helvetica,Arial,sans-serif;
        }
        #left-right-layout {
            width: 1180px;
            margin: 0 auto;
            overflow: hidden;
        }
        #left-right-layout .block-top {
            width: 100%;
        }
        #goodsinfo {
            background: url(//img.juxiangyou.com/common/fun/infobg.png) 0 0;
            overflow: hidden;
            margin: 20px 0 0;
            position: relative;
            padding: 20px;
        }
        #goodsinfo, #goodsinfo .bl, #goodsintro {
            border: 1px solid #e8e8e8;
        }
        #goodsinfo .bl {
            width: 380px;
            height: 380px;
            background-color: #fff;
            float: left;
            overflow: hidden;
        }
        #goodsinfo, #goodsinfo .bl, #goodsintro {
            border: 1px solid #e8e8e8;
        }
        #goodsinfo .br {
            display: block;
            padding-left: 400px;
            min-height: 382px;
        }
        #goodsinfo .goods-info .goods-title {
            line-height: 25px;
        }
        .color-999 {
            color: #999!important;
            font-size: 12px!important;
        }
        blockquote, body, button, dd, dl, dt, fieldset, h1, h2, h3, h4, h5, h6, hr, input, legend, li, ol, p, pre, td, textarea, th, ul {
            margin: 0;
            padding: 0;
        }
        p {
            display: block;
            -webkit-margin-before: 1em;
            -webkit-margin-after: 1em;
            -webkit-margin-start: 0px;
            -webkit-margin-end: 0px;
        }
        #goodsinfo .goods-info .goods-price-wrapper {
            margin: 20px 0 10px;
            background-color: #f4f5f9;
            padding: 15px 20px 20px;
        }
        #goodsinfo .goods-info .exchange-btn, #goodsinfo .goods-info .noexchange-btn {
            display: inline-block;
            width: 220px;
            line-height: 54px;
            color: #fff;
            background-color: #f60;
            font-size: 18px;
            text-align: center;
            margin: 30px 0 20px;
            text-decoration: none;
        }
        a {
            text-decoration: none;
            outline: 0;
        }
        a:-webkit-any-link {
            color: -webkit-link;
            cursor: pointer;
            text-decoration: underline;
        }
        .color-999 {
            color: #999!important;
            font-size: 12px!important;
        }
        .color-udou {
            color: #f60;
        }
        em {
            font-style: normal;
        }
        p {
            line-height: 30px;
            font-size: 14px;
            color: #666;
        }
        #goodsinfo .share-box {
            position: absolute;
            bottom: 33px;
            right: 15px;
        }
        #left-right-layout .block-main {
            width: 880px;
            float: left;
            min-height: 800px;
            position: relative;
        }
        #goodsintro {
            background-color: #fff;
            padding: 16px;
            min-height: 885px;
        }
        #goodsinfo, #goodsinfo .bl, #goodsintro {
            border: 1px solid #e8e8e8;
        }
        .mr20 {
            margin: 20px 0;
        }
        #goodsintro .tab {
            border-bottom: 1px solid #e8e8e8;
            margin-bottom: 20px;
        }
        #goodsintro .tab .xian {
            display: inline-block;
            width: 0;
            height: 18px;
            vertical-align: middle;
            margin: 0 7px 8px;
            border-right: 1px solid #e8e8e8;
        }

        #goodsintro .tab-item {
            display: inline-block;
            color: #999;
            font-size: 22px;
            padding-bottom: 10px;
        }

        element.style {
        }
        fun-mall-detail.min.css:1
        #goodsintro .tab-item {
            display: inline-block;
            color: #999;
            font-size: 22px;
            padding-bottom: 10px;
        }
        fun-mall-detail.min.css:1
        #goodsintro a, a:hover {
            text-decoration: none;
        }
        fieldset, img {
            border: 0;
            vertical-align: top;
        }
        img[Attributes Style] {
            width: 750px;
            height: 1173px;
        }
        #left-right-layout .block-right {
            width: 280px;
            float: right;
            min-height: 800px;
        }
        .mr20 {
            margin: 20px 0;
        }
        .p2p-gain-list {
            width: 278px;
            border: 1px solid #e8e8e8;
            overflow: hidden;
        }
        .listbar-box {
            width: 100%;
            height: 45px;
            line-height: 45px;
            background-image: url(//img.juxiangyou.com/common/invite/bg-listbar.png);
        }
        .content-box {
            padding: 20px 0;
        }
        .content-box {
            background-color: #fff;
        }
        .listbar-text {
            font-size: 18px;
            color: #30303c;
        }
        h1, h2, h3, h4, h5, h6 {
            font-weight: 400;
        }
        blockquote, body, button, dd, dl, dt, fieldset, h1, h2, h3, h4, h5, h6, hr, input, legend, li, ol, p, pre, td, textarea, th, ul {
            margin: 0;
            padding: 0;
        }
        h3 {
            display: block;
            font-size: 1.17em;
            -webkit-margin-before: 1em;
            -webkit-margin-after: 1em;
            -webkit-margin-start: 0px;
            -webkit-margin-end: 0px;
            font-weight: bold;
        }
        .listbar-box {
            width: 100%;
            height: 45px;
            line-height: 45px;
            background-image: url(//img.juxiangyou.com/common/invite/bg-listbar.png);
        }
        .listbar-icon {
            position: relative;
            top: 8px;
            width: 28px;
            height: 28px;
            margin: 0 5px 0 15px;
            display: inline-block;
        }
        i, cite, em, var, address, dfn {
            font-style: italic;
        }
        .listbar-text {
            font-size: 18px;
            color: #30303c;
        }

        element.style {
            overflow: hidden;
            position: relative;
            height: 320px;
        }
        #left-right-layout .block-bottom {
            width: 100%;
            clear: both;
        }
        .item-icon img{
            width:60px;
            height:60px;
        }
        .ulogin-form .group-input .account-icon {
            background: url(//img.juxiangyou.com/common/customer/login-form-icon.png) no-repeat 0 center;
        }
        .common-fuceng-box {
            /* min-width: 4px; */
            /* height: auto; */
            /* margin: -80px 0 0 -220px; */
            z-index: 9995;
        }
        .common-fuceng-box, .mini-login-box {
            background: #fff;
            position: fixed;
            top: 50%;
            left: 50%;
        }
        .common-fuceng-box .fuceng-head {
            min-width: 440px;
            height: 40px;
            line-height: 40px;
            background: #f6f6f6;
            border-bottom: 1px solid #e8e8e8;
            position: relative;
        }
        .common-fuceng-box .fuceng-title {
            font-size: 16px;
            color: #3f3f4d;
            padding: 0 0 0 12px;
            font-weight: 700;
        }

        .common-fuceng-box .fuceng-close {
            display: block;
            width: 15px;
            height: 15px;
            background: url(//img.juxiangyou.com/common/svg/close.png) no-repeat 0 0;
            position: absolute;
            right: 10px;
            top: 13px;
        }
        a {
            text-decoration: none;
            outline: 0;
        }
        /*弹框样式*/
        .common-fuceng-box .fuceng-con {
            padding: 20px 0 30px;
        }
        .common-fuceng-box .ts-text {
            font-size: 14px;
            color: #576077;
            line-height: 24px;
            text-align: center;
        }
        .common-fuceng-box .fuceng-head {
            min-width: 440px;
            height: 40px;
            line-height: 40px;
            background: #f6f6f6;
            border-bottom: 1px solid #e8e8e8;
            position: relative;
        }
        p {
            display: block;
            -webkit-margin-before: 1em;
            -webkit-margin-after: 1em;
            -webkit-margin-start: 0px;
            -webkit-margin-end: 0px;
        }
        .clear-fix:after, .clear-fix:before {
            display: table;
            content: "";
        }

        element.style {
        }
        reset.min.css:1
        .clear-fix {
        }
        user agent stylesheet
        div {
            display: block;
        }
        Inherited from body
        reset.min.css:1
        body, button, input, select, textarea {
            font: 12px/1 Microsoft YaHei,"\5b8b\4f53",Tahoma,Helvetica,Arial,sans-serif;
        }
        Pseudo ::before element
        reset.min.css:1
        .clear-fix:after, .clear-fix:before {
            display: table;
            content: "";
        }
        Pseudo ::after element
        reset.min.css:1
        .clear-fix:after {
            clear: both;
        }
        .clear-fix:after, .clear-fix:before {
            display: table;
            content: "";
        }
        .common-fuceng-box .fuceng-btn-qd {
            background: #43cb83;
            color: #fff;
            margin: 10px auto 0;
        }
        /*弹窗css*/
        .common-fuceng-box .fuceng-btn {
            display: block;
            width: 88px;
            height: 32px;
            text-align: center;
            line-height: 32px;
            font-size: 14px;
            border-radius: 2px;
        }
        a {
            text-decoration: none;
            outline: 0;
        }
        a:-webkit-any-link {
            color: -webkit-link;
            cursor: auto;
            text-decoration: underline;
        }
        .black-cover {
            width: 100%;
            height: 100%;
            background: #000;
            position: fixed;
            left: 0;
            top: 0;
            z-index: 9990;
            filter: alpha(opacity=60);
            -moz-opacity: .6;
            -khtml-opacity: .6;
            opacity: .6;
            display: none;
        }
        /*小导航*/

        element.style {
        }
        .header-box {
            position: relative;
            z-index: 100;
        }
        .header-box .small-nav .left-login-info {
            float: left;
            color: #576077;
        }
        .header-box .small-nav {
            height: 38px;
            line-height: 38px;
            background-color: #fafafa;
            border-bottom: 1px solid #f2f2f2;
            position: relative;
            z-index: 10;
        }

        /* a {
             text-decoration: none;
             outline: 0;
         }*/
        .clr-ff4800, .header-box .small-nav a.clr-ff4800 {
            color: #ff4800;
        }
        .header-box .right-menu {
            float: right;
        }
        .small-nav .right-menu .child-menu {
            display: inline-block;
            line-height: 12px;
            color: #576077;
            padding: 0 6px 0 10px;
            position: relative;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="header-box" data-current="home">
    <%--小导航--%>
    <div class="small-nav">
        <div class="width-1180">
            <div class="left-login-info">
                <c:if test="${empty sessionScope.user}">
                    <%--没登录情况--%>
                    <span class="clr-ff4800">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您好，请<a class="clr-ff4800" style="text-decoration: none;" href="/login">登录</a></span>&nbsp;
                    <a href="/register" style="text-decoration: none;">免费注册</a>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <%--已登录情况--%>
                <span class="clr-ff4800">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您好，${sessionScope.user.userName}</span>&nbsp;
                <a style="text-decoration: none;" href="/logout">[退出]
                    </c:if>
            </div>
            <div class="right-menu">
                <a href="/" data-point="1A1003" data-nav="treasure" class="child-menu" target="_self">首页</a>
                <a href="/publishList" data-point="1A1015" data-nav="lottery" class="child-menu" target="_self">个人中心</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </div>
</div>
<div class="page-body">
    <div id="left-right-layout">
        <!-- 区域顶部-->
        <div class="block-top">
            <div id="goodsinfo">
                <input type="hidden" name="goodsid" value="1498531339" />
                <div class="bl goods-pic">
                    <img src="${renting.houseImage}" style="width: 100%;height: 100%">
                </div>
            <c:if test="${empty sessionScope.user}">
                <div class="br goods-info">
                    <h3>${renting.houseName}</h3>
                    <p class="goods-title color-999">${renting.houseName}</p>
                    <div class="goods-price-wrapper">
                        <p>房屋租金：<em class="color-udou">登录后查看<s class="udou"></s></em></p>
                        <p>房屋面积：<em class="color-udou">登录后查看</em></p>
                        <p>所在地址：<em class="color-udou">${seckill.houseAddress}<s class="udou"></s></em></p>
                        <p>联系电话：<em class="color-udou">登录后查看<s class="udou"></s></em></p>
                        <p>重要说明：<em class="color-udou">${renting.remarks}</em></p>
                            <%-- <p>您的账户中有：0<s class="udou"></s></p>--%>
                    </div>
                        <%--<a href="javascript:;" id="seckill-box" class="exchange-btn J_exchangeBtn" data-exchangeType="1" data-address="0" data-pwd="true">立即抢购</a>--%>
                        <%-- <p class="color-999">仅限大陆地区配送，秒购确认后3-5天内发货 免运费</p>--%>
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.user}">
                <div class="br goods-info">
                    <h3>${renting.houseName}</h3>
                    <p class="goods-title color-999">${renting.houseName}</p>
                    <div class="goods-price-wrapper">
                        <p>房屋租金：<em class="color-udou">${renting.housePrice}元<s class="udou"></s></em></p>
                        <p>房屋面积：<em class="color-udou">${renting.houseSize}</em></p>
                        <p>所在地址：<em class="color-udou">${renting.houseAddress}<s class="udou"></s></em></p>
                        <p>联系电话：<em class="color-udou">${renting.phone}<s class="udou"></s></em></p>
                        <p>重要说明：<em class="color-udou">${renting.remarks}</em></p>
                       <%-- <p>您的账户中有：0<s class="udou"></s></p>--%>
                    </div>
                    <%--<a href="javascript:;" id="seckill-box" class="exchange-btn J_exchangeBtn" data-exchangeType="1" data-address="0" data-pwd="true">立即抢购</a>--%>
                   <%-- <p class="color-999">仅限大陆地区配送，秒购确认后3-5天内发货 免运费</p>--%>
                </div>
            </c:if>
                <div class="share-box">
                    <div class="jiathis_style">
                        <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt"><img src="http://v2.jiathis.com/code_mini/images/btn/v1/jiathis1.gif" border="0" /></a>
                        <a class="jiathis_counter_style_margin:3px 0 0 2px"></a>
                    </div>
                    <script type="text/javascript" >
                        var jiathis_config={
                            url:location.href,
                            summary:"${renting.houseName}",
                            title:"${renting.houseName}",
                            pic:"${renting.houseImage}",
                            shortUrl:true,
                            hideMore:false
                        }
                    </script>
                    <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
                </div>
            </div>

        </div>

        <!-- 区域主侧 -->
        <div class="block-main">
            <div id="goodsintro" class="mr20">
                <div class="tab">
                    <a href="javascript:;" class="tab-item J_tabItem tab-item1 active" data-index="1"><span>商品介绍</span></a>
                    <span class="xian"></span>
                    <%--<a href="javascript:;" class="tab-item J_tabItem tab-item2" data-index="2"><span>抽奖须知</span></a>--%>
                </div>

                <div class="tab-index tab-index-1">
                    <img alt="" src="${renting.houseImageOne}"  title="" align="" /><br />
                    <img alt="" src="${renting.houseImageTwo}"  title="" align="" /><br />
                    <img alt="" src="${renting.houseImageThree}"<%--width="750" height="1173"--%> title="" align="" />
                </div>
                <div class="tab-index tab-index-2" style="display:none;">
                    <img src="//img.juxiangyou.com/common/fun/mall/notes.jpg" alt="">

                    <div class="goods-delivery">
                        <h3><span class="tit">奖品寄送方式</span></h3>
                        <p>全部采用快递方式</p>
                    </div>

                    <div class="goods-process">
                        <h3><span class="tit">商品秒购流程</span></h3>
                        <p>1，商品价格已经包含邮寄费用在内，您无需另行支付。秒购前请确认您的真实身份！</p>
                        <p>2，在您要秒购的商品页面点击“立即秒购”按钮，秒购成功后需输入收件地址及联系方式！</p>
                        <p>3，收到订单后的开始准备商品！</p>
                        <p>4，商品将在您秒购成功后2-5个工作日内发出（商品状态您可通过“我的商品”查询）！</p>
                        <p>5，商品颜色为随机发送，敬请谅解！</p>
                    </div>
                </div>
            </div>

        </div>

        <!-- 区域右侧 -->
        <div class="block-right">
            <div class="fun-right mr20">
                <a href="//www.juxiangyou.com/news/details/17195"><img src="//img.juxiangyou.com/upload/www/area/507.jpg?1516265164" alt="" width="280px" height="240px"></a>
                <!-- 大家都在兑 -->
                <!-- 大家都在兑 -->
                <div class="p2p-gain-list mr20">
                    <div class="listbar-box">
                        <h3 class="listbar-text">
                            <i class="listbar-icon icon-try"></i>大家都在秒
                        </h3>
                    </div>
                    <div class="content-box scroll-gainlist J_gainlist">
                        <ul class="gain-infolist">
                           <%-- <li>
                                <div class="item-icon img-radius">
                                    <img src=//img.juxiangyou.com/avatar/default/15.jpg alt="">
                                </div>
                                <div class="item-content">
                                    <p>
                                        <span class="item-name">你觉***</span>
                                    </p>
                                    <p>
                                        <span class="item-info gray"> 3分钟之前秒中了</span>
                                    </p>
                                    <p>
                                        <span class="item-info yellow">小米Max2（64G）</span>
                                    </p>
                                </div>
                            </li>--%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- 区域底部 -->
        <div class="block-bottom"></div>
    </div>
</div>

<%--登录弹出层 输入电话--%>
<div id="killPhoneModal" class="modal fade">

    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title text-center" style="color: #3f3f4d; border-bottom: 2px solid #31c37c;">
                    <span class="glyphicon glyphicon-phone"> </span>完善个人信息:
                </h3>
            </div>

            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-8 col-xs-offset-2">
                        <input type="text" name="realName" id="realNameId" placeholder="请输入真实姓名" class="form-control"><br/>
                        <input type="text" name="mobileNo" id="killPhoneKey" placeholder="请输入手机号" class="form-control"><br/>
                        <input type="text" name="detailedAddress" id="addressId" placeholder="请输入收货地址" class="form-control">
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <%--验证信息--%>
                <span id="killPhoneMessage" class="glyphicon"> </span>
                <button type="button" id="killPhoneBtn" class="btn btn-success">
                    <%--<span class="glyphicon glyphicon-phone"></span>--%>
                    确认
                </button>
            </div>

        </div>
    </div>

</div>

<%--登录弹出层 确认登录--%>
<div id="killUser" class="modal fade">
    <div class="modal-dialog">
<div  class="common-fuceng-box" style="margin-top:25%;margin-left: -220px;">
    <div class="fuceng-head">
        <span class="fuceng-title">温馨提示</span>
        <%--<a class="fuceng-close J_closeCommonFc" href="#"></a>--%>
    </div>
    <div lass="fuceng-con">
        <p class="ts-text">您未登录，请先登录</p>
        </br>
        </br>
        </br>
        <div class="fuceng-btn-box clear-fix">
            <a id="aId" class="fuceng-btn fuceng-btn-qd J_closeCommonFc" href="#" style="text-decoration: none;">确定</a>
            <br/>
        </div>
    </div>
    </div>
        <div class="black-cover" style="display: block;"></div>
    </div>
</div>

<%--支付弹出层 --%>
<div id="killPay" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title text-center" style="color: #3f3f4d; border-bottom: 2px solid #31c37c;">
                     微信扫描支付
                </h3>
            </div>
            <div class="modal-body">
                <div class="row">
                        <div align="center">
                            <img src=/resource/img/5yuan.jpg alt="">
                        </div>
                </div>
            </div>
            <div class="modal-footer">
                <%--验证信息--%>
                <span id="killPhoneMessage" class="glyphicon"> </span>
                <button type="button" id="killPayId" class="btn btn-success">
                    <%--<span class="glyphicon glyphicon-phone"></span>--%>
                    确认
                </button>
            </div>
        </div>
    </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<%--jQuery Cookie操作插件--%>
<script src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<%--jQuery countDown倒计时插件--%>
<script src="https://cdn.bootcss.com/jquery.countdown/2.2.0/jquery.countdown.min.js"></script>

<script src="/resource/script/seckill.js" typ="text/javascript"></script>


<script type="text/javascript">
    $(function(){
        seckill.detail.init({
            seckillId:${seckill.seckillId},
            startTime:${seckill.startTime.time},
            endTime:${seckill.endTime.time}
        });
    })

</script>
<script type="text/javascript">
    /*window.onload = function() {
        document.onkeydown = function() {
            var e = window.event || arguments[0];
            //屏蔽F12
            if(e.keyCode == 123) {
                return false;
                //屏蔽Ctrl+Shift+I
            } else if((e.ctrlKey) && (e.shiftKey) && (e.keyCode == 73)) {
                return false;
                //屏蔽Shift+F10
            } else if((e.shiftKey) && (e.keyCode == 121)){
                return false;
            }
        };
        //屏蔽右键单击
        document.oncontextmenu = function() {
            return false;
        }
    }*/
</script>
</body>
</html>
