package com.kshl.huihuimall.portal.service.frontstore.impl;

import com.kshl.base.common.utils.KSHLUtils;
import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.base.utils.DateFormatUtil;
import com.kshl.huihuimall.console.base.pojo.StoreMessagePojo;
import com.kshl.huihuimall.console.controller.account.request.ShopKeeperRequest;
import com.kshl.huihuimall.console.controller.device.request.DeviceRequest;
import com.kshl.huihuimall.console.controller.order.request.OrderRequest;
import com.kshl.huihuimall.console.dal.dao.DeviceDao;
import com.kshl.huihuimall.console.dal.dao.ShopKeeperDao;
import com.kshl.huihuimall.console.service.account.ShopKeeperService;
import com.kshl.huihuimall.portal.controller.request.StoreApplyRequest;
import com.kshl.huihuimall.portal.dal.dao.FrontStoreDao;
import com.kshl.huihuimall.portal.service.frontstore.FrontStoreService;
import com.kshl.security.authentication.KSPasswordEncoder;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Service
public class FrontStoreServiceImpl implements FrontStoreService {


    @Autowired
    private FrontStoreDao frontStoreDao;
    @Autowired
    private ShopKeeperDao shopKeeperDao;
    @Autowired
    private KSPasswordEncoder passwordEncoder;
    @Autowired
    private DeviceDao deviceDao;

    @Autowired
    private ShopKeeperService shopKeeperService;

