package com.kshl.base.common.utils;

import com.kshl.util.FileUtils;
import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;

/**
 * Created by Administrator on 2017/6/16.
 */
public class FileUploadUtil {

    private static Logger logger = LoggerFactory.getLogger(FileUploadUtil.class);

    public static String getSaveFilePath(String data, HttpSession session, String model){
        if(KSHLUtils.isEmpty(data)) {
            logger.info("upload file failed, data is empty");
            return null;
        }
        String realPath = session.getServletContext().getRealPath("");
        String imgSuffix = data.substring(data.indexOf("/") + 1, data.indexOf(";"));
        String saveFileName = FileUtils.getSaveFileName(imgSuffix);

        String fullFileName = FileUtils.getFullSavePath(realPath, model) + saveFileName;
        String imagaBase64Data = data.substring(data.indexOf(",") + 1);

        Base64 base64 = new Base64();
        byte[] imageBinaryDate = base64.decode(imagaBase64Data);

        try {

            FileOutputStream outer = new FileOutputStream(fullFileName);
            outer.write(imageBinaryDate);
            outer.close();

        } catch (Exception e) {
            logger.error("file upload failed: ", e.toString());
            return null;
        }

        return "/" + FileUtils.getRelateSavePath(model) + saveFileName;
    }
}
