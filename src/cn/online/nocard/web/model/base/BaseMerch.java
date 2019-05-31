package cn.online.nocard.web.model.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

/**
 * @Description: 商户表实体
 * @author: ocean
 * @date: 2017年4月24日 下午5:49:58
 * @version: V1.0
 */
@SuppressWarnings("serial")
public abstract class BaseMerch<M extends BaseMerch<M>> extends Model<M> implements IBean {

	public void setUUID(java.lang.String UUID) {
		set("UUID", UUID);
	}

	public java.lang.String getUUID() {
		return get("UUID");
	}

	public void setInstNo(java.lang.String InstNo) {
		set("InstNo", InstNo);
	}

	public java.lang.String getInstNo() {
		return get("InstNo");
	}

	public void setMerchId(java.lang.String MerchId) {
		set("MerchId", MerchId);
	}

	public java.lang.String getMerchId() {
		return get("MerchId");
	}

	public void setTermId(java.lang.String TermId) {
		set("TermId", TermId);
	}

	public java.lang.String getTermId() {
		return get("TermId");
	}

	public void setMerchName(java.lang.String MerchName) {
		set("MerchName", MerchName);
	}

	public java.lang.String getMerchName() {
		return get("MerchName");
	}

	public void setBusiness(java.lang.String Business) {
		set("Business", Business);
	}

	public java.lang.String getBusiness() {
		return get("Business");
	}

	public void setUpMerchId(java.lang.String UpMerchId) {
		set("UpMerchId", UpMerchId);
	}

	public java.lang.String getUpMerchId() {
		return get("UpMerchId");
	}

	public void setMerchStatus(java.lang.String MerchStatus) {
		set("MerchStatus", MerchStatus);
	}

	public java.lang.String getMerchStatus() {
		return get("MerchStatus");
	}

	public void setMerchAddr(java.lang.String MerchAddr) {
		set("MerchAddr", MerchAddr);
	}

	public java.lang.String getMerchAddr() {
		return get("MerchAddr");
	}

	public void setMerchTel(java.lang.String MerchTel) {
		set("MerchTel", MerchTel);
	}

	public java.lang.String getMerchTel() {
		return get("MerchTel");
	}

	public void setLinkName(java.lang.String LinkName) {
		set("LinkName", LinkName);
	}

	public java.lang.String getLinkName() {
		return get("LinkName");
	}

	public void setEncKey(java.lang.String EncKey) {
		set("EncKey", EncKey);
	}

	public java.lang.String getEncKey() {
		return get("EncKey");
	}

	public void setT0Contorl(java.lang.String T0Contorl) {
		set("T0_Contorl", T0Contorl);
	}

	public java.lang.String getT0Contorl() {
		return get("T0_Contorl");
	}

	public void setAddTime(java.util.Date AddTime) {
		set("AddTime", AddTime);
	}

	public java.util.Date getAddTime() {
		return get("AddTime");
	}

	public void setUpdateTime(java.util.Date UpdateTime) {
		set("UpdateTime", UpdateTime);
	}

	public java.util.Date getUpdateTime() {
		return get("UpdateTime");
	}

	public void setSyncSN(java.lang.String SyncSN) {
		set("SyncSN", SyncSN);
	}

	public java.lang.String getSyncSN() {
		return get("SyncSN");
	}

	public void setTransModel(java.lang.String TransModel) {
		set("TransModel", TransModel);
	}

	public java.lang.String getTransModel() {
		return get("TransModel");
	}

	public void setMerchPool(java.lang.String MerchPool) {
		set("MerchPool", MerchPool);
	}

	public java.lang.String getMerchPool() {
		return get("MerchPool");
	}

	public void setWxAssPayCh(java.lang.String wxAssPayCh) {
		set("wxAssPayCh", wxAssPayCh);
	}

	public java.lang.String getWxAssPayCh() {
		return get("wxAssPayCh");
	}

