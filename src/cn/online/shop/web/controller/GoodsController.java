package cn.online.shop.web.controller;

import cn.es.common.ESController;


/**
 * 用户控制器
 * @author 钟展峰  2015年8月4日
 */
public class GoodsController extends ESController{

	/**
	 * 分页查询
	 */
	public void searchMerchGoodsList(){
//		List<Goods> merchGoodsList = Goods.dao.searchMerchGoodsList(super.getSearchCondition());
//		renderSuccessJson(merchGoodsList);
	}

//	/**
//	 * 分页查询
//	 */
//	public void search(){
//		Page<Goods> page = Goods.dao.search(super.getSearchCondition());
//		setPageResultToRequest("goodsList", page);
//		render("goods/goodsList.jsp");
//	}

//	/**
//	 * 跳转到表单页面
//	 */
//	public void form(){
//		String id = getPara("id");
//		if(ESBoolean.isNotEmpty(id)){
//			Goods goods = Goods.dao.findById(id);
//			setAttr("goods", goods);
//		}
//		List<Role> roleList = Role.dao.searchAll();
//		setAttr("roleList", roleList);
//		render("goods/goodsForm.jsp");
//	}
//
//	/**
//	 * 跳转到修改密码页面,修改自己的密码
//	 */
//	public void changePasswordPage(){
//		render("goods/changePassword.jsp");
//	}
//
//	/**
//	 * 修改密码
//	 */
//	public void changePassword(){
//		Goods goods = Goods.dao.findById(getPara("id"));
//		String oldPassword = ESMD5.codeFor(getPara("oldPassword"));
//		if(goods.getPassword().equals(oldPassword)){
//			String newPassword = ESMD5.codeFor(getPara("newPassword"));
//			goods.setPassword(newPassword);
//			goods.update();
//			renderSuccessJson();
//		}else{
//			renderFailJson("原始密码不正确.");
//		}
//	}
//
//	/**
//	 * 更新,包含新增
//	 */
//	public void update(){
//		Goods newGoods = getModel(Goods.class,"goods");
//		newGoods.setUpdateTime(ESDate.getDateTime());
//
//		if(ESBoolean.isNotNull(newGoods.getId())){
//			newGoods.update();
//			renderSuccessJsonAndClose();
//		}else{
//			Goods existsGoods = Goods.dao.searchByloginId(newGoods.getLoginId());
//			if(existsGoods != null){
//				renderFailJson("用户名已经被注册.");
//			}else{
//				String newPassword = ESMD5.codeFor(newGoods.getPassword());
//				newGoods.setPassword(newPassword);
//				newGoods.setId(ESIDGenerate.getUUID());
//				newGoods.save();
//				renderSuccessJsonAndClose();
//			}
//		}
//
//	}
//
//	public void openResetPassword(){
//		setAttr("goodsId", getPara("goodsId"));
//		render("goods/resetPassword.jsp");
//	}
//
//	/**
//	 * 重置密码
//	 */
//	public void resetPassword(){
//		Goods goods = Goods.dao.findById(getPara("id"));
//		String newPassword = ESMD5.codeFor(getPara("newPassword"));
//		goods.setPassword(newPassword);
//		goods.setUpdateTime(ESDate.getDateTime());
//		goods.update();
//		renderSuccessJson();
//	}
//
//	/**
//	 * 修改状态
//	 */
//	public void changeStatus(){
//		Goods goods = Goods.dao.findById(getPara("id"));
//		if(goods.getStatus().equals("0")){
//			goods.setStatus("1");
//		}else{
//			goods.setStatus("0");
//		}
//		goods.setUpdateTime(ESDate.getDateTime());
//		goods.update();
//		renderSuccessJson();
//	}
//
//	/**
//	 * 删除
//	 */
//	public void delete(){
//		Object[] ids = getParaValues("ids");
//		Goods.dao.batchDelete(ids);
//		renderSuccessJson();
//	}
	
}
