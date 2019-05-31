package cn.online.nocard.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import cn.online.nocard.config.R;
import cn.online.nocard.web.model.Merch;

public class MerchUtil{
	public static Logger log = Logger.getLogger(R.LOG_SYS);
	
	private static List<Merch> merchList = new ArrayList<Merch>();
	
	public static synchronized  Object getMerchCode(String type,int nums,String orgId){
		if(type.equals("0")){//
			String merchId = null;
			
			Merch merchant = Merch.dao.findFirst("SELECT * FROM bd_merch where useStatus = ? AND merchId is not NULL  AND isExport = ?  AND InstNo = 'b5c6908d52a549bf82690b13141e9b45' ORDER BY UpdateTime DESC limit ? ", "0","0",1);
			if(!HCBoolean.isEmpty(merchant)){
				log.info("merchant:" + merchant.getUUID());
				merchId = merchant.getMerchId();
				boolean same = false;
				for(Merch merch : merchList){
					if(merch.getMerchId().equals(merchId)){
						same = true;
					}
				}
				if(!same){
					merchant.setUseStatus("2");
					merchant.setIsExport("1");
					merchant.setUpdateTime(new Date());
					log.info("从预生成的商户号中取一个商户号:" + merchant.getMerchId());
					merchant.update();
				}else{
					getMerchCode("0",0,null);
				}
			
			}
		
			
			Long count = Merch.dao.countUseMerchCode();
			if(count == 100 ){
				// 短信发送
				HCSms.sendCodeForOnlinepay(",预生成的商户号数量剩余"+ count + "个", "18922212009");
				log.info("预生成的商户号数量剩余"+ count + "个");
			}else if(count == 50 ){
				// 短信发送
				HCSms.sendCodeForOnlinepay(",预生成的商户号数量剩余"+ count + "个", "15902056849");
				log.info("预生成的商户号数量剩余"+ count + "个");
			}else if(count == 20 || count == 5){
				// 短信发送
				HCSms.sendCodeForOnlinepay(",预生成的商户号数量剩余"+ count + "个", "13632374595");
				log.info("预生成的商户号数量剩余"+ count + "个");
			}else{
				
			}
			return merchId;
		}else{
			merchList = Merch.dao.searchForCrePic("0", 15, nums,orgId);
			return merchList;
		}
	}
	public static void main(String[] args) throws UnsupportedEncodingException {
		System.out.println(URLEncoder.encode("埃菲尔", "utf-8"));
	}
}
