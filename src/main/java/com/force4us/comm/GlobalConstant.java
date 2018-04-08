package com.force4us.comm;

public class GlobalConstant {
    /**
     * 全局接口响应标识
     */
    public final static String SUCCESS = "success";
    public final static String ERROR = "error";
    /**
     * 全局数据状态标识
     */
    public static final int INIT_SATTE= 1;
    /**
     * 注册
     */
    public final static String REGISTER = "注册成功";
    public final static String UNREGISTER = "注册失败";

    public final static String ALREADYEXTIES = "用户名已注册";



    /**
     * 登录
     */
    public final static String LOGIN = "登录成功";
    public final static String UN_LOGIN = "账户或密码错误";
    public final static String UN_RAND_CODE="验证码错误或超时";

    /**
     * 用户地址操作
     */
    public final static String ADDRESS_SUCCESS = "添加成功";
    public final static String UN_ADDRES = "添加失败";
    public final static int ISDEFAULT = 1;
    public final static int UNDEFAULT = 0;

    /**
     * 用户账户标识
     */
    public final static int INT_GOLD = 1000;
    public final static int INT_SILVERBEAN=10000;
    public final static String USER_LEVEL = "普通会员";

    /**
     * 资产类型 1：金币 2：银豆
     */

    public final static int GOLD = 1;
    public final static int SILVERBEAN = 2;
    public final static int money = 3;

    /**
     * 用户等级
     */
    public final static String PT = "普通会员";
    public final static String BY = "白银会员";
    public final static String HJ = "黄金会员";
    public final static String BJ = "白金会员";
    public final static String ZS = "钻石会员";
    public final static String HZ = "黑钻会员";

    public final static int PUHY = 10000;
    public final static int BYHY = 15000;
    public final static int HJHY = 30000;
    public final static int BJHY = 60000;
    public final static int ZSHY = 120000;
    public final static int HZHY = 200000;

    public final static String PTIMG = "/resource/img/pthy.png";
    public final static String BYIMG = "/resource/img/byhy.png";
    public final static String HJIMG = "/resource/img/hjhy.png";
    public final static String BJIMG = "/resource/img/bjhy.png";
    public final static String ZSIMG = "/resource/img/zshy.png";
    public final static String HZIMG = "/resource/img/hzhy.png";

    /**
     * 商品状态
     */
    public final static int UNPUBLISH = 0;
    public final static int PUBLISH = 1;
    public final static String PUBLISHSUCCESS = "发布成功";
    public final static String PUBLISHERROR = "发布失败";

    /**
     * 招聘标识
     */

}
