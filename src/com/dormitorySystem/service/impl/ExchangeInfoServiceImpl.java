package com.dormitorySystem.service.impl;

import com.dormitorySystem.dao.ExchangeInfoDao;
import com.dormitorySystem.po.ExchangeInfo;
import com.dormitorySystem.po.PageInfo;
import com.dormitorySystem.service.ExchangeInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author guo
 * @version 1.0
 * @description: TODO
 * @date 2024/3/24 16:51
 */
@Service("exchangeInfoService")
@Transactional
public class ExchangeInfoServiceImpl  implements ExchangeInfoService {
    
    @Autowired
    private ExchangeInfoDao exchangeInfoDao;
    
    @Override
    public PageInfo<ExchangeInfo> findPageInfo(String s_name, Integer s_id, Integer pageIndex, Integer pageSize) {
        PageInfo<ExchangeInfo> pi = new PageInfo<ExchangeInfo>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = exchangeInfoDao.totalCount(s_id,s_name);
        if (totalCount>0){
            pi.setTotalCount(totalCount);
            //每一页显示宿舍信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<ExchangeInfo> exchangeInfoList =exchangeInfoDao.getExchangeInfoList(s_id,s_name, (pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
            pi.setList(exchangeInfoList);
        }
        return pi;
    }

    @Override
    public List<ExchangeInfo> getAll(){
        List<ExchangeInfo> ExchangeInfoList = exchangeInfoDao.getAll();
        return ExchangeInfoList;
    }

    //添加宿舍卫生信息
    @Override
    public int addExchangeInfo(ExchangeInfo ExchangeInfo) {
        return exchangeInfoDao.addExchangeInfo(ExchangeInfo);
    }

    //通过id删除宿舍卫生信息
    @Override
    public int deleteExchangeInfo(Integer g_id) {
        return exchangeInfoDao.deleteExchangeInfo(g_id);
    }

    //修改宿舍卫生信息
    @Override
    public int updateExchangeInfo(ExchangeInfo ExchangeInfo) {
        return exchangeInfoDao.updateExchangeInfo(ExchangeInfo);
    }

    @Override
    public ExchangeInfo findExchangeInfoById (Integer g_id){
        ExchangeInfo d = exchangeInfoDao.findExchangeInfoById(g_id);
        return  d;
    }
}
