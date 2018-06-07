package com.kshl.huihuimall.base.dal.entity;

import java.util.Date;

public class KsmAccount {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ksm_account.id
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ksm_account.login_account
     *
     * @mbg.generated
     */
    private String loginAccount;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ksm_account.login_password
     *
     * @mbg.generated
     */
    private String loginPassword;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ksm_account.name
     *
     * @mbg.generated
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ksm_account.phone
     *
     * @mbg.generated
     */
    private String phone;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ksm_account.email
     *
     * @mbg.generated
     */
    private String email;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ksm_account.type
     *
     * @mbg.generated
     */
    private Integer type;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ksm_account.enable
     *
     * @mbg.generated
     */
    private Integer enable;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ksm_account.ent_id
     *
     * @mbg.generated
     */
    private Integer entId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ksm_account.create_time
     *
     * @mbg.generated
     */
    private Date createTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ksm_account.modify_time
     *
     * @mbg.generated
     */
    private Date modifyTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ksm_account.is_deleted
     *
     * @mbg.generated
     */
    private Integer isDeleted;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ksm_account.ent_code
     *
     * @mbg.generated
     */
    private String entCode;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ksm_account.id
     *
     * @return the value of ksm_account.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ksm_account.id
     *
     * @param id the value for ksm_account.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ksm_account.login_account
     *
     * @return the value of ksm_account.login_account
     *
     * @mbg.generated
     */
    public String getLoginAccount() {
        return loginAccount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ksm_account.login_account
     *
     * @param loginAccount the value for ksm_account.login_account
     *
     * @mbg.generated
     */
    public void setLoginAccount(String loginAccount) {
        this.loginAccount = loginAccount == null ? null : loginAccount.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ksm_account.login_password
     *
     * @return the value of ksm_account.login_password
     *
     * @mbg.generated
     */
    public String getLoginPassword() {
        return loginPassword;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ksm_account.login_password
     *
     * @param loginPassword the value for ksm_account.login_password
     *
     * @mbg.generated
     */
    public void setLoginPassword(String loginPassword) {
        this.loginPassword = loginPassword == null ? null : loginPassword.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ksm_account.name
     *
     * @return the value of ksm_account.name
     *
     * @mbg.generated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ksm_account.name
     *
     * @param name the value for ksm_account.name
     *
     * @mbg.generated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ksm_account.phone
     *
     * @return the value of ksm_account.phone
     *
     * @mbg.generated
     */
    public String getPhone() {
        return phone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ksm_account.phone
     *
     * @param phone the value for ksm_account.phone
     *
     * @mbg.generated
     */
    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ksm_account.email
     *
     * @return the value of ksm_account.email
     *
     * @mbg.generated
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ksm_account.email
     *
     * @param email the value for ksm_account.email
     *
     * @mbg.generated
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ksm_account.type
     *
     * @return the value of ksm_account.type
     *
     * @mbg.generated
     */
    public Integer getType() {
        return type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ksm_account.type
     *
     * @param type the value for ksm_account.type
     *
     * @mbg.generated
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ksm_account.enable
     *
     * @return the value of ksm_account.enable
     *
     * @mbg.generated
     */
    public Integer getEnable() {
        return enable;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ksm_account.enable
     *
     * @param enable the value for ksm_account.enable
     *
     * @mbg.generated
     */
    public void setEnable(Integer enable) {
        this.enable = enable;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ksm_account.ent_id
     *
     * @return the value of ksm_account.ent_id
     *
     * @mbg.generated
     */
    public Integer getEntId() {
        return entId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ksm_account.ent_id
     *
     * @param entId the value for ksm_account.ent_id
     *
     * @mbg.generated
     */
    public void setEntId(Integer entId) {
        this.entId = entId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ksm_account.create_time
     *
     * @return the value of ksm_account.create_time
     *
     * @mbg.generated
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ksm_account.create_time
     *
     * @param createTime the value for ksm_account.create_time
     *
     * @mbg.generated
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ksm_account.modify_time
     *
     * @return the value of ksm_account.modify_time
     *
     * @mbg.generated
     */
    public Date getModifyTime() {
        return modifyTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ksm_account.modify_time
     *
     * @param modifyTime the value for ksm_account.modify_time
     *
     * @mbg.generated
     */
    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ksm_account.is_deleted
     *
     * @return the value of ksm_account.is_deleted
     *
     * @mbg.generated
     */
    public Integer getIsDeleted() {
        return isDeleted;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ksm_account.is_deleted
     *
     * @param isDeleted the value for ksm_account.is_deleted
     *
     * @mbg.generated
     */
    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ksm_account.ent_code
     *
     * @return the value of ksm_account.ent_code
     *
     * @mbg.generated
     */
    public String getEntCode() {
        return entCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ksm_account.ent_code
     *
     * @param entCode the value for ksm_account.ent_code
     *
     * @mbg.generated
     */
    public void setEntCode(String entCode) {
        this.entCode = entCode == null ? null : entCode.trim();
    }
}