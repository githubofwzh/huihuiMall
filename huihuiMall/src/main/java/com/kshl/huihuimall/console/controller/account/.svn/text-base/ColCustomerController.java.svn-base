package com.kshl.huihuimall.console.controller.account;

import com.kshl.base.response.BasePageResponse;
import com.kshl.huihuimall.console.controller.account.request.CustomerRequest;
import com.kshl.huihuimall.console.service.account.ColCustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用户账户Controller
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/customer")
public class ColCustomerController {

    private static final Logger logger = LoggerFactory.getLogger(ColCustomerController.class);

    @Autowired
    private ColCustomerService customerService;

    /**
     * 分页查询用户账户
     * @param customerRequest
     * @return
     */
    @RequestMapping(value = "/queryAllCustomer", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse queryAllCustomer(CustomerRequest customerRequest) {
        logger.debug("queryAllCustomer start");
        return customerService.queryAllCustomer(customerRequest);
    }

}
