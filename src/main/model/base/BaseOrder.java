package cn.hicard.nocard.web.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseOrder<M extends BaseOrder<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
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

	public void setStatus(java.lang.Integer status) {
		set("status", status);
	}

	public java.lang.Integer getStatus() {
		return get("status");
	}

	public void setRemark(java.lang.String remark) {
		set("remark", remark);
	}

	public java.lang.String getRemark() {
		return get("remark");
	}

	public void setOrderId(java.lang.String orderId) {
		set("order_id", orderId);
	}

	public java.lang.String getOrderId() {
		return get("order_id");
	}

	public void setMerchNo(java.lang.String merchNo) {
		set("merch_no", merchNo);
	}

	public java.lang.String getMerchNo() {
		return get("merch_no");
	}

	public void setMerchName(java.lang.String merchName) {
		set("merch_name", merchName);
	}

	public java.lang.String getMerchName() {
		return get("merch_name");
	}

	public void setMerchPhone(java.lang.Integer merchPhone) {
		set("merch_phone", merchPhone);
	}

	public java.lang.Integer getMerchPhone() {
		return get("merch_phone");
	}

	public void setMemberName(java.lang.String memberName) {
		set("member_name", memberName);
	}

	public java.lang.String getMemberName() {
		return get("member_name");
	}

	public void setMemberPhone(java.lang.Integer memberPhone) {
		set("member_phone", memberPhone);
	}

	public java.lang.Integer getMemberPhone() {
		return get("member_phone");
	}

	public void setMemberAddress(java.lang.String memberAddress) {
		set("member_address", memberAddress);
	}

	public java.lang.String getMemberAddress() {
		return get("member_address");
	}

	public void setGoodsNos(java.lang.String goodsNos) {
		set("goods_nos", goodsNos);
	}

	public java.lang.String getGoodsNos() {
		return get("goods_nos");
	}

	public void setPrice(java.lang.Double price) {
		set("price", price);
	}

	public java.lang.Double getPrice() {
		return get("price");
	}

}