    /**
     * 根据门店id查询门店详情
     * @param id
     * @return
     */
    @Override
    public BaseResponse getFrontStoreDetail(Integer id) {
        BaseResponse response;
        Device device = frontStoreDao.getDeviceByStoreId(id);
        Store store = frontStoreDao.getStoreById(id);
        Shopkeeper shopkeeper =frontStoreDao.getShopKeeperById(id);
        if (store != null&&shopkeeper!=null) {
            StoreMessagePojo storeMessagePojo = new StoreMessagePojo();
            storeMessagePojo.setDevice(device);
            storeMessagePojo.setStore(store);
            storeMessagePojo.setShopkeeper(shopkeeper);
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setData(storeMessagePojo);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }


    /**
     * 绑定终端设备接口
     */
    @Override
    @Transactional
    public BaseResponse updateDevice(DeviceRequest deviceRequest) {
        BaseResponse response;
        //根据deviceCode查询出社备状态
        Device dev = deviceDao.getDeviceByCode(deviceRequest.getDeviceCode());
        if (dev.getBindingStatus()==1||dev.getStoreId()!=null){
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            response.setData(200001);
        }else{
            Device nDevice=  frontStoreDao.getDeviceByStoreId(deviceRequest.getStoreId());
            if (nDevice!=null){
                //根据门店Id清除之前社备
                int delete = frontStoreDao.updateDeviceByStoreId(deviceRequest.getStoreId());
            }

            Device device = new Device();
            BeanUtils.copyProperties(deviceRequest, device);
            device.setBindingStatus(1);
            device.setBingTime(new Date());
            int update = frontStoreDao.updateDevice(device);
            if (update > 0) {
                Device lDevice=  frontStoreDao.getDeviceByStoreId(deviceRequest.getStoreId());
                Store store = new Store();
                store.setDeviceId(lDevice.getId());
                store.setId(deviceRequest.getStoreId());
                //更新店主表
                int up =  frontStoreDao.updateStore(store);
                response = ResponseBuilder.buildBaseResponse(SUCCESS);
            } else {
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            }
        }
        return response;
    }

    @Override
    public Boolean isDevice(String deviceCode) {
        Device dev = deviceDao.getDeviceByCode(deviceCode);
        return dev!=null?true:false;
    }

    /**
     * 获取门店销售记录接口
     * @param orderRequest
     * @return
     */
    @Override
    public BasePageResponse queryAllRecord(OrderRequest orderRequest) {
        List<Map<String, Object>> result = frontStoreDao.queryAllRecord(orderRequest.getPageSize(), orderRequest.getPageNum(), orderRequest.getOrderstatus(),orderRequest.getStartTime(),orderRequest.getEndTime(),orderRequest.getStoreId());
        int total = frontStoreDao.queryAllRecordCount(orderRequest.getOrderstatus(),orderRequest.getStartTime(),orderRequest.getEndTime(),orderRequest.getStoreId());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (orderRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (orderRequest.getPageSize() * orderRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / orderRequest.getPageSize();
        pageResponse.setPages(total % orderRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    /**
     * 开店申请接口
     * @param storeApplyRequest
     * @return
     */
    @Override
    @Transactional
    public BaseResponse addStoreApply(StoreApplyRequest storeApplyRequest, HttpServletRequest request) {
        BaseResponse response;
        //门店信息
        String data=request.getParameter("data");
        Store store = new Store();
        BeanUtils.copyProperties(storeApplyRequest, store);
        Object Enterprise_BusinessLicense="";
        Object Enterprise_TaxRegistrationCertificate="";
        Object Enterprise_OrganizationCodeCertificate="";
        Object Enterprise_RealEstateCertificate="";
        Object Enterprise_FacadeOfIDCard="";
        Object Enterprise_IdentityCard="";
        Object Enterprise_UploadPaymentVoucher="";
        Object Enterprise_PutPhotoOfPosition="";
        Object Enterprise_AccountOpeningPermit="";
        Object Enterprise_PhotoOfThePlaceOfBusiness="";
        Object Application="";
        store.setEnterpriseName(storeApplyRequest.getEnterpriseName());
        store.setCompanyTel(storeApplyRequest.getCompanyTel());
        store.setStoreName(storeApplyRequest.getStoreName());
        store.setStoreArea(storeApplyRequest.getStoreArea());
        store.setPrincipal(storeApplyRequest.getPrincipal());
        JSONArray jsonArray = JSONArray.fromObject(data);
        Object[] objs = jsonArray.toArray();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
            Object key=jsonObject.get("name");
            Object value=jsonObject.get("value");
            if(key.equals("BusinessLicense")){
                Enterprise_BusinessLicense=value;
            }
            if(key.equals("TaxRegistrationCertificate")){
                Enterprise_TaxRegistrationCertificate=value;
            }
            if(key.equals("OrganizationCodeCertificate")){
                Enterprise_OrganizationCodeCertificate=value;
            }
            if(key.equals("RealEstateCertificate")){
                Enterprise_RealEstateCertificate=value;
            }
            if(key.equals("FacadeOfIDCard")){
                Enterprise_FacadeOfIDCard=value;
            }
            if(key.equals("IdentityCard")){
                Enterprise_IdentityCard=value;
            }
            if(key.equals("UploadPaymentVoucher")){
                Enterprise_UploadPaymentVoucher=value;
            }
            if(key.equals("PutPhotoOfPosition")){
                Enterprise_PutPhotoOfPosition=value;
            }
            if(key.equals("AccountOpeningPermit")){
                Enterprise_AccountOpeningPermit=value;
            }
            if(key.equals("PhotoOfThePlaceOfBusiness")){
                Enterprise_PhotoOfThePlaceOfBusiness=value;
            }
            if(key.equals("Application")){
                Application=value;
            }
        }
        store.setMerchantType(storeApplyRequest.getMerchantType());
        store.setEnterpriseThree(String.valueOf(Enterprise_FacadeOfIDCard));//身份证反面
        store.setHouseInformation(String.valueOf(Enterprise_RealEstateCertificate));
        store.setIdCard(String.valueOf(Enterprise_IdentityCard));
        store.setWaterFee(String.valueOf(Enterprise_UploadPaymentVoucher));
        store.setEquipmentPhoto(String.valueOf(Enterprise_PhotoOfThePlaceOfBusiness));
        store.setTaxRegistration(String.valueOf(Enterprise_TaxRegistrationCertificate));
        store.setBusinessLicense(String.valueOf(Enterprise_BusinessLicense));
        store.setOrganization(String.valueOf(Enterprise_OrganizationCodeCertificate));
        store.setAccountPermit(String.valueOf(Enterprise_AccountOpeningPermit));
        store.setPlacePhoto(String.valueOf(Enterprise_PutPhotoOfPosition));
        store.setApplicationForm(String.valueOf(Application));
        store.setAddressShengshi(storeApplyRequest.getAddressShengshi());
        store.setAddressShi(storeApplyRequest.getAddressShi());
        store.setAddressQu(storeApplyRequest.getAddressQu());
        store.setAddressStreet(storeApplyRequest.getAddressStreet());
        store.setAddressDoor(storeApplyRequest.getAddressDoor());
        store.setStoreName(storeApplyRequest.getStoreName());
        store.setStoreAddress(storeApplyRequest.getStoreAddress());
        store.setBusinessYear(storeApplyRequest.getBusinessYear());
        store.setIncome(storeApplyRequest.getIncome());
        store.setPrice1(storeApplyRequest.getPrice1());
        store.setProduct1(storeApplyRequest.getProduct1());
        store.setPrice2(storeApplyRequest.getPrice2());
        store.setProduct2(storeApplyRequest.getProduct2());
        store.setDailyFlow(storeApplyRequest.getDailyFlow());
        store.setApplyTime(new Date());
        store.setApplicationForm(storeApplyRequest.getApplicationForm());
        store.setRemark(storeApplyRequest.getRemark());
        store.setStorehouseId(storeApplyRequest.getStorehouseId());
        store.setStatus(0);
        store.setDeviceId(storeApplyRequest.getDeviceId());
        store.setAuditStatus(0);
        store.setStoreArea(storeApplyRequest.getStoreArea());
        //System.out.println(store.getId()+"----------"+storeApplyRequest.getId());
        if  (KSHLUtils.isEmpty(store.getId())) {
            frontStoreDao.addStoreApply(store);
        }else{
            frontStoreDao.updateStore(store);
        }
        //店主信息
        Shopkeeper shopkeeper = new Shopkeeper();
        shopkeeper.setStoreId(store.getId());
        shopkeeper.setAccount(storeApplyRequest.getAccount());
        shopkeeper.setName(storeApplyRequest.getShopKeeperName());
        shopkeeper.setPhoneNumber(storeApplyRequest.getShopKeeperPhone());
        //String passwordMD5 = passwordEncoder.encode(storeApplyRequest.getPassword());
        //shopkeeper.setPassword(passwordMD5);
        shopkeeper.setGender(storeApplyRequest.getGender());
        shopkeeper.setIdcard(storeApplyRequest.getIdcard());
        shopkeeper.setIsmarrige(storeApplyRequest.getIsmarrige());
        shopkeeper.setBankNumber(storeApplyRequest.getBankNumber());
        if (storeApplyRequest.getBirthday()!=null){
            //转换成date
          Date date= DateFormatUtil.getDate(storeApplyRequest.getBirthday());
          //转换成datetime
            Timestamp timestamp = new Timestamp(date.getTime());
            shopkeeper.setBirthday(timestamp);
        }
        shopkeeper.setEducation(storeApplyRequest.getEducation());
        shopkeeper.setOpenId(storeApplyRequest.getOpenId());
        Shopkeeper updateShopkeeper = shopKeeperService.getOpenId(storeApplyRequest.getOpenId());
        int num;
        if (updateShopkeeper != null) {
            num = frontStoreDao.updateShopKeeper(shopkeeper);
        }else{
            num = frontStoreDao.addShopKeeper(shopkeeper);
        }
        if(num>0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    /**
     * 通过账户得门店id
     * @param shopKeeperRequest
     * @return
     */
    @Override
    public BaseResponse getStoreId(ShopKeeperRequest shopKeeperRequest) {
        BaseResponse response;
        Shopkeeper shopkeeper = frontStoreDao.getStoreId(shopKeeperRequest.getAccount());
        if (shopkeeper != null) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setData(shopkeeper);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }
}