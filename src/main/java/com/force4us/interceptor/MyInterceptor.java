package com.force4us.interceptor;


import com.force4us.entity.UserEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
public class MyInterceptor implements HandlerInterceptor {
    private static final Logger LOGGER = LoggerFactory.getLogger(MyInterceptor.class);
     //String fileAddress = "F:\\yike\\PV\\pv.txt";

    private List<String> excludeUrls;

    public List<String> getExcludeUrls() {
        return excludeUrls;
    }

    public void setExcludeUrls(List<String> excludeUrls) {
        this.excludeUrls = excludeUrls;
    }

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String fileAddress = request.getSession().getServletContext().getRealPath("/");
        fileAddress = fileAddress+"resource\\pv.txt";
        FileReader file = new FileReader(fileAddress);
            //InputStreamReader read = new InputStreamReader(new FileInputStream(file),"utf-8");
            BufferedReader bufferedReader = new BufferedReader(file);
            String number = bufferedReader.readLine();
            bufferedReader.close();
        int count = Integer.parseInt(number);
        count++;
        HttpSession session = request.getSession();
            session.setAttribute("pvNumber",count);
            FileWriter outFileWriter = new FileWriter(fileAddress);
            BufferedWriter bufferedWriter = new BufferedWriter(outFileWriter);
            bufferedWriter.write(count+"");
            bufferedWriter.close();

        boolean  falg = true;
        Map<String,Object> map = new HashMap<String,Object>();
        String ipAddr = getIpAddress(request);
        //String request_localAddr = request.getLocalAddr();
       //String request_remoteAddress = request.getRemoteAddr();
        LOGGER.info("[用户访问IP：]"+ipAddr);
        response.setHeader("Content-type","text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String accept = request.getHeader("Accept");
        LOGGER.info("请求头accept__"+accept);
        if(null == accept){
            return false;
        }
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        if(excludeUrls.contains(request.getRequestURI())){
            LOGGER.info("[不需要验证]：正常跳转_"+request.getRequestURI());
        }else {
           // HttpSession session = request.getSession();
            UserEntity user = (UserEntity) session.getAttribute("user");
            if (null != user) {
                LOGGER.info("[已登录请求]：验证通过正常跳转");
            } else {
                falg = false;
                map.put("status", "502");
                map.put("message", "错误请求");
                System.out.println("###################################错误请求##########"+ipAddr);
                response.sendRedirect("/login");
            }
        }

        return falg;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) throws Exception {

    }

    public final static String getIpAddress(HttpServletRequest request) throws IOException {
        String ip = request.getHeader("X-Forwarded-For");
        if (LOGGER.isInfoEnabled()) {
           // LOGGER.info("getIpAddress(HttpServletRequest) - X-Forwarded-For - String ip=" + ip);
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("Proxy-Client-IP");
                if (LOGGER.isInfoEnabled()) {
                   // LOGGER.info("getIpAddress(HttpServletRequest) - Proxy-Client-IP - String ip=" + ip);
                }
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("WL-Proxy-Client-IP");
                if (LOGGER.isInfoEnabled()) {
                   // LOGGER.info("getIpAddress(HttpServletRequest) - WL-Proxy-Client-IP - String ip=" + ip);
                }
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("HTTP_CLIENT_IP");
                if (LOGGER.isInfoEnabled()) {
                   // LOGGER.info("getIpAddress(HttpServletRequest) - HTTP_CLIENT_IP - String ip=" + ip);
                }
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("HTTP_X_FORWARDED_FOR");
                if (LOGGER.isInfoEnabled()) {
                   // LOGGER.info("getIpAddress(HttpServletRequest) - HTTP_X_FORWARDED_FOR - String ip=" + ip);
                }
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getRemoteAddr();
                if (LOGGER.isInfoEnabled()) {
                   // LOGGER.info("getIpAddress(HttpServletRequest) - getRemoteAddr - String ip=" + ip);
                }
            }
        } else if (ip.length() > 15) {
            String[] ips = ip.split(",");
            for (int index = 0; index < ips.length; index++) {
                String strIp = (String) ips[index];
                if (!("unknown".equalsIgnoreCase(strIp))) {
                    ip = strIp;
                    break;
                }
            }
        }
        return ip;
    }
}
