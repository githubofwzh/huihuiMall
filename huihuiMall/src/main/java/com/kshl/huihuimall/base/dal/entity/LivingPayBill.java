package com.kshl.huihuimall.base.dal.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class LivingPayBill implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column living_pay_bill.id
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column living_pay_bill.RechargeAccount
     *
     * @mbg.generated
     */
    private String rechargeaccount;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column living_pay_bill.BillId
     *
     * @mbg.generated
     */
    private String billid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column living_pay_bill.SaleAmount
     *
     * @mbg.generated
     */
    private BigDecimal saleamount;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column living_pay_bill.PayState
     *
     * @mbg.generated
     */
    private Integer paystate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column living_pay_bill.RechargeState
     *
     * @mbg.generated
     */
    private Integer rechargestate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column living_pay_bill.Sordernumber
     *
     * @mbg.generated
     */
    private String sordernumber;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column living_pay_bill.OuterTid
     *
     * @mbg.generated
     */
    private String outertid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column living_pay_bill.OrderTime
     *
     * @mbg.generated
     */
    private Date ordertime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column living_pay_bill.OperateTime
     *
     * @mbg.generated
     */
    private Date operatetime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column living_pay_bill.PayType
     *
     * @mbg.generated
     */
    private Integer paytype;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column living_pay_bill.Phone
     *
     * @mbg.generated
     */
    private String phone;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column living_pay_bill.Userid
     *
     * @mbg.generated
     */
    private String userid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table living_pay_bill
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column living_pay_bill.id
     *
     * @return the value of living_pay_bill.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column living_pay_bill.id
     *
     * @param id the value for living_pay_bill.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column living_pay_bill.RechargeAccount
     *
     * @return the value of living_pay_bill.RechargeAccount
     *
     * @mbg.generated
     */
    public String getRechargeaccount() {
        return rechargeaccount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column living_pay_bill.RechargeAccount
     *
     * @param rechargeaccount the value for living_pay_bill.RechargeAccount
     *
     * @mbg.generated
     */
    public void setRechargeaccount(String rechargeaccount) {
        this.rechargeaccount = rechargeaccount == null ? null : rechargeaccount.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column living_pay_bill.BillId
     *
     * @return the value of living_pay_bill.BillId
     *
     * @mbg.generated
     */
    public String getBillid() {
        return billid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column living_pay_bill.BillId
     *
     * @param billid the value for living_pay_bill.BillId
     *
     * @mbg.generated
     */
    public void setBillid(String billid) {
        this.billid = billid == null ? null : billid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column living_pay_bill.SaleAmount
     *
     * @return the value of living_pay_bill.SaleAmount
     *
     * @mbg.generated
     */
    public BigDecimal getSaleamount() {
        return saleamount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column living_pay_bill.SaleAmount
     *
     * @param saleamount the value for living_pay_bill.SaleAmount
     *
     * @mbg.generated
     */
    public void setSaleamount(BigDecimal saleamount) {
        this.saleamount = saleamount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column living_pay_bill.PayState
     *
     * @return the value of living_pay_bill.PayState
     *
     * @mbg.generated
     */
    public Integer getPaystate() {
        return paystate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column living_pay_bill.PayState
     *
     * @param paystate the value for living_pay_bill.PayState
     *
     * @mbg.generated
     */
    public void setPaystate(Integer paystate) {
        this.paystate = paystate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column living_pay_bill.RechargeState
     *
     * @return the value of living_pay_bill.RechargeState
     *
     * @mbg.generated
     */
    public Integer getRechargestate() {
        return rechargestate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column living_pay_bill.RechargeState
     *
     * @param rechargestate the value for living_pay_bill.RechargeState
     *
     * @mbg.generated
     */
    public void setRechargestate(Integer rechargestate) {
        this.rechargestate = rechargestate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column living_pay_bill.Sordernumber
     *
     * @return the value of living_pay_bill.Sordernumber
     *
     * @mbg.generated
     */
    public String getSordernumber() {
        return sordernumber;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column living_pay_bill.Sordernumber
     *
     * @param sordernumber the value for living_pay_bill.Sordernumber
     *
     * @mbg.generated
     */
    public void setSordernumber(String sordernumber) {
        this.sordernumber = sordernumber == null ? null : sordernumber.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column living_pay_bill.OuterTid
     *
     * @return the value of living_pay_bill.OuterTid
     *
     * @mbg.generated
     */
    public String getOutertid() {
        return outertid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column living_pay_bill.OuterTid
     *
     * @param outertid the value for living_pay_bill.OuterTid
     *
     * @mbg.generated
     */
    public void setOutertid(String outertid) {
        this.outertid = outertid == null ? null : outertid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column living_pay_bill.OrderTime
     *
     * @return the value of living_pay_bill.OrderTime
     *
     * @mbg.generated
     */
    public Date getOrdertime() {
        return ordertime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column living_pay_bill.OrderTime
     *
     * @param ordertime the value for living_pay_bill.OrderTime
     *
     * @mbg.generated
     */
    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column living_pay_bill.OperateTime
     *
     * @return the value of living_pay_bill.OperateTime
     *
     * @mbg.generated
     */
    public Date getOperatetime() {
        return operatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column living_pay_bill.OperateTime
     *
     * @param operatetime the value for living_pay_bill.OperateTime
     *
     * @mbg.generated
     */
    public void setOperatetime(Date operatetime) {
        this.operatetime = operatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column living_pay_bill.PayType
     *
     * @return the value of living_pay_bill.PayType
     *
     * @mbg.generated
     */
    public Integer getPaytype() {
        return paytype;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column living_pay_bill.PayType
     *
     * @param paytype the value for living_pay_bill.PayType
     *
     * @mbg.generated
     */
    public void setPaytype(Integer paytype) {
        this.paytype = paytype;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column living_pay_bill.Phone
     *
     * @return the value of living_pay_bill.Phone
     *
     * @mbg.generated
     */
    public String getPhone() {
        return phone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column living_pay_bill.Phone
     *
     * @param phone the value for living_pay_bill.Phone
     *
     * @mbg.generated
     */
    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column living_pay_bill.Userid
     *
     * @return the value of living_pay_bill.Userid
     *
     * @mbg.generated
     */
    public String getUserid() {
        return userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column living_pay_bill.Userid
     *
     * @param userid the value for living_pay_bill.Userid
     *
     * @mbg.generated
     */
    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table living_pay_bill
     *
     * @mbg.generated
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", rechargeaccount=").append(rechargeaccount);
        sb.append(", billid=").append(billid);
        sb.append(", saleamount=").append(saleamount);
        sb.append(", paystate=").append(paystate);
        sb.append(", rechargestate=").append(rechargestate);
        sb.append(", sordernumber=").append(sordernumber);
        sb.append(", outertid=").append(outertid);
        sb.append(", ordertime=").append(ordertime);
        sb.append(", operatetime=").append(operatetime);
        sb.append(", paytype=").append(paytype);
        sb.append(", phone=").append(phone);
        sb.append(", userid=").append(userid);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}