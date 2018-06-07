package com.kshl.huihuimall.console.controller.store;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.base.dal.entity.Store;
import com.kshl.huihuimall.base.dal.entity.Storehouse;
import com.kshl.huihuimall.console.controller.store.request.StoreMgRequest;
import com.kshl.huihuimall.console.controller.store.request.StoreRequest;
import com.kshl.huihuimall.console.service.store.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/StoreController")
public class StoreController {

    @Autowired
    private StoreService storeService;

    /**
     * 分页查询门店审核信息
     * @param request
     * @return
     */
    @RequestMapping(value="/queryStoreCheck", method={RequestMethod.GET})
    @ResponseBody
    public BasePageResponse queryStoreCheck(StoreRequest request){

        return storeService.queryStoreCheck(request);
    }

    /**
     * 查看详情
     * @param request
     * @return
     */
    @RequestMapping(value="/queryStoreDetail", method={RequestMethod.GET})
    @ResponseBody
    public BaseResponse queryStoreDetail(Store store ){
        BaseResponse baseResponse=new BaseResponse();
        Map<String,Object> map= new HashMap<>();
        List<Map<String, Object>> list=storeService.getStoreDetail(store);
        map.put("list",list);
        baseResponse.setData(map);
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }
    /**
     * 审核不通过
     * @param request
     * @return
     */
    @RequestMapping(value="/unpassCheckStatus", method={RequestMethod.POST})
    @ResponseBody
    @Transactional
    public BaseResponse unpassCheckStatus(StoreRequest request){
        BaseResponse baseResponse=new BaseResponse();
        storeService.updateCheckStatus(request.getId());
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }
    /**
     * 审核通过
     * @param request
     * @return
     */
    @RequestMapping(value="/PassCheckStatus", method={RequestMethod.POST})
    @ResponseBody
    @Transactional
    public BaseResponse PassCheckStatus(StoreRequest request){
        BaseResponse baseResponse=new BaseResponse();
        Shopkeeper store=storeService.selectshopkeeperID(request.getId());
        storeService.updateshopStart(request.getId());
        storeService.updateStatusPass(request.getId(),store.getId());
        baseResponse.setRetCode((long) 0);
        return baseResponse;
    }

    /**
     * 门店管理
     * @param request
     * @return
     */
    @RequestMapping(value="/queryStore", method={RequestMethod.GET})
    @ResponseBody
    public BasePageResponse queryStore(StoreMgRequest request){

        return storeService.queryStore(request);
    }
    /**
     * 修改门店信息
     * @param request
     * @return
     */
    @RequestMapping(value="/updateStore", method={RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateStore(Store request){
        BaseResponse baseResponse=new BaseResponse();
        Store store=new Store();
        store.setId(request.getId());
        store.setStorehouseId(request.getStorehouseId());
        storeService.updateStorebyid(store);
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;

    }
    /**
     * 推荐客服名单
     */
    @RequestMapping(value="/recommendClientList", method={RequestMethod.POST})
    @ResponseBody
    public BaseResponse recommendClientList(Integer id){

        return storeService.recommendClientList(id);
    }
    /**
     * 门店管理详情
     * @param request
     * @return
     */
    @RequestMapping(value="/storeMgDetail", method={RequestMethod.GET})
    @ResponseBody
    public BaseResponse storeMgDetail(Store store){

        BaseResponse baseResponse=new BaseResponse();
        Map<String,Object> map= new HashMap<>();
        List<Map<String, Object>> list=storeService.getStoreMgDetail(store);
        map.put("list",list);
        baseResponse.setData(map);
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }

    //开店
    @RequestMapping(value="/storeOpen", method={RequestMethod.POST})
    @ResponseBody
    @Transactional
    public BaseResponse storeOpen(StoreRequest request){
        BaseResponse baseResponse=new BaseResponse();
        storeService.storeOpen(request.getId());
        storeService.shopkeepOpen(request.getId());
        baseResponse.setRetCode((long) 0);
        return baseResponse;
    }

    //关店
    @RequestMapping(value="/storeOff", method={RequestMethod.POST})
    @ResponseBody
    @Transactional
    public BaseResponse storeOff(StoreRequest request){
        BaseResponse baseResponse=new BaseResponse();
        storeService.storeOff(request.getId());
        storeService.shopkeepOff(request.getId());
        baseResponse.setRetCode((long) 0);
        return baseResponse;
    }


    /**
     * 门店分润详情
     * @param id
     * @return
     */
    @RequestMapping(value="/storeprofit", method={RequestMethod.POST})
    @ResponseBody
    public BaseResponse storeprofit(Integer id){

        return storeService.storeprofit(id);
    }

    /**
     * 门店分润查询
     * @param request
     * @return
     */
    @RequestMapping(value="/querystoreprofit", method={RequestMethod.POST})
    @ResponseBody
    public BasePageResponse querystoreprofit(StoreRequest request){

        return storeService.querystoreprofit(request);
    }

    @RequestMapping(value="/selectStroehouse", method={RequestMethod.POST})
    @ResponseBody
    public BaseResponse selectStroehouse(){
        BaseResponse baseResponse=new BaseResponse();
       List<Storehouse> list= storeService.selectStroehouse( );
        baseResponse.setData(list);
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;

    }

}