package com.kshl.util;

import com.kshl.base.common.utils.KSHLUtils;

import java.io.File;
import java.util.UUID;

/**
 * Created by zhangmeng on 2017/6/15.
 */
public class FileUtils {

    public static String getFullSavePath(String realPath, String model) {

        String savePath = realPath + "/" + getRelateSavePath(model);
        //(KSHLUtils.isNotEmpty(realPath) ? realPath : "") + (KSHLUtils.isNotEmpty(realPath) ? "/" : "") + getRelateSavePath(model, "/");
        File dir = new File(savePath);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        return savePath;
    }

    public static String getSaveFileName(String imgSuffix) {
        return UUID.randomUUID().toString().replace("-", "") + "."
                + imgSuffix;
    }

    public static String getRelateSavePath(String model) {

        if (KSHLUtils.isEmpty(model)) {
            model = "common";
        }
        String path = "savefile/" + model + "/"
                + KSHLUtils.getCurDate() + "/";

        return path;
    }
}
