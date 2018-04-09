<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <meta name=”viewport” content=”width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no” />
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="stylesheet" href="/resource/script/bootstrap.css">
    <link rel="stylesheet" href="/resource/css/list.css">
    <link rel="stylesheet" href="/resource/css/recruit.css">
    <script src="/resource/script/jquery-3.2.1.min.js"></script>
    <link rel="shortcut icon" href="/resource/img/seckill.ico" />
    <link rel="bookmark"href="/resource/img/seckill.ico" />
    <title>亿客</title>
    <style>
        .index-banner-box .index-login {
            width: 22%;
            height: 255px;
            padding: 15px 26px 0;
            position: absolute;
            left: 47%;
            top: 34%;
            margin: 0 0 0 310px;
            z-index: 200;
        }
        .index-login .index-login-bg {
            width: 100%;
            height: 100%;
            background: #fff;
            opacity: .95;
            filter: Alpha(opacity=95);
            position: absolute;
            left: 0;
            top: -3px;
        }
        .index-login .index-login-bg .border {
            width: 100%;
            border-bottom: 1px solid #e8e8e8;
            position: absolute;
            top: 179px;
        }
        .index-login .login-ready {
            position: relative;
            z-index: 100;
        }
        .index-login .login-ready .loginout-box {
            display: block;
            width: 60px;
            height: 60px;
            background: url(/resource/img/index_loginout_bg.png) no-repeat 0 0;
            position: absolute;
            right: -26px;
            top: -30px;
        }
        .index-login .user-news-box {
            padding: 0 0 20px;
            margin: 24px 0;
        }
        .index-login .login-ready .user-onwer-list {
            color: #576077;
            line-height: 30px;
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
        a {
            text-decoration: none;
            outline: 0;
        }
        .clear-fix:before {
            display: table;
            content: "";
        }
        .index-login .loginout-box .loginout-btn {
            display: block;
            width: 14px;
            height: 14px;
            background: url(/resource/img/index_login.png) no-repeat 0 -229px;
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .index-login .user-news-box .user-top {
            margin-bottom: 95px;
        }
        .index-login .user-news-box .user-img {
            display: block;
            width: 80px;
            height: 80px;
            border-radius: 80px;
            margin: 0 10px 0 0;
            float: left;
            overflow: hidden;
        }
        .index-login .user-news-box .mar-t12 {
            margin-top: 12px;
        }
        .index-login .user-news-box .user-name {
            color: #3f3f4d;
            margin-top: 5px;
        }
        .index-login .user-news-box .user-id, .index-login .user-news-box .user-name {
            font-size: 14px;
            display: block;
            float: left;
            line-height: 28px;
            width: 44%;
            height: 28px;
            overflow: hidden;
            white-space: nowrap;
        }
        .index-login .user-news-box .mar-t4 {
            margin-top: 4px;
        }
        .index-login .user-news-box .user-link {
            display: block;
            width: 46%;
            height: 34px;
            float: left;
            color: #fafbfd;
            background: #31c37c;
            text-align: center;
            line-height: 34px;
            font-size: 10%;
            margin: 0 10px 0 0;
            border-radius: 2px;
        }
        a {
            text-decoration: none;
            outline: 0;
        }
        .index-login .user-news-box .qiandao-pic {
            display: inline-block;
            width: 28%;
            height: 20px;
            background: url(/resource/img/home_sign_pic.png) no-repeat 0 0;
            margin: -5px 2px 0 0;
            vertical-align: middle;
        }
        .index-login .user-news-box .qiandao-pic.personal {
            background-position: 0 -20px;
            margin-top: -3px;
        }
        s, strike, del {
            text-decoration: line-through;
        }
        .index-login .user-news-box .qiandao-btn {
            display: block;
            width: 46%;
            height: 34px;
            background: #31c37c;
            border-radius: 2px;
            float: left;
            color: #fff;
            line-height: 34px;
            font-size: 10%;
            text-align: center;
        }
        a {
            text-decoration: none;
            outline: 0;
        }
        .index-login .login-ready .user-onwer-list .onwer-link {
            color: #1891d7;
            float: right;
        }
        .index-login .login-ready .user-onwer-list .color-01 {
             color: #ff4800;
         }
        .ubi_1 {
            width: 11px;
            height: 11px;
        }
        .ubi_1, .ubi-big, .ubi-gray, .udou, .udou-gray, .uquan, .uquan-gray {
            display: inline-block;
            background: url(/resource/img/ubi.png) no-repeat 0 0;
            margin: 0 0 0 3px;
        }
        .index-login .login-ready .user-onwer-list .onwer-link {
            color: #1891d7;
            float: right;
        }
        .index-login .login-ready .user-onwer-list .color-01 {
            color: #ff4800;
        }
        .udou {
            width: 12px;
            height: 10px;
            background-position: 0 -12px;
        }
        .index-banner-box {
            z-index: 99;
        }
        .index-banner-box, .index-slide-box {
            width: 100%;
            height: 330px;
            position: relative;
        }
        .index-banner-box, .index-slide-box {
            width: 100%;
            height: 330px;
            position: relative;
        }
        .index-login .index-login-bg .border {
            width: 100%;
            border-bottom: 1px solid #e8e8e8;
            position: absolute;
            top: 179px;
        }
    /*搜索引擎*/
       .customer-search {
           position: relative;
           left: 40%;
           height: 126px;
           line-height: 45px;
           width: 510px;
           margin-left: -255px;
           top:77px;
       }
       .customer-search>.search-text {
           float: left;
           width: 358px;
           height: 44px;
           line-height: 44px;
           color: #333;
           outline: 0;
           font-size: 14px;
           border: 1px solid #e5e8f0;
           padding: 0 20px;
           border-radius: 20px 0 0 20px;
           -moz-border-radius: 20px 0 0 20px;
           -webkit-border-radius: 20px 0 0 20px;
       }
      /* body, button, input, select, textarea {
           font: 12px/1 Microsoft YaHei,"\5b8b\4f53",Tahoma,Helvetica,Arial,sans-serif;
       }*/
      /* blockquote, body, button, dd, dl, dt, fieldset, h1, h2, h3, h4, h5, h6, hr, input, legend, li, ol, p, pre, td, textarea, th, ul {
           margin: 0;
           padding: 0;
       }*/
      /* input:not([type]), input[type="email" i], input[type="number" i], input[type="password" i], input[type="tel" i], input[type="url" i], input[type="text" i] {
           padding: 1px 0px;
       }*/
       input {
           -webkit-appearance: textfield;
           background-color: white;
           -webkit-rtl-ordering: logical;
           user-select: text;
           cursor: auto;
           padding: 1px;
           border-width: 2px;
           border-style: inset;
           border-color: initial;
           border-image: initial;
       }
       /*input, textarea, select, button {
           text-rendering: auto;
           color: initial;
           letter-spacing: normal;
           word-spacing: normal;
           text-transform: none;
           text-indent: 0px;
           text-shadow: none;
           display: inline-block;
           text-align: start;
           margin: 0em;
           font: 13.3333px Arial;
       }*/
       /*user agent stylesheet
       input, textarea, select, button, meter, progress {
           -webkit-writing-mode: horizontal-tb;
       }*/
       .customer-search>.search-btn {
           float: left;
           display: block;
           text-align: center;
           width: 110px;
           height: 46px;
           line-height: 46px;
           color: #fff;
           font-size: 16px;
           background-color: #31c37c;
           border-radius: 0 20px 20px 0;
           -moz-border-radius: 0 20px 20px 0;
           -webkit-border-radius: 0 20px 20px 0;
           text-decoration: none;
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
       .customer-search>.search-btn>.s-icon {
           display: inline-block;
           width: 20px;
           height: 20px;
           margin: 0 10px -5px 0;
           background: url(//img.juxiangyou.com/common/customer/icon-search-white.png) no-repeat 0 0;
       }
       s, strike, del {
           text-decoration: line-through;
       }
        /*.news-box li {
            line-height: 30px;
            height: 30px;
            font-size: 14px;
            width: 250px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }*/
        .big-nav .right-menu .child-menu.on {
            color: #fff;
            background-color: #31c37c;
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
                    &nbsp;&nbsp;<a class="clr-ff4800" style="text-decoration: none;" href="/login">您好，请登录</a></span>&nbsp;
                    <a href="/register" style="text-decoration: none;">免费注册</a>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                <%--已登录情况--%>
                <span class="clr-ff4800">
                   &nbsp;&nbsp;您好，${sessionScope.user.userName}</span>&nbsp;
                    <a style="text-decoration: none;" href="/logout">[退出]
                </c:if>
            </div>
            <div class="right-menu">
                <a href="/" data-point="1A1003" data-nav="treasure" class="child-menu"  target="_self">首页</a>
                <a href="/publishList" data-point="1A1015" data-nav="lottery" class="child-menu" target="_self">个人中心</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </div>
    <!-- 大导航 -->
    <div class="big-nav">
            <div class="width-1180">
                <a href="/" class="logo">
                    <img src="/resource/img/logo-new.png" alt="">
                </a>
                <div class="right-menu">
                    <a href="/" data-point="1A1001" data-nav="home" class="child-menu">首页</a>

                    <a href="/recruit" data-point="1A1002" data-nav="newborn" class="child-menu" style="color: #fff;background-color: #31c37c;">招聘市场</a>

                   <%-- <a href="/games" data-point="1A1004" data-nav="games" class="child-menu">
                        试玩体验<i class="top-pic">棋牌<s class="jt"></s></i>
                    </a>--%>
                    <a onclick="{alert('该功能改造升级中，敬请期待...')}" href="" data-point="1A1005" data-nav="finance" class="child-menu">游戏专区</a>

                     <a onclick="{alert('该功能改造升级中，敬请期待...')}" href="" data-point="1A1006" data-nav="welfare" class="child-menu">
                         反馈信息
                     </a>

                    <%-- <a href="/fun/play/temporary" data-point="1A1007" data-nav="fun" class="child-menu">娱乐大厅</a>
                     <a href="/vip" data-point="1A1008" data-nav="vip" class="child-menu">VIP</a>--%>
                    <!-- <span class="bg-hover"></span> -->
                </div>
            </div>
        </div>
</div>
</div>
<%--右悬浮区域--%>
<div class="right-fixed">
    <a data-point="1Z1002" href="#" class="close-a" onclick="right_close()"></a>
    <div class="group-box" style="margin-top:20px" >

        <a target="_blank" data-point="1A1026" href="https://jq.qq.com/?_wv=1027&k=5igY5ft" class="kf-qq mar" style="margin-bottom:14px"><img border="0" src="//img.juxiangyou.com/common/home/group.png" alt="交流群①" title="综合交流群"> <span>648359626</span></a>

        <a target="_blank" data-point="1A1027" href="https://jq.qq.com/?_wv=1027&k=5NUlnIZ" class="kf-qq mar" style="margin-bottom:14px"><img border="0" src="//img.juxiangyou.com/common/home/group.png" alt="交流群②" title="娱乐交流群"> <span>交流群②</span></a>

        <a target="_blank" data-point="1A1028" href="https://jq.qq.com/?_wv=1027&amp;k=5wOOS7k" class="kf-qq mar" style="margin-bottom:14px"><img border="0" src="//img.juxiangyou.com/common/home/group.png" alt="交流落群③" title="匠神部落群"> <span>交流群③</span></a>

        <a target="_blank" data-point="1A1029" href="https://jq.qq.com/?_wv=1027&amp;k=5Igori0" class="kf-qq mar" style="margin-bottom:14px"><img border="0" src="//img.juxiangyou.com/common/home/group.png" alt="交流群④" title="交流群④"> <span>交流群④</span></a>

        <a target="_blank" data-point="1A1030" href="https://jq.qq.com/?_wv=1027&amp;k=5zAL0qM" class="kf-qq mar" style="margin-bottom:14px"><img border="0" src="//img.juxiangyou.com/common/home/group.png" alt="交选群⑤" title="交选群⑤"> <span>交流群⑤</span></a>

    </div>
    <a data-point="1A1031" href="http://kf.juxiangyou.com/kf-qq.html" target="_blank" class="kf-qq">
        <img src="/resource/img/qq-kf.png">
    </a>
    <p class="phone"><span class="icon"></span>400-8899-111</p>
    <a href="#" data-point="1A1032" class="return-top"><span class="icon"></span>返回顶部</a>
</div>
<%--左悬浮区域--%>
<div class="left-fixed">
    <a data-point="1Z1001" href="#" class="close-a" onclick="left_close()"></a>
    <a data-point="1A1025" href="#" target="_blank" ><img src="/resource/img/dt1.gif" alt="" width="100%" height="290px"></a>
</div>
<%-- 个人信息域--%>
<div class="index-banner-box">
    <%--顶部大图--%>
    <div class="wrap" id='wrap'>
         <ul id="pic">
         <li><img width="100%" height="230%" src="/resource/img/banner/v1/recruit1.png" alt=""></li>
         <li style="display: none"><img width="100%" height="230%" src="/resource/img/banner/v1/recruit2.png" alt=""></li>
         <li style="display:none;"><img width="100%" height="230%" src="/resource/img/banner/v1/recruit3.png" alt=""></li>
         <%--<li><img width="100%" height="230%" src="/resource/img/banner/banner4.png" alt=""></li>
         <li><img width="100%" height="230%" src="/resource/img/banner/banner5.png" alt=""></li>--%>
         </ul>
         <ol id="list">
         <li class="on">1</li>
         <li>2</li>
         <li>3</li>
         <%--<li>4</li>
         <li>5</li>--%>
         </ol>
    </div>

<div class="index-login">
    <div class="index-login-bg"><div class="border"></div></div>
    <div class="login-ready" >
				<span class="loginout-box">
					<a class="loginout-btn" href="/logout" target="_self" title=""></a>
				</span>
        <div class="user-news-box clear-fix">
            <div class="user-top clear-fix">
                <c:if test="${sessionScope.user==null}">
                    <span class="user-img"  onclick='uploadlogin()'>
                        <img src="/resource/img/smallIco/headImg100.jpg" width="80" height="80">
                    </span>
                </c:if>
                <c:if test="${sessionScope.user!=null}">
                    <c:if test="${empty sessionScope.user.headUrl}">
                        <span class="user-img"  onclick='uploadHead()'>
                            <img id="imgId" src="/resource/img/smallIco/headImg100.jpg" width="80" height="80">
                            <input id="headId" name="headPhone" type="file"  onchange="headImg()"/>
                        </span>
                    </c:if>
                    <c:if test="${not empty sessionScope.user.headUrl}">
                        <span class="user-img"  onclick='uploadHead()'>
                            <img i src="${sessionScope.user.headUrl}" width="80" height="80">
                            <input id="headId2" name="headPhone" type="file"  onchange="headImg()"/>
                        </span>
                    </c:if>
                </c:if>
                <span class="user-name mar-t12" title="好啦">${sessionScope.user==null ?"您还未登录":sessionScope.user.userName}</span>
                <span class="user-id mar-t4">${sessionScope.userAccount == null?" ":sessionScope.userAccount.remarks}&nbsp;&nbsp;<img src="${sessionScope.userAccount.levelImg}"/></span>


            </div>
            <a class="user-link" data-point="1B1013" href="/publishList" style="text-decoration: none;"><s class="qiandao-pic personal"></s>个人中心</a>

            <a data-point="1B1012" class="qiandao-btn" href="/publishRecruit"  title="" style="text-decoration: none;" ><s class="qiandao-pic"></s>发布招聘</a>

        </div>
        <p class="user-onwer-list"><%--<a data-point="1B1010" class="onwer-link" href="/personal/CashApply" title="">[提现]</a>--%>金币：<span class="color-01">${sessionScope.userAccount.gold}</span><s class="ubi_1"></s></p>
        <p class="user-onwer-list"><%--<a data-point="1B1011" class="onwer-link" href="/fun/mall" title="">[抽奖]</a>--%>银豆：<span class="color-01">${sessionScope.userAccount.silverBean}</span><s class="udou"></s></p>
    </div>
</div>
</div>
<%--区域主侧--%>
<div class="page-body">
<div id="left-right-layout">
    <%--区域顶部--%>
<div class="block-top">
        <%--<div class="index-buzhou">
        </div>--%>
<%--搜索引擎框--%>
 <div class="customer-search">
            <input id="searchKeyword" class="search-text" type="text" placeholder="请输入要搜索的公司名称或关键字" />
            <a class="J_search search-btn" href="#" onclick="searchRecruit()" title=""><s class="s-icon"></s>搜索</a>
        </div>
   <%-- </div>
        <form id="queryOrderForm" method="get" enctype="application/x-www-form-urlencoded">
            <div class="order-tab">
                <div class="order-tab-bd">
                    <div style="display:block" class="item">
                        <a id="querymyorderbutton" class="btn92s fr" href="#nogo" shape="rect"><label style="cursor:pointer;" for="querybutton">查询</label>
                            <span id="use_G"><select name="queryType"><option value="1">按订票日期查询</option><option value="2">按乘车日期查询</option></select></span>
                            <span class="inp-s"><input type="text" id="sequeue_train_nameText" class="inpA" value="" /><span class="i-clear" id="clear_input_txt" title="清除"></span></span>
                        </a>
                    </div>
                </div>
            </div>
        </form>--%>
<%--区域主侧--%>
    <div class="block-main">
        <div class="main" style="position:absolute; height:100%; width:100%; overflow:hidden">
            <div class="main" style="position:absolute; height:100%; width:102%; overflow:auto">
                <ul class="list-ad-items">
                    <c:forEach items="${recruitList}" var="recruit">
                            <li data-aid="" data-service="regular" data-cpm-sign data-inorganic="0" class="listing-ad  item-regular  seen">
                                <a href="/recruitDetails?i=${recruit.id}" target="_self" data-cpc class="media-cap ">
                                    <img src="${recruit.logoUrl}" alt="">
                                    <sapn class="figcaption"></sapn>
                                </a>
                                <div class="media-body">
                                    <div class="media-body-title">
                                        <sapn class="highlight">${recruit.welfare}</sapn>
                                        <a href="/recruitDetails?i=${recruit.id}" target="_self" class="ad-title" style="text-decoration: none;">${recruit.positionType}</a>
                                    </div>
                                    <div class="ad-item-detail">${recruit.companyName}</div>
                                    <div class="ad-item-detail">
                                        <time><fmt:formatDate value="${recruit.lastModified}" pattern="yyyy-MM-dd HH:mm:ss" /></time>
                                        &nbsp;&nbsp;来自：
                                        <a href="" target="_self" class="source" style="text-decoration: none;">亿客网</a>
                                    </div>
                                </div>
                            </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
<%--<div class="block-main" style="height:1px; margin-top:-1px;clear: both;overflow:hidden;">
    <div class="channel-box game-height_1">
    <div class="channel-box game-height">
        <div class="box-title">
            <i class="title-icon yxsw"></i>
            <h3>优质商品</h3>
        </div>
        <div class="box-content clear-fix">
            <ul class="games-list">
                <c:forEach items="${list}" var="sk">
                    <li data-point="1B1017">
                        <i class="game-type type4">精品</i>
                        <div class="top-img">
                            <img src="${sk.imgUrl}" style="height:100%">
                            <div class="cover">
                                <div class="opacity"></div>
                                <a href="/seckill/detail?seckillId=${sk.seckillId}" style="display:block; width:100%; height:100%; position: absolute; top:0; left:0; cursor:pointer;"  target="_self" >
                                        &lt;%&ndash;<div class="info">
                                            <a href="/seckill/${sk.seckillId}/detail" class="sw-btn J_click_key" target="_blank">立即试玩</a>
                                            <!-- <p class="name">虎牙棋牌专区6期</p> -->
                                            <p class="rs">参与人数：1405人</p>
                                        </div>&ndash;%&gt;
                                </a>
                            </div>
                        </div>
                        <div class="bottom-content">
                            <p>
                                    ${sk.name}
                            </p>
                            <p>
                                开始时间：<span class="sw-jl"> <fmt:formatDate value="${sk.startTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span><i class="ubi"></i><br/>
                                结束时间：<span class="sw-jl"> <fmt:formatDate value="${sk.endTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span><i class="ubi"></i><br/>
                                所在地址 ：<span class="sw-jl"> ${sk.address}</span><i class="ubi"></i>
                            </p>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
</div>--%>
<%--区域右侧--%>
<div class="block-right" style="min-height: 515px;">
   <%-- <div class="news-box">
        <h3>
            <i class="icon"></i>
            <font color="red">网站公告</font>
        </h3>
        <ul>

            &lt;%&ndash;<marquee id=go12 onMouseOver=go1.stop() onMouseOut=go1.start() scrollamount=2 scrolldelay=150 direction=up> &ndash;%&gt;
                <c:forEach items="${messageList}" var ="message">
                    </br>
                    <li><a href="/systemMessage?i=${message.id}" style="text-decoration: none;"><font color="#576077" size="3"><span></span>${message.messageTitle}</font></a></li><br/>
               </c:forEach>
                &lt;%&ndash; </marquee>&ndash;%&gt;

        </ul>
    </div>--%>
    <div class="news-box">
        <h3>
            <i class="icon"></i>
            <font color="red">最新发布招聘</font>
        </h3>
        <ul>

            <marquee heigth="100px" id=go1 onMouseOver=go1.stop() onMouseOut=go1.start() scrollamount=2 scrolldelay=150 direction=up>
                <c:forEach items="${recruitList}" var ="recruit">
                <li><font color="#663399"></span>${recruit.contactsName}*** 招聘${recruit.positionType}</font></li><br/>
                </c:forEach>
            </marquee>

        </ul>
    </div>
</div>
<%--区域底部--%>
<div class="block-bottom">
            <div class="channel-box">
                <div class="box-title">
                    <i class="title-icon yqlj"></i>
                    <h3>友情链接</h3>
                </div>
                <div class="box-content">
                    <ul class="link-list clear-fix">
                        <li>
                            <span>
                            <a href="http://www.baidu.com" target="_blank"><img src="resource/img/baidulogo.jpg" style="width: 70%;height:80%"></a>
                            </span>
                        </li>
                        <li>
                            <span>
                            <a href="http://www.3366.com" target="_blank"><img src="resource/img/3366.jpg" style="width: 70%;height:80%"></a>
                            </span>
                        </li>
                        <li>
                            <span>
                            <a href="http://www.12306..cn" target="_blank"><img src="resource/img/12306.jpg" style="width: 70%;height:80%"></a>
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

</div>
</div>
<!-- 底部区域 -->
    <div class="footer-box">
        <div class="width-1180">
            <p class="p-link">
                <a href="#" target="_blank">关于我们</a>
                <a href="/customer" target="_self">联系我们</a>
                <a href="" target="_self">访问总量 ${sessionScope.pvNumber}次</a>
                <%--<a href="#" target="_blank">家长监护</a>--%>
            </p>
            <p class="p-text">
                备案/许可证号：京ICP备13015689号-4  ICP证：京B2-20140100  京网文[2017]2444-086号  Copyright  2013-2017   亿客网
            </p>
            <p class="p-text">联系电话：400-8899-088 &nbsp;&nbsp;北京亿客科技有限公司 &nbsp;&nbsp;<%--<a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33010602000231" target="_blank">--%><img src="//img.juxiangyou.com/v1/ghs.png">浙公安网备33010602000231号<%--</a>--%></p>
            <p class="p-img">
                <%-- <a href="http://www.pingpinganan.gov.cn/web/index.aspx" target=_blank>
                     <img src="http://img.juxiangyou.com/v1/police.gif" width="127" height="47" alt="">
                 </a>--%>
                <%-- <a href="https://search.szfw.org/cert/l/CX20150314007057007172" target=_blank>--%>
                <img src="/resource/img/cert.jpg" width="8%" height="47" alt="">
                <%--</a>--%>
                <%--<a href="https://ss.knet.cn/verifyseal.dll?sn=e14052233010049227etri000000&ct=df&a=1&pa=0.21805879403837025" target=_blank>--%>
                <img src="/resource/img/cnnic.png" width="8%" height="47" alt="">
                <%--</a>--%>
                <%--<a href="http://si.trustutn.org/info?sn=529170224027158122933&certType=1" target=_blank>--%>
                <img src="/resource/img/bottom_large_img.png" width="8%" height="47" alt="">
                <%--</a>--%>
            </p>
        </div>
    </div>
</body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<%--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>--%>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<%--<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>--%>
<script src="/resource/script/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript">
    window.onload=function(){
        var wrap=document.getElementById('wrap'),
            pic=document.getElementById('pic').getElementsByTagName("li"),
            list=document.getElementById('list').getElementsByTagName('li'),
            index=0,
            timer=null;

        // 定义图片切换函数
        function changePic (curIndex) {
            for (var i = 0; i < pic.length; ++i) {
                pic[i].style.display = "none";
                list[i].className = "";
            }
            pic[curIndex].style.display = "block";
            list[curIndex].className = "on";
        }

        // 定义并调用自动播放函数
        timer = setInterval(autoPlay, 3000);

        // 鼠标划过整个容器时停止自动播放
        wrap.onmouseover = function () {
            clearInterval(timer);
        }

        // 鼠标离开整个容器时继续播放至下一张
        wrap.onmouseout = function () {
            timer = setInterval(autoPlay, 3000);
        }
        // 遍历所有数字导航实现划过切换至对应的图片
        for (var i = 0; i < list.length; i++) {
            list[i].onmouseover = function () {
                clearInterval(timer);
                index = this.innerText - 1;
                changePic(index);
            };
        };

        function autoPlay () {
            if (++index >= pic.length) index = 0;
            changePic(index);
        }
    };
    function searchRecruit() {
        var zzb = $("#searchKeyword").val();
        window.location.href="/searchRecruit?zzb="+zzb;
    };
</script>
<script type="text/javascript">

    function left_close() {
        $(".left-fixed").hide();
    }

    function right_close() {
        $(".right-fixed").hide();
    }

</script>
<%--<script type="text/javascript">
    window.onload = function() {
        /*document.onkeydown = function() {
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
        };*/
        //屏蔽右键单击
        document.oncontextmenu = function() {
            return false;
        }
    }
</script>--%>
</html>
