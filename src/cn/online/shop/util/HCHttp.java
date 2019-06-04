package cn.online.shop.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import cn.online.shop.config.R;
import net.sf.json.JSONObject;

/**
 * HTTP请求类
 * @date 2015年9月19日
 */
public class HCHttp {
	
	private static Logger log = Logger.getLogger(R.LOG_SYS);
	
	public static String post(String pushData,String pushUrl){
		BufferedReader reader =null;
		OutputStreamWriter paramout = null;
		StringBuffer data = new StringBuffer();
		try {
			URL connect = new URL(pushUrl);
			if(connect!=null){
	 			HttpURLConnection connection = (HttpURLConnection)connect.openConnection(); 
	 			
	 			if(connection!=null){
	 				connection.setRequestMethod("POST");  
	 				//设置是否向httpUrlConnection输出，因为这个是post请求，参数要放在 
    	 			//http正文内，因此需要设为true, 默认情况下是false;   
    	 			connection.setDoOutput(true);
    	 			//设置是否从httpUrlConnection读入，默认情况下是true; 
    	 			connection.setDoInput(true);
    	 			//Post 请求不能使用缓存    
    	 			connection.setUseCaches(false); 
		 	         
		 	        paramout = new OutputStreamWriter(  
		 	                connection.getOutputStream(),"UTF-8");  
		 	        paramout.write(pushData);  
		 	        paramout.flush();  
		 	        //<===注意，实际发送请求的代码段就在这里
		 	        reader = new BufferedReader(new InputStreamReader(  
		 	                connection.getInputStream(), "UTF-8"));
   		 	        String line;              
   		 	        while ((line = reader.readLine()) != null) {          
   		 	            data.append(line);            
   		 	        }  
	 			}
	        }
		} catch (Exception e) {
			//log.error("post方式发送数据异常.");
			e.printStackTrace();
			log.error(e.getMessage(),e);
		}finally{
			try {
				if(paramout!=null){
					paramout.close();
				}
				if(reader!=null){
					reader.close(); 
				}
			} catch (Exception ex) {
				log.error("post方式发送数据方法关闭流异常.", ex);
			}  
		}
		return data.toString();
	}
	public static String post(String pushData,String pushUrl,String encodeing) throws Exception{
		BufferedReader reader =null;
		OutputStreamWriter paramout = null;
		StringBuffer data = new StringBuffer();
		try {
			URL connect = new URL(pushUrl);
			if(connect!=null){
	 			HttpURLConnection connection = (HttpURLConnection)connect.openConnection(); 
	 			
	 			if(connection!=null){
	 				connection.setRequestMethod("POST");  
	 				//设置是否向httpUrlConnection输出，因为这个是post请求，参数要放在 
    	 			//http正文内，因此需要设为true, 默认情况下是false;   
    	 			connection.setDoOutput(true);
    	 			//设置是否从httpUrlConnection读入，默认情况下是true; 
    	 			connection.setDoInput(true);
    	 			//Post 请求不能使用缓存    
    	 			connection.setUseCaches(false); 
		 	         
		 	        paramout = new OutputStreamWriter(  
		 	                connection.getOutputStream(),encodeing);  
		 	        log.info("[发送数据]:"+pushData);
		 	        paramout.write(pushData);  
		 	        paramout.flush();  
		 	        //<===注意，实际发送请求的代码段就在这里
		 	        reader = new BufferedReader(new InputStreamReader(  
		 	                connection.getInputStream(), encodeing)); 
   		 	        String line;              
   		 	        while ((line = reader.readLine()) != null) {          
   		 	            data.append(line);            
   		 	        }  
   		 	        log.info("[返回数据]:"+data);
	 			}
	        }
		} catch (Exception e) {
			log.error("post方式发送数据异常.", e);
			throw e;
		}finally{
			try {
				if(paramout!=null){
					paramout.close();
				}
				if(reader!=null){
					reader.close(); 
				}
			} catch (Exception ex) {
				// TODO Auto-generated catch block
				log.error("post方式发送数据方法关闭流异常.", ex);
			}  
		}
		return data.toString();
	}
	/**
	 * 获取http传输内容
	 * @param pushData
	 * @param pushUrl
	 * @return
	 * @throws Exception
	 */
	public static String accept(HttpServletRequest request) throws Exception{
		BufferedReader reader =null;
		StringBuffer data = new StringBuffer();
		try {
 	        reader = new BufferedReader(new InputStreamReader(  
 	                request.getInputStream(), "UTF-8")); 
 	        String line;              
 	        while ((line = reader.readLine()) != null) {          
 	            data.append(line);            
 	        }  
 	        log.info("[接收数据]:"+data);
		} catch (Exception e) {
			log.error("获取http传输内容异常.", e);
			throw e;
		}finally{
			try {
				if(reader!=null){
					reader.close(); 
				}
			} catch (Exception ex) {
				// TODO Auto-generated catch block
				log.error("获取http传输内容方法关闭流异常.", ex);
			}  
		}
		return data.toString();
	}
	public static String form(Map<String, String> parameter,String url) {  
        URL u = null;  
        HttpURLConnection con = null;
        BufferedReader br = null;
        OutputStreamWriter osw = null;
        StringBuffer buffer = new StringBuffer(); 
        log.info("post表单提交开始.");
        try { 
        	// 构建请求参数  
            StringBuffer sb = new StringBuffer();
            if (parameter != null) {  
                for (String key : parameter.keySet()) {  
                    sb.append(key);  
                    sb.append("=");  
                    sb.append(parameter.get(key));  
                    sb.append("&");  
                }
            }
            log.info("表单提交_url:" + url);
            log.info("表单提交_data:" + sb.substring(0, sb.length() - 1));
            // 尝试发送请求  
            u = new URL(url);  
            con = (HttpURLConnection) u.openConnection();  
            //// POST 只能为大写，严格限制，post会不识别  
            con.setRequestMethod("POST");  
            con.setDoOutput(true);  
            con.setDoInput(true);  
            con.setUseCaches(false);  
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");  
            osw = new OutputStreamWriter(con.getOutputStream(), "UTF-8");  
            osw.write(sb.toString());  
            osw.flush();  
            osw.close();
            //接收返回
            br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            //一定要有返回值，否则无法把请求发送给server端。
            String line;              
 	        while ((line = br.readLine()) != null) {          
 	        	buffer.append(line);            
 	        }
 	       log.info("[表单提交返回数据]:"+buffer.toString());
        } catch (Exception e) {  
            log.error("form表单post提交异常.", e);
        } finally {  
            if (con != null) {  
                con.disconnect();  
            }
            try {
            	if(osw !=null ){
                	osw.close();
                }
            	if(br != null){
            		br.close();
            	}
			} catch (Exception e2) {
				log.error("form表单post提交流关闭异常.", e2);
			}
            
        }
        return buffer.toString();  
    }  
	/**
	 * 获取服务器IP地址
	 * @return
	 */
	public static String getIp() {
		try {
			final String computor = InetAddress.getLocalHost().toString();
			String ip = computor.substring(computor.indexOf("/") + 1);
			return ip;
		} catch (Exception e) {
			log.info("获取本地IP异常.", e);
			return "127.0.0.1";
		}
	}
	
	

