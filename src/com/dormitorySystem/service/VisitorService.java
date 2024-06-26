package com.dormitorySystem.service;

import com.dormitorySystem.po.PageInfo;
import com.dormitorySystem.po.Visitor;

import java.util.List;

/**
 * 访客
 **/
public interface VisitorService {
    //分页查询
    public PageInfo<Visitor> findPageInfo(String v_name, Integer v_phone , Integer pageIndex, Integer pageSize);
    public int addVisitor(Visitor visitor);   //添加访客信息
    public List<Visitor> getAll();
}