	public void setAliAssPayCh(java.lang.String aliAssPayCh) {
		set("aliAssPayCh", aliAssPayCh);
	}

	public java.lang.String getAliAssPayCh() {
		return get("aliAssPayCh");
	}

	public void setQQAssPayCh(java.lang.String QQAssPayCh) {
		set("QQAssPayCh", QQAssPayCh);
	}

	public java.lang.String getQQAssPayCh() {
		return get("QQAssPayCh");
	}

	public void setJDAssPayCh(java.lang.String JDAssPayCh) {
		set("JDAssPayCh", JDAssPayCh);
	}

	public java.lang.String getJDAssPayCh() {
		return get("JDAssPayCh");
	}

	public void setUniAssPayCh(java.lang.String uniAssPayCh) {
		set("uniAssPayCh", uniAssPayCh);
	}

	public java.lang.String getUniAssPayCh() {
		return get("uniAssPayCh");
	}

	public void setNoCardZMPayCh(java.lang.String noCardZMPayCh) {
		set("noCardZMPayCh", noCardZMPayCh);
	}

	public java.lang.String getNoCardZMPayCh() {
		return get("noCardZMPayCh");
	}

	public void setNoCardAssPayCh(java.lang.String noCardAssPayCh) {
		set("noCardAssPayCh", noCardAssPayCh);
	}

	public java.lang.String getNoCardAssPayCh() {
		return get("noCardAssPayCh");
	}

	public void setGoodsNameType(java.lang.String GoodsNameType) {
		set("GoodsNameType", GoodsNameType);
	}

	public java.lang.String getGoodsNameType() {
		return get("GoodsNameType");
	}

	public void setAppId(java.lang.String AppId) {
		set("AppId", AppId);
	}

	public java.lang.String getAppId() {
		return get("AppId");
	}

	public void setPid(java.lang.String Pid) {
		set("Pid", Pid);
	}

	public java.lang.String getPid() {
		return get("Pid");
	}

	public void setReportURL(java.lang.String ReportURL) {
		set("ReportURL", ReportURL);
	}

	public java.lang.String getReportURL() {
		return get("ReportURL");
	}

	public void setSettleKind(java.lang.String SettleKind) {
		set("SettleKind", SettleKind);
	}

	public java.lang.String getSettleKind() {
		return get("SettleKind");
	}

	public void setUseStatus(java.lang.String useStatus) {
		set("useStatus", useStatus);
	}

	public java.lang.String getUseStatus() {
		return get("useStatus");
	}

	public void setIsExport(java.lang.String isExport) {
		set("isExport", isExport);
	}

	public java.lang.String getIsExport() {
		return get("isExport");
	}

	public void setSerialNo(java.lang.String serialNo) {
		set("serialNo", serialNo);
	}

	public java.lang.String getSerialNo() {
		return get("serialNo");
	}

	public void setRemark(java.lang.String remark) {
		set("remark", remark);
	}

	public java.lang.String getRemark() {
		return get("remark");
	}

	public void setReviewedStatus(java.lang.String reviewedStatus) {
		set("reviewedStatus", reviewedStatus);
	}

	public java.lang.String getReviewedStatus() {
		return get("reviewedStatus");
	}

	public void setOpenId(java.lang.String openId) {
		set("openId", openId);
	}

	public java.lang.String getOpenId() {
		return get("openId");
	}

	public void setNewYMF(java.lang.String newYMF) {
		set("newYMF", newYMF);
	}

	public java.lang.String getNewYMF() {
		return get("newYMF");
	}

	public void setPayOtherCh(java.lang.String PayOtherCh) {
		set("PayOtherCh", PayOtherCh);
	}

	public java.lang.String getPayOtherCh() {
		return get("PayOtherCh");
	}

	public void setPayforType(java.lang.String PayforType) {
		set("PayforType", PayforType);
	}

