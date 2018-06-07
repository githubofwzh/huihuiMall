package com.kshl.huihuimall.base.dal.mapper;

import com.kshl.huihuimall.base.dal.entity.Store;
import com.kshl.huihuimall.base.dal.entity.StoreExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StoreMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table store
     *
     * @mbg.generated
     */
    long countByExample(StoreExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table store
     *
     * @mbg.generated
     */
    int deleteByExample(StoreExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table store
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table store
     *
     * @mbg.generated
     */
    int insert(Store record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table store
     *
     * @mbg.generated
     */
    int insertSelective(Store record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table store
     *
     * @mbg.generated
     */
    List<Store> selectByExample(StoreExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table store
     *
     * @mbg.generated
     */
    Store selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table store
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") Store record, @Param("example") StoreExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table store
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") Store record, @Param("example") StoreExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table store
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(Store record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table store
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Store record);
}