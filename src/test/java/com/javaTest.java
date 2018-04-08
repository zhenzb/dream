package com;

import java.util.UUID;

/**
 * @Describe:
 * @Author:zhenzhuobin
 * @Date:
 */
public class javaTest {
    public static void main(String[] args) {
        UUID uuid = UUID.randomUUID();
        String uuidResoult = uuid.toString().replace("-", "");
        int i = Integer.parseInt(uuidResoult, 10);
        System.out.println(i);

        long userId = System.currentTimeMillis();
        System.out.println(userId);
        //String.valueOf(userId).substring(String.valueOf(userId).length());

    }
}
