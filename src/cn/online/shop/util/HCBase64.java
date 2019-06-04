package cn.online.shop.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

import org.apache.log4j.Logger;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import cn.online.shop.config.R;
import sun.misc.BASE64Decoder;

public class HCBase64 {

	private static final Logger log = Logger.getLogger(R.LOG_SYS);
	
	/**
	 * 对字节数组字符串进行Base64解码并生成图片
	 * @param imgStr Base64编码过的字节数组字符串
	 * @return
	 */
	public static boolean GenerateImage(String imgFilePath, String imgCode, float width,
            float height) {// 对字节数组字符串进行Base64解码并生成图片
		if (imgCode == null) // 图像数据为空
			return false;
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64解码
			byte[] b = decoder.decodeBuffer(imgCode);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			if(width == 1){
				//不需要对图片进行压缩，，直接保存
				//生成图片  
				File file = new File(imgFilePath);
	            if(!file.getParentFile().exists()){	            		            	
	            	file.getParentFile().mkdirs();           	
	            }
	            OutputStream out = new FileOutputStream(imgFilePath);      
	            out.write(b);  
	            out.flush();  
	            out.close();  
			}else{
				//将解码得到的图片字节数组进行等比压缩，后输出到指定位置
				createThumbnailByByte(b, imgFilePath, width, height);
			}
			
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	
	
	/**
	 * 根据图片字节数组，将图片等比压缩，确保不失真
	 * @param buf	原图片字节数组
	 * @param dist	压缩后图片存放路径
	 * @param width	宽度
	 * @param height	高度
	 */
	public static void createThumbnailByByte(byte[] buf, String dist, float width,
            float height) {
        try {
            if (buf.length<1) {
                log.debug("文件不存在");
                return;
            }
            InputStream inputStream = new ByteArrayInputStream(buf); 
            BufferedImage image = ImageIO.read(inputStream);
            log.info("image:"+image);
            // 获得缩放的比例
            double ratio = 1.0;
            // 判断如果高、宽都不大于设定值，则不处理
            if (image.getHeight() > height || image.getWidth() > width) {
                if (image.getHeight() > image.getWidth()) {
                    ratio = height / image.getHeight();
                } else {
                    ratio = width / image.getWidth();
                }
            }
            // 计算新的图面宽度和高度
            int newWidth = (int) (image.getWidth() * ratio);
            int newHeight = (int) (image.getHeight() * ratio);

            BufferedImage bfImage = new BufferedImage(newWidth, newHeight,
                    BufferedImage.TYPE_INT_RGB);
            bfImage.getGraphics().drawImage(
                    image.getScaledInstance(newWidth, newHeight,
                            Image.SCALE_SMOOTH), 0, 0, null);
            File file = new File(dist);
            if(!file.getParentFile().exists()){
            	//log.debug(dist + "目录不存在，创建该目录");	            	
            	file.getParentFile().mkdirs();            	
            }
            FileOutputStream os = new FileOutputStream(dist);
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(os);
            encoder.encode(bfImage);
            os.close();
           // log.debug("创建缩略图成功");
        } catch (Exception e) {
            log.debug("创建缩略图发生异常" + e.getMessage());
        }
    }
	
		public static void createQRCode(String content, String filePath) throws WriterException,IOException {
		
		
		FileOutputStream fileOutputStream = new FileOutputStream(filePath);
		
		MultiFormatWriter multiFormatWriter = new MultiFormatWriter();
		Map hints = new HashMap();
		hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
		BitMatrix bitMatrix = multiFormatWriter.encode(content, BarcodeFormat.QR_CODE, 300, 300,hints);
		MatrixToImageWriter.writeToStream(bitMatrix, "jpg", fileOutputStream);
		fileOutputStream.close();
	}
	
	
		/**
		 * 将url上的图片转化为byte[]数据
		 * @param urlPath
		 * @return
		 */
		public static byte[] getImageFromURL(String urlPath) { 
	        byte[] data = null; 
	        InputStream is = null; 
	        HttpURLConnection conn = null; 
	        try { 
	            URL url = new URL(urlPath); 
	            conn = (HttpURLConnection) url.openConnection(); 
	            conn.setDoInput(true); 
	            conn.setRequestMethod("GET"); 
	            conn.setConnectTimeout(1000); 
	            is = conn.getInputStream(); 
	            if (conn.getResponseCode() == 200) { 
	                data = readInputStream(is); 
	            } else{ 
	                data=null; 
	            } 
	        } catch (MalformedURLException e) { 
	            e.printStackTrace(); 
	        } catch (IOException e) { 
	            e.printStackTrace(); 
	        } finally { 
	            try { 
	                if(is != null){ 
	                    is.close(); 
	                }                
	            } catch (IOException e) { 
	                e.printStackTrace(); 
	            } 
	            conn.disconnect();           
	        } 
	        return data; 
	    } 
	 
	 
	    /**
	    * 读取InputStream数据，转为byte[]数据类型
	    * @param is
	    * InputStream数据
	    * @return 返回byte[]数据
	    */
		public static byte[] readInputStream(InputStream is) { 
	        ByteArrayOutputStream baos = new ByteArrayOutputStream(); 
	        byte[] buffer = new byte[1024]; 
	        int length = -1; 
	        try { 
	            while ((length = is.read(buffer)) != -1) { 
	                baos.write(buffer, 0, length); 
	            } 
	            baos.flush(); 
	        } catch (IOException e) { 
	            e.printStackTrace(); 
	        } 
	        byte[] data = baos.toByteArray(); 
	        try { 
	            is.close(); 
	            baos.close(); 
	        } catch (IOException e) { 
	            e.printStackTrace(); 
	        } 
	        return data; 
	    } 
	
		// 给jpg添加文字
		public static boolean createStringMark(String filePath, String markContent,
				Color markContentColor, float qualNum, String outPath,String font) {
			log.info("自定义生成图片文字的字体");
			ImageIcon imgIcon = new ImageIcon(filePath);
			Image theImg = imgIcon.getImage();
			int width = theImg.getWidth(null) == -1 ? 200 : theImg.getWidth(null);
			int height = theImg.getHeight(null) == -1 ? 200 : theImg
					.getHeight(null);
			BufferedImage bimage = new BufferedImage(width, height,
					BufferedImage.TYPE_INT_RGB);
			Graphics2D g = bimage.createGraphics();
			g.setColor(markContentColor);
			g.setBackground(Color.red);
			g.drawImage(theImg, 0, 0, null);
			g.setFont(new Font(font, Font.BOLD, 60)); // 字体、字型、字号
			g.drawString(markContent, (width - markContent.length() * 55)/2, 420); // 画文字
			g.dispose();
			try {
				FileOutputStream out = new FileOutputStream(outPath); // 先用一个特定的输出文件名
				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
				JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(bimage);
				param.setQuality(qualNum, true);
				encoder.encode(bimage, param);
				out.close();
			} catch (Exception e) {
				return false;
			}
			return true;
		}
	
	
		// 给jpg添加文字
		public static boolean createStringMark(String filePath, String markContent,
				Color markContentColor, float qualNum, String outPath , int codeHigeht,int xstep) {
			log.info("执行图片生成文字");
			ImageIcon imgIcon = new ImageIcon(filePath);
			Image theImg = imgIcon.getImage();
			int width = theImg.getWidth(null) == -1 ? 200 : theImg.getWidth(null);
			int height = theImg.getHeight(null) == -1 ? 200 : theImg
					.getHeight(null);
			BufferedImage bimage = new BufferedImage(width, height,
					BufferedImage.TYPE_INT_RGB);
			Graphics2D g = bimage.createGraphics();
			g.setColor(markContentColor);
			g.setBackground(Color.red);
			g.drawImage(theImg, 0, 0, null);
			g.setFont(new Font("隶书", Font.BOLD, 60)); // 字体、字型、字号
			g.drawString(markContent, (width - markContent.length() * xstep)/2, codeHigeht); // 画文字
			g.dispose();
			try {
				FileOutputStream out = new FileOutputStream(outPath); // 先用一个特定的输出文件名
				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
				JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(bimage);
				param.setQuality(qualNum, true);
				encoder.encode(bimage, param);
				out.close();
			} catch (Exception e) {
				return false;
			}
			return true;
		}
	
		public static void main(String[] args){
			//*
				     
		    String targerPath = "D:\\merchant\\img_mark_icon.jpg";   
		    String temp = "D:\\merchant\\result.jpg";  
		    HCBase64.createStringMark(targerPath, "No:123456789192838", Color.WHITE, 200.0F, temp , 390,40);
			
			System.out.println("success");
		}
	
	
}
