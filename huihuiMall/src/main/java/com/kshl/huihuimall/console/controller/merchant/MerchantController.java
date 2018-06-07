package com.kshl.huihuimall.console.controller.merchant;

import com.alipay.api.internal.parser.json.ObjectJsonParser;
import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.base.utils.DateFormatUtil;
import com.kshl.huihuimall.console.controller.merchant.request.MerchantMgRequest;
import com.kshl.huihuimall.console.controller.merchant.request.MerchantRequest;
import com.kshl.huihuimall.console.service.account.AccountService;
import com.kshl.huihuimall.console.service.merchant.MerchantService;
import com.kshl.security.authentication.KSPasswordEncoder;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.kshl.huihuimall.console.CSErrorCode.*;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Controller
@EnableAutoConfiguration
@RequestMapping("/merchantController")
public class MerchantController {

    private static final Logger logger = LoggerFactory.getLogger(MerchantController.class);
    @Autowired
    AccountService accountService;
    @Autowired
    private KSPasswordEncoder passwordEncoder;
    @Autowired
    private MerchantService merchantService;
    /**
     * 分页查询商家审核管理
     * @param request
     * @return
     */
    @RequestMapping(value="/queryMerchantReview", method={RequestMethod.GET})
    @ResponseBody
    public BasePageResponse queryMerchantReview(MerchantRequest request){
        logger.debug("queryMerchantReview start");
        return merchantService.queryMerchantReview(request);
    }

