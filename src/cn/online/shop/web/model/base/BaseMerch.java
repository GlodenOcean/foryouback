package cn.online.shop.web.model.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseMerch<M extends BaseMerch<M>> extends Model<M> implements IBean {

	public void setId(Integer id) {
		set("id", id);
	}

	public Integer getId() {
		return get("id");
	}

	public void setMerchNo(String merchNo) {
		set("merch_no", merchNo);
	}

	public String getMerchNo() {
		return get("merch_no");
	}

	public void setMerchName(String merchName) {
		set("merch_name", merchName);
	}

	public String getMerchName() {
		return get("merch_name");
	}

	public void setMerchPhone(Integer merchPhone) {
		set("merch_phone", merchPhone);
	}

	public Integer getMerchPhone() {
		return get("merch_phone");
	}

	public void setEmail(String email) {
		set("email", email);
	}

	public String getEmail() {
		return get("email");
	}

	public void setShopAddress(String shopAddress) {
		set("shop_address", shopAddress);
	}

	public String getShopAddress() {
		return get("shop_address");
	}

	public void setProvince(String province) {
		set("province", province);
	}

	public String getProvince() {
		return get("province");
	}

	public void setCity(String city) {
		set("city", city);
	}

	public String getCity() {
		return get("city");
	}

	public void setArea(String area) {
		set("area", area);
	}

	public String getArea() {
		return get("area");
	}

	public void setMerchAddress(String merchAddress) {
		set("merch_address", merchAddress);
	}

	public String getMerchAddress() {
		return get("merch_address");
	}

	public void setRealname(String realname) {
		set("realname", realname);
	}

	public String getRealname() {
		return get("realname");
	}

	public void setCardNo(Integer cardNo) {
		set("card_no", cardNo);
	}

	public Integer getCardNo() {
		return get("card_no");
	}

	public void setMerchTypeNo(Integer merchTypeNo) {
		set("merch_type_no", merchTypeNo);
	}

	public Integer getMerchTypeNo() {
		return get("merch_type_no");
	}

	public void setCreateTime(java.util.Date createTime) {
		set("create_time", createTime);
	}

	public java.util.Date getCreateTime() {
		return get("create_time");
	}

	public void setUpdateTime(java.util.Date updateTime) {
		set("update_time", updateTime);
	}

	public java.util.Date getUpdateTime() {
		return get("update_time");
	}

	public void setStatus(Integer status) {
		set("status", status);
	}

	public Integer getStatus() {
		return get("status");
	}

	public void setWeixin(String weixin) {
		set("weixin", weixin);
	}

	public String getWeixin() {
		return get("weixin");
	}

}
