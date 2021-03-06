package com.kshl.huihuimall.base.dal.mapper;

import com.kshl.huihuimall.base.dal.entity.Inventory;
import com.kshl.huihuimall.base.dal.entity.InventoryIn;
import com.kshl.huihuimall.base.dal.entity.InventoryInExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface InventoryInMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_in
     *
     * @mbg.generated
     */
    long countByExample(InventoryInExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_in
     *
     * @mbg.generated
     */
    int deleteByExample(InventoryInExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_in
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_in
     *
     * @mbg.generated
     */
    int insert(InventoryIn record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_in
     *
     * @mbg.generated
     */
    int insertSelective(InventoryIn record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_in
     *
     * @mbg.generated
     */
    List<InventoryIn> selectByExample(InventoryInExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_in
     *
     * @mbg.generated
     */
    InventoryIn selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_in
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") InventoryIn record, @Param("example") InventoryInExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_in
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") InventoryIn record, @Param("example") InventoryInExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_in
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(InventoryIn record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_in
     *
     * @mbg.generated
     */

}