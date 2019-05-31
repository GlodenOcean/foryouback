package cn.online.nocard.web.model.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

/**   
 * @Description: 当天订单实体
 * @author: ocean
 * @date: 2017年4月26日 上午11:08:10 
 * @version: V1.0   
 */
@SuppressWarnings("serial")
public abstract class BaseOrder<M extends BaseOrder<M>> extends Model<M> implements IBean {
	
	public void setTRANS_UUID(java.lang.String TRANS_UUID) {
		set("TRANS_UUID", TRANS_UUID);
	}

	public java.lang.String getTRANS_UUID() {
		return get("TRANS_UUID");
	}
	
	public void setOrderDate(java.lang.String OrderDate) {
		set("OrderDate", OrderDate);
	}
	
	public java.lang.String getOrderDate() {
		return get("OrderDate");
	}
	
	/**
	 * 订单时间
	 * @param transTime
	 */
	public void setTransTime(java.util.Date TransTime) {
		set("TransTime", TransTime);
	}
	
	public java.util.Date getTransTime() {
		return get("TransTime");
	}
	
	public void setTransName(java.lang.String TransName) {
		set("TransName", TransName);
	}
	
	public java.lang.String getTransName() {
		return get("TransName");
	}
	
	public void setOrderNo(java.lang.String OrderNo) {
		set("OrderNo", OrderNo);
	}
	
	public java.lang.String getOrderNo() {
		return get("OrderNo");
	}
	
	public void setMerchOrderNo(java.lang.String MerchOrderNo) {
		set("MerchOrderNo", MerchOrderNo);
	}
	
	public java.lang.String getMerchOrderNo() {
		return get("MerchOrderNo");
	}
	
	public void setUpChOrderNo(java.lang.String UpChOrderNo) {
		set("UpChOrderNo", UpChOrderNo);
	}
	
	public java.lang.String getUpChOrderNo() {
		return get("UpChOrderNo");
	}
	
	public void setMerchName(java.lang.String MerchName) {
		set("MerchName", MerchName);
	}
	
	public java.lang.String getMerchName() {
		return get("MerchName");
	}
	
	public void setMerchId(java.lang.String MerchId) {
		set("MerchId", MerchId);
	}
	
	public java.lang.String getMerchId() {
		return get("MerchId");
	}
	
	public void setOrderStatus(java.lang.String OrderStatus) {
		set("OrderStatus", OrderStatus);
	}
	
	public java.lang.String getOrderStatus() {
		return get("OrderStatus");
	}
	
	public void setOrderErrorMsg(java.lang.String OrderErrorMsg) {
		set("OrderErrorMsg", OrderErrorMsg);
	}
	
	public java.lang.String getOrderErrorMsg() {
		return get("OrderErrorMsg");
	}
	
	public void setUpCallBackStaus(java.lang.String UpCallBackStaus) {
		set("UpCallBackStaus", UpCallBackStaus);
	}
	
	public java.lang.String getUpCallBackStaus() {
		return get("UpCallBackStaus");
	}
	
	public void setMerchCallBackUrl(java.lang.String MerchCallBackUrl) {
		set("MerchCallBackUrl", MerchCallBackUrl);
	}
	
	public java.lang.String getMerchCallBackUrl() {
		return get("MerchCallBackUrl");
	}
	
	public void setMerchCallBackStaus(java.lang.String MerchCallBackStaus) {
		set("MerchCallBackStaus", MerchCallBackStaus);
	}
	
	public java.lang.String getMerchCallBackStaus() {
		return get("MerchCallBackStaus");
	}
	
	public void setMerchCallBackCount(java.lang.Integer MerchCallBackCount) {
		set("MerchCallBackCount", MerchCallBackCount);
	}
	
	public java.lang.Integer getMerchCallBackCount() {
		return get("MerchCallBackCount");
	}
	
	public void setPayType(java.lang.String PayType) {
		set("PayType", PayType);
	}
	
	public java.lang.String getPayType() {
		return get("PayType");
	}
	
	public void setIsT0(java.lang.String IsT0) {
		set("IsT0", IsT0);
	}
	
	public java.lang.String getIsT0() {
		return get("IsT0");
	}
	
