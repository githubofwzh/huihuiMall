package com.kshl.huihuimall.base.dal.entity;

import java.io.Serializable;

public class ThiradAccountType implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column thirad_account_type.id
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column thirad_account_type.thirad_account
     *
     * @mbg.generated
     */
    private Integer thiradAccount;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column thirad_account_type.thirad_name
     *
     * @mbg.generated
     */
    private String thiradName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column thirad_account_type.thirad_state
     *
     * @mbg.generated
     */
    private Integer thiradState;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table thirad_account_type
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column thirad_account_type.id
     *
     * @return the value of thirad_account_type.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column thirad_account_type.id
     *
     * @param id the value for thirad_account_type.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column thirad_account_type.thirad_account
     *
     * @return the value of thirad_account_type.thirad_account
     *
     * @mbg.generated
     */
    public Integer getThiradAccount() {
        return thiradAccount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column thirad_account_type.thirad_account
     *
     * @param thiradAccount the value for thirad_account_type.thirad_account
     *
     * @mbg.generated
     */
    public void setThiradAccount(Integer thiradAccount) {
        this.thiradAccount = thiradAccount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column thirad_account_type.thirad_name
     *
     * @return the value of thirad_account_type.thirad_name
     *
     * @mbg.generated
     */
    public String getThiradName() {
        return thiradName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column thirad_account_type.thirad_name
     *
     * @param thiradName the value for thirad_account_type.thirad_name
     *
     * @mbg.generated
     */
    public void setThiradName(String thiradName) {
        this.thiradName = thiradName == null ? null : thiradName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column thirad_account_type.thirad_state
     *
     * @return the value of thirad_account_type.thirad_state
     *
     * @mbg.generated
     */
    public Integer getThiradState() {
        return thiradState;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column thirad_account_type.thirad_state
     *
     * @param thiradState the value for thirad_account_type.thirad_state
     *
     * @mbg.generated
     */
    public void setThiradState(Integer thiradState) {
        this.thiradState = thiradState;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table thirad_account_type
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
        sb.append(", thiradAccount=").append(thiradAccount);
        sb.append(", thiradName=").append(thiradName);
        sb.append(", thiradState=").append(thiradState);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}