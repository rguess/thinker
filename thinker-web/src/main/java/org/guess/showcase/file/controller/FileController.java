package org.guess.showcase.file.controller;

import org.guess.core.utils.web.ServletUtils;
import org.guess.showcase.file.model.FileMeta;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;

@Controller
@RequestMapping("/file")
public class FileController {

    LinkedList<FileMeta> files = new LinkedList<FileMeta>();
    FileMeta fileMeta = null;

    @RequestMapping(method = RequestMethod.GET, value = "/upload")
    public ModelAndView toPage(ModelAndView mav) throws Exception {
        mav.setViewName("/file/upload");
        return mav;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/download")
    public void download(HttpServletResponse response,
                         HttpServletRequest request,
                         @RequestParam("fileName") String fileName,
                         @RequestParam("fileUuid") String uuid) throws Exception {
        String decodeFileName = URLDecoder.decode(fileName, "utf-8");
        ServletUtils.setFileDownloadHeader(response, decodeFileName);
        File file = new File(ServletUtils.getRealPath(request) + "/upload/"
                + uuid);
        FileCopyUtils.copy(new FileInputStream(file), response.getOutputStream());
    }

    @RequestMapping(method = RequestMethod.POST, value = "/upload")
    @ResponseBody
    public Map<String, LinkedList<FileMeta>> upload(ModelAndView mav,
                                                    MultipartHttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // 1. build an iterator
        Iterator<String> itr = request.getFileNames();
        MultipartFile mpf = null;
        // 2. get each file
        while (itr.hasNext()) {
            // 2.1 get next MultipartFile
            mpf = request.getFile(itr.next());
            System.out.println(mpf.getOriginalFilename() + " uploaded! "
                    + files.size());

            // 2.2 if files > 10 remove the first from the list
            if (files.size() >= 10)
                files.pop();

            // 2.3 create new fileMeta
            fileMeta = new FileMeta();
            fileMeta.setName(mpf.getOriginalFilename());
            fileMeta.setSize(mpf.getSize() / 1024 + " Kb");
            fileMeta.setType(mpf.getContentType());
            fileMeta.setUrl(ServletUtils.getContentpath(request) + "/upload/"
                    + mpf.getOriginalFilename());
            try {

                FileOutputStream out = new FileOutputStream(
                        ServletUtils.getRealPath(request) + "/upload/"
                                + mpf.getOriginalFilename());
                InputStream in = mpf.getInputStream();
                /*int c;
                byte buffer[] = new byte[1024];
                while ((c =
                        in.read(buffer)) != -1) {
                    for (int i = 0; i < c; i++) {
                        out.write(buffer[i]);
                        System.out.println(i);
                    }
                }
                in.close();
                out.close();*/

                FileCopyUtils.copy(in, out);

            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            // 2.4 add to files
            files.add(fileMeta);
        }
        Map<String, LinkedList<FileMeta>> map = new HashMap<String, LinkedList<FileMeta>>();
        map.put("files", files);
        // result will be like this
        // [{"fileName":"app_engine-85x77.png","fileSize":"8 Kb","fileType":"image/png"},...]
        return map;
    }
}
