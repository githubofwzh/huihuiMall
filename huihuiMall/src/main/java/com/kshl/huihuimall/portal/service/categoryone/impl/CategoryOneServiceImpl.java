package com.kshl.huihuimall.portal.service.categoryone.impl;

        import com.kshl.huihuimall.base.dal.entity.*;
        import com.kshl.huihuimall.portal.controller.request.AllDetailRequest;
        import com.kshl.huihuimall.portal.dal.dao.CategoryOneDao;
        import com.kshl.huihuimall.portal.service.categoryone.CategoryOneService;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Service;

        import java.util.List;
        import java.util.Map;

@Service
public class CategoryOneServiceImpl implements CategoryOneService{
    @Override
    public List<CategoryTwo> selectCategoryTwoByproduct(Integer twoId , String name, Integer brId) {
        List<CategoryTwo> list =categoryOneDao.getCategoryproduct(twoId,name,brId);
        //BaseResponse Response=ResponseBuilder.buildBaseResponse(SUCCESS);
        //Response.setData(list);
        return list;
    }

    @Override
    public List<Product> selectByproduct(Integer id,String name,Integer brId) {
        List<Product> list =categoryOneDao.getproductById(id,name,brId);
        return list;
    }

    @Override
    public List<Brand> getAllBrand(Integer id) {
        List<Brand> list=categoryOneDao.getAllBrand(id);
        return list;
    }

    @Override
    public List<Brand> getBrandList() {
        return categoryOneDao.getBrandList();
    }

    @Override
    public Merchant getmerchantById(Integer id) {
        return categoryOneDao.getmerchantById(id);
    }


    @Autowired
    private CategoryOneDao categoryOneDao;

    @Override
    public  List<CategoryOne> selectByExample(CategoryOneExample example) {
        List<CategoryOne> list=categoryOneDao.selectByExample(null);
        return list;
    }

    @Override
    public List<CategoryOne> selectByOneAndTwo(Integer id) {
        List<CategoryOne> list=categoryOneDao.getCategoryOneAndTwo(id);
        return list;
    }

    public List<Map<String, Object>> getStoreId(String deviceCode) {
        return categoryOneDao.getStoreId(deviceCode);
    }
}
