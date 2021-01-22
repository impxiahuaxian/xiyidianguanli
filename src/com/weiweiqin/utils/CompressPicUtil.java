/** 
 *  缩略图实现，将图片(jpg、bmp、png、gif等等)真实的变成想要的大小 
 */
package com.weiweiqin.utils;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/*******************************************************************************
 * 缩略图类（通用） 本java类能将jpg、bmp、png、gif图片文件，进行等比或非等比的大小转换。 具体使用方法
 * compressPic(大图片路径,生成小图片路径,大图片文件名,生成小图片文名,生成小图片宽度,生成小图片高度,是否等比缩放(默认为true))
 */
public class CompressPicUtil {
	private static final Logger logger = LoggerFactory
			.getLogger(CompressPicUtil.class);

	public static void main(String[] arg) {
		Map<String, Object> createThumbnail = CompressPicUtil.createThumbnail("D:\\1.jpg", "D:\\a.jpg", 0.97f, 225, 0);
		System.out.println(createThumbnail);
	}

	/**
	 * 创建图片缩略图(等比缩放)
	 * @param src 源图片文件完整路径
	 * @param dist 目标图片文件完整路径、
	 * @param quality 图片压缩质量
	 * @param width 缩放的宽度
	 * @param height 缩放的高度
	 * @return 返回缩放后的高度
	 */
	public static Map<String,Object> createThumbnail(String src, String dist, float quality,
			float width, float height) {
		Map<String,Object> result = new HashMap<String, Object>();
		int newWidth = 0;
		int newHeight = 0;
		try {
			File srcfile = new File(src);
			if (!srcfile.exists()) {
				logger.info("文件不存在");
				result.put("success", false);
				result.put("errorMsg","原文件不存在");
				return result;
			}
			BufferedImage image = ImageIO.read(srcfile);
			
			result.put("height",image.getHeight());
			result.put("width", image.getWidth());

			// 获得缩放的比例
			double ratio = 1.0;
			// 判断如果高、宽都不大于设定值，则不处理,
			if (image.getHeight() > height || image.getWidth() > width) {
				// 按宽度来缩放
				if (width > height) {
					ratio = width / image.getWidth();
					// 按高度来缩放
				} else {
					ratio = height / image.getHeight();
				}
			}
			// 计算新的图面宽度和高度
			newWidth = (int) (image.getWidth() * ratio);
			newHeight = (int) (image.getHeight() * ratio);
			
			result.put("compressHeight",newHeight);
			result.put("compressWidth", newWidth);


			BufferedImage bfImage = new BufferedImage(newWidth, newHeight,
					BufferedImage.TYPE_INT_RGB);
			bfImage.getGraphics().drawImage(
					image.getScaledInstance(newWidth, newHeight,
							Image.SCALE_SMOOTH), 0, 0, null);

			FileOutputStream os = new FileOutputStream(dist);
			JPEGEncodeParam jep = JPEGCodec.getDefaultJPEGEncodeParam(bfImage);
			// 设置图片的压缩质量
			jep.setQuality(quality, true);
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(os);
			encoder.setJPEGEncodeParam(jep);
			encoder.encode(bfImage);
			os.close();
			logger.info("创建缩略图成功");
		} catch (Exception e) {
			logger.error("创建缩略图异常",e);
		}
		result.put("success",true);
		return result;
	}

}