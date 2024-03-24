package com.dormitorySystem.dao;

import com.dormitorySystem.po.ExchangeInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ExchangeInfoDao {
    /**
     * 进行分页查询
     */
    //获取总条数
    public Integer totalCount(@Param("s_id") Integer s_id, @Param("s_name") String s_name);
    //获取用户列表
    public List<ExchangeInfo> getExchangeInfoList(@Param("s_id") Integer s_id, @Param("s_name") String s_name,  @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    public int addExchangeInfo(ExchangeInfo ExchangeInfo);    //添加宿舍卫生信息
    public int deleteExchangeInfo(@Param("e_id")Integer e_id);   //删除宿舍卫生信息
    public int updateExchangeInfo(ExchangeInfo ExchangeInfo); //修改宿舍卫生信息
    public ExchangeInfo findExchangeInfoById(@Param("e_id")Integer e_id);

    public List<ExchangeInfo> getAll();
}
