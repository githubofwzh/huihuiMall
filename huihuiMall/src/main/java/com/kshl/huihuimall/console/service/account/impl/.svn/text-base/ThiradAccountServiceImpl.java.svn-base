package com.kshl.huihuimall.console.service.account.impl;
import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.dao.Account.ThiradAccountTypeDao;
import com.kshl.huihuimall.base.dal.entity.KsAccount;
import com.kshl.huihuimall.console.controller.account.request.ThiradAccountTypeRequest;
import com.kshl.huihuimall.console.service.account.ThiradAccountTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Service
public class ThiradAccountServiceImpl implements ThiradAccountTypeService{


    private static final Logger logger = LoggerFactory.getLogger(ThiradAccountTypeService.class);
    @Autowired
    private ThiradAccountTypeDao thiradAccountTypeDao;

    /**
     * 第三方账户分页查询
     * @param request
     * @return
     */
    @Override
    public BasePageResponse queryThiradAccount(ThiradAccountTypeRequest request) {
        List<Map<String, Object>> result = thiradAccountTypeDao.queryThiradAccount(request.getPageSize(), request.getPageNum(),request.getEnable(),request.getMerchantname(),request.getIsDeleted(),request.getType());
        int total = thiradAccountTypeDao.queryThiradAccountCount(request.getEnable(),request.getMerchantname(),request.getIsDeleted(),request.getType());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (request.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (request.getPageSize() * request.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / request.getPageSize();
        pageResponse.setPages(total % request.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    /**
     * 第三方账户的启用禁用
     * @param request
     * @return
     */
    @Override
    public BaseResponse updateThiradAccount(ThiradAccountTypeRequest request) {
        BaseResponse response;
        KsAccount ksAccount = new KsAccount();
        BeanUtils.copyProperties(request, ksAccount);
        int update = thiradAccountTypeDao.updateThiradAccount(ksAccount);
        if (update > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

   /* @Override
    public List<ThiradAccountType> getThiradAccountType(Integer pageNum, Integer pageSize, Integer thirad_account, String thirad_name, Integer thirad_state) {
        return thiradAccountTypeDao.getThiradAccountType(pageNum,pageSize,thirad_account,thirad_name,thirad_state);
    }

    @Override
    public int addThiradAccountType(ThiradAccountType thiradAccountType) {
        return thiradAccountTypeDao.addThiradAccountType(thiradAccountType);
    }

    @Override
    public int deleteThiradAccount(Integer id) {
        return thiradAccountTypeDao.deleteThiradAccount(id);
    }

    @Override
    public int updateThiradAccount(ThiradAccountType thiradAccountType) {
        return thiradAccountTypeDao.updateThiradAccount(thiradAccountType);
    }*/
}
