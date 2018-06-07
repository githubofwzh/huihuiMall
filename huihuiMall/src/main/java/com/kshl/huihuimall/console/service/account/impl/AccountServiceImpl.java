package com.kshl.huihuimall.console.service.account.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.dao.Account.AccountDao;
import com.kshl.huihuimall.base.dal.entity.KsAccount;
import com.kshl.huihuimall.base.dal.entity.extendsEntity.KsAccountAndRole;
import com.kshl.huihuimall.console.service.account.AccountService;
import com.kshl.huihuimall.console.service.account.enums.AccountTypeEnum;
import com.kshl.huihuimall.console.service.account.model.AccountServiceModel;
import com.kshl.security.authentication.KSPasswordEncoder;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.kshl.huihuimall.console.CSErrorCode.*;

/**
 * Created by xufengfeng on 2017/5/4.
 */
@Service
public class AccountServiceImpl implements AccountService {

    /**
     * 企业代码长度 5，大写字母+数字
     */
    private static final Integer entCodeLength = 5;

    /**
     * 生成企业代码，最大重复次数
     */
    private static int maxTryCount = 999;

    private static final Logger logger = LoggerFactory.getLogger(AccountServiceImpl.class);

    @Autowired
    private AccountDao accountDao;

    @Autowired
    private KSPasswordEncoder passwordEncoder;

    @Override
    public AccountServiceModel login(String userName, String password)
            throws IllegalArgumentException {



        logger.info("[login] login userName = {}, password = {}", userName, password);
        if (KSStringUtils.isEmpty(userName) ||
                KSStringUtils.isEmpty(password)){
            throw new IllegalArgumentException(" userName or password is empty");
        }

        KsAccount account = accountDao.queryAccountByUserName(userName);
        logger.info("[login] account  {}", account.toString());

        AccountServiceModel accountModel = null;
        if (account != null){

            if (passwordEncoder.matches(password, account.getLoginPassword())) {
                accountModel = new AccountServiceModel();
                BeanUtils.copyProperties(account, accountModel);

                accountModel.setType(AccountTypeEnum.getEnum(account.getType()));
                accountModel.setUserName(account.getLoginAccount());
            }
        }

        return accountModel;
    }

    @Override
    public List<KsAccountAndRole> getAllAccounts(Integer pageNum, Integer pageSize, String entCode, String account, String name, String phone) {
        return accountDao.getAllAccounts(pageNum, pageSize, entCode, name, account, phone);
    }

    @Override
    public int addAcount(KsAccount account) {
        String passwordMD5 = passwordEncoder.encode (account.getLoginPassword());
        account.setLoginPassword(passwordMD5);
        account.setType(Constants.ACCOUNT_TYPE.GENERAL_ACCOUNT);
        return accountDao.addAcount(account);
    }

    public String addAcount(String username,String password) {
        String entCode = generateMerchantCode();
        KsAccount accountExits = accountDao.queryAccountByUserName(username);
        if(accountExits == null){
            String passwordMD5 = passwordEncoder.encode (password);;
            KsAccount account = new KsAccount();
            account.setLoginPassword(passwordMD5);
            account.setLoginAccount(username);
            account.setType(Constants.ACCOUNT_TYPE.BUSINESS_ACCOUNT);
            account.setEnable(Constants.ACCOUNT_STATUS.ACCOUNT_ENABLE);
            account.setMerchantCode(entCode);
            accountDao.addAcount(account);
            return entCode ;
        }
        return null;
    }

    @Override
    public int updateAccount(KsAccount account) {
        if(!KSStringUtils.isEmpty(account.getLoginPassword())) {
            String passwordMD5 = passwordEncoder.encode (account.getLoginPassword());
            account.setLoginPassword(passwordMD5);
        }
        return accountDao.updateAcount(account);
    }

    @Override
    public KsAccountAndRole getById(int id) {
        return accountDao.queryAccountByID(id);
    }

    @Override
    public List<KsAccount> getByAccount(String account, String entCode) {
        return accountDao.getByAccount(account,entCode);
    }

    @Override
    public boolean checkAccount(String account) {
        return accountDao.checkAccount(account);
    }

    @Override
    public BaseResponse updateAccountPassword(String loginAccount, String entCode, String oldPassword, String newPassword) {
        KsAccount account = accountDao.getByAccount(loginAccount,entCode).get(0);
        boolean flag = passwordEncoder.matches (oldPassword,account.getLoginPassword());
        BaseResponse response = null;
        if (!flag){
            response = ResponseBuilder.buildBaseResponse(LOGIN_FAILED_WRONG_PASSWORD);
        }else {
            account.setLoginPassword(passwordEncoder.encode (newPassword));
            int count = accountDao.updateAcount(account);
            response = ResponseBuilder.buildBaseResponse(count > 0 ?SUCCESS:INVALID_PARAM);
        }
        return response;
    }

    /**
     * 产生企业代码，代码长度为5 大写字母+数字
     * @return
     */
    private String generateMerchantCode() {
        for (int tryCount = 0; tryCount < maxTryCount; tryCount ++) {
            String entCode = RandomStringUtils.randomAlphanumeric(entCodeLength).toUpperCase();
            logger.info("generateMerchantCode entCode = {}, entCode, tryCount = {}, maxTryCount = {}", entCode, tryCount, maxTryCount);
            return entCode;
        }
        return null;
    }
}
