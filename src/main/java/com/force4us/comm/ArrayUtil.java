package com.force4us.comm;

import javax.servlet.http.Cookie;
import java.lang.reflect.Array;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
public class ArrayUtil {

    public boolean checkArray(Cookie[] arry, String targetValue){
        for (Cookie str:arry) {
            if(str.getName().equals(targetValue)){
                return true;
            }
        }
        return false;
    }
}
