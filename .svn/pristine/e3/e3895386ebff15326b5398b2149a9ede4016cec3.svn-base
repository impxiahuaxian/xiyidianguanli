package com.weiweiqin.controller.back;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.weiweiqin.constants.Constants;
import com.weiweiqin.utils.CompressPicUtil;
import com.weiweiqin.vo.common.Result;

/**
 * 
 * @author weiweiqin
 * 
 */
@Controller
@RequestMapping("/upload")
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	/**
	 * 图片压缩质量
	 */
	private static final float QUALITY = 0.97f;


	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	@ResponseBody
	public String upload(HttpServletRequest request,
			HttpServletResponse response) {
		Result result = new Result();
		Map<String, Object> mp = new HashMap<String, Object>();

		MultipartHttpServletRequest multipartHttpservletRequest = (MultipartHttpServletRequest) request;
		// Map<String, MultipartFile> fileMap =
		// multipartHttpservletRequest.getFileMap();
		MultipartFile multipartFile = multipartHttpservletRequest
				.getFile("Filedata");
		String originalFileName = multipartFile.getOriginalFilename();

		int index = originalFileName.indexOf(".");

		// 通过文件名给子文件排序
		int orderKey = 0;
		try {

			String fileName = originalFileName.substring(0, index);
			orderKey = Integer.valueOf(fileName);
		} catch (Exception e) {
			orderKey = 0;
		}
		originalFileName = originalFileName.substring(index);
		String webapps = getTomcatWebappsPath(request);
		// 原始图片存放路径
		String filePath = webapps + File.separator
				+ Constants.FileInfo.FILE_PATH;
		// 压缩图片存放路径
		String compressFilePath = webapps + File.separator
				+ Constants.FileInfo.COMPRESS_FILE_PATH;
		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdirs();
		}
		File compressFile = new File(compressFilePath);

		if (!compressFile.exists()) {
			compressFile.mkdirs();
		}
		String newFileName = System.currentTimeMillis() + "_"
				+ originalFileName;
		try {
			FileOutputStream fileOutputStream = new FileOutputStream(file + "/"
					+ newFileName);
			fileOutputStream.write(multipartFile.getBytes());
			fileOutputStream.flush();
			fileOutputStream.close();
			// 压缩图片
			Map<String, Object> compressResult = CompressPicUtil
					.createThumbnail(filePath + "/" + newFileName,
							compressFilePath + "/" + newFileName, QUALITY, 249,
							0);
			// 压缩图片成功
			if (Boolean.valueOf(compressResult.get("success").toString())) {
				mp.put("height", compressResult.get("height").toString());
				mp.put("width", compressResult.get("width").toString());
				mp.put("compressWidth", compressResult.get("compressWidth")
						.toString());
				mp.put("compressHeight", compressResult.get("compressHeight")
						.toString());
			} else {
				result.setResult(false);
				result.setErrorMsg(mp.get("errorMsg").toString());
				return result.toJson();
			}
		} catch (FileNotFoundException e) {
			result.setResult(false);
			result.setErrorMsg("没有找到图片文件");
			return result.toJson();
		} catch (IOException e) {
			result.setResult(false);
			result.setErrorMsg("上传图片失败...");
			return result.toJson();
		}
		result.setResult(true);
		mp.put("name", newFileName);
		mp.put("oriName", originalFileName);
		mp.put("orderKey", orderKey);
		mp.put("size", multipartFile.getSize());
		result.setObj(mp);
		return result.toJson();
	}
	
	/**
	 * 上传颜色图片，设置更小的压缩度
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/addForColor.do", method = RequestMethod.POST)
	@ResponseBody
	public String uploadForColor(HttpServletRequest request,
			HttpServletResponse response) {
		Result result = new Result();
		Map<String, Object> mp = new HashMap<String, Object>();

		MultipartHttpServletRequest multipartHttpservletRequest = (MultipartHttpServletRequest) request;
		// Map<String, MultipartFile> fileMap =
		// multipartHttpservletRequest.getFileMap();
		MultipartFile multipartFile = multipartHttpservletRequest
				.getFile("Filedata");
		String originalFileName = multipartFile.getOriginalFilename();

		int index = originalFileName.indexOf(".");

		// 通过文件名给子文件排序
		int orderKey = 0;
		try {

			String fileName = originalFileName.substring(0, index);
			orderKey = Integer.valueOf(fileName);
		} catch (Exception e) {
			orderKey = 0;
		}
		originalFileName = originalFileName.substring(index);
		String webapps = getTomcatWebappsPath(request);
		// 原始图片存放路径
		String filePath = webapps + File.separator
				+ Constants.FileInfo.FILE_PATH;
		// 压缩图片存放路径
		String compressFilePath = webapps + File.separator
				+ Constants.FileInfo.COMPRESS_FILE_PATH;
		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdirs();
		}
		File compressFile = new File(compressFilePath);

		if (!compressFile.exists()) {
			compressFile.mkdirs();
		}
		String newFileName = System.currentTimeMillis() + "_"
				+ originalFileName;
		try {
			FileOutputStream fileOutputStream = new FileOutputStream(file + "/"
					+ newFileName);
			fileOutputStream.write(multipartFile.getBytes());
			fileOutputStream.flush();
			fileOutputStream.close();
			// 压缩图片
			Map<String, Object> compressResult = CompressPicUtil
					.createThumbnail(filePath + "/" + newFileName,
							compressFilePath + "/" + newFileName, QUALITY, 0,
							50);
			// 压缩图片成功
			if (Boolean.valueOf(compressResult.get("success").toString())) {
				mp.put("height", compressResult.get("height").toString());
				mp.put("width", compressResult.get("width").toString());
				mp.put("compressWidth", compressResult.get("compressWidth")
						.toString());
				mp.put("compressHeight", compressResult.get("compressHeight")
						.toString());
			} else {
				result.setResult(false);
				result.setErrorMsg(mp.get("errorMsg").toString());
				return result.toJson();
			}
		} catch (FileNotFoundException e) {
			result.setResult(false);
			result.setErrorMsg("没有找到图片文件");
			return result.toJson();
		} catch (IOException e) {
			result.setResult(false);
			result.setErrorMsg("上传图片失败...");
			return result.toJson();
		}
		result.setResult(true);
		mp.put("name", newFileName);
		mp.put("oriName", originalFileName);
		mp.put("orderKey", orderKey);
		mp.put("size", multipartFile.getSize());
		result.setObj(mp);
		return result.toJson();
	}

	/**
	 * 设置历史图片数据的图片高度和宽度
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	// @RequestMapping(value = "/general.do")
	// public String general(HttpServletRequest request,
	// HttpServletResponse response) {
	// List<Pic> picList = picService.getAll();
	// String webapps = getTomcatWebappsPath(request);
	// // 原始图片存放路径
	// String filePath = webapps + File.separator
	// + Constants.FileInfo.FILE_PATH;
	// // 压缩图片存放路径
	// String compressFilePath = webapps + File.separator
	// + Constants.FileInfo.COMPRESS_FILE_PATH;
	// for (Pic pic : picList) {
	// String name = pic.getName();
	// String src = filePath + "/"+name;
	// String compressName = compressFilePath + "/"+name;
	// File srcfile = new File(src);
	//
	// File compressFile = new File(compressName);
	// try {
	// BufferedImage image = ImageIO.read(srcfile);
	// BufferedImage comImage = ImageIO.read(compressFile);
	// int height = image.getHeight();
	// int width = image.getWidth();
	// int compressHeight = comImage.getHeight();
	// int compressWidth = comImage.getWidth();
	// pic.setHeight(height);
	// pic.setWidth(width);
	// pic.setCompressHeight(compressHeight);
	// pic.setCompressWidth(compressWidth);
	// pic.setOrderKey(0);
	// picService.update(pic);
	//
	// } catch (IOException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	//
	//
	//
	// }
	// return "success";
	// }

	 
	
	@RequestMapping("download.do")
	public void downloadFile(String fileName, HttpServletRequest request,
			HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");

		response.setHeader("Content-Disposition", "attachment;fileName="
				+ fileName);
		try {
			String webapps = getTomcatWebappsPath(request);
			String filePath = webapps + File.separator
					+ Constants.FileInfo.FILE_PATH;
			File file = new File(fileName);
			InputStream inputStream = new FileInputStream(filePath + "/" + file);
			OutputStream os = response.getOutputStream();
			byte[] b = new byte[1024];
			int length;
			while ((length = inputStream.read(b)) > 0) {
				os.write(b, 0, length);
			}
			inputStream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("downloadCompress.do")
	public void downloadCompress(String fileName, HttpServletRequest request,
			HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");

		response.setHeader("Content-Disposition", "attachment;fileName="
				+ fileName);
		try {
			String webapps = getTomcatWebappsPath(request);
			String filePath = webapps + File.separator
					+ Constants.FileInfo.COMPRESS_FILE_PATH;
			File file = new File(fileName);
			InputStream inputStream = new FileInputStream(filePath + "/" + file);
			OutputStream os = response.getOutputStream();
			byte[] b = new byte[1024];
			int length;
			while ((length = inputStream.read(b)) > 0) {
				os.write(b, 0, length);
			}
			inputStream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取tomcat webapps目录
	 * 
	 * @param request
	 * @return
	 */
	private static String getTomcatWebappsPath(HttpServletRequest request) {
		String result = "";
		String tomcatRoot = request.getSession().getServletContext()
				.getRealPath("/");
		int indexOf = tomcatRoot.indexOf("webapps");
		if (indexOf != -1) {
			result = tomcatRoot.substring(0, indexOf + 7);
		}
		return result;
	}
}