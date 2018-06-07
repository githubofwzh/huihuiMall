package com.kshl.huihuimall.console.controller;

import com.kshl.huihuimall.base.dal.entity.KsAccount;
import com.kshl.huihuimall.base.dal.entity.KsAccountToRole;
import com.kshl.huihuimall.base.dal.entity.KsRole;
import com.kshl.huihuimall.console.service.role.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by chen on 2018-02-26.
 */

@Controller
@EnableAutoConfiguration
@RequestMapping("/link")
public class linkController {
    @Autowired
    private RoleService roleService;

    /*1、账户管理跳转*/
    //后台账户管理
    @RequestMapping("/linkToAccountMgmt")
    @ResponseBody
    public ModelAndView linkToAccountMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/account/accountMgmt");
        return result;
    }

    //第三方账户管理
    @RequestMapping("/linkToBusinessAccountMgmt")
    @ResponseBody
    public ModelAndView linkToBusinessAccountMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/account/businessAccountMgmt");
        return result;
    }

    //用户账户管理
    @RequestMapping("/linkToUserMgmt")
    @ResponseBody
    public ModelAndView linkToUserMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/account/userMgmt");
        return result;
    }

    //店主账户管理
    @RequestMapping("/linkToStoreAccountMgmt")
    @ResponseBody
    public ModelAndView linkToStoreAccountMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/account/storeAccountMgmt");
        return result;
    }

    //角色管理
    @RequestMapping("/linkToRoleMgmt")
    @ResponseBody
    public ModelAndView linkToRoleMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/account/roleMgmt");
        return result;
    }

    /*2、门店管理跳转*/
    //门店信息管理
    @RequestMapping("/linkToStoreMgmt")
    @ResponseBody
    public ModelAndView linkToStoreMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/store/storeMgmt");
        return result;
    }

    //门店销售管理
    @RequestMapping("/linkToStoreSaleMgmt")
    @ResponseBody
    public ModelAndView linkToStoreSaleMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/store/storeSaleMgmt");
        return result;
    }

    /*3、商家管理跳转*/
    //商家信息管理
    @RequestMapping("/linkToBusinessMgmt")
    @ResponseBody
    public ModelAndView linkToBusinessMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/business/businessMgmt");
        return result;
    }

    //商家资质审核
    @RequestMapping("/linkToQualificationAudit")
    @ResponseBody
    public ModelAndView linkToQualificationAudit(){
        ModelAndView result = new ModelAndView("/backstagePages/business/qualificationAudit");
        return result;
    }

    /*门店、商家(2、3)相关审核跳转*/
    //商家商品上架审核
    @RequestMapping("/linkToGoodsOnshelfAuditMgmt")
    @ResponseBody
    public ModelAndView linkToGoodsOnshelfAuditMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/audit/goodsOnshelfAuditMgmt");
        return result;
    }

    //门店审核管理
    @RequestMapping("/linkToStoreAuditMgmt")
    @ResponseBody
    public ModelAndView linkToStoreAuditMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/audit/storeAuditMgmt");
        return result;
    }

    //商家审核管理
    @RequestMapping("/linkToBusinessAuditMgmt")
    @ResponseBody
    public ModelAndView linkToBusinessAuditMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/audit/businessAuditMgmt");
        return result;
    }

    /*设备管理跳转*/
    //4、设备管理
    @RequestMapping("/linkToEquipmentMgmt")
    @ResponseBody
    public ModelAndView linkToEquipmentMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/equipment/equipmentMgmt");
        return result;
    }

    /*5、商品管理跳转*/
    //商品分类管理--一级分类管理
    @RequestMapping("/linkToFirstClassificationMgmt")
    @ResponseBody
    public ModelAndView linkToFirstClassificationMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/goods/firstClassificationMgmt");
        return result;
    }

    //商品分类管理--二级分类管理
    @RequestMapping("/linkToSecondClassificationMgmt")
    @ResponseBody
    public ModelAndView linkToSecondClassificationMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/goods/secondClassificationMgmt");
        return result;
    }

    //商品品牌管理
    @RequestMapping("/linkToBrandMgmt")
    @ResponseBody
    public ModelAndView linkToBrandMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/goods/brandMgmt");
        return result;
    }

    //自营商品信息管理
    @RequestMapping("/linkToSelfGoodsMgmt")
    @ResponseBody
    public ModelAndView linkToSelfGoodsMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/goods/selfGoodsMgmt");
        return result;
    }

    //商家商品信息管理
    @RequestMapping("/linkToBusinessGoodsMgmt")
    @ResponseBody
    public ModelAndView linkToBusinessGoodsMgmt(HttpServletRequest request){
        HttpSession session = request.getSession();//从session取用户
        KsAccount account = (KsAccount)session.getAttribute("KSAccount");
        Integer accountType = account.getType();

        ModelAndView result = new ModelAndView("/backstagePages/goods/businessGoodsMgmt");
        result.getModel().put("accountType",accountType);
        return result;
    }

    /*6、仓库管理跳转*/
    //仓库信息管理
    @RequestMapping("/linkToStorageroomMgmt")
    @ResponseBody
    public ModelAndView linkToStorageroomMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/storageroom/storageRoomMgmt");
        return result;
    }

    /*7、库存管理跳转*/
    //库存信息管理
    @RequestMapping("/linkToInventoryMgmt")
    @ResponseBody
    public ModelAndView linkToInventoryMgmt(HttpServletRequest request){

        HttpSession session = request.getSession();//从session取用户
        KsAccount account = (KsAccount)session.getAttribute("KSAccount");

        Integer accountType = account.getType();
        Integer accountId = account.getId();
        KsAccountToRole ksAccountToRole= roleService.getRoleId(accountId);
        KsRole ksRole=roleService.getRoleName(ksAccountToRole.getRoleId());
        ModelAndView result = new ModelAndView("/backstagePages/inventory/inventoryMgmt");
        result.getModel().put("accountType",accountType);
        result.getModel().put("roleName",ksRole.getName());
        return result;

    }

    //入库管理
    @RequestMapping("/linkToStorageMgmt")
    @ResponseBody
    public ModelAndView linkToStorageMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/inventory/storageMgmt");
        return result;
    }

    //入库记录
    @RequestMapping("/linkToStorageRecordMgmt")
    @ResponseBody
    public ModelAndView linkToStorageRecordMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/inventory/storageRecordMgmt");
        return result;
    }

    //订单出库管理
    @RequestMapping("/linkToOutgoingMgmt")
    @ResponseBody
    public ModelAndView linkToOutgoingMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/inventory/outgoingMgmt");
        return result;
    }

    //订单出库记录
    @RequestMapping("/linkToOutgoingRecordMgmt")
    @ResponseBody
    public ModelAndView linkToOutgoingRecordMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/inventory/outgoingRecordMgmt");
        return result;
    }

    //换货出库管理
    @RequestMapping("/linkToExchangeOutgoingMgmt")
    @ResponseBody
    public ModelAndView linkToExchangeOutgoingMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/inventory/exchangeOutgoingMgmt");
        return result;
    }

    //换货出库记录
    @RequestMapping("/linkToExchangeOutgoingRecordMgmt")
    @ResponseBody
    public ModelAndView linkToExchangeOutgoingRecordMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/inventory/exchangeOutgoingRecordMgmt");
        return result;
    }

    //调库管理
    @RequestMapping("/linkToExchangeStorageMgmt")
    @ResponseBody
    public ModelAndView linkToExchangeStorageMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/inventory/exchangeStorageMgmt");
        return result;
    }

    //调库审批
    @RequestMapping("/linkToExchangeStorageApproveMgmt")
    @ResponseBody
    public ModelAndView linkToExchangeStorageApproveMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/inventory/exchangeStorageApproveMgmt");
        return result;
    }

    //调库记录
    @RequestMapping("/linkToExchangeStorageRecordMgmt")
    @ResponseBody
    public ModelAndView linkToExchangeStorageRecordMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/inventory/exchangeStorageRecordMgmt");
        return result;
    }

    /*8、订单管理跳转*/
    //自营订单信息管理
    @RequestMapping("/linkToSelfOrderMgmt")
    @ResponseBody
    public ModelAndView linkToSelfOrderMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/order/selfOrderMgmt");
        return result;
    }

    //商家订单信息管理
    @RequestMapping("/linkToBusinessOrderMgmt")
    @ResponseBody
    public ModelAndView linkToBusinessOrderMgmt(HttpServletRequest request){

        HttpSession session = request.getSession();//从session取用户
        KsAccount account = (KsAccount)session.getAttribute("KSAccount");

        String entCode = account.getMerchantCode();
        Integer accountType = account.getType();

        ModelAndView result = new ModelAndView("/backstagePages/order/businessOrderMgmt");
        result.getModel().put("entCode",entCode);
        result.getModel().put("accountType",accountType);
        return result;

    }

    //生活缴费订单信息管理
    @RequestMapping("/linkToThirdPartyPaymentRecord")
    @ResponseBody
    public ModelAndView linkToThirdPartyPaymentRecord(){
        ModelAndView result = new ModelAndView("/backstagePages/order/ThirdPartyPaymentRecord");
        return result;
    }

    /*9、退换货管理跳转*/
    //自营退换货管理
    @RequestMapping("/linkToSelfExchangeMgmt")
    @ResponseBody
    public ModelAndView linkToSelfExchangeMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/exchange/selfExchangeMgmt");
        return result;
    }

    //退换货记录管理
    @RequestMapping("/linkToExchangeRecordMgmt")
    @ResponseBody
    public ModelAndView linkToExchangeRecordMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/exchange/exchangeRecordMgmt");
        return result;
    }

    /*10、财务管理跳转*/
    //标准配置
    @RequestMapping("/linkToStandardConfigMgmt")
    @ResponseBody
    public ModelAndView linkToStandardConfigMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/finance/standardConfigMgmt");
        return result;
    }

    //交易对账记录
    @RequestMapping("/linkToTransactionRecordMgmt")
    @ResponseBody
    public ModelAndView linkToTransactionRecordMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/finance/transactionRecordMgmt");
        return result;
    }

    //生活缴费交易对账记录
    @RequestMapping("/linkToLivingTransactionRecordMgmt")
    @ResponseBody
    public ModelAndView linkToLivingTransactionRecordMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/finance/livingTransactionRecordMgmt");
        return result;
    }

    //分润报表
    @RequestMapping("/linkToProfitReportMgmt")
    @ResponseBody
    public ModelAndView linkToProfitReportMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/finance/profitReportMgmt");
        return result;
    }

    //本月销售日报表
    @RequestMapping("/linkToCurrentMonthSalesDailyReportMgmt")
    @ResponseBody
    public ModelAndView linkToCurrentMonthSalesDailyReportMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/finance/currentMonthSalesDailyReportMgmt");
        return result;
    }

    //销售月报表
    @RequestMapping("/linkToFinancialMonthlyReportMgmt")
    @ResponseBody
    public ModelAndView linkToFinancialMonthlyReportMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/finance/financialMonthlyReportMgmt");
        return result;
    }

    //销售日报表
    @RequestMapping("/linkToFinancialDailyReportMgmt")
    @ResponseBody
    public ModelAndView linkToFinancialDailyReportMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/finance/financialDailyReportMgmt");
        return result;
    }

    //畅销排行报表
    @RequestMapping("/linkToBestSellingRankingReportMgmt")
    @ResponseBody
    public ModelAndView linkToBestSellingRankingReportMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/finance/bestSellingRankingReportMgmt");
        return result;
    }

    //银行对账报表
    @RequestMapping("/linkToBankCheckingBillsReportMgmt")
    @ResponseBody
    public ModelAndView linkToBankCheckingBillsReportMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/finance/bankCheckingBillsReportMgmt");
        return result;
    }


/********************************************************************************************************************/
    /*以下为暂用不到的页面跳转，页面已有，可根据需求再次修改使用*/
    //自营派单信息管理
    /*@RequestMapping("/linkToAssignmentOrderMgmt")
    @ResponseBody
    public ModelAndView linkToAssignmentOrderMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/order/assignmentOrderMgmt");
        return result;
    }*/

    //退换货管理（总）
    /*@RequestMapping("/linkToExchangeMgmt")
    @ResponseBody
    public ModelAndView linkToExchangeMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/inventory/exchangeMgmt");
        return result;
    }*/

    //商家退换货管理
    /*@RequestMapping("/linkToBusinessExchangeMgmt")
    @ResponseBody
    public ModelAndView linkToBusinessExchangeMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/exchange/businessExchangeMgmt");
        return result;
    }*/

    //退换货派单管理
    /*@RequestMapping("/linkToExchangeAssignmentOrderMgmt")
    @ResponseBody
    public ModelAndView linkToExchangeAssignmentOrderMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/exchange/exchangeAssignmentOrderMgmt");
        return result;
    }*/

}
