package com.kshl.huihuimall.base.dal.mapper;

import com.kshl.huihuimall.base.dal.entity.CategoryOne;
import com.kshl.huihuimall.base.dal.entity.CategoryOneExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CategoryOneMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category_one
     *
     * @mbg.generated
     */
    long countByExample(CategoryOneExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category_one
     *
     * @mbg.generated
     */
    int deleteByExample(CategoryOneExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category_one
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category_one
     *
     * @mbg.generated
     */
    int insert(CategoryOne record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category_one
     *
     * @mbg.generated
     */
    int insertSelective(CategoryOne record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category_one
     *
     * @mbg.generated
     */
    List<CategoryOne> selectByExample(CategoryOneExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category_one
     *
     * @mbg.generated
     */
    CategoryOne selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category_one
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CategoryOne record, @Param("example") CategoryOneExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category_one
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CategoryOne record, @Param("example") CategoryOneExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category_one
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CategoryOne record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category_one
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CategoryOne record);
}