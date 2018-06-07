package com.kshl.huihuimall.console.service.account.impl;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.console.controller.account.request.CustomerRequest;
import com.kshl.huihuimall.console.dal.dao.ColCustomerDao;
import com.kshl.huihuimall.console.service.account.ColCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Service
public class ColCustomerServiceImpl implements ColCustomerService {

    @Autowired
    private ColCustomerDao customerDao;

    /**
     * 分页查询用户账户
     * @param customerRequest
     * @return
     */
    @Override
    public BasePageResponse queryAllCustomer(CustomerRequest customerRequest) {
        List<Map<String, Object>> result = customerDao.getAllCustomer(customerRequest.getPageSize(), customerRequest.getPageNum(),customerRequest.getPhoneNumber());
        int total = customerDao.getAllCustomerCount(customerRequest.getPhoneNumber());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (customerRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (customerRequest.getPageSize() * customerRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / customerRequest.getPageSize();
        pageResponse.setPages(total % customerRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

}
