package com.kshl.huihuimall.console.controller.file;

import com.kshl.base.common.utils.KSHLUtils;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.util.FileUtils;
import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;

import static com.kshl.huihuimall.console.CSErrorCode.*;

@Controller
@EnableAutoConfiguration
@RequestMapping("/fileUpload")
public class FileUploadController {

    private static Logger logger = LoggerFactory.getLogger(FileUploadController.class);

    @RequestMapping
    @ResponseBody
    public BaseResponse uploadFile(String data, HttpSession session, String model) {

        BaseResponse response = null;
        if(KSHLUtils.isEmpty(data)) {
            logger.info("upload file failed, data is empty");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return response;
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
            response = ResponseBuilder.buildBaseResponse(FILE_UPLOAD_FAILED);
            return response;
        }

        response = ResponseBuilder.buildBaseResponse(SUCCESS);
        response.setData("/" + FileUtils.getRelateSavePath(model) + saveFileName );
        return response;
    }


}
