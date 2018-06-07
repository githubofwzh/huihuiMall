package com.kshl.huihuimall.console.controller.product;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.service.product.ProductService;
import com.kshl.huihuimall.console.controller.product.request.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;

@Controller
@EnableAutoConfiguration
@RequestMapping("/productMgmt")
public class ProductMgmtController {

    private static final Logger logger = LoggerFactory.getLogger(ProductMgmtController.class);

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/queryAllCategoryOne", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse queryAllCategoryOne(CategoryOneRequest categoryOneRequest) {
        logger.debug("queryAllCategoryOne start");
        return productService.getAllCategoryOne(categoryOneRequest);
    }

    @RequestMapping(value = "/queryAllCategoryTwo", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse queryAllCategoryTwo(CategoryTwoRequest categoryTwoRequest) {
        logger.debug("queryAllCategoryTwo start");
        return productService.getAllCategoryTwo(categoryTwoRequest);
    }

    @RequestMapping(value = "/queryAllBrand", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse queryAllBrand(BrandRequest brandRequest) {
        logger.debug("queryAllBrand start");
        return productService.getAllBrand(brandRequest);
    }

    @RequestMapping(value = "/queryAllCategoryTwoToBrand", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse queryAllCategoryTwoToBrand(Integer brandid, HttpSession session) {
        logger.debug("queryAllCategoryTwoToBrand start");
        BasePageResponse response;
        if (brandid != null) {
            response = ResponseBuilder.buildBasePageResponse(INVALID_PARAM);
        } else {
            response = productService.getAllCategoryTwoToBrand(brandid, session);
        }
        return response;
    }

    //筛选参数 name brandId categorytwoId categoryoneId 上架状态
    @RequestMapping(value = "/queryAllProduct", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse queryAllProduct(ProductRequest productRequest) {
        logger.debug("queryAllProduct start");
        return productService.getAllProduct(productRequest);
    }

    //筛选参数 name
    @RequestMapping(value = "/queryAllProductReview", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse queryAllProductReview(ProductReviewRequest productReviewRequest) {
        logger.debug("queryAllProductReview start");
        return productService.getAllProductReview(productReviewRequest);
    }

    @RequestMapping(value = "/passProductReview", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse passProductReview(@Valid ProductReviewRequest productReviewRequest,
                                          BindingResult bindingResult) {
        logger.debug("passProductReview start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[ProductReviewRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.passProductReview(productReviewRequest);
        }
        return response;
    }

    @RequestMapping(value = "/unPassProductReview", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse unPassProductReview(@Valid ProductReviewRequest productReviewRequest,
                                            BindingResult bindingResult) {
        logger.debug("unPassProductReview start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[ProductReviewRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.unPassProductReview(productReviewRequest);
        }
        return response;
    }

    @RequestMapping(value = "/putOnTheShelfSelf", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse putOnTheShelfSelf(ProductRequest productRequest) {
        logger.debug("putOnTheShelfSelf start");
        BaseResponse response;
        if (productRequest.getId() != null) {
            logger.warn("[ProductRequest] param id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.putOnTheShelfSelf(productRequest);
        }
        return response;
    }

    @RequestMapping(value = "/putOnTheShelfThird", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse putOnTheShelfThird(ProductRequest productRequest) {
        logger.debug("putOnTheShelfThird start");
        BaseResponse response;
        if (productRequest.getId() != null) {
            logger.warn("[ProductRequest] param id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.putOnTheShelfThird(productRequest);
        }
        return response;
    }

    @RequestMapping(value = "/putOffTheShelf", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse putOffTheShelf(ProductRequest productRequest) {
        logger.debug("putOffTheShelf start");
        BaseResponse response;
        if (productRequest.getId() != null) {
            logger.warn("[ProductRequest] param id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.putOffTheShelf(productRequest);
        }
        return response;
    }

    @RequestMapping(value = "/addCategoryTwoToBrand", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse addCategoryTwoToBrand(String categorytwoname, Integer categorytwoid, HttpSession session) {
        logger.debug("addCategoryTwoToBrand start");
        BaseResponse response;
        if (KSStringUtils.isEmpty(categorytwoname) || categorytwoid == null) {
            response = ResponseBuilder.buildBasePageResponse(INVALID_PARAM);
        } else {
            response = productService.addCategoryTwoToBrand(categorytwoname, categorytwoid, session);
        }
        return response;
    }

    @RequestMapping(value = "/addCategoryOne", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse addCategoryOne(CategoryOneRequest categoryOneRequest) {
        logger.debug("addCategoryOne start");
        BaseResponse response;
        if (categoryOneRequest.getName() == null) {
            logger.warn("[CategoryOneRequest] param error name can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.addCategoryOne(categoryOneRequest);
        }
        return response;
    }

    @RequestMapping(value = "/addCategoryTwo", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse addCategoryTwo(CategoryTwoRequest categoryTwoRequest) {
        logger.debug("addCategoryTwo start");
        BaseResponse response;
        if (categoryTwoRequest.getName() == null || categoryTwoRequest.getParentId() == null) {
            logger.warn("[CategoryTwoRequest] param error name and parentId can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.addCategoryTwo(categoryTwoRequest);
        }
        return response;
    }

    @RequestMapping(value = "/addBrand", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse addBrand(BrandRequest brandRequest, HttpSession session) {
        logger.debug("addBrand start");
        BaseResponse response;
        if (brandRequest.getName() == null) {
            logger.warn("[BrandRequest] param error name can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.addBrand(brandRequest, session);
        }
        return response;
    }

    @RequestMapping(value = "/addProduct", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse addProduct(@Valid ProductRequest productRequest,
                                   BindingResult bindingResult) {
        logger.debug("addProduct start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[ProductRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.addProduct(productRequest);
        }
        return response;
    }

    @RequestMapping(value = "/updateCategoryOne", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateCategoryOne(CategoryOneRequest categoryOneRequest) {
        logger.debug("updateCategoryOne start");
        BaseResponse response;
        if (categoryOneRequest.getName() == null || categoryOneRequest.getId() == null) {
            logger.warn("[CategoryOneRequest] param error name and id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.updateCategoryOne(categoryOneRequest);
        }
        return response;
    }

    @RequestMapping(value = "/updateCategoryTwo", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateCategoryTwo(CategoryTwoRequest categoryTwoRequest) {
        logger.debug("updateCategoryTwo start");
        BaseResponse response;
        if (categoryTwoRequest.getName() == null || categoryTwoRequest.getId() == null || categoryTwoRequest.getParentId() == null) {
            logger.warn("[CategoryTwoRequest] param error name , parentId and id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.updateCategoryTwo(categoryTwoRequest);
        }
        return response;
    }

    @RequestMapping(value = "/updateBrand", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateBrand(BrandRequest brandRequest, HttpSession session) {
        logger.debug("updateBrand start");
        BaseResponse response;
        if (brandRequest.getName() == null || brandRequest.getId() == null) {
            logger.warn("[BrandRequest] param error name, id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.updateBrand(brandRequest, session);
        }
        return response;
    }

    @RequestMapping(value = "/updateProduct", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateProduct(ProductRequest productRequest) {
        logger.debug("updateProduct start");
        BaseResponse response;
        if (productRequest.getId() == null) {
            logger.warn("[ProductRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.updateProduct(productRequest);
        }
        return response;
    }

    @RequestMapping(value = "/deleteCategoryTwoToBrand", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse deleteCategoryTwoToBrand(String categorytwoname, Integer categorytwoid, HttpSession session) {
        logger.debug("deleteCategoryTwoToBrand start");
        BaseResponse response;
        if (KSStringUtils.isEmpty(categorytwoname) || categorytwoid == null) {
            response = ResponseBuilder.buildBasePageResponse(INVALID_PARAM);
        } else {
            response = productService.deleteCategoryTwoToBrand(categorytwoname, categorytwoid, session);
        }
        return response;
    }

    @RequestMapping(value = "/deleteCategoryOne", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse deleteCategoryOne(CategoryOneRequest categoryOneRequest) {
        logger.debug("deleteCategoryOne start");
        BaseResponse response;
        if (categoryOneRequest.getId() == null) {
            logger.warn("[CategoryOneRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.deleteCategoryOne(categoryOneRequest);
        }
        return response;
    }

    @RequestMapping(value = "/deleteCategoryTwo", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse deleteCategoryTwo(CategoryTwoRequest categoryTwoRequest) {
        logger.debug("deleteCategoryTwo start");
        BaseResponse response;
        if (categoryTwoRequest.getId() == null) {
            logger.warn("[CategoryTwoRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.deleteCategoryTwo(categoryTwoRequest);
        }
        return response;
    }

    @RequestMapping(value = "/deleteBrand", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse deleteBrand(BrandRequest brandRequest) {
        logger.debug("deleteBrand start");
        BaseResponse response;
        if (brandRequest.getId() == null) {
            logger.warn("[BrandRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.deleteBrand(brandRequest);
        }
        return response;
    }

    @RequestMapping(value = "/deleteProduct", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse deleteProduct(ProductRequest productRequest) {
        logger.debug("deleteProduct start");
        BaseResponse response;
        if (productRequest.getId() == null) {
            logger.warn("[ProductRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = productService.deleteProduct(productRequest);
        }
        return response;
    }

}
