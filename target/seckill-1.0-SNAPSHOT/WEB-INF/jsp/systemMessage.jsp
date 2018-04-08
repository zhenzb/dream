<%--
  Created by IntelliJ IDEA.
  User: zzb
  Date: 2018/1/21
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/head.jsp"%>
<%@include file="common/tag.jsp"%>
<html>
<head>
    <meta name=”viewport” content=”width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no” />
    <link rel="shortcut icon" href="/resource/img/seckill.ico" />
    <link rel="bookmark"href="/resource/img/seckill.ico" />
    <script src="/resource/script/upload.js"></script>
    <title>个人中心</title>
    <style>
        body {
            min-width: 1180px;
        }
        #left-right-layout {
            width: 1180px;
            margin: 0 auto;
            overflow: hidden;
        }
        div {
            display: block;
        }
        .clear-fix {
        }
        body, button, input, select, textarea {
            font: 12px/1 Microsoft YaHei,"\5b8b\4f53",Tahoma,Helvetica,Arial,sans-serif;
        }
        .clear-fix:after, .clear-fix:before {
            display: table;
            content: "";
        }
        .clear-fix:after {
            clear: both;
        }
        reset.min.css:1
        .clear-fix:after, .clear-fix:before {
            display: table;
            content: "";
        }
        .left-nav {
            background: #fcfcfc;
            position: relative;
            z-index: 10;
            width: 178px;
            min-height: 618px;
        }
        .left-nav, .right-content {
            border: 1px solid #e8e8e8;
            float: left;
        }
        .right-content {
            width: 959px;
            min-height: 588px;
            margin-left: -1px;
            padding: 10px 20px 20px;
        }
        .right-content .personal-each-box .title {
            height: 32px;
            line-height: 32px;
            font-size: 14px;
            border-bottom: 1px solid #e8e8e8;
            margin: 0 0 10px;
        }
        .right-content .personal-each-box .title .box-name {
            color: #31c37c;
            font-weight: 700;
            float: left;
        }
        .personal-tbl {
            width: 100%;
            border: 1px solid #e8e8e8;
            border-bottom: none;
        }
        .personal-tbl {
            text-align: center;
            border-collapse: collapse;
            color: #576077;
        }
        .personal-tbl .thead {
            height: 36px;
            line-height: 36px;
            background-color: #f4f5f9;
        }
        .personal-tbl .tr {
            height: 39px;
            overflow: hidden;
            line-height: 39px;
            border-bottom: 1px solid #e8e8e8;
        }
        .personal-tbl .td1 {
            width: 129px;
            padding-left: 20px;
        }

        personal-page.min.css:1
        .personal-tbl .th {
            font-size: 14px;
            color: #3f3f4d;
        }
        personal-page.min.css:1
        .personal-tbl p {
            float: left;
            text-align: left;
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
        .personal-tbl .thead .td2 {
            color: #3f3f4d;
        }
        .personal-tbl .td3 {
            width: 91px;
        }
       /* .personal-tbl .td4 {
            width: 322px;
        }*/
        .personal-tbl .td5 {
            width: 99px;
            text-align: right;
        }
        .personal-tbl .td6 {
            width: 120px;
            text-align: right;
        }
        .personal-tbl .tbody {
            font-size: 12px;
            color: #576077;
        }
        .personal-tbl .tr {
            height: 39px;
            overflow: hidden;
            line-height: 39px;
            border-bottom: 1px solid #e8e8e8;
        }
        .personal-tbl .td1 {
            width: 129px;
            padding-left: 20px;
        }
        .personal-tbl p {
            float: left;
            text-align: left;
        }
        .personal-tbl .td2 {
            width: 165px;
            color: #999;
        }
        .personal-tbl .td3 {
            width: 91px;
        }
        .personal-tbl .td4 {
            width: 230px;
        }
        .personal-tbl .td5.postive {
            color: #f60;
        }
        .personal-tbl .td6 {
            width: 120px;
            text-align: right;
        }
        .personal-tbl .tr.even {
            background-color: #f7f8fb;
        }

    /*顶部条*/
        element.style {
        }
        .header-box {
            position: relative;
            z-index: 100;
        }
        .header-box .small-nav .left-login-info {
            /*float: left;*/
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
        /*.header-box .small-nav .left-login-info {
            !* float: left; *!
            color: #576077;
        }*/
        .clr-ff4800, .header-box .small-nav a.clr-ff4800 {
            color: #ff4800;
        }
        a {
            text-decoration: none;
            outline: 0;
        }
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

        /*顶部大图*/
        .top-info-box {
            height: 247px;
            padding: 51px 0 0;
            margin: 0 0 20px;
            background: url(//img.juxiangyou.com/common/personal/top_bg.jpg) no-repeat top center;
        }
        .top-info-box .info-box {
            width: 1180px;
            margin: 0 auto;
        }
        .top-info-box .info-box .index-up {
            width: 100%;
            height: 180px;
        }
        .top-info-box .index-up .index-up-left {
            width: 817px;
            height: 180px;
            float: left;
        }
        .top-info-box .index-up-left .user-img {
            display: block;
            width: 172px;
            height: 172px;
            border-radius: 100%;
            border: 4px solid #bbcff6;
            overflow: hidden;
            float: left;
            position: relative;
        }
        .user-img .cover {
            -webkit-transition: all .3s ease;
            -o-transition: all .3s ease;
            transition: all .3s ease;
        }
        .user-img .cover {
            bottom: -172px;
        }
        .user-img .cover, .user-img .cover .modify-tx {
            width: 172px;
            height: 172px;
            position: absolute;
            left: 0;
        }
        .user-img .cover .opacity {
            width: 172px;
            height: 172px;
        }
        .opacity {
            background-color: #000;
            opacity: .7;
            filter: alpha(opacity=70);
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=70)";
            filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=70);
            z-index: -1;
        }
        .top-info-box .index-up-left .user-info {
            width: 617px;
            margin: 0 0 0 20px;
            float: left;
        }
        .top-info-box .user-info .user-name {
            height: 30px;
            line-height: 30px;
            margin-top: 21px;
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
        blockquote, body, button, dd, dl, dt, fieldset, h1, h2, h3, h4, h5, h6, hr, input, legend, li, ol, p, pre, td, textarea, th, ul {
            margin: 0;
            padding: 0;
        }

        .top-info-box .user-name .u-name {
            font-size: 16px;
            font-weight: 700;
            color: #fafafa;
        }
        .top-info-box .description {
            font-size: 14px;
            color: #9ec1f8;
        }
        .top-info-box .user-info .u-info {
            font-size: 16px;
            color: #fafafa;
            line-height: 32px;
        }
        .top-info-box .user-info .p1 {
            margin: 14px 0 0;
        }
        .top-info-box .user-info .u-info {
            font-size: 16px;
            color: #fafafa;
            line-height: 32px;
        }
        .ubi_2 {
            width: 11px;
            height: 11px;
        }
        .ubi, .ubi-big, .ubi-gray, .udou, .udou-gray, .uquan, .uquan-gray {
            display: inline-block;
            background: url(//img.juxiangyou.com/common/public/ubi.png) no-repeat 0 0;
            margin: 0 0 0 3px;
        }
        i, cite, em, var, address, dfn {
            font-style: italic;
        }
        .top-info-box .user-info .u-info a {
            font-size: 14px;
            color: #ff0;
        }
        a {
            text-decoration: none;
            outline: 0;
        }
        .top-info-box .info-scroll {
            display: inline-block;
            width: 150px;
            height: 12px;
            background-color: #afd0fa;
            border-radius: 4px;
            overflow: hidden;
        }
        .top-info-box .description {
            font-size: 14px;
            color: #9ec1f8;
        }
        .top-info-box .index-up .index-up-right {
            width: 280px;
            height: 120px;
            float: right;
            margin: 45px 40px 0 0;
        }
        .exper-ul li p, .top-info-box .index-up-right .signin-count {
            color: #afd0fa;
            text-align: center;
        }
        .top-info-box .index-up-right .signin-btn-ready {
            background-color: #aaa;
        }
        .top-info-box .index-up-right .signin-btn {
            display: block;
            width: 280px;
            height: 60px;
            line-height: 60px;
            text-align: center;
            font-size: 24px;
            background-color: #31c37c;
            color: #fff;
            margin: 15px 0 17px;
            border-radius: 2px;
        }
        .index-up-right .signin-btn .signin-icon {
            display: inline-block;
            width: 24px;
            height: 26px;
            background: url(//img.juxiangyou.com/common/personal/signin_icon.png) no-repeat center center;
            vertical-align: middle;
            margin: -5px 10px 0 0;
        }
        /*左侧导航*/
        .left-nav .ul-nav li.nav-head {
            border-bottom: 1px solid #e8e8e8;
            height: 36px;
            line-height: 36px;
            font-weight: 700;
            margin: 10px auto 6px;
            width: 138px;
            padding: 0;
        }
        .left-nav .ul-nav li {
            height: 30px;
            line-height: 30px;
            width: 150px;
            margin: 0 auto;
            padding: 0 0 0 28px;
            font-size: 14px;
            background-color: #fcfcfc;
        }
        blockquote, body, button, dd, dl, dt, fieldset, h1, h2, h3, h4, h5, h6, hr, input, legend, li, ol, p, pre, td, textarea, th, ul {
            margin: 0;
            padding: 0;
        }
        li {
            display: list-item;
            text-align: -webkit-match-parent;
        }
        .left-nav .ul-nav li.nav-head .i2 {
            background-position: -22px 0;
        }
        .left-nav .ul-nav li.nav-head .nav-icon {
            display: inline-block;
            width: 18px;
            height: 18px;
            background: url(//img.juxiangyou.com/common/personal/nav_icon.png) no-repeat;
            vertical-align: middle;
            margin: 0 4px 0 0;
        }
        .left-nav .ul-nav li.nav-head .title {
            font-size: 16px;
            color: #576077;
            vertical-align: middle;
        }
       /* .left-nav .Basic #Basic, .left-nav .Captcha #Captcha, .left-nav .CashAccount #CashApply, .left-nav .CashApply #CashApply, .left-nav .CashRecord #CashApply, .left-nav .Chess #Games, .left-nav .Finance #P2P, .left-nav .FinanceBill #P2P, .left-nav .Games #Games, .left-nav .Order #Order, .left-nav .Prize #Prize, .left-nav .UbiDetail #UbiDetail, .left-nav .UdouAccount #UdouAccount, .left-nav .Welfare #Welfare {
            height: 30px;
            background: url(//img.juxiangyou.com/common/personal/nav_selected.png) no-repeat 124px 11px;
        }*/
        li {
            display: list-item;
            text-align: -webkit-match-parent;
        }
        ol, ul {
            list-style: none;
        }
        /*系统公告*/
        #left-right-layout .block-main {
            width: 880px;
            float: left;
            min-height: 800px;
            position: relative;
        }
        .article-box .nav-bread {
            height: 35px;
            line-height: 35px;
            background: #f4f5f9;
            border-bottom: 1px solid #e5e5e5;
            color: #999;
            padding-left: 20px;
        }
        .article-box {
            padding-bottom: 27px;
            margin-bottom: 20px;
        }
        .article-box, .list-box, .tab-box .tab-a {
            border: 1px solid #e8e8e8;
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
        .article-box .article .writer-p {
            color: #999;
            font-size: 12px;
            text-align: center;
            line-height: 35px;
        }
        .article-box .article .article-zw {
            padding: 16px 0;
            margin: 0 20px;
            border-top: 1px dotted #e5e5e5;
            border-bottom: 1px dotted #e5e5e5;
            min-height: 807px;
        }
        .advance-list li, .article-box .page-p {
            line-height: 36px;
            height: 36px;
            padding: 0 20px;
        }
        .article-box .article h3 {
            font-size: 16px;
            color: #576077;
            text-align: center;
            font-weight: 700;
            line-height: 22px;
            margin: 27px 0 0;
        }
        .article-box .nav-bread .current {
            color: #31c37c;
        }
        #Welfare {
            height: 30px;
            background: url(//img.juxiangyou.com/common/personal/nav_selected.png) no-repeat 124px 11px;
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
                    <span class="clr-ff4800">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您好，请<a class="clr-ff4800" href="/login">登录</a></span>&nbsp;
                    <a href="/register">免费注册</a>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <%--已登录情况--%>
                    <span class="clr-ff4800">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您好，${sessionScope.user.userName}</span>&nbsp;
                    <a href="/logout">[退出]</a>
                </c:if>
                <div class="right-menu">
                    <a href="/" data-point="1A1003" data-nav="treasure" class="child-menu" target="_self">首页</a>
                    <a href="/successKilled/findUserSuccessKilled" data-point="1A1015" data-nav="lottery" class="child-menu" target="_self">个人中心</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </div>
    </div>
</div>
<div class="top-info-box">

    <div id="ptop-info-box" class="info-box" data-phone="18053509883">
        <div class="index-up">
            <div class="index-up-left">
                <c:if test="${empty sessionScope.user.headUrl}">
                    <span class="user-img"  onclick='uploadHead()'>
                        <img id="imgId" src="/resource/img/smallIco/headImg100.jpg" width="172" height="172">
                        <input id="headId" name="headPhone" type="file"  onchange="headImg()"/>
                        <div class="cover">
                            <div class="opacity"></div>
                            <a href="/personal/Photo" class="modify-tx">修改头像</a>
                        </div>
                    </span>
                </c:if>
                <c:if test="${not empty sessionScope.user.headUrl}">
                    <span class="user-img"  onclick='uploadHead()'>
                        <img i src="${sessionScope.user.headUrl}" width="172" height="172">
                        <input id="headId2" name="headPhone" type="file"  onchange="headImg()"/>
                    </span>
                </c:if>
                <div class="user-info">
                    <p class="user-name">
                        <span class="u-name">${sessionScope.user.userName}&nbsp;&nbsp;<img src="${sessionScope.userAccount.levelImg}"/></span>
                        <span class="description">（ID：1763205）</span>

                    </p>
                    <p class="u-info p1">
                        金币余额：
                        <span id="ubi_ye" class="" data-ubi="22343">${sessionScope.userAccount.gold}</span><i class="ubi_2"></i>
                        &nbsp;&nbsp;
                        <%--<a href="/personal/CashApply" class="J_verifyPhone">提现</a>--%>
                    </p>
                    <p class="u-info">
                        银豆余额：
                        <span id="ubi_ckx" class="ubi-count" data-ubi="0">${sessionScope.userAccount.silverBean}</span><i class="udou"></i>
                        &nbsp;&nbsp;
                        <%--<a href="/fun/mall" class="" target="_blank">抽奖</a>--%>
                    </p>
                    <p class="u-info">
                        账户安全系数：
                        <span class="info-scroll">
						<span class="scroll" style="width:80%"></span>
					</span>
                        <span class="description">
						&nbsp;80%&nbsp;&nbsp;&nbsp;
					</span>

                        <%--<a href="/personal/Basic">提升账号安全</a>--%>

                    </p>
                </div>
            </div>
            <div class="index-up-right">
                <p class="signin-count">
                    累计发布商品&nbsp; &nbsp;<font color="#ff0000">${sessionScope.successSize}</font>&nbsp; &nbsp;件
                </p>

                <span class="signin-btn signin-btn-ready"><i class="signin-icon"></i>${sessionScope.userAccount.remarks}</span>

            </div>
        </div>
    </div>

</div>
<div id="left-right-layout">
    <div class="main-content clear-fix" style="margin-bottom: 20px;">
        <div class="left-nav" style="height: 968px;">
        <ul class="ul-nav Games">

            <li class="nav-head">
                <i class="nav-icon i2"></i>
                <span class="title">我的账户</span>
            </li>
            <li id="Games">
                <a href="/publishList">发布记录</a>
            </li>
            <li id="Order" >
                <a href="/pg" >商品记录</a>
            </li>
            <li id="recruits">
                <a href="/recruitCenter">招聘记录</a>
            </li>
            <li id="P2P">
                <a href="/goldPersonalCenter">金币明细</a>
            </li>

            <li id="Captcha">
                <a href="/silverBeanPersonalCenter">银豆明细</a>
            </li>
            <li id="Welfare">
                <a href="/messagePersonalCenter" style="color: #31c37c;">我的消息</a>
            </li>
            <%--<li class="nav-head">
                <i class="nav-icon i1"></i>
                <span class="title">我的账户</span>
            </li>
            <li id="UbiDetail">
                <a href="/personal/UbiDetail">U币账户</a>
            </li>
            <li id="UdouAccount">
                <a href="/personal/UdouAccount">U豆账户</a>
            </li>
            <li id="CashApply">
                <a href="/personal/CashApply">我要提现</a>
            </li>
            <li id="Prize">
                <a href="/personal/Prize">我的奖品</a>
            </li>
            <li id="Order">
                <a href="/personal/Order">我的订单</a>
            </li>
            <li id="Basic">
                <a href="/personal/Basic">安全设置</a>
            </li>--%>
        </ul>
    </div>
        <!-- 区域主侧 -->
        <div class="block-main">
            <div class="article-box" data-code="10000">
                <p class="nav-bread">当前位置：<a href="/" class="index-a">主页</a> >
                    <span class="current">系统公告</span>
                </p>
                <c:if test="${systemMessage.id == 111111}">
                <div class="article">
                    <h3>${systemMessage.messageTitle}</h3>
                    <p class="writer-p">发布时间：2018-05-2 18:53:02&nbsp;&nbsp;&nbsp;&nbsp;作者：亿客网&nbsp;&nbsp;&nbsp;&nbsp;点击：4828次</p>
                    <div class="article-zw">
				<span style="color: rgb(74, 74, 74); font-family: Verdana, 宋体; "><span style="font-size: 14px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="font-size:16px;">热烈庆祝</span></span><span style="font-size:16px;"><span style="color: rgb(255, 0, 0); ">亿客网</span>上线！</span><br />
<br />
		<span style="font-size:16px;"><span style="line-height: 22px; ">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span>亿客网</span></span><span style="font-family: Verdana, 宋体; font-size: 14px; "><span style="line-height: 22px; "><font color="#4a4a4a">是一个专注于货真价实的二手百货发布平台，会员可以随时浏览查看自己喜欢的商品直接联系卖家进行现场交易。</font><br />
		<font color="#4a4a4a">&nbsp; &nbsp; &nbsp; 所有用户都有机会在亿客网发布自己的闲置物品还能得到银豆奖励，可以选择</font><span style="color: rgb(255, 0, 0); ">兑换奖品</span><font color="#4a4a4a">或是</font><span style="color: rgb(255, 0, 0); ">提现人民币</span><font color="#4a4a4a">。</font><br />
		<font color="#4a4a4a">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;近期即将推出</font><font color="#ff0000">挖宝藏、试玩打码嗨翻天活动</font><font color="#4a4a4a">，轻松参与，奖励丰厚，敬请期待！</font></span></span><br style="color: rgb(74, 74, 74); font-family: Verdana, 宋体; " />
                        <span style="color: rgb(74, 74, 74); font-family: Verdana, 宋体; font-size: 14px; line-height: 22px; ">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color: rgb(74, 74, 74); font-family: Verdana, 宋体; font-size: 14px; ">想要低价购物快速赚钱么，那就来亿客网吧！</span><br />

                    </div>
                </div>
                </c:if>
                <c:if test="${systemMessage.id == 222222}">
                    <div class="article">
                        <h3>${systemMessage.messageTitle}</h3>
                        <p class="writer-p">发布时间：2018-03-2 18:53:02&nbsp;&nbsp;&nbsp;&nbsp;作者：亿客网&nbsp;&nbsp;&nbsp;&nbsp;点击：563次</p>
                        <div class="article-zw">
				<span style="color: rgb(74, 74, 74); font-family: Verdana, 宋体; "><span style="font-size: 14px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="font-size:16px;">会员等级评审</span></span><span style="font-size:16px;"><span style="color: rgb(255, 0, 0); ">亿客网</span>标准！</span><br />
<br />
		<span style="font-size:16px;"><span style="line-height: 22px; ">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span>亿客网</span></span><span style="font-family: Verdana, 宋体; font-size: 14px; "><span style="line-height: 22px; "><font color="#4a4a4a">里的所有会员在发布商品的时候都会得到相应银豆奖励。</font><br />
		<font color="#4a4a4a">&nbsp; &nbsp; &nbsp; 每发一次商品可获得2000银豆，银豆是会员</font><span style="color: rgb(255, 0, 0); ">晋级</span><font color="#4a4a4a">或是</font><span style="color: rgb(255, 0, 0); ">其他权益大小的标准</span><font color="#4a4a4a">。</font><br />
		<font color="#4a4a4a">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;近期即将推出</font><font color="#ff0000">挖宝藏、试玩打码嗨翻天活动</font><font color="#4a4a4a">，轻松参与，奖励丰厚，敬请期待！</font></span></span><br style="color: rgb(74, 74, 74); font-family: Verdana, 宋体; " />
                            <span style="color: rgb(74, 74, 74); font-family: Verdana, 宋体; font-size: 14px; line-height: 22px; ">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color: rgb(74, 74, 74); font-family: Verdana, 宋体; font-size: 14px; ">银豆值与会员等级对照表！</span><br />
                            <table>
                                <tr>
                                    &nbsp; &nbsp; &nbsp; &nbsp; <td>银豆值</td>
                                    <td>会员等级</td>
                                </tr>
                                <tr>
                                    <td> 大于等于10000 </td>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    <td> 普通会员 </td>
                                </tr>
                                <tr>
                                    <td> 大于等于15000 </td>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    <td> 白银会员 </td>
                                </tr>
                                <tr>
                                    <td> 大于等于30000 </td>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    <td> 黄金会员 </td>
                                </tr>
                                <tr>
                                    <td> 大于等于60000 </td>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    <td> 白金会员 </td>
                                </tr>
                                <tr>
                                    <td> 大于等于120000 </td>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    <td> 钻石会员 </td>
                                </tr>
                                <tr>
                                    <td> 大于等于200000 </td>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    <td> 黑钻会员 </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </c:if>
                <p class="page-p">

                   <%-- <a href="/news/details/41" class="page-a mar">上一篇：【玩家必看】防盗小常识</a>--%>



                   <%-- <a href="/news/details/35" class="page-a">下一篇：【用户规则】严禁小号规则</a>--%>

                </p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    window.onload = function() {
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
    }
</script>
</body>
</html>
