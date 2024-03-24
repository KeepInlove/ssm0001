package com.dormitorySystem.po;

/**
 * @author guo
 * @version 1.0
 * @description: TODO
 * @date 2024/3/24 0:13
 */
public class ExchangeInfo  {
    private static final long serialVersionUID = 1L;

    private Integer e_id;

    private Integer s_id;
    private String d_dormbuilding;
    private String d_bed;
    private String e_dormbuilding;
    private String e_bed;
    private String e_name;
    private String s_name;
    private String e_remark;
    private Integer e_status;
    private Integer s_dormitoryid;

    private Integer e_dormitoryid;


    public Integer getE_id() {
        return e_id;
    }

    public void setE_id(Integer e_id) {
        this.e_id = e_id;
    }

    public Integer getS_id() {
        return s_id;
    }

    public void setS_id(Integer s_id) {
        this.s_id = s_id;
    }

    public String getD_dormbuilding() {
        return d_dormbuilding;
    }

    public void setD_dormbuilding(String d_dormbuilding) {
        this.d_dormbuilding = d_dormbuilding;
    }

    public String getD_bed() {
        return d_bed;
    }

    public void setD_bed(String d_bed) {
        this.d_bed = d_bed;
    }

    public String getE_dormbuilding() {
        return e_dormbuilding;
    }

    public void setE_dormbuilding(String e_dormbuilding) {
        this.e_dormbuilding = e_dormbuilding;
    }

    public String getE_bed() {
        return e_bed;
    }

    public void setE_bed(String e_bed) {
        this.e_bed = e_bed;
    }

    public String getE_name() {
        return e_name;
    }

    public void setE_name(String e_name) {
        this.e_name = e_name;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public String getE_remark() {
        return e_remark;
    }

    public void setE_remark(String e_remark) {
        this.e_remark = e_remark;
    }

    public Integer getE_status() {
        return e_status;
    }

    public void setE_status(Integer e_status) {
        this.e_status = e_status;
    }

    public Integer getS_dormitoryid() {
        return s_dormitoryid;
    }

    public void setS_dormitoryid(Integer s_dormitoryid) {
        this.s_dormitoryid = s_dormitoryid;
    }

    public Integer getE_dormitoryid() {
        return e_dormitoryid;
    }

    public void setE_dormitoryid(Integer e_dormitoryid) {
        this.e_dormitoryid = e_dormitoryid;
    }
}
