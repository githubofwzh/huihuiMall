package com.kshl.huihuimall.base.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.KsAccount;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

/**
 * Created by xufengfeng on 2017/5/18.
 */
public interface KsAccountMMapper {

    @Select("select * from ks_account where id = #{id}")
    KsAccount getAccountById(int id);


    @Insert("INSERT INTO `ks_account` ( `login_account`, `login_password`, `merchant_code`)" +
            "VALUES (#{loginAccount}, #{loginPassword}, #{merchantCode})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    int insertTest(KsAccount account);

}