    /**
     *商家审核
     */
    @RequestMapping(value = "/passMerchantReview", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse passMerchantReview(@Valid MerchantRequest request,
                                          BindingResult bindingResult) {
        logger.debug("passMerchantReview start");
        BaseResponse response;
        if (request.getId()==null) {
            logger.warn("[MerchantRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = merchantService.passMerchantReview(request);
            if(request.getAuditStatus().equals(1)){
                Merchant merchant=merchantService.queryMerchantCode(request.getId());
                if(merchant!=null){
                    KsRole ksRole1=merchantService.queryRoleIdByEntcode(merchant.getEntCode());
                    List<Integer> list =new ArrayList<>();
                   // list.add(14);
                    list.add(19);
                    list.add(25);
                    list.add(36);
                    list.add(38);
                    for(int j=0;j<list.size();j++){
                        KsRoleToResource ksRoleToResource=new KsRoleToResource();
                        ksRoleToResource.setResourceId(list.get(j));
                        ksRoleToResource.setRoleId(ksRole1.getId());
                        merchantService.insertKsRoleToResource(ksRoleToResource);
                    }
                }

            }

        }
        return response;
    }


    /**
     *商家信息详情
     *筛选参数 id
     */
    @RequestMapping(value = "/getMerchantReviewDetail", method = {RequestMethod.GET})
    @ResponseBody
    public BaseResponse getMerchantReviewDetail(MerchantRequest request) {
        logger.debug("getMerchantReviewDetail start");

        return merchantService.getMerchantReviewDetail(request);
    }

    /**
     *商家管理查询
     *@param request
     */
    @RequestMapping(value = "/queryMerchantMg", method = {RequestMethod.GET})
    @ResponseBody
    public BasePageResponse queryMerchantMg(MerchantMgRequest request) {
        logger.debug("queryMerchantMg start");
        return merchantService.queryMerchantMg(request);
    }


    /**
     *更新商家信息
     */
    @RequestMapping(value = "/updateMerchant", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateMerchant(Merchant request) {
        logger.debug("updateMerchant start");
        BaseResponse response;
        if (request.getId() == null) {
            logger.warn("[MerchantRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = merchantService.updateMerchant(request);
            response.setRetCode(Long.valueOf(0));
        }
        return response;
    }



    /**
     *第一步填写商家账号信息
     */
    @RequestMapping(value = "/MerchantAccount", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse MerchantAccount(KsAccount record) {
        logger.debug("MerchantAccount start");
        BaseResponse response;
        KsAccount accountExits = accountService.queryAccountByUserName(record.getLoginAccount());
        KsAccount account = new KsAccount();
        String code=DateFormatUtil.entCode();
        if(accountExits == null){
            String passwordMD5 = passwordEncoder.encode (record.getLoginPassword());
            account.setLoginPassword(passwordMD5);
            account.setLoginAccount(record.getLoginAccount());
            account.setCreateTime(new Date());
            account.setName(record.getName());
            account.setPhone(record.getPhone());
            account.setSex(record.getSex());
            account.setIsDeleted(0);
            account.setEmail(record.getEmail());
            account.setType(Constants.ACCOUNT_TYPE.BUSINESS_ACCOUNT);
            account.setEnable(Constants.ACCOUNT_STATUS.ACCOUNT_ENABLE);
            account.setMerchantCode(code);
            merchantService.insertKsAccount(account);
            KsAccount ks=merchantService.queryAccountIdByEntcode(code);
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setData(ks);
            return response;
        }else{
            response = ResponseBuilder.buildBaseResponse(LOGIN_FAILED_WRONG_USERNAME_EXITS);
            return response;
        }

    }

    //第二步填写商家信息添加
    @RequestMapping(value = "/addMerchant", method = {RequestMethod.POST})
    @ResponseBody
    @Transactional
    public BaseResponse addMerchant(Merchant merchant,HttpServletRequest request) {
        logger.debug("addMerchant start");
        BaseResponse response=new BaseResponse();
        Object data=request.getParameter("data");
        Object BusinessLicense = "";
        Object TaxRegistrationCertificate="";
        Object OrganizationCodeCertificate="";
        Object PositiveId="";
        Object CertificateOfBusinessPlace="";Object PositiveTheOtherSide="";
        Object CompanyPhoto="";  Object HygieneLicense="";Object UploadAPhotoOfABusinessPlace="";
        JSONArray jsonArray = JSONArray.fromObject(data);
        Object[] objs = jsonArray.toArray();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
            System.out.println(jsonObject);
            String a=jsonObject.getString("name");
            String b=jsonObject.getString("value");
            if(a.equals("BusinessLicense")){
                BusinessLicense=b;
            }
            if(a.equals("TaxRegistrationCertificate")){
                TaxRegistrationCertificate=b;
            }
            if(a.equals("OrganizationCodeCertificate")){
                OrganizationCodeCertificate=b;
            }
            if(a.equals("PositiveId")){
                PositiveId=b;
            }
            if(a.equals("CertificateOfBusinessPlace")){
                CertificateOfBusinessPlace=b;
            }
            if(a.equals("PositiveTheOtherSide")){
                PositiveTheOtherSide=b;
            }
            if(a.equals("CompanyPhoto")){
                CompanyPhoto=b;
            }
            if(a.equals("HygieneLicense")){
                HygieneLicense=b;
            }
            if(a.equals("UploadAPhotoOfABusinessPlace")){
                UploadAPhotoOfABusinessPlace=b;
            }
        }

        String merchantCode=request.getParameter("merchantCode");
        Integer id= Integer.valueOf(request.getParameter("id"));
        Merchant chant=new Merchant();
        chant.setAuditStatus(0);
        chant.setZipCode(merchant.getZipCode());
        chant.setRegistAmount(merchant.getRegistAmount());
        chant.setRegistAddress(merchant.getRegistAddress());
        chant.setName(merchant.getName());
        chant.setLinkmanName(merchant.getLinkmanName());
        chant.setLinkmanMobile(merchant.getLinkmanMobile());
        chant.setLinkmanIdcardfrontPhoto(merchant.getLinkmanIdcardfrontPhoto());
        chant.setLinkmanIdcardbasePhoto(String.valueOf(PositiveId));
        chant.setLegalPersonName(merchant.getLegalPersonName());
        chant.setLegalPersonIdcard(String.valueOf(PositiveTheOtherSide));
        chant.setLegalPersonContact(merchant.getLegalPersonContact());
        chant.setEntCode(merchantCode);
        chant.setEmail(merchant.getEmail());
        chant.setCompanyLogo(merchant.getCompanyLogo());
        chant.setBusinessLicensePhoto(merchant.getBusinessLicensePhoto());
        chant.setBusinessLicence(String.valueOf(BusinessLicense));
        chant.setEnableStatus(0);
        chant.setAccountOpeningLicense(merchant.getAccountOpeningLicense());
        chant.setAnnualSales(merchant.getAnnualSales());
        chant.setAuditTime(new Date());
        chant.setBankName(merchant.getBankName());
        chant.setBankNumber(merchant.getBankNumber());
        chant.setBusinessLicenseNumber(merchant.getBusinessLicenseNumber());
        chant.setCompanyDoorFacePhotos(String.valueOf(CompanyPhoto));
        chant.setCoverageArea(merchant.getCoverageArea());
        chant.setHygienicLicense(String.valueOf(HygieneLicense));
        chant.setInstitutionCodeNumber(merchant.getInstitutionCodeNumber());
        chant.setLogisticsType(merchant.getLogisticsType());
        chant.setMainProduct(merchant.getMainProduct());
        chant.setManagementPlacePhotos(String.valueOf(UploadAPhotoOfABusinessPlace));
        chant.setManagementPlaceThat(String.valueOf(CertificateOfBusinessPlace));
        chant.setNumberOfBranches(merchant.getNumberOfBranches());
        chant.setPhone(merchant.getPhone());
        chant.setProfit(merchant.getProfit());
        chant.setTaxRegistryNumber(merchant.getTaxRegistryNumber());
        merchantService.insert(chant);
            //通过entcode查询merchant的id
            Merchant  mercha= merchantService.queryMerchantIdByentCode(merchantCode);
            KsAccount ksAccount=new KsAccount();
            ksAccount.setId(id);
            ksAccount.setMerchantId(mercha.getId());
            ksAccount.setMerchantCode(merchantCode);//entcode
            //更新ksaccount表中的entcode
            merchantService.updateByPrimaryKeySelective(ksAccount);
            KsRole ksRole=new KsRole();
            ksRole.setType(2);
            ksRole.setName("第三方商家");
            ksRole.setEntcode(merchantCode);//entcode
            //想ksrole表中插入数据
            merchantService.insertKsRole(ksRole);
            //查询ksrole表中的id
            KsRole ksRole1=merchantService.queryRoleIdByEntcode(merchantCode);
            //查询ksaccount表中的id和name
            KsAccount ks=merchantService.queryAccountIdByEntcode(merchantCode);

            KsAccountToRole ksAccountToRole=new KsAccountToRole();
            ksAccountToRole.setAccountId(ks.getId());
            ksAccountToRole.setRoleId(ksRole1.getId());
            ksAccountToRole.setRoleName(ksRole1.getName());
            ksAccountToRole.setRemark("");
            //向ksaccounttorole表中插入数据
            merchantService.insertKsAccountToRole(ksAccountToRole);
            KsRoleToResource ksRoleToResource=new KsRoleToResource();
            //向ksroletoresource表中插入数据
            List<Integer> list =new ArrayList<>();
                list.add(1);
                list.add(12);
                list.add(16);
                for(int j=0;j<list.size();j++){
                    ksRoleToResource.setResourceId(list.get(j));
                    ksRoleToResource.setRoleId(ksRole1.getId());
                    merchantService.insertKsRoleToResource(ksRoleToResource);
                }
            response.setRetCode(Long.valueOf(0));
        return response;
    }

    /*
      商家资质审核
     */
    @RequestMapping(value = "/MerchantAudit", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse MerchantAudit(MerchantRequest request) {
        logger.debug("deleteMerchant start");
        BaseResponse response=new BaseResponse();
        if (request.getId() == null) {
            logger.warn("[MerchantRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            KsAccount ksAccount=merchantService.getAccountCode(request.getId());
            if(ksAccount!=null){
                Merchant  mercha= merchantService.queryMerchantIdByentCode(ksAccount.getMerchantCode());
                response.setData(mercha);
                response.setRetCode(Long.valueOf(0));
            }else {
                response=ResponseBuilder.buildBaseResponse(INVALID_PARAM);;
            }
        }
        return response;
    }



    /*
        删除商家
         */
    @RequestMapping(value = "/deleteMerchant", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse deleteMerchant(MerchantRequest request) {
        logger.debug("deleteMerchant start");
        BaseResponse response=new BaseResponse();
        if (request.getId() == null) {
            logger.warn("[MerchantRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            merchantService.deleteByPrimaryKey(request.getId());
            response.setRetCode(Long.valueOf(0));
        }
        return response;
    }


    /**
     *关闭商家
     */
    @RequestMapping(value = "/closeMerchant", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse closeMerchant(@Valid MerchantRequest request,
                                             BindingResult bindingResult) {
        logger.debug("closeMerchant start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[MerchantRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = merchantService.closeMerchant(request);
        }
        return response;
    }

    /**
     *商家详情
     */
    @RequestMapping(value = "/MerchantDetail", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse MerchantDetail(@Valid MerchantRequest request,
                                      BindingResult bindingResult) {
        logger.debug("closeMerchant start");
        BaseResponse response=new BaseResponse();
        if (request.getId()==null) {
            logger.warn("[MerchantRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            Merchant  merchant= merchantService.selectByPrimaryKey(request.getId());
            response.setData(merchant);
        }
        return response;
    }
    /**
     * 分页查询商品上架
     * @param request
     * @return
     */
    @RequestMapping(value="/queryShelvesReviewMg", method={RequestMethod.GET})
    @ResponseBody
    public BasePageResponse queryShelvesReviewMg(MerchantRequest request){
        logger.debug("queryShelvesReviewMg start");
        return merchantService.queryShelvesReviewMg(request);
    }
    /**
     *商品通过
     */
    @RequestMapping(value = "/productpassMerchantReview", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse productpassMerchantReview(Integer id,
                                           BindingResult bindingResult) {
        logger.debug("productpassMerchantReview start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[id] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = merchantService.productpassMerchantReview(id);
        }
        return response;
    }

    /**
     *商品打回
     */
    @RequestMapping(value = "/productunpassMerchantReview", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse productunpassMerchantReview(Integer id,
                                                  BindingResult bindingResult) {
        logger.debug("productunpassMerchantReview start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[id] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = merchantService.productunpassMerchantReview(id);
        }
        return response;
    }


    /**
     *商品详情
     *筛选参数 id
     */
    @RequestMapping(value = "/getProductReviewDetail", method = {RequestMethod.GET})
    @ResponseBody
    public BaseResponse getProductReviewDetail(MerchantRequest request) {
        logger.debug("getProductReviewDetail start");
        return merchantService.getProductReviewDetail(request);
    }

}