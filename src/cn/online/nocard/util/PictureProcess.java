package cn.online.nocard.util;

import java.awt.AlphaComposite;
import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.Shape;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

import com.swetake.util.Qrcode;

/*
 * 处理图片的工具类
 */
public class PictureProcess {
	
	 // LOGO宽度  
    private static final int WIDTH = 200;  
    // LOGO高度  
    private static final int HEIGHT = 200; 
    /**
     * 创建QRCode图形并保存到指定路径. 
     * 
     * @param content 二维码内容 
     * @param imgPath 二维码保存的路径
     * @param logoPath logo的路径    
     * @param lineWidth 线宽，宽度越大图形越大，默认为4 
     * @param blankWidth  图形空白区宽度，应该设为线宽的倍数或0 
     * @param needCompress  是否压缩
     */
    public static void CreateQrcodeToImgPath(String content,String imgPath,String logoPath,Integer lineWidth,Integer blankWidth,boolean needCompress) {   
    		
    	BufferedImage bi = CreateQrcode(content,logoPath,lineWidth,blankWidth,needCompress);
    	
    	if(bi != null){
    		 File imgFile = new File(imgPath);
    		 if(!imgFile.getParentFile().exists()){
             	//log.debug(dist + "目录不存在，创建该目录");	            	
    			 imgFile.getParentFile().mkdirs();            	
             }
    		// 生成二维码QRCode图片
    		try {
				ImageIO.write(bi, "png", imgFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}
       
			
        
	}
    /**     
     ** 创建QRCode图形并保存到指定路径. 
     *  
     * @param content   二维码内容 
     * @param logoPath logo路径 为空则表示不添加logo
     * @param errorCorrection  纠错率，包括L（7%）、M（15%）、Q（25%）和H（30%），默认为M级 
     * @param encodeMode  编码模式，包括A、B、N，默认为B 
     * @param version  版本号，介于1-40。版本越高信息容量越大，默认可设为5<br/> 
     *            版本5，37*37模块，信息容量[L级：864；M级：688；Q级：496；H级：368]<br/> 
     *            更多可参考：http://www.qrcode.com/en/vertable1.html 
     * @param lineWidth 线宽，宽度越大图形越大，默认为4 
     * @param blankWidth  图形空白区宽度，应该设为线宽的倍数或0 
     * @return BufferedImage 
     */     
    public static BufferedImage CreateQrcode(String content,String logoPath, Integer lineWidth, Integer blankWidth,boolean needCompress) { 
    	
    	Qrcode qrcode = new Qrcode();   	  
        // 纠错率，L, Q, H, M（默认）  
        qrcode.setQrcodeErrorCorrect('M');  
        // 模式，A, N, B（默认）  
        qrcode.setQrcodeEncodeMode('B');  
        // 版本，1-40  
        qrcode.setQrcodeVersion(7);        
  
        BufferedImage bi = null;  
        Graphics2D g = null;  
  
        try {  
            byte[] d = content.getBytes("gb2312");    
            boolean[][] b = qrcode.calQrcode(d);  
  
            int qrcodeDataLength = b.length;  
            // 图形宽度  
            int imageLength = qrcodeDataLength * lineWidth + blankWidth * 2; 
            bi = new BufferedImage(imageLength, imageLength, BufferedImage.TYPE_INT_RGB); 
            
            g = bi.createGraphics();  
            g.setBackground(Color.WHITE);  
            g.clearRect(0, 0, imageLength, imageLength);  
            g.setColor(Color.BLACK);  
  
            for (int i = 0; i < b.length; i++) {  
                for (int j = 0; j < b.length; j++) {  
                    if (b[j][i]) {  
                    	g.fillRect(j * lineWidth + blankWidth, i * lineWidth  
                                + blankWidth, lineWidth, lineWidth);  
                    }  
                }  
            }  
            if(logoPath != null && logoPath !=""){
            	 //插入logo
                PictureProcess.insertImage(bi, logoPath, imageLength,needCompress);
            }
           
        } catch (Exception e) { 
        	
            e.printStackTrace();  
           
        } finally {  
            if (g != null) {  
                g.dispose();  
            }  
            if (bi != null) {  
                bi.flush();  
            }        
        }        
      
        return bi;  
    }  
    
    /** 
     * 插入LOGO   
     * @param source   二维码图片 
     * @param imgPath  LOGO图片地址 
     * @param needCompress 是否压缩 
     * @param qrWidth 二维码宽度
     * @throws Exception 
     */  
    private static void insertImage(BufferedImage source, String imgPath,int qrWidth,boolean needCompress) 
    		throws Exception {  
        File file = new File(imgPath);  
        if (!file.exists()) {  
            System.err.println(""+imgPath+"   该文件不存在！");  
            return;  
        }  
        Image src = ImageIO.read(new File(imgPath));  
        int width = src.getWidth(null);  
        int height = src.getHeight(null);  
        if (needCompress) { // 压缩LOGO  
            if (width > WIDTH) {  
                width = WIDTH;  
            }  
            if (height > HEIGHT) {  
                height = HEIGHT;  
            }  
            Image image = src.getScaledInstance(width, height,  
                    Image.SCALE_SMOOTH);  
            BufferedImage tag = new BufferedImage(width, height,  
                    BufferedImage.TYPE_INT_RGB);  
            Graphics g = tag.getGraphics();  
            g.drawImage(image, 0, 0, null); // 绘制缩小后的图  
            g.dispose();  
            src = image;  
        }  
        // 插入LOGO  
        Graphics2D graph = source.createGraphics();  
        int x = (qrWidth - width) / 2;  
        int y = (qrWidth - height) / 2;  
        graph.drawImage(src, x, y, width, height, null);        
        Shape shape = new RoundRectangle2D.Float(x, y, width, width, 6, 6);  
        graph.setStroke(new BasicStroke(0f));  
        graph.draw(shape);  
        graph.dispose();  
    }  
    
    
    /**  
     * 给图片添加水印  
     * @param iconPath 水印图片路径  
     * @param srcImgPath 源图片路径  
     * @param targerPath 目标图片路径  
     */  
    public static void markImageByIcon(String iconPath, String srcImgPath,   
            String targerPath, int width , int height) {   
        markImageByIcon(iconPath, srcImgPath, targerPath, null , width , height);   
    }   
    /**  
     * 给图片添加水印、可设置水印图片旋转角度  
     * @param iconPath 水印图片路径  
     * @param srcImgPath 源图片路径  
     * @param targerPath 目标图片路径  
     * @param degree 水印图片旋转角度  
     */  
    public static void markImageByIcon(String iconPath, String srcImgPath,   
            String targerPath, Integer degree , int width , int height) {   
        OutputStream os = null;   
        try {   
            Image srcImg = ImageIO.read(new File(srcImgPath));   
  
            BufferedImage buffImg = new BufferedImage(srcImg.getWidth(null),   
                    srcImg.getHeight(null), BufferedImage.TYPE_INT_RGB);   
  
            // 得到画笔对象               
            Graphics2D g = buffImg.createGraphics();   
  
            // 设置对线段的锯齿状边缘处理   
            g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,   
                    RenderingHints.VALUE_INTERPOLATION_BILINEAR);   
  
            g.drawImage(srcImg.getScaledInstance(srcImg.getWidth(null), srcImg   
                    .getHeight(null), Image.SCALE_SMOOTH), 0, 0, null);   
  
            if (null != degree) {   
                // 设置水印旋转   
                g.rotate(Math.toRadians(degree),   
                        (double) buffImg.getWidth() / 2, (double) buffImg   
                                .getHeight() / 2);   
            }   
  
            // 水印图象的路径 水印一般为gif或者png的，这样可设置透明度   
            ImageIcon imgIcon = new ImageIcon(iconPath);   
  
            // 得到Image对象。   
            Image img = imgIcon.getImage();   
  
            float alpha = 1f; // 透明度 0.5半透明  1 不透明  
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));   
  
            // 表示水印图片的位置   
            Integer x = srcImg.getWidth(null)/2 -imgIcon.getIconWidth()/2 + width;
            Integer y = srcImg.getHeight(null)/2-imgIcon.getIconHeight()/2 - height;             
            g.drawImage(img, x, y, null);             
  
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER));   
  
            g.dispose();   
  
            os = new FileOutputStream(targerPath);   
  
            // 生成图片   
            ImageIO.write(buffImg, "jpg", os);   
         
        } catch (Exception e) {   
            e.printStackTrace();   
        } finally {   
            try {   
                if (null != os)   
                    os.close();   
            } catch (Exception e) {   
                e.printStackTrace();   
            }   
        }   
    }   
    
    public static void main(String[] args) {   
    
    	//二维码保存的路径
    	String qrPath="D:\\merchant\\qr.png";
    	//logo图片
    	String logo = "D:\\merchant\\logo.png";
    	//生成二维码图片
		//PictureProcess.CreateQrcodeToImgPath("http://hyf.hi-card.cn/hicardqrcode/qrCode/toPay?serialNo=104401569113977",qrPath,logo,16,16,false);	
    	PictureProcess.CreateQrcodeToImgPath("http://hyf.hi-card.cn/hicardqrcode/qrCode/toPay?serialNo=104401569113977",qrPath,logo,14,14,false);	

		//*
		String srcImgPath = "D:\\merchant\\backgroup.jpg"; 	     
	    String targerPath = "D:\\merchant\\img_mark_icon.jpg";   
		// 二维码当水印添加到图片
		PictureProcess.markImageByIcon(qrPath, srcImgPath, targerPath, 1 , 25);//*/	
		
		//添加商户号到图片
	    HCBase64.createStringMark(targerPath, "No.09384998", Color.WHITE, 200.0F, targerPath , 1450,40);//1500);

		System.out.println("success");
	
    }   
}