	public void setT0Status(java.lang.String T0Status) {
		set("T0Status", T0Status);
	}
	
	public java.lang.String getT0Status() {
		return get("T0Status");
	}
	
	public void setChSettleDate(java.lang.String ChSettleDate) {
		set("ChSettleDate", ChSettleDate);
	}
	
	public java.lang.String getChSettleDate() {
		return get("ChSettleDate");
	}
	
	public void setChName(java.lang.String ChName) {
		set("ChName", ChName);
	}
	
	public java.lang.String getChName() {
		return get("ChName");
	}
	
	public void setChId(java.lang.String ChId) {
		set("ChId", ChId);
	}
	
	public java.lang.String getChId() {
		return get("ChId");
	}
	
	public void setChInstNo(java.lang.String ChInstNo) {
		set("ChInstNo", ChInstNo);
	}
	
	public java.lang.String getChInstNo() {
		return get("ChInstNo");
	}
	
	public void setChMerchId(java.lang.String ChMerchId) {
		set("ChMerchId", ChMerchId);
	}
	
	public java.lang.String getChMerchId() {
		return get("ChMerchId");
	}
	
	public void setChMerName(java.lang.String ChMerName) {
		set("ChMerName", ChMerName);
	}
	
	public java.lang.String getChMerName() {
		return get("ChMerName");
	}
	
	public void setChTransName(java.lang.String ChTransName) {
		set("ChTransName", ChTransName);
	}
	
	public java.lang.String getChTransName() {
		return get("ChTransName");
	}
	
	public void setChReCode(java.lang.String ChReCode) {
		set("ChReCode", ChReCode);
	}
	
	public java.lang.String getChReCode() {
		return get("ChReCode");
	}
	
	public void setChSubMerId(java.lang.String ChSubMerId) {
		set("ChSubMerId", ChSubMerId);
	}
	
	public java.lang.String getChSubMerId() {
		return get("ChSubMerId");
	}
	
	public void setChSubMerName(java.lang.String ChSubMerName) {
		set("ChSubMerName", ChSubMerName);
	}
	
	public java.lang.String getChSubMerName() {
		return get("ChSubMerName");
	}
	
	public void setOpenid(java.lang.String Openid) {
		set("Openid", Openid);
	}
	
	public java.lang.String getOpenid() {
		return get("Openid");
	}
	
	public void setChGraMerId(java.lang.String ChGraMerId) {
		set("ChGraMerId", ChGraMerId);
	}
	
	public java.lang.String getChGraMerId() {
		return get("ChGraMerId");
	}
	
	public void setChGraMerName(java.lang.String ChGraMerName) {
		set("ChGraMerName", ChGraMerName);
	}
	
	public java.lang.String getChGraMerName() {
		return get("ChGraMerName");
	}
	
	public void setOmRt(java.lang.String OmRt) {
		set("OmRt", OmRt);
	}
	
	public java.lang.String getOmRt() {
		return get("OmRt");
	}
	
	public void setOmType(java.lang.String OmType) {
		set("OmType", OmType);
	}
	
	public java.lang.String getOmType() {
		return get("OmType");
	}
	
	public void setOmAdd(java.lang.String OmAdd) {
		set("OmAdd", OmAdd);
	}
	
	public java.lang.String getOmAdd() {
		return get("OmAdd");
	}
	
	public void setBankType(java.lang.String BankType) {
		set("BankType", BankType);
	}
	
	public java.lang.String getBankType() {
		return get("BankType");
	}
	
	public void setTradeNo(java.lang.String TradeNo) {
		set("TradeNo", TradeNo);
	}
	
	public java.lang.String getTradeNo() {
		return get("TradeNo");
	}
	
	public void setChnlUserId(java.lang.String ChnlUserId) {
		set("ChnlUserId", ChnlUserId);
	}
	
	public java.lang.String getChnlUserId() {
		return get("ChnlUserId");
	}
	
	public void setqrCode(java.lang.String qrCode) {
		set("qrCode", qrCode);
	}
	
	public java.lang.String getqrCode() {
		return get("qrCode");
	}
	
	public void setAuthCode(java.lang.String AuthCode) {
		set("AuthCode", AuthCode);
	}
	
	public java.lang.String getAuthCode() {
		return get("AuthCode");
	}
	
