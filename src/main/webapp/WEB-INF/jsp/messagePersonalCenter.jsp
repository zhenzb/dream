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
<%@include file="common/commhead.jsp"%>
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
        li {
            display: list-item;
            text-align: -webkit-match-parent;
        }
        ol, ul {
            list-style: none;
        }
        #message {
            height: 30px;
            background: url(//img.juxiangyou.com/common/personal/nav_selected.png) no-repeat 124px 11px;
        }
    </style>
</head>
<body>
<div class="header-box" data-current="home">

<div class="top-info-box">

<div id="left-right-layout">
    <div class="main-content clear-fix" style="margin-bottom: 20px;">

        <div class="right-content">
            <div class="personal-each-box"></div>
            <div class="personal-each-box">
                <div class="title">
                    <span class="box-name">我的消息</span>
                </div>
                <div class="personal-tbl ubi-tbl">
                    <div class="tr thead">
                        <p class="th td1">流水号</p>
                        <p class="th td2">时间</p>
                        <p class="th td3">&nbsp;</p>
                        <p class="th td4">消息名称</p>
                        <p class="th td5">消息内容</p>
                        <p class="th td6">状态</p>
                    </div>
                    <div class="tbody J_myAccountTbody">

                        <c:forEach items="${successKilledEntityList}" var="list">
                        <div class="tr">

                            <p class="td1">
                                ${list.id}
                            </p>
                            <p class="td2"> <fmt:formatDate value="${list.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                            <p class="td3">&nbsp;</p>
                            <p class="td4" title="聚财宝第143970期2018-01-20 收益4U币">${list.seckillName}</p>

                            <p class="td5 postive">
                                ${list.price}元

                                <i class="ubi"></i>
                            </p>
                            <p class="td6">${list.state == 0 ?'未支付':'已支付'}&nbsp;&nbsp;<a href="/seckill/detail?s=1&seckillId=${list.seckillId}">去支付</a><i class="ubi"></i></p>
                        </div>

                        </c:forEach>
                        <%--<div class="tr even">

                            <p class="td1">
                                1516473623
                            </p>
                            <p class="td2">2018-01-21 02:40:23</p>
                            <p class="td3">&nbsp;</p>
                            <p class="td4" title="聚财宝第143795期2018-01-20 收益17U币">聚财宝第143795期2018-01-20 收益17U币</p>

                            <p class="td5 postive">
                                +17

                                <i class="ubi"></i>
                            </p>
                            <p class="td6">21,958<i class="ubi"></i></p>
                        </div>--%>
                    </div>
                </div>
                <div class="page-box-center">
                    <div id="J_ubi_detail" class="J_uDetail splitpage-box" data-total="16" data-pagesize="15" data-pagextpl="personal/private/tbl/ubi-record-tbl">
                    </div>
                </div>
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
