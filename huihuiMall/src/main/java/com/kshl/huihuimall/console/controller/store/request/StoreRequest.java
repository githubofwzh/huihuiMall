package com.kshl.huihuimall.console.controller.store.request;

import com.kshl.base.reqeust.BasePageRequest;

import java.math.BigDecimal;
import java.util.Date;

public class StoreRequest extends BasePageRequest {
    //门店申请id
    private Integer id;
    //门店负责人id
    private Integer keeperId;
    //商店Id
    private Integer store_Id;

    private String shopName;

    private String shopKeeper;

    private Integer status;

    private Integer shopkeeperId;
    private Date applyTime;
    private Integer merchantType;
    private String enterpriseName;
    private String companyTel;
    private Integer addressShengshi;
    private Integer addressQu;
    private Integer addressStreet;
    private String addressDoor;
    private String storeName;
    private String storeAddress;
    private String businessYear;
    private String income;
    private String product1;
    private BigDecimal price1;
    private String product2;
    private BigDecimal price2;
    private String dailyFlow;
    private String applicationForm;
    private String enterpriseThree;
    private String houseInformation;
    private String idCard;
    private String waterFee;
    private String equipmentPhoto;
    private String accountPermit;
    private String placePhoto;
    private Integer auditStatus;

    public Integer getShopkeeperId() {
        return shopkeeperId;
    }

    public void setShopkeeperId(Integer shopkeeperId) {
        this.shopkeeperId = shopkeeperId;
    }

    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    public Integer getMerchantType() {
        return merchantType;
    }

    public void setMerchantType(Integer merchantType) {
        this.merchantType = merchantType;
    }

    public String getEnterpriseName() {
        return enterpriseName;
    }

    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }

    public String getCompanyTel() {
        return companyTel;
    }

    public void setCompanyTel(String companyTel) {
        this.companyTel = companyTel;
    }

    public Integer getAddressShengshi() {
        return addressShengshi;
    }

    public void setAddressShengshi(Integer addressShengshi) {
        this.addressShengshi = addressShengshi;
    }

    public Integer getAddressQu() {
        return addressQu;
    }

    public void setAddressQu(Integer addressQu) {
        this.addressQu = addressQu;
    }

    public Integer getAddressStreet() {
        return addressStreet;
    }

    public void setAddressStreet(Integer addressStreet) {
        this.addressStreet = addressStreet;
    }

    public String getAddressDoor() {
        return addressDoor;
    }

    public void setAddressDoor(String addressDoor) {
        this.addressDoor = addressDoor;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getStoreAddress() {
        return storeAddress;
    }

    public void setStoreAddress(String storeAddress) {
        this.storeAddress = storeAddress;
    }

    public String getBusinessYear() {
        return businessYear;
    }

    public void setBusinessYear(String businessYear) {
        this.businessYear = businessYear;
    }

    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }

    public String getProduct1() {
        return product1;
    }

    public void setProduct1(String product1) {
        this.product1 = product1;
    }

    public BigDecimal getPrice1() {
        return price1;
    }

    public void setPrice1(BigDecimal price1) {
        this.price1 = price1;
    }

    public String getProduct2() {
        return product2;
    }

    public void setProduct2(String product2) {
        this.product2 = product2;
    }

    public BigDecimal getPrice2() {
        return price2;
    }

    public void setPrice2(BigDecimal price2) {
        this.price2 = price2;
    }

    public String getDailyFlow() {
        return dailyFlow;
    }

    public void setDailyFlow(String dailyFlow) {
        this.dailyFlow = dailyFlow;
    }

    public String getApplicationForm() {
        return applicationForm;
    }

    public void setApplicationForm(String applicationForm) {
        this.applicationForm = applicationForm;
    }

    public String getEnterpriseThree() {
        return enterpriseThree;
    }

    public void setEnterpriseThree(String enterpriseThree) {
        this.enterpriseThree = enterpriseThree;
    }

    public String getHouseInformation() {
        return houseInformation;
    }

    public void setHouseInformation(String houseInformation) {
        this.houseInformation = houseInformation;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getWaterFee() {
        return waterFee;
    }

    public void setWaterFee(String waterFee) {
        this.waterFee = waterFee;
    }

    public String getEquipmentPhoto() {
        return equipmentPhoto;
    }

    public void setEquipmentPhoto(String equipmentPhoto) {
        this.equipmentPhoto = equipmentPhoto;
    }

    public String getAccountPermit() {
        return accountPermit;
    }

    public void setAccountPermit(String accountPermit) {
        this.accountPermit = accountPermit;
    }

    public String getPlacePhoto() {
        return placePhoto;
    }

    public void setPlacePhoto(String placePhoto) {
        this.placePhoto = placePhoto;
    }

    public Integer getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(Integer auditStatus) {
        this.auditStatus = auditStatus;
    }

    public Integer getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Integer deviceId) {
        this.deviceId = deviceId;
    }

    public Integer getStorehouseId() {
        return storehouseId;
    }

    public void setStorehouseId(Integer storehouseId) {
        this.storehouseId = storehouseId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getStoreArea() {
        return storeArea;
    }

    public void setStoreArea(Integer storeArea) {
        this.storeArea = storeArea;
    }

    private Integer deviceId;
    private Integer storehouseId;
    private String remark;
    private Integer storeArea;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getKeeperId() {
        return keeperId;
    }

    public void setKeeperId(Integer keeperId) {
        this.keeperId = keeperId;
    }

    public Integer getStore_Id() {
        return store_Id;
    }

    public void setStore_Id(Integer store_Id) {
        this.store_Id = store_Id;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getShopKeeper() {
        return shopKeeper;
    }

    public void setShopKeeper(String shopKeeper) {
        this.shopKeeper = shopKeeper;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
