<%--
  Created by IntelliJ IDEA.
  User: zzb
  Date: 2018/2/3
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>error</title>
    <style type="text/css">
        .setbg{
            position:absolute;;
            background:url("/resource/img/404.jpg") no-repeat 5% 5% ;
            height:100%;
            width: 100%;
            top:10%;
            left:10%;
            margin-top: -150px;
            margin-left: -10px;
        }
        .backlist{
            width: 10%;
            height: 10%;
            position: absolute;
            left:20%;
            top:50%;
        }
        h1 {
            text-align: center;
            font-weight: normal;
            color: #fff;
            text-transform: uppercase;
            font-size: 8em;
            white-space: nowrap;
            font-size: 12vw;
            z-index: 1000;
            font-family: 'Bangers', cursive;
            text-shadow: 5px 5px 0 rgba(0, 0, 0, 0.7);
        @include skew(0, -6.7deg, false);
        @include transition-property(font-size);
        @include transition-duration(0.5s);

        }
    </style>
</head>
<body>
    <div class="setbg">
        <div class="backlist">
            <a href="/" style="background-color:forestgreen;"><h1>返回首页</h1></a>
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
