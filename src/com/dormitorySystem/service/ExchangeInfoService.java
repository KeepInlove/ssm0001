package com.dormitorySystem.service;

import com.dormitorySystem.po.PageInfo;
import com.dormitorySystem.po.ExchangeInfo;

import java.util.List;

/**
 * 用户Service层接口
 */
public interface ExchangeInfoService {

	//分页查询
	public PageInfo<ExchangeInfo> findPageInfo(String s_name,Integer s_id, Integer pageIndex, Integer pageSize);

	public int deleteExchangeInfo(Integer s_id);   //通过id删除
	public int addExchangeInfo(ExchangeInfo ExchangeInfo);
	public int updateExchangeInfo(ExchangeInfo ExchangeInfo);
	public ExchangeInfo findExchangeInfoById(Integer s_id);

	public List<ExchangeInfo> getAll();
}
