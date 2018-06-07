package com.kshl.base.response;

import com.github.pagehelper.Page;

import java.util.Collection;
import java.util.Map;

/**
 * Created by xufengfeng on 2017/5/10.
 */
public class BasePageResponse<T> extends BaseResponse<T> {

    //当前页
    protected int pageNum;
    //每页的数量
    protected int pageSize;
    //当前页的数量
    protected int size;
    //总记录数
    protected long total;
    //总页数
    protected int pages;

    //是否为第一页
    protected boolean isFirstPage = false;
    //是否为最后一页
    protected boolean isLastPage = false;
    //是否有前一页
    protected boolean hasPreviousPage = false;
    //是否有下一页
    protected boolean hasNextPage = false;



    public boolean isFirstPage() {
        return isFirstPage;
    }

    public void setFirstPage(boolean firstPage) {
        isFirstPage = firstPage;
    }

    public boolean isLastPage() {
        return isLastPage;
    }

    public void setLastPage(boolean lastPage) {
        isLastPage = lastPage;
    }

    public boolean isHasPreviousPage() {
        return hasPreviousPage;
    }

    public void setHasPreviousPage(boolean hasPreviousPage) {
        this.hasPreviousPage = hasPreviousPage;
    }

    public boolean isHasNextPage() {
        return hasNextPage;
    }

    public void setHasNextPage(boolean hasNextPage) {
        this.hasNextPage = hasNextPage;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    @Override
    public void setData(T data) {

        if (data instanceof Page) {
            Page page = (Page) data;
            this.pageNum = page.getPageNum();
            this.pageSize = page.getPageSize();

            this.pages = page.getPages();

            this.size = page.size();
            this.total = page.getTotal();


        } else if (data instanceof Collection) {
            Collection page = (Collection) data;
            this.pageNum = 1;
            this.pageSize = page.size();

            this.pages = 1;
            this.size = page.size();
            this.total = page.size();
        } else if (data instanceof Map) {
            Map map = (Map)data;
            Collection page = (Collection) map.get("list");
            this.pageNum = 1;
            this.pageSize = page.size();

            this.pages = 1;
            this.size = page.size();
            this.total = page.size();
        }


        if (data instanceof Collection) {
            this.isFirstPage = pageNum == 1;
            this.isLastPage = pageNum == pages;
            this.hasPreviousPage = pageNum > 1;
            this.hasNextPage = pageNum < pages;
        } else if (data instanceof Map) {
            this.isFirstPage = pageNum == 1;
            this.isLastPage = pageNum == pages;
            this.hasPreviousPage = pageNum > 1;
            this.hasNextPage = pageNum < pages;
        }

        this.data = data;
    }
}
