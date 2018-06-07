package com.kshl.huihuimall.console.controller.area;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.KsRole;
import com.kshl.huihuimall.base.dal.entity.KsRoleToResource;
import com.kshl.huihuimall.base.request.RoleRequest;
import com.kshl.huihuimall.console.service.role.RoleService;
import com.kshl.huihuimall.console.service.roleToResorce.RoleToResorceService;
import com.kshl.security.model.KSUserDetailHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Controller
@EnableAutoConfiguration
@RequestMapping("/cityMgr")
public class CityMgrController {

    private static final Logger logger = LoggerFactory.getLogger(CityMgrController.class);
    @Autowired
    private RoleService roleService;
    @Autowired
    private RoleToResorceService roleToResorceService;

    @RequestMapping
    public ModelAndView linkToRoleMgmt(RoleRequest request){
        ModelAndView result = new ModelAndView("/BackStage/roleMgmt");
        return result;
    }

    @RequestMapping(value = "/queryRoles", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse getRolesByPage(RoleRequest request){
        String entCode = KSUserDetailHelper.getUserEntCode();
        List<KsRole> roles = roleService.getAllRolesByPage(request.getPageNum(), request.getPageSize(), request.getName(), entCode);
        BasePageResponse<List<KsRole>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(roles);
        return pageResponse;
    }

    @RequestMapping(value = "/queryAllRoles", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse getRoles(){
        String entCode = KSUserDetailHelper.getUserEntCode();
        List<KsRole> roles = roleService.getAllRoles(entCode);
        BaseResponse<List<KsRole>> baseResponse = ResponseBuilder.buildBaseResponse(SUCCESS);
        baseResponse.setData(roles);
        return baseResponse;
    }

    @RequestMapping(value = "/addRole", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse addRole(KsRole role){
        String entCode = KSUserDetailHelper.getUserEntCode();
        role.setEntcode(entCode);
        boolean isSuccess = roleService.addRole(role) > 0;
        BaseResponse response = ResponseBuilder.buildBaseResponse(isSuccess ? SUCCESS : INVALID_PARAM);
        return response;
    }

    @RequestMapping(value = "/updateRole", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateRole(KsRole role){
        String entCode = KSUserDetailHelper.getUserEntCode();
        role.setEntcode(entCode);
        int count = roleService.updateRole(role);
        BaseResponse response = ResponseBuilder.buildBaseResponse(count > 0 ? SUCCESS : INVALID_PARAM);
        return response;
    }

    @RequestMapping(value = "/deleteRole")
    @ResponseBody
    public BaseResponse deleteRole(Integer id){
        int count = roleService.deleteRole(id);
        BaseResponse response = ResponseBuilder.buildBaseResponse(count > 0 ? SUCCESS : INVALID_PARAM);
        return response;
    }

    @RequestMapping(value = "/view")
    @ResponseBody
    public BaseResponse view(Integer id) {
        KsRole role = roleService.getById(id);
        BaseResponse response = ResponseBuilder.buildBaseResponse(SUCCESS);
        response.setData(role);
        return response;
    }

    @RequestMapping(value = "/RoleIsExits")
    @ResponseBody
    public BaseResponse getRoleByName(String name) {
        String entCode = KSUserDetailHelper.getUserEntCode();
        List<KsRole> role = roleService.getByName(name,entCode);
        BaseResponse response = ResponseBuilder.buildBaseResponse(SUCCESS);
        response.setData(role);
        return response;
    }

    @RequestMapping("/roleToResource")
    @ResponseBody
    public BaseResponse installAuth(Integer roleId,String resourceIds){
        roleToResorceService.installAuth(roleId,resourceIds);
        BaseResponse response = ResponseBuilder.buildBaseResponse(SUCCESS);
        return response;
    }

    @RequestMapping(value = "/queryRoleResource")
    @ResponseBody
    public BaseResponse queryRoleResource(Integer roleId) {
        List<KsRoleToResource> roleToResourceList = roleToResorceService.getRoleToResources(roleId);
        BaseResponse response = ResponseBuilder.buildBaseResponse(SUCCESS);
        response.setData(roleToResourceList);
        return response;
    }
}
