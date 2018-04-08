package com.force4us.dto;

import com.force4us.entity.SuccessKilledEntity;
import com.force4us.enums.SeckillStatEnum;

/**封装执行秒杀后的结果:是否秒杀成功
 * Created by chengjinqian on 2017/4/18.
 */
public class SeckillExecution {

    private long seckillId;


    private int state;


    private String stateInfo;


    private SuccessKilledEntity successKilledEntity;


    public SeckillExecution(long seckillId, SeckillStatEnum statEnum) {
        this.seckillId = seckillId;
        this.state = statEnum.getState();
        this.stateInfo = statEnum.getStateInfo();
    }

    public SeckillExecution(long seckillId, SeckillStatEnum statEnum, SuccessKilledEntity successKilledEntity) {
        this.seckillId = seckillId;
        this.state = statEnum.getState();
        this.stateInfo = statEnum.getStateInfo();
        this.successKilledEntity = successKilledEntity;
    }

    public long getSeckillId() {
        return seckillId;
    }

    public void setSeckillId(long seckillId) {
        this.seckillId = seckillId;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }

    public SuccessKilledEntity getSuccessKilledEntity() {
        return successKilledEntity;
    }

    public void setSuccessKilledEntity(SuccessKilledEntity successKilledEntity) {
        this.successKilledEntity = successKilledEntity;
    }

    @Override
    public String toString() {
        return "SeckillExecution{" +
                "seckillId=" + seckillId +
                ", state=" + state +
                ", stateInfo='" + stateInfo + '\'' +
                ", successKilled=" + successKilledEntity +
                '}';
    }
}
