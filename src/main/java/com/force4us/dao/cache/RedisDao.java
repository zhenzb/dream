package com.force4us.dao.cache;

import com.dyuproject.protostuff.LinkedBuffer;
import com.dyuproject.protostuff.ProtostuffIOUtil;
import com.dyuproject.protostuff.runtime.RuntimeSchema;
import com.force4us.entity.SeckillEntity;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by chengjinqian on 2017/4/20.
 */
public class RedisDao {

    private final JedisPool jedisPool;

    public RedisDao(String ip, int port) {
        JedisPoolConfig config = new JedisPoolConfig();
        //连接耗尽时是否阻塞, false报异常,ture阻塞直到超时, 默认true
        config.setBlockWhenExhausted(false);
        //是否启用pool的jmx管理功能, 默认true
        config.setJmxEnabled(true);
        //是否启用后进先出, 默认true
        config.setLifo(true);
        //最大空闲连接数 默认8个
        config.setMaxIdle(8);
        //最大连接数 默认8个
        config.setMaxTotal(40);
        //最小空闲时间连接数 默认0
        config.setMinIdle(3);
        //获取连接资源的超时时间 默认-1（就是不确定超超时时间  会一直等下去）
        config.setMaxWaitMillis(5000);
        jedisPool = new JedisPool(config,ip, port);
    }

    private RuntimeSchema<SeckillEntity> schema = RuntimeSchema.createFrom(SeckillEntity.class);
    private RuntimeSchema<ArrayList> schemaList = RuntimeSchema.createFrom(ArrayList.class);


    public SeckillEntity getSeckill(long seckillId) {
        /* redis操作逻辑 */
        try {
            Jedis jedis = jedisPool.getResource();
            try {
                String key = "seckill:" + seckillId;
                //并没有实现哪部序列化操作
                //采用自定义序列化
                //protostuff: pojo.
                byte[] bytes = jedis.get(key.getBytes());
                //缓存重获取到
                if (bytes != null) {
                    SeckillEntity seckillEntity =schema.newMessage();
                    ProtostuffIOUtil.mergeFrom(bytes, seckillEntity,schema);
                    //seckill被反序列化
                    return seckillEntity;
                }
            }finally {
                jedis.close();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String putSeckill(SeckillEntity seckillEntity) {
        try {
            Jedis jedis = jedisPool.getResource();
            try {
                String key = "seckill:" + seckillEntity.getSeckillId();
                byte[] bytes = ProtostuffIOUtil.toByteArray(seckillEntity, schema,
                        LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE));
                /* 超时缓存 */
                int timeout = 60 * 60;//1小时
                String result = jedis.setex(key.getBytes(),timeout,bytes);

                return result;
            }finally {
                jedis.close();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public String putNumber(String key,int number) {
        try {
            Jedis jedis = jedisPool.getResource();
            try {
                //String key = "seckill:" + seckillEntity.getSeckillId();
               /* byte[] bytes = ProtostuffIOUtil.toByteArray(seckillEntity, schema,
                        LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE));*/
                /* 超时缓存 */
                int timeout = 60 * 60;//1小时
                //String result = jedis.setex(key.getBytes(),timeout,bytes);
                String numberResult = jedis.set(key, String.valueOf(number));
                jedis.expire(key,timeout);
                return numberResult;
            }finally {
                jedis.close();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    public String getNumber(String key){
        String number = null;
        Jedis jedis = jedisPool.getResource();
        try{
            number = jedis.get(key);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            jedis.close();
        }
        return number;
    }
    public String setListRedis(String key,List list){
        Jedis jedis = jedisPool.getResource();
        try {
            byte[] serialize = serialize(list);
            int timeout = 60 * 60;//1小时
            jedis.setex(key.getBytes("utf-8"),timeout,serialize);
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            jedis.close();
        }
        return null;
    }

    public List getSeckillList(String key) {
        /* redis操作逻辑 */
        try {
            Jedis jedis = null;
            if(null == jedis) {
                jedis = jedisPool.getResource();
            }
            try {
                //并没有实现哪部序列化操作
                //采用自定义序列化
                //protostuff: pojo.
                byte[] bytes = jedis.get(key.getBytes("utf-8"));
                //缓存重获取到
                if (bytes != null) {
                   /* ArrayList list =schemaList.newMessage();
                    ProtostuffIOUtil.mergeFrom(bytes, list,schemaList);*/
                    //seckill被反序列化
                    List<Object> list = unserializeForList(bytes);
                    return list;
                }
            }finally {
                jedis.close();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public static <T> byte[] serialize(List<T> value) throws IOException {
        if (value == null) {
            throw new NullPointerException("Can't serialize null");
        }
        byte[] rv=null;
        ByteArrayOutputStream bos = null;
        ObjectOutputStream os = null;
        try {
            bos = new ByteArrayOutputStream();
            os = new ObjectOutputStream(bos);
            for(T obj : value){
                os.writeObject(obj);
            }
            os.writeObject(null);
            os.close();
            bos.close();
            rv = bos.toByteArray();
        } catch (Exception e) {
            throw new IllegalArgumentException("Non-serializable object", e);
        } finally {
            os.close();
            bos.close();
        }
        return rv;
    }

    public static <T> List<T> unserializeForList(byte[] in) throws IOException {
        List<T> list = new ArrayList<T>();
        ByteArrayInputStream bis = null;
        ObjectInputStream is = null;
        try {
            if(in != null) {
                bis=new ByteArrayInputStream(in);
                is=new ObjectInputStream(bis);
                while (true) {
                    T obj = (T) is.readObject();
                    if(obj == null){
                        break;
                    }else{
                        list.add(obj);
                    }
                }
                bis.close();
                is.close();
            }
        } catch (IOException e) {
           e.printStackTrace();
        } catch (ClassNotFoundException e) {
          e.printStackTrace();
        } finally {
            is.close();
            bis.close();
        }
        return list;
    }
}
