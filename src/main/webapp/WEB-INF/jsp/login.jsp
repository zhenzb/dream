<%--
  Created by IntelliJ IDEA.
  User: zzb
  Date: 2018/1/17
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<html>
<head>
    <link rel="shortcut icon" href="/resource/img/seckill.ico" />
    <link rel="bookmark"href="/resource/img/seckill.ico" />
    <title>用户登录</title>
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
        #left-right-layout .block-main {
            width: 880px;
            float: left;
            min-height: 800px;
            position: relative;
        }
        .customer-main {
            position: relative;
            margin: 40px auto;
            width: 1180px;
        }
        .customer-nav-href.size-18 {
            font-size: 18px;
        }
        .customer-nav-href {
            width: 100%;
            border-bottom: 1px solid #e8e8e8;
            height: 35px;
            line-height: 35px;
            font-size: 12px;
        }
        .ulogin-form {
            float: left;
            width: 714px;
            margin: 20px auto;
            padding-top: 20px;
        }
        /*.ulogin-form, .user-login {
            width: 1180px;
            margin: 40px auto;
            overflow: hidden;
        }*/
        form {
            display: block;
            margin-top: 0em;
        }
        .customer-nav-href .bottom-border {
            border-bottom: 2px solid #31c37c;
            padding-bottom: 5px;
        }
        .customer-nav-href .nav-3f3f4d {
            color: #3f3f4d;
        }
        .customer-nav-href.size-18 {
            font-size: 18px;
        }
        .customer-nav-href {
            width: 100%;
            border-bottom: 1px solid #e8e8e8;
            height: 35px;
            line-height: 35px;
            font-size: 12px;
        }
        .ulogin-form .group-input .account-icon {
            background: url(//img.juxiangyou.com/common/customer/login-form-icon.png) no-repeat 0 center;
        }
        .ulogin-form .group-input .icon {
            position: absolute;
            left: 14px;
            top: 12px;
            width: 14px;
            height: 16px;
            display: block;
        }
        .ulogin-form .group-input .input {
            padding: 0 14px 0 40px;
            width: 304px;
            height: 38px;
            line-height: 38px;
            border: 1px solid #ddd;
            outline: 0;
        }
        .ulogin-form .group-input .login-error {
            position: absolute;
            top: -18px;
            left: 0;
            font-size: 14px;
            color: #ff4c4c;
            display: none;
        }
        .ulogin-form .group-input .auto .title {
            margin-left: 6px;
        }
        .ulogin-form .group-input .auto .title, .ulogin-form .group-input .auto input {
            display: inline-block;
            vertical-align: middle;
            height: 14px;
            line-height: 14px;
            cursor: pointer;
        }
        .ulogin-form .group-input .auto {
            color: #999;
            font-size: 12px;
        }
        fieldset, img {
            border: 0;
            vertical-align: top;
        }
        img[Attributes Style] {
            width: 92px;
            height: 38px;
        }
        .ulogin-form .group-input .validate-code {
            position: absolute;
            right: 0;
            display: inline-block;
            border: 1px solid #ddd;
            width: 92px;
            height: 38px;
            line-height: 38px;
            vertical-align: middle;
            cursor: pointer;
        }
        .register-adver {
            width: 350px;
            height: 230px;
            float: right;
            background: url(//img.juxiangyou.com/common/customer/zhuce_slide_bg.png) no-repeat 0 100%;
            margin: 20 55px 0 0;
        }
        .register-adver .slide-register-box {
            width: 280px;
            margin: 38px 0 0 50px;
        }
        .ulogin-split-line {
            float: left;
            border-right: 1px dashed #e8e8e8;
            height: 394px;
        }
        /*cm.qtmojo.com/pixel?allyes_dspid=192&allyes_cm&ext_data=4101 Failed to load resource: net::ERR_CONNECTION_TIMED_OUT
        .ulogin-form .group-input .password-icon {
            background: url(//img.juxiangyou.com/common/customer/login-form-icon.png) no-repeat -14px center;
            }*/
        .ulogin-form .group-input .code-input {
            width: 240px;
            height: 38px;
            line-height: 38px;
            border: 1px solid #ddd;
            vertical-align: middle;
            padding-left: 14px;
            outline: 0;
        }
        .ulogin-form .group-input .login-btn {
            display: block;
            background-color: #31c37c;
            width: 360px;
            height: 40px;
            line-height: 40px;
            border-radius: 2px;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            text-align: center;
            color: #fff;
            font-size: 18px;
            vertical-align: middle;
        }
        .ulogin-form .group-input .no-login {
            position: absolute;
            right: 0;
            color: #999;
            height: 24px;
            line-height: 24px;
            font-size: 12px;
        }
        .ulogin-form .group-input .forget {
            position: absolute;
            right: 0;
            color: #999;
        }
        .ulogin-form .group-input {
            position: relative;
            width: 360px;
            margin: 15px auto;
        }
        .ulogin-form .group-input .password-icon {
            background: url(//img.juxiangyou.com/common/customer/login-form-icon.png) no-repeat -14px center;
        }
        a {
            text-decoration: none;
            outline: 0;
        }
         .faster-login-btn {
             display: block;
             width: 24px;
             height: 24px;
             background: url(//img.juxiangyou.com/common/home/index_login.png) no-repeat 0 0;
             float: left;
             margin: 0 5px 0 0;
         }

        .weibo {
            background-position: 0 -103px;
        }
        .weibo:hover {
            background-position: 0 -127px;
        }

        .qq {
            background-position: 0 -151px;
        }

        .qq:hover {
            background-position: 0 -175px;
        }

    </style>
    <script src="/resource/script/jquery.min.js"></script>
</head>
<body>
<div class="page-body">
    <div id="left-right-layout">
        <!-- 区域顶部-->
        <div class="block-top"></div>
        <!-- 区域主侧 -->
        <div class="block-main">
            <div class="customer-main">
                <div class="customer-nav-href size-18"><span class="bottom-border nav-3f3f4d">用户登录</span></div>
                <div class="user-login">
                    <form class="uloginForm ulogin-form" action="/user/login" method="POST" onsubmit="return checkFrom()">
                        <div class="group-input">
                            <span class="msg userNone_msg" style="color: red" >${message}</span>
                            <span class="msg userNone_msg" style="color: red" id="userNone_msg"></span>
                            <span class="icon account-icon"></span><input id="userNameId" name="userName" class="input required" type="text" placeholder="请输入登录账号" />
                            <span class="login-error"></span>
                        </div>
                        <div class="group-input">
                            <span class="icon password-icon"></span><input id="passwordId" name="password" class="input required" type="password" placeholder="请输入密码" />
                        </div>
                        <div class="group-input">
                            <input id="codeId" name="code" class="code-input required" type="text" placeholder="验证码" />
                                <span class="validate-code">
                                    <img class="J_validate_code" id="imgId" width="92" height="38" alt=""/>
                                </span>
                        </div>
                        <div class="group-input clearfix">
                            <label class="auto"><input id="isAuto" name="isAuto" type="checkbox" value="1" /><span class="title">自动登录</span></label><a class="forget" href="/customer/find/loginpwd" title="">忘记密码？</a>
                        </div>
                        <div class="group-input">
                            <%--<a id="loginId" class="J_userlogin login-btn" href="javascript:void(0);" title="" style="text-decoration: none;">登录</a>--%>
                                <input type="submit" name="submit"  value="登陆" class="J_userlogin login-btn" ></input>
                        </div>
                        <div class="group-input">
                            <span class="express-login">快速登录：</span>
                             <span id="qqLoginBtn"></span>
                             <%--<a style="display:none" target="_blank" class="faster-login-btn qq" href="https://graph.qq.com/oauth2.0/authorize?response_type=token&client_id=101329432&redirect_uri=https://www.juxiangyou.com/login/quick&scope=get_user_info&state=QbKU9Mibwwm">--%>
                             <a target="_blank" data-point="1B1007" class="faster-login-btn qq" href="/user/wxLogin">
                                <%--<img src="//img.juxiangyou.com/common/home/Connect_logo_7.png" alt="QQ登录" border="0">--%>
                             </a>
                            <a href="javascript:void(0)" onclick="window.location='//qq.jd.com/new/wx/login.action'+window.location.search;return false;" clstag="pageclick|keycount|login_pc_201804112|4" class="pdl"><b class="weixin-icon"></b><span>微信</span></a>
                             <script type="text/javascript">

                                function qqLoginHandle(){
                                    QC.Login({
                                        btnId:"qqLoginBtn",   //插入按钮的节点id
                                        scope:"get_user_info"
                                    }, function(reqData, opts){
                                        //登录成功
                                        //根据返回数据，更换按钮显示状态方法
                                        var dom = document.getElementById(opts['btnId']),
                                            _logoutTemplate=[
                                                //头像
                                                '<span><img src="{figureurl}" class="{size_key}"/></span>'
                                                //昵称
                                                // ,'<span>{nickname}</span>'
                                                // //退出
                                                // ,'<span><a href="javascript:QC.Login.signOut();">退出</a></span>'
                                            ].join("");
                                        dom && (dom.innerHTML = QC.String.format(_logoutTemplate, {
                                            nickname : QC.String.escHTML(reqData.nickname), //做xss过滤
                                            figureurl : reqData.figureurl
                                        }));
                                    }, function(opts){
                                        //注销成功
                                        location.href = "/login/loginout";
                                    });
                                }

                                // qqLoginHandle();

                            </script>

                            <span class="no-login">没有账号，<a href="/register" title="" style="text-decoration: none;" >去注册</a></span></div>
                    </form>
                    <div class="ulogin-split-line"></div>
                    <!-- 			<div class="ulogin-adver"></div> -->
                    <div class="register-adver">

                        <div class="slide-register-box">
                            <div class="bd">
                                <ul>
                                    <marquee id=go1 onMouseOver=go1.stop() onMouseOut=go1.start() scrollamount=2 scrolldelay=150 direction=up>
                                        <c:forEach items="${sessionScope.successKilled}" var ="successKill">
                                            <li><font color="#663399"></span>${successKill.userName}*** 发布了${successKill.name}</font></li><br/>
                                        </c:forEach>

                                    </marquee>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 区域右侧 -->
        <div class="block-right"></div>

    </div>
</div>
<script type="text/javascript">
   /* window.onload = function() {
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
<script type="text/javascript">
$("document").ready(function () {
    $.ajax({
        type: "GET",
        url: "/doGet",
        data: {},
        success: function () {
            document.getElementById("imgId").src = "/doGet";
        }
    })
    }
);
        $("#imgId").click(
         function (){
        $.ajax({
            type: "GET",
            url: "/doGet",
            data: {},
            success: function (data) {
                document.getElementById("imgId").src = "/doGet";
            }
             })
            });
    function checkFrom() {
        if($("#userNameId").val() == ""){
            document.getElementById("userNone_msg").innerText="用户名不能为空";
            return false;
        }else {
            document.getElementById("userNone_msg").innerText="";

        }
        if($("#passwordId").val()==""){
            document.getElementById("userNone_msg").innerText="密码不能为空";
            return false;
        }else{
            document.getElementById("userNone_msg").innerText == "";

        }
        if($("#codeId").val() ==""){
            document.getElementById("userNone_msg").innerText="验证码不能为空";
            return false;
        }else{
            document.getElementById("userNone_msg").innerText="";
            return true;
        }
    }
    /*$("#loginId").click(
        function () {
           var isAutoResult;
           var a =  document.getElementById("isAuto").checked
           if(a == true){
               isAutoResult = $("#isAuto").val();
           }else{
               isAutoResult = 2;
           }
           if($("#userNameId").val() == ""){
               document.getElementById("userNone_msg").innerText="用户名不能为空";
               return;
           }else {
               document.getElementById("userNone_msg").innerText="";
           }
           if($("#passwordId").val()==""){
               document.getElementById("userNone_msg").innerText="密码不能为空";
               return;
           }else{
               document.getElementById("userNone_msg").innerText == "";
           }
           if($("#codeId").val() ==""){
               document.getElementById("userNone_msg").innerText="验证码不能为空";
               return;
            }else{
                document.getElementById("userNone_msg").innerText="";
            }
            $.ajax({
                type:"POST",
                url:"/user/login",
                data:{
                    "userName":$("#userNameId").val(),
                    "password":$("#passwordId").val(),
                    "code":$("#codeId").val(),
                    "isAuto":isAutoResult
                },
                dataType:"json",
                success:function(data){
                    if(data.state=="success"){
                        window.location.href="/";
                    }else{
                        document.getElementById("userNone_msg").innerText=data.message;
                    }
                },
                error:function(){
                    alert("error");
                }

            });
        }
    );*/
</script>

</html>