	/**
	 * 发起https请求并获取结果
	 * @param requestUrl 请求地址
	 * @param requestMethod 请求方式（GET、POST）
	 * @param outputStr 提交的数据
	 * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)
	 */
	public static JSONObject httpRequest(String requestUrl, String requestMethod, String outputStr) {
		OutputStream outputStream = null;
		BufferedReader bufferedReader = null;
		InputStreamReader inputStreamReader = null;
		InputStream inputStream = null;
		JSONObject jsonObject = null;
		StringBuffer buffer = new StringBuffer();
		
		try {

			URL url = new URL(requestUrl);
			HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();
			/*
			httpUrlConn.setConnectTimeout(1000);
			httpUrlConn.setReadTimeout(2000);
			//*/
			
			httpUrlConn.setDoOutput(true);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			// 设置请求方式（GET/POST）
			httpUrlConn.setRequestMethod(requestMethod);

			if ("GET".equalsIgnoreCase(requestMethod))
				httpUrlConn.connect();

			// 当有数据需要提交时
			if (null != outputStr) {
				outputStream = httpUrlConn.getOutputStream();
				// 注意编码格式，防止中文乱码
				outputStream.write(outputStr.getBytes("UTF-8"));
			}
			log.info("[发送数据]:"+outputStr);
			// 将返回的输入流转换成字符串
			inputStream = httpUrlConn.getInputStream();
			inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			bufferedReader = new BufferedReader(inputStreamReader);

			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			log.info("[返回数据]:"+buffer);
			httpUrlConn.disconnect();
			
			if(HCBoolean.isEmpty(buffer.toString()))
			{
				return null;
			}
			
			jsonObject = JSONObject.fromObject(buffer.toString());
		} catch (ConnectException ce) {
			log.error("Weixin server connection timed out.",ce);
		} catch (Exception e) {
			log.error("https request error:{}",e);
			log.error(e.getMessage(), e);
		} finally {
			if(null!=outputStream){
				try {
					outputStream.close();
				} catch (IOException e) {
					log.error(e.getMessage(),e);
				}
			}
			if(null!=bufferedReader){
				try {
					bufferedReader.close();
				} catch (IOException e) {
					log.error(e.getMessage(),e);
				}
			}
			if(null!=inputStreamReader){
				try {
					inputStreamReader.close();
				} catch (IOException e) {
					log.error(e.getMessage(),e);
				}
			}
			if(null!=inputStream){
				try {
					inputStream.close();
					inputStream = null;
				} catch (IOException e) {
					log.error(e.getMessage(),e);
				}
			}
		}
		return jsonObject;
	}
	
	
	 /**
	 * 发起https请求并获取结果
	 * @param requestUrl 请求地址
	 * @param requestMethod 请求方式（GET、POST）
	 * @param outputStr 提交的数据
	 * @return
	 */
	public static String httpReq(String requestUrl, String requestMethod, String outputStr) {
		OutputStream outputStream = null;
		BufferedReader bufferedReader = null;
		InputStreamReader inputStreamReader = null;
		InputStream inputStream = null;
		StringBuffer buffer = new StringBuffer();
		
		try {
	
			URL url = new URL(requestUrl);
			HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();
			/*
			httpUrlConn.setConnectTimeout(3000);
			httpUrlConn.setReadTimeout(5000);
			//*/
			
			httpUrlConn.setDoOutput(true);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			// 设置请求方式（GET/POST）
			httpUrlConn.setRequestMethod(requestMethod);
	
			if ("GET".equalsIgnoreCase(requestMethod))
				httpUrlConn.connect();
	
			// 当有数据需要提交时
			if (null != outputStr) {
				log.info("[发送数据]：" + outputStr);
				outputStream = httpUrlConn.getOutputStream();
				// 注意编码格式，防止中文乱码
				outputStream.write(outputStr.getBytes("UTF-8"));
			}
	
			// 将返回的输入流转换成字符串
			inputStream = httpUrlConn.getInputStream();
			inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			bufferedReader = new BufferedReader(inputStreamReader);
	
			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			httpUrlConn.disconnect();
			
			if(HCBoolean.isEmpty(buffer.toString()))
			{
				return null;
			}
			log.info("[返回数据]：" + buffer.toString());
		} catch (ConnectException ce) {
			log.error("Weixin server connection timed out.",ce);
		} catch (Exception e) {
			log.error("https request error:{}",e);
			log.error(e.getMessage(), e);
		} finally {
			if(null!=outputStream){
				
				try {
					outputStream.close();
				} catch (IOException e) {
					log.error(e.getMessage(),e);
				}
			}
			if(null!=bufferedReader){
				try {
					bufferedReader.close();
				} catch (IOException e) {
					log.error(e.getMessage(),e);
				}
			}
			if(null!=inputStreamReader){
				try {
					inputStreamReader.close();
				} catch (IOException e) {
					log.error(e.getMessage(),e);
				}
			}
			if(null!=inputStream){
				try {
					inputStream.close();
					inputStream = null;
				} catch (IOException e) {
					log.error(e.getMessage(),e);
				}
			}
		}
		return buffer.toString();
	}

