package com.dormitorySystem.controller;


import com.dormitorySystem.po.ExchangeInfo;
import com.dormitorySystem.po.PageInfo;
import com.dormitorySystem.service.ExchangeInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 用户控制器类
 */
@Controller
public class ExchangeInfoController {
	// 依赖注入
	@Autowired
	private ExchangeInfoService exchangeInfoService;

	/**
	 * 分页查询
	 * pageIndex 当前页码
	 * pageSize  显示条数
	 */
	@RequestMapping(value = "/findExchangeInfo")
	public String findExchangeInfo(String s_name, Integer s_studentid, Integer pageIndex, Integer pageSize, Model model) {

	  PageInfo<ExchangeInfo> pi = exchangeInfoService.findPageInfo(s_name,s_studentid,pageIndex,pageSize);
	  model.addAttribute("pi",pi);
	  model.addAttribute("s_name",s_name);
		return "exchangeInfo_list";
	}



	/**
	 * 删除学生信息
	 */
	@RequestMapping( "/deleteExchangeInfo")
	@ResponseBody
	public String deleteExchangeInfo(Integer s_id) {
		int s = exchangeInfoService.deleteExchangeInfo(s_id);
		return "exchangeInfo_list";
	}


   @RequestMapping(value = "/addExchangeInfo" ,method = RequestMethod.POST)
   @ResponseBody
   public String addExchangeInfo(@RequestBody ExchangeInfo exchangeInfo) {
	   int s = exchangeInfoService.addExchangeInfo(exchangeInfo);
	    return "exchangeInfo_list";
    }

	@RequestMapping(value = "/updateExchangeInfo" ,method = RequestMethod.POST )
	public String updateExchangeInfo(ExchangeInfo exchangeInfo) {
		int s = exchangeInfoService.updateExchangeInfo(exchangeInfo);
		return "redirect:/findExchangeInfo";
	}


    @RequestMapping( "/findExchangeInfoById")
    public String findExchangeInfoById(Integer s_id,HttpSession session) {

        ExchangeInfo s= exchangeInfoService.findExchangeInfoById(s_id);
        session.setAttribute("s",s);
        return "exchangeInfo_edit";
    }
}
