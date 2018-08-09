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
    <link rel="stylesheet" href="/resource/css/publishGoods.css"/>
    <script src="/resource/script/laydate/laydate.js"></script>
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
      /*  reset.min.css:1*/
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
            width: 12%;
            padding-left: 20px;
        }

       /* personal-page.min.css:1*/
        .personal-tbl .th {
            font-size: 14px;
            color: #3f3f4d;
        }
       /* personal-page.min.css:*/
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
            height: 231px;
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
        /*.left-nav .Basic #Basic, .left-nav .Captcha #Captcha, .left-nav .CashAccount #CashApply, .left-nav .CashApply #CashApply, .left-nav .CashRecord #CashApply, .left-nav .Chess #Games, .left-nav .Finance #P2P, .left-nav .FinanceBill #P2P, .left-nav .Games #Games, .left-nav .Order #Order, .left-nav .Prize #Prize, .left-nav .UbiDetail #UbiDetail, .left-nav .UdouAccount #UdouAccount, .left-nav .Welfare #Welfare {
            height: 30px;
            background: url(//img.juxiangyou.com/common/personal/nav_selected.png) no-repeat 124px 11px;
        }*/
        li {
            display: list-item;
            text-align: -webkit-match-parent;
        }
       /* .clr-31c37c, .left-nav .Basic #Basic a, .left-nav .Captcha #Captcha a, .left-nav .CashAccount #CashApply a, .left-nav .CashApply #CashApply a, .left-nav .CashRecord #CashApply a, .left-nav .Chess #Games a, .left-nav .Finance #P2P a, .left-nav .FinanceBill #P2P a, .left-nav .Games #Games a, .left-nav .Order #Order a, .left-nav .Prize #Prize a, .left-nav .UbiDetail #UbiDetail a, .left-nav .UdouAccount #UdouAccount a, .left-nav .Welfare #Welfare a, .left-nav .ul-nav li a:hover, .personal-referrer-list li.games .cover .info .name, .right-content .personal-each-box .title .tag2:hover, .right-content .personal-each-box .title .tag:hover {
            color: #31c37c;
        }*/
        ol, ul {
            list-style: none;
        }
        #renting {
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
                    <a href="/publishList" data-point="1A1015" data-nav="lottery" class="child-menu" target="_self">个人中心</a>
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
                        <span class="u-name">${sessionScope.user.userName}</span>
                        <%--<span class="description">（ID：1763205）</span>--%>

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
                   <%-- <p class="u-info">
                        账户安全系数：
                        <span class="info-scroll">
						<span class="scroll" style="width:80%"></span>
					</span>
                        <span class="description">
						&nbsp;80%&nbsp;&nbsp;&nbsp;
					</span>--%>

                        <%--<a href="/personal/Basic">提升账号安全</a>--%>

                    </p>
                </div>
            </div>
            <div class="index-up-right">
                <p class="signin-count">
                    今日成交量69次
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
                    <a href="/publishList">商品记录</a>
                </li>
                <li id="Games">
                    <a href="/recruitCenter">招聘记录</a>
                </li>
                <li id="Order" >
                    <a href="/pg" >发布商品</a>
                </li>
                <li id="recruit" >
                    <a href="/publishRecruit">发布招聘</a>
                </li>
                <li id="renting" >
                    <a href="/rentingpublish" style="color: #31c37c;">发布租房</a>
                </li>
                <li id="P2P">
                    <a href="/goldPersonalCenter">金币明细</a>
                </li>

                <li id="Captcha">
                    <a href="/silverBeanPersonalCenter">银豆明细</a>
                </li>
                <li id="Welfare">
                    <a href="/messagePersonalCenter">我的消息</a>
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
        <div class="right-content">
            <div class="personal-each-box"></div>
            <div class="personal-each-box">
                <div class="title">
                    <span class="box-name">发布招聘</span>
                </div>
                <div class="panel admin-panel margin-top" id="add">
                   <%-- <div class="panel-head"><strong>增加内容</strong></div>--%>
                    <div class="formselect">
                        <div action="" class="form-group" id="form">
                            <div class="form-group-select">
                                <!-- 租房表单 -->
                                <form method="post" class="form-group" id="formUpdate"
                                      enctype="multipart/form-data">
                                    <div class="activeForm" id="activeForm">
                                        <input type="hidden" id="flashSaleId" name="flashSaleId"/>
                                        <!--房屋名称-->
                                        <div class="form-group">
                                            <div class="label">
                                                <label>房屋名称:</label>
                                            </div>
                                            <div class="activeTitle">
                                                <input type="text" name="houseName" id="title" style="width: 100%;"
                                                       placeholder="请在此填写房屋名称..." maxlength="10"/>
                                            </div>
                                            <div class="tips">
                                                <span id="titlenone" style="color: red"></span>
                                            </div>
                                        </div>
                                        <!--招聘职位-->
                                        <div class="form-group">
                                            <div class="label">
                                                <label>房屋面积:</label>
                                            </div>
                                            <div class="activeTitle">
                                                <input type="text" name="houseSize" id="positionTypeId" style="width: 100%;"
                                                       placeholder="请在此填房屋面积..." maxlength="10"/>
                                            </div>
                                            <div class="tips">
                                                <span id="positionTypenone" style="color: red"></span>
                                            </div>
                                        </div>
                                        <!--招聘人数-->
                                        <div class="form-group">
                                            <div class="label">
                                                <label>租房价格:</label>
                                            </div>
                                            <div class="activeTitle">
                                                <input type="text" name="housePrice" id="recruitNumberId" style="width: 100%;"
                                                       placeholder="请在此填写租房价格..." maxlength="10"/>
                                            </div>
                                            <div class="tips">
                                                <span id="recruitNumbernone" style="color: red"></span>
                                            </div>
                                        </div>
                                        <!--学历资质-->
                                       <%-- <div class="form-group">
                                            <div class="label">
                                                <label>学历资质:</label>
                                            </div>
                                            <div class="activeTitle">
                                                <input type="text" name="education" id="educationId" style="width: 100%;"
                                                       placeholder="请在此填写学历资质..." maxlength="10"/>
                                            </div>
                                            <div class="tips">
                                                <span id="educationnone" style="color: red"></span>
                                            </div>
                                        </div>--%>
                                        <!--工作年限-->
                                       <%-- <div class="form-group">
                                            <div class="label">
                                                <label>工作年限:</label>
                                            </div>
                                            <div class="activeTitle">
                                                <input type="text" name="duration" id="durationId" style="width: 100%;"
                                                       placeholder="请在此填写工作年限..." maxlength="10"/>
                                            </div>
                                            <div class="tips">
                                                <span id="durationnone" style="color: red"></span>
                                            </div>
                                        </div>--%>
                                        <!--福利待遇-->
                                       <%-- <div class="form-group">
                                            <div class="label">
                                                <label>工资待遇:</label>
                                            </div>
                                            <div class="activeTitle">
                                                <input type="text" name="welfare" id="welfareId" style="width: 100%;"
                                                       placeholder="请在此填写工资待遇..." maxlength="15"/>
                                            </div>
                                            <div class="tips">
                                                <span id="welfarenone" style="color: red"></span>
                                            </div>
                                        </div>--%>
                                        <!--联系人-->
                                        <div class="form-group">
                                            <div class="label">
                                                <label>联系人:</label>
                                            </div>
                                            <div class="activeTitle">
                                                <input type="text" name="contactsName" id="ContactsNameId" style="width: 100%;"
                                                       placeholder="请在此填联系人..." maxlength="10"/>
                                            </div>
                                            <div class="tips">
                                                <span id="ContactsNamenone" style="color: red"></span>
                                            </div>
                                        </div>
                                        <!--原价-->
                                        <div class="form-group">
                                            <div class="label">
                                                <label>联系电话:</label>
                                            </div>
                                            <div class="activeNum">
                                                <input type="tel" id="ContactsPhoneId" name="phone"
                                                       style="width: 100%;"
                                                       value="0" onfocus="if (value =='0'){value =''}"
                                                       onblur="if (value ==''){value='0'}"
                                                       onkeyup="this.value=this.value.replace(/\D/g,'')"
                                                       onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                                            </div>
                                            <div class="tips">
                                                <span id="ContactsPhonenone" style="color: red"></span>
                                            </div>
                                        </div>
                                        <!--办公地址-->
                                        <div class="form-group">
                                            <div class="label">
                                                <label>地址:</label>
                                            </div>
                                            <div class="activeTitle">
                                                <input type="text" name="houseAddress" id="jobAddressId" style="width: 100%;"
                                                       placeholder="请在此填房屋地址..." maxlength="50"/>
                                            </div>
                                            <div class="tips">
                                                <span id="jobAddressnone" style="color: red"></span>
                                            </div>
                                        </div>


                                        <!--招聘时间-->
                                        <div class="form-group">
                                            <div class="label">
                                                <label>租房时间:</label>
                                            </div>
                                            <div class="activeTime">
                                                开租时间:<input type="text" class="demo-input" placeholder="请选择日期" id="startDate"
                                                            name="validBeginDate" style="width: 80%;"/>
                                            </div>
                                            <div class="tips">
                                                <span id="startDatenone" style="color: red;"></span>
                                            </div>
                                            <div class="tips">
                                                <span id="comparenone-star" style="color: red;"></span>
                                            </div>
                                            <%--<div class="activeTime">
                                                结束时间:<input type="text" class="demo-input" placeholder="请选择日期" id="endDate"
                                                            name="validEndDate" style="width: 80%"/>
                                            </div>--%>
                                            <%--<div class="tips">
                                                <span id="endDatenone" style="color: red;"></span>
                                            </div>--%>
                                            <div class="tips">
                                                <span id="comparenone-end" style="color: red;"></span>
                                            </div>
                                        </div>

                                        <!--其他说明-->
                                        <div class="form-group">
                                            <div class="label">
                                                <label>其他说明:</label>
                                            </div>
                                            <div class="equityRemind">
                                    <textarea placeholder="请在此填写其他说明100字内..." id="RemarksId" name="remark"
                                              style="resize:none;width: 100%;height: 60px;" maxlength="50"></textarea>
                                            </div>
                                            <div class="tips">
                                                <span id="Remarksnone" style="color: red"></span>
                                            </div>
                                        </div>
                                        <!--banner图-->
                                        <div class="form-group">
                                            <!--banner图-->
                                            <div class="form-group">
                                                <div class="label">
                                                    <label>首图片:</label>
                                                    <span  style="color:#808080">（图片格式：jpg/jpeg/png，建议尺寸：800*600px）</span>
                                                </div>

                                                <div class="field" >
                                                    <input onchange="changImg(event,'image1')" name="houseImage" type="file" class="file"
                                                           id="sdfFile"/>
                                                    <img id="image1" src="../images/sc.jpg"/>
                                                </div>
                                                <div class="tips">
                                                    <span id="imgSdfnone" style="color:red"></span>
                                                </div>
                                                <!--详情图片1-->
                                                <div class="label">
                                                    <label>祥图1:</label>
                                                </div>

                                                <div class="field">
                                                    <input onchange="changImg_1(event,'image1_1')" name="houseImage_one" type="file" class="file"
                                                           id="sdfFile_1"/>
                                                    <img id="image1_1" src="../images/sc.jpg"/>
                                                </div>
                                                <div class="tips">
                                                    <span id="imgSdfnone_1" style="color:red"></span>
                                                </div>
                                                <!--详情图片2-->
                                                <div class="label">
                                                    <label>详图2:</label>
                                                </div>

                                                <div class="field" >
                                                    <input onchange="changImg_2(event,'image1_2')" name="houseImage_two" type="file" class="file"
                                                           id="sdfFile_2"/>
                                                    <img id="image1_2" src="../images/sc.jpg"/>
                                                </div>
                                                <div class="tips">
                                                    <span id="imgSdfnone_2" style="color:red"></span>
                                                </div>
                                                <!--详情图片3-->
                                                <div class="label">
                                                    <label>祥图3:</label>
                                                </div>

                                                <div class="field" >
                                                    <input onchange="changImg_3(event,'image1_3')" name="houseImage_three" type="file" class="file"
                                                           id="sdfFile_3"/>
                                                    <img id="image1_3" src="../images/sc.jpg"/>
                                                </div>
                                                <div class="tips">
                                                    <span id="imgSdfnone_3" style="color:red"></span>
                                                </div>

                                                <%--<div class="button">
                                                    <button type="button" class="btn btn-info" id="save_btn" onclick="f_change()">发布
                                                    </button>
                                                </div>--%>
                                            </div>
                                            <%--<div class="label">
                                                <label>公司logo:</label>
                                                <span  style="color:#808080">（图片格式：jpg/jpeg/png，建议尺寸：800*600px）</span>
                                            </div>

                                            <div class="field" >
                                                <input onchange="changImg(event,'image1')" name="logoUrl" type="file" class="file"
                                                       id="sdfFile"/>
                                                <img id="image1" src="../images/sc.jpg"/>
                                            </div>
                                            <div class="tips">
                                                <span id="imgSdfnone" style="color:red"></span>
                                            </div>--%>
                                            <div class="button">
                                                <button type="button" class="btn btn-info" id="save_btn" onclick="f_change()">保存
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
            </div>
        </div>
    </div>
