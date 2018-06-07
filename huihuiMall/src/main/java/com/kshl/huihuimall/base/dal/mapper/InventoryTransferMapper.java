package com.kshl.huihuimall.base.dal.mapper;

import com.kshl.huihuimall.base.dal.entity.InventoryTransfer;
import com.kshl.huihuimall.base.dal.entity.InventoryTransferExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface InventoryTransferMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_transfer
     *
     * @mbg.generated
     */
    long countByExample(InventoryTransferExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_transfer
     *
     * @mbg.generated
     */
    int deleteByExample(InventoryTransferExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_transfer
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_transfer
     *
     * @mbg.generated
     */
    int insert(InventoryTransfer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_transfer
     *
     * @mbg.generated
     */
    int insertSelective(InventoryTransfer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_transfer
     *
     * @mbg.generated
     */
    List<InventoryTransfer> selectByExample(InventoryTransferExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_transfer
     *
     * @mbg.generated
     */
    InventoryTransfer selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_transfer
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") InventoryTransfer record, @Param("example") InventoryTransferExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_transfer
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") InventoryTransfer record, @Param("example") InventoryTransferExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_transfer
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(InventoryTransfer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inventory_transfer
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(InventoryTransfer record);
}