	public void setAmount(java.lang.Double Amount) {
		set("Amount", Amount);
	}
	
	public java.lang.Double getAmount() {
		return get("Amount");
	}
	
	public void setB4amt(java.lang.Double b4_amt) {
		set("b4_amt", b4_amt);
	}
	
	public java.lang.String getB4amt() {
		return get("b4_amt");
	}
	
	public void setMCC(java.lang.String MCC) {
		set("MCC", MCC);
	}
	
	public java.lang.String getMCC() {
		return get("MCC");
	}
	
	public void setUpTransSSN(java.lang.String UpTransSSN) {
		set("UpTransSSN", UpTransSSN);
	}
	
	public java.lang.String getUpTransSSN() {
		return get("UpTransSSN");
	}
	
	public void setPayAccNo(java.lang.String PayAccNo) {
		set("PayAccNo", PayAccNo);
	}
	
	public java.lang.String getPayAccNo() {
		return get("PayAccNo");
	}
	
	public void setClearPrimaryKey(java.lang.String ClearPrimaryKey) {
		set("ClearPrimaryKey", ClearPrimaryKey);
	}
	
	public java.lang.String getClearPrimaryKey() {
		return get("ClearPrimaryKey");
	}
	
	public void setPayCretNum(java.lang.String PayCretNum) {
		set("PayCretNum", PayCretNum);
	}
	
	public java.lang.String getPayCretNum() {
		return get("PayCretNum");
	}
	
	public void setPayerInfo(java.lang.String PayerInfo) {
		set("PayerInfo", PayerInfo);
	}
	
	public java.lang.String getPayerInfo() {
		return get("PayerInfo");
	}
	
	public void setComInfo(java.lang.String ComInfo) {
		set("ComInfo", ComInfo);
	}
	
	public java.lang.String getComInfo() {
		return get("ComInfo");
	}
	
	public void setInvoiceInfo(java.lang.String InvoiceInfo) {
		set("InvoiceInfo", InvoiceInfo);
	}
	
	public java.lang.String getInvoiceInfo() {
		return get("InvoiceInfo");
	}
	
	public void setReqVersion(java.lang.String ReqVersion) {
		set("ReqVersion", ReqVersion);
	}
	
	public java.lang.String getReqVersion() {
		return get("ReqVersion");
	}
	
	public void setTransDate(java.util.Date transDate) {
		set("trans_date", transDate);
	}
	
	public java.util.Date getTransDate() {
		return get("trans_date");
	}
	
	/**
	 * 交易时间
	 * @param transTime
	 */
	public void setTransTime2(java.util.Date transTime) {
		set("trans_time", transTime);
	}
	
	public java.util.Date getTransTime2() {
		return get("trans_time");
	}
	
	public void setSendInst(java.lang.String SendInst) {
		set("SendInst", SendInst);
	}
	
	public java.lang.String getSendInst() {
		return get("SendInst");
	}
	
	public void setAccInst(java.lang.String AccInst) {
		set("AccInst", AccInst);
	}
	
	public java.lang.String getAccInst() {
		return get("AccInst");
	}
	
	public void setReMark(java.lang.String ReMark) {
		set("ReMark", ReMark);
	}
	
	public java.lang.String getReMark() {
		return get("ReMark");
	}
	
	public void setLastQueryTime(java.util.Date LastQueryTime) {
		set("LastQueryTime", LastQueryTime);
	}
	
	public java.util.Date getLastQueryTime() {
		return get("LastQueryTime");
	}
	
	public void setPayTime(java.util.Date PayTime) {
		set("PayTime", PayTime);
	}
	
	public java.util.Date getPayTime() {
		return get("PayTime");
	}

	public void setCardType(java.lang.String CardType) {
		set("CardType", CardType);
	}
	
	public java.lang.String getCardType() {
		return get("CardType");
	}
	
	public void setCreateHost(java.lang.String CreateHost) {
		set("CreateHost", CreateHost);
	}
	
	public java.lang.String getCreateHost() {
		return get("CreateHost");
	}
	
	public void setSignKey(java.lang.String SignKey) {
		set("SignKey", SignKey);
	}
	
	public java.lang.String getSignKey() {
		return get("SignKey");
	}
	