	public java.lang.String getPayforType() {
		return get("PayforType");
	}

	public void setJDFee(java.lang.String JDFee) {
		set("JDFee", JDFee);
	}

	public java.lang.String getJDFee() {
		return get("JDFee");
	}

	public void setYLQrCodeFee(java.lang.String YLQrCodeFee) {
		set("YLQrCodeFee", YLQrCodeFee);
	}

	public java.lang.String getYLQrCodeFee() {
		return get("YLQrCodeFee");
	}

	public void setNoCardChWebFee(java.lang.String NoCardChWebFee) {
		set("NoCardChWebFee", NoCardChWebFee);
	}

	public java.lang.String getNoCardChWebFee() {
		return get("NoCardChWebFee");
	}

	public void setQQFee(java.lang.String QQFee) {
		set("QQFee", QQFee);
	}

	public java.lang.String getQQFee() {
		return get("QQFee");
	}

	public void setWXFee(java.lang.String WXFee) {
		set("WXFee", WXFee);
	}

	public java.lang.String getWXFee() {
		return get("WXFee");
	}

	public void setWXH5Fee(java.lang.String WXH5Fee) {
		set("WXH5Fee", WXH5Fee);
	}

	public java.lang.String getWXH5Fee() {
		return get("WXH5Fee");
	}

	public void setWXAPPFee(java.lang.String WXAPPFee) {
		set("WXAPPFee", WXAPPFee);
	}

	public java.lang.String getWXAPPFee() {
		return get("WXAPPFee");
	}

	public void setAliFee(java.lang.String AliFee) {
		set("AliFee", AliFee);
	}

	public java.lang.String getAliFee() {
		return get("AliFee");
	}

	public void setNoCardFee(java.lang.String NoCardFee) {
		set("NoCardFee", NoCardFee);
	}

	public java.lang.String getNoCardFee() {
		return get("NoCardFee");
	}

	public void setBalancePayFee(java.lang.String BalancePayFee) {
		set("BalancePayFee", BalancePayFee);
	}

	public java.lang.String getBalancePayFee() {
		return get("BalancePayFee");
	}

	public void setDZPayFee(java.lang.String DZPayFee) {
		set("DZPayFee", DZPayFee);
	}

	public java.lang.String getDZPayFee() {
		return get("DZPayFee");
	}

	public void setQPayFee(java.lang.String QPayFee) {
		set("QPayFee", QPayFee);
	}

	public java.lang.String getQPayFee() {
		return get("QPayFee");
	}

	public void setIsT1YECZ(java.lang.String IsT1YECZ) {
		set("IsT1YECZ", IsT1YECZ);
	}

	public java.lang.String getIsT1YECZ() {
		return get("IsT1YECZ");
	}

	public void setDisableCredit(java.lang.String DisableCredit) {
		set("DisableCredit", DisableCredit);
	}

	public java.lang.String getDisableCredit() {
		return get("DisableCredit");
	}

	public void setAliH5AssPayCh(java.lang.String aliH5AssPayCh) {
		set("aliH5AssPayCh", aliH5AssPayCh);
	}

	public java.lang.String getAliH5AssPayCh() {
		return get("aliH5AssPayCh");
	}

	public void setAliH5Fee(java.lang.String aliH5Fee) {
		set("aliH5Fee", aliH5Fee);
	}

	public java.lang.String getAliH5Fee() {
		return get("aliH5Fee");
	}
	
	public void setQQH5AssPayCh(java.lang.String QQH5AssPayCh) {
		set("QQH5AssPayCh", QQH5AssPayCh);
	}
	
	public java.lang.String getQQH5AssPayCh() {
		return get("QQH5AssPayCh");
	}
	
	public void setQQH5Fee(java.lang.String QQH5Fee) {
		set("QQH5Fee", QQH5Fee);
	}
	
	public java.lang.String getQQH5Fee() {
		return get("QQH5Fee");
	}

}