package com.force4us;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.client.RestTemplate;


public class HttpTest {
    public static void main(String[] args) {
        RestTemplate restTemplate = new RestTemplate();
        String forObject = restTemplate.getForObject("http://127.0.0.1:8080/", String.class);
        System.out.println("测试****"+forObject);
    }

}
