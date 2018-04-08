//存放主要交互逻辑的js代码
// javascript 模块化(package.类.方法)

var seckill = {
    //封装秒杀相关ajax的url
    URL: {
        now: function () {
            return '/seckill/time/now';
        },
        exposer: function (seckillId) {
            return '/seckill/' + seckillId + '/exposer';
        },
        execution: function (seckillId, md5) {
            return '/seckill/' + seckillId + '/' + md5 + '/execution';
        }
    },

    //验证姓名，手机号，地址
    validatePhone: function(realName,phone,detailedAddress){
      if(phone && phone.length == 11 && !isNaN(phone)){
          if(null !=realName && null !=detailedAddress) {
              return true;
          }else {
              return true;
          }
      }else{
          return true;
      }
    },

    //验证用户是否登录
    validateUser:function(user){
            if(null == user){
                return true;
            }else{
                return false;
            }
    },
    //详情页秒杀逻辑
    detail:{
        //详情页初始化
        init:function (params) {
            //手机验证和登录，计时交互
            //规划我们的交互流程
            //在cookie中查找手机号
            var user = $.cookie('user');
            if (seckill.validateUser(user)) {
                var killUser = $('#killUser');
                console.log("sss"+killUser.toString())
                killUser.modal({
                    show: true,//显示弹出层
                    backdrop: 'static',//禁止位置关闭
                    keyboard: false//关闭键盘事件
                });
                $("#aId").click(function(){
                    window.location.href="/login";
                });
            } else {
                var ss = $.cookie('s');
                /*if(ss=="true"){
                    /!*二次支付*!/
                    var killPay = $('#killPay');
                    killPay.modal({
                        show: true,//显示弹出层
                        backdrop: 'static',//禁止位置关闭
                        keyboard: false//关闭键盘事件
                    });
                    $("#killPayId").click(function(){
                        window.location.href="/successKilled/findUserSuccessKilled";
                    });
                }*/
                var seckill_time = $.cookie('seckill_time');
             if (seckill_time == "true") {
                var killPhone = $.cookie('killPhone'+user);
                var realName = $.cookie('realName');
                var address = $.cookie('address');
                //验证手机号
                if (!seckill.validatePhone(realName, killPhone, address)) {
                    //绑定手机，控制输出
                    var killPhoneModal = $('#killPhoneModal');
                    killPhoneModal.modal({
                        show: true,//显示弹出层
                        backdrop: 'static',//禁止位置关闭
                        keyboard: false//关闭键盘事件
                    });

                    $('#killPhoneBtn').click(function () {
                        var inputRealName = $("#realNameId").val();
                        var inputPhone = $('#killPhoneKey').val();
                        var detailedAddress = $('#addressId').val();
                        console.log("inputPhone" + inputPhone);
                        if (seckill.validatePhone(inputRealName, inputPhone, detailedAddress)) {
                            //电话写入cookie，7天过期
                            $.cookie('killPhone'+user, inputPhone, {expires: 7, path: '/seckill'});
                            $.cookie('killPhone', inputPhone, {expires: 7, path: '/seckill'});
                            $.cookie('realName', inputRealName, {expires: 7, path: '/seckill'});
                            $.cookie('address', detailedAddress, {expires: 7, path: '/seckill'});
                            $.ajax({
                                type: "post",
                                url: "/user/addAddress",
                                data: {
                                    realName: inputRealName,
                                    mobileNo: inputPhone,
                                    detailedAddress: detailedAddress
                                },
                                dataType: "json",
                                success: function (data) {
                                    //验证通过，刷新页面
                                    if (data.state == "success") {
                                        window.location.reload();
                                    } else {
                                        $('#killPhoneMessage').hide().html('<label class="label label-danger">出错了</label>').show(300);
                                    }
                                },
                                error: function () {

                                }
                            });
                        } else {
                            $('#killPhoneMessage').hide().html('<label class="label label-danger">填写项有误</label>').show(300);
                        }
                    });
                }
            }
                //已经登录
                //计时交互

                var startTime = params['startTime'];
                var endTime = params['endTime'];
                var seckillId = params['seckillId'];
                $.get(seckill.URL.now(), {}, function (result) {
                    if (result && result['success']) {
                        var nowTime = result['data'];
                        //时间判断 计时交互
                        seckill.countDown(seckillId, nowTime, startTime, endTime);
                    } else {
                        console.log('result: ' + result);
                    }
                });
            }
        }
    },

    handlerSeckill: function (seckillId, node) {
        //获取秒杀地址,控制显示器,执行秒杀
        //node.hide().html('<button class="btn btn-primary btn-lg" id="killBtn">开始秒杀</button>');

        $.post(seckill.URL.exposer(seckillId), {}, function (result) {
            //在回调函数种执行交互流程
            if (result && result['success']) {
                var exposer = result['data'];
                if (exposer['exposed']) {
                    //开启秒杀
                    //获取秒杀地址
                    var md5 = exposer['md5'];
                    var killUrl = seckill.URL.execution(seckillId, md5);
                    console.log("killUrl: " + killUrl);
                    //绑定一次点击事件
                    $('#killBtn').one('click', function () {
                        //执行秒杀请求
                        //1.先禁用按钮
                        $(this).addClass('disabled');//,<-$(this)===('#killBtn')->
                        //2.发送秒杀请求执行秒杀
                        $.post(killUrl, {}, function (result) {
                            if (result && result['success']) {
                                var killResult = result['data'];
                                var state = killResult['state'];
                                var stateInfo = killResult['stateInfo'];
                                //显示秒杀结果
                                node.html('<span class="label label-success">' + stateInfo + '</span>');
                                var killPay = $('#killPay');
                                killPay.modal({
                                    show: true,//显示弹出层
                                    backdrop: 'static',//禁止位置关闭
                                    keyboard: false//关闭键盘事件
                                });
                                $("#killPayId").click(function(){
                                    window.location.href="/successKilled/findUserSuccessKilled";
                                });
                            }
                        });
                    });
                    node.show();
                } else {
                    //未开启秒杀(浏览器计时偏差)
                    var now = exposer['now'];
                    var start = exposer['start'];
                    var end = exposer['end'];
                    seckill.countDown(seckillId, now, start, end);
                }
            } else {
                console.log('result: ' + result);
            }
        });

    },


    countDown: function (seckillId, nowTime, startTime, endTime) {
        console.log(seckillId + '_' + nowTime + '_' + startTime + '_' + endTime);
        var seckillBox = $('#seckill-box');
        if (nowTime > endTime) {
            //秒杀结束
            seckillBox.html('秒杀结束!');
        } else if (nowTime < startTime) {
            //秒杀未开始,计时事件绑定
            var killTime = new Date(startTime + 1000);//todo 防止时间偏移
            seckillBox.countdown(killTime, function (event) {
                //时间格式
                var format = event.strftime('秒杀倒计时: %D天 %H时 %M分 %S秒 ');
                seckillBox.html(format);
            }).on('finish.countdown', function () {
                //时间完成后回调事件
                //获取秒杀地址,控制现实逻辑,执行秒杀
                console.log('______fininsh.countdown');
                seckill.handlerSeckill(seckillId, seckillBox);
            });
        } else {
            //秒杀开始
            seckill.handlerSeckill(seckillId, seckillBox);
        }
    }
}