</div>
<!-- jQuery 3 -->
<script src="/resource/script/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        var totalPages = $("#totalPages").val();
        var number = $("#number").val();

        for (var i = 0; i < totalPages; i++) {
            var elementById = document.getElementById('select');
            elementById.add(new Option("第" + (i + 1) + "页", i));
        }
        $("#select option[value='" + number + "']").attr("selected", true);
    });

    $("select#select").change(function () {

        window.location.href = "/flashSaleController/flashSaleList?page=" + $(this).val();
    });

    function edit(id) {
        $("#flashSaleId").val(id);
        $.ajax({
            async: false,
            type: 'POST',
            url: '/recruit/addRecruit',
            dataType: 'json',
            data: {
                flashSaleId: id,
            },
            success: function (jsonObject) {
                console.log(jsonObject.object);
                var object = jsonObject.object
                var status = jsonObject.status;
                if (status === "SUCCESS") {
                    var beginDate = ""
                    var endDate = ""
                    if (object.validBeginDate != null && object.validBeginDate != "") {
                        beginDate = getMyDate(object.validBeginDate);
                    }
                    if (object.validEndDate != null && object.validEndDate != "") {
                        endDate = getMyDate(object.validEndDate);
                    }
                    $("#title").val(object.productName);
                    $("#commodityPrice").val(object.originalPrice);
                    $("#seckillPrice").val(object.currentPrice);
                    $("#startDate").val(beginDate);
                    $("#endDate").val(endDate);
                    $("#seckillNum").val(object.amount);
                    $("#minuteMsg").val(object.merchantDescribe);
                    $("#image1").attr("src", object.bannerUrl);
                } else {
                    alert("没有此活动信息");
                }


            }
        });


    }

    function changImg(e, name) {
        var img = document.getElementById('image1');
        for (var i = 0; i < e.target.files.length; i++) {
            var file = e.target.files.item(i);
            if (!(/^image\/.*$/i.test(file.type))) {
                continue; //不是图片 就跳出这一次循环
            }
            //实例化FileReader API
            var freader = new FileReader();
            freader.readAsDataURL(file);
            freader.onload = function (e) {
                img.width = "580";
                img.height = "380";
                console.log(e.target.result);
                $("#" + name).attr("src", e.target.result);
            }
        }
    }
    function changImg_1(e, name) {
        var img = document.getElementById('image1_1');
        for (var i = 0; i < e.target.files.length; i++) {
            var file = e.target.files.item(i);
            if (!(/^image\/.*$/i.test(file.type))) {
                continue; //不是图片 就跳出这一次循环
            }
            //实例化FileReader API
            var freader = new FileReader();
            freader.readAsDataURL(file);
            freader.onload = function (e) {
                img.width = "580";
                img.height = "380";
                console.log(e.target.result);
                $("#" + name).attr("src", e.target.result);
            }
        }
    }
    function changImg_2(e, name) {
        var img = document.getElementById('image1_2');
        for (var i = 0; i < e.target.files.length; i++) {
            var file = e.target.files.item(i);
            if (!(/^image\/.*$/i.test(file.type))) {
                continue; //不是图片 就跳出这一次循环
            }
            //实例化FileReader API
            var freader = new FileReader();
            freader.readAsDataURL(file);
            freader.onload = function (e) {
                img.width = "580";
                img.height = "380";
                console.log(e.target.result);
                $("#" + name).attr("src", e.target.result);
            }
        }
    }
    function changImg_3(e, name) {
        var img = document.getElementById('image1_3');
        for (var i = 0; i < e.target.files.length; i++) {
            var file = e.target.files.item(i);
            if (!(/^image\/.*$/i.test(file.type))) {
                continue; //不是图片 就跳出这一次循环
            }
            //实例化FileReader API
            var freader = new FileReader();
            freader.readAsDataURL(file);
            freader.onload = function (e) {
                img.width = "580";
                img.height = "380";
                console.log(e.target.result);
                $("#" + name).attr("src", e.target.result);
            }
        }
    }
    //获得年月日      得到日期oTime
    function getMyDate(str) {
        var oDate = new Date(str),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth() + 1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds(),
            oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen);//最后拼接时间
        return oTime;
    }
    ;

    //补0操作
    function getzf(num) {
        if (parseInt(num) < 10) {
            num = '0' + num;
        }
        return num;
    }

    //        $(document).ready(function () {
    //            document.getElementById('activeForm').style.display = 'none';
    //            document.getElementById('equityForm').style.display = 'none';
    //        });

    function f_change() {

//            $("input[name='type']").val($("#seltype").val());

        //为空判断
        var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if (document.getElementById('title').value.replace(/(^\s*)|(\s*$)/g, "") == '') {
            //document.getElementById('titlenone').innerHTML = "商品名称不能为空";
            alert("房屋名称不能为空");
            return;
        } else if(document.getElementById('title').value.length>20){
           // document.getElementById('titlenone').innerHTML = "商品名称不能大于10个字符";
            alert("单位名称不能大于20个字符");
            return;
        }else {
            document.getElementById('titlenone').innerHTML = "";
        }
        if (document.getElementById('positionTypeId').value == '') {
           // document.getElementById('seckillPriceNone').innerHTML = "商品价不能为空";
            alert("房屋面积不能为空");
            return;
        } else {
            document.getElementById('positionTypenone').innerHTML = "";
        }
        if (document.getElementById('recruitNumberId').value == '') {
            // document.getElementById('seckillPriceNone').innerHTML = "商品价不能为空";
            alert("人数不能为空");
            return;
        } else {
            document.getElementById('recruitNumbernone').innerHTML = "";
        }
        /*if (document.getElementById('educationId').value == '') {
            //document.getElementById('seckillPriceNone').innerHTML = "商品价不能为空";
            alert("学历资质不能为空");
            return;
        } else {
            document.getElementById('educationnone').innerHTML = "";
        }*/
        /*if (document.getElementById('durationId').value == '') {
            //document.getElementById('seckillPriceNone').innerHTML = "商品价不能为空";
            alert("工作年限不能为空");
            return;
        } else {
            document.getElementById('durationnone').innerHTML = "";
        }*/
        /*if (document.getElementById('welfareId').value == '') {
            //document.getElementById('seckillPriceNone').innerHTML = "商品价不能为空";
            alert("工资待遇不能为空");
            return;
        } else {
            document.getElementById('welfarenone').innerHTML = "";
        }*/
        if (document.getElementById('ContactsNameId').value == '') {
            //document.getElementById('seckillPriceNone').innerHTML = "商品价不能为空";
            alert("联系人不能为空");
            return;
        } else {
            document.getElementById('ContactsNamenone').innerHTML = "";
        }
        if (document.getElementById('ContactsPhoneId').value == '') {
            //document.getElementById('commodityPriceNone').innerHTML = "电话不能为空";
            alert("电话不能为空");
            return;
        } else if(!myreg.test(document.getElementById('ContactsPhoneId').value)) {
            document.getElementById('ContactsPhonenone').innerHTML = "请输入正确的手机号";
            return;
        }else{
            document.getElementById('ContactsPhonenone').innerHTML = "";
        }
        /*if (document.getElementById('educationId').value == '') {
            document.getElementById('seckillPriceNone').innerHTML = "商品价不能为空";
            return;
        } else {
            document.getElementById('seckillNumNone').innerHTML = "";
        }*/
        if (document.getElementById('jobAddressId').value == '') {
            //document.getElementById('goodsAddressNone').innerHTML = "所在地址不能为空";
            alert("房屋地址不能为空");
            return;
        } else {
            document.getElementById('jobAddressnone').innerHTML = "";
        }
        if (document.getElementById('startDate').value == '') {
            //document.getElementById('startDatenone').innerHTML = "开始时间不能为空";
            alert("开始时间不能为空");
            return;
        } else {
            document.getElementById('startDatenone').innerHTML = "";
        }

        /*if (document.getElementById('endDate').value == '') {
            document.getElementById('endDatenone').innerHTML = "结束时间不能为空";
            return;
        } else {
            document.getElementById('endDatenone').innerHTML = "";
        }*/

        /*if (document.getElementById('startDate').value.length > 0 && document.getElementById('endDate').value.length > 0) {
            var startTmp = document.getElementById('startDate').value;
            var endTmp = document.getElementById('endDate').value;
            var time1 = new Date(startTmp.replace("-", "/").replace("-", "/"));
            var time2 = new Date(endTmp.replace("-", "/").replace("-", "/"));
            if (time1 >= time2) {
                document.getElementById('comparenone-star').innerHTML = "开始时间不能大于结束时间";
                return;
            } else {
                document.getElementById('comparenone-star').innerHTML = "";
            }
            if (time2 <= new Date()) {
                document.getElementById('comparenone-end').innerHTML = "结束时间不能小于当前时间";
                return;

            } else {
                document.getElementById('comparenone-end').innerHTML = "";
            }

        }*/

        /*if (document.getElementById('seckillNum').value == '') {
            document.getElementById('seckillNumNone').innerHTML = "商品数量不能为空";
            return;
        } else {
            document.getElementById('seckillNumNone').innerHTML = "";
        }
        if (document.getElementById('minuteMsg').value == '') {
            document.getElementById('minuteMsgNone').innerHTML = "商品不能为空";
            return;
        }else if(document.getElementById('minuteMsg').value.length>50){
            document.getElementById('titlenone').innerHTML = "商品概述不能大于50个字符";
            return;
        } else {
            document.getElementById('minuteMsgNone').innerHTML = "";
        }*/
         if (document.getElementById('sdfFile').value == '') {
             if (document.getElementById('sdfFile').value == '') {
                 //document.getElementById('imgSdfnone').innerHTML = "图片不能为空";
                 alert("图片不能为空");
                 return;
             } else {
                 document.getElementById('imgSdfnone').innerHTML = "";
             }
         }

       var  formData = new FormData($("#formUpdate")[0]);
        //按钮不可点
        $("#save_btn").attr("disabled", "disabled");
        $.ajax({
            type: 'POST',
            url: '/PublishRenting/addRenting',
            contentType: false,
            processData: false,
            dataType: 'json',
            data: formData,
            success: function (data) {
                console.log(data);
                //按钮又可以点
                $("#save_btn").attr("disabled", false);
                if (data.state == "success") {
                    alert("操作成功");
                    $("input[name='flashSaleId']").val("");
                    window.location.href = "/rentingCenter";
                }
            },
            error:function(data) {
                alert(data);
            }

        });
    }
</script>

<script>
    lay('#version').html('-v' + laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#startDate',
        type: 'datetime'
    });
    lay('#version').html('-v' + laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#endDate',
        type: 'datetime'
    });
</script>
</body>
<%--<script type="text/javascript">
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
</script>--%>
</html>