	public void setBussID(java.lang.String BussID) {
		set("BussID", BussID);
	}
	
	public java.lang.String getBussID() {
		return get("BussID");
	}
	
	public void setQueryCount(java.lang.String QueryCount) {
		set("QueryCount", QueryCount);
	}
	
	public java.lang.String getQueryCount() {
		return get("QueryCount");
	}

	public void setGivingT0(java.lang.String GivingT0) {
		set("GivingT0", GivingT0);
	}
	
	public java.lang.String getGivingT0() {
		return get("GivingT0");
	}
	
	public void setTermSsn(java.lang.String TermSsn) {
		set("TermSsn", TermSsn);
	}
	
	public java.lang.String getTermSsn() {
		return get("TermSsn");
	}
	
	public void setHYFSyncFalg(java.lang.String HYFSyncFalg) {
		set("HYFSyncFalg", HYFSyncFalg);
	}
	
	public java.lang.String getHYFSyncFalg() {
		return get("HYFSyncFalg");
	}
	
	public void setUpCallBackTime(java.lang.String UpCallBackTime) {
		set("UpCallBackTime", UpCallBackTime);
	}
	
	public java.lang.String getUpCallBackTime() {
		return get("UpCallBackTime");
	}
	
	public void setGoodNames(java.lang.String goodNames) {
		set("goodNames", goodNames);
	}
	
	public java.lang.String getGoodNames() {
		return get("goodNames");
	}
	
	public void setTransType(java.lang.String TransType) {
		set("TransType", TransType);
	}
	
	public java.lang.String getTransType() {
		return get("TransType");
	}
	
	public void setInCommType(java.lang.String InCommType) {
		set("InCommType", InCommType);
	}
	
	public java.lang.String getInCommType() {
		return get("InCommType");
	}
	
	public void setPayforOtherCardNo(java.lang.String PayforOtherCardNo) {
		set("PayforOtherCardNo", PayforOtherCardNo);
	}
	
	public java.lang.String getPayforOtherCardNo() {
		return get("PayforOtherCardNo");
	}
	
	public void setPayforOtherName(java.lang.String PayforOtherName) {
		set("PayforOtherName", PayforOtherName);
	}
	
	public java.lang.String getPayforOtherName() {
		return get("PayforOtherName");
	}
	
	public void setFee(java.lang.Double Fee) {
		set("Fee", Fee);
	}
	
	public java.lang.Double getFee() {
		return get("Fee");
	}
	
	public void setFeeDes(java.lang.String Fee_des) {
		set("Fee_des", Fee_des);
	}
	
	public java.lang.String getFeeDes() {
		return get("Fee_des");
	}

	public void setOriOrderNo(java.lang.String OriOrderNo) {
		set("OriOrderNo", OriOrderNo);
	}
	
	public java.lang.String getOriOrderNo() {
		return get("OriOrderNo");
	}
	
	public void setOriMerchOrderNo(java.lang.String OriMerchOrderNo) {
		set("OriMerchOrderNo", OriMerchOrderNo);
	}
	
	public java.lang.String getOriMerchOrderNo() {
		return get("OriMerchOrderNo");
	}
	
	public void setBankName(java.lang.String BankName) {
		set("BankName", BankName);
	}
	
	public java.lang.String getBankName() {
		return get("BankName");
	}
	
	public void setBankShortName(java.lang.String BankShortName) {
		set("BankShortName", BankShortName);
	}
	
	public java.lang.String getBankShortName() {
		return get("BankShortName");
	}
	
	public void setLineNumber(java.lang.String LineNumber) {
		set("LineNumber", LineNumber);
	}
	
	public java.lang.String getLineNumber() {
		return get("LineNumber");
	}
	
	public void setProvince(java.lang.String Province) {
		set("Province", Province);
	}
	
	public java.lang.String getProvince() {
		return get("Province");
	}
	
	public void setCity(java.lang.String City) {
		set("City", City);
	}
	
	public java.lang.String getCity() {
		return get("City");
	}
	
	public void setHandMarks(java.lang.String HandMarks) {
		set("HandMarks", HandMarks);
	}
	
	public java.lang.String getHandMarks() {
		return get("HandMarks");
	}
	
}
