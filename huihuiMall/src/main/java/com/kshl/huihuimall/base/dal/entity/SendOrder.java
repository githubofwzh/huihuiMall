package com.kshl.huihuimall.base.dal.entity;

import java.io.Serializable;
import java.util.Date;

public class SendOrder implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column send_order.id
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column send_order.order_number
     *
     * @mbg.generated
     */
    private String orderNumber;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column send_order.warehouse_id
     *
     * @mbg.generated
     */
    private Integer warehouseId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column send_order.warehouse_name
     *
     * @mbg.generated
     */
    private String warehouseName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column send_order.sendtime
     *
     * @mbg.generated
     */
    private Date sendtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table send_order
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column send_order.id
     *
     * @return the value of send_order.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column send_order.id
     *
     * @param id the value for send_order.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column send_order.order_number
     *
     * @return the value of send_order.order_number
     *
     * @mbg.generated
     */
    public String getOrderNumber() {
        return orderNumber;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column send_order.order_number
     *
     * @param orderNumber the value for send_order.order_number
     *
     * @mbg.generated
     */
    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber == null ? null : orderNumber.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column send_order.warehouse_id
     *
     * @return the value of send_order.warehouse_id
     *
     * @mbg.generated
     */
    public Integer getWarehouseId() {
        return warehouseId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column send_order.warehouse_id
     *
     * @param warehouseId the value for send_order.warehouse_id
     *
     * @mbg.generated
     */
    public void setWarehouseId(Integer warehouseId) {
        this.warehouseId = warehouseId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column send_order.warehouse_name
     *
     * @return the value of send_order.warehouse_name
     *
     * @mbg.generated
     */
    public String getWarehouseName() {
        return warehouseName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column send_order.warehouse_name
     *
     * @param warehouseName the value for send_order.warehouse_name
     *
     * @mbg.generated
     */
    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName == null ? null : warehouseName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column send_order.sendtime
     *
     * @return the value of send_order.sendtime
     *
     * @mbg.generated
     */
    public Date getSendtime() {
        return sendtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column send_order.sendtime
     *
     * @param sendtime the value for send_order.sendtime
     *
     * @mbg.generated
     */
    public void setSendtime(Date sendtime) {
        this.sendtime = sendtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table send_order
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
        sb.append(", orderNumber=").append(orderNumber);
        sb.append(", warehouseId=").append(warehouseId);
        sb.append(", warehouseName=").append(warehouseName);
        sb.append(", sendtime=").append(sendtime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}