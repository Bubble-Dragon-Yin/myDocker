package SOAS.controller;

import SOAS.pojo.Result;
import SOAS.utils.AliOSSUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Slf4j
@RestController
public class UploadController {
    @Autowired
    private AliOSSUtils aliOSSUtils;

    @PostMapping("/upload")
    public Result upload(MultipartFile image) throws IOException {
        log.info("upload file name: {}",image.getOriginalFilename());
        String url =  aliOSSUtils.upload(image);
        log.info("uploading is successful... ");
        return  Result.success(url);
    }
}
