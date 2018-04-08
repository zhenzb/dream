package com.force4us.comm;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;

/**
 * @author: liuQiang
 * @Date: Created in 2017/12/6 14:53
 * @dateCreated:
 **/
public class ImageUtil {

    private static BASE64Encoder encoder = new BASE64Encoder();
    private static BASE64Decoder decoder = new BASE64Decoder();

    /**
     * 将图片流转换为BASE64加密字符串.
     *
     * @param imageInputStream
     * @param format           图片格式.
     * @return
     */



    public static String convertImageStreamToByte(InputStream imageInputStream, String format) {
        BufferedImage bi = null;
        ByteArrayOutputStream baos = null;
        String result = null;
        try {
            bi = ImageIO.read(imageInputStream);
            baos = new ByteArrayOutputStream();
            ImageIO.write(bi, format == null ? "jpg" : format, baos);
            byte[] bytes = baos.toByteArray();
            result = encoder.encodeBuffer(bytes).trim();
            System.out.println("将图片流转换为BASE64加密字符串成功！");
        } catch (IOException e) {
            System.out.println("将图片流转换为 BASE64加密字符串失败: " + e);
        } finally {
            try {
                if (baos != null) {
                    baos.close();
                    baos = null;
                }
            } catch (Exception e) {
                System.out.println("关闭文件流发生异常: " + e);
            }
        }
        return result;
    }


    /**
     * 将字符串转为InputString
     *
     * @param str
     * @return
     */
    public static InputStream String2InputStream(String str) {
        ByteArrayInputStream stream = null;
        try {
            stream = new ByteArrayInputStream(str.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return stream;
    }

    public static String toConvertString(InputStream is) {
        StringBuffer res = new StringBuffer();
        // 把字节流转化为字符流
        InputStreamReader isr = new InputStreamReader(is);
        // 普通的Reader读取输入内容时依然不太方便，可以将普通的
        // Reader再次包装成BufferedReader,利用BufferReader的readLine()
        // 方法可以一次读取一行内容
        BufferedReader read = new BufferedReader(isr);
        try {
            String line;
            line = read.readLine();
            while (line != null) {
                res.append(line + "<br>");
                line = read.readLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != isr) {
                    isr.close();
                    isr.close();
                }
                if (null != read) {
                    read.close();
                    read = null;
                }
                if (null != is) {
                    is.close();
                    is = null;
                }
            } catch (IOException e) {
            }
        }
        return res.toString();
    }

    public static void convertByteToImage(String base64String, String imagePath, String format) {
        byte[] bytes = null;
        ByteArrayInputStream bais = null;
        BufferedImage bi = null;
        File file = null;
        try {
            bytes = decoder.decodeBuffer(base64String);
            bais = new ByteArrayInputStream(bytes);
            bi = ImageIO.read(bais);
            file = new File(imagePath);
            ImageIO.write(bi, format == null ? "jpg" : format, file);
            System.out.println("将BASE64加密字符串转换为图片成功！");
        } catch (IOException e) {
            System.out.println("将BASE64加密字符串转换为图片失败: " + e);
        } finally {
            try {
                if (bais != null) {
                    bais.close();
                    bais = null;
                }
            } catch (Exception e) {
                System.out.println("关闭文件流发生异常: " + e);
            }
        }
    }

}
