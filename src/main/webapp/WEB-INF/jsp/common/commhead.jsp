<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <span class="u-name">${sessionScope.user.userName}&nbsp;&nbsp;<img src="${sessionScope.userAccount.levelImg}"/></span>
                        <%--<span class="description">（ID：1763205）</span>--%>

                    </p>
                    <p class="u-info p1">
                        金币余额：
                        <span id="ubi_ye" class="" data-ubi="22343">${sessionScope.userAccount.gold}</span><i class="ubi_2"></i>
                        &nbsp;&nbsp;
                        <a href="javascript:void(0)" id="alipayId" class="J_verifyPhone">提现</a>
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
                    累计发布商品&nbsp; &nbsp;<font color="#ff0000">${sessionScope.successSize}</font>&nbsp; &nbsp;件
                </p>

                <span class="signin-btn signin-btn-ready"><i class="signin-icon"></i>${sessionScope.userAccount.remarks}</span>

            </div>
        </div>
    </div>

</div>
<div class="left-nav" style="height: 968px;">
    <ul class="ul-nav Games">

        <li class="nav-head">
            <i class="nav-icon i2"></i>
            <span class="title">我的账户</span>
        </li>
        <li id="Games">
            <a href="/publishList">商品记录</a>
        </li>
        <li id="recruits">
            <a href="/recruitCenter">招聘记录</a>
        </li>
        <li id="rentingCenter">
            <a href="/rentingCenter">租房记录</a>
        </li>
        <li id="Order" >
            <a href="/pg" >发布商品</a>
        </li>
        <li id="recruit" >
            <a href="/publishRecruit" >发布招聘</a>
        </li>
        <li id="renting" >
            <a href="/rentingpublish">发布租房</a>
        </li>
        <li id="P2P">
            <a href="/goldPersonalCenter">金币明细</a>
        </li>

        <li id="Captcha">
            <a href="/silverBeanPersonalCenter">银豆明细</a>
        </li>
        <li id="withdrawals" >
            <a href="/withdrawals">提现明细</a>
        </li>
        <li id="message">
            <a href="/messagePersonalCenter">我的消息</a>
        </li>
        <li id="notice">
            <a href="/publishMessage">发布公告</a>
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