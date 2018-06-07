package com.kshl.huihuimall.base.dal.entity;

import java.io.Serializable;

public class Inventory implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column inventory.id
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column inventory.product_id
     *
     * @mbg.generated
     */
    private Integer productId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column inventory.storehouse_id
     *
     * @mbg.generated
     */
    private Integer storehouseId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column inventory.onhand
     *
     * @mbg.generated
     */
    private Integer onhand;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table inventory
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column inventory.id
     *
     * @return the value of inventory.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column inventory.id
     *
     * @param id the value for inventory.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column inventory.product_id
     *
     * @return the value of inventory.product_id
     *
     * @mbg.generated
     */
    public Integer getProductId() {
        return productId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column inventory.product_id
     *
     * @param productId the value for inventory.product_id
     *
     * @mbg.generated
     */
    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column inventory.storehouse_id
     *
     * @return the value of inventory.storehouse_id
     *
     * @mbg.generated
     */
    public Integer getStorehouseId() {
        return storehouseId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column inventory.storehouse_id
     *
     * @param storehouseId the value for inventory.storehouse_id
     *
     * @mbg.generated
     */
    public void setStorehouseId(Integer storehouseId) {
        this.storehouseId = storehouseId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column inventory.onhand
     *
     * @return the value of inventory.onhand
     *
     * @mbg.generated
     */
    public Integer getOnhand() {
        return onhand;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column inventory.onhand
     *
     * @param onhand the value for inventory.onhand
     *
     * @mbg.generated
     */
    public void setOnhand(Integer onhand) {
        this.onhand = onhand;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory
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
        sb.append(", productId=").append(productId);
        sb.append(", storehouseId=").append(storehouseId);
        sb.append(", onhand=").append(onhand);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}