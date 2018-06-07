package com.kshl.huihuimall.console.base.pojo;

import java.io.Serializable;
import java.util.Date;

public class ProductDetailPojo implements Serializable {

    //商品名称
    private String name;
    //商品编号
    private String code;
    //一级名称
    private String categoryoneName;
    //二级名称
    private String categorytwoName;
    //品牌名称
    private String brandName;
    //规格型号
    private String specifications;
    //计量单位
    private String measurement;
    //包装
    private String packing;
    //毛重
    private String weight;
    //进货单价
    private double purchasePrice;
    //包装费
    private double packingPrice;
    //物料费
    private double materialPrice;
    //零售价格
    private double price;
    //批发价格
    private double wholesaleprice;
    //生成日期
    private Date createTime;
    //保质期
    private Date guaranteeTime;
    //到期日期
    private Date expireTime;
    //上架日期
    private Date puttime;
    //下架日期
    private Date outtime;
    //商品展示
    private String mainimagepath;
    //商品介绍图
    private String detailimagepath;
    //备注


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCategoryoneName() {
        return categoryoneName;
    }

    public void setCategoryoneName(String categoryoneName) {
        this.categoryoneName = categoryoneName;
    }

    public String getCategorytwoName() {
        return categorytwoName;
    }

    public void setCategorytwoName(String categorytwoName) {
        this.categorytwoName = categorytwoName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getSpecifications() {
        return specifications;
    }

    public void setSpecifications(String specifications) {
        this.specifications = specifications;
    }

    public String getMeasurement() {
        return measurement;
    }

    public void setMeasurement(String measurement) {
        this.measurement = measurement;
    }

    public String getPacking() {
        return packing;
    }

    public void setPacking(String packing) {
        this.packing = packing;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public double getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(double purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    public double getPackingPrice() {
        return packingPrice;
    }

    public void setPackingPrice(double packingPrice) {
        this.packingPrice = packingPrice;
    }

    public double getMaterialPrice() {
        return materialPrice;
    }

    public void setMaterialPrice(double materialPrice) {
        this.materialPrice = materialPrice;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getWholesaleprice() {
        return wholesaleprice;
    }

    public void setWholesaleprice(double wholesaleprice) {
        this.wholesaleprice = wholesaleprice;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getGuaranteeTime() {
        return guaranteeTime;
    }

    public void setGuaranteeTime(Date guaranteeTime) {
        this.guaranteeTime = guaranteeTime;
    }

    public Date getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(Date expireTime) {
        this.expireTime = expireTime;
    }

    public Date getPuttime() {
        return puttime;
    }

    public void setPuttime(Date puttime) {
        this.puttime = puttime;
    }

    public Date getOuttime() {
        return outtime;
    }

    public void setOuttime(Date outtime) {
        this.outtime = outtime;
    }

    public String getMainimagepath() {
        return mainimagepath;
    }

    public void setMainimagepath(String mainimagepath) {
        this.mainimagepath = mainimagepath;
    }

    public String getDetailimagepath() {
        return detailimagepath;
    }

    public void setDetailimagepath(String detailimagepath) {
        this.detailimagepath = detailimagepath;
    }
}