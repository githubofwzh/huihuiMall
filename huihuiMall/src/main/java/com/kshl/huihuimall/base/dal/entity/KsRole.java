package com.kshl.huihuimall.base.dal.entity;

import java.io.Serializable;

public class KsRole implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ks_role.id
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ks_role.name
     *
     * @mbg.generated
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ks_role.description
     *
     * @mbg.generated
     */
    private String description;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ks_role.enable
     *
     * @mbg.generated
     */
    private Byte enable;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ks_role.entCode
     *
     * @mbg.generated
     */
    private String entcode;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ks_role.type
     *
     * @mbg.generated
     */
    private Integer type;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table ks_role
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ks_role.id
     *
     * @return the value of ks_role.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ks_role.id
     *
     * @param id the value for ks_role.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ks_role.name
     *
     * @return the value of ks_role.name
     *
     * @mbg.generated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ks_role.name
     *
     * @param name the value for ks_role.name
     *
     * @mbg.generated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ks_role.description
     *
     * @return the value of ks_role.description
     *
     * @mbg.generated
     */
    public String getDescription() {
        return description;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ks_role.description
     *
     * @param description the value for ks_role.description
     *
     * @mbg.generated
     */
    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ks_role.enable
     *
     * @return the value of ks_role.enable
     *
     * @mbg.generated
     */
    public Byte getEnable() {
        return enable;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ks_role.enable
     *
     * @param enable the value for ks_role.enable
     *
     * @mbg.generated
     */
    public void setEnable(Byte enable) {
        this.enable = enable;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ks_role.entCode
     *
     * @return the value of ks_role.entCode
     *
     * @mbg.generated
     */
    public String getEntcode() {
        return entcode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ks_role.entCode
     *
     * @param entcode the value for ks_role.entCode
     *
     * @mbg.generated
     */
    public void setEntcode(String entcode) {
        this.entcode = entcode == null ? null : entcode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ks_role.type
     *
     * @return the value of ks_role.type
     *
     * @mbg.generated
     */
    public Integer getType() {
        return type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ks_role.type
     *
     * @param type the value for ks_role.type
     *
     * @mbg.generated
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ks_role
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
        sb.append(", name=").append(name);
        sb.append(", description=").append(description);
        sb.append(", enable=").append(enable);
        sb.append(", entcode=").append(entcode);
        sb.append(", type=").append(type);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}