	/**
	 * https 发送post请求
	 * @param ip 服务端ip
	 * @param nvps 发送的参数
	 * @return string 
	 * 
	 * @throws 
	 * 
	 */
	public static String postWithHttps(String ip,List<BasicNameValuePair> nvps) throws Exception{
		// 发送HTTP请求
		DefaultHttpClient httpClient = new SSLClient();
        HttpPost postMethod = new HttpPost(ip);
        postMethod.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));
        HttpResponse resp = httpClient.execute(postMethod);       
        // 检查渠道状态：HTTP状态
        if(200 != resp.getStatusLine().getStatusCode()) {
        	throw  new  Exception("HTTP状态错误 " +resp.getStatusLine().getStatusCode()) ;  	
        }
        String str = EntityUtils.toString(resp.getEntity(), "UTF-8");
        return str;
	}

	/**
	 * post请求  
	 * @param url 请求的地址
	 * @param json 发送的 json格式的数据
	 * @param json 格式数据 
	 */
	 public static JSONObject doPost(String url,String json){
	    DefaultHttpClient client = new DefaultHttpClient();
	    HttpPost post = new HttpPost(url);		  
	    try {
	      StringEntity s = new StringEntity(json,"utf-8");
	      s.setContentEncoding("UTF-8");
	      s.setContentType("application/json");//发送json格式的数据需要设置contentType
	      post.setEntity(s);
	      //发送请求
	      log.info("[发送数据]：" + json);
	      HttpResponse res = client.execute(post);	      
	      if(res.getStatusLine().getStatusCode() != HttpStatus.SC_OK){	    	  
	    	  throw  new  Exception("HTTP状态错误 " +res.getStatusLine().getStatusCode()) ;
	      }	    
	      String result =EntityUtils.toString(res.getEntity(), "utf-8");
	      log.info("[返回数据]：" + result);
	      return JSONObject.fromObject(result);
	      
	    } catch (Exception e) {
	    	
	      throw new RuntimeException(e);
	    }
	  	   
	}